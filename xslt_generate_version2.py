import csv


def generate_xslt(xpath_map_file, value_map_file, xslt_output_path):
    # Define namespaces
    namespaces = {
        "xmlns": "http://www.wipo.int/standards/XMLSchema/ST96/Patent",
        "xmlns:xsl": "http://www.w3.org/1999/XSL/Transform",
        "xmlns:pat": "http://www.wipo.int/standards/XMLSchema/ST96/Patent",
        "xmlns:com": "http://www.wipo.int/standards/XMLSchema/ST96/Common"
    }
    xmlns = "http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    xsl = "http://www.w3.org/1999/XSL/Transform"
    pat = "http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    com = "http://www.wipo.int/standards/XMLSchema/ST96/Common"
    # Create XSLT template
    xslt_template = (
        f'<?xml version="1.0" encoding="UTF-8"?>\n'
        f'<xsl:stylesheet version="1.0" xmlns:xsl="{xsl}" xmlns="{xmlns}" xmlns:pat="{pat}" xmlns:com="{com}">\n'
        f'  <xsl:output method="xml" indent="yes"/>\n\n'
        f'  <xsl:template match="/patent-document">\n'
        f'    <pat:PatentPublication>\n'
    )

    # Read xpath map CSV file and add template match patterns
    with open(xpath_map_file, newline='') as f:
        xpath_reader = csv.reader(f)
        next(xpath_reader)  # Skip header row
        for row in xpath_reader:
            from_path = row[0]
            to_path = row[1]
            xslt_template += f'    <xsl:apply-templates select="{from_path}"/>\n'

    # Add closing tags for patent publication element
    xslt_template += (
        '    </pat:BibliographicData>\n'
        '    <pat:Description/>\n'
        '    <pat:Claims/>\n'
        '  </pat:PatentPublication>\n'
        '  </xsl:template>\n\n'
    )

    # Add template rules for each element/attribute mapping
    with open(xpath_map_file, newline='') as f:
        xpath_reader = csv.reader(f)
        next(xpath_reader)  # Skip header row
        for row in xpath_reader:
            from_path = row[0]
            to_path = row[1]
            xslt_template += (
                f'  <xsl:template match="{from_path}">\n'
                f'    <xsl:element name="{to_path}" namespace="{namespaces["xmlns"]}">\n'
                f'      <xsl:apply-templates select="@* | node()"/>\n'
                f'    </xsl:element>\n'
                f'  </xsl:template>\n\n'
            )
    xslt_template += " </xsl:stylesheet>"
    with open(xslt_output_path, 'w') as out_f:
        out_f.write(xslt_template)
if __name__ == '__main__':

    e_file = 'data/mapping_table/element_mapping.csv'
    v_file = 'data/mapping_table/element_value_mapping.csv'
    x_file = "data/xslt_generated/st36_2_st96.xsl"
    generate_xslt(e_file, v_file, x_file)

    e_file_cn = 'data/mapping_table/element_mapping_cn_old.csv'
    v_file_cn = 'data/mapping_table/element_value_mapping_cn_old.csv'
    x_file_cn = "data/xslt_generated/st36_2_st96_cn_old.xsl"

    generate_xslt(e_file_cn, v_file_cn, x_file_cn)