import re
import json
from glob  import glob
import os
element_pattern = r'<!ELEMENT\s+([\w-]+)'
def cn_start_element_check(dtd_file):
    cn_starts = dict()

    with open(dtd_file, encoding="utf-8") as f:
        content = f.read()
        elements = re.findall(element_pattern, content)
        for element in elements:
            if element.startswith("us-"):
                cn_starts[element.replace('us-','')] = element

    cn_starts["patent-document"] = 'us-patent-application'
    return cn_starts

def dtd2name_dict(dtd_file, json_file):
    cn_dict = cn_start_element_check(dtd_file)
    with open(json_file, "w") as f:
        json.dump(cn_dict, f)

def extract_us_dtd_file_list(from_dir, to_dir):
    if not os.path.exists(to_dir):
        os.makedirs(to_dir)
    files = glob(os.path.join(from_dir, "*.dtd"))
    for file in files:
        filename = os.path.basename(file)
        to_file = os.path.join(to_dir, filename.replace(".dtd", '.json'))
        dtd2name_dict(file, to_file)

if __name__ == '__main__':
    # en_dtd_example = "data/英文专利xml标准/us-patent-application-v45-2021-08-30.dtd"
    # en_json_example = "data/英文专利xml标准/us-patent-application-v45-2021-08-30.json"
    # dtd2name_dict(en_dtd_example, en_json_example)

    extract_us_dtd_file_list("data/英文专利xml标准/", "data/xslt_generated/us_patent_name_mapping")