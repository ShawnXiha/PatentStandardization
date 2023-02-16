import csv

from lxml import etree

def parse_value_mapping(tsv_path):
    with open(tsv_path, newline='', encoding='utf-8') as csvfile:
        value_mapping_reader = csv.reader(csvfile, delimiter='\t')
        value_mapping = {}
        for row in value_mapping_reader:
            st36_value, st96_value = row[2:]
            value_mapping[st36_value] = st96_value
    return value_mapping

def parse_tsv_mapping(tsv_path):
    element_mapping = {}
    attribute_mapping = {}
    with open(tsv_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile, delimiter='\t')
        for row in reader:
            st96_xpath, st36_xpath = row
            st96_path_parts = st96_xpath.split('/')
            st36_path_parts = st36_xpath.split('/')
            for i in range(len(st96_path_parts)):
                if st96_path_parts[i].startswith('@'):
                    st96_path_parts[i] = '@' + st96_path_parts[i][1:]  # Prefix attribute path with '@'
                    attribute_mapping['/'.join(st96_path_parts)] = '/'.join(st36_path_parts)
                    break
                else:
                    element_mapping['/'.join(st96_path_parts)] = '/'.join(st36_path_parts)
    return element_mapping, attribute_mapping


def generate_xslt(element_mapping, attribute_mapping, value_mapping):
    # Define the XSLT namespace
    XSL_NAMESPACE = 'http://www.w3.org/1999/XSL/Transform'

    # Define the namespaces used in the XSLT document
    namespaces = {
        None: XSL_NAMESPACE,
        'xsl': 'http://www.w3.org/1999/XSL/Transform',
        'com': 'http://www.wipo.int/standards/XMLSchema/CommonSchema',
        'pat': 'http://www.wipo.int/standards/XMLSchema/Patent',
    }

    # Create the XSLT document
    stylesheet = etree.Element('{http://www.w3.org/1999/XSL/Transform}stylesheet', version='3.0', nsmap=namespaces)

    # Add the identity transform
    identity_transform = etree.SubElement(stylesheet, '{http://www.w3.org/1999/XSL/Transform}template', match='@* | node()')
    identity_transform_copy = etree.SubElement(identity_transform, '{http://www.w3.org/1999/XSL/Transform}copy')
    identity_transform_copy_apply = etree.SubElement(identity_transform_copy, '{http://www.w3.org/1999/XSL/Transform}apply-templates')
    identity_transform_copy_apply.set('select', '@* | node()')

    # Add templates for element mapping
    for st36_element, st96_element in element_mapping.items():
        element_template = etree.SubElement(stylesheet, '{http://www.w3.org/1999/XSL/Transform}template', match=st36_element)
        element_apply_templates = etree.SubElement(element_template, '{http://www.w3.org/1999/XSL/Transform}apply-templates')
        element_apply_templates.set('select', st96_element)

    # Add templates for attribute mapping
    for st36_attribute, st96_attribute in attribute_mapping.items():
        attribute_template = etree.SubElement(stylesheet, '{http://www.w3.org/1999/XSL/Transform}template', match=f'*[@{st36_attribute}]')
        attribute_set_value = etree.SubElement(attribute_template, '{http://www.w3.org/1999/XSL/Transform}attribute')
        attribute_set_value.set('name', st96_attribute)
        attribute_set_value.set('select', f'@{st36_attribute}')

    # Add templates for value mapping
    for st36_value, st96_value in value_mapping.items():
        value_template = etree.SubElement(stylesheet, '{http://www.w3.org/1999/XSL/Transform}template', match=f'*[text()="{st36_value}"]')
        value_set_value = etree.SubElement(value_template, '{http://www.w3.org/1999/XSL/Transform}element')
        value_set_value.set('name', st96_value)
        value_set_value.text = st96_value

    # Return the XSLT document
    return stylesheet

def generate_xslt_from_tsv_to_file(element_tsv, value_tsv, xslt_file):
    element_mapping, attribute_mapping = parse_tsv_mapping(element_tsv)
    value_mapping = parse_value_mapping(value_tsv)
    stylesheet =  generate_xslt(element_mapping, attribute_mapping, value_mapping)
    etree.ElementTree(stylesheet).write(xslt_file, pretty_print=True, encoding='utf-8')


if __name__ == '__main__':
    b_element_tsv = "data/bibli_mapping.tsv"
    b_value_tsv = "data/bibli_mapping_value.tsv"
    b_xslt = "data/bibli_st36tost96.xsl"
    generate_xslt_from_tsv_to_file(b_element_tsv, b_value_tsv, b_xslt)
    b_element_tsv = "data/app_body_mapping.tsv"
    b_value_tsv = "data/app_body_mapping_value.tsv"
    b_xslt = "data/app_body_st36tost96.xsl"
    generate_xslt_from_tsv_to_file(b_element_tsv, b_value_tsv, b_xslt)