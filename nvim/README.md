# Neovim Setup Guide

## 1. Install Neovim Configuration

Clone or place your Neovim configuration into:

```bash
~/.config/nvim
```

This is the standard location where Neovim looks for its configuration files.

---

## 2. Install Packer (Plugin Manager)

First, install [packer.nvim](https://github.com/wbthomason/packer.nvim) by running:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

This will clone Packer into the correct Neovim plugin directory.

---

## 3. Install Plugins (e.g., Telescope)

1. Open your Packer configuration file:

    ```bash
    vi ~/.config/nvim/lua/zaka634/packer.lua
    ```

2. In Neovim, **source** the file by typing:

    ```
    :so
    ```

3. Then run:

    ```
    :PackerSync
    ```

This will install all the plugins defined in your `packer.lua`, including **Telescope**.

---

## Notes
- Ensure you have **Neovim 0.5.0+** installed.
- Telescope also requires [plenary.nvim](https://github.com/nvim-lua/plenary.nvim), which should be handled automatically by Packer if declared correctly.
