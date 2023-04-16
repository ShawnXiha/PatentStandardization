<xsl:stylesheet version="2.0"

                xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO"
                xmlns:mathml="http://www.w3.org/1998/Math/MathML"
                xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:jpcom="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPCommon"
                xmlns:jppat="http://www.jpo.go.jp/standards/XMLSchema/ST96/JPPatent">
    <!--                exclude-result-prefixes="WIPO vmf xs fn jpcom jppat pat com xsd"-->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="jpcom:*" priority="2">
        <xsl:element name="com:{local-name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="jppat:*" priority="2">
        <xsl:element name="pat:{local-name()}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="application_kind_format">
        <xsl:param name="input" select="()"/>
        <xsl:choose>
            <xsl:when test="$input=('National', 'Patent', 'Utility model')">
                <xsl:copy-of select="'National'"/>
            </xsl:when>
            <xsl:when test="$input='Regional'">
                <xsl:copy-of select="'Regional'"/>
            </xsl:when>
            <xsl:when test="$input=('International','PCT')">
                <xsl:copy-of select="'PCT'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*:Contact" priority="9">
    <xsl:variable name="var1_address"  select=".//*:EntityName|.//*:PostalAddressText"/>
    <com:PublicationContact>
        <com:Name>
            <xsl:for-each select="$var1_address">
                <com:EntityName>
                    <xsl:sequence select="fn:string(.)"/>
                </com:EntityName>
            </xsl:for-each>
        </com:Name>
    </com:PublicationContact>
   </xsl:template>


    <xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
    <xsl:template match="/">
        <pat:PatentPublication com:languageCode="ja" com:st96Version="V3_1"
                               xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                               xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
                               xmlns:mathml="http://www.w3.org/1998/Math/MathML"
                               xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
            <xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance"
                           select="'http://www.wipo.int/standards/XMLSchema/ST96/Patent /data/xq/st96/schema/ST96XMLSchema_V3_1_Flattened_Updated/PatentPublication_V3_1.xsd'"/>

            <com:IPOfficeCode>JP</com:IPOfficeCode>
            <xsl:variable name="var71_bibliographic_data"  
                          select=".//*[ends-with(name(),'BibliographicData')]|.//*[ends-with(name(),'CorrectionHeader')]|.//*[ends-with(name(),'AmendmentHeader')]"/>
            <xsl:variable name="p_or_h" select=".//*:P|.//*:Heading"/>
            <xsl:variable name="claims"  select=".//*:Claims"/>
            <xsl:variable name="claim" select=".//*:Claim"/>
            <xsl:variable name="abstract"  select=".//*:Abstract"/>
            <xsl:variable name="description" select=".//*:Description"/>
            <xsl:variable name="drawings" select=".//*:Drawings"/>
            <pat:BibliographicData com:st96Version="V3_1" com:officeCode="JP">

                <xsl:for-each select="$var71_bibliographic_data">
                    <xsl:for-each select="@*:id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="$var71_bibliographic_data">
                    <xsl:variable name="var70_cur"    select="."/>
                    <xsl:variable name="var2_publication_reference"   
                                  select="*:PatentPublicationIdentification"/>
                    <xsl:variable name="var3_kind_code" select="pat:PlainLanguageDesignationText"/>
                    <xsl:variable name="var4_ApplicationIdentification" select="*:ApplicationIdentification"/>
                    <xsl:variable name="var5_title" select="*:InventionTitle"/>
                    <xsl:variable name="var6_party" select=".//*[ends-with(name(),'PartyBag')]"/>
                    <xsl:variable name="var7_applicant" select="$var6_party//*:Applicant"/>
                    <xsl:variable name="var8_inventor" select="$var6_party//*:Inventor"/>
                    <xsl:variable name="var9_agent" select="$var6_party//*:RegisteredPractitioner"/>
                    <xsl:variable name="var10_priority_claim" select="*:PriorityClaimBag"/>
                    <xsl:variable name="var11_ipc" select="jppat:IPCClassification"/>
                    <xsl:variable name="var12_nationalClassification" select="jppat:NationalClassification"/>
                    <xsl:variable name="var13_StateDesignation" select="*:StateDesignation"/>
                    <xsl:variable name="var14_InternationalFilingData"  select="*:InternationalFilingData"/>
                    <xsl:variable name="var15_InternationalPublishingData"
                                  select="*:InternationalPublishingData"/>
                    <xsl:variable name="var16_NationalStageFilingDate" select="*:NationalStageFilingDate"/>
                    <xsl:variable name="var17_NoveltyLackBag" select="*:NoveltyLackBag"/>
                    <xsl:variable name="var18_PublicOrderMoralityBag" select="*:PublicOrderMoralityBag"/>
                    <xsl:variable name="var19_IndustrialRevitalizingLawEntry"
                                  select="*:IndustrialRevitalizingLawEntry"/>
                    <xsl:variable name="var22_RelatedDocumentBag" select="*:RelatedDocumentBag"/>
                    <xsl:for-each select="$var2_publication_reference">
                        <pat:PatentPublicationIdentification>
                            <xsl:apply-templates select="@*|node()"/>
                            <xsl:for-each select="$var3_kind_code">
                                <com:PatentDocumentKindCode>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:PatentDocumentKindCode>
                            </xsl:for-each>
                        </pat:PatentPublicationIdentification>
                    </xsl:for-each>
                    <xsl:for-each select="$var4_ApplicationIdentification">
                        <pat:ApplicationIdentification>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:ApplicationIdentification>
                    </xsl:for-each>

                    <xsl:for-each select="$var5_title">
                        <pat:InventionTitleBag>
                            <pat:InventionTitle>
                                <xsl:sequence select="fn:string(.)"/>
                            </pat:InventionTitle>
                        </pat:InventionTitleBag>
                    </xsl:for-each>
                    <xsl:for-each select="$var6_party">
                        <pat:PartyBag>
                            <pat:ApplicantBag>
                                <xsl:for-each select="$var7_applicant">
                                    <pat:Applicant>
                                        <xsl:apply-templates select="@*|node()"/>
                                    </pat:Applicant>
                                </xsl:for-each>
                            </pat:ApplicantBag>
                            <pat:InventorBag>
                                <xsl:for-each select="$var8_inventor">
                                    <pat:Inventor>
                                        <xsl:apply-templates select="@*|node()"/>
                                    </pat:Inventor>
                                </xsl:for-each>
                            </pat:InventorBag>
                            <pat:RegisteredPractitionerBag>
                                <xsl:for-each select="$var9_agent">
                                    <pat:RegisteredPractitioner>
                                        <xsl:attribute name="com:sequenceNumber" select="@*:sequenceNumber"/>
                                        <xsl:for-each select="*:RegisteredPractitionerRegistrationNumber">
                                            <pat:RegisteredPractitionerRegistrationNumber>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:RegisteredPractitionerRegistrationNumber>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:RegisteredPractitionerCategory">
                                            <pat:RegisteredPractitionerCategory>
                                                <xsl:apply-templates select="@*|node()"/>
                                            </pat:RegisteredPractitionerCategory>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:Contact">
                                            <com:PublicationContact>
                                                <xsl:apply-templates select="@*|node()"/>
                                            </com:PublicationContact>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:PublicationContact">
                                            <com:PublicationContact>
                                                <xsl:apply-templates select="@*|node()"/>
                                            </com:PublicationContact>
                                        </xsl:for-each>
                                    </pat:RegisteredPractitioner>
                                </xsl:for-each>

                            </pat:RegisteredPractitionerBag>
                        </pat:PartyBag>
                        <xsl:for-each select="$var10_priority_claim">
                            <pat:PriorityClaimBag>
                                <xsl:for-each select="*:PriorityClaim">
                                    <pat:PriorityClaim>
                                        <xsl:attribute name="com:sequenceNumber" select="@*:sequenceNumber"/>
                                        <xsl:for-each select="*:IPOfficeCode|
                                    *:ApplicationNumber|
                                    *:FilingDate|
                                    *:RequestedPriorityDocumentIndicator|
                                    *:AttachedPriorityDocumentIndicator|
                                    *:OnlineAvailablePriorityDocumentIndicator">
                                            <xsl:apply-templates select="."/>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:ApplicationFilingCategory">
                                            <pat:ApplicationFilingCategory>
                                                <xsl:call-template name="application_kind_format">
                                                    <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                                </xsl:call-template>
                                            </pat:ApplicationFilingCategory>
                                        </xsl:for-each>
                                    </pat:PriorityClaim>


                                </xsl:for-each>
                            </pat:PriorityClaimBag>
                        </xsl:for-each>

                    </xsl:for-each>

                    <pat:PatentClassificationBag>
                        <xsl:for-each select="$var11_ipc">
                            <pat:IPCClassification>
                                <xsl:for-each select="*:Edition|*:MainClassification|*:FurtherClassification">
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </pat:IPCClassification>
                        </xsl:for-each>
                        <xsl:for-each select="$var12_nationalClassification">
                            <pat:NationalClassification>
                                <xsl:for-each
                                        select="*:Edition|*:MainNationalClassification|*:FurtherNationalClassification">
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </pat:NationalClassification>
                        </xsl:for-each>
                    </pat:PatentClassificationBag>

                    <xsl:for-each select="$var13_StateDesignation">
                        <pat:StateDesignation>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:StateDesignation>
                    </xsl:for-each>
                    <xsl:for-each select="$var14_InternationalFilingData">
                        <pat:InternationalFilingData>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:InternationalFilingData>
                    </xsl:for-each>
                    <xsl:for-each select="$var15_InternationalPublishingData">
                        <pat:InternationalPublishingData>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:InternationalPublishingData>
                    </xsl:for-each>
                    <xsl:for-each select="$var17_NoveltyLackBag">
                        <pat:NoveltyLackBag>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:NoveltyLackBag>
                    </xsl:for-each>
                    <xsl:for-each select="$var18_PublicOrderMoralityBag">
                        <pat:PublicOrderMoralityBag>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:PublicOrderMoralityBag>
                    </xsl:for-each>
                    <xsl:for-each select="$var19_IndustrialRevitalizingLawEntry">
                        <pat:IndustrialRevitalizingLawEntry>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:IndustrialRevitalizingLawEntry>
                    </xsl:for-each>
                    <xsl:for-each select="$var22_RelatedDocumentBag">
                        <pat:RelatedDocumentBag>
                            <xsl:apply-templates select="@*|node()"/>
                        </pat:RelatedDocumentBag>
                    </xsl:for-each>
                </xsl:for-each>


            </pat:BibliographicData>
            <xsl:for-each select="$abstract">
                <pat:Abstract>

                    <xsl:apply-templates select="@*|node()"/>

                </pat:Abstract>
            </xsl:for-each>

            <xsl:for-each select="$description">
                <pat:Description>

                    <xsl:apply-templates select="@*|node()"/>

                </pat:Description>
            </xsl:for-each>

            <xsl:if test="not($description) and $p_or_h">
                <pat:Description>
                    <xsl:for-each select="$p_or_h">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:for-each>
                </pat:Description>
            </xsl:if>

            <xsl:for-each select="$claims">
                <pat:Claims>
                    <xsl:apply-templates select="@*|node()"/>
                </pat:Claims>
            </xsl:for-each>

            <xsl:if test="not($claims) and $claim">
                <pat:Claims>
                    <xsl:for-each select="$claim">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:for-each>
                </pat:Claims>
            </xsl:if>


            <xsl:for-each select="$drawings">
                <pat:Drawings>

                    <xsl:apply-templates select="@*|node()"/>

                </pat:Drawings>
            </xsl:for-each>
        </pat:PatentPublication>
    </xsl:template>

</xsl:stylesheet>