from lxml import html

from lxml import html

def parse_mapping_table(html_file_path, tsv_file_path):
    # Open the HTML file and read the contents
    with open(html_file_path, 'r') as f:
        html_content = f.read()

    # Parse the HTML content using lxml
    doc = html.fromstring(html_content)

    # Extract the mapping table rows
    table_rows = doc.xpath('//table/tbody/tr')

    # Create an empty dictionary to store the mapping table data
    mapping_table = {}

    # Iterate over the table rows and extract the key-value pairs
    for i, row in enumerate(table_rows):
        # Check if this is a data row (not a header row)
        if i > 0:
            # Extract the columns of the row
            cols = row.xpath('td')

            # If the row has the expected number of columns
            if len(cols) == 5:
                # Extract the key and value from the appropriate columns
                key = cols[0].text_content().strip()
                value = cols[3].text_content().strip()

                # Add the key-value pair to the mapping table
                mapping_table[key] = value

    # Save the mapping table to TSV file
    with open(tsv_file_path, 'w') as f:
        for key, value in mapping_table.items():
            f.write(key + '\t' + value + '\n')





if __name__ == '__main__':
    html_app_body = "data/AnnexVI_Appendices_A_B_C_V6_0/Appendices_AB_HTML/ST36app-body-v1-6ToST96ApplicationBody_V6_0.html"
    app_body_mapping_tsv = "data/app_body_mapping.tsv"
    html_bibli = "data/AnnexVI_Appendices_A_B_C_V6_0/Appendices_AB_HTML/ST36Biliographic-data-v2-3ToST96BibliographicData_V6_0.html"
    bibli_tsv = "data/bibli_mapping.tsv"
    parse_mapping_table(html_app_body, app_body_mapping_tsv)
    parse_mapping_table(html_bibli, bibli_tsv)