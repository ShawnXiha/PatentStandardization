from saxonche import *

def run_xslt(xsl, s, o):
    try:
        with PySaxonProcessor(license=False) as proc:
            xsltproc = proc.new_xslt30_processor()
            document = proc.parse_xml(xml_file_name=s)
            executable = xsltproc.compile_stylesheet(stylesheet_file=xsl)
            print(document)

            output = executable.transform_to_string(xdm_node=document)
            with open(o, 'w', encoding='utf-8') as f:
                print(output, file=f)
                print(output)
    except Exception as e:
        print(e)

if __name__ == '__main__':
    # cn_old_xsl = "data/xslt_old/zh_old_2st96.xsl"
    cn_old_xsl = "data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0_cn_old.xslt"
    cn_old_example1 = "data/examples/cn_old1.xml"
    cn_old_example_result = "data/examples_xslt_result/cn_old1.xml"
    run_xslt(cn_old_xsl, cn_old_example1, cn_old_example_result)

    # cn_old_xsl = "data/xslt_old/st36tost96_us.xsl"
    # cn_old_example1 = "data/examples/us_example1.xml"
    # cn_old_example_result = "data/examples_xslt_result/us_example1.xml"
    # run_xslt(cn_old_xsl, cn_old_example1, cn_old_example_result)
    # cn_old_xsl = "data/xslt_generated/us_patent_xslt/us-patent-application-v45-2021-08-30.xslt"
    # cn_old_example1 = "data/examples/us_example4.xml"
    # cn_old_example_result = "data/examples_xslt_result/us_example4.xml"
    # run_xslt(cn_old_xsl, cn_old_example1, cn_old_example_result)