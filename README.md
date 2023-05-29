# 专利标准化xslt 生成

目标: 根据wipo 官方的标准st.36转st.96 xsl代码,及各个国家专利局特有的元素属性,生成对应的转为st.96的xsl代码

官方xslt 下载地址如下
[example_codes ](data/AnnexVI_Appendices_A_B_C_V6_0)are downloaded in [wipo st96 transformaton file](https://www.wipo.int/standards/en/st96/v6-0/annex-vi/AnnexVI_Appendices_A_B_C_V6_0.zip)

## 依赖
参考 [文档](https://www.saxonica.com/saxon-c/documentation12/index.html#!starting/installingpython)

安装saxonche 也就是saxonc 的python接口
```bash
pip install saxonche
```


## 手动处理:编辑合并application-body 与 bibliographic-data 的转换代码

官方提供了 application-body 与 bibliographic-data 的转换代码,但是没有我们的专利xml中的patent-publication 的转换代码,所以我们需要手动处理
官方提供的代码如下
[application-body转换文件](data/xslt_org/ST36application-body-v1-6MapToST96ApplicationBody_V6_0.xslt)
[bibliographic-data转换文件](data/xslt_org/ST36bibliographic-data-v2-3MapToST96BibliographicData_V6_0.xslt)

根据官方提供的apllication-body 与 bibliographic-data, paten-publication 的schema,我们可以手动合并生成一个完整的转换文件

schema 文件如下

[patent-publication xsd](data/ST96XMLSchema_V6_0_Flattened/PatentPublication_V6_0.xsd)

[application-body xsd](data/ST96XMLSchema_V6_0_Flattened/ApplicationBody_V6_0.xsd)

[bibliographic-data xsd](data/ST96XMLSchema_V6_0_Flattened/BibliographicData_V6_0.xsd)
data/ST96XMLSchema_V6_0_Flattened/PatentPublication_V6_0.xsd
data/ST96XMLSchema_V6_0_Flattened/ApplicationBody_V6_0.xsd
data/ST96XMLSchema_V6_0_Flattened/BibliographicData_V6_0.xsd


具体的
```xml
	<xsd:complexType name="PatentPublicationType">
		<xsd:sequence>
			<xsd:element ref="com:IPOfficeCode"/>
			<xsd:element ref="pat:BibliographicData"/>
			<xsd:choice>
				<xsd:element ref="pat:PageImage" maxOccurs="unbounded"/>
				<xsd:element ref="pat:DocumentURI"/>
				<xsd:sequence>
					<xsd:element ref="pat:Description" minOccurs="0" maxOccurs="unbounded"/>
					<xsd:element ref="pat:ClaimStatement" minOccurs="0"/>
					<xsd:element ref="pat:Claims"/>
					<xsd:element ref="pat:Abstract" minOccurs="0" maxOccurs="unbounded"/>
					<xsd:element ref="pat:Drawings" minOccurs="0"/>
					<xsd:element ref="com:ApplicantKeywordText" minOccurs="0"/>
					<xsd:element ref="com:ExternalDocumentBag" minOccurs="0"/>
				</xsd:sequence>
			</xsd:choice>
		</xsd:sequence>
		<xsd:attribute ref="com:id"/>
		<xsd:attribute ref="com:languageCode" use="required"/>
		<xsd:attribute ref="com:documentFileName"/>
		<xsd:attribute ref="com:creationDate"/>
		<xsd:attribute ref="com:documentStatusText"/>
		<xsd:attribute ref="com:st96Version" use="required"/>
		<xsd:attribute ref="com:ipoVersion"/>
		<xsd:attribute ref="com:documentPublicationDate"/>
	</xsd:complexType>


	<xsd:complexType name="ApplicationBodyType">
		<xsd:choice>
			<xsd:element ref="pat:PageImage" maxOccurs="unbounded"/>
			<xsd:element ref="pat:DocumentURI" maxOccurs="unbounded"/>
			<xsd:sequence>
				<xsd:element ref="pat:Description"/>
				<xsd:element ref="pat:ClaimStatement" minOccurs="0"/>
				<xsd:element ref="pat:Claims"/>
				<xsd:element ref="pat:Abstract" minOccurs="0"/>
				<xsd:element ref="pat:Drawings" minOccurs="0"/>
				<xsd:element ref="com:EndnoteBag" minOccurs="0"/>
				<xsd:element ref="com:FootnoteBag" minOccurs="0"/>
			</xsd:sequence>
		</xsd:choice>
		<xsd:attribute ref="com:id"/>
		<xsd:attribute ref="com:fileReferenceIdentifier"/>
		<xsd:attribute ref="pat:originalLanguageCode"/>
		<xsd:attribute ref="pat:translatorCategory"/>
		<xsd:attribute ref="com:languageCode" use="required"/>
		<xsd:attribute ref="com:receivingOffice" use="required"/>
		<xsd:attribute ref="com:documentFileName"/>
		<xsd:attribute ref="pat:softwareVersionNumber"/>
		<xsd:attribute ref="pat:applicationBodyStatus"/>
		<xsd:attribute ref="com:st96Version" use="required"/>
		<xsd:attribute ref="com:ipoVersion"/>
	</xsd:complexType>

	<xsd:complexType name="BibliographicDataType">
		<xsd:sequence>
			<xsd:element ref="pat:PatentPublicationIdentification" minOccurs="0"/>
			<xsd:element ref="pat:ApplicationIdentification"/>
			<xsd:element ref="pat:PatentGrantIdentification" minOccurs="0"/>
			<xsd:element ref="pat:PriorityClaimBag" minOccurs="0"/>
			<xsd:element ref="pat:GrantTerm" minOccurs="0"/>
			<xsd:element ref="pat:PreClassificationText" minOccurs="0"/>
			<xsd:element ref="pat:PatentClassificationBag" minOccurs="0"/>
			<xsd:element ref="pat:InventionTitleBag"/>
			<xsd:element ref="pat:PlantName" minOccurs="0"/>
			<xsd:element ref="pat:ReferenceCitationBag" minOccurs="0"/>
			<xsd:element ref="pat:ClaimTotalQuantity" minOccurs="0"/>
			<xsd:element ref="pat:SearchField" minOccurs="0"/>
			<xsd:element ref="pat:FigureBag" minOccurs="0"/>
			<xsd:element ref="pat:RelatedDocumentBag" minOccurs="0"/>
			<xsd:element ref="pat:ProvisionalGrantPublicationDate" minOccurs="0"/>
			<xsd:element ref="pat:GrantPublicationDate" minOccurs="0"/>
			<xsd:element ref="pat:ExemplaryClaimBag" minOccurs="0"/>
			<xsd:element ref="com:HagueAgreementData" minOccurs="0"/>
			<xsd:element ref="pat:PartyBag"/>
			<xsd:element ref="pat:InternationalFilingData" minOccurs="0"/>
			<xsd:element ref="pat:RegionalFilingData" minOccurs="0"/>
			<xsd:element ref="pat:InternationalPublishingData" minOccurs="0"/>
			<xsd:element ref="pat:RegionalPublishingData" minOccurs="0"/>
			<xsd:element ref="pat:PatentFamily" minOccurs="0"/>
			<xsd:element ref="com:BioDeposit" minOccurs="0"/>
			<xsd:element ref="pat:PlainLanguageDesignationText" minOccurs="0"/>
			<xsd:element ref="com:FilingLanguageCode" minOccurs="0"/>
			<xsd:element ref="com:PublicationLanguageCode" minOccurs="0"/>
			<xsd:element ref="pat:StateDesignation" minOccurs="0"/>
			<xsd:element ref="pat:LicenceBag" minOccurs="0"/>
			<xsd:element ref="pat:ApplicantIntent" minOccurs="0"/>
			<xsd:element ref="pat:EarliestPriorityApplication" minOccurs="0"/>
			<xsd:element ref="com:ReceivingOfficeDate" minOccurs="0"/>
			<xsd:element ref="pat:CompleteSpecificationFilingDate" minOccurs="0"/>
			<xsd:element ref="pat:PublicAvailabilityDataBag" minOccurs="0"/>
			<xsd:element ref="pat:RightsEffectiveDateBag" minOccurs="0"/>
			<xsd:element ref="pat:PatentDocumentRepublication" minOccurs="0"/>
			<xsd:element ref="pat:ExhibitionFilingDate" minOccurs="0"/>
			<xsd:element ref="pat:RightsReestablishedDate" minOccurs="0"/>
			<xsd:element ref="pat:ApplicationWithdrawnDate" minOccurs="0"/>
			<xsd:element ref="pat:ApplicationDeemedWithdrawnDate" minOccurs="0"/>
			<xsd:element ref="pat:PatentRevocationDate" minOccurs="0"/>
			<xsd:element ref="pat:PCTNationalPhaseEntryDate" minOccurs="0"/>
			<xsd:element ref="pat:ApplicationPartiallyWithdrawnDate" minOccurs="0"/>
			<xsd:element ref="com:TranslationReceiveDate" minOccurs="0"/>
			<xsd:element ref="com:SecurityReleaseDate" minOccurs="0"/>
			<xsd:element ref="pat:LORData" minOccurs="0"/>
			<xsd:element ref="pat:OppositionData" minOccurs="0"/>
		</xsd:sequence>
		<xsd:attribute ref="com:id"/>
		<xsd:attribute ref="com:officeCode"/>
		<xsd:attribute ref="com:st96Version" use="required"/>
		<xsd:attribute ref="com:ipoVersion"/>
	</xsd:complexType>

```

根据如上的xsd文件，我们知道pat:PatentPublication是一个复合类型，它包含了pat:BibliographicData 和一个展开了的pat:ApplicationBody
所有很容易就可以把pat:BibliographicData pat:ApplicationBody 的xslt文件整合成pat:PatentPublication的xslt转换文件,只需要把pat:ApplicationBody的xslt文件的根节点改成pat:PatentPublication,然后把pat:BibliographicData的xslt文件的元素路径从pat:BibliographicData开头
改为pat:PatentPublication/pat:BibliographicData开头就可以了


从这两个xslt:

data/xslt_org/ST36application-body-v1-6MapToST96ApplicationBody_V6_0.xslt
data/xslt_org/ST36bibliographic-data-v2-3MapToST96BibliographicData_V6_0.xslt

手动合成一个xslt:

data/xslt_org/ST36patent-document-v1-6MapToSTPatentPublication_V6_0.xslt


## 从各个专利局dtd查找专有元素

经检查发现,中国专利旧版专利元素特有名称一遍是cn- 为前缀的, 只需要从dtd文件中查找cn- 为前缀的元素名称,检查其对应的原本st.36元素,整理成一个映射表,
如何用这个映射表替换原本的xslt文件中的元素名称,就可以把原本的xslt文件转换成新的xslt文件了.

美国专利局的特有元素的名称是us- 为前缀的, 也可以用同样的方法处理.

日本专利局的特有元素的名称是使用了一个命名空间jp:, 也可以用同样的方法处理.


处理代码:

映射表获取
```bash
python cn_old_name_check.py
python us_name_check.py

```

替换xslt文件中的元素名称
```bash
python cn_old_xslt_generate.py
python jp_old_xslt_generate.py

```

## 使用新的xslt文件转换专利数据

见
```bash
python run_xslt.py

```