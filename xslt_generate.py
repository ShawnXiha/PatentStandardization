import csv
from lxml import etree

# Read element and attribute mappings from TSV file
with open('data/bibli_mapping.tsv', newline='', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter='\t')
    element_mapping = {}
    attribute_mapping = {}
    for row in reader:
        if row[0].count("@"):
            element_mapping[row[0]] = row[1:]
        else:
            element_mapping[row[0]] = row[1:]

# Read code mappings from TSV file
with open('data/bibli_mapping_value.tsv', newline='', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter='\t')
    code_mapping = {}
    for row in reader:
        code_mapping[row[-2]] = row[-1]

# Create the XSLT stylesheet element
namespaces = {"com": "http://www.wipo.int/standards/XMLSchema/ST96/Common",
                           "mathml": "http://www.w3.org/1998/Math/MathML",
                           "pat": "http://www.wipo.int/standards/XMLSchema/ST96/Patent",
                           "tbl": "http://www.oasis-open.org/tables/exchange/1.0",
              "xsl":'http://www.w3.org/1999/XSL/Transform' }

stylesheet = etree.Element('xsl:stylesheet', version='3.0', nsmap=namespaces)

# Define the mapping tables for elements, attributes, and codes
element_mapping_table_elem = etree.SubElement(stylesheet, 'xsl:map', name='element_mapping')
for st96_name, (st36_name, st36_xpath) in element_mapping.items():
    st36_elem = etree.SubElement(element_mapping_table_elem, 'xsl:map-entry', key=st96_name, select=st36_xpath)

attribute_mapping_table_elem = etree.SubElement(stylesheet, 'xsl:map', name='attribute_mapping')
for st96_name, (st36_name, st36_xpath) in attribute_mapping.items():
    st36_elem = etree.SubElement(attribute_mapping_table_elem, 'xsl:map-entry', key=st96_name, select=st36_xpath)

code_mapping_table_elem = etree.SubElement(stylesheet, 'xsl:map', name='code_mapping')
for st96_value, st36_value in code_mapping.items():
    st36_elem = etree.SubElement(code_mapping_table_elem, 'xsl:map-entry', key=st96_value, select=st36_value)

# Define the root template
root_template = etree.SubElement(stylesheet, 'xsl:template', match='/')
st36_elem = etree.SubElement(root_template, 'ST36')
apply_templates = etree.SubElement(st36_elem, 'xsl:apply-templates')

# Define the element template
element_template = etree.SubElement(stylesheet, 'xsl:template', match='*')
st96_name = etree.XPath("map('element_mapping', name())")
st96_elem = etree.Element(st96_name)
apply_templates = etree.SubElement(st96_elem, 'xsl:apply-templates', select='@*|node()')
element_template.append(st96_elem)

# Define the attribute template
attribute_template = etree.SubElement(stylesheet, 'xsl:template', match='@*')
st96_name = etree.XPath("map('attribute_mapping', name())")
st96_attr = etree.Element(st96_name)
value_of_elem = etree.SubElement(st96_attr, 'xsl:value-of', select="map('code_mapping', .)")
attribute_template.append(st96_attr)

# Define the code template
code_template = etree.SubElement(stylesheet, 'xsl:template', match='text()')
st96_value = etree.XPath("map('code_mapping', .)")
value_of_elem = etree.SubElement(code_template, 'xsl:value-of', select=st96_value)

print(root_template)