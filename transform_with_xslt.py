from saxonche import PySaxonProcessor


def transform_to_string(xsl, source):
    with PySaxonProcessor(license=False) as proc:
        xsltproc = proc.new_xslt30_processor()
        document = proc.parse_xml(xml_file_name=source)
        print(proc.error_message)
        print(document)
        exeuctable = xsltproc.compile_stylesheet(stylesheet_file=xsl)
        print(exeuctable)
        output2 = exeuctable.transform_to_string(xdm_node=document)
        print(output2)

if __name__ == '__main__':
    a_xsl = "data/app_body_st36tost96.xsl"
    a_xml = "data\st36_wipo_examples\st36bexample\DOC00001.xml"
    transform_to_string(a_xsl, a_xml)