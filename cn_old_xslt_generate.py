from cn_old_csv_generate import cn_start_element_check
import json
import os
from glob import glob
from tqdm import tqdm
from replace_xslt_with_dict import replace_xslt

# 根据比较元素名称映射， 把

replace_formats = ["select=\"{xpath}\"", "/{xpath}\"", "select=\"*:{xpath}\"", "/*:{xpath}\"",
                   "/{xpath}/", "/*:{xpath}/", ]


def cn_old_xslt_generate(mapping_file, xslt_from, xslt_to):
    with open(xslt_from) as f_from, open(xslt_to, 'w') as f, open(mapping_file) as m_f:
        xslt_content = f_from.read()
        mapping: dict = json.load(m_f)
        print(mapping)
        xslt_content = replace_xslt(xslt_content, mapping)
        f.write(xslt_content)


def us_xslt_generate(from_path, to_path):
    os.makedirs(to_path, exist_ok=True)
    json_files = glob(os.path.join(from_path, "*.json"))
    for json_file in tqdm(json_files):
        filename = os.path.basename(json_file)
        xslt_file = os.path.join(to_path, filename.replace(".json", ".xslt"))
        cn_old_xslt_generate(json_file, org_xslt, xslt_file)



if __name__ == '__main__':
    org_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0.xslt"
    cn_old_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0_cn_old.xslt"
    mapping_json = "data/中文专利xml标准/cn_old_element_diff.json"
    cn_old_xslt_generate(mapping_json, org_xslt, cn_old_xslt)
    # cn_old_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0_us_v45.xslt"
    # mapping_json = "data/英文专利xml标准/us-patent-application-v45-2021-08-30.json"
    # cn_old_xslt_generate(mapping_json, org_xslt, cn_old_xslt)
    # us_json_path = "data/xslt_generated/us_patent_name_mapping"
    # us_xslt_path = "data/xslt_generated/us_patent_xslt"
    # us_xslt_generate(us_json_path, us_xslt_path)