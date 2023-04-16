<xsl:stylesheet version="2.0" xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO"
                xmlns:mathml="http://www.w3.org/1998/Math/MathML" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                exclude-result-prefixes="WIPO vmf xs fn">
    <xsl:include href="a_value_mapping.xsl"/>
    <xsl:include href="b_value_mapping.xsl"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template name="WIPO:ST36bio-depositToST96BioDeposit-Bib">
        <xsl:param name="biodeposit" select="()"/>
        <xsl:variable name="var1_depositary" as="node()*" select="$biodeposit/depositary"/>
        <com:BioDeposit>
            <xsl:for-each select="$biodeposit/@id">
                <xsl:attribute name="id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                               select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/@num">
                <xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                               select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/@url">
                <xsl:attribute name="sourceURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                               select="xs:string(xs:anyURI(fn:string(.)))"/>
            </xsl:for-each>
            <xsl:for-each select="$var1_depositary">
                <com:BioDepositDepositary>
                    <xsl:sequence select="fn:string(.)"/>
                </com:BioDepositDepositary>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/*:bio-accno[fn:namespace-uri() eq '']">
                <com:BiologicalAccessionNumber>
                    <xsl:sequence select="fn:string(.)"/>
                </com:BiologicalAccessionNumber>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/*:date[fn:namespace-uri() eq '']">
                <com:BioDepositDate>
                    <xsl:sequence select="fn:string(.)"/>
                </com:BioDepositDate>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/*:term[fn:namespace-uri() eq '']">
                <com:BioDepositTermText>
                    <xsl:for-each
                            select="$var1_depositary/*:address[fn:namespace-uri() eq '']/*:text[fn:namespace-uri() eq '']">
                        <xsl:attribute name="languageCode"
                                       namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                       select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:sequence select="fn:string(.)"/>
                </com:BioDepositTermText>
            </xsl:for-each>
            <xsl:for-each select="$biodeposit/*:dtext[fn:namespace-uri() eq '']">
                <com:BioDepositText>
                    <xsl:sequence select="fn:string(.)"/>
                </com:BioDepositText>
            </xsl:for-each>
        </com:BioDeposit>
    </xsl:template>
    <xsl:template name="WIPO:ST36address-bookToST96PublicationContact">
        <xsl:param name="addressbook" select="()"/>
        <xsl:variable name="var1_address" as="node()*" select="$addressbook/address"/>
        <com:PublicationContact>
            <com:Name>
                <xsl:for-each select="$addressbook/*:last-name[fn:namespace-uri() eq '']">
                    <com:PersonName>
                        <com:PersonStructuredName>
                            <xsl:for-each select="$addressbook/*:prefix[fn:namespace-uri() eq '']">
                                <com:NamePrefix>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:NamePrefix>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:first-name[fn:namespace-uri() eq '']">
                                <com:FirstName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:FirstName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:middle-name[fn:namespace-uri() eq '']">
                                <com:MiddleName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:MiddleName>
                            </xsl:for-each>
                            <com:LastName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:LastName>
                            <xsl:for-each select="$addressbook/*:first-last-name[fn:namespace-uri() eq '']">
                                <com:FirstLastName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:FirstLastName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:second-last-name[fn:namespace-uri() eq '']">
                                <com:SecondLastName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:SecondLastName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:suffix[fn:namespace-uri() eq '']">
                                <com:NameSuffix>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:NameSuffix>
                            </xsl:for-each>
                        </com:PersonStructuredName>
                    </com:PersonName>
                </xsl:for-each>
                <xsl:for-each select="$addressbook/*:orgname[fn:namespace-uri() eq '']">
                    <com:OrganizationName>
                        <com:OrganizationStandardName>
                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:for-each>
                        </com:OrganizationStandardName>
                    </com:OrganizationName>
                </xsl:for-each>
                <xsl:for-each select="$addressbook/*:name[fn:namespace-uri() eq '']">
                    <com:EntityName>
                        <xsl:sequence select="fn:string(.)"/>
                    </com:EntityName>
                </xsl:for-each>
            </com:Name>
            <xsl:for-each select="$var1_address/*:city[fn:namespace-uri() eq '']">
                <com:CityName>
                    <xsl:sequence select="fn:string(.)"/>
                </com:CityName>
            </xsl:for-each>
            <xsl:for-each select="$var1_address/*:state[fn:namespace-uri() eq '']">
                <com:GeographicRegionName>
                    <xsl:sequence select="fn:string(.)"/>
                </com:GeographicRegionName>
            </xsl:for-each>
            <xsl:for-each select="$var1_address/*:country[fn:namespace-uri() eq '']">
                <com:CountryCode>
                    <xsl:sequence select="fn:string(.)"/>
                </com:CountryCode>
            </xsl:for-each>
            <xsl:for-each select="$var1_address/*:postcode[fn:namespace-uri() eq '']">
                <com:PostalCode>
                    <xsl:sequence select="fn:string(.)"/>
                </com:PostalCode>
            </xsl:for-each>
        </com:PublicationContact>
    </xsl:template>
    <xsl:template name="WIPO:ST36partiesToST96PartyBag">
        <xsl:param name="parties" select="()"/>
        <xsl:param name="assignees" select="()"/>
        <xsl:param name="examiners" select="()"/>
        <pat:PartyBag>
            <xsl:for-each select="$parties/applicants|$parties/cn-applicants">
                <pat:ApplicantBag>
                    <xsl:for-each select="applicant|cn-applicant">
                        <xsl:variable name="var4_sequence" as="node()?" select="@sequence"/>
                        <pat:Applicant>
                            <xsl:for-each select="$var4_sequence">
                                <xsl:attribute name="com:sequenceNumber"
                                               namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                               select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
                                <xsl:variable name="var1_resultof_ST__address_bookToST__PublicationContact"
                                              as="node()?">
                                    <xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact2">
                                        <xsl:with-param name="addressbook" as="node()">
                                            <addressbook xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </addressbook>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var1_resultof_ST__address_bookToST__PublicationContact">
                                    <com:PublicationContact
                                            xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:PublicationContact>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="name">
                                <com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                    <com:Name>
                                        <com:EntityName>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </com:EntityName>
                                    </com:Name>
                                </com:PublicationContact>
                            </xsl:for-each>
                            <pat:ApplicantCategory>
                                <xsl:call-template name="vmf:vmf_b_6_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(@app-type)" as="xs:string"/>
                                </xsl:call-template>
                            </pat:ApplicantCategory>

                            <xsl:for-each
                                    select="*:nationality[fn:namespace-uri() eq '']/*:country[fn:namespace-uri() eq '']">
                                <com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:NationalityCode>
                            </xsl:for-each>
                            <xsl:for-each select="@designation">
                                <xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_b_7_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var2_resultof_vmf__inputtoresult">
                                    <pat:DesignationCategory>
                                        <xsl:sequence select="."/>
                                    </pat:DesignationCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each
                                    select="*:residence[fn:namespace-uri() eq '']/*:country[fn:namespace-uri() eq '']">
                                <com:ResidenceCountryCode
                                        xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:ResidenceCountryCode>
                            </xsl:for-each>
                            <xsl:for-each select="*:cn-rights[fn:namespace-uri() eq '']">
                                <pat:SuccessorRights>
                                    <xsl:for-each select="$var4_sequence">
                                        <xsl:attribute name="applicantSequenceNumberReference"
                                                       namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                                                       select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <pat:SuccessorRightsText>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </pat:SuccessorRightsText>
                                    </xsl:for-each>
                                    <xsl:for-each select="@kind">
                                        <xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
                                            <xsl:call-template name="vmf:vmf8_inputtoresult">
                                                <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var3_resultof_vmf__inputtoresult">
                                            <pat:SuccessorCategory>
                                                <xsl:sequence select="."/>
                                            </pat:SuccessorCategory>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:SuccessorRights>
                            </xsl:for-each>
                        </pat:Applicant>
                    </xsl:for-each>
                </pat:ApplicantBag>
            </xsl:for-each>
            <xsl:for-each select="$parties/cn-inventors">
                <pat:InventorBag>
                    <xsl:for-each select="cn-inventor">
                        <xsl:variable name="var6_cur" as="node()" select="."/>
                        <pat:Inventor>
                            <xsl:for-each select="@sequence">
                                <xsl:attribute name="com:sequenceNumber"
                                               namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                               select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
                                <xsl:variable name="var5_resultof_ST__address_bookToST__PublicationContact"
                                              as="node()?">
                                    <xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact2">
                                        <xsl:with-param name="addressbook" as="node()">
                                            <addressbook xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </addressbook>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var5_resultof_ST__address_bookToST__PublicationContact">
                                    <com:PublicationContact
                                            xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:PublicationContact>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="name">
                                <com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                    <com:Name>
                                        <com:EntityName>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </com:EntityName>
                                    </com:Name>
                                </com:PublicationContact>
                            </xsl:for-each>
                            <xsl:for-each select="*:designated-states[fn:namespace-uri() eq '']">
                                <pat:StateDesignation>
                                    <xsl:for-each select="$var6_cur/@designation">
                                        <pat:NewDesignationCountryCode>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </pat:NewDesignationCountryCode>
                                    </xsl:for-each>
                                    <xsl:for-each select="*:country[fn:namespace-uri() eq '']">
                                        <pat:NationalDesignation>
                                            <com:DesignatedCountryCode
                                                    xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </com:DesignatedCountryCode>
                                        </pat:NationalDesignation>
                                    </xsl:for-each>
                                    <xsl:for-each select="*:region[fn:namespace-uri() eq '']">
                                        <pat:RegionalDesignation>
                                            <xsl:for-each select="*:country[fn:namespace-uri() eq '']">
                                                <com:DesignatedCountryCode
                                                        xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </com:DesignatedCountryCode>
                                            </xsl:for-each>
                                        </pat:RegionalDesignation>
                                    </xsl:for-each>
                                </pat:StateDesignation>
                            </xsl:for-each>
                        </pat:Inventor>
                    </xsl:for-each>
                </pat:InventorBag>
            </xsl:for-each>
            <xsl:for-each select="$assignees[assignee]">
                <pat:AssigneeBag>
                    <xsl:for-each select="$assignees/assignee">
                        <pat:Assignee>
                            <xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
                                <xsl:variable name="var7_resultof_ST__address_bookToST__PublicationContact"
                                              as="node()?">
                                    <xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
                                        <xsl:with-param name="addressbook" as="node()">
                                            <addressbook xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </addressbook>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var7_resultof_ST__address_bookToST__PublicationContact">
                                    <com:PublicationContact
                                            xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:PublicationContact>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:Assignee>
                    </xsl:for-each>
                </pat:AssigneeBag>
            </xsl:for-each>
            <xsl:for-each select="$parties/cn-agents[cn-agent]">
                <xsl:variable name="var10_cur" as="node()" select="."/>
                <pat:RegisteredPractitionerBag>
                    <xsl:for-each select="cn-agent[name, addressbook, agency]">
                        <pat:RegisteredPractitioner>
                            <xsl:for-each select="@sequence">
                                <xsl:attribute name="com:sequenceNumber"
                                               namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                               select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="$var10_cur/*:customer-number[fn:namespace-uri() eq '']">
                                <pat:RegisteredPractitionerRegistrationNumber>
                                    <xsl:sequence select="fn:string(.)"/>
                                </pat:RegisteredPractitionerRegistrationNumber>
                            </xsl:for-each>
                            <xsl:for-each select="@rep-type">
                                <xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf9_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var8_resultof_vmf__inputtoresult">
                                    <pat:RegisteredPractitionerCategory>
                                        <xsl:sequence select="."/>
                                    </pat:RegisteredPractitionerCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select=".//*:addressbook[fn:namespace-uri() eq '']">
                                <xsl:variable name="var9_resultof_ST__address_bookToST__PublicationContact"
                                              as="node()?">
                                    <xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
                                        <xsl:with-param name="addressbook" as="node()">
                                            <addressbook xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </addressbook>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var9_resultof_ST__address_bookToST__PublicationContact">
                                    <com:PublicationContact
                                            xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:PublicationContact>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="cn-agency/name|name">
                                <com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
                                    <com:Name>
                                        <com:EntityName>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </com:EntityName>
                                    </com:Name>
                                </com:PublicationContact>
                            </xsl:for-each>
                        </pat:RegisteredPractitioner>
                    </xsl:for-each>
                </pat:RegisteredPractitionerBag>
            </xsl:for-each>
        </pat:PartyBag>
    </xsl:template>
    <xsl:template name="WIPO:ST36address-bookToST96contact">
        <xsl:param name="addressbook" select="()"/>
        <xsl:variable name="var2_ead" as="node()*" select="$addressbook/ead"/>
        <com:Contact>
            <xsl:for-each select="$addressbook/@lang">
                <xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                               select="fn:string(.)"/>
            </xsl:for-each>
            <com:Name>
                <xsl:for-each select="$addressbook/*:last-name[fn:namespace-uri() eq '']">
                    <com:PersonName>
                        <com:PersonStructuredName>
                            <xsl:for-each select="$addressbook/*:prefix[fn:namespace-uri() eq '']">
                                <com:NamePrefix>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:NamePrefix>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:first-name[fn:namespace-uri() eq '']">
                                <com:FirstName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:FirstName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:middle-name[fn:namespace-uri() eq '']">
                                <com:MiddleName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:MiddleName>
                            </xsl:for-each>
                            <com:LastName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:LastName>
                            <xsl:for-each select="$addressbook/*:first-last-name[fn:namespace-uri() eq '']">
                                <com:FirstLastName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:FirstLastName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:second-last-name[fn:namespace-uri() eq '']">
                                <com:SecondLastName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:SecondLastName>
                            </xsl:for-each>
                            <xsl:for-each select="$addressbook/*:suffix[fn:namespace-uri() eq '']">
                                <com:NameSuffix>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:NameSuffix>
                            </xsl:for-each>
                        </com:PersonStructuredName>
                    </com:PersonName>
                </xsl:for-each>
                <xsl:for-each select="$addressbook/*:orgname[fn:namespace-uri() eq '']">
                    <com:OrganizationName>
                        <com:OrganizationStandardName>
                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:for-each>
                        </com:OrganizationStandardName>
                    </com:OrganizationName>
                </xsl:for-each>
                <xsl:for-each select="$addressbook/*:name[fn:namespace-uri() eq '']">
                    <com:EntityName>
                        <xsl:for-each select="$addressbook/*:role[fn:namespace-uri() eq '']">
                            <xsl:attribute name="entityNameCategory"
                                           namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                           select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:sequence select="fn:string(.)"/>
                    </com:EntityName>
                </xsl:for-each>
            </com:Name>
            <com:PostalAddressBag>
                <xsl:for-each select="$addressbook/*:address[fn:namespace-uri() eq '']">
                    <com:PostalAddress>
                        <com:PostalStructuredAddress>
                            <xsl:for-each select="*:address-1[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="sequenceNumber"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="xs:string(xs:decimal('1'))"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:address-4[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="sequenceNumber"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="xs:string(xs:decimal('4'))"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:address-2[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="sequenceNumber"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="xs:string(xs:decimal('2'))"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:address-3[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="sequenceNumber"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="xs:string(xs:decimal('3'))"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:address-5[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="sequenceNumber"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="xs:string(xs:decimal('5'))"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:pobox[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="addressLineCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'Postal office box'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:room[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="addressLineCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'Room'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:address-floor[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="addressLineCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'Floor'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:building[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="addressLineCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'Building'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:street[fn:namespace-uri() eq '']">
                                <com:AddressLineText>
                                    <xsl:attribute name="addressLineCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'Street'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:AddressLineText>
                            </xsl:for-each>
                            <xsl:for-each select="*:city[fn:namespace-uri() eq '']">
                                <com:CityName>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:CityName>
                            </xsl:for-each>
                            <xsl:for-each select="*:county[fn:namespace-uri() eq '']">
                                <com:GeographicRegionName>
                                    <xsl:attribute name="geographicRegionCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'County'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:GeographicRegionName>
                            </xsl:for-each>
                            <xsl:for-each select="*:state[fn:namespace-uri() eq '']">
                                <com:GeographicRegionName>
                                    <xsl:attribute name="geographicRegionCategory"
                                                   namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                                   select="'State'"/>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:GeographicRegionName>
                            </xsl:for-each>
                            <xsl:for-each select="*:country[fn:namespace-uri() eq '']">
                                <com:CountryCode>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:CountryCode>
                            </xsl:for-each>
                            <xsl:for-each select="*:mailcode[fn:namespace-uri() eq '']">
                                <com:PostalCode>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:PostalCode>
                            </xsl:for-each>
                            <xsl:for-each select="*:postcode[fn:namespace-uri() eq '']">
                                <com:PostalCode>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:PostalCode>
                            </xsl:for-each>
                        </com:PostalStructuredAddress>
                        <xsl:for-each select="*:text[fn:namespace-uri() eq '']">
                            <com:PostalAddressText>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:PostalAddressText>
                        </xsl:for-each>
                    </com:PostalAddress>
                </xsl:for-each>
            </com:PostalAddressBag>
            <xsl:for-each select="$addressbook/*:fax[fn:namespace-uri() eq '']">
                <com:FaxNumberBag>
                    <com:FaxNumber>
                        <xsl:sequence select="fn:string(.)"/>
                    </com:FaxNumber>
                </com:FaxNumberBag>
            </xsl:for-each>
            <xsl:for-each select="$addressbook/*:email[fn:namespace-uri() eq '']">
                <com:EmailAddressBag>
                    <com:EmailAddressText>
                        <xsl:for-each select="@email-purpose">
                            <xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf10_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var1_resultof_vmf___inputtoresult">
                                <xsl:attribute name="emailAddressPurposeCategory"
                                               namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                               select="."/>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:sequence select="fn:string(.)"/>
                    </com:EmailAddressText>
                </com:EmailAddressBag>
            </xsl:for-each>
            <xsl:for-each select="$addressbook/*:url[fn:namespace-uri() eq '']">
                <com:WebAddressBag>
                    <com:WebAddressURI>
                        <xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
                    </com:WebAddressURI>
                </com:WebAddressBag>
            </xsl:for-each>
            <xsl:for-each select="$addressbook/*:phone[fn:namespace-uri() eq '']">
                <com:PhoneNumberBag>
                    <com:PhoneNumber>
                        <xsl:for-each select="$var2_ead">
                            <xsl:attribute name="phoneNumberCategory"
                                           namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                                           select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:sequence select="fn:string(.)"/>
                    </com:PhoneNumber>
                </com:PhoneNumberBag>
            </xsl:for-each>
            <xsl:for-each select="$var2_ead">
                <com:OtherElectronicAddressBag>
                    <xsl:sequence select="()"/>
                </com:OtherElectronicAddressBag>
            </xsl:for-each>
        </com:Contact>
    </xsl:template>
    <xsl:template name="vmf:vmf8_inputtoresult">
        <xsl:param name="input" select="()"/>
        <xsl:choose>
            <xsl:when test="$input='heir'">
                <xsl:copy-of select="'Heir'"/>
            </xsl:when>
            <xsl:when test="$input='heiress'">
                <xsl:copy-of select="'Heiress'"/>
            </xsl:when>
            <xsl:when test="$input='executor'">
                <xsl:copy-of select="'Executor'"/>
            </xsl:when>
            <xsl:when test="$input='executrix'">
                <xsl:copy-of select="'Executrix'"/>
            </xsl:when>
            <xsl:when test="$input='estate'">
                <xsl:copy-of select="'Estate'"/>
            </xsl:when>
            <xsl:when test="$input='legal-representative'">
                <xsl:copy-of select="'Legal representative'"/>
            </xsl:when>
            <xsl:when test="$input='administrator'">
                <xsl:copy-of select="'Administrator'"/>
            </xsl:when>
            <xsl:when test="$input='administratrix '">
                <xsl:copy-of select="'Administratrix'"/>
            </xsl:when>
            <xsl:when test="$input='legal-representatives'">
                <xsl:copy-of select="'Legal representatives'"/>
            </xsl:when>
            <xsl:when test="$input='heirs'">
                <xsl:copy-of select="'Heirs'"/>
            </xsl:when>
            <xsl:when test="$input='executors'">
                <xsl:copy-of select="'Executors'"/>
            </xsl:when>
            <xsl:when test="$input='legal-heirs'">
                <xsl:copy-of select="'Legal heirs'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="vmf:vmf9_inputtoresult">
        <xsl:param name="input" select="()"/>
        <xsl:choose>
            <xsl:when test="$input='agent'">
                <xsl:copy-of select="'Agent'"/>
            </xsl:when>
            <xsl:when test="$input='attorney'">
                <xsl:copy-of select="'Attorney'"/>
            </xsl:when>
            <xsl:when test="$input='common-representative'">
                <xsl:copy-of select="'Common representative'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="vmf:vmf10_inputtoresult">
        <xsl:param name="input" select="()"/>
        <xsl:choose>
            <xsl:when test="$input='informal'">
                <xsl:copy-of select="'Informal'"/>
            </xsl:when>
            <xsl:when test="$input='general'">
                <xsl:copy-of select="'General'"/>
            </xsl:when>
            <xsl:when test="$input='advanced'">
                <xsl:copy-of select="'Advanced'"/>
            </xsl:when>
            <xsl:when test="$input='main'">
                <xsl:copy-of select="'Main'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="WIPO:ST36claim-textToST96ClaimText">
        <xsl:param name="claimtext" select="()"/>
        <pat:ClaimText>
            <xsl:for-each select="$claimtext/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:claim-text[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__claim_textToST__ClaimText" as="node()?">
                        <xsl:call-template name="WIPO:ST36claim-textToST96ClaimText">
                            <xsl:with-param name="claimtext" as="node()">
                                <claim-text xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </claim-text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__claim_textToST__ClaimText">
                        <pat:ClaimText>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </pat:ClaimText>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var12_resultof_ST__supToST__Sup" as="node()?">
                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                            <xsl:with-param name="sup" as="node()">
                                <sup xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var12_resultof_ST__supToST__Sup">
                        <com:Sup>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var14_resultof_ST__subToST__Sub" as="node()?">
                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                            <xsl:with-param name="sub" as="node()">
                                <sub xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var14_resultof_ST__subToST__Sub">
                        <com:Sub>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:img[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var16_resultof_ST__imgToST__Image" as="node()?">
                        <xsl:call-template name="WIPO:ST36imgToST96Image">
                            <xsl:with-param name="img" as="node()">
                                <img xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </img>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var16_resultof_ST__imgToST__Image">
                        <com:Image>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Image>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var18_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                            <xsl:with-param name="smallcaps" as="node()">
                                <smallcaps xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </smallcaps>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var18_resultof_ST__smallcapsToST__SmallCapitals">
                        <com:SmallCapital>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:SmallCapital>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:br[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
                    <com:Br>
                        <xsl:sequence select="()"/>
                    </com:Br>
                </xsl:for-each>
                <xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:pre[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var20_test_resultof_node_name_equal_qname">
                    <com:Pre>
                        <xsl:for-each select="@listing-type">
                            <xsl:attribute name="com:listingCategory" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                    </com:Pre>
                </xsl:for-each>
                <xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:maths[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var22_resultof_ST__mathsToST__Math" as="node()?">
                        <xsl:call-template name="WIPO:ST36mathsToST96Math">
                            <xsl:with-param name="maths" as="node()">
                                <maths xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </maths>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var22_resultof_ST__mathsToST__Math">
                        <com:Math>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Math>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:chemistry[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
                    <com:ChemicalFormulae>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@num">
                            <xsl:attribute name="com:chemicalFormulaeNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:img[fn:namespace-uri() eq '']">
                            <xsl:variable name="var24_resultof_ST__imgToST__Image" as="node()?">
                                <xsl:call-template name="WIPO:ST36imgToST96Image">
                                    <xsl:with-param name="img" as="node()">
                                        <img xmlns="">
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </img>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var24_resultof_ST__imgToST__Image">
                                <com:Image>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:Image>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="*:chem[fn:namespace-uri() eq '']">
                            <com:InlineFormula>
                                <xsl:sequence select="()"/>
                            </com:InlineFormula>
                        </xsl:for-each>
                    </com:ChemicalFormulae>
                </xsl:for-each>
                <xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:tables[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var26_resultof_ST__tablesToST__Table" as="node()?">
                        <xsl:call-template name="WIPO:ST36tablesToST96Table">
                            <xsl:with-param name="tables" as="node()">
                                <tables xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </tables>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var26_resultof_ST__tablesToST__Table">
                        <com:Table>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Table>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:claim-ref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
                    <pat:ClaimReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                            <xsl:sequence select="fn:string(.)"/>
                        </xsl:for-each>
                    </pat:ClaimReference>
                </xsl:for-each>
                <xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:figref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
                    <com:FigureReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var30_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var30_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var32_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var32_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var33_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var34_resultof_ST__oToST__O" as="node()?">
                                    <xsl:call-template name="WIPO:ST36oToST96O">
                                        <xsl:with-param name="o" as="node()">
                                            <o xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </o>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var34_resultof_ST__oToST__O">
                                    <com:O>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:O>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var36_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var36_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var37_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var38_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var38_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var39_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var39_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var40_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var40_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var41_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var41_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var42_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var42_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:FigureReference>
                </xsl:for-each>
                <xsl:variable name="var43_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:crossref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
                    <com:CrossReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var45_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var45_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var46_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var47_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var47_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var48_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var48_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var49_resultof_ST__oToST__O" as="node()?">
                                    <xsl:call-template name="WIPO:ST36oToST96O">
                                        <xsl:with-param name="o" as="node()">
                                            <o xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </o>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var49_resultof_ST__oToST__O">
                                    <com:O>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:O>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var50_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var50_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var51_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var51_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var52_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var52_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var53_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var53_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var54_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var54_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var55_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var55_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var56_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var56_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var57_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var57_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:CrossReference>
                </xsl:for-each>
            </xsl:for-each>
        </pat:ClaimText>
    </xsl:template>
    <xsl:template name="WIPO:ST36tablesToST96Table">
        <xsl:param name="tables" select="()"/>
        <com:Table>
            <xsl:for-each select="$tables/*:table[fn:namespace-uri() eq '']">
                <com:IPOASISTable>
                    <xsl:for-each select="@frame">
                        <xsl:attribute name="tbl:frame" namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                       select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@colsep">
                        <xsl:attribute name="tbl:colsep" namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                       select="xs:string(xs:boolean(fn:string(.)))"/>
                    </xsl:for-each>
                    <xsl:for-each select="@rowsep">
                        <xsl:attribute name="tbl:rowsep" namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                       select="xs:string(xs:boolean(fn:string(.)))"/>
                    </xsl:for-each>
                    <xsl:for-each select="$tables/@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="$tables/@num">
                        <xsl:attribute name="com:tableNumber" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@pgwide">
                        <xsl:attribute name="com:pageWide" select="xs:string(xs:decimal(fn:string(.)))"/>
                    </xsl:for-each>
                    <xsl:for-each select="*:title[fn:namespace-uri() eq '']">
                        <com:TableTitle>
                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="*:b[fn:namespace-uri() eq '']">
                                <xsl:variable name="var1_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var1_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="*:i[fn:namespace-uri() eq '']">
                                <xsl:variable name="var2_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var2_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="*:u[fn:namespace-uri() eq '']">
                                <xsl:variable name="var3_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var3_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="*:sub[fn:namespace-uri() eq '']">
                                <xsl:variable name="var4_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var4_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="*:sup[fn:namespace-uri() eq '']">
                                <xsl:variable name="var5_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var5_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="*:smallcaps[fn:namespace-uri() eq '']">
                                <xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var6_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </com:TableTitle>
                    </xsl:for-each>
                    <xsl:for-each select="*:tgroup[fn:namespace-uri() eq '']">
                        <com:TableGroup>
                            <xsl:for-each select="@cols">
                                <xsl:attribute name="tbl:cols" namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                               select="xs:string(xs:integer(fn:string(.)))"/>
                            </xsl:for-each>
                            <xsl:for-each select="@colsep">
                                <xsl:attribute name="tbl:colsep"
                                               namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                               select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                            <xsl:for-each select="@rowsep">
                                <xsl:attribute name="tbl:rowsep"
                                               namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                               select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                            <xsl:for-each select="@align">
                                <xsl:attribute name="tbl:align"
                                               namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                               select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="*:colspec[fn:namespace-uri() eq '']">
                                <tbl:colspec xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0">
                                    <xsl:for-each select="@colnum">
                                        <xsl:attribute name="tbl:colnum" select="xs:string(xs:integer(fn:string(.)))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@colname">
                                        <xsl:attribute name="tbl:colname" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@colwidth">
                                        <xsl:attribute name="tbl:colwidth" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@colsep">
                                        <xsl:attribute name="tbl:colsep" select="xs:string(xs:boolean(fn:string(.)))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@rowsep">
                                        <xsl:attribute name="tbl:rowsep" select="xs:string(xs:boolean(fn:string(.)))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@align">
                                        <xsl:attribute name="tbl:align" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@char">
                                        <xsl:attribute name="tbl:char" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@charoff">
                                        <xsl:attribute name="tbl:charoff" select="fn:string(.)"/>
                                    </xsl:for-each>
                                </tbl:colspec>
                            </xsl:for-each>
                            <xsl:for-each select="*:thead[fn:namespace-uri() eq '']">
                                <tbl:thead xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0">
                                    <xsl:for-each select="@valign">
                                        <xsl:attribute name="tbl:valign" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="*:row[fn:namespace-uri() eq '']">
                                        <tbl:row>
                                            <xsl:for-each select="@rowsep">
                                                <xsl:attribute name="tbl:rowsep"
                                                               select="xs:string(xs:boolean(fn:string(.)))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@valign">
                                                <xsl:attribute name="tbl:valign" select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </tbl:row>
                                    </xsl:for-each>
                                </tbl:thead>
                            </xsl:for-each>
                            <xsl:for-each select="*:tbody[fn:namespace-uri() eq '']">
                                <com:TableBody>
                                    <xsl:for-each select="@valign">
                                        <xsl:attribute name="tbl:valign"
                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                       select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="*:row[fn:namespace-uri() eq '']">
                                        <com:Row>
                                            <xsl:for-each select="@rowsep">
                                                <xsl:attribute name="tbl:rowsep"
                                                               namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                               select="xs:string(xs:boolean(fn:string(.)))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@valign">
                                                <xsl:attribute name="tbl:valign"
                                                               namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                               select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="*:entry[fn:namespace-uri() eq '']">
                                                <com:Entry>
                                                    <xsl:for-each select="@colname">
                                                        <xsl:attribute name="tbl:colname"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@namest">
                                                        <xsl:attribute name="tbl:namest"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@nameend">
                                                        <xsl:attribute name="tbl:nameend"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@morerows">
                                                        <xsl:attribute name="tbl:morerows"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="xs:string(xs:integer(fn:string(.)))"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@colsep">
                                                        <xsl:attribute name="tbl:colsep"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="xs:string(xs:boolean(fn:string(.)))"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@rowsep">
                                                        <xsl:attribute name="tbl:rowsep"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="xs:string(xs:boolean(fn:string(.)))"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@align">
                                                        <xsl:attribute name="tbl:align"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@char">
                                                        <xsl:attribute name="tbl:char"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@charoff">
                                                        <xsl:attribute name="tbl:charoff"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="@valign">
                                                        <xsl:attribute name="tbl:valign"
                                                                       namespace="http://www.oasis-open.org/tables/exchange/1.0"
                                                                       select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="node()">
                                                        <xsl:if test="fn:boolean(self::text())">
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </xsl:if>
                                                        <xsl:variable name="var7_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var7_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var8_resultof_ST__bToST__B"
                                                                          as="node()*">
                                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                                    <xsl:with-param name="b" as="node()">
                                                                        <b xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </b>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var8_resultof_ST__bToST__B">
                                                                <com:B>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:B>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var9_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var9_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var10_resultof_ST__iToST__I"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                                    <xsl:with-param name="i" as="node()">
                                                                        <i xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </i>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var10_resultof_ST__iToST__I">
                                                                <com:I>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:I>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var11_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var11_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var12_resultof_ST__uToST__U"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                                    <xsl:with-param name="u" as="node()">
                                                                        <u xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </u>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var12_resultof_ST__uToST__U">
                                                                <com:U>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:U>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var13_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var13_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var14_resultof_ST__supToST__Sup"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                                    <xsl:with-param name="sup" as="node()">
                                                                        <sup xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </sup>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var14_resultof_ST__supToST__Sup">
                                                                <com:Sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:Sup>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var15_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var15_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var16_resultof_ST__subToST__Sub"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                                    <xsl:with-param name="sub" as="node()">
                                                                        <sub xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </sub>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var16_resultof_ST__subToST__Sub">
                                                                <com:Sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:Sub>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var17_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:img[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var17_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var18_resultof_ST__imgToST__Image"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36imgToST96Image">
                                                                    <xsl:with-param name="img" as="node()">
                                                                        <img xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </img>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var18_resultof_ST__imgToST__Image">
                                                                <com:Image>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:Image>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var19_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var19_test_resultof_node_name_equal_qname">
                                                            <xsl:variable
                                                                    name="var20_resultof_ST__smallcapsToST__SmallCapitals"
                                                                    as="node()?">
                                                                <xsl:call-template
                                                                        name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                                    <xsl:with-param name="smallcaps" as="node()">
                                                                        <smallcaps xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </smallcaps>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each
                                                                    select="$var20_resultof_ST__smallcapsToST__SmallCapitals">
                                                                <com:SmallCapital>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:SmallCapital>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var21_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:br[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var21_test_resultof_node_name_equal_qname">
                                                            <com:Br>
                                                                <xsl:sequence select="()"/>
                                                            </com:Br>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var22_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:ul[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var22_test_resultof_node_name_equal_qname">
                                                            <com:UL>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@list-style">
                                                                    <xsl:attribute name="com:ulStyle"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:li[fn:namespace-uri() eq '']">
                                                                    <xsl:variable name="var23_resultof_ST__liToST__LI"
                                                                                  as="node()?">
                                                                        <xsl:call-template name="WIPO:ST36liToST96LI">
                                                                            <xsl:with-param name="li" as="node()">
                                                                                <li xmlns="">
                                                                                    <xsl:sequence
                                                                                            select="(./@node(), ./node())"/>
                                                                                </li>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var23_resultof_ST__liToST__LI">
                                                                        <com:LI>
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </com:LI>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </com:UL>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var24_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:ol[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var24_test_resultof_node_name_equal_qname">
                                                            <com:OL>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@ol-style">
                                                                    <xsl:attribute name="com:olStyle"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:li[fn:namespace-uri() eq '']">
                                                                    <xsl:variable name="var25_resultof_ST__liToST__LI"
                                                                                  as="node()?">
                                                                        <xsl:call-template name="WIPO:ST36liToST96LI">
                                                                            <xsl:with-param name="li" as="node()">
                                                                                <li xmlns="">
                                                                                    <xsl:sequence
                                                                                            select="(./@node(), ./node())"/>
                                                                                </li>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var25_resultof_ST__liToST__LI">
                                                                        <com:LI>
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </com:LI>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </com:OL>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var26_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:dl[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var26_test_resultof_node_name_equal_qname">
                                                            <com:DL>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:dt[fn:namespace-uri() eq '']">
                                                                    <xsl:variable name="var27_resultof_ST__dtToST__DT"
                                                                                  as="node()?">
                                                                        <xsl:call-template name="WIPO:ST36dtToST96DT">
                                                                            <xsl:with-param name="dt" as="node()">
                                                                                <dt xmlns="">
                                                                                    <xsl:sequence
                                                                                            select="fn:string(.)"/>
                                                                                </dt>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var27_resultof_ST__dtToST__DT">
                                                                        <com:DT>
                                                                            <xsl:sequence select="fn:string(.)"/>
                                                                        </com:DT>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:dd[fn:namespace-uri() eq '']">
                                                                    <com:DD>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:DD>
                                                                </xsl:for-each>
                                                            </com:DL>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var28_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:maths[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var28_test_resultof_node_name_equal_qname">
                                                            <xsl:variable name="var29_resultof_ST__mathsToST__Math"
                                                                          as="node()?">
                                                                <xsl:call-template name="WIPO:ST36mathsToST96Math">
                                                                    <xsl:with-param name="maths" as="node()">
                                                                        <maths xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </maths>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each select="$var29_resultof_ST__mathsToST__Math">
                                                                <com:Math>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:Math>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var30_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:chemistry[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var30_test_resultof_node_name_equal_qname">
                                                            <com:ChemicalFormulae>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@num">
                                                                    <xsl:attribute name="com:chemicalFormulaeNumber"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:img[fn:namespace-uri() eq '']">
                                                                    <xsl:variable
                                                                            name="var31_resultof_ST__imgToST__Image"
                                                                            as="node()?">
                                                                        <xsl:call-template
                                                                                name="WIPO:ST36imgToST96Image">
                                                                            <xsl:with-param name="img" as="node()">
                                                                                <img xmlns="">
                                                                                    <xsl:sequence
                                                                                            select="(./@node(), ./node())"/>
                                                                                </img>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var31_resultof_ST__imgToST__Image">
                                                                        <com:Image>
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </com:Image>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:chem[fn:namespace-uri() eq '']">
                                                                    <com:InlineFormula>
                                                                        <xsl:sequence select="()"/>
                                                                    </com:InlineFormula>
                                                                </xsl:for-each>
                                                            </com:ChemicalFormulae>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var32_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:patcit[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var32_test_resultof_node_name_equal_qname">
                                                            <xsl:variable
                                                                    name="var33_resultof_ST__patcitToST__PatentCitation"
                                                                    as="node()?">
                                                                <xsl:call-template
                                                                        name="WIPO:ST36patcitToST96PatentCitation">
                                                                    <xsl:with-param name="patcit" as="node()">
                                                                        <patcit xmlns="">
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </patcit>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:variable>
                                                            <xsl:for-each
                                                                    select="$var33_resultof_ST__patcitToST__PatentCitation">
                                                                <com:PatentCitation>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </com:PatentCitation>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var34_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:nplcit[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var34_test_resultof_node_name_equal_qname">
                                                            <com:NPLCitation>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@lang">
                                                                    <xsl:attribute name="com:languageCode"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@num">
                                                                    <xsl:attribute name="com:sequenceNumber"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:text[fn:namespace-uri() eq '']">
                                                                    <com:NPLCitationText>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:NPLCitationText>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:book[fn:namespace-uri() eq '']">
                                                                    <com:CitedBook>
                                                                        <xsl:sequence select="()"/>
                                                                    </com:CitedBook>
                                                                </xsl:for-each>
                                                                <xsl:for-each
                                                                        select="*:article[fn:namespace-uri() eq '']">
                                                                    <com:CitedJournalArticle>
                                                                        <xsl:for-each
                                                                                select="*:author[fn:namespace-uri() eq '']">
                                                                            <com:AuthorName>
                                                                                <xsl:sequence select="()"/>
                                                                            </com:AuthorName>
                                                                        </xsl:for-each>
                                                                        <xsl:for-each
                                                                                select="*:subname[fn:namespace-uri() eq '']">
                                                                            <com:Subordinate>
                                                                                <xsl:for-each select="@subname-type">
                                                                                    <xsl:attribute
                                                                                            name="com:subordinateCategory"
                                                                                            select="fn:string(.)"/>
                                                                                </xsl:for-each>
                                                                                <xsl:for-each
                                                                                        select="*:name[fn:namespace-uri() eq '']">
                                                                                    <com:Name>
                                                                                        <xsl:sequence select="()"/>
                                                                                    </com:Name>
                                                                                </xsl:for-each>
                                                                            </com:Subordinate>
                                                                        </xsl:for-each>
                                                                        <xsl:for-each
                                                                                select="*:cpyrt[fn:namespace-uri() eq '']">
                                                                            <com:NPLCopyrightText>
                                                                                <xsl:sequence select="fn:string(.)"/>
                                                                            </com:NPLCopyrightText>
                                                                        </xsl:for-each>
                                                                        <xsl:for-each
                                                                                select="*:class[fn:namespace-uri() eq '']">
                                                                            <com:NPLClass>
                                                                                <xsl:for-each select="@class-type">
                                                                                    <xsl:attribute
                                                                                            name="com:classificationSystem"
                                                                                            select="fn:string(.)"/>
                                                                                </xsl:for-each>
                                                                                <xsl:sequence select="fn:string(.)"/>
                                                                            </com:NPLClass>
                                                                        </xsl:for-each>
                                                                        <xsl:for-each
                                                                                select="*:atl[fn:namespace-uri() eq '']">
                                                                            <com:SerialALTTitleText>
                                                                                <xsl:sequence select="fn:string(.)"/>
                                                                            </com:SerialALTTitleText>
                                                                        </xsl:for-each>
                                                                    </com:CitedJournalArticle>
                                                                </xsl:for-each>
                                                                <xsl:for-each
                                                                        select="*:othercit[fn:namespace-uri() eq '']">
                                                                    <com:CitedOtherKindNPL>
                                                                        <xsl:sequence select="()"/>
                                                                    </com:CitedOtherKindNPL>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@url">
                                                                    <com:WebURI>
                                                                        <xsl:sequence
                                                                                select="xs:string(xs:anyURI(fn:string(.)))"/>
                                                                    </com:WebURI>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@file">
                                                                    <com:FileName>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:FileName>
                                                                </xsl:for-each>
                                                            </com:NPLCitation>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var35_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:crossref[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var35_test_resultof_node_name_equal_qname">
                                                            <com:CrossReference>
                                                                <xsl:for-each select="@idref">
                                                                    <xsl:attribute name="com:idrefs"
                                                                                   select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="node()">
                                                                    <xsl:if test="fn:boolean(self::text())">
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </xsl:if>
                                                                    <xsl:variable
                                                                            name="var36_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var36_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable name="var37_resultof_ST__bToST__B"
                                                                                      as="node()*">
                                                                            <xsl:call-template name="WIPO:ST36bToST96B">
                                                                                <xsl:with-param name="b" as="node()">
                                                                                    <b xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </b>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var37_resultof_ST__bToST__B">
                                                                            <com:B>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:B>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var38_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var38_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable name="var39_resultof_ST__iToST__I"
                                                                                      as="node()?">
                                                                            <xsl:call-template name="WIPO:ST36iToST96I">
                                                                                <xsl:with-param name="i" as="node()">
                                                                                    <i xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </i>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var39_resultof_ST__iToST__I">
                                                                            <com:I>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:I>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var40_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var40_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable name="var41_resultof_ST__oToST__O"
                                                                                      as="node()?">
                                                                            <xsl:call-template name="WIPO:ST36oToST96O">
                                                                                <xsl:with-param name="o" as="node()">
                                                                                    <o xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </o>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var41_resultof_ST__oToST__O">
                                                                            <com:O>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:O>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var42_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var42_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable name="var43_resultof_ST__uToST__U"
                                                                                      as="node()?">
                                                                            <xsl:call-template name="WIPO:ST36uToST96U">
                                                                                <xsl:with-param name="u" as="node()">
                                                                                    <u xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </u>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var43_resultof_ST__uToST__U">
                                                                            <com:U>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:U>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var44_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var44_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable
                                                                                name="var45_resultof_ST__subToST__Sub"
                                                                                as="node()?">
                                                                            <xsl:call-template
                                                                                    name="WIPO:ST36subToST96Sub">
                                                                                <xsl:with-param name="sub" as="node()">
                                                                                    <sub xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </sub>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var45_resultof_ST__subToST__Sub">
                                                                            <com:Sub>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:Sub>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var46_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var46_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable
                                                                                name="var47_resultof_ST__supToST__Sup"
                                                                                as="node()?">
                                                                            <xsl:call-template
                                                                                    name="WIPO:ST36supToST96Sup">
                                                                                <xsl:with-param name="sup" as="node()">
                                                                                    <sup xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </sup>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var47_resultof_ST__supToST__Sup">
                                                                            <com:Sup>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:Sup>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <xsl:variable
                                                                            name="var48_test_resultof_node_name_equal_qname"
                                                                            as="node()?">
                                                                        <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                                                            <xsl:sequence select="."/>
                                                                        </xsl:if>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var48_test_resultof_node_name_equal_qname">
                                                                        <xsl:variable
                                                                                name="var49_resultof_ST__smallcapsToST__SmallCapitals"
                                                                                as="node()?">
                                                                            <xsl:call-template
                                                                                    name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                                                <xsl:with-param name="smallcaps"
                                                                                                as="node()">
                                                                                    <smallcaps xmlns="">
                                                                                        <xsl:sequence
                                                                                                select="(./@node(), ./node())"/>
                                                                                    </smallcaps>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </xsl:variable>
                                                                        <xsl:for-each
                                                                                select="$var49_resultof_ST__smallcapsToST__SmallCapitals">
                                                                            <com:SmallCapital>
                                                                                <xsl:sequence
                                                                                        select="(./@node(), ./node())"/>
                                                                            </com:SmallCapital>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </com:CrossReference>
                                                        </xsl:for-each>
                                                        <xsl:variable name="var50_test_resultof_node_name_equal_qname"
                                                                      as="node()?">
                                                            <xsl:if test="fn:boolean(self::*:bio-deposit[fn:namespace-uri() eq ''])">
                                                                <xsl:sequence select="."/>
                                                            </xsl:if>
                                                        </xsl:variable>
                                                        <xsl:for-each
                                                                select="$var50_test_resultof_node_name_equal_qname">
                                                            <com:BioDeposit>
                                                                <xsl:for-each select="@id">
                                                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@num">
                                                                    <xsl:attribute name="com:sequenceNumber"
                                                                                   select="fn:string(.)"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="@url">
                                                                    <xsl:attribute name="com:sourceURI"
                                                                                   select="xs:string(xs:anyURI(fn:string(.)))"/>
                                                                </xsl:for-each>
                                                                <xsl:for-each
                                                                        select="*:depositary[fn:namespace-uri() eq '']">
                                                                    <xsl:variable
                                                                            name="var51_resultof_ST__depositaryToST__BioDepositDepositary"
                                                                            as="node()?">
                                                                        <xsl:call-template
                                                                                name="WIPO:ST36depositaryToST96BioDepositDepositary">
                                                                            <xsl:with-param name="depositary"
                                                                                            as="node()">
                                                                                <depositary xmlns="">
                                                                                    <xsl:sequence
                                                                                            select="(./@node(), ./node())"/>
                                                                                </depositary>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </xsl:variable>
                                                                    <xsl:for-each
                                                                            select="$var51_resultof_ST__depositaryToST__BioDepositDepositary">
                                                                        <com:BioDepositDepositary>
                                                                            <xsl:sequence
                                                                                    select="(./@node(), ./node())"/>
                                                                        </com:BioDepositDepositary>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                                <xsl:for-each
                                                                        select="*:bio-accno[fn:namespace-uri() eq '']">
                                                                    <com:BiologicalAccessionNumber>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:BiologicalAccessionNumber>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:date[fn:namespace-uri() eq '']">
                                                                    <com:BioDepositDate>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:BioDepositDate>
                                                                </xsl:for-each>
                                                                <xsl:for-each select="*:term[fn:namespace-uri() eq '']">
                                                                    <com:BioDepositTermText>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:BioDepositTermText>
                                                                </xsl:for-each>
                                                                <xsl:for-each
                                                                        select="*:dtext[fn:namespace-uri() eq '']">
                                                                    <com:BioDepositText>
                                                                        <xsl:sequence select="fn:string(.)"/>
                                                                    </com:BioDepositText>
                                                                </xsl:for-each>
                                                            </com:BioDeposit>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </com:Entry>
                                            </xsl:for-each>
                                        </com:Row>
                                    </xsl:for-each>
                                </com:TableBody>
                            </xsl:for-each>
                        </com:TableGroup>
                    </xsl:for-each>
                </com:IPOASISTable>
            </xsl:for-each>
            <xsl:for-each select="$tables/*:img[fn:namespace-uri() eq '']">
                <xsl:variable name="var52_resultof_ST__imgToST__Image" as="node()?">
                    <xsl:call-template name="WIPO:ST36imgToST96Image">
                        <xsl:with-param name="img" as="node()">
                            <img xmlns="">
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </img>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var52_resultof_ST__imgToST__Image">
                    <com:TableImage>
                        <xsl:for-each select="@com:id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@com:fileLocationURI">
                            <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(.)))"/>
                        </xsl:for-each>
                        <xsl:for-each select="@com:imageContentCategory">
                            <xsl:attribute name="com:imageContentCategory" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@com:imageWrappingStyleCategory">
                            <xsl:attribute name="com:imageWrappingStyleCategory" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="$tables/@num">
                            <xsl:attribute name="com:tableNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="com:ImageFormatCategory">
                            <com:ImageFormatCategory>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:ImageFormatCategory>
                        </xsl:for-each>
                        <xsl:for-each select="com:FileName">
                            <com:FileName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:FileName>
                        </xsl:for-each>
                        <xsl:for-each select="com:HeightMeasure">
                            <com:HeightMeasure>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:HeightMeasure>
                        </xsl:for-each>
                        <xsl:for-each select="com:WidthMeasure">
                            <com:WidthMeasure>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:WidthMeasure>
                        </xsl:for-each>
                        <xsl:for-each select="com:ImageResolutionQuantity">
                            <com:ImageResolutionQuantity>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:ImageResolutionQuantity>
                        </xsl:for-each>
                        <xsl:for-each select="com:ColourModeCategory">
                            <com:ColourModeCategory>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:ColourModeCategory>
                        </xsl:for-each>
                    </com:TableImage>
                </xsl:for-each>
            </xsl:for-each>
        </com:Table>
    </xsl:template>
    <xsl:template name="WIPO:ST36depositaryToST96BioDepositDepositary">
        <xsl:param name="depositary" select="()"/>
        <xsl:variable name="var1_address" as="node()*" select="$depositary/address"/>
        <com:BioDepositDepositary>
            <com:PostalAddressBag>
                <com:PostalAddress>
                    <com:PostalStructuredAddress>
                        <xsl:for-each select="$var1_address/*:address-1[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('1'))"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:address-2[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('2'))"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:address-3[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('3'))"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:address-4[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('4'))"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:address-5[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('5'))"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:address-floor[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:addressLineCategory" select="'Floor'"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:pobox[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:addressLineCategory" select="'Postal office box'"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:building[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:addressLineCategory" select="'Building'"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:room[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:addressLineCategory" select="'Room'"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:street[fn:namespace-uri() eq '']">
                            <com:AddressLineText>
                                <xsl:attribute name="com:addressLineCategory" select="'Street'"/>
                            </com:AddressLineText>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:city[fn:namespace-uri() eq '']">
                            <com:CityName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:CityName>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:county[fn:namespace-uri() eq '']">
                            <com:GeographicRegionName>
                                <xsl:attribute name="com:geographicRegionCategory" select="'County'"/>
                            </com:GeographicRegionName>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:state[fn:namespace-uri() eq '']">
                            <com:GeographicRegionName>
                                <xsl:attribute name="com:geographicRegionCategory" select="'State'"/>
                            </com:GeographicRegionName>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:country[fn:namespace-uri() eq '']">
                            <com:CountryCode>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:CountryCode>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:postcode[fn:namespace-uri() eq '']">
                            <com:PostalCode>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:PostalCode>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_address/*:mailcode[fn:namespace-uri() eq '']">
                            <com:PostalCode>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:PostalCode>
                        </xsl:for-each>
                    </com:PostalStructuredAddress>
                </com:PostalAddress>
            </com:PostalAddressBag>
            <xsl:for-each select="$var1_address/*:text[fn:namespace-uri() eq '']">
                <com:ContactText>
                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                        <xsl:sequence select="fn:string(.)"/>
                    </xsl:for-each>
                </com:ContactText>
            </xsl:for-each>
        </com:BioDepositDepositary>
    </xsl:template>
    <xsl:template name="WIPO:ST36dtToST96DT">
        <xsl:param name="dt" select="()"/>
        <com:DT>
            <xsl:for-each select="$dt/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="($dt/node())[fn:boolean(self::text())]">
                <xsl:sequence select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:b[fn:namespace-uri() eq '']">
                <xsl:variable name="var1_resultof_ST__bToST__B" as="node()*">
                    <xsl:call-template name="WIPO:ST36bToST96B">
                        <xsl:with-param name="b" as="node()">
                            <b xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </b>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var1_resultof_ST__bToST__B">
                    <com:B>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:B>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:i[fn:namespace-uri() eq '']">
                <xsl:variable name="var2_resultof_ST__iToST__I" as="node()?">
                    <xsl:call-template name="WIPO:ST36iToST96I">
                        <xsl:with-param name="i" as="node()">
                            <i xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </i>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var2_resultof_ST__iToST__I">
                    <com:I>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:I>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:o[fn:namespace-uri() eq '']">
                <xsl:variable name="var3_resultof_ST__oToST__O" as="node()?">
                    <xsl:call-template name="WIPO:ST36oToST96O">
                        <xsl:with-param name="o" as="node()">
                            <o xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </o>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var3_resultof_ST__oToST__O">
                    <com:O>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:O>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:u[fn:namespace-uri() eq '']">
                <xsl:variable name="var4_resultof_ST__uToST__U" as="node()?">
                    <xsl:call-template name="WIPO:ST36uToST96U">
                        <xsl:with-param name="u" as="node()">
                            <u xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </u>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var4_resultof_ST__uToST__U">
                    <com:U>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:U>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:sup[fn:namespace-uri() eq '']">
                <xsl:variable name="var5_resultof_ST__subToST__Sub" as="node()?">
                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                        <xsl:with-param name="sub" as="node()">
                            <sub xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </sub>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var5_resultof_ST__subToST__Sub">
                    <com:Sub>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:Sub>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:sub[fn:namespace-uri() eq '']">
                <xsl:variable name="var6_resultof_ST__supToST__Sup" as="node()?">
                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                        <xsl:with-param name="sup" as="node()">
                            <sup xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </sup>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var6_resultof_ST__supToST__Sup">
                    <com:Sup>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:Sup>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$dt/*:smallcaps[fn:namespace-uri() eq '']">
                <xsl:variable name="var7_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                        <xsl:with-param name="smallcaps" as="node()">
                            <smallcaps xmlns="">
                                <xsl:sequence select="fn:string(.)"/>
                            </smallcaps>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var7_resultof_ST__smallcapsToST__SmallCapitals">
                    <com:SmallCapital>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:SmallCapital>
                </xsl:for-each>
            </xsl:for-each>
        </com:DT>
    </xsl:template>
    <xsl:template name="WIPO:ST36mathsToST96Math">
        <xsl:param name="maths" select="()"/>
        <xsl:variable name="var2_num" as="node()?" select="$maths/@num"/>
        <xsl:variable name="var3_math" as="node()?" select="$maths//*:math"/>
        <xsl:variable name="var4_img" as="node()?" select="$maths//*:img"/>

        <com:Math>
            <xsl:if test="fn:exists($var2_num)">
                <xsl:attribute name="com:mathNumber" select="fn:string($var2_num)"/>
            </xsl:if>
            <!--            <xsl:if test="fn:not(fn:exists($var3_math)) and fn:not(fn:exists($var4_img))">-->
            <!--                <xsl:value-of select="replace(replace(., '&#60;&#47;m', '&#60;&#47;mathml:m'), '&#60;m', '&#60;mathml:m') "/>-->
            <!--            </xsl:if>-->
            <xsl:if test="fn:not(fn:exists($var3_math)) and fn:not(fn:exists($var4_img))">
                <com:InlineFormula>
                    <com:B>
                        <xsl:value-of select="fn:string(.)"/>
                    </com:B>
                </com:InlineFormula>
            </xsl:if>

            <xsl:for-each select="var3_math">
                <mathml:math>
                    <xsl:apply-templates/>
                </mathml:math>
            </xsl:for-each>
            <xsl:for-each select="var4_img">
                <xsl:variable name="var1_resultof_ST__imgToST__Image" as="node()?">
                    <xsl:call-template name="WIPO:ST36imgToST96Image">
                        <xsl:with-param name="img" as="node()">
                            <img xmlns="">
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </img>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var1_resultof_ST__imgToST__Image">
                    <com:Image>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </com:Image>
                </xsl:for-each>
            </xsl:for-each>
        </com:Math>
    </xsl:template>
    <xsl:template name="WIPO:ST36imgToST96Image">
        <xsl:param name="img" select="()"/>
        <com:Image>
            <xsl:for-each select="$img/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$img/@img-content">
                <xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
                    <xsl:call-template name="vmf:vmf_a_4_inputtoresult">
                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var1_resultof_vmf__inputtoresult">
                    <xsl:attribute name="com:imageContentCategory" select="."/>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$img/@orientation">
                <xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
                    <xsl:call-template name="vmf:vmf_a_5_inputtoresult">
                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var2_resultof_vmf__inputtoresult">
                    <xsl:attribute name="com:orientationCategory" select="."/>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$img/@inline">
                <xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
                    <xsl:call-template name="vmf:vmf_a_6_inputtoresult">
                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var3_resultof_vmf__inputtoresult">
                    <xsl:attribute name="com:imageWrappingStyleCategory" select="."/>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$img/@img-format">
                <xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
                    <xsl:call-template name="vmf:vmf_a_7_inputtoresult">
                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:for-each select="$var4_resultof_vmf__inputtoresult">
                    <com:ImageFormatCategory>
                        <xsl:sequence select="."/>
                    </com:ImageFormatCategory>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="$img/@file">
                <com:FileName>
                    <xsl:sequence select="fn:string(.)"/>
                </com:FileName>
            </xsl:for-each>
            <xsl:for-each select="$img/@he">
                <com:HeightMeasure>
                    <xsl:attribute name="com:measureUnitCode" select="'Px'"/>
                    <xsl:sequence select="xs:string(xs:decimal(replace(fn:string(.), '[^0-9.]', '')))"/>
                </com:HeightMeasure>
            </xsl:for-each>
            <xsl:for-each select="$img/@wi">
                <com:WidthMeasure>
                    <xsl:attribute name="com:measureUnitCode" select="'Px'"/>
                    <xsl:sequence select="xs:string(xs:decimal(replace(fn:string(.), '[^0-9.]', '')))"/>
                </com:WidthMeasure>
            </xsl:for-each>
            <xsl:for-each select="$img/@alt">
                <com:Alt>
                    <xsl:sequence select="fn:string(.)"/>
                </com:Alt>
            </xsl:for-each>
        </com:Image>
    </xsl:template>
    <xsl:template name="WIPO:ST36patcitToST96PatentCitation">
        <xsl:param name="patcit" select="()"/>
        <com:PatentCitation>
            <xsl:for-each select="$patcit/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$patcit/@num">
                <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$patcit/*:text[fn:namespace-uri() eq '']">
                <com:PatentCitationText>
                    <xsl:sequence select="fn:string(.)"/>
                </com:PatentCitationText>
            </xsl:for-each>
            <xsl:for-each select="$patcit/*:document-id[fn:namespace-uri() eq '']">
                <com:CitedPatentDocumentIdentification>
                    <xsl:for-each select="*:country[fn:namespace-uri() eq '']">
                        <com:IPOfficeCode>
                            <xsl:sequence select="fn:string(.)"/>
                        </com:IPOfficeCode>
                    </xsl:for-each>
                    <xsl:for-each select="*:doc-number[fn:namespace-uri() eq '']">
                        <com:DocumentNumber>
                            <xsl:sequence select="fn:string(.)"/>
                        </com:DocumentNumber>
                    </xsl:for-each>
                    <xsl:for-each select="*:kind[fn:namespace-uri() eq '']">
                        <com:PatentDocumentKindCode>
                            <xsl:sequence select="fn:string(.)"/>
                        </com:PatentDocumentKindCode>
                    </xsl:for-each>
                    <xsl:for-each select="*:date[fn:namespace-uri() eq '']">
                        <com:PatentDocumentDate>
                            <xsl:sequence select="fn:string(.)"/>
                        </com:PatentDocumentDate>
                    </xsl:for-each>
                </com:CitedPatentDocumentIdentification>
            </xsl:for-each>
        </com:PatentCitation>
    </xsl:template>
    <xsl:template name="WIPO:ST36liToST96LI">
        <xsl:param name="li" select="()"/>
        <com:LI>
            <xsl:for-each select="$li/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$li/@num">
                <xsl:attribute name="com:liNumber" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$li/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <com:B>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var2_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var2_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var4_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var4_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var6_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var6_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:B>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <com:I>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var8_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var8_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var10_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var10_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var12_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var12_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:I>
                </xsl:for-each>
                <xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
                    <com:O>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var14_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var14_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var16_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var16_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:O>
                </xsl:for-each>
                <xsl:variable name="var18_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var18_test_resultof_node_name_equal_qname">
                    <com:U>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var20_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var22_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var22_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:U>
                </xsl:for-each>
                <xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
                    <com:Sup>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var24_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var24_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var26_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var26_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
                                <com:Sup2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var30_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var30_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var32_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var32_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sup2>
                            </xsl:for-each>
                            <xsl:variable name="var33_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
                                <com:Sub2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var37_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sub2>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:Sup>
                </xsl:for-each>
                <xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
                    <com:Sub>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var39_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var39_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var41_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var41_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var43_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
                                <com:Sup2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var45_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var46_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var47_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var47_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sup2>
                            </xsl:for-each>
                            <xsl:variable name="var48_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var48_test_resultof_node_name_equal_qname">
                                <com:Sub2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var49_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var49_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var50_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var50_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var51_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var51_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var52_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var52_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sub2>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:Sub>
                </xsl:for-each>
                <xsl:variable name="var53_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:img[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var53_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var54_resultof_ST__imgToST__Image" as="node()?">
                        <xsl:call-template name="WIPO:ST36imgToST96Image">
                            <xsl:with-param name="img" as="node()">
                                <img xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </img>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var54_resultof_ST__imgToST__Image">
                        <com:Image>
                            <xsl:sequence select="()"/>
                        </com:Image>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var55_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var55_test_resultof_node_name_equal_qname">
                    <com:SmallCapital>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var56_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var56_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var57_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var57_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var58_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var58_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var59_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var59_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:SmallCapital>
                </xsl:for-each>
                <xsl:variable name="var60_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:br[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var60_test_resultof_node_name_equal_qname">
                    <com:Br>
                        <xsl:sequence select="()"/>
                    </com:Br>
                </xsl:for-each>
                <xsl:variable name="var61_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:ul[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var61_test_resultof_node_name_equal_qname">
                    <com:UL>
                        <xsl:sequence select="()"/>
                    </com:UL>
                </xsl:for-each>
                <xsl:variable name="var62_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:ol[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var62_test_resultof_node_name_equal_qname">
                    <com:OL>
                        <xsl:sequence select="()"/>
                    </com:OL>
                </xsl:for-each>
                <xsl:variable name="var63_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:pre[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var63_test_resultof_node_name_equal_qname">
                    <com:Pre>
                        <xsl:sequence select="()"/>
                    </com:Pre>
                </xsl:for-each>
                <xsl:variable name="var64_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:dl[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var64_test_resultof_node_name_equal_qname">
                    <com:DL>
                        <xsl:sequence select="()"/>
                    </com:DL>
                </xsl:for-each>
                <xsl:variable name="var65_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:maths[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var65_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var66_resultof_ST__mathsToST__Math" as="node()?">
                        <xsl:call-template name="WIPO:ST36mathsToST96Math">
                            <xsl:with-param name="maths" as="node()">
                                <maths xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </maths>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var66_resultof_ST__mathsToST__Math">
                        <com:Math>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Math>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var67_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:chemistry[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var67_test_resultof_node_name_equal_qname">
                    <com:ChemicalFormulae>
                        <xsl:sequence select="()"/>
                    </com:ChemicalFormulae>
                </xsl:for-each>
                <xsl:variable name="var68_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:patcit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var68_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var69_resultof_ST__patcitToST__PatentCitation" as="node()?">
                        <xsl:call-template name="WIPO:ST36patcitToST96PatentCitation">
                            <xsl:with-param name="patcit" as="node()">
                                <patcit xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </patcit>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var69_resultof_ST__patcitToST__PatentCitation">
                        <com:PatentCitation>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:PatentCitation>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var70_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:nplcit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var70_test_resultof_node_name_equal_qname">
                    <com:NPLCitation>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@lang">
                            <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@num">
                            <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:text[fn:namespace-uri() eq '']">
                            <com:NPLCitationText>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:NPLCitationText>
                        </xsl:for-each>
                        <xsl:for-each select="*:book[fn:namespace-uri() eq '']">
                            <com:CitedBook>
                                <xsl:sequence select="()"/>
                            </com:CitedBook>
                        </xsl:for-each>
                        <xsl:for-each select="*:article[fn:namespace-uri() eq '']">
                            <com:CitedJournalArticle>
                                <xsl:for-each select="*:author[fn:namespace-uri() eq '']">
                                    <com:AuthorName>
                                        <xsl:sequence select="()"/>
                                    </com:AuthorName>
                                </xsl:for-each>
                                <xsl:for-each select="*:subname[fn:namespace-uri() eq '']">
                                    <com:Subordinate>
                                        <xsl:for-each select="@subname-type">
                                            <xsl:attribute name="com:subordinateCategory" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:name[fn:namespace-uri() eq '']">
                                            <com:Name>
                                                <xsl:sequence select="()"/>
                                            </com:Name>
                                        </xsl:for-each>
                                    </com:Subordinate>
                                </xsl:for-each>
                                <xsl:for-each select="*:cpyrt[fn:namespace-uri() eq '']">
                                    <com:NPLCopyrightText>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:NPLCopyrightText>
                                </xsl:for-each>
                                <xsl:for-each select="*:class[fn:namespace-uri() eq '']">
                                    <com:NPLClass>
                                        <xsl:for-each select="@class-type">
                                            <xsl:attribute name="com:classificationSystem" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:NPLClass>
                                </xsl:for-each>
                                <xsl:for-each select="*:atl[fn:namespace-uri() eq '']">
                                    <com:SerialALTTitleText>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:SerialALTTitleText>
                                </xsl:for-each>
                            </com:CitedJournalArticle>
                        </xsl:for-each>
                        <xsl:for-each select="*:othercit[fn:namespace-uri() eq '']">
                            <com:CitedOtherKindNPL>
                                <xsl:sequence select="()"/>
                            </com:CitedOtherKindNPL>
                        </xsl:for-each>
                        <xsl:for-each select="@url">
                            <com:WebURI>
                                <xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
                            </com:WebURI>
                        </xsl:for-each>
                        <xsl:for-each select="@file">
                            <com:FileName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:FileName>
                        </xsl:for-each>
                    </com:NPLCitation>
                </xsl:for-each>
                <xsl:variable name="var71_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:figref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var71_test_resultof_node_name_equal_qname">
                    <com:FigureReference>
                        <xsl:sequence select="()"/>
                    </com:FigureReference>
                </xsl:for-each>
                <xsl:variable name="var72_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:crossref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var72_test_resultof_node_name_equal_qname">
                    <com:CrossReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var73_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var73_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var74_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var74_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var75_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var75_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var76_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var76_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var77_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var77_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var78_resultof_ST__oToST__O" as="node()?">
                                    <xsl:call-template name="WIPO:ST36oToST96O">
                                        <xsl:with-param name="o" as="node()">
                                            <o xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </o>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var78_resultof_ST__oToST__O">
                                    <com:O>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:O>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var79_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var79_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var80_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var80_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var81_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var81_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var82_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var82_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var83_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var83_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var84_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var84_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var85_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var85_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var86_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var86_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:CrossReference>
                </xsl:for-each>
                <xsl:variable name="var87_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:bio-deposit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var87_test_resultof_node_name_equal_qname">
                    <com:BioDeposit>
                        <xsl:sequence select="()"/>
                    </com:BioDeposit>
                </xsl:for-each>
            </xsl:for-each>
        </com:LI>
    </xsl:template>
    <xsl:template name="WIPO:ST36pToSt96P">
        <xsl:param name="p" select="()"/>
        <com:P>
            <xsl:for-each select="$p/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$p/@num">
                <xsl:attribute name="com:pNumber" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$p/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <com:B>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var2_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var2_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var4_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var4_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var6_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var6_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:B>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <com:I>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var8_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var8_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var10_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var10_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var12_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var12_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:I>
                </xsl:for-each>
                <xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
                    <com:O>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var14_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var14_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var16_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var16_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:O>
                </xsl:for-each>
                <xsl:variable name="var18_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var18_test_resultof_node_name_equal_qname">
                    <com:U>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var20_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var22_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var22_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:U>
                </xsl:for-each>
                <xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
                    <com:Sup>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var24_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var24_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var26_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var26_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
                                <com:Sup2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var30_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var30_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var32_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var32_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sup2>
                            </xsl:for-each>
                            <xsl:variable name="var33_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
                                <com:Sub2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var37_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sub2>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:Sup>
                </xsl:for-each>
                <xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
                    <com:Sub>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var39_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var39_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var41_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var41_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var43_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
                                <com:Sup2>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup2>
                            </xsl:for-each>
                            <xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
                                <com:Sub2>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub2>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:Sub>
                </xsl:for-each>
                <xsl:variable name="var45_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:img[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var46_resultof_ST__imgToST__Image" as="node()?">
                        <xsl:call-template name="WIPO:ST36imgToST96Image">
                            <xsl:with-param name="img" as="node()">
                                <img xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </img>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var46_resultof_ST__imgToST__Image">
                        <com:Image>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Image>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var47_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var47_test_resultof_node_name_equal_qname">
                    <com:SmallCapital>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var48_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var48_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var49_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var49_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var50_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var50_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var51_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var51_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:SmallCapital>
                </xsl:for-each>
                <xsl:variable name="var52_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:br[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var52_test_resultof_node_name_equal_qname">
                    <com:Br>
                        <xsl:sequence select="()"/>
                    </com:Br>
                </xsl:for-each>
                <xsl:variable name="var53_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:ul[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var53_test_resultof_node_name_equal_qname">
                    <com:UL>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@list-style">
                            <xsl:attribute name="com:ulStyle" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:li[fn:namespace-uri() eq '']">
                            <xsl:variable name="var54_resultof_ST__liToST__LI" as="node()?">
                                <xsl:call-template name="WIPO:ST36liToST96LI">
                                    <xsl:with-param name="li" as="node()">
                                        <li xmlns="">
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </li>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var54_resultof_ST__liToST__LI">
                                <com:LI>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:LI>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:UL>
                </xsl:for-each>
                <xsl:variable name="var55_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:ol[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var55_test_resultof_node_name_equal_qname">
                    <com:OL>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@ol-style">
                            <xsl:attribute name="com:olStyle" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:li[fn:namespace-uri() eq '']">
                            <xsl:variable name="var56_resultof_ST__liToST__LI" as="node()?">
                                <xsl:call-template name="WIPO:ST36liToST96LI">
                                    <xsl:with-param name="li" as="node()">
                                        <li xmlns="">
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </li>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var56_resultof_ST__liToST__LI">
                                <com:LI>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:LI>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:OL>
                </xsl:for-each>
                <xsl:variable name="var57_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:pre[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var57_test_resultof_node_name_equal_qname">
                    <com:Pre>
                        <xsl:for-each select="@listing-type">
                            <xsl:attribute name="com:listingCategory" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                    </com:Pre>
                </xsl:for-each>
                <xsl:variable name="var58_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:dl[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var58_test_resultof_node_name_equal_qname">
                    <com:DL>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:dt[fn:namespace-uri() eq '']">
                            <xsl:variable name="var59_resultof_ST__dtToST__DT" as="node()?">
                                <xsl:call-template name="WIPO:ST36dtToST96DT">
                                    <xsl:with-param name="dt" as="node()">
                                        <dt xmlns="">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </dt>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var59_resultof_ST__dtToST__DT">
                                <com:DT>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:DT>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="*:dd[fn:namespace-uri() eq '']">
                            <com:DD>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:DD>
                        </xsl:for-each>
                    </com:DL>
                </xsl:for-each>
                <xsl:variable name="var60_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:maths[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var60_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var61_resultof_ST__mathsToST__Math" as="node()?">
                        <xsl:call-template name="WIPO:ST36mathsToST96Math">
                            <xsl:with-param name="maths" as="node()">
                                <maths xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </maths>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var61_resultof_ST__mathsToST__Math">
                        <com:Math>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Math>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var62_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:chemistry[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var62_test_resultof_node_name_equal_qname">
                    <com:ChemicalFormulae>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@num">
                            <xsl:attribute name="com:chemicalFormulaeNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:img[fn:namespace-uri() eq '']">
                            <xsl:variable name="var63_resultof_ST__imgToST__Image" as="node()?">
                                <xsl:call-template name="WIPO:ST36imgToST96Image">
                                    <xsl:with-param name="img" as="node()">
                                        <img xmlns="">
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </img>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var63_resultof_ST__imgToST__Image">
                                <com:Image>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:Image>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="*:chem[fn:namespace-uri() eq '']">
                            <com:InlineFormula>
                                <xsl:sequence select="()"/>
                            </com:InlineFormula>
                        </xsl:for-each>
                    </com:ChemicalFormulae>
                </xsl:for-each>
                <xsl:variable name="var64_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:patcit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var64_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var65_resultof_ST__patcitToST__PatentCitation" as="node()?">
                        <xsl:call-template name="WIPO:ST36patcitToST96PatentCitation">
                            <xsl:with-param name="patcit" as="node()">
                                <patcit xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </patcit>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var65_resultof_ST__patcitToST__PatentCitation">
                        <com:PatentCitation>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:PatentCitation>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var66_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:nplcit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var66_test_resultof_node_name_equal_qname">
                    <com:NPLCitation>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@lang">
                            <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@num">
                            <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:text[fn:namespace-uri() eq '']">
                            <com:NPLCitationText>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:NPLCitationText>
                        </xsl:for-each>
                        <xsl:for-each select="*:book[fn:namespace-uri() eq '']">
                            <com:CitedBook>
                                <xsl:sequence select="()"/>
                            </com:CitedBook>
                        </xsl:for-each>
                        <xsl:for-each select="*:article[fn:namespace-uri() eq '']">
                            <com:CitedJournalArticle>
                                <xsl:for-each select="*:author[fn:namespace-uri() eq '']">
                                    <com:AuthorName>
                                        <xsl:sequence select="()"/>
                                    </com:AuthorName>
                                </xsl:for-each>
                                <xsl:for-each select="*:subname[fn:namespace-uri() eq '']">
                                    <com:Subordinate>
                                        <xsl:for-each select="@subname-type">
                                            <xsl:attribute name="com:subordinateCategory" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="*:name[fn:namespace-uri() eq '']">
                                            <com:Name>
                                                <xsl:sequence select="()"/>
                                            </com:Name>
                                        </xsl:for-each>
                                    </com:Subordinate>
                                </xsl:for-each>
                                <xsl:for-each select="*:cpyrt[fn:namespace-uri() eq '']">
                                    <com:NPLCopyrightText>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:NPLCopyrightText>
                                </xsl:for-each>
                                <xsl:for-each select="*:class[fn:namespace-uri() eq '']">
                                    <com:NPLClass>
                                        <xsl:for-each select="@class-type">
                                            <xsl:attribute name="com:classificationSystem" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:NPLClass>
                                </xsl:for-each>
                                <xsl:for-each select="*:atl[fn:namespace-uri() eq '']">
                                    <com:SerialALTTitleText>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:SerialALTTitleText>
                                </xsl:for-each>
                            </com:CitedJournalArticle>
                        </xsl:for-each>
                        <xsl:for-each select="*:othercit[fn:namespace-uri() eq '']">
                            <com:CitedOtherKindNPL>
                                <xsl:sequence select="()"/>
                            </com:CitedOtherKindNPL>
                        </xsl:for-each>
                        <xsl:for-each select="@url">
                            <com:WebURI>
                                <xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
                            </com:WebURI>
                        </xsl:for-each>
                        <xsl:for-each select="@file">
                            <com:FileName>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:FileName>
                        </xsl:for-each>
                    </com:NPLCitation>
                </xsl:for-each>
                <xsl:variable name="var67_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:figref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var67_test_resultof_node_name_equal_qname">
                    <com:FigureReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var68_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var68_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var69_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var69_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var70_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var70_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var71_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var71_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var72_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var72_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var73_resultof_ST__oToST__O" as="node()?">
                                    <xsl:call-template name="WIPO:ST36oToST96O">
                                        <xsl:with-param name="o" as="node()">
                                            <o xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </o>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var73_resultof_ST__oToST__O">
                                    <com:O>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:O>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var74_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var74_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var75_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var75_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var76_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var76_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var77_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var77_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var78_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var78_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var79_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var79_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var80_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var80_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var81_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var81_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:FigureReference>
                </xsl:for-each>
                <xsl:variable name="var82_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:crossref[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var82_test_resultof_node_name_equal_qname">
                    <com:CrossReference>
                        <xsl:for-each select="@idref">
                            <xsl:attribute name="com:idrefs"
                                           select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
                        </xsl:for-each>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var83_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var83_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var84_resultof_ST__bToST__B" as="node()*">
                                    <xsl:call-template name="WIPO:ST36bToST96B">
                                        <xsl:with-param name="b" as="node()">
                                            <b xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </b>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var84_resultof_ST__bToST__B">
                                    <com:B>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:B>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var85_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var85_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var86_resultof_ST__iToST__I" as="node()?">
                                    <xsl:call-template name="WIPO:ST36iToST96I">
                                        <xsl:with-param name="i" as="node()">
                                            <i xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </i>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var86_resultof_ST__iToST__I">
                                    <com:I>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:I>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var87_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var87_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var88_resultof_ST__oToST__O" as="node()?">
                                    <xsl:call-template name="WIPO:ST36oToST96O">
                                        <xsl:with-param name="o" as="node()">
                                            <o xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </o>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var88_resultof_ST__oToST__O">
                                    <com:O>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:O>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var89_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var89_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var90_resultof_ST__uToST__U" as="node()?">
                                    <xsl:call-template name="WIPO:ST36uToST96U">
                                        <xsl:with-param name="u" as="node()">
                                            <u xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </u>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var90_resultof_ST__uToST__U">
                                    <com:U>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:U>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var91_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var91_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var92_resultof_ST__subToST__Sub" as="node()?">
                                    <xsl:call-template name="WIPO:ST36subToST96Sub">
                                        <xsl:with-param name="sub" as="node()">
                                            <sub xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sub>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var92_resultof_ST__subToST__Sub">
                                    <com:Sub>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sub>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var93_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var93_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var94_resultof_ST__supToST__Sup" as="node()?">
                                    <xsl:call-template name="WIPO:ST36supToST96Sup">
                                        <xsl:with-param name="sup" as="node()">
                                            <sup xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </sup>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var94_resultof_ST__supToST__Sup">
                                    <com:Sup>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:Sup>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var95_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var95_test_resultof_node_name_equal_qname">
                                <xsl:variable name="var96_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                    <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                        <xsl:with-param name="smallcaps" as="node()">
                                            <smallcaps xmlns="">
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </smallcaps>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var96_resultof_ST__smallcapsToST__SmallCapitals">
                                    <com:SmallCapital>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:SmallCapital>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:CrossReference>
                </xsl:for-each>
                <xsl:variable name="var97_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:bio-deposit[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var97_test_resultof_node_name_equal_qname">
                    <com:BioDeposit>
                        <xsl:for-each select="@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@num">
                            <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@url">
                            <xsl:attribute name="com:sourceURI" select="xs:string(xs:anyURI(fn:string(.)))"/>
                        </xsl:for-each>
                        <xsl:for-each select="*:depositary[fn:namespace-uri() eq '']">
                            <xsl:variable name="var98_resultof_ST__depositaryToST__BioDepositDepositary" as="node()?">
                                <xsl:call-template name="WIPO:ST36depositaryToST96BioDepositDepositary">
                                    <xsl:with-param name="depositary" as="node()">
                                        <depositary xmlns="">
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </depositary>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var98_resultof_ST__depositaryToST__BioDepositDepositary">
                                <com:BioDepositDepositary>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:BioDepositDepositary>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="*:bio-accno[fn:namespace-uri() eq '']">
                            <com:BiologicalAccessionNumber>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:BiologicalAccessionNumber>
                        </xsl:for-each>
                        <xsl:for-each select="*:date[fn:namespace-uri() eq '']">
                            <com:BioDepositDate>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:BioDepositDate>
                        </xsl:for-each>
                        <xsl:for-each select="*:term[fn:namespace-uri() eq '']">
                            <com:BioDepositTermText>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:BioDepositTermText>
                        </xsl:for-each>
                        <xsl:for-each select="*:dtext[fn:namespace-uri() eq '']">
                            <com:BioDepositText>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:BioDepositText>
                        </xsl:for-each>
                    </com:BioDeposit>
                </xsl:for-each>
                <xsl:variable name="var99_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:tables[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var99_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var100_resultof_ST__tablesToST__Table" as="node()?">
                        <xsl:call-template name="WIPO:ST36tablesToST96Table">
                            <xsl:with-param name="tables" as="node()">
                                <tables xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </tables>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var100_resultof_ST__tablesToST__Table">
                        <com:Table>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Table>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:P>
    </xsl:template>
    <xsl:template name="WIPO:ST36supToST96Sup">
        <xsl:param name="sup" select="()"/>
        <com:Sup>
            <xsl:for-each select="$sup/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__sup_ToST__Sup_" as="node()?">
                        <xsl:call-template name="WIPO:ST36sup2ToST96Sup2">
                            <xsl:with-param name="sup2" as="node()">
                                <sup2 xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup2>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__sup_ToST__Sup_">
                        <com:Sup2>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup2>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var12_resultof_ST__sub_ToST__Sub_" as="node()?">
                        <xsl:call-template name="WIPO:ST36sub2ToST96Sub2">
                            <xsl:with-param name="sub2" as="node()">
                                <sub2 xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub2>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var12_resultof_ST__sub_ToST__Sub_">
                        <com:Sub2>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub2>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:Sup>
    </xsl:template>
    <xsl:template name="WIPO:ST36sub2ToST96Sub2">
        <xsl:param name="sub2" select="()"/>
        <com:Sub2>
            <xsl:for-each select="$sub2/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:Sub2>
    </xsl:template>
    <xsl:template name="WIPO:ST36sup2ToST96Sup2">
        <xsl:param name="sup2" select="()"/>
        <com:Sup2>
            <xsl:for-each select="$sup2/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:Sup2>
    </xsl:template>
    <xsl:template name="WIPO:ST36subToST96Sub">
        <xsl:param name="sub" select="()"/>
        <com:Sub>
            <xsl:for-each select="$sub/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__sup_ToST__Sup_" as="node()?">
                        <xsl:call-template name="WIPO:ST36sup2ToST96Sup2">
                            <xsl:with-param name="sup2" as="node()">
                                <sup2 xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup2>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__sup_ToST__Sup_">
                        <com:Sup2>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup2>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var12_resultof_ST__sub_ToST__Sub_" as="node()?">
                        <xsl:call-template name="WIPO:ST36sub2ToST96Sub2">
                            <xsl:with-param name="sub2" as="node()">
                                <sub2 xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub2>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var12_resultof_ST__sub_ToST__Sub_">
                        <com:Sub2>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub2>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:Sub>
    </xsl:template>
    <xsl:template name="WIPO:ST36oToST96O">
        <xsl:param name="o" select="()"/>
        <com:O>
            <xsl:for-each select="$o/@style">
                <xsl:attribute name="com:oStyle" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$o/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                            <xsl:with-param name="smallcaps" as="node()">
                                <smallcaps xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </smallcaps>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__smallcapsToST__SmallCapitals">
                        <com:SmallCapital>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:SmallCapital>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__subToST__Sub" as="node()?">
                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                            <xsl:with-param name="sub" as="node()">
                                <sub xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__subToST__Sub">
                        <com:Sub>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__supToST__Sup" as="node()?">
                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                            <xsl:with-param name="sup" as="node()">
                                <sup xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__supToST__Sup">
                        <com:Sup>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:O>
    </xsl:template>
    <xsl:template name="WIPO:ST36smallcapsToST96SmallCapitals">
        <xsl:param name="smallcaps" select="()"/>
        <com:SmallCapital>
            <xsl:for-each select="$smallcaps/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
                        <xsl:call-template name="WIPO:ST36uToST96U">
                            <xsl:with-param name="u" as="node()">
                                <u xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </u>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__uToST__U">
                        <com:U>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:U>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:SmallCapital>
    </xsl:template>
    <xsl:template name="WIPO:ST36uToST96U">
        <xsl:param name="u" select="()"/>
        <com:U>
            <xsl:for-each select="$u/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
                        <xsl:call-template name="WIPO:ST36iToST96I">
                            <xsl:with-param name="i" as="node()">
                                <i xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </i>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__iToST__I">
                        <com:I>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:I>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                            <xsl:with-param name="smallcaps" as="node()">
                                <smallcaps xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </smallcaps>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__smallcapsToST__SmallCapitals">
                        <com:SmallCapital>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:SmallCapital>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__subToST__Sub" as="node()?">
                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                            <xsl:with-param name="sub" as="node()">
                                <sub xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__subToST__Sub">
                        <com:Sub>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__supToST__Sup" as="node()?">
                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                            <xsl:with-param name="sup" as="node()">
                                <sup xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__supToST__Sup">
                        <com:Sup>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </com:U>
    </xsl:template>
    <xsl:template name="WIPO:ST36bToST96B">
        <xsl:param name="b" select="()"/>
        <com:B>
            <xsl:for-each select="$b/node()">
                <xsl:variable name="var47_resultof_node_name_equal_qname" as="xs:boolean"
                              select="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])"/>
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <com:I>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var2_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var2_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var4_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var4_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var6_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var6_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:I>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <com:O>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var8_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var8_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var10_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var10_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:O>
                </xsl:for-each>
                <xsl:variable name="var12_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var12_test_resultof_node_name_equal_qname">
                    <com:U>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var14_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var14_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
                                <com:Sub>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sub>
                            </xsl:for-each>
                            <xsl:variable name="var16_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var16_test_resultof_node_name_equal_qname">
                                <com:Sup>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:Sup>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:U>
                </xsl:for-each>
                <xsl:variable name="var17_test_node_name_equal_qname" as="node()?">
                    <xsl:if test="$var47_resultof_node_name_equal_qname">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var17_test_node_name_equal_qname">
                    <com:Sub>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var18_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var18_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var20_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                            <xsl:variable name="var22_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sup2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var22_test_resultof_node_name_equal_qname">
                                <com:Sup2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var24_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var24_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var26_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var26_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sup2>
                            </xsl:for-each>
                            <xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:sub2[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
                                <com:Sub2>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
                                            <com:B>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:B>
                                        </xsl:for-each>
                                        <xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
                                            <com:I>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:I>
                                        </xsl:for-each>
                                        <xsl:variable name="var30_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var30_test_resultof_node_name_equal_qname">
                                            <com:O>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:O>
                                        </xsl:for-each>
                                        <xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
                                            <com:U>
                                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:for-each>
                                            </com:U>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Sub2>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:Sub>
                </xsl:for-each>
                <xsl:variable name="var32_test_node_name_equal_qname" as="node()?">
                    <xsl:if test="$var47_resultof_node_name_equal_qname">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var32_test_node_name_equal_qname">
                    <xsl:variable name="var41_sup" as="node()*" select="$b/*:sup[fn:namespace-uri() eq '']"/>
                    <com:Sup>
                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                            <xsl:sequence select="fn:string(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:b[fn:namespace-uri() eq '']">
                            <com:B>
                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                            </com:B>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:i[fn:namespace-uri() eq '']">
                            <com:I>
                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                            </com:I>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:o[fn:namespace-uri() eq '']">
                            <com:O>
                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                            </com:O>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:u[fn:namespace-uri() eq '']">
                            <com:U>
                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                            </com:U>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:sup2[fn:namespace-uri() eq '']">
                            <com:Sup2>
                                <xsl:for-each select="node()">
                                    <xsl:if test="fn:boolean(self::text())">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:if>
                                    <xsl:variable name="var33_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
                                        <com:B>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:B>
                                    </xsl:for-each>
                                    <xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
                                        <com:I>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:I>
                                    </xsl:for-each>
                                    <xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
                                        <com:O>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:O>
                                    </xsl:for-each>
                                    <xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
                                        <com:U>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:U>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </com:Sup2>
                        </xsl:for-each>
                        <xsl:for-each select="$var41_sup/*:sub2[fn:namespace-uri() eq '']">
                            <com:Sub2>
                                <xsl:for-each select="node()">
                                    <xsl:if test="fn:boolean(self::text())">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:if>
                                    <xsl:variable name="var37_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
                                        <com:B>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:B>
                                    </xsl:for-each>
                                    <xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
                                        <com:I>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:I>
                                    </xsl:for-each>
                                    <xsl:variable name="var39_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var39_test_resultof_node_name_equal_qname">
                                        <com:O>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:O>
                                    </xsl:for-each>
                                    <xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
                                        <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                            <xsl:sequence select="."/>
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
                                        <com:U>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:U>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </com:Sub2>
                        </xsl:for-each>
                    </com:Sup>
                </xsl:for-each>
                <xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
                    <com:SmallCapital>
                        <xsl:for-each select="node()">
                            <xsl:if test="fn:boolean(self::text())">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:if>
                            <xsl:variable name="var43_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
                                <com:B>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:B>
                            </xsl:for-each>
                            <xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:i[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
                                <com:I>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:I>
                            </xsl:for-each>
                            <xsl:variable name="var45_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
                                <com:O>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:O>
                            </xsl:for-each>
                            <xsl:variable name="var46_test_resultof_node_name_equal_qname" as="node()?">
                                <xsl:if test="fn:boolean(self::*:u[fn:namespace-uri() eq ''])">
                                    <xsl:sequence select="."/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
                                <com:U>
                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </com:U>
                            </xsl:for-each>
                        </xsl:for-each>
                    </com:SmallCapital>
                </xsl:for-each>
            </xsl:for-each>
        </com:B>
    </xsl:template>
    <xsl:template name="WIPO:ST36iToST96I">
        <xsl:param name="i" select="()"/>
        <com:I>
            <xsl:for-each select="$i/node()">
                <xsl:if test="fn:boolean(self::text())">
                    <xsl:sequence select="fn:string(.)"/>
                </xsl:if>
                <xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:b[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
                        <xsl:call-template name="WIPO:ST36bToST96B">
                            <xsl:with-param name="b" as="node()">
                                <b xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </b>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_ST__bToST__B">
                        <com:B>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:B>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var3_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:o[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var4_resultof_ST__oToST__O" as="node()?">
                        <xsl:call-template name="WIPO:ST36oToST96O">
                            <xsl:with-param name="o" as="node()">
                                <o xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </o>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var4_resultof_ST__oToST__O">
                        <com:O>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:O>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var5_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sub[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var6_resultof_ST__subToST__Sub" as="node()?">
                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                            <xsl:with-param name="sub" as="node()">
                                <sub xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sub>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var6_resultof_ST__subToST__Sub">
                        <com:Sub>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sub>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:sup[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var8_resultof_ST__supToST__Sup" as="node()?">
                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                            <xsl:with-param name="sup" as="node()">
                                <sup xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </sup>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var8_resultof_ST__supToST__Sup">
                        <com:Sup>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:Sup>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                    <xsl:if test="fn:boolean(self::*:smallcaps[fn:namespace-uri() eq ''])">
                        <xsl:sequence select="."/>
                    </xsl:if>
                </xsl:variable>
                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                    <xsl:variable name="var10_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                            <xsl:with-param name="smallcaps" as="node()">
                                <smallcaps xmlns="">
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </smallcaps>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var10_resultof_ST__smallcapsToST__SmallCapitals">
                        <com:SmallCapital>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </com:SmallCapital>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
            <com:U>
                <com:B>
                    <xsl:for-each select="$i/*:u[fn:namespace-uri() eq '']">
                        <xsl:variable name="var11_resultof_ST__uToST__U" as="node()?">
                            <xsl:call-template name="WIPO:ST36uToST96U">
                                <xsl:with-param name="u" as="node()">
                                    <u xmlns="">
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </u>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:for-each select="$var11_resultof_ST__uToST__U">
                            <com:U>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:U>
                        </xsl:for-each>
                    </xsl:for-each>
                </com:B>
            </com:U>
        </com:I>
    </xsl:template>
    <xsl:template match="/">
        <xsl:variable name="var382_patent_application" as="node()?" select="cn-patent-document"/>
        <xsl:variable name="var381_doc_page_of_patent_application" as="node()*"
                      select="$var382_patent_application/doc-page"/>
        <pat:PatentPublication com:languageCode="zh" com:st96Version="V3_1"
                               xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                               xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
                               xmlns:mathml="http://www.w3.org/1998/Math/MathML"
                               xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
            <xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance"
                           select="'http://www.wipo.int/standards/XMLSchema/ST96/Patent /data/xq/st96/schema/ST96XMLSchema_V3_1_Flattened_Updated/PatentPublication_V3_1.xsd'"/>
            <xsl:for-each select="$var382_patent_application/@id">
                <xsl:attribute name="com:id" select="fn:string(.)"/>
            </xsl:for-each>
            <xsl:for-each select="$var382_patent_application/@file">
                <xsl:attribute name="com:documentFileName" select="fn:string(.)"/>
            </xsl:for-each>
            <com:IPOfficeCode>CN</com:IPOfficeCode>
            <xsl:variable name="var71_bibliographic_data" as="node()?"
                          select="$var382_patent_application/cn-bibliographic-data"/>
            <pat:BibliographicData com:st96Version="V3_1">
                <xsl:for-each select="$var71_bibliographic_data">
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@country">
                        <xsl:attribute name="com:officeCode" select="fn:string(.)"/>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="$var71_bibliographic_data">
                    <xsl:variable name="var70_cur" as="node()" select="."/>
                    <xsl:variable name="var2_publication_reference" as="node()" select="cn-publication-reference"/>
                    <xsl:variable name="var1_document_id" as="node()" select="$var2_publication_reference/document-id"/>
                    <pat:PatentPublicationIdentification>
                        <xsl:for-each select="$var2_publication_reference/@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <com:IPOfficeCode>
                            <xsl:sequence select="fn:string($var1_document_id/country)"/>
                        </com:IPOfficeCode>
                        <pat:PublicationNumber>
                            <xsl:sequence select="fn:string($var1_document_id/doc-number)"/>
                        </pat:PublicationNumber>
                        <xsl:for-each select="$var1_document_id/kind">
                            <com:PatentDocumentKindCode>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:PatentDocumentKindCode>
                        </xsl:for-each>
                        <xsl:for-each select="$var1_document_id/date">
                            <com:PublicationDate>
                                <xsl:sequence select="fn:string(.)"/>
                            </com:PublicationDate>
                        </xsl:for-each>
                    </pat:PatentPublicationIdentification>
                    <xsl:variable name="var6_application_reference" as="node()" select="application-reference"/>
                    <xsl:variable name="var5_document_id" as="node()" select="$var6_application_reference/document-id"/>
                    <xsl:variable name="var4_country_as_string" as="xs:string"
                                  select="fn:string($var5_document_id/country)"/>
                    <pat:ApplicationIdentification>
                        <xsl:for-each select="$var6_application_reference/@id">
                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                        </xsl:for-each>
                        <com:IPOfficeCode>
                            <xsl:sequence select="$var4_country_as_string"/>
                        </com:IPOfficeCode>
                        <com:ApplicationNumber>
                            <com:IPOfficeCode>
                                <xsl:sequence select="$var4_country_as_string"/>
                            </com:IPOfficeCode>
                            <com:ApplicationNumberText>
                                <xsl:sequence select="fn:string($var5_document_id/doc-number)"/>
                            </com:ApplicationNumberText>
                        </com:ApplicationNumber>
                        <xsl:for-each select="$var6_application_reference/@appl-type">
                            <xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf_b_1_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var3_resultof_vmf__inputtoresult">
                                <pat:InventionSubjectMatterCategory>
                                    <xsl:sequence select="."/>
                                </pat:InventionSubjectMatterCategory>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="$var5_document_id/date">
                            <pat:FilingDate>
                                <xsl:sequence select="fn:string(.)"/>
                            </pat:FilingDate>
                        </xsl:for-each>
                    </pat:ApplicationIdentification>
                    <xsl:for-each select="priority-claims">
                        <pat:PriorityClaimBag>
                            <xsl:for-each select="priority-claim">
                                <pat:PriorityClaim>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:attribute name="com:sequenceNumber" select="fn:string(@sequence)"/>
                                    <com:IPOfficeCode>
                                        <xsl:sequence select="fn:string(country)"/>
                                    </com:IPOfficeCode>
                                    <xsl:for-each select="doc-number">
                                        <com:ApplicationNumber>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <com:ApplicationNumberText>
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </com:ApplicationNumberText>
                                            </xsl:for-each>
                                        </com:ApplicationNumber>
                                    </xsl:for-each>
                                    <pat:FilingDate>
                                        <xsl:sequence select="fn:string(date)"/>
                                    </pat:FilingDate>
                                    <xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
                                        <xsl:call-template name="vmf:vmf_b_2_inputtoresult">
                                            <xsl:with-param name="input" select="fn:string(@kind)" as="xs:string"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var7_resultof_vmf__inputtoresult">
                                        <pat:ApplicationFilingCategory>
                                            <xsl:sequence select="."/>
                                        </pat:ApplicationFilingCategory>
                                    </xsl:for-each>
                                    <xsl:for-each select="priority-doc-requested">
                                        <pat:RequestedPriorityDocumentIndicator>
                                            <xsl:sequence select="()"/>
                                        </pat:RequestedPriorityDocumentIndicator>
                                    </xsl:for-each>
                                    <xsl:for-each select="priority-doc-attached">
                                        <pat:AttachedPriorityDocumentIndicator>
                                            <xsl:sequence select="()"/>
                                        </pat:AttachedPriorityDocumentIndicator>
                                    </xsl:for-each>
                                    <xsl:for-each select="priority-doc-from-library">
                                        <pat:OnlineAvailablePriorityDocumentIndicator>
                                            <xsl:for-each select="@library-identifier">
                                                <xsl:attribute name="pat:libraryIdentifier" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@action-by">
                                                <xsl:attribute name="com:officeCode" select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </pat:OnlineAvailablePriorityDocumentIndicator>
                                    </xsl:for-each>
                                </pat:PriorityClaim>
                            </xsl:for-each>
                        </pat:PriorityClaimBag>
                    </xsl:for-each>
                    <pat:PatentClassificationBag>
                        <xsl:for-each select="classification-ipc">
                            <pat:IPCClassification>
                                <xsl:for-each select="@id">
                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                </xsl:for-each>
                                <com:Edition>
                                    <xsl:sequence select="fn:string(edition)"/>
                                </com:Edition>
                                <pat:MainClassification>
                                    <xsl:sequence select="fn:string(main-clsf)"/>
                                </pat:MainClassification>
                                <xsl:for-each select="further-clsf">
                                    <pat:FurtherClassification>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </pat:FurtherClassification>
                                </xsl:for-each>
                            </pat:IPCClassification>
                        </xsl:for-each>
                        <xsl:for-each select="classifications-ipcr">
                            <pat:IPCRClassificationBag>
                                <xsl:for-each select="classification-ipcr">
                                    <pat:IPCRClassification>
                                        <xsl:for-each select="@id">
                                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@sequence">
                                            <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="text">
                                            <pat:PatentClassificationText>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:PatentClassificationText>
                                        </xsl:for-each>
                                        <xsl:for-each select="ipc-version-indicator">
                                            <pat:ClassificationVersionDate>
                                                <xsl:sequence select="fn:string(date)"/>
                                            </pat:ClassificationVersionDate>
                                        </xsl:for-each>
                                        <xsl:for-each select="classification-level">
                                            <pat:PatentClassificationLevelCode>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:PatentClassificationLevelCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="symbol-position">
                                            <com:SymbolPositionCode>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </com:SymbolPositionCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="classification-value">
                                            <pat:IPCClassificationValueCode>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:IPCClassificationValueCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="action-date">
                                            <pat:ActionDate>
                                                <xsl:sequence select="fn:string(date)"/>
                                            </pat:ActionDate>
                                        </xsl:for-each>
                                        <xsl:for-each select="classification-status">
                                            <pat:IPCClassificationStatusCode>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:IPCClassificationStatusCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="classification-data-source">
                                            <pat:PatentClassificationDataSourceCode>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:PatentClassificationDataSourceCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="generating-office">
                                            <pat:GeneratingOfficeCode>
                                                <xsl:sequence select="fn:string(country)"/>
                                            </pat:GeneratingOfficeCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="section">
                                            <pat:Section>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:Section>
                                        </xsl:for-each>
                                        <xsl:for-each select="class">
                                            <pat:Class>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:Class>
                                        </xsl:for-each>
                                        <xsl:for-each select="subclass">
                                            <pat:Subclass>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:Subclass>
                                        </xsl:for-each>
                                        <xsl:for-each select="main-group">
                                            <pat:MainGroup>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:MainGroup>
                                        </xsl:for-each>
                                        <xsl:for-each select="subgroup">
                                            <pat:Subgroup>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:Subgroup>
                                        </xsl:for-each>
                                    </pat:IPCRClassification>
                                </xsl:for-each>
                            </pat:IPCRClassificationBag>
                        </xsl:for-each>
                        <xsl:for-each select="classification-national">
                            <pat:NationalClassification>
                                <xsl:for-each select="@id">
                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                </xsl:for-each>
                                <com:IPOfficeCode>
                                    <xsl:sequence select="fn:string(country)"/>
                                </com:IPOfficeCode>
                                <xsl:for-each select="edition">
                                    <com:Edition>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:Edition>
                                </xsl:for-each>
                                <pat:MainNationalClassification>
                                    <xsl:for-each select="(./main-clsf/node())[fn:boolean(self::text())]">
                                        <pat:PatentClassificationText>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </pat:PatentClassificationText>
                                    </xsl:for-each>
                                </pat:MainNationalClassification>
                                <xsl:for-each select="further-clsf">
                                    <pat:FurtherNationalClassification>
                                        <xsl:for-each select="@id">
                                            <xsl:attribute name="com:id" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <pat:PatentClassificationText>
                                                <xsl:sequence select="fn:string(.)"/>
                                            </pat:PatentClassificationText>
                                        </xsl:for-each>
                                    </pat:FurtherNationalClassification>
                                </xsl:for-each>
                            </pat:NationalClassification>
                        </xsl:for-each>
                        <xsl:for-each select="classification-locarno">
                            <xsl:variable name="var8_edition" as="node()" select="edition"/>
                            <com:LocarnoClassificationBag>
                                <xsl:for-each select="@id">
                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                </xsl:for-each>
                                <com:LocarnoClassificationEdition>
                                    <xsl:sequence select="fn:string($var8_edition)"/>
                                </com:LocarnoClassificationEdition>
                                <xsl:for-each select="($var8_edition/node())[fn:boolean(self::text())]">
                                    <com:LocarnoClassificationDate>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:LocarnoClassificationDate>
                                </xsl:for-each>
                                <com:LocarnoClassification>
                                    <com:LocarnoClass>
                                        <xsl:sequence select="fn:string(main-clsf)"/>
                                    </com:LocarnoClass>
                                </com:LocarnoClassification>
                                <xsl:for-each select="text">
                                    <com:LocarnoClassificationText>
                                        <xsl:sequence select="fn:string(.)"/>
                                    </com:LocarnoClassificationText>
                                </xsl:for-each>
                            </com:LocarnoClassificationBag>
                        </xsl:for-each>
                    </pat:PatentClassificationBag>
                    <pat:InventionTitleBag>
                        <xsl:for-each select="invention-title">
                            <pat:InventionTitle>
                                <xsl:for-each select="@id">
                                    <xsl:attribute name="com:id" select="fn:string(.)"/>
                                </xsl:for-each>
                                <xsl:for-each select="@lang">
                                    <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                                </xsl:for-each>
                                <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                                <xsl:for-each select="b">
                                    <com:B>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:B>
                                </xsl:for-each>
                                <xsl:for-each select="i">
                                    <com:I>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:I>
                                </xsl:for-each>
                                <xsl:for-each select="o">
                                    <com:O>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:O>
                                </xsl:for-each>
                                <xsl:for-each select="u">
                                    <com:U>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:U>
                                </xsl:for-each>
                                <xsl:for-each select="sup">
                                    <com:Sub>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:Sub>
                                </xsl:for-each>
                                <xsl:for-each select="sub">
                                    <com:Sup>
                                        <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:for-each>
                                    </com:Sup>
                                </xsl:for-each>
                            </pat:InventionTitle>
                        </xsl:for-each>
                    </pat:InventionTitleBag>
                    <xsl:for-each select=".//references-cited">
                        <xsl:variable name="var11_citation" as="node()*" select="citation"/>
                        <pat:ReferenceCitationBag>
                            <xsl:for-each select="$var11_citation/@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="$var11_citation">
                                <pat:ReferenceCitation>
                                    <xsl:for-each select="(./category/node())[fn:boolean(self::text())]">
                                        <xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
                                            <xsl:call-template name="vmf:vmf_b_3_inputtoresult">
                                                <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var9_resultof_vmf__inputtoresult">
                                            <xsl:attribute name="pat:citingPartyCategory" select="."/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                    <xsl:for-each select=".//patcit">
                                        <com:PatentCitation>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@num">
                                                <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="text">
                                                <com:PatentCitationText>
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </com:PatentCitationText>
                                            </xsl:for-each>
                                            <xsl:for-each select="document-id">
                                                <com:CitedPatentDocumentIdentification>
                                                    <xsl:for-each select="@lang">
                                                        <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                    <com:IPOfficeCode>
                                                        <xsl:sequence select="fn:string(country)"/>
                                                    </com:IPOfficeCode>
                                                    <com:DocumentNumber>
                                                        <xsl:sequence select="fn:string(doc-number)"/>
                                                    </com:DocumentNumber>
                                                    <xsl:for-each select="name">
                                                        <com:EntityName>
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </com:EntityName>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="kind">
                                                        <com:PatentDocumentKindCode>
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </com:PatentDocumentKindCode>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="date">
                                                        <com:PatentDocumentDate>
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </com:PatentDocumentDate>
                                                    </xsl:for-each>
                                                </com:CitedPatentDocumentIdentification>
                                            </xsl:for-each>
                                        </com:PatentCitation>
                                    </xsl:for-each>
                                    <xsl:for-each select=".//nplcit">
                                        <com:NPLCitation>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@lang">
                                                <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@num">
                                                <xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="othercit">
                                                <com:NPLCitationText>
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </com:NPLCitationText>
                                            </xsl:for-each>
                                            <xsl:for-each select="book">
                                                <com:CitedBook>
                                                    <xsl:for-each select="notes">
                                                        <com:Notes>
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </com:Notes>
                                                    </xsl:for-each>
                                                </com:CitedBook>
                                            </xsl:for-each>
                                            <xsl:for-each select="article">
                                                <com:CitedJournalArticle>
                                                    <xsl:sequence select="()"/>
                                                </com:CitedJournalArticle>
                                            </xsl:for-each>
                                        </com:NPLCitation>
                                    </xsl:for-each>
                                    <xsl:for-each select="rel-passage">
                                        <pat:CitedPassageBag>
                                            <pat:CitedPassage>
                                                <pat:PassageRangeBag>
                                                    <xsl:for-each select="text">
                                                        <pat:PassageRangeText>
                                                            <xsl:sequence select="fn:string(.)"/>
                                                        </pat:PassageRangeText>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="passage">
                                                        <pat:PassageRange>
                                                            <pat:PassageRangeStart>
                                                                <xsl:sequence select="()"/>
                                                            </pat:PassageRangeStart>
                                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                                <pat:PassageRangeEnd>
                                                                    <xsl:sequence select="()"/>
                                                                </pat:PassageRangeEnd>
                                                            </xsl:for-each>
                                                        </pat:PassageRange>
                                                    </xsl:for-each>
                                                </pat:PassageRangeBag>
                                                <pat:PassageRelevanceBag>
                                                    <pat:PassageRelevance>
                                                        <xsl:for-each select="category">
                                                            <pat:CitationCategoryCode>
                                                                <xsl:sequence select="fn:string(.)"/>
                                                            </pat:CitationCategoryCode>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="rel-claims">
                                                            <xsl:variable name="var10_resultof_filter" as="node()*"
                                                                          select="(./node())[fn:boolean(self::text())]"/>
                                                            <pat:RelatedClaimBag>
                                                                <pat:PatentClaimRange>
                                                                    <xsl:for-each select="$var10_resultof_filter">
                                                                        <pat:PatentClaimStartNumber>
                                                                            <xsl:sequence
                                                                                    select="xs:string(xs:integer(fn:string(.)))"/>
                                                                        </pat:PatentClaimStartNumber>
                                                                    </xsl:for-each>
                                                                    <xsl:for-each select="$var10_resultof_filter">
                                                                        <pat:PatentClaimEndNumber>
                                                                            <xsl:sequence
                                                                                    select="xs:string(xs:integer(fn:string(.)))"/>
                                                                        </pat:PatentClaimEndNumber>
                                                                    </xsl:for-each>
                                                                </pat:PatentClaimRange>
                                                            </pat:RelatedClaimBag>
                                                        </xsl:for-each>
                                                    </pat:PassageRelevance>
                                                </pat:PassageRelevanceBag>
                                            </pat:CitedPassage>
                                        </pat:CitedPassageBag>
                                    </xsl:for-each>
                                </pat:ReferenceCitation>
                            </xsl:for-each>
                        </pat:ReferenceCitationBag>
                    </xsl:for-each>
                    <xsl:for-each select="number-of-claims">
                        <pat:ClaimTotalQuantity>
                            <xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
                        </pat:ClaimTotalQuantity>
                    </xsl:for-each>
                    <xsl:for-each select="figures">
                        <pat:FigureBag>
                            <xsl:for-each select="(./number-of-drawing-sheets/node())[fn:boolean(self::text())]">
                                <pat:DrawingSheetTotalQuantity>
                                    <xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
                                </pat:DrawingSheetTotalQuantity>
                            </xsl:for-each>
                            <xsl:for-each select="(./number-of-figures/node())[fn:boolean(self::text())]">
                                <pat:FigureTotalQuantity>
                                    <xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
                                </pat:FigureTotalQuantity>
                            </xsl:for-each>
                            <xsl:for-each select="figure-to-publish">
                                <pat:PublishFigure>
                                    <xsl:for-each select="(./fig-number/node())[fn:boolean(self::text())]">
                                        <pat:FigureNumber>
                                            <xsl:sequence select="fn:string(.)"/>
                                        </pat:FigureNumber>
                                    </xsl:for-each>
                                </pat:PublishFigure>
                            </xsl:for-each>
                        </pat:FigureBag>
                    </xsl:for-each>
                    <xsl:variable name="var34_parties" as="node()" select="cn-parties"/>
                    <xsl:variable name="var33_assignees" as="node()" select="."/>
                    <xsl:variable name="var32_resultof_ST__partiesToST__PartyBag" as="node()?">
                        <xsl:call-template name="WIPO:ST36partiesToST96PartyBag">
                            <xsl:with-param name="parties" as="node()">
                                <parties>
                                    <xsl:sequence select="($var34_parties/@node(), $var34_parties/node())"/>
                                </parties>
                            </xsl:with-param>
                            <xsl:with-param name="assignees" as="node()">
                                <assignees>
                                    <xsl:sequence select="($var33_assignees/@node(), $var33_assignees/node())"/>
                                </assignees>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var32_resultof_ST__partiesToST__PartyBag">
                        <pat:PartyBag>
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </pat:PartyBag>
                    </xsl:for-each>
<!--                    <xsl:for-each select="//bio-deposit">-->
<!--                        <xsl:variable name="var43_resultof_ST__bio_depositToST__BioDeposit_Bib" as="node()?">-->
<!--                            <xsl:call-template name="WIPO:ST36bio-depositToST96BioDeposit-Bib">-->
<!--                                <xsl:with-param name="biodeposit" as="node()">-->
<!--                                    <bio-deposit>-->
<!--                                        <xsl:sequence select="(./@node(), ./node())"/>-->
<!--                                    </bio-deposit>-->
<!--                                </xsl:with-param>-->
<!--                            </xsl:call-template>-->
<!--                        </xsl:variable>-->
<!--                        <xsl:for-each select="$var43_resultof_ST__bio_depositToST__BioDeposit_Bib">-->
<!--                            <com:BioDeposit>-->
<!--                                <xsl:sequence select="(./@node(), ./node())"/>-->
<!--                            </com:BioDeposit>-->
<!--                        </xsl:for-each>-->
<!--                    </xsl:for-each>-->
                </xsl:for-each>

            </pat:BibliographicData>
            <xsl:for-each select="($var381_doc_page_of_patent_application)[fn:not(fn:exists(@ocr))]">
                <pat:PageImage>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@ppf">
                        <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@ppl">
                        <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(@file)))"/>
                    <xsl:for-each select="@orientation">
                        <xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
                            <xsl:call-template name="vmf:vmf_a_1_inputtoresult">
                                <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:for-each select="$var1_resultof_vmf__inputtoresult">
                            <xsl:attribute name="com:orientationCategory" select="."/>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
                        <xsl:call-template name="vmf:vmf_a_2_inputtoresult">
                            <xsl:with-param name="input" select="fn:string(@type)" as="xs:string"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$var2_resultof_vmf__inputtoresult">
                        <com:ImageFormatCategory>
                            <xsl:sequence select="."/>
                        </com:ImageFormatCategory>
                    </xsl:for-each>
                    <com:HeightMeasure>
                        <xsl:sequence select="xs:string(xs:decimal(fn:string(@he)))"/>
                    </com:HeightMeasure>
                    <com:WidthMeasure>
                        <xsl:sequence select="xs:string(xs:decimal(fn:string(@wi)))"/>
                    </com:WidthMeasure>
                    <xsl:for-each select="@alt">
                        <com:Alt>
                            <xsl:sequence select="fn:string(.)"/>
                        </com:Alt>
                    </xsl:for-each>
                    <xsl:for-each select="@color">
                        <xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
                            <xsl:call-template name="vmf:vmf_a_3_inputtoresult">
                                <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:for-each select="$var3_resultof_vmf__inputtoresult">
                            <com:ColourModeCategory>
                                <xsl:sequence select="."/>
                            </com:ColourModeCategory>
                        </xsl:for-each>
                    </xsl:for-each>
                </pat:PageImage>
            </xsl:for-each>
            <xsl:for-each select="($var381_doc_page_of_patent_application)[fn:exists(@ocr)]">
                <pat:DocumentURI>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:attribute name="com:documentFileName" select="fn:string(@file)"/>
                    <xsl:for-each select="@ppf">
                        <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@ppl">
                        <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:attribute name="pat:pageDocumentFormatCategory" select="fn:string(@type)"/>
                    <xsl:for-each select="@ocr">
                        <xsl:attribute name="pat:ocrIndicator" select="xs:string(xs:boolean(fn:string(.)))"/>
                    </xsl:for-each>
                </pat:DocumentURI>
            </xsl:for-each>
            <xsl:for-each select="$var382_patent_application/application-body/description">
                <xsl:variable name="var364_doc_page" as="node()*" select="doc-page"/>
                <pat:Description>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@lang">
                        <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="($var364_doc_page)[fn:not(fn:exists(@ocr))]">
                        <pat:PageImage>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(@file)))"/>
                            <xsl:for-each select="@orientation">
                                <xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_1_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var4_resultof_vmf__inputtoresult">
                                    <xsl:attribute name="com:orientationCategory" select="."/>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf_a_2_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(@type)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var5_resultof_vmf__inputtoresult">
                                <com:ImageFormatCategory>
                                    <xsl:sequence select="."/>
                                </com:ImageFormatCategory>
                            </xsl:for-each>
                            <com:HeightMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@he)))"/>
                            </com:HeightMeasure>
                            <com:WidthMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@wi)))"/>
                            </com:WidthMeasure>
                            <xsl:for-each select="@alt">
                                <com:Alt>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:Alt>
                            </xsl:for-each>
                            <xsl:for-each select="@color">
                                <xsl:variable name="var6_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_3_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var6_resultof_vmf__inputtoresult">
                                    <com:ColourModeCategory>
                                        <xsl:sequence select="."/>
                                    </com:ColourModeCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:PageImage>
                    </xsl:for-each>
                    <xsl:for-each select="($var364_doc_page)[fn:exists(@ocr)]">
                        <pat:DocumentURI>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:documentFileName" select="fn:string(@file)"/>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="pat:pageDocumentFormatCategory" select="fn:string(@type)"/>
                            <xsl:for-each select="@ocr">
                                <xsl:attribute name="pat:ocrIndicator" select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                        </pat:DocumentURI>
                    </xsl:for-each>
                    <xsl:for-each select="invention-title">
                        <pat:InventionTitle>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@lang">
                                <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="node()">
                                <xsl:if test="fn:boolean(self::text())">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:if>
                                <xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::b)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var8_resultof_ST__bToST__B" as="node()*">
                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                            <xsl:with-param name="b" as="node()">
                                                <b>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </b>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var8_resultof_ST__bToST__B">
                                        <com:B>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:B>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var9_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::i)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var10_resultof_ST__iToST__I" as="node()?">
                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                            <xsl:with-param name="i" as="node()">
                                                <i>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </i>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var10_resultof_ST__iToST__I">
                                        <com:I>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:I>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var11_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::o)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var12_resultof_ST__oToST__O" as="node()?">
                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                            <xsl:with-param name="o" as="node()">
                                                <o>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </o>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var12_resultof_ST__oToST__O">
                                        <com:O>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:O>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::u)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var14_resultof_ST__uToST__U" as="node()?">
                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                            <xsl:with-param name="u" as="node()">
                                                <u>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </u>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var14_resultof_ST__uToST__U">
                                        <com:U>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:U>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::sub)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var16_resultof_ST__subToST__Sub" as="node()?">
                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                            <xsl:with-param name="sub" as="node()">
                                                <sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </sub>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var16_resultof_ST__subToST__Sub">
                                        <com:Sub>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:Sub>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::sup)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var18_resultof_ST__supToST__Sup" as="node()?">
                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                            <xsl:with-param name="sup" as="node()">
                                                <sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </sup>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var18_resultof_ST__supToST__Sup">
                                        <com:Sup>
                                            <xsl:sequence select="(./@node(), ./node())"/>
                                        </com:Sup>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:InventionTitle>
                    </xsl:for-each>
                    <xsl:for-each select=".//technical-field">
                        <pat:TechnicalField>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var20_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var20_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var22_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var22_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var24_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var24_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var26_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var26_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var28_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var28_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var30_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var30_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var32_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var32_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var33_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var33_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:TechnicalField>
                    </xsl:for-each>
                    <xsl:for-each select=".//background-art">
                        <pat:BackgroundArt>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var35_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var35_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var37_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var37_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var39_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var39_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var41_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var41_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var43_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var43_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var45_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var45_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var46_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var47_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var47_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var48_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var48_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:BackgroundArt>
                    </xsl:for-each>
                    <xsl:for-each select=".//disclosure">
                        <pat:Disclosure>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="tech-problem">
                                <pat:TechnicalProblem>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var49_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var49_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var50_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var50_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var51_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var51_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var52_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var52_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var53_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var53_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var54_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var54_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var55_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var55_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var56_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var56_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var57_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var57_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var58_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var58_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var59_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var59_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var60_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var60_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var61_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var61_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var62_resultof_ST__smallcapsToST__SmallCapitals"
                                                                  as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var62_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var63_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var63_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:TechnicalProblem>
                            </xsl:for-each>
                            <xsl:for-each select="tech-solution">
                                <pat:TechnicalSolution>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var64_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var64_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var65_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var65_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var66_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var66_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var67_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var67_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var68_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var68_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var69_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var69_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var70_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var70_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var71_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var71_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var72_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var72_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var73_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var73_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var74_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var74_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var75_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var75_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var76_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var76_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var77_resultof_ST__smallcapsToST__SmallCapitals"
                                                                  as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var77_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var78_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var78_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:TechnicalSolution>
                            </xsl:for-each>
                            <xsl:for-each select="advantageocn-effects">
                                <pat:AdvantageousEffects>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var79_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var79_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var80_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var80_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var81_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var81_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var82_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var82_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var83_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var83_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var84_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var84_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var85_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var85_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var86_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var86_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var87_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var87_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var88_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var88_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var89_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var89_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var90_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var90_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var91_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var91_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var92_resultof_ST__smallcapsToST__SmallCapitals"
                                                                  as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var92_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var93_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var93_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:AdvantageousEffects>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var94_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var94_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var95_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var95_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var96_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var96_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var97_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var97_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var98_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var98_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var99_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var99_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var100_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var100_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var101_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var101_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var102_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var102_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var103_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var103_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var104_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var104_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var105_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var105_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var106_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var106_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var107_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var107_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var108_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var108_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:Disclosure>
                    </xsl:for-each>
                    <xsl:for-each select=".//summary-of-invention">
                        <pat:InventionSummary>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="tech-problem">
                                <pat:TechnicalProblem>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var109_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var109_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var110_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var110_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var111_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var111_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var112_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var112_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var113_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var113_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var114_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var114_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var115_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var115_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var116_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var116_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var117_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var117_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var118_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var118_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var119_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var119_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var120_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var120_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var121_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var121_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var122_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var122_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var123_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var123_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:TechnicalProblem>
                            </xsl:for-each>
                            <xsl:for-each select="tech-solution">
                                <pat:TechnicalSolution>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var124_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var124_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var125_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var125_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var126_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var126_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var127_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var127_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var128_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var128_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var129_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var129_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var130_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var130_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var131_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var131_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var132_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var132_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var133_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var133_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var134_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var134_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var135_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var135_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var136_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var136_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var137_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var137_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var138_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var138_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:TechnicalSolution>
                            </xsl:for-each>
                            <xsl:for-each select="advantageocn-effects">
                                <pat:AdvantageousEffects>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var139_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var139_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var140_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var140_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var141_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var141_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var142_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var142_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var143_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var143_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var144_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var144_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var145_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var145_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var146_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var146_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var147_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var147_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var148_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var148_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var149_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var149_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var150_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var150_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var151_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var151_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var152_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var152_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var153_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var153_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:AdvantageousEffects>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var154_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var154_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var155_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var155_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var156_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var156_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var157_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var157_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var158_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var158_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var159_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var159_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var160_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var160_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var161_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var161_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var162_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var162_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var163_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var163_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var164_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var164_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var165_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var165_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var166_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var166_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var167_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var167_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var168_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var168_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:InventionSummary>
                    </xsl:for-each>
                    <xsl:for-each select=".//description-of-drawings">
                        <pat:DrawingDescription>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var169_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var169_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var170_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var170_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var171_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var171_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var172_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var172_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var173_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var173_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var174_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var174_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var175_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var175_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var176_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var176_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var177_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var177_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var178_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var178_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var179_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var179_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var180_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var180_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var181_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var181_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var182_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var182_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var183_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var183_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:DrawingDescription>
                    </xsl:for-each>
                    <xsl:for-each select=".//description-of-embodiments">
                        <pat:EmbodimentDescription>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="embodiments-example">
                                <pat:EmbodimentExample>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@ex-num">
                                        <xsl:attribute name="pat:exampleNumber" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var184_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var184_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var185_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var185_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var186_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var186_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var187_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var187_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var188_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var188_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var189_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var189_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var190_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var190_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var191_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var191_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var192_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var192_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var193_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var193_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var194_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var194_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var195_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var195_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var196_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var196_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var197_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var197_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var198_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var198_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </pat:EmbodimentExample>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var199_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var199_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var200_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var200_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var201_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var201_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var202_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var202_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var203_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var203_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var204_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var204_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var205_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var205_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var206_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var206_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var207_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var207_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var208_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var208_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var209_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var209_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var210_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var210_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var211_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var211_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var212_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var212_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var213_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var213_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:EmbodimentDescription>
                    </xsl:for-each>
                    <xsl:for-each select=".//best-mode">
                        <pat:BestMode>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var214_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var214_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var215_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var215_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var216_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var216_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var217_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var217_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var218_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var218_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var219_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var219_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var220_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var220_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var221_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var221_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var222_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var222_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var223_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var223_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var224_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var224_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var225_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var225_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var226_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var226_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var227_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var227_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var228_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var228_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:BestMode>
                    </xsl:for-each>
                    <xsl:for-each select=".//mode-for-invention">
                        <pat:InventionMode>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var229_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var229_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var230_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var230_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var231_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var231_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var232_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var232_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var233_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var233_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var234_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var234_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var235_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var235_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var236_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var236_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var237_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var237_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var238_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var238_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var239_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var239_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var240_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var240_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var241_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var241_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var242_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var242_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var243_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var243_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:InventionMode>
                    </xsl:for-each>
                    <xsl:for-each select=".//industrial-applicability">
                        <pat:IndustrialApplicability>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var244_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var244_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var245_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var245_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var246_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var246_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var247_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var247_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var248_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var248_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var249_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var249_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var250_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var250_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var251_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var251_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var252_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var252_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var253_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var253_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var254_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var254_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var255_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var255_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var256_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var256_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var257_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var257_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var258_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var258_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:IndustrialApplicability>
                    </xsl:for-each>
                    <xsl:for-each select=".//reference-signs-list">
                        <pat:ReferenceSignBag>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var259_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var259_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var260_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var260_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var261_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var261_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var262_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var262_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var263_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var263_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var264_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var264_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var265_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var265_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var266_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var266_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var267_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var267_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var268_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var268_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var269_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var269_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var270_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var270_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var271_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var271_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var272_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var272_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var273_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var273_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:ReferenceSignBag>
                    </xsl:for-each>
                    <xsl:for-each select=".//reference-to-deposited-biological-material">
                        <pat:DepositedBiologicalMaterialReference>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var274_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var274_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var275_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var275_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var276_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var276_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var277_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var277_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var278_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var278_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var279_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var279_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var280_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var280_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var281_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var281_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var282_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var282_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var283_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var283_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var284_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var284_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var285_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var285_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var286_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var286_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var287_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var287_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var288_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var288_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:DepositedBiologicalMaterialReference>
                    </xsl:for-each>
                    <xsl:for-each select=".//sequence-list-text">
                        <pat:SequenceListText>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var289_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var289_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var290_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var290_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var291_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var291_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var292_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var292_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var293_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var293_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var294_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var294_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var295_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var295_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var296_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var296_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var297_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var297_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var298_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var298_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var299_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var299_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var300_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var300_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var301_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var301_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var302_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var302_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var303_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var303_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:SequenceListText>
                    </xsl:for-each>
                    <xsl:for-each select=".//citation-list">
                        <com:CitationBag>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading">
                                <com:Heading>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="@level">
                                        <xsl:attribute name="com:headingLevelCode"
                                                       select="fn:concat('H', fn:string(.))"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="node()">
                                        <xsl:if test="fn:boolean(self::text())">
                                            <xsl:sequence select="fn:string(.)"/>
                                        </xsl:if>
                                        <xsl:variable name="var304_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::b)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var304_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var305_resultof_ST__bToST__B" as="node()*">
                                                <xsl:call-template name="WIPO:ST36bToST96B">
                                                    <xsl:with-param name="b" as="node()">
                                                        <b>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </b>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var305_resultof_ST__bToST__B">
                                                <com:B>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:B>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var306_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::i)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var306_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var307_resultof_ST__iToST__I" as="node()?">
                                                <xsl:call-template name="WIPO:ST36iToST96I">
                                                    <xsl:with-param name="i" as="node()">
                                                        <i>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </i>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var307_resultof_ST__iToST__I">
                                                <com:I>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:I>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var308_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::o)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var308_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var309_resultof_ST__oToST__O" as="node()?">
                                                <xsl:call-template name="WIPO:ST36oToST96O">
                                                    <xsl:with-param name="o" as="node()">
                                                        <o>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </o>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var309_resultof_ST__oToST__O">
                                                <com:O>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:O>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var310_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::u)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var310_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var311_resultof_ST__uToST__U" as="node()?">
                                                <xsl:call-template name="WIPO:ST36uToST96U">
                                                    <xsl:with-param name="u" as="node()">
                                                        <u>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </u>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var311_resultof_ST__uToST__U">
                                                <com:U>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:U>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var312_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sub)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var312_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var313_resultof_ST__subToST__Sub" as="node()?">
                                                <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                    <xsl:with-param name="sub" as="node()">
                                                        <sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sub>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var313_resultof_ST__subToST__Sub">
                                                <com:Sub>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sub>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var314_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::sup)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var314_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var315_resultof_ST__supToST__Sup" as="node()?">
                                                <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                    <xsl:with-param name="sup" as="node()">
                                                        <sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </sup>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var315_resultof_ST__supToST__Sup">
                                                <com:Sup>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:Sup>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        <xsl:variable name="var316_test_resultof_node_name_equal_qname" as="node()?">
                                            <xsl:if test="fn:boolean(self::smallcaps)">
                                                <xsl:sequence select="."/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:for-each select="$var316_test_resultof_node_name_equal_qname">
                                            <xsl:variable name="var317_resultof_ST__smallcapsToST__SmallCapitals"
                                                          as="node()?">
                                                <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                    <xsl:with-param name="smallcaps" as="node()">
                                                        <smallcaps>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </smallcaps>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:for-each select="$var317_resultof_ST__smallcapsToST__SmallCapitals">
                                                <com:SmallCapital>
                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                </com:SmallCapital>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:Heading>
                            </xsl:for-each>
                            <xsl:for-each select="p">
                                <xsl:variable name="var318_resultof_ST__pToSt__P" as="node()?">
                                    <xsl:call-template name="WIPO:ST36pToSt96P">
                                        <xsl:with-param name="p" as="node()">
                                            <p>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </p>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var318_resultof_ST__pToSt__P">
                                    <com:P>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </com:P>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="patent-literature">
                                <com:PatentCitationBag>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var319_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var319_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var320_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var320_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var321_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var321_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var322_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var322_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var323_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var323_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var324_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var324_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var325_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var325_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var326_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var326_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var327_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var327_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var328_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var328_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var329_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var329_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var330_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var330_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var331_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var331_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var332_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var332_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var333_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var333_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:PatentCitationBag>
                            </xsl:for-each>
                            <xsl:for-each select="non-patent-literature">
                                <com:NPLCitationBag>
                                    <xsl:for-each select="heading">
                                        <com:Heading>
                                            <xsl:for-each select="@id">
                                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="@level">
                                                <xsl:attribute name="com:headingLevelCode"
                                                               select="fn:concat('H', fn:string(.))"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="node()">
                                                <xsl:if test="fn:boolean(self::text())">
                                                    <xsl:sequence select="fn:string(.)"/>
                                                </xsl:if>
                                                <xsl:variable name="var334_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::b)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var334_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var335_resultof_ST__bToST__B" as="node()*">
                                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                                            <xsl:with-param name="b" as="node()">
                                                                <b>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </b>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var335_resultof_ST__bToST__B">
                                                        <com:B>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:B>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var336_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::i)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var336_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var337_resultof_ST__iToST__I" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                                            <xsl:with-param name="i" as="node()">
                                                                <i>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </i>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var337_resultof_ST__iToST__I">
                                                        <com:I>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:I>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var338_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::o)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var338_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var339_resultof_ST__oToST__O" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                                            <xsl:with-param name="o" as="node()">
                                                                <o>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </o>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var339_resultof_ST__oToST__O">
                                                        <com:O>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:O>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var340_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::u)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var340_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var341_resultof_ST__uToST__U" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                                            <xsl:with-param name="u" as="node()">
                                                                <u>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </u>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var341_resultof_ST__uToST__U">
                                                        <com:U>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:U>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var342_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sub)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var342_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var343_resultof_ST__subToST__Sub" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                                            <xsl:with-param name="sub" as="node()">
                                                                <sub>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sub>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var343_resultof_ST__subToST__Sub">
                                                        <com:Sub>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sub>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var344_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::sup)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var344_test_resultof_node_name_equal_qname">
                                                    <xsl:variable name="var345_resultof_ST__supToST__Sup" as="node()?">
                                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                                            <xsl:with-param name="sup" as="node()">
                                                                <sup>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </sup>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each select="$var345_resultof_ST__supToST__Sup">
                                                        <com:Sup>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:Sup>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                <xsl:variable name="var346_test_resultof_node_name_equal_qname"
                                                              as="node()?">
                                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                                        <xsl:sequence select="."/>
                                                    </xsl:if>
                                                </xsl:variable>
                                                <xsl:for-each select="$var346_test_resultof_node_name_equal_qname">
                                                    <xsl:variable
                                                            name="var347_resultof_ST__smallcapsToST__SmallCapitals"
                                                            as="node()?">
                                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                                            <xsl:with-param name="smallcaps" as="node()">
                                                                <smallcaps>
                                                                    <xsl:sequence select="(./@node(), ./node())"/>
                                                                </smallcaps>
                                                            </xsl:with-param>
                                                        </xsl:call-template>
                                                    </xsl:variable>
                                                    <xsl:for-each
                                                            select="$var347_resultof_ST__smallcapsToST__SmallCapitals">
                                                        <com:SmallCapital>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </com:SmallCapital>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </com:Heading>
                                    </xsl:for-each>
                                    <xsl:for-each select="p">
                                        <xsl:variable name="var348_resultof_ST__pToSt__P" as="node()?">
                                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                                <xsl:with-param name="p" as="node()">
                                                    <p>
                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                    </p>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:for-each select="$var348_resultof_ST__pToSt__P">
                                            <com:P>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </com:P>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </com:NPLCitationBag>
                            </xsl:for-each>
                        </com:CitationBag>
                    </xsl:for-each>
                    <xsl:for-each select="heading">
                        <com:Heading>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@level">
                                <xsl:attribute name="com:headingLevelCode" select="fn:concat('H', fn:string(.))"/>
                            </xsl:for-each>
                            <xsl:for-each select="node()">
                                <xsl:if test="fn:boolean(self::text())">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:if>
                                <xsl:variable name="var349_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::b)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var349_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var350_resultof_ST__bToST__B" as="node()*">
                                        <xsl:call-template name="WIPO:ST36bToST96B">
                                            <xsl:with-param name="b" as="node()">
                                                <b>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </b>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var350_resultof_ST__bToST__B">
                                        <com:B>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:B>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var351_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::i)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var351_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var352_resultof_ST__iToST__I" as="node()?">
                                        <xsl:call-template name="WIPO:ST36iToST96I">
                                            <xsl:with-param name="i" as="node()">
                                                <i>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </i>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var352_resultof_ST__iToST__I">
                                        <com:I>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:I>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var353_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::o)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var353_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var354_resultof_ST__oToST__O" as="node()?">
                                        <xsl:call-template name="WIPO:ST36oToST96O">
                                            <xsl:with-param name="o" as="node()">
                                                <o>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </o>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var354_resultof_ST__oToST__O">
                                        <com:O>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:O>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var355_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::u)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var355_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var356_resultof_ST__uToST__U" as="node()?">
                                        <xsl:call-template name="WIPO:ST36uToST96U">
                                            <xsl:with-param name="u" as="node()">
                                                <u>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </u>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var356_resultof_ST__uToST__U">
                                        <com:U>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:U>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var357_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::sub)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var357_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var358_resultof_ST__subToST__Sub" as="node()?">
                                        <xsl:call-template name="WIPO:ST36subToST96Sub">
                                            <xsl:with-param name="sub" as="node()">
                                                <sub>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </sub>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var358_resultof_ST__subToST__Sub">
                                        <com:Sub>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:Sub>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var359_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::sup)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var359_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var360_resultof_ST__supToST__Sup" as="node()?">
                                        <xsl:call-template name="WIPO:ST36supToST96Sup">
                                            <xsl:with-param name="sup" as="node()">
                                                <sup>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </sup>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var360_resultof_ST__supToST__Sup">
                                        <com:Sup>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:Sup>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <xsl:variable name="var361_test_resultof_node_name_equal_qname" as="node()?">
                                    <xsl:if test="fn:boolean(self::smallcaps)">
                                        <xsl:sequence select="."/>
                                    </xsl:if>
                                </xsl:variable>
                                <xsl:for-each select="$var361_test_resultof_node_name_equal_qname">
                                    <xsl:variable name="var362_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
                                        <xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
                                            <xsl:with-param name="smallcaps" as="node()">
                                                <smallcaps>
                                                    <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:for-each>
                                                </smallcaps>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:for-each select="$var362_resultof_ST__smallcapsToST__SmallCapitals">
                                        <com:SmallCapital>
                                            <xsl:for-each select="(./node())[fn:boolean(self::text())]">
                                                <xsl:sequence select="fn:string(.)"/>
                                            </xsl:for-each>
                                        </com:SmallCapital>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </com:Heading>
                    </xsl:for-each>
                    <xsl:for-each select="p">
                        <xsl:variable name="var363_resultof_ST__pToSt__P" as="node()?">
                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                <xsl:with-param name="p" as="node()">
                                    <p>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </p>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:for-each select="$var363_resultof_ST__pToSt__P">
                            <com:P>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:P>
                        </xsl:for-each>
                    </xsl:for-each>
                </pat:Description>
            </xsl:for-each>
            <xsl:for-each select="$var382_patent_application/application-body/claims">
                <xsl:variable name="var369_doc_page" as="node()*" select="doc-page"/>
                <pat:Claims>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@lang">
                        <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="($var369_doc_page)[fn:not(fn:exists(@ocr))]">
                        <pat:PageImage>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(@file)))"/>
                            <xsl:for-each select="@orientation">
                                <xsl:variable name="var365_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_1_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var365_resultof_vmf__inputtoresult">
                                    <xsl:attribute name="com:orientationCategory" select="."/>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var366_resultof_vmf__inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf_a_2_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(@type)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var366_resultof_vmf__inputtoresult">
                                <com:ImageFormatCategory>
                                    <xsl:sequence select="."/>
                                </com:ImageFormatCategory>
                            </xsl:for-each>
                            <com:HeightMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@he)))"/>
                            </com:HeightMeasure>
                            <com:WidthMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@wi)))"/>
                            </com:WidthMeasure>
                            <xsl:for-each select="@alt">
                                <com:Alt>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:Alt>
                            </xsl:for-each>
                            <xsl:for-each select="@color">
                                <xsl:variable name="var367_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_3_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var367_resultof_vmf__inputtoresult">
                                    <com:ColourModeCategory>
                                        <xsl:sequence select="."/>
                                    </com:ColourModeCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:PageImage>
                    </xsl:for-each>
                    <xsl:for-each select="($var369_doc_page)[fn:exists(@ocr)]">
                        <pat:DocumentURI>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:documentFileName" select="fn:string(@file)"/>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="pat:pageDocumentFormatCategory" select="fn:string(@type)"/>
                            <xsl:for-each select="@ocr">
                                <xsl:attribute name="pat:ocrIndicator" select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                        </pat:DocumentURI>
                    </xsl:for-each>
                    <xsl:for-each select="claim">
                        <pat:Claim>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <pat:ClaimNumber>
                                <xsl:sequence select="fn:string(@num)"/>
                            </pat:ClaimNumber>
                            <xsl:for-each select="claim-text">
                                <xsl:variable name="var368_resultof_ST__claim_textToST__ClaimText" as="node()?">
                                    <xsl:call-template name="WIPO:ST36claim-textToST96ClaimText">
                                        <xsl:with-param name="claimtext" as="node()">
                                            <claim-text>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </claim-text>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var368_resultof_ST__claim_textToST__ClaimText">
                                    <pat:ClaimText>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </pat:ClaimText>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:Claim>
                    </xsl:for-each>
                </pat:Claims>
            </xsl:for-each>
            <xsl:for-each select="$var382_patent_application/application-body/abstract">
                <xsl:variable name="var374_doc_page" as="node()*" select="doc-page"/>
                <pat:Abstract>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@lang">
                        <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="($var374_doc_page)[fn:not(fn:exists(@ocr))]">
                        <pat:PageImage>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(@file)))"/>
                            <xsl:for-each select="@orientation">
                                <xsl:variable name="var370_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_1_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var370_resultof_vmf__inputtoresult">
                                    <xsl:attribute name="com:orientationCategory" select="."/>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var371_resultof_vmf__inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf_a_2_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(@type)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var371_resultof_vmf__inputtoresult">
                                <com:ImageFormatCategory>
                                    <xsl:sequence select="."/>
                                </com:ImageFormatCategory>
                            </xsl:for-each>
                            <com:HeightMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@he)))"/>
                            </com:HeightMeasure>
                            <com:WidthMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@wi)))"/>
                            </com:WidthMeasure>
                            <xsl:for-each select="@alt">
                                <com:Alt>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:Alt>
                            </xsl:for-each>
                            <xsl:for-each select="@color">
                                <xsl:variable name="var372_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_3_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var372_resultof_vmf__inputtoresult">
                                    <com:ColourModeCategory>
                                        <xsl:sequence select="."/>
                                    </com:ColourModeCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:PageImage>
                    </xsl:for-each>
                    <xsl:for-each select="($var374_doc_page)[fn:exists(@ocr)]">
                        <pat:DocumentURI>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:documentFileName" select="fn:string(@file)"/>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="pat:pageDocumentFormatCategory" select="fn:string(@type)"/>
                            <xsl:for-each select="@ocr">
                                <xsl:attribute name="pat:ocrIndicator" select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                        </pat:DocumentURI>
                    </xsl:for-each>
                    <xsl:for-each select="p">
                        <xsl:variable name="var373_resultof_ST__pToSt__P" as="node()?">
                            <xsl:call-template name="WIPO:ST36pToSt96P">
                                <xsl:with-param name="p" as="node()">
                                    <p>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </p>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:for-each select="$var373_resultof_ST__pToSt__P">
                            <com:P>
                                <xsl:sequence select="(./@node(), ./node())"/>
                            </com:P>
                        </xsl:for-each>
                    </xsl:for-each>
                </pat:Abstract>
            </xsl:for-each>
            <xsl:for-each select="$var382_patent_application/application-body/drawings">
                <xsl:variable name="var380_doc_page" as="node()*" select="doc-page"/>
                <pat:Drawings>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="($var380_doc_page)[fn:not(fn:exists(@ocr))]">
                        <pat:PageImage>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:fileLocationURI" select="xs:string(xs:anyURI(fn:string(@file)))"/>
                            <xsl:for-each select="@orientation">
                                <xsl:variable name="var375_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_1_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var375_resultof_vmf__inputtoresult">
                                    <xsl:attribute name="com:orientationCategory" select="."/>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:variable name="var376_resultof_vmf__inputtoresult" as="xs:string?">
                                <xsl:call-template name="vmf:vmf_a_2_inputtoresult">
                                    <xsl:with-param name="input" select="fn:string(@type)" as="xs:string"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var376_resultof_vmf__inputtoresult">
                                <com:ImageFormatCategory>
                                    <xsl:sequence select="."/>
                                </com:ImageFormatCategory>
                            </xsl:for-each>
                            <com:HeightMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@he)))"/>
                            </com:HeightMeasure>
                            <com:WidthMeasure>
                                <xsl:sequence select="xs:string(xs:decimal(fn:string(@wi)))"/>
                            </com:WidthMeasure>
                            <xsl:for-each select="@alt">
                                <com:Alt>
                                    <xsl:sequence select="fn:string(.)"/>
                                </com:Alt>
                            </xsl:for-each>
                            <xsl:for-each select="@color">
                                <xsl:variable name="var377_resultof_vmf__inputtoresult" as="xs:string?">
                                    <xsl:call-template name="vmf:vmf_a_3_inputtoresult">
                                        <xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <xsl:for-each select="$var377_resultof_vmf__inputtoresult">
                                    <com:ColourModeCategory>
                                        <xsl:sequence select="."/>
                                    </com:ColourModeCategory>
                                </xsl:for-each>
                            </xsl:for-each>
                        </pat:PageImage>
                    </xsl:for-each>
                    <xsl:for-each select="($var380_doc_page)[fn:exists(@ocr)]">
                        <pat:DocumentURI>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="com:documentFileName" select="fn:string(@file)"/>
                            <xsl:for-each select="@ppf">
                                <xsl:attribute name="pat:firstPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="@ppl">
                                <xsl:attribute name="pat:lastPageNumber" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:attribute name="pat:pageDocumentFormatCategory" select="fn:string(@type)"/>
                            <xsl:for-each select="@ocr">
                                <xsl:attribute name="pat:ocrIndicator" select="xs:string(xs:boolean(fn:string(.)))"/>
                            </xsl:for-each>
                        </pat:DocumentURI>
                    </xsl:for-each>
                    <xsl:for-each select="figure">
                        <pat:Figure>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <pat:FigureNumber>
                                <xsl:sequence select="fn:string(@num)"/>
                            </pat:FigureNumber>
                            <xsl:variable name="var379_img" as="node()" select="img"/>
                            <xsl:variable name="var378_resultof_ST__imgToST__Image" as="node()?">
                                <xsl:call-template name="WIPO:ST36imgToST96Image">
                                    <xsl:with-param name="img" as="node()">
                                        <img>
                                            <xsl:sequence select="($var379_img/@node(), $var379_img/node())"/>
                                        </img>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:for-each select="$var378_resultof_ST__imgToST__Image">
                                <com:Image>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </com:Image>
                            </xsl:for-each>
                        </pat:Figure>
                    </xsl:for-each>
                </pat:Drawings>
            </xsl:for-each>
        </pat:PatentPublication>

    </xsl:template>
    <xsl:template match="math/@*" priority="9">
        <xsl:attribute name="{local-name()}" select="."/>
    </xsl:template>
    <xsl:template match="math | math//*" priority="9">
        <xsl:element name="mathml:{local-name()}">
            <xsl:for-each select="@*">
                <xsl:attribute name="{local-name()}" select="."/>
            </xsl:for-each>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
