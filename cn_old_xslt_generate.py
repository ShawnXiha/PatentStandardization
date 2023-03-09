from cn_old_csv_generate import cn_start_element_check
import json
# 根据比较元素名称映射， 把

replace_formats =["select=\"{xpath}\"" ,"/{xpath}\"" ,"select=\"*:{xpath}\"", "/*:{xpath}\"",
                  "/{xpath}/","/*:{xpath}/",]
def cn_old_xslt_generate(mapping_file, xslt_from, xslt_to):
    with open(xslt_from) as f_from, open(xslt_to, 'w') as f, open(mapping_file) as m_f:
        xslt_content = f_from.read()
        mapping:dict = json.load(m_f)
        print(mapping)
        for k, v in mapping.items():
            for replace_format in replace_formats:
                xslt_content = xslt_content.replace(replace_format.format(xpath=k), replace_format.format(xpath=v))
        f.write(xslt_content)

if __name__ == '__main__':
    org_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0.xslt"
    cn_old_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0_cn_old.xslt"
    mapping_json = "data/中文专利xml标准/cn_old_element_diff.json"
    cn_old_xslt_generate(mapping_json, org_xslt, cn_old_xslt)