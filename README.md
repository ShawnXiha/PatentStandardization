# PatentStandardization
 generating XSLT code, and using XSLT to transform Patent XML from ST36 to ST96

[example_codes ](data/AnnexVI_Appendices_A_B_C_V6_0)are downloaded in [wipo st96 transformaton file](https://www.wipo.int/standards/en/st96/v6-0/annex-vi/AnnexVI_Appendices_A_B_C_V6_0.zip)

* install packages we need

pip install saxonche lxml 


## extract mapping rules 

parse_element_mapping.py extract element mapping from the html wipo gave us

parse_value_mapping.py extract value mapping from the html wipo gave us

## Generate XSLT from the mapping rules


xslt_generate.py auto generator the mapping extracted from wipo html files





## transform xml with the xslt file


transform_with_xslt.py

