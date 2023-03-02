my first tsv files was like element_attribute_xpath_mapping.tsv: 
classification-ipc	pat:IPCClassification
classification-ipc/@id	pat:IPCClassification/@com:id
classification-ipc/edition	pat:IPCClassification/com:Edition
classification-ipc/main-classification	pat:IPCClassification/pat:MainClassification
classification-ipc/further-classification	pat:IPCClassification/pat:FurtherClassification  
application-body/description/heading/@level	pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()
 references-cited/citation/category/text() pat:ReferenceCitationBag/pat:ReferenceCitation/@pat:citingPartyCategory    

 for this example, I need map xml element  classification-ipc to     pat:IPCClassification ,  
 classification-ipc/edition to	pat:IPCClassification/com:Edition        ,
 attribute from classification-ipc/@id  to	pat:IPCClassification/@com:id ,       
 the level attribute value of    application-body/description/heading elements should be set to the text of   pat:ApplicationBody/pat:Description/com:Heading/com:Del elements
text value of references-cited/citation/category should be set  to  be pat:ReferenceCitationBag/pat:ReferenceCitation/@pat:citingPartyCategory  attribute value

 .

and my another tsv element_attribute_value_mapping.tsv was like

img-format	com:ImageFormatCategory	jpg	JPEG
img-format	com:ImageFormatCategory	tif	TIFF          

this mean every img-format element value if is jpg ,change it to JPEG in com:ImageFormatCategory,       if it is tif change it to TIFF in com:ImageFormatCategory  



how to use these two TSV , and generate xslt  transform code from it , namespaces was as below

    namespaces = {
        'xsl': 'http://www.w3.org/1999/XSL/Transform',
        'com': 'http://www.wipo.int/standards/XMLSchema/CommonSchema',
        'pat': 'http://www.wipo.int/standards/XMLSchema/Patent',
    }

