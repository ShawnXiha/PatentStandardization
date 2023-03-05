import csv
import lxml.etree as ET

import csv
from lxml import etree

def generate_xslt(xml_mapping_file, value_mapping_file, xslt_file):
    # Define namespaces
    ns = {
        'xsl': 'http://www.w3.org/1999/XSL/Transform',
        'pat': 'http://www.wipo.int/standards/XMLSchema/ST96/Patent',
        'com': 'http://www.wipo.int/standards/XMLSchema/ST96/Common',
    }
    # Define XSLT root element and its attributes
    xslt_root = etree.Element(etree.QName(ns['xsl'], 'stylesheet'), version='1.0', nsmap=ns)
    # Define output element and its namespace
    output_elem = etree.Element(etree.QName(ns['xsl'], 'output'), method='xml', indent='yes', encoding='UTF-8')
    # Add output element to XSLT root
    xslt_root.append(output_elem)

    # Parse XML element and attribute mapping file
    with open(xml_mapping_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Add identity transform to XSLT for unmapped elements
            xsl_template = etree.Element(etree.QName(ns['xsl'], 'template'), match=row['xpath_from'])
            xsl_copy = etree.Element(etree.QName(ns['xsl'], 'copy'))
            xsl_template.append(xsl_copy)
            output_elem.append(xsl_template)
            # Add element/attribute mapping to XSLT
            xsl_copy.set('select', row['xpath_to'])

    # Parse element value mapping file
    with open(value_mapping_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Add element value mapping to XSLT
            xsl_template = etree.Element(etree.QName(ns['xsl'], 'template'), match=row['from_element'])
            xsl_if = etree.Element(etree.QName(ns['xsl'], 'if'), test=f"{row['from_element']} = '{row['from_value']}'")
            xsl_set = etree.Element(etree.QName(ns['xsl'], 'attribute') if row['to_element'].startswith('@') else
                                     etree.QName(ns['xsl'], 'element'))
            xsl_set.set('name', row['to_element'].lstrip('@'))
            xsl_set.set('namespace', ns['pat'])
            xsl_set.set('select', row['to_value'])
            xsl_if.append(xsl_set)
            xsl_template.append(xsl_if)
            output_elem.append(xsl_template)

    # Write XSLT to file
    etree.ElementTree(xslt_root).write(xslt_file, pretty_print=True, xml_declaration=True, encoding='UTF-8')


if __name__ == '__main__':
    e_file = 'data/mapping_table/element_mapping.csv'
    v_file = 'data/mapping_table/element_value_mapping.csv'
    x_file = "data/xslt_generated/st36_2_st96.xsl"
    generate_xslt(e_file, v_file, x_file)

    e_file_cn = 'data/mapping_table/element_mapping_cn_old.csv'
    v_file_cn = 'data/mapping_table/element_value_mapping_cn_old.csv'
    x_file_cn = "data/xslt_generated/st36_2_st96_cn_old.xsl"

    generate_xslt(e_file_cn, v_file_cn, x_file_cn)