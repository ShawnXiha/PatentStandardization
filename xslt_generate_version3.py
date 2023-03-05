from lxml import etree
import csv

def generate_xslt(xml_element_mapping_file, value_mapping_file, xslt_output_file):
    # define namespaces
    ns = {
        'xmlns': 'http://www.wipo.int/standards/XMLSchema/ST96/Patent',
        'xsl': 'http://www.w3.org/1999/XSL/Transform',
        'pat': 'http://www.wipo.int/standards/XMLSchema/ST96/Patent',
        'com': 'http://www.wipo.int/standards/XMLSchema/ST96/Common'
    }

    # create the root element and set the namespaces
    root = etree.Element('{http://www.w3.org/1999/XSL/Transform}stylesheet', nsmap=ns)

    # add the identity transform to copy all elements and attributes as-is
    identity_transform = etree.SubElement(root, '{http://www.w3.org/1999/XSL/Transform}template', match='@*|node()')
    identity_transform.append(etree.Element('{http://www.w3.org/1999/XSL/Transform}copy'))
    identity_transform[-1].append(etree.Element('{http://www.w3.org/1999/XSL/Transform}apply-templates', select='@*|node()'))

    # read the element mapping CSV file and create the XSLT templates
    with open(xml_element_mapping_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            from_xpath = row['xpath_from']
            to_xpath = row['xpath_to']
            to_xpath = to_xpath.replace("pat:", "{http://www.wipo.int/standards/XMLSchema/ST96/Patent}")
            to_xpath = to_xpath.replace("com:", "{http://www.wipo.int/standards/XMLSchema/ST96/Common}")
            # create the template element for the from_xpath expression
            template = etree.SubElement(root, '{http://www.w3.org/1999/XSL/Transform}template', match=from_xpath)

            # create the new element for the to_xpath expression
            new_element = etree.Element(to_xpath)

            # add all child elements to the new element
            for child in template.iterchildren():
                new_element.append(child)

            # add all attributes to the new element
            for attr, value in child.items():
                new_element.set(attr, value)

            # add the new element to the template
            template.append(new_element)

    # read the value mapping CSV file and create the XSLT templates
    with open(value_mapping_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            from_element = row['from_element']
            to_element = row['to_element']
            from_value = row['from_value']
            to_value = row['to_value']

            # create the template element for the from_element expression and value
            template = etree.SubElement(root, '{http://www.w3.org/1999/XSL/Transform}template', match=f'{from_element}[.="{from_value}"]')

            # create the new element for the to_element expression and value
            new_element = etree.Element(to_element)
            new_element.text = to_value

            # add the new element to the template
            template.append(new_element)

    # write the XSLT to a file
    with open(xslt_output_file, 'wb') as f:
        f.write(etree.tostring(root, pretty_print=True))

if __name__ == '__main__':
    e_file = 'data/mapping_table/element_mapping.csv'
    v_file = 'data/mapping_table/element_value_mapping.csv'
    x_file = "data/xslt_generated/st36_2_st96.xsl"
    generate_xslt(e_file, v_file, x_file)

    e_file_cn = 'data/mapping_table/element_mapping_cn_old.csv'
    v_file_cn = 'data/mapping_table/element_value_mapping_cn_old.csv'
    x_file_cn = "data/xslt_generated/st36_2_st96_cn_old.xsl"

    generate_xslt(e_file_cn, v_file_cn, x_file_cn)