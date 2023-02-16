from lxml import html


def element_name_clean(element_name:str):
    dot_i = element_name.rindex('.')
    bra_i = element_name.rindex(")")
    return element_name[dot_i+1:bra_i]



def parse_element_value_mapping_table(html_file_path, tsv_file_path):
    # Open the HTML file and read the contents
    with open(html_file_path, 'r') as f:
        html_content = f.read()

    # Parse the HTML content using lxml
    doc = html.fromstring(html_content)

    # Extract the mapping table tbody elements
    table_bodies = doc.xpath('//table//tbody')
    # print(table_bodies)
    # Create an empty dictionary to store the mapping table data
    mapping_table = {}

    # Iterate over the table bodies and extract the key-value pairs
    for tbody in table_bodies:
        # Extract the element names from the first row of the tbody
        header_row = tbody.xpath('.//tr[1]')[0]
        tds =  header_row.xpath(".//td")
        if len(tds) != 2:
            continue
        st36_element_name = header_row.xpath('.//td[1]')[0].text_content().strip()
        st96_element_name = header_row.xpath('.//td[2]')[0].text_content().strip()

        # Create a dictionary to store the value mappings for this element
        value_mappings = {}

        # Iterate over the remaining rows and extract the value mappings
        data_rows = tbody.xpath('.//tr[position() > 2]')
        for row in data_rows:
            # Extract the columns of the row
            cols = row.xpath('.//td')

            # If the row has the expected number of columns
            if len(cols) == 2:
                # Extract the ST.36 and ST.96 values from the appropriate columns
                st36_value = cols[0].text_content().strip()
                st96_value = cols[1].text_content().strip()

                # Add the value mapping to the dictionary
                value_mappings[st36_value] = st96_value

        # Add the element-value mapping to the main dictionary
        mapping_table[(st36_element_name, st96_element_name)] = value_mappings

    # Save the mapping table to TSV file
    with open(tsv_file_path, 'w') as f:
        for (st36_element_name, st96_element_name), value_mappings in mapping_table.items():
            st36_element_name = element_name_clean(st36_element_name)
            st96_element_name = element_name_clean(st96_element_name)
            for st36_value, st96_value in value_mappings.items():
                f.write(st36_element_name + '\t' + st96_element_name + "\t"+ st36_value + '\t' + st96_value + '\n')

if __name__ == '__main__':
    html_app_body = "data/AnnexVI_Appendices_A_B_C_V6_0/Appendices_AB_HTML/ST36app-body-v1-6ToST96ApplicationBody_V6_0.html"
    app_body_mapping_tsv = "data/app_body_mapping_value.tsv"
    html_bibli = "data/AnnexVI_Appendices_A_B_C_V6_0/Appendices_AB_HTML/ST36Biliographic-data-v2-3ToST96BibliographicData_V6_0.html"
    bibli_tsv = "data/bibli_mapping_value.tsv"
    parse_element_value_mapping_table(html_app_body, app_body_mapping_tsv)
    parse_element_value_mapping_table(html_bibli, bibli_tsv)