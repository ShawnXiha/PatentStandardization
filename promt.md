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


# 生成自动英文分组代码

提问

I need a xslt2.0 code that transform xml as described below:
use namespaces as below
namespaces = {"com": "http://www.wipo.int/standards/XMLSchema/ST96/Common",
                           "mathml": "http://www.w3.org/1998/Math/MathML",
                           "pat": "http://www.wipo.int/standards/XMLSchema/ST96/Patent",
                           "tbl": "http://www.oasis-open.org/tables/exchange/1.0"}

all element except .//pat:Description keep the same
the .//com:P|.//com:Heading in  pat:Description should be save in dict same as the python code :
        flag = ''
        for desc_p in self.description_node.xpath(".//com:P|.//com:Heading", namespaces=self.namespaces):

            desc_tag = desc_p.tag
            flag_text = desc_p.text
            if not flag_text:
                continue
            if desc_tag == "{http://www.wipo.int/standards/XMLSchema/ST96/Common}Heading":
                flag_text = flag_text.strip().lower()
                if 'field' in flag_text:
                    flag = 'technical_fields'
                elif 'background' in flag_text or 'art' in flag_text:
                    flag = 'backgrounds'
                elif 'drawing' in flag_text:
                    flag = 'drawings'
                elif 'summar' in flag_text:
                    flag = 'summaries'
                elif 'solution' in flag_text or 'mean' in flag_text:
                    flag = 'solutions'
                elif "problem" in flag_text:
                    flag = 'problems'
                elif "industr" in flag_text and ('applica' in flag_text or 'utili' in flag_text):
                    flag = "industrial_applicability"
                elif 'effect' in flag_text or 'advantage' in flag_text:
                    flag = 'advantageous'
                elif 'non-patent' in flag_text or 'bibliography' in flag_text or 'paper' in flag_text or "non patent" in flag_text:
                    flag = 'non_patent_refrences'
                elif 'patent literature' in flag_text or 'patent document' in flag_text or "patent ref" in flag_text:
                    flag = 'patent_refrences'

                elif 'example' in flag_text or 'detail' in flag_text or 'embodiment' in flag_text:
                    flag = 'details'
                elif 'symbol' in flag_text or "sign" in flag_text:
                    flag = 'symbols'
                elif 'sequence list' in flag_text:
                    flag = 'sequence_list'
            if flag != '':
                text_part[flag].append(desc_p)
            else:
                text_part['others'].append(desc_p)


the pat:Description should be regrouped by the key and xpath in pat:Description
key_path_map = {
    'technical_fields': "pat:TechnicalField",
    'backgrounds': "pat:BackgroundArt",
    'summaries': "pat:Disclosure",
    'drawings': "pat:DrawingDescription",
    'symbols': "pat:ReferenceSignBag",
    'details': "pat:EmbodimentDescription",
    'problems': "pat:Disclosure/pat:TechnicalProblem",
    'solutions': "pat:Disclosure/pat:TechnicalSolution",
    'advantageous': "pat:Disclosure/pat:AdvantageousEffects",
    'industrial_applicability': "pat:IndustrialApplicability",
    "sequence_list": "pat:SequenceListText",
    "uncertain_type_refrences": "com:CitationBag",
    "bio_deposited": "pat:DepositedBiologicalMaterialReference",
    'patent_refrences': "com:CitationBag/com:PatentCitation",
    'non_patent_refrences': "com:CitationBag/com:NPLCitation"}

please keep the xslt2.0 code short

回答:

```xml

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                xmlns:mathml="http://www.w3.org/1998/Math/MathML"
                xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="pat:Description">
    <xsl:variable name="text_part">
      <xsl:call-template name="group-text-parts">
        <xsl:with-param name="desc_node" select="."/>
      </xsl:call-template>
    </xsl:variable>
    <pat:Description>
      <xsl:apply-templates select="@* | node() except .//com:P|.//com:Heading"/>
      <xsl:apply-templates select="$text_part/*"/>
    </pat:Description>
  </xsl:template>

  <xsl:template match="com:P|.//com:Heading"/>

  <xsl:template name="group-text-parts">
    <xsl:param name="desc_node"/>
    <xsl:variable name="namespaces" select="namespace-uri($desc_node)"/>
    <xsl:variable name="key_path_map">
      <map xmlns="http://www.w3.org/2005/xpath-functions">
        <entry key="technical_fields" select="pat:TechnicalField"/>
        <entry key="backgrounds" select="pat:BackgroundArt"/>
        <entry key="summaries" select="pat:Disclosure"/>
        <entry key="drawings" select="pat:DrawingDescription"/>
        <entry key="symbols" select="pat:ReferenceSignBag"/>
        <entry key="details" select="pat:EmbodimentDescription"/>
        <entry key="problems" select="pat:Disclosure/pat:TechnicalProblem"/>
        <entry key="solutions" select="pat:Disclosure/pat:TechnicalSolution"/>
        <entry key="advantageous" select="pat:Disclosure/pat:AdvantageousEffects"/>
        <entry key="industrial_applicability" select="pat:IndustrialApplicability"/>
        <entry key="sequence_list" select="pat:SequenceListText"/>
        <entry key="uncertain_type_refrences" select="com:CitationBag"/>
        <entry key="bio_deposited" select="pat:DepositedBiologicalMaterialReference"/>
        <entry key="patent_refrences" select="com:CitationBag/com:PatentCitation"/>
        <entry key="non_patent_refrences" select="com:CitationBag/com:NPLCitation"/>
      </map>
    </xsl:variable>
    <xsl:variable name="text_part">
      <map xmlns="http://www.w3.org/2005/xpath-functions">
        <entry key="technical_fields" select="node()"/>
        <entry key="backgrounds" select="node()"/>
        <entry key="summaries" select="node()"/>
        <entry key="draw

```

```xml

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                xmlns:mathml="http://www.w3.org/1998/Math/MathML"
                xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0">

  <xsl:key name="desc-key" match=".//pat:Description/*" use="name()"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match=".//pat:Description">
    <xsl:variable name="desc" select="."/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:for-each-group select="$desc/*" group-by="name()">
        <xsl:choose>
          <xsl:when test="name() = 'pat:TechnicalField'">
            <xsl:element name="{$key_path_map.technical_fields}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:BackgroundArt'">
            <xsl:element name="{$key_path_map.backgrounds}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:Disclosure'">
            <xsl:element name="{$key_path_map.summaries}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:DrawingDescription'">
            <xsl:element name="{$key_path_map.drawings}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:ReferenceSignBag'">
            <xsl:element name="{$key_path_map.symbols}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:EmbodimentDescription'">
            <xsl:element name="{$key_path_map.details}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="name() = 'pat:IndustrialApplicability'">
            <xsl:element name="{$key_path_map.industrial_applicability}">
              <xsl:apply-templates select="current-group()"/>
            </xsl:element>
          </xsl:when>
          <xsl:when

```

I apologize, but it's not possible to provide a complete XSLT 2.0 code for your requirements without having the input XML document. However, I can provide you with a general XSLT 2.0 structure that should help you get started:

```xml
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pat="namespace for pat" xmlns:com="namespace for com">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Define the key_path_map as a variable -->
    <xsl:variable name="key_path_map">
        <map>
            <technical_fields>pat:TechnicalField</technical_fields>
            <backgrounds>pat:BackgroundArt</backgrounds>
            <summaries>pat:Disclosure</summaries>
            <drawings>pat:DrawingDescription</drawings>
            <symbols>pat:ReferenceSignBag</symbols>
            <details>pat:EmbodimentDescription</details>
            <problems>pat:Disclosure/pat:TechnicalProblem</problems>
            <solutions>pat:Disclosure/pat:TechnicalSolution</solutions>
            <advantageous>pat:Disclosure/pat:AdvantageousEffects</advantageous>
            <industrial_applicability>pat:IndustrialApplicability</industrial_applicability>
            <sequence_list>pat:SequenceListText</sequence_list>
            <uncertain_type_refrences>com:CitationBag</uncertain_type_refrences>
            <bio_deposited>pat:DepositedBiologicalMaterialReference</bio_deposited>
            <patent_refrences>com:CitationBag/com:PatentCitation</patent_refrences>
            <non_patent_refrences>com:CitationBag/com:NPLCitation</non_patent_refrences>
        </map>
    </xsl:variable>
    
    <!-- Use the key_path_map to group the elements in pat:Description -->
    <xsl:template match="/">
        <xsl:variable name="text_part">
            <xsl:apply-templates select="//pat:Description"/>
        </xsl:variable>
        <xsl:copy-of select="$text_part"/>
    </xsl:template>
    
    <xsl:template match="pat:Description">
        <xsl:variable name="desc_p" select=".//com:P|.//com:Heading"/>
        <xsl:for-each select="$desc_p">
            <xsl:variable name="desc_tag" select="local-name()"/>
            <xsl:variable name="flag_text" select="normalize-space()"/>
            <xsl:if test="$flag_text != ''">
                <xsl:variable name="flag">
                    <xsl:choose>
                        <xsl:when test="$desc_tag = 'Heading'">
                            <xsl:choose>
                                <xsl:when test="contains(lower-case($flag_text), 'field')">
                                    <xsl:text>technical_fields</xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(lower-case($flag_text), 'background') or contains(lower-case($flag_text), 'art')">
                                    <xsl:text>backgrounds</xsl:text>
                                </xsl:when>
                                <!-- Add more conditions for the other flags -->
                                <xsl:otherwise>
                                    <xsl:text>others</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test


```

I apologize for the confusion, but as an AI language model, I cannot complete the code you provided as it is written in Python and not in XSLT. However, I can provide an XSLT 2.0 code that meets your requirements based on the Python code you provided earlier. Here's the code:

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">

  <xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match=".//pat:Description">
    <xsl:variable name="desc_p" select=".//com:P|.//com:Heading" />
    <xsl:variable name="text_part">
      <technical_fields>
        <xsl:copy-of select="$desc_p[local-name() = 'P' and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'field')]" />
      </technical_fields>
      <backgrounds>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'background') or contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'art')]" />
      </backgrounds>
      <drawings>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'drawing')]" />
      </drawings>
      <summaries>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'summar')]" />
      </summaries>
      <solutions>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and (contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'solution') or contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'mean'))]" />
      </solutions>
      <problems>
        <xsl:copy-of select="$desc_p[ancestor::pat:Disclosure and local-name() = 'TechnicalProblem']" />
      </problems>
      <industrial_applicability>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'industr') and (contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'applica') or contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'utili'))]" />
      </industrial_applicability>
      <advantageous>
        <xsl:copy-of select="$desc_p[local-name() = 'Heading' and (contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'effect') or contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'advantage'))]" />
      </advantageous>
      <non_patent_refrences>
        <xsl:copy-of select="$desc_p[ancestor::com:CitationBag and local-name() = 'NPLCitation']" />
      </non_patent_refrences>
      <patent_refrences>
        <xsl:copy-of select="$desc

