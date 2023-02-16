<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" exclude-result-prefixes="WIPO vmf xs fn com pat">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" doctype-system="../../Schemas/ST36DTD/xx-patent-document-v2-3.dtd"/>
	<xsl:param name="BibliographicData_V6_03" select="'BibliographicData_V6_0.xml'"/>
	<xsl:param name="BibliographicData_V6_04" select="'BibliographicData_V6_0.xml'"/>
	<xsl:param name="BibliographicData_V6_05" select="'BibliographicData_V6_0.xml'"/>
	<xsl:param name="BibliographicData_V6_06" select="'BibliographicData_V6_0.xml'"/>
	<xsl:param name="BibliographicData_V6_07" select="'BibliographicData_V6_0.xml'"/>
	<xsl:template name="WIPO:ST96PublicationContactToST36address-book">
		<xsl:param name="PublicationContact" select="()"/>
		<xsl:variable name="var1_Name" as="node()*" select="$PublicationContact/com:Name"/>
		<addressbook>
			<xsl:for-each select="$PublicationContact/@com:languageCode">
				<xsl:attribute name="lang" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:EntityName">
				<name>
					<xsl:sequence select="fn:string(.)"/>
				</name>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:NamePrefix">
				<prefix>
					<xsl:sequence select="fn:string(.)"/>
				</prefix>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:LastName">
				<last-name>
					<xsl:sequence select="fn:string(.)"/>
				</last-name>
			</xsl:for-each>
			<xsl:for-each select="($var1_Name/com:OrganizationName/com:OrganizationStandardName/node())[fn:boolean(self::text())]">
				<orgname>
					<xsl:sequence select="fn:string(.)"/>
				</orgname>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:FirstName">
				<first-name>
					<xsl:sequence select="fn:string(.)"/>
				</first-name>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:MiddleName">
				<middle-name>
					<xsl:sequence select="fn:string(.)"/>
				</middle-name>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:FirstLastName">
				<first-last-name>
					<xsl:sequence select="fn:string(.)"/>
				</first-last-name>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:SecondLastName">
				<second-last-name>
					<xsl:sequence select="fn:string(.)"/>
				</second-last-name>
			</xsl:for-each>
			<xsl:for-each select="$var1_Name/com:PersonName/com:PersonStructuredName/com:NameSuffix">
				<suffix>
					<xsl:sequence select="fn:string(.)"/>
				</suffix>
			</xsl:for-each>
			<address>
				<city>
					<xsl:for-each select="$PublicationContact/com:CityName">
						<xsl:sequence select="fn:string(.)"/>
					</xsl:for-each>
				</city>
				<xsl:for-each select="$PublicationContact/com:GeographicRegionName">
					<state>
						<xsl:sequence select="fn:string(.)"/>
					</state>
				</xsl:for-each>
				<xsl:for-each select="$PublicationContact/com:PostalCode">
					<postcode>
						<xsl:sequence select="fn:string(.)"/>
					</postcode>
				</xsl:for-each>
				<xsl:for-each select="$PublicationContact/com:CountryCode">
					<country>
						<xsl:sequence select="fn:string(.)"/>
					</country>
				</xsl:for-each>
			</address>
		</addressbook>
	</xsl:template>
	<xsl:template name="WIPO:ST96FigureBagToST36figures">
		<xsl:param name="FigureBag" select="()"/>
		<figures>
			<xsl:for-each select="$FigureBag/pat:DrawingSheetTotalQuantity">
				<number-of-drawing-sheets>
					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
				</number-of-drawing-sheets>
			</xsl:for-each>
			<xsl:for-each select="$FigureBag/pat:FigureTotalQuantity">
				<number-of-figures>
					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
				</number-of-figures>
			</xsl:for-each>
			<xsl:for-each select="$FigureBag/pat:PublishFigure">
				<figure-to-publish>
					<xsl:for-each select="pat:FigureNumber">
						<fig-number>
							<xsl:sequence select="fn:string(.)"/>
						</fig-number>
					</xsl:for-each>
				</figure-to-publish>
			</xsl:for-each>
		</figures>
	</xsl:template>
	<xsl:template name="WIPO:ST96ReferenceCitationBagToST36reference-cited">
		<xsl:param name="ReferenceCitationBagType" select="()"/>
		<references-cited>
			<xsl:for-each select="$ReferenceCitationBagType/pat:ReferenceCitation">
				<citation>
					<xsl:for-each select="com:PatentCitation">
						<patcit>
							<xsl:for-each select="@com:id">
								<xsl:attribute name="id" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="@com:sequenceNumber">
								<xsl:attribute name="num" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="com:PatentCitationText">
								<text>
									<xsl:sequence select="fn:string(.)"/>
								</text>
							</xsl:for-each>
							<xsl:for-each select="com:CitedPatentDocumentIdentification">
								<document-id>
									<xsl:for-each select="com:IPOfficeCode">
										<country>
											<xsl:sequence select="fn:string(.)"/>
										</country>
									</xsl:for-each>
									<xsl:for-each select="com:DocumentNumber">
										<doc-number>
											<xsl:sequence select="fn:string(.)"/>
										</doc-number>
									</xsl:for-each>
									<xsl:for-each select="com:PatentDocumentKindCode">
										<kind>
											<xsl:sequence select="fn:string(.)"/>
										</kind>
									</xsl:for-each>
									<xsl:for-each select="com:EntityName">
										<name>
											<xsl:sequence select="fn:string(.)"/>
										</name>
									</xsl:for-each>
									<xsl:for-each select="com:PatentDocumentDate">
										<date>
											<xsl:sequence select="fn:string(.)"/>
										</date>
									</xsl:for-each>
								</document-id>
							</xsl:for-each>
						</patcit>
					</xsl:for-each>
					<xsl:for-each select="com:NPLCitation">
						<nplcit>
							<xsl:for-each select="@com:id">
								<xsl:attribute name="id" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="@com:sequenceNumber">
								<xsl:attribute name="num" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="@com:languageCode">
								<xsl:attribute name="lang" select="fn:string(.)"/>
							</xsl:for-each>
							<othercit>
								<xsl:for-each select="com:NPLCitationText">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</othercit>
						</nplcit>
					</xsl:for-each>
					<xsl:for-each select="@pat:citingPartyCategory">
						<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf7_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
							<category>
								<xsl:sequence select="."/>
							</category>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="pat:PatentClassificationBag/pat:NationalClassification">
						<classification-national>
							<xsl:for-each select="@com:id">
								<xsl:attribute name="id" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="com:IPOfficeCode">
								<country>
									<xsl:sequence select="fn:string(.)"/>
								</country>
							</xsl:for-each>
							<xsl:for-each select="com:Edition">
								<edition>
									<xsl:sequence select="fn:string(.)"/>
								</edition>
							</xsl:for-each>
							<xsl:for-each select="pat:MainNationalClassification">
								<main-classification>
									<xsl:for-each select="pat:PatentClassificationText">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</main-classification>
							</xsl:for-each>
							<xsl:for-each select="pat:FurtherNationalClassification">
								<further-classification>
									<xsl:for-each select="@com:id">
										<xsl:attribute name="id" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="pat:PatentClassificationText">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</further-classification>
							</xsl:for-each>
						</classification-national>
					</xsl:for-each>
				</citation>
			</xsl:for-each>
		</references-cited>
	</xsl:template>
	<xsl:template name="WIPO:ST96RelatedDocumentBagToST36related-document">
		<xsl:param name="RelatedDocumentBagType" select="()"/>
		<related-documents>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Addition">
				<addition>
					<xsl:sequence select="()"/>
				</addition>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Division">
				<division>
					<xsl:sequence select="()"/>
				</division>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Continuation">
				<continuation>
					<xsl:sequence select="()"/>
				</continuation>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:PartialContinuation">
				<continuation-in-part>
					<relation>
						<xsl:for-each select="pat:ParentDocument">
							<xsl:variable name="var1_PatentDocumentIdentification" as="node()*" select="pat:PatentDocumentIdentification"/>
							<parent-doc>
								<xsl:for-each select="$var1_PatentDocumentIdentification/pat:ApplicationIdentification">
									<document-id>
										<xsl:for-each select="com:FilingLanguageCode">
											<xsl:attribute name="lang" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:for-each select="com:IPOfficeCode">
											<country>
												<xsl:sequence select="fn:string(.)"/>
											</country>
										</xsl:for-each>
										<xsl:for-each select="com:ApplicationNumber/com:ApplicationNumberText">
											<doc-number>
												<xsl:sequence select="fn:string(.)"/>
											</doc-number>
										</xsl:for-each>
										<xsl:for-each select="pat:FilingDate">
											<date>
												<xsl:sequence select="fn:string(.)"/>
											</date>
										</xsl:for-each>
									</document-id>
								</xsl:for-each>
								<parent-grant-document>
									<xsl:for-each select="$var1_PatentDocumentIdentification/pat:PatentGrantIdentification">
										<document-id>
											<xsl:for-each select="com:PublicationLanguageCode">
												<xsl:attribute name="lang" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:for-each select="com:IPOfficeCode">
												<country>
													<xsl:sequence select="fn:string(.)"/>
												</country>
											</xsl:for-each>
											<xsl:for-each select="pat:PatentNumber">
												<doc-number>
													<xsl:sequence select="fn:string(.)"/>
												</doc-number>
											</xsl:for-each>
											<xsl:for-each select="com:PatentDocumentKindCode">
												<kind>
													<xsl:sequence select="fn:string(.)"/>
												</kind>
											</xsl:for-each>
											<xsl:for-each select="pat:GrantDate">
												<date>
													<xsl:sequence select="fn:string(.)"/>
												</date>
											</xsl:for-each>
										</document-id>
									</xsl:for-each>
								</parent-grant-document>
							</parent-doc>
						</xsl:for-each>
						<xsl:for-each select="pat:ChildDocument">
							<child-doc>
								<xsl:for-each select="pat:PatentDocumentIdentification/pat:ApplicationIdentification">
									<document-id>
										<xsl:for-each select="com:FilingLanguageCode">
											<xsl:attribute name="lang" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:for-each select="com:IPOfficeCode">
											<country>
												<xsl:sequence select="fn:string(.)"/>
											</country>
										</xsl:for-each>
										<xsl:for-each select="com:ApplicationNumber/com:ApplicationNumberText">
											<doc-number>
												<xsl:sequence select="fn:string(.)"/>
											</doc-number>
										</xsl:for-each>
										<xsl:for-each select="pat:FilingDate">
											<date>
												<xsl:sequence select="fn:string(.)"/>
											</date>
										</xsl:for-each>
									</document-id>
								</xsl:for-each>
							</child-doc>
						</xsl:for-each>
					</relation>
				</continuation-in-part>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Reissue">
				<reissue>
					<xsl:sequence select="()"/>
				</reissue>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Reexamination">
				<reexamination>
					<xsl:sequence select="()"/>
				</reexamination>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Substitution">
				<substitution>
					<xsl:sequence select="()"/>
				</substitution>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:Correction">
				<correction>
					<xsl:sequence select="()"/>
				</correction>
			</xsl:for-each>
			<xsl:for-each select="$RelatedDocumentBagType/pat:RelatedPublication">
				<related-publication>
					<xsl:for-each select="pat:PatentDocumentIdentification/pat:PatentPublicationIdentification">
						<document-id>
							<xsl:for-each select="com:PublicationLanguageCode">
								<xsl:attribute name="lang" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="com:IPOfficeCode">
								<country>
									<xsl:sequence select="fn:string(.)"/>
								</country>
							</xsl:for-each>
							<xsl:for-each select="pat:PublicationNumber">
								<doc-number>
									<xsl:sequence select="fn:string(.)"/>
								</doc-number>
							</xsl:for-each>
							<xsl:for-each select="com:PatentDocumentKindCode">
								<kind>
									<xsl:sequence select="fn:string(.)"/>
								</kind>
							</xsl:for-each>
							<xsl:for-each select="com:PublicationDate">
								<date>
									<xsl:sequence select="fn:string(.)"/>
								</date>
							</xsl:for-each>
						</document-id>
					</xsl:for-each>
				</related-publication>
			</xsl:for-each>
		</related-documents>
	</xsl:template>
	<xsl:template name="WIPO:ST96NationalClassitificationToST36classification-national">
		<xsl:param name="NationalClassification" select="()"/>
		<classification-national>
			<xsl:for-each select="$NationalClassification/@com:id">
				<xsl:attribute name="id" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$NationalClassification/com:IPOfficeCode">
				<country>
					<xsl:sequence select="fn:string(.)"/>
				</country>
			</xsl:for-each>
			<xsl:for-each select="$NationalClassification/com:Edition">
				<edition>
					<xsl:sequence select="fn:string(.)"/>
				</edition>
			</xsl:for-each>
			<xsl:for-each select="$NationalClassification/pat:MainNationalClassification">
				<main-classification>
					<xsl:for-each select="pat:PatentClassificationText">
						<xsl:sequence select="fn:string(.)"/>
					</xsl:for-each>
				</main-classification>
			</xsl:for-each>
			<xsl:for-each select="$NationalClassification/pat:FurtherNationalClassification">
				<further-classification>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="pat:PatentClassificationText">
						<xsl:sequence select="fn:string(.)"/>
					</xsl:for-each>
				</further-classification>
			</xsl:for-each>
		</classification-national>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Applicant_Inventor'">
				<xsl:copy-of select="'applicant-inventor'"/>
			</xsl:when>
			<xsl:when test="$input='Applicant'">
				<xsl:copy-of select="'applicant'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='All'">
				<xsl:copy-of select="'all'"/>
			</xsl:when>
			<xsl:when test="$input='All except US'">
				<xsl:copy-of select="'all-except-us'"/>
			</xsl:when>
			<xsl:when test="$input='US only'">
				<xsl:copy-of select="'us-only'"/>
			</xsl:when>
			<xsl:when test="$input='As indicated'">
				<xsl:copy-of select="'as-indicated'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Heir'">
				<xsl:copy-of select="'heir'"/>
			</xsl:when>
			<xsl:when test="$input='Heiress'">
				<xsl:copy-of select="'heiress'"/>
			</xsl:when>
			<xsl:when test="$input='Excecutor'">
				<xsl:copy-of select="'exceutor'"/>
			</xsl:when>
			<xsl:when test="$input='Executrix'">
				<xsl:copy-of select="'executrix'"/>
			</xsl:when>
			<xsl:when test="$input='Estate'">
				<xsl:copy-of select="'estate'"/>
			</xsl:when>
			<xsl:when test="$input='Legal representative'">
				<xsl:copy-of select="'legal-representative'"/>
			</xsl:when>
			<xsl:when test="$input='Administrator'">
				<xsl:copy-of select="'administrator'"/>
			</xsl:when>
			<xsl:when test="$input='Administratrix'">
				<xsl:copy-of select="'administratrix'"/>
			</xsl:when>
			<xsl:when test="$input='Legal representatives'">
				<xsl:copy-of select="'legal representatives'"/>
			</xsl:when>
			<xsl:when test="$input='Heirs'">
				<xsl:copy-of select="'Heirs'"/>
			</xsl:when>
			<xsl:when test="$input='Executors'">
				<xsl:copy-of select="'executors'"/>
			</xsl:when>
			<xsl:when test="$input='Legal heirs'">
				<xsl:copy-of select="'legal heirs'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Agent'">
				<xsl:copy-of select="'agent'"/>
			</xsl:when>
			<xsl:when test="$input='Attorney'">
				<xsl:copy-of select="'attorney'"/>
			</xsl:when>
			<xsl:when test="$input='Legal Representative'">
				<xsl:copy-of select="'legal representative'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='true'">
				<xsl:copy-of select="'yes'"/>
			</xsl:when>
			<xsl:when test="$input='false'">
				<xsl:copy-of select="'no'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Agent'">
				<xsl:copy-of select="'agent'"/>
			</xsl:when>
			<xsl:when test="$input='Attorney'">
				<xsl:copy-of select="'attorney'"/>
			</xsl:when>
			<xsl:when test="$input='Common representative'">
				<xsl:copy-of select="'common-representative'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf7_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Applicant'">
				<xsl:copy-of select="'cited by applicant'"/>
			</xsl:when>
			<xsl:when test="$input='Examiner'">
				<xsl:copy-of select="'cited by examiner'"/>
			</xsl:when>
			<xsl:when test="$input='Opponent'">
				<xsl:copy-of select="'cited by opponent'"/>
			</xsl:when>
			<xsl:when test="$input='Third Party'">
				<xsl:copy-of select="'cited by third party'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:variable name="var31_BibliographicData" as="node()?" select="pat:BibliographicData"/>
		<bibliographic-data>
			<xsl:for-each select="$var31_BibliographicData/@com:id">
				<xsl:attribute name="id" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/@com:officeCode">
				<xsl:attribute name="country" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PlainLanguageDesignationText">
				<plain-language-designation>
					<xsl:for-each select="@com:languageCode">
						<xsl:attribute name="lang" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</plain-language-designation>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PatentPublicationIdentification">
				<publication-reference>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<document-id>
						<country>
							<xsl:sequence select="fn:string(com:IPOfficeCode)"/>
						</country>
						<doc-number>
							<xsl:sequence select="fn:string(pat:PublicationNumber)"/>
						</doc-number>
						<xsl:for-each select="com:PatentDocumentKindCode">
							<kind>
								<xsl:sequence select="fn:string(.)"/>
							</kind>
						</xsl:for-each>
						<xsl:for-each select="com:PublicationDate">
							<date>
								<xsl:sequence select="fn:string(.)"/>
							</date>
						</xsl:for-each>
					</document-id>
				</publication-reference>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PatentClassificationBag/pat:IPCClassification">
				<classification-ipc>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<edition>
						<xsl:sequence select="fn:string(com:Edition)"/>
					</edition>
					<main-classification>
						<xsl:sequence select="fn:string(pat:MainClassification)"/>
					</main-classification>
					<xsl:for-each select="pat:FurtherClassification">
						<further-classification>
							<xsl:sequence select="fn:string(.)"/>
						</further-classification>
					</xsl:for-each>
				</classification-ipc>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag">
				<classifications-ipcr>
					<xsl:for-each select="pat:IPCRClassification">
						<classification-ipcr>
							<xsl:for-each select="@com:id">
								<xsl:attribute name="id" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="@com:sequenceNumber">
								<xsl:attribute name="sequence" select="fn:string(.)"/>
							</xsl:for-each>
							<ipc-version-indicator>
								<xsl:for-each select="pat:ClassificationVersionDate">
									<date>
										<xsl:sequence select="fn:string(.)"/>
									</date>
								</xsl:for-each>
							</ipc-version-indicator>
							<xsl:for-each select="pat:PatentClassificationLevelCode">
								<classification-level>
									<xsl:sequence select="fn:string(.)"/>
								</classification-level>
							</xsl:for-each>
							<xsl:for-each select="pat:Section">
								<section>
									<xsl:sequence select="fn:string(.)"/>
								</section>
							</xsl:for-each>
							<xsl:for-each select="pat:Class">
								<class>
									<xsl:sequence select="fn:string(.)"/>
								</class>
							</xsl:for-each>
							<xsl:for-each select="pat:Subclass">
								<subclass>
									<xsl:sequence select="fn:string(.)"/>
								</subclass>
							</xsl:for-each>
							<xsl:for-each select="pat:MainGroup">
								<main-group>
									<xsl:sequence select="fn:string(.)"/>
								</main-group>
							</xsl:for-each>
							<xsl:for-each select="pat:Subgroup">
								<subgroup>
									<xsl:sequence select="fn:string(.)"/>
								</subgroup>
							</xsl:for-each>
							<xsl:for-each select="com:SymbolPositionCode">
								<symbol-position>
									<xsl:sequence select="fn:string(.)"/>
								</symbol-position>
							</xsl:for-each>
							<xsl:for-each select="pat:IPCClassificationValueCode">
								<classification-value>
									<xsl:sequence select="fn:string(.)"/>
								</classification-value>
							</xsl:for-each>
							<action-date>
								<xsl:for-each select="pat:ActionDate">
									<date>
										<xsl:sequence select="fn:string(.)"/>
									</date>
								</xsl:for-each>
							</action-date>
							<generating-office>
								<xsl:for-each select="pat:GeneratingOfficeCode">
									<country>
										<xsl:sequence select="fn:string(.)"/>
									</country>
								</xsl:for-each>
							</generating-office>
							<xsl:for-each select="pat:IPCClassificationStatusCode">
								<classification-status>
									<xsl:sequence select="fn:string(.)"/>
								</classification-status>
							</xsl:for-each>
							<xsl:for-each select="pat:PatentClassificationDataSourceCode">
								<classification-data-source>
									<xsl:sequence select="fn:string(.)"/>
								</classification-data-source>
							</xsl:for-each>
							<xsl:for-each select="pat:PatentClassificationText">
								<text>
									<xsl:sequence select="fn:string(.)"/>
								</text>
							</xsl:for-each>
						</classification-ipcr>
					</xsl:for-each>
				</classifications-ipcr>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PatentClassificationBag/pat:NationalClassification">
				<xsl:variable name="var1_resultof_ST__NationalClassitificationToST__classification_national" as="node()?">
					<xsl:call-template name="WIPO:ST96NationalClassitificationToST36classification-national">
						<xsl:with-param name="NationalClassification" as="node()">
							<pat:NationalClassification>
								<xsl:sequence select="(./@node(), ./node())"/>
							</pat:NationalClassification>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_ST__NationalClassitificationToST__classification_national">
					<classification-national>
						<xsl:sequence select="(./@node(), ./node())"/>
					</classification-national>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PatentClassificationBag/com:LocarnoClassificationBag">
				<xsl:variable name="var2_LocarnoClassification" as="node()*" select="com:LocarnoClassification"/>
				<classification-locarno>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<edition>
						<xsl:sequence select="fn:string(com:LocarnoClassificationEdition)"/>
					</edition>
					<xsl:for-each select="$var2_LocarnoClassification">
						<main-classification>
							<xsl:sequence select="()"/>
						</main-classification>
					</xsl:for-each>
					<xsl:for-each select="$var2_LocarnoClassification">
						<further-classification>
							<xsl:sequence select="()"/>
						</further-classification>
					</xsl:for-each>
					<xsl:for-each select="com:LocarnoClassificationText">
						<text>
							<xsl:sequence select="fn:string(.)"/>
						</text>
					</xsl:for-each>
				</classification-locarno>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData">
				<xsl:variable name="var3_ApplicationIdentification" as="node()" select="pat:ApplicationIdentification"/>
				<application-reference>
					<xsl:for-each select="$var3_ApplicationIdentification/@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="$var3_ApplicationIdentification/pat:InventionSubjectMatterCategory">
						<xsl:attribute name="appl-type" select="fn:string(.)"/>
					</xsl:for-each>
					<document-id>
						<country>
							<xsl:sequence select="fn:string($var3_ApplicationIdentification/com:IPOfficeCode)"/>
						</country>
						<xsl:for-each select="$var3_ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText">
							<doc-number>
								<xsl:sequence select="fn:string(.)"/>
							</doc-number>
						</xsl:for-each>
						<xsl:for-each select="$var3_ApplicationIdentification/pat:ApplicationFilingCategory">
							<kind>
								<xsl:sequence select="fn:string(.)"/>
							</kind>
						</xsl:for-each>
						<xsl:for-each select="$var3_ApplicationIdentification/pat:FilingDate">
							<date>
								<xsl:sequence select="fn:string(.)"/>
							</date>
						</xsl:for-each>
					</document-id>
				</application-reference>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/com:FilingLanguageCode">
				<language-of-filing>
					<xsl:sequence select="fn:string(.)"/>
				</language-of-filing>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/com:PublicationLanguageCode">
				<language-of-publication>
					<xsl:sequence select="fn:string(.)"/>
				</language-of-publication>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData">
				<xsl:variable name="var12_PartyBag" as="node()" select="pat:PartyBag"/>
				<parties>
					<xsl:for-each select="$var12_PartyBag/pat:ApplicantBag">
						<applicants>
							<xsl:for-each select="pat:Applicant">
								<applicant>
									<xsl:for-each select="@com:sequenceNumber">
										<xsl:attribute name="sequence" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="pat:ApplicantCategory">
										<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
											<xsl:call-template name="vmf:vmf1_inputtoresult">
												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var4_resultof_vmf__inputtoresult">
											<xsl:attribute name="app-type" select="."/>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="pat:DesignationCategory">
										<xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
											<xsl:call-template name="vmf:vmf2_inputtoresult">
												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var5_resultof_vmf__inputtoresult">
											<xsl:attribute name="designation" select="."/>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="com:PublicationContact">
										<xsl:variable name="var6_resultof_ST__PublicationContactToST__address_book" as="node()?">
											<xsl:call-template name="WIPO:ST96PublicationContactToST36address-book">
												<xsl:with-param name="PublicationContact" as="node()">
													<com:PublicationContact>
														<xsl:sequence select="(./@node(), ./node())"/>
													</com:PublicationContact>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var6_resultof_ST__PublicationContactToST__address_book">
											<addressbook>
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="com:NationalityCode">
										<nationality>
											<country>
												<xsl:sequence select="fn:string(.)"/>
											</country>
										</nationality>
									</xsl:for-each>
									<xsl:for-each select="com:ResidenceCountryCode">
										<residence>
											<country>
												<xsl:sequence select="fn:string(.)"/>
											</country>
										</residence>
									</xsl:for-each>
									<xsl:for-each select="pat:SuccessorRights">
										<us-rights>
											<xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
												<xsl:call-template name="vmf:vmf3_inputtoresult">
													<xsl:with-param name="input" select="fn:string(pat:SuccessorCategory)" as="xs:string"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:for-each select="$var7_resultof_vmf__inputtoresult">
												<xsl:attribute name="kind" select="."/>
											</xsl:for-each>
											<xsl:for-each select="pat:SuccessorRightsText">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</us-rights>
									</xsl:for-each>
								</applicant>
							</xsl:for-each>
						</applicants>
					</xsl:for-each>
					<xsl:for-each select="$var12_PartyBag/pat:InventorBag">
						<inventors>
							<xsl:for-each select="pat:Inventor">
								<inventor>
									<xsl:for-each select="@com:sequenceNumber">
										<xsl:attribute name="sequence" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="com:PublicationContact">
										<xsl:variable name="var8_resultof_ST__PublicationContactToST__address_book" as="node()?">
											<xsl:call-template name="WIPO:ST96PublicationContactToST36address-book">
												<xsl:with-param name="PublicationContact" as="node()">
													<com:PublicationContact>
														<xsl:sequence select="(./@node(), ./node())"/>
													</com:PublicationContact>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var8_resultof_ST__PublicationContactToST__address_book">
											<addressbook>
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:for-each>
									</xsl:for-each>
								</inventor>
							</xsl:for-each>
						</inventors>
					</xsl:for-each>
					<xsl:for-each select="$var12_PartyBag/com:CorrespondenceAddress">
						<correspondence-address>
							<xsl:for-each select="com:Contact">
								<xsl:variable name="var9_Name" as="node()?" select="com:Name"/>
								<addressbook>
									<xsl:for-each select="@com:languageCode">
										<xsl:attribute name="lang" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:NamePrefix">
										<prefix>
											<xsl:sequence select="fn:string(.)"/>
										</prefix>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName">
										<last-name>
											<xsl:sequence select="fn:string(com:LastName)"/>
										</last-name>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:OrganizationName">
										<orgname>
											<xsl:for-each select="(./com:OrganizationStandardName/node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</orgname>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:FirstName">
										<first-name>
											<xsl:sequence select="fn:string(.)"/>
										</first-name>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:MiddleName">
										<middle-name>
											<xsl:sequence select="fn:string(.)"/>
										</middle-name>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:FirstLastName">
										<first-last-name>
											<xsl:sequence select="fn:string(.)"/>
										</first-last-name>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:SecondLastName">
										<second-last-name>
											<xsl:sequence select="fn:string(.)"/>
										</second-last-name>
									</xsl:for-each>
									<xsl:for-each select="$var9_Name/com:PersonName/com:PersonStructuredName/com:NameSuffix">
										<suffix>
											<xsl:sequence select="fn:string(.)"/>
										</suffix>
									</xsl:for-each>
									<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
										<phone>
											<xsl:sequence select="fn:string(.)"/>
										</phone>
									</xsl:for-each>
									<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
										<email>
											<xsl:sequence select="fn:string(.)"/>
										</email>
									</xsl:for-each>
								</addressbook>
							</xsl:for-each>
						</correspondence-address>
					</xsl:for-each>
					<xsl:for-each select="$var12_PartyBag/pat:RegisteredPractitionerBag">
						<agents>
							<xsl:for-each select="pat:RegisteredPractitioner">
								<agent>
									<xsl:attribute name="sequence" select="fn:string(@com:sequenceNumber)"/>
									<xsl:variable name="var10_resultof_vmf__inputtoresult" as="xs:string?">
										<xsl:call-template name="vmf:vmf4_inputtoresult">
											<xsl:with-param name="input" select="fn:string(pat:RegisteredPractitionerCategory)" as="xs:string"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:for-each select="$var10_resultof_vmf__inputtoresult">
										<xsl:attribute name="rep-type" select="."/>
									</xsl:for-each>
									<xsl:for-each select="com:PublicationContact">
										<xsl:variable name="var11_resultof_ST__PublicationContactToST__address_book" as="node()?">
											<xsl:call-template name="WIPO:ST96PublicationContactToST36address-book">
												<xsl:with-param name="PublicationContact" as="node()">
													<com:PublicationContact>
														<xsl:sequence select="(./@node(), ./node())"/>
													</com:PublicationContact>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var11_resultof_ST__PublicationContactToST__address_book">
											<addressbook>
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:for-each>
									</xsl:for-each>
								</agent>
							</xsl:for-each>
						</agents>
					</xsl:for-each>
				</parties>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:StateDesignation">
				<designation-of-states>
					<designation-pct>
						<xsl:for-each select="pat:NationalDesignation">
							<regional>
								<xsl:for-each select="com:DesignatedCountryCode">
									<country>
										<xsl:sequence select="fn:string(.)"/>
									</country>
								</xsl:for-each>
								<xsl:for-each select="pat:ProtectionRequest">
									<protection-request>
										<xsl:for-each select="@pat:subsetIndicator">
											<xsl:variable name="var13_resultof_vmf__inputtoresult" as="xs:string?">
												<xsl:call-template name="vmf:vmf5_inputtoresult">
													<xsl:with-param name="input" select="xs:string(xs:boolean(fn:string(.)))" as="xs:string"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:for-each select="$var13_resultof_vmf__inputtoresult">
												<xsl:attribute name="subset" select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</protection-request>
								</xsl:for-each>
							</regional>
						</xsl:for-each>
					</designation-pct>
				</designation-of-states>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:InventionTitleBag/pat:InventionTitle">
				<xsl:variable name="var20_cur" as="node()" select="."/>
				<invention-title>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="@com:languageCode">
						<xsl:attribute name="lang" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="node()">
						<xsl:if test="fn:boolean(self::text())">
							<xsl:sequence select="fn:string(.)"/>
						</xsl:if>
						<xsl:variable name="var14_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:B)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var14_test_resultof_node_name_equal_qname">
							<b>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:for-each select="$var20_cur/com:SmallCapital">
									<smallcaps>
										<xsl:for-each select="(./node())[fn:boolean(self::text())]">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</smallcaps>
								</xsl:for-each>
							</b>
						</xsl:for-each>
						<xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:I)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
							<i>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</i>
						</xsl:for-each>
						<xsl:variable name="var16_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:U)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var16_test_resultof_node_name_equal_qname">
							<u>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</u>
						</xsl:for-each>
						<xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:O)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
							<o>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</o>
						</xsl:for-each>
						<xsl:variable name="var18_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:Sup)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var18_test_resultof_node_name_equal_qname">
							<sup>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</sup>
						</xsl:for-each>
						<xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
							<xsl:if test="fn:boolean(self::com:Sub)">
								<xsl:sequence select="."/>
							</xsl:if>
						</xsl:variable>
						<xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
							<sub>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</sub>
						</xsl:for-each>
					</xsl:for-each>
				</invention-title>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PartyBag/pat:AssigneeBag">
				<assignees>
					<xsl:for-each select="pat:Assignee">
						<assignee>
							<xsl:for-each select="com:PublicationContact">
								<xsl:variable name="var22_Name" as="node()" select="com:Name"/>
								<xsl:variable name="var21_PersonName" as="node()*" select="$var22_Name/com:PersonName"/>
								<addressbook>
									<xsl:for-each select="$var21_PersonName/com:PersonStructuredName">
										<last-name>
											<xsl:sequence select="fn:string(com:LastName)"/>
										</last-name>
									</xsl:for-each>
									<xsl:for-each select="$var22_Name/com:OrganizationName">
										<orgname>
											<xsl:for-each select="(./com:OrganizationStandardName/node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</orgname>
									</xsl:for-each>
									<xsl:for-each select="$var21_PersonName/com:PersonStructuredName/com:FirstName">
										<first-name>
											<xsl:sequence select="fn:string(.)"/>
										</first-name>
									</xsl:for-each>
									<address>
										<xsl:for-each select="com:CityName">
											<city>
												<xsl:sequence select="fn:string(.)"/>
											</city>
										</xsl:for-each>
										<xsl:for-each select="com:GeographicRegionName">
											<state>
												<xsl:sequence select="fn:string(.)"/>
											</state>
										</xsl:for-each>
										<xsl:for-each select="com:CountryCode">
											<country>
												<xsl:sequence select="fn:string(.)"/>
											</country>
										</xsl:for-each>
									</address>
								</addressbook>
							</xsl:for-each>
						</assignee>
					</xsl:for-each>
				</assignees>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:LicenceBag">
				<xsl:variable name="var24_Licence" as="node()+" select="pat:Licence"/>
				<licensee-data>
					<xsl:for-each select="$var24_Licence">
						<licensee>
							<xsl:sequence select="()"/>
						</licensee>
					</xsl:for-each>
					<attorney-or-agent>
						<xsl:for-each select="$var24_Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner">
							<xsl:variable name="var23_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf6_inputtoresult">
									<xsl:with-param name="input" select="fn:string(pat:RegisteredPractitionerCategory)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var23_resultof_vmf__inputtoresult">
								<xsl:attribute name="rep-type" select="."/>
							</xsl:for-each>
						</xsl:for-each>
					</attorney-or-agent>
					<xsl:for-each select="$var24_Licence/com:EffectiveCountryBag">
						<effective-in>
							<xsl:for-each select="com:CountryCode">
								<country>
									<xsl:sequence select="fn:string(.)"/>
								</country>
							</xsl:for-each>
						</effective-in>
					</xsl:for-each>
				</licensee-data>
			</xsl:for-each>
			<date-of-earliest-priority>
				<xsl:for-each select="$var31_BibliographicData/pat:EarliestPriorityApplication">
					<date>
						<xsl:sequence select="fn:string(pat:FilingDate)"/>
					</date>
				</xsl:for-each>
			</date-of-earliest-priority>
			<date-complete-specification-filed>
				<xsl:for-each select="$var31_BibliographicData/pat:CompleteSpecificationFilingDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-complete-specification-filed>
			<xsl:for-each select="$var31_BibliographicData/pat:FigureBag">
				<xsl:variable name="var25_resultof_ST__FigureBagToST__figures" as="node()?">
					<xsl:call-template name="WIPO:ST96FigureBagToST36figures">
						<xsl:with-param name="FigureBag" as="node()">
							<pat:FigureBag>
								<xsl:sequence select="(./@node(), ./node())"/>
							</pat:FigureBag>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var25_resultof_ST__FigureBagToST__figures">
					<figures>
						<xsl:sequence select="(./@node(), ./node())"/>
					</figures>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:ReferenceCitationBag">
				<xsl:variable name="var26_resultof_ST__ReferenceCitationBagToST__reference_cited" as="node()?">
					<xsl:call-template name="WIPO:ST96ReferenceCitationBagToST36reference-cited">
						<xsl:with-param name="ReferenceCitationBagType" as="node()">
							<pat:ReferenceCitationBagType>
								<xsl:sequence select="(./@node(), ./node())"/>
							</pat:ReferenceCitationBagType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var26_resultof_ST__ReferenceCitationBagToST__reference_cited">
					<references-cited>
						<xsl:sequence select="(./@node(), ./node())"/>
					</references-cited>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:PartyBag/pat:ExaminerBag">
				<examiners>
					<xsl:for-each select="pat:PrimaryExaminer">
						<xsl:variable name="var27_PersonName" as="node()*" select="com:Name/com:PersonName"/>
						<primary-examiner>
							<xsl:for-each select="$var27_PersonName/com:PersonStructuredName">
								<last-name>
									<xsl:sequence select="fn:string(com:LastName)"/>
								</last-name>
							</xsl:for-each>
							<xsl:for-each select="$var27_PersonName/com:PersonStructuredName/com:FirstName">
								<first-name>
									<xsl:sequence select="fn:string(.)"/>
								</first-name>
							</xsl:for-each>
						</primary-examiner>
					</xsl:for-each>
					<xsl:for-each select="pat:AssistantExaminer">
						<xsl:variable name="var28_PersonName" as="node()*" select="com:Name/com:PersonName"/>
						<assistant-examiner>
							<xsl:for-each select="$var28_PersonName/com:PersonStructuredName">
								<last-name>
									<xsl:sequence select="fn:string(com:LastName)"/>
								</last-name>
							</xsl:for-each>
							<xsl:for-each select="$var28_PersonName/com:PersonStructuredName/com:FirstName">
								<first-name>
									<xsl:sequence select="fn:string(.)"/>
								</first-name>
							</xsl:for-each>
						</assistant-examiner>
					</xsl:for-each>
					<xsl:for-each select="pat:AuthorizedOfficer">
						<authorized-officer>
							<name>
								<xsl:sequence select="()"/>
							</name>
						</authorized-officer>
					</xsl:for-each>
				</examiners>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:ClaimTotalQuantity">
				<number-of-claims>
					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
				</number-of-claims>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:RelatedDocumentBag">
				<xsl:variable name="var29_resultof_ST__RelatedDocumentBagToST__related_document" as="node()?">
					<xsl:call-template name="WIPO:ST96RelatedDocumentBagToST36related-document">
						<xsl:with-param name="RelatedDocumentBagType" as="node()">
							<pat:RelatedDocumentBagType>
								<xsl:sequence select="(./@node(), ./node())"/>
							</pat:RelatedDocumentBagType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var29_resultof_ST__RelatedDocumentBagToST__related_document">
					<related-documents>
						<xsl:sequence select="(./@node(), ./node())"/>
					</related-documents>
				</xsl:for-each>
			</xsl:for-each>
			<date-exhibition-filed>
				<xsl:for-each select="$var31_BibliographicData/pat:ExhibitionFilingDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-exhibition-filed>
			<xsl:for-each select="$var31_BibliographicData/pat:PCTNationalPhaseEntryDate">
				<date-pct-article-22-39-fulfilled>
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</date-pct-article-22-39-fulfilled>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/com:BioDeposit">
				<bio-deposit>
					<xsl:for-each select="@com:id">
						<xsl:attribute name="id" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="@com:sequenceNumber">
						<xsl:attribute name="num" select="fn:string(.)"/>
					</xsl:for-each>
					<depositary>
						<xsl:for-each select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress">
							<address>
								<xsl:sequence select="()"/>
							</address>
						</xsl:for-each>
					</depositary>
					<bio-accno>
						<xsl:sequence select="fn:string(com:BiologicalAccessionNumber)"/>
					</bio-accno>
				</bio-deposit>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:InternationalFilingData">
				<xsl:variable name="var30_ApplicationIdentification" as="node()" select="pat:ApplicationIdentification"/>
				<pct-or-regional-filing-data>
					<document-id>
						<xsl:for-each select="$var30_ApplicationIdentification/com:FilingLanguageCode">
							<xsl:attribute name="lang" select="fn:string(.)"/>
						</xsl:for-each>
						<country>
							<xsl:sequence select="fn:string($var30_ApplicationIdentification/com:IPOfficeCode)"/>
						</country>
						<xsl:for-each select="$var30_ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText">
							<doc-number>
								<xsl:sequence select="fn:string(.)"/>
							</doc-number>
						</xsl:for-each>
						<xsl:for-each select="$var30_ApplicationIdentification/pat:FilingDate">
							<date>
								<xsl:sequence select="fn:string(.)"/>
							</date>
						</xsl:for-each>
					</document-id>
				</pct-or-regional-filing-data>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:InternationalPublishingData">
				<pct-or-regional-publishing-data>
					<xsl:for-each select="pat:PatentDocumentIdentification/pat:PatentPublicationIdentification">
						<document-id>
							<xsl:for-each select="com:PublicationLanguageCode">
								<xsl:attribute name="lang" select="fn:string(.)"/>
							</xsl:for-each>
							<country>
								<xsl:sequence select="fn:string(com:IPOfficeCode)"/>
							</country>
							<doc-number>
								<xsl:sequence select="fn:string(pat:PublicationNumber)"/>
							</doc-number>
							<xsl:for-each select="com:PatentDocumentKindCode">
								<kind>
									<xsl:sequence select="fn:string(.)"/>
								</kind>
							</xsl:for-each>
							<xsl:for-each select="com:PublicationDate">
								<date>
									<xsl:sequence select="fn:string(.)"/>
								</date>
							</xsl:for-each>
						</document-id>
					</xsl:for-each>
				</pct-or-regional-publishing-data>
			</xsl:for-each>
			<date-rights-reestablished>
				<xsl:for-each select="$var31_BibliographicData/pat:RightsReestablishedDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-rights-reestablished>
			<date-application-withdrawn-by-applicant>
				<xsl:for-each select="$var31_BibliographicData/pat:ApplicationWithdrawnDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-application-withdrawn-by-applicant>
			<date-application-deemed-withdrawn>
				<xsl:for-each select="$var31_BibliographicData/pat:ApplicationDeemedWithdrawnDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-application-deemed-withdrawn>
			<date-of-revocation>
				<xsl:for-each select="$var31_BibliographicData/pat:PatentRevocationDate">
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</xsl:for-each>
			</date-of-revocation>
			<xsl:for-each select="$var31_BibliographicData/pat:ApplicationPartiallyWithdrawnDate">
				<date-application-partially-withdrawn>
					<date>
						<xsl:sequence select="fn:string(.)"/>
					</date>
				</date-application-partially-withdrawn>
			</xsl:for-each>
			<xsl:for-each select="$var31_BibliographicData/pat:OppositionData">
				<opposition-data>
					<xsl:sequence select="()"/>
				</opposition-data>
			</xsl:for-each>
		</bibliographic-data>
	</xsl:template>
</xsl:stylesheet>
