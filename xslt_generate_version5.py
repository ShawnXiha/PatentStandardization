import csv
import jinja2

xslt_template = """
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">

    <xsl:template match="/">
        <pat:PatentPublication>
            <xsl:apply-templates select="patent-document"/>
        </pat:PatentPublication>
    </xsl:template>

    {% for from_el, to_el in element_mapping.items() %}
    <xsl:template match="{{from_el}}">
        <xsl:element name="{{to_el}}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    {% endfor %}

    {% for from_el, to_el, from_val, to_val in value_mapping %}
    <xsl:template match="{{from_el}}[text() = '{{from_val}}']">
        <xsl:element name="{{to_el}}">
            <xsl:value-of select="'{{to_val}}'"/>
        </xsl:element>
    </xsl:template>
    {% endfor %}

</xsl:stylesheet>
"""

def read_csv_file(filename):
    data = []
    with open(filename, 'r') as f:
        reader = csv.reader(f)
        header = next(reader)  # skip header row
        for row in reader:
            data.append(row)
    return header, data

def create_mapping_dict(header, data):
    mapping_dict = {}
    for row in data:
        from_elem, to_elem = row
        if from_elem not in mapping_dict:
            mapping_dict[from_elem] = {}
        mapping_dict[from_elem][to_elem] = True
    return mapping_dict


def csv_to_mapping(element_mapping_tsv, value_mapping_tsv):

# read and create mapping dictionaries for xpath and element values
    xpath_header, xpath_data = read_csv_file(element_mapping_tsv)
    xpath_mapping = create_mapping_dict(xpath_header, xpath_data)

    elem_header, elem_data = read_csv_file(value_mapping_tsv)
    elem_mapping = []
    for row in elem_data:
        from_elem, to_elem, from_val, to_val = row
        elem_mapping.append((from_elem, to_elem, from_val, to_val))
    return xpath_mapping, elem_mapping



def generate_xslt(xpath_mapping_file, value_mapping_file, output_file):
    xpath_mapping, elem_mapping = csv_to_mapping(xpath_mapping_file, value_mapping_file)

    template = jinja2.Template(xslt_template)
    xslt = template.render(element_mapping=xpath_mapping, value_mapping=elem_mapping)
    with open(output_file, 'w') as f:
        print(xslt, file=f)
if __name__ == '__main__':
    e_file = 'data/mapping_table/element_mapping.csv'
    v_file = 'data/mapping_table/element_value_mapping.csv'
    x_file = "data/xslt_generated/st36_2_st96.xsl"
    generate_xslt(e_file, v_file, x_file)

    e_file_cn = 'data/mapping_table/element_mapping_cn_old.csv'
    v_file_cn = 'data/mapping_table/element_value_mapping_cn_old.csv'
    x_file_cn = "data/xslt_generated/st36_2_st96_cn_old.xsl"

    generate_xslt(e_file_cn, v_file_cn, x_file_cn)