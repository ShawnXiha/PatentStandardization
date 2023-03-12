from cn_old_csv_generate import cn_start_element_check

jp_name_mapping = {"patent-document": "jp-official-gazette"}

replace_formats =["select=\"{xpath}\"" ,"/{xpath}\"" ,"select=\"*:{xpath}\"", "/*:{xpath}\"",
                  "/{xpath}/","/*:{xpath}/",]

def jp_xslt_generate(mapping, xslt_from, xslt_to):
    with open(xslt_from) as f_from, open(xslt_to, 'w') as f:
        xslt_content = f_from.read()
        print(mapping)
        for k, v in mapping.items():
            for replace_format in replace_formats:
                xslt_content = xslt_content.replace(replace_format.format(xpath=k), replace_format.format(xpath=v))
        f.write(xslt_content)

if __name__ == '__main__':
    org_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0.xslt"
    jp_old_xslt = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0_jp_old.xslt"
    jp_xslt_generate(jp_name_mapping, org_xslt,  jp_old_xslt)
