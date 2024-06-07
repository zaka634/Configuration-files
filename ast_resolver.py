import argparse
import ast
import json

from pathlib import Path
from typing import Any, Callable, Dict, List

import _ast


class AstTypeResolver:
    methods: Dict[Any, Callable] = {}

    class Methods:
        @staticmethod
        def register(target_class: Any, methods: dict) -> Callable:
            def decorator(func: Callable) -> Callable:
                methods[target_class] = func
                return func

            return decorator

    def __getitem__(self, val):
        func = self.methods.get(val.__class__)
        if func:
            return func(self, val)
        raise ValueError(f"Unknown type: {val.__class__}")

    @Methods.register(_ast.Expr, methods)
    def _ast_expr(self, val: _ast.Expr) -> str:
        return self[val.value]

    @Methods.register(_ast.Str, methods)
    def _ast_str(self, val: _ast.Str) -> str:
        return val.s

    @Methods.register(str, methods)
    def _ast_str(self, val: str) -> str:
        return val

    @Methods.register(_ast.Num, methods)
    def _ast_num(self, val: _ast.Num) -> int:
        return val.n

    @Methods.register(_ast.NameConstant, methods)
    def _ast_name_constant(self, val: _ast.NameConstant) -> str:
        return val.value

    @Methods.register(_ast.Name, methods)
    def _ast_name(self, val: _ast.Name) -> str:
        return val.id

    @Methods.register(_ast.List, methods)
    def _ast_list(self, val: _ast.List) -> List[Any]:
        return [self[item] for item in val.elts]

    @Methods.register(_ast.Tuple, methods)
    def _ast_tuple(self, val: _ast.Tuple) -> List[Any]:
        return self._ast_list(val)

    @Methods.register(_ast.Call, methods)
    def _ast_call(self, val: _ast.Call) -> List[Any]:
        return val.func.id, [self[i] for i in val.args], {self[k.arg]: self[k.value] for k in val.keywords}

    @Methods.register(_ast.Dict, methods)
    def _ast_dict(self, val: _ast.Dict) -> List[Any]:
        return dict(zip([self[k] for k in val.keys], [self[v] for v in val.values]))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("root", type=Path)
    args = parser.parse_args()

    resolver = AstTypeResolver()

    for filepath in args.root.rglob("BUILD"):
        print(filepath)
        tree = ast.parse(filepath.read_bytes())
        for item in tree.body:
            item_type, item_args, item_dict = resolver[item]
            print(json.dumps((item_type, item_args, item_dict), indent=4))
