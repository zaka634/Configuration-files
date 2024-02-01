import csv
import datetime
import json
import re

from bs4 import BeautifulSoup
import time
import requests


def is_crp(case_number):
    res = requests.get(f"https://www.casestatusext.com/cases/{case_number}")
    soup = BeautifulSoup(res.content, "html.parser")

    crp_section = soup.select("ul.ant-timeline.ant-timeline-label.css-1ij74fp")[0]
    for content in crp_section.contents:
        if "Case Remains Pending" in content.text:
            return True

    return False


def get_case_numbers(inquiry_date):
    res = requests.get("https://www.casestatusext.com/approvals/I-485/MSC-LB")
    soup = BeautifulSoup(res.content, "html.parser")
    section = soup.findAll("script")[-1]
    x = section.string.strip()
    x = x[26:-5]
    x = re.sub(r"[\n\t\s]*", "", x)  # Removing the newlines, spaces and tabs from string
    x = re.sub(r"\\", "", x)  # Removing the newlines, spaces and tabs from string
    x = json.loads(x)
    case_by_day_list = x[0][3]['data']['all']

    for case_by_day in case_by_day_list:
        if case_by_day['d'] == inquiry_date:
            return sorted([x['cid'] for x in case_by_day["cases"]])

            print('abc')

    return []


def check_crp_status(case_numbers, processed_file_name, processed_cases=None):
    if processed_cases is None:
        processed_cases = set()

    start_time = time.time()
    print(f"start time: {start_time}")
    crp_list = []
    error_list = []

    with open(processed_file_name, 'a') as processed_file:
        for cc_number in case_numbers:
            if cc_number in processed_cases:
                continue

            time.sleep(1)
            processed_file.write(f'{cc_number}\n')
            print(f"current processing :{cc_number}")
            try:
                if is_crp(cc_number):
                    print(f"crp : {cc_number}")
                    crp_list.append([cc_number, yesterday])
            except Exception as e:
                print(str(e))
                print(f"skip case_number : {cc_number}")
                error_list.append(cc_number)
                continue

    crp_list.sort()

    with open('crp.csv', 'a', newline='') as file:
        # Step 4: Using csv.writer to write the list to the CSV file
        writer = csv.writer(file)
        writer.writerows(crp_list)  # Use writerow for single list

    print(f"{len(crp_list)} case approved: {crp_list}")
    print(f"{len(error_list)} case skipped: {error_list}")
    print(f"end time: {time.time() - start_time}")


hard_code_case_numbers = [

]

if hard_code_case_numbers:
    file_name = 'temp.txt'
    check_crp_status(hard_code_case_numbers, file_name, [])
else:
    yesterday = (datetime.date.today() - datetime.timedelta(days=1)).strftime('%Y-%m-%d')
    # yesterday = '2024-01-23'
    processed_case = set()
    try:
        with open(yesterday, 'r') as f:
            processed_case = set([ln for ln in f.read().splitlines()])
    except FileNotFoundError:
        print(f'{yesterday} file does not exist')

    check_crp_status(get_case_numbers(yesterday), yesterday, processed_case)
