import re
import json
element_pattern = r'<!ELEMENT\s+([\w-]+)'
def cn_start_element_check(dtd_file):
    cn_starts = dict()
    with open(dtd_file, encoding="utf-8") as f:
        content = f.read()
        elements = re.findall(element_pattern, content)
        for element in elements:
            if element.startswith("cn-"):
                cn_starts[element.replace('cn-','')] = element
    return cn_starts

def replace_csv(s_csv, t_csv, replace_dict):
    with open(s_csv) as sf, open(t_csv, 'w') as tf:
        s_content = sf.read()
        for k, v in replace_dict.items():
            s_content = s_content.replace(k, v)
        tf.write(s_content)


if __name__ == '__main__':
    dtd_file = 'data/中文专利xml标准/cn_old.dtd'
    cn_dict = cn_start_element_check(dtd_file)
    with open("data/中文专利xml标准/cn_old_element_diff.json", "w") as f:
        json.dump(cn_dict, f)
    # e_file = 'data/mapping_table/element_mapping.csv'
    # v_file = 'data/mapping_table/element_value_mapping.csv'
    # e_file_cn = 'data/mapping_table/element_mapping_cn_old.csv'
    # v_file_cn = 'data/mapping_table/element_value_mapping_cn_old.csv'
    # replace_csv(e_file, e_file_cn, cn_dict)
    # replace_csv(v_file, v_file_cn, cn_dict)