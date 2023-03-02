import re
from pprint import pprint
example_dtd = "../data/中文专利xml标准/cn_old.dtd"
# example_dtd = "../data/example.dtd"

import re
import re

def parse_dtd_file(dtd_file):
    with open(dtd_file, 'r') as f:
        dtd_content = f.read()

    elements = []
    attributes = []

    # Find all element definitions
    element_defs = re.findall(r'<!ELEMENT\s+(\w+)\s+\((.*)\)>', dtd_content)

    # Process each element definition
    for element_def in element_defs:
        element_name = element_def[0]
        element_structure = element_def[1]

        # Find all sub-element and group references
        sub_elements = re.findall(r'([\w-]+)(?:\s*\|\s*|,|\+|\*|\?)', element_structure)
        groups = re.findall(r'%\s+(\w+)\s*;', element_structure)

        # Generate xpath for element and its sub-elements
        xpath = '//{}'.format(element_name)
        for sub_element in sub_elements:
            xpath += '/{}'.format(sub_element)
        elements.append(xpath)

        # Generate xpath for group sub-elements
        for group in groups:
            group_def = re.findall(r'<!ENTITY\s+%s\s+"(.*)">' % group, dtd_content)
            group_elements = re.findall(r'([\w-]+)(?:\s*\|\s*|,|\+|\*|\?)', group_def[0])
            for group_element in group_elements:
                xpath = '//{}//{}'.format(element_name, group_element)
                elements.append(xpath)

    # Find all attribute definitions
    attribute_defs = re.findall(r'<!ATTLIST\s+(\w+)\s+(.*)>', dtd_content)

    # Process each attribute definition
    for attribute_def in attribute_defs:
        element_name = attribute_def[0]
        attribute_structures = attribute_def[1].split()
        for i in range(0, len(attribute_structures), 2):
            attribute_name = attribute_structures[i]
            attributes.append('//{}//@{}'.format(element_name, attribute_name))
    print(attributes)
    return elements + attributes





pprint(parse_dtd_file(example_dtd))