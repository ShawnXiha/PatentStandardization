<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO" xmlns:mathml="http://www.w3.org/1998/Math/MathML3" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" exclude-result-prefixes="WIPO vmf xs fn">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="xx-patent-document-v2-32" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:param name="xx-patent-document-v2-33" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:param name="xx-patent-document-v2-34" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:param name="xx-patent-document-v2-35" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:param name="xx-patent-document-v2-36" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:param name="xx-patent-document-v2-37" select="'xx-patent-document-v2-3.xml'"/>
	<xsl:template name="WIPO:ST36bio-depositToST96BioDeposit-Bib">
		<xsl:param name="biodeposit" select="()"/>
		<xsl:variable name="var3_depositary" as="node()*" select="$biodeposit/depositary"/>
		<com:BioDeposit>
			<xsl:for-each select="$biodeposit/@id">
				<xsl:attribute name="id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/@num">
				<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/@url">
				<xsl:attribute name="sourceURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:anyURI(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$var3_depositary">
				<xsl:variable name="var2_address" as="node()*" select="*:address[fn:namespace-uri() eq '']"/>
				<BioDepositDepositary>
					<PostalAddressBag>
						<PostalAddress>
							<xsl:for-each select="$var2_address">
								<PostalStructuredAddress>
									<xsl:for-each select="*:address-1[fn:namespace-uri() eq '']">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('1'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-5[fn:namespace-uri() eq '']">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('4'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-4[fn:namespace-uri() eq '']">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('5'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-3[fn:namespace-uri() eq '']">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('3'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-2[fn:namespace-uri() eq '']">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('2'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:city[fn:namespace-uri() eq '']">
										<CityName>
											<xsl:sequence select="fn:string(.)"/>
										</CityName>
									</xsl:for-each>
									<xsl:for-each select="*:county[fn:namespace-uri() eq '']">
										<CountryCode>
											<xsl:sequence select="fn:string(.)"/>
										</CountryCode>
									</xsl:for-each>
									<xsl:for-each select="*:postcode[fn:namespace-uri() eq '']">
										<PostalCode>
											<xsl:sequence select="fn:string(.)"/>
										</PostalCode>
									</xsl:for-each>
									<xsl:for-each select="*:mailcode[fn:namespace-uri() eq '']">
										<PostalCode>
											<xsl:sequence select="fn:string(.)"/>
										</PostalCode>
									</xsl:for-each>
								</PostalStructuredAddress>
							</xsl:for-each>
							<xsl:for-each select="$var2_address">
								<xsl:variable name="var1_cur" as="node()" select="."/>
								<xsl:for-each select="*:text[fn:namespace-uri() eq '']">
									<PostalAddressText>
										<xsl:for-each select="$var1_cur/*:country[fn:namespace-uri() eq '']">
											<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</PostalAddressText>
								</xsl:for-each>
							</xsl:for-each>
						</PostalAddress>
					</PostalAddressBag>
				</BioDepositDepositary>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:bio-accno[fn:namespace-uri() eq '']">
				<BiologicalAccessionNumber>
					<xsl:sequence select="fn:string(.)"/>
				</BiologicalAccessionNumber>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:date[fn:namespace-uri() eq '']">
				<BioDepositDate>
					<xsl:sequence select="fn:string(.)"/>
				</BioDepositDate>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:term[fn:namespace-uri() eq '']">
				<BioDepositTermText>
					<xsl:for-each select="$var3_depositary/*:address[fn:namespace-uri() eq '']/*:text[fn:namespace-uri() eq '']">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</BioDepositTermText>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:dtext[fn:namespace-uri() eq '']">
				<BioDepositText>
					<xsl:sequence select="fn:string(.)"/>
				</BioDepositText>
			</xsl:for-each>
		</com:BioDeposit>
	</xsl:template>
	<xsl:template name="WIPO:ST36address-bookToST96contact">
		<xsl:param name="addressbook" select="()"/>
		<xsl:variable name="var2_ead" as="node()*" select="$addressbook/ead"/>
		<com:Contact>
			<xsl:for-each select="$addressbook/@lang">
				<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
			</xsl:for-each>
			<Name>
				<xsl:for-each select="$addressbook/*:last-name[fn:namespace-uri() eq '']">
					<PersonName>
						<PersonStructuredName>
							<xsl:for-each select="$addressbook/*:prefix[fn:namespace-uri() eq '']">
								<NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:first-name[fn:namespace-uri() eq '']">
								<FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</FirstName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:middle-name[fn:namespace-uri() eq '']">
								<MiddleName>
									<xsl:sequence select="fn:string(.)"/>
								</MiddleName>
							</xsl:for-each>
							<LastName>
								<xsl:sequence select="fn:string(.)"/>
							</LastName>
							<xsl:for-each select="$addressbook/*:first-last-name[fn:namespace-uri() eq '']">
								<FirstLastName>
									<xsl:sequence select="fn:string(.)"/>
								</FirstLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:second-last-name[fn:namespace-uri() eq '']">
								<SecondLastName>
									<xsl:sequence select="fn:string(.)"/>
								</SecondLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:suffix[fn:namespace-uri() eq '']">
								<NameSuffix>
									<xsl:sequence select="fn:string(.)"/>
								</NameSuffix>
							</xsl:for-each>
						</PersonStructuredName>
					</PersonName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:orgname[fn:namespace-uri() eq '']">
					<OrganizationName>
						<OrganizationStandardName>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</OrganizationStandardName>
					</OrganizationName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:name[fn:namespace-uri() eq '']">
					<EntityName>
						<xsl:for-each select="$addressbook/*:role[fn:namespace-uri() eq '']">
							<xsl:attribute name="entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</EntityName>
				</xsl:for-each>
			</Name>
			<PostalAddressBag>
				<xsl:for-each select="$addressbook/*:address[fn:namespace-uri() eq '']">
					<PostalAddress>
						<PostalStructuredAddress>
							<xsl:for-each select="*:address-1[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('1'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-4[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('4'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-2[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('2'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-3[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('3'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-5[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('5'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:pobox[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Postal office box'"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:room[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Room'"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-floor[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Floor'"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:building[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Building'"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:street[fn:namespace-uri() eq '']">
								<AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Street'"/>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:city[fn:namespace-uri() eq '']">
								<CityName>
									<xsl:sequence select="fn:string(.)"/>
								</CityName>
							</xsl:for-each>
							<xsl:for-each select="*:county[fn:namespace-uri() eq '']">
								<GeographicRegionName>
									<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'County'"/>
									<xsl:sequence select="fn:string(.)"/>
								</GeographicRegionName>
							</xsl:for-each>
							<xsl:for-each select="*:state[fn:namespace-uri() eq '']">
								<GeographicRegionName>
									<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'State'"/>
									<xsl:sequence select="fn:string(.)"/>
								</GeographicRegionName>
							</xsl:for-each>
							<xsl:for-each select="*:country[fn:namespace-uri() eq '']">
								<CountryCode>
									<xsl:sequence select="fn:string(.)"/>
								</CountryCode>
							</xsl:for-each>
							<xsl:for-each select="*:mailcode[fn:namespace-uri() eq '']">
								<PostalCode>
									<xsl:sequence select="fn:string(.)"/>
								</PostalCode>
							</xsl:for-each>
							<xsl:for-each select="*:postcode[fn:namespace-uri() eq '']">
								<PostalCode>
									<xsl:sequence select="fn:string(.)"/>
								</PostalCode>
							</xsl:for-each>
						</PostalStructuredAddress>
						<xsl:for-each select="*:text[fn:namespace-uri() eq '']">
							<PostalAddressText>
								<xsl:sequence select="fn:string(.)"/>
							</PostalAddressText>
						</xsl:for-each>
					</PostalAddress>
				</xsl:for-each>
			</PostalAddressBag>
			<xsl:for-each select="$addressbook/*:fax[fn:namespace-uri() eq '']">
				<FaxNumberBag>
					<FaxNumber>
						<xsl:sequence select="fn:string(.)"/>
					</FaxNumber>
				</FaxNumberBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:email[fn:namespace-uri() eq '']">
				<EmailAddressBag>
					<EmailAddressText>
						<xsl:for-each select="@email-purpose">
							<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf5_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
								<xsl:attribute name="emailAddressPurposeCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</EmailAddressText>
				</EmailAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:url[fn:namespace-uri() eq '']">
				<WebAddressBag>
					<WebAddressURI>
						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
					</WebAddressURI>
				</WebAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:phone[fn:namespace-uri() eq '']">
				<PhoneNumberBag>
					<PhoneNumber>
						<xsl:for-each select="$var2_ead">
							<xsl:attribute name="phoneNumberCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</PhoneNumber>
				</PhoneNumberBag>
			</xsl:for-each>
			<xsl:for-each select="$var2_ead">
				<OtherElectronicAddressBag>
					<xsl:sequence select="()"/>
				</OtherElectronicAddressBag>
			</xsl:for-each>
		</com:Contact>
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
				<xsl:if test="fn:string(.) != 'unknown'">
					<com:CountryCode>
						<xsl:sequence select="fn:string(.)"/>
					</com:CountryCode>
				</xsl:if>
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
		<xsl:variable name="var14_authorized_officer" as="node()*" select="$examiners/authorized-officer"/>
		<pat:PartyBag>
			<xsl:for-each select="$parties/*:applicants[fn:namespace-uri() eq '']">
				<ApplicantBag>
					<xsl:for-each select="*:applicant[fn:namespace-uri() eq '']">
						<xsl:variable name="var4_sequence" as="node()?" select="@sequence"/>
						<Applicant>
							<xsl:for-each select="$var4_sequence">
								<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
								<xsl:variable name="var1_resultof_ST__address_bookToST__PublicationContact" as="node()?">
									<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
										<xsl:with-param name="addressbook" as="node()">
											<addressbook xmlns="">
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var1_resultof_ST__address_bookToST__PublicationContact">
									<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:PublicationContact>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="@app-type">
								<ApplicantCategory>
									<xsl:call-template name="vmf:vmf6_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</ApplicantCategory>
							</xsl:for-each>
							<xsl:for-each select="*:nationality[fn:namespace-uri() eq '']/*:country[fn:namespace-uri() eq '']">
								<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="fn:string(.)"/>
								</com:NationalityCode>
							</xsl:for-each>
							<xsl:for-each select="@designation">
								<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf7_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
									<DesignationCategory>
										<xsl:sequence select="."/>
									</DesignationCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="*:residence[fn:namespace-uri() eq '']/*:country[fn:namespace-uri() eq '']">
								<com:ResidenceCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="fn:string(.)"/>
								</com:ResidenceCountryCode>
							</xsl:for-each>
							<xsl:for-each select="*:us-rights[fn:namespace-uri() eq '']">
								<SuccessorRights>
									<xsl:for-each select="$var4_sequence">
										<xsl:attribute name="applicantSequenceNumberReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<SuccessorRightsText>
											<xsl:sequence select="fn:string(.)"/>
										</SuccessorRightsText>
									</xsl:for-each>
									<xsl:for-each select="@kind">
										<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
											<xsl:call-template name="vmf:vmf8_inputtoresult">
												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
											</xsl:call-template>
										</xsl:variable>
										<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
											<SuccessorCategory>
												<xsl:sequence select="."/>
											</SuccessorCategory>
										</xsl:for-each>
									</xsl:for-each>
								</SuccessorRights>
							</xsl:for-each>
						</Applicant>
					</xsl:for-each>
				</ApplicantBag>
			</xsl:for-each>
			<xsl:for-each select="$parties/*:inventors[fn:namespace-uri() eq '']">
				<InventorBag>
					<xsl:for-each select="*:inventor[fn:namespace-uri() eq '']">
						<xsl:variable name="var6_cur" as="node()" select="."/>
						<Inventor>
							<xsl:for-each select="@sequence">
								<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
								<xsl:variable name="var5_resultof_ST__address_bookToST__PublicationContact" as="node()?">
									<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
										<xsl:with-param name="addressbook" as="node()">
											<addressbook xmlns="">
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var5_resultof_ST__address_bookToST__PublicationContact">
									<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:PublicationContact>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="*:designated-states[fn:namespace-uri() eq '']">
								<StateDesignation>
									<xsl:for-each select="$var6_cur/@designation">
										<NewDesignationCountryCode>
											<xsl:sequence select="fn:string(.)"/>
										</NewDesignationCountryCode>
									</xsl:for-each>
									<xsl:for-each select="*:country[fn:namespace-uri() eq '']">
										<NationalDesignation>
											<com:DesignatedCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
												<xsl:sequence select="fn:string(.)"/>
											</com:DesignatedCountryCode>
										</NationalDesignation>
									</xsl:for-each>
									<xsl:for-each select="*:region[fn:namespace-uri() eq '']">
										<RegionalDesignation>
											<xsl:for-each select="*:country[fn:namespace-uri() eq '']">
												<com:DesignatedCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
													<xsl:sequence select="fn:string(.)"/>
												</com:DesignatedCountryCode>
											</xsl:for-each>
										</RegionalDesignation>
									</xsl:for-each>
								</StateDesignation>
							</xsl:for-each>
						</Inventor>
					</xsl:for-each>
				</InventorBag>
			</xsl:for-each>
			<AssigneeBag>
				<xsl:for-each select="$assignees/*:assignee[fn:namespace-uri() eq '']">
					<Assignee>
						<xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
							<xsl:variable name="var7_resultof_ST__address_bookToST__PublicationContact" as="node()?">
								<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
									<xsl:with-param name="addressbook" as="node()">
										<addressbook xmlns="">
											<xsl:sequence select="(./@node(), ./node())"/>
										</addressbook>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var7_resultof_ST__address_bookToST__PublicationContact">
								<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="(./@node(), ./node())"/>
								</com:PublicationContact>
							</xsl:for-each>
						</xsl:for-each>
					</Assignee>
				</xsl:for-each>
			</AssigneeBag>
			<xsl:for-each select="$parties/*:agents[fn:namespace-uri() eq '']">
				<xsl:variable name="var10_cur" as="node()" select="."/>
				<RegisteredPractitionerBag>
					<xsl:for-each select="*:agent[fn:namespace-uri() eq '']">
						<RegisteredPractitioner>
							<xsl:for-each select="@sequence">
								<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="$var10_cur/*:customer-number[fn:namespace-uri() eq '']">
								<RegisteredPractitionerRegistrationNumber>
									<xsl:sequence select="fn:string(.)"/>
								</RegisteredPractitionerRegistrationNumber>
							</xsl:for-each>
							<xsl:for-each select="@rep-type">
								<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf9_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
									<RegisteredPractitionerCategory>
										<xsl:sequence select="."/>
									</RegisteredPractitionerCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
								<xsl:variable name="var9_resultof_ST__address_bookToST__PublicationContact" as="node()?">
									<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
										<xsl:with-param name="addressbook" as="node()">
											<addressbook xmlns="">
												<xsl:sequence select="(./@node(), ./node())"/>
											</addressbook>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var9_resultof_ST__address_bookToST__PublicationContact">
									<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:PublicationContact>
								</xsl:for-each>
							</xsl:for-each>
						</RegisteredPractitioner>
					</xsl:for-each>
					<xsl:for-each select="($var14_authorized_officer/*:name[fn:namespace-uri() eq ''])[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
						<RegisteredPractitioner>
							<xsl:sequence select="()"/>
						</RegisteredPractitioner>
					</xsl:for-each>
				</RegisteredPractitionerBag>
			</xsl:for-each>
			<ExaminerBag>
				<xsl:for-each select="$examiners/*:primary-examiner[fn:namespace-uri() eq '']">
					<xsl:variable name="var11_name" as="node()*" select="*:name[fn:namespace-uri() eq '']"/>
					<PrimaryExaminer>
						<com:Name xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<com:PersonName>
								<xsl:for-each select="($var11_name)[fn:exists((./@name-type)[(fn:string(.) = 'natural')])]">
									<com:PersonFullName>
										<xsl:sequence select="fn:string(.)"/>
									</com:PersonFullName>
								</xsl:for-each>
								<com:PersonStructuredName>
									<xsl:for-each select="*:prefix[fn:namespace-uri() eq '']">
										<com:NamePrefix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NamePrefix>
									</xsl:for-each>
									<xsl:for-each select="*:first-name[fn:namespace-uri() eq '']">
										<com:FirstName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstName>
									</xsl:for-each>
									<xsl:for-each select="*:middle-name[fn:namespace-uri() eq '']">
										<com:MiddleName>
											<xsl:sequence select="fn:string(.)"/>
										</com:MiddleName>
									</xsl:for-each>
									<xsl:for-each select="*:last-name[fn:namespace-uri() eq '']">
										<com:LastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:LastName>
									</xsl:for-each>
									<xsl:for-each select="*:first-last-name[fn:namespace-uri() eq '']">
										<com:FirstLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstLastName>
									</xsl:for-each>
									<xsl:for-each select="*:second-last-name[fn:namespace-uri() eq '']">
										<com:SecondLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:SecondLastName>
									</xsl:for-each>
									<xsl:for-each select="*:suffix[fn:namespace-uri() eq '']">
										<com:NameSuffix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NameSuffix>
									</xsl:for-each>
									<xsl:for-each select="*:synonym[fn:namespace-uri() eq '']">
										<com:PersonOtherName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonOtherName>
									</xsl:for-each>
								</com:PersonStructuredName>
							</com:PersonName>
							<xsl:for-each select="*:orgname[fn:namespace-uri() eq '']">
								<com:OrganizationName>
									<xsl:for-each select="($var11_name)[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
										<com:OrganizationStandardName>
											<xsl:sequence select="fn:string(.)"/>
										</com:OrganizationStandardName>
									</xsl:for-each>
								</com:OrganizationName>
							</xsl:for-each>
							<com:EntityName>
								<xsl:for-each select="*:role[fn:namespace-uri() eq '']">
									<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
								</xsl:for-each>
							</com:EntityName>
						</com:Name>
						<xsl:for-each select="*:electronic-signature[fn:namespace-uri() eq '']">
							<com:ElectronicSignature xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="@date">
									<com:ElectronicSignatureDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignatureDate>
								</xsl:for-each>
								<xsl:for-each select="@place-signed">
									<com:ElectronicSignaturePlace>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignaturePlace>
								</xsl:for-each>
								<xsl:for-each select="*:basic-signature[fn:namespace-uri() eq '']">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image[fn:namespace-uri() eq '']/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature[fn:namespace-uri() eq '']">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7[fn:namespace-uri() eq '']">
											<xsl:attribute name="com:pkcs7Indicator" select="()"/>
										</xsl:for-each>
									</com:ElectronicEnhancedSignature>
								</xsl:for-each>
							</com:ElectronicSignature>
						</xsl:for-each>
					</PrimaryExaminer>
				</xsl:for-each>
				<xsl:for-each select="$examiners/*:assistant-examiner[fn:namespace-uri() eq '']">
					<xsl:variable name="var12_cur" as="node()" select="."/>
					<AssistantExaminer>
						<xsl:for-each select="(./*:name[fn:namespace-uri() eq ''])[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
							<com:Name xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<com:PersonName>
									<xsl:if test="fn:exists((./@name-type)[(fn:string(.) = 'natural')])">
										<com:PersonFullName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonFullName>
									</xsl:if>
									<com:PersonStructuredName>
										<xsl:for-each select="$var12_cur/*:prefix[fn:namespace-uri() eq '']">
											<com:NamePrefix>
												<xsl:sequence select="fn:string(.)"/>
											</com:NamePrefix>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:first-name[fn:namespace-uri() eq '']">
											<com:FirstName>
												<xsl:sequence select="fn:string(.)"/>
											</com:FirstName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:middle-name[fn:namespace-uri() eq '']">
											<com:MiddleName>
												<xsl:sequence select="fn:string(.)"/>
											</com:MiddleName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:last-name[fn:namespace-uri() eq '']">
											<com:LastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:LastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:first-last-name[fn:namespace-uri() eq '']">
											<com:FirstLastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:FirstLastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:second-last-name[fn:namespace-uri() eq '']">
											<com:SecondLastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:SecondLastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:suffix[fn:namespace-uri() eq '']">
											<com:NameSuffix>
												<xsl:sequence select="fn:string(.)"/>
											</com:NameSuffix>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:synonym[fn:namespace-uri() eq '']">
											<com:PersonOtherName>
												<xsl:sequence select="fn:string(.)"/>
											</com:PersonOtherName>
										</xsl:for-each>
									</com:PersonStructuredName>
								</com:PersonName>
								<xsl:for-each select="$var12_cur/*:orgname[fn:namespace-uri() eq '']">
									<com:OrganizationName>
										<xsl:sequence select="()"/>
									</com:OrganizationName>
								</xsl:for-each>
								<com:EntityName>
									<xsl:for-each select="$var12_cur/*:role[fn:namespace-uri() eq '']">
										<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
									</xsl:for-each>
								</com:EntityName>
							</com:Name>
						</xsl:for-each>
						<xsl:for-each select="*:electronic-signature[fn:namespace-uri() eq '']">
							<com:ElectronicSignature xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="@date">
									<com:ElectronicSignatureDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignatureDate>
								</xsl:for-each>
								<xsl:for-each select="@place-signed">
									<com:ElectronicSignaturePlace>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignaturePlace>
								</xsl:for-each>
								<xsl:for-each select="*:basic-signature[fn:namespace-uri() eq '']">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image[fn:namespace-uri() eq '']/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature[fn:namespace-uri() eq '']">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7[fn:namespace-uri() eq '']">
											<xsl:attribute name="com:pkcs7Indicator" select="()"/>
										</xsl:for-each>
									</com:ElectronicEnhancedSignature>
								</xsl:for-each>
							</com:ElectronicSignature>
						</xsl:for-each>
					</AssistantExaminer>
				</xsl:for-each>
				<xsl:for-each select="$var14_authorized_officer">
					<AuthorizedOfficer>
						<com:Name xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<com:PersonName>
								<xsl:for-each select="(./*:name[fn:namespace-uri() eq ''])[fn:exists((./@name-type)[(fn:string(.) = 'natural')])]">
									<com:PersonFullName>
										<xsl:sequence select="fn:string(.)"/>
									</com:PersonFullName>
								</xsl:for-each>
								<com:PersonStructuredName>
									<xsl:for-each select="*:prefix[fn:namespace-uri() eq '']">
										<com:NamePrefix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NamePrefix>
									</xsl:for-each>
									<xsl:for-each select="*:first-name[fn:namespace-uri() eq '']">
										<com:FirstName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstName>
									</xsl:for-each>
									<xsl:for-each select="*:middle-name[fn:namespace-uri() eq '']">
										<com:MiddleName>
											<xsl:sequence select="fn:string(.)"/>
										</com:MiddleName>
									</xsl:for-each>
									<xsl:for-each select="*:last-name[fn:namespace-uri() eq '']">
										<com:LastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:LastName>
									</xsl:for-each>
									<xsl:for-each select="*:first-last-name[fn:namespace-uri() eq '']">
										<com:FirstLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstLastName>
									</xsl:for-each>
									<xsl:for-each select="*:second-last-name[fn:namespace-uri() eq '']">
										<com:SecondLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:SecondLastName>
									</xsl:for-each>
									<xsl:for-each select="*:suffix[fn:namespace-uri() eq '']">
										<com:NameSuffix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NameSuffix>
									</xsl:for-each>
									<xsl:for-each select="*:synonym[fn:namespace-uri() eq '']">
										<com:PersonOtherName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonOtherName>
									</xsl:for-each>
								</com:PersonStructuredName>
							</com:PersonName>
							<xsl:for-each select="*:orgname[fn:namespace-uri() eq '']">
								<com:OrganizationName>
									<xsl:sequence select="()"/>
								</com:OrganizationName>
							</xsl:for-each>
							<com:EntityName>
								<xsl:for-each select="*:role[fn:namespace-uri() eq '']">
									<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
								</xsl:for-each>
							</com:EntityName>
						</com:Name>
						<xsl:for-each select="*:phone[fn:namespace-uri() eq '']">
							<com:PhoneNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:PhoneNumber>
						</xsl:for-each>
						<xsl:for-each select="*:fax[fn:namespace-uri() eq '']">
							<com:FaxNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:FaxNumber>
						</xsl:for-each>
						<xsl:for-each select="*:email[fn:namespace-uri() eq '']">
							<com:EmailAddressText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:EmailAddressText>
						</xsl:for-each>
						<xsl:for-each select="*:electronic-signature[fn:namespace-uri() eq '']">
							<com:ElectronicSignature xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="@date">
									<com:ElectronicSignatureDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignatureDate>
								</xsl:for-each>
								<xsl:for-each select="@place-signed">
									<com:ElectronicSignaturePlace>
										<xsl:sequence select="fn:string(.)"/>
									</com:ElectronicSignaturePlace>
								</xsl:for-each>
								<xsl:for-each select="*:basic-signature[fn:namespace-uri() eq '']">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image[fn:namespace-uri() eq '']/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap[fn:namespace-uri() eq '']">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature[fn:namespace-uri() eq '']">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7[fn:namespace-uri() eq '']">
											<xsl:attribute name="com:pkcs7Indicator" select="()"/>
										</xsl:for-each>
									</com:ElectronicEnhancedSignature>
								</xsl:for-each>
							</com:ElectronicSignature>
						</xsl:for-each>
					</AuthorizedOfficer>
				</xsl:for-each>
			</ExaminerBag>
			<xsl:for-each select="$parties/*:correspondence-address[fn:namespace-uri() eq '']">
				<com:CorrespondenceAddress xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="*:customer-number[fn:namespace-uri() eq '']">
						<com:PartyIdentifier>
							<xsl:sequence select="fn:string(.)"/>
						</com:PartyIdentifier>
					</xsl:for-each>
					<xsl:for-each select="*:addressbook[fn:namespace-uri() eq '']">
						<xsl:variable name="var13_resultof_ST__address_bookToST__contact" as="node()?">
							<xsl:call-template name="WIPO:ST36address-bookToST96contact">
								<xsl:with-param name="addressbook" as="node()">
									<addressbook xmlns="">
										<xsl:sequence select="(./@node(), ./node())"/>
									</addressbook>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var13_resultof_ST__address_bookToST__contact">
							<com:Contact>
								<xsl:sequence select="(./@node(), ./node())"/>
							</com:Contact>
						</xsl:for-each>
					</xsl:for-each>
				</com:CorrespondenceAddress>
			</xsl:for-each>
		</pat:PartyBag>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='utility'">
				<xsl:copy-of select="'Utility'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='national'">
				<xsl:copy-of select="'National'"/>
			</xsl:when>
			<xsl:when test="$input='regional'">
				<xsl:copy-of select="'Regional'"/>
			</xsl:when>
			<xsl:when test="$input='international'">
				<xsl:copy-of select="'PCT'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='cited by applicant'">
				<xsl:copy-of select="'Applicant'"/>
			</xsl:when>
			<xsl:when test="$input='cited by examiner'">
				<xsl:copy-of select="'Examiner'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='yes'">
				<xsl:copy-of select="'true'"/>
			</xsl:when>
			<xsl:when test="$input='no'">
				<xsl:copy-of select="'false'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf5_inputtoresult">
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
	<xsl:template name="vmf:vmf6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='applicant-inventor'">
				<xsl:copy-of select="'Applicant_Inventor'"/>
			</xsl:when>
			<xsl:when test="$input='legal-representative'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="'Applicant'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf7_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='all'">
				<xsl:copy-of select="'All'"/>
			</xsl:when>
			<xsl:when test="$input='all-except-us'">
				<xsl:copy-of select="'All except US'"/>
			</xsl:when>
			<xsl:when test="$input='us-only'">
				<xsl:copy-of select="'US only'"/>
			</xsl:when>
			<xsl:when test="$input='as-indicated'">
				<xsl:copy-of select="'As indicated'"/>
			</xsl:when>
		</xsl:choose>
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
	<xsl:template match="/">
		<xsl:variable name="var64_bibliographic_data" as="node()?" select="bibliographic-data"/>
		<pat:BibliographicData xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0" xmlns:mathml="http://www.w3.org/1998/Math/MathML3" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/ST96/Patent ../../Schemas/ST96Schema/ST96XMLSchema_Current_Flattened/BibliographicData_V6_0.xsd'"/>
			<xsl:for-each select="$var64_bibliographic_data">
				<xsl:for-each select="@id">
					<xsl:attribute name="com:id" select="fn:string(.)"/>
				</xsl:for-each>
				<xsl:for-each select="@country">
					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
				</xsl:for-each>
				<xsl:attribute name="com:st96Version" select="'V6_0'"/>
			</xsl:for-each>
			<xsl:for-each select="$var64_bibliographic_data">
				<xsl:variable name="var63_cur" as="node()" select="."/>
				<xsl:variable name="var2_publication_reference" as="node()" select="publication-reference"/>
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
				<xsl:variable name="var4_country_as_string" as="xs:string" select="fn:string($var5_document_id/country)"/>
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
							<xsl:call-template name="vmf:vmf1_inputtoresult">
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
									<xsl:call-template name="vmf:vmf2_inputtoresult">
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
				<xsl:for-each select="term-of-grant">
					<pat:GrantTerm>
						<xsl:for-each select="length-of-grant">
							<pat:GrantLengthQuantity>
								<xsl:sequence select="xs:string(xs:decimal(fn:string(.)))"/>
							</pat:GrantLengthQuantity>
						</xsl:for-each>
						<xsl:for-each select="disclaimer">
							<pat:TerminalDisclaimer>
								<xsl:for-each select="date">
									<pat:DisclaimerDate>
										<xsl:sequence select="fn:string(.)"/>
									</pat:DisclaimerDate>
								</xsl:for-each>
								<xsl:for-each select="text">
									<pat:DisclaimerText>
										<xsl:sequence select="fn:string(.)"/>
									</pat:DisclaimerText>
								</xsl:for-each>
							</pat:TerminalDisclaimer>
						</xsl:for-each>
						<xsl:for-each select="lapse-of-patent">
							<pat:PatentTermLapseQuantity>
								<xsl:sequence select="()"/>
							</pat:PatentTermLapseQuantity>
						</xsl:for-each>
					</pat:GrantTerm>
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
								<xsl:sequence select="fn:string(main-classification)"/>
							</pat:MainClassification>
							<xsl:for-each select="further-classification">
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
								<xsl:for-each select="(./main-classification/node())[fn:boolean(self::text())]">
									<pat:PatentClassificationText>
										<xsl:sequence select="fn:string(.)"/>
									</pat:PatentClassificationText>
								</xsl:for-each>
							</pat:MainNationalClassification>
							<xsl:for-each select="further-classification">
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
									<xsl:sequence select="fn:string(main-classification)"/>
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
				<xsl:for-each select="references-cited">
					<pat:ReferenceCitationBag>
						<xsl:for-each select="citation">
							<pat:ReferenceCitation>
								<xsl:for-each select="@id">
									<xsl:attribute name="com:id" select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:for-each select="(./category/node())[fn:boolean(self::text())]">
									<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
										<xsl:call-template name="vmf:vmf3_inputtoresult">
											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:for-each select="$var9_resultof_vmf__inputtoresult">
										<xsl:attribute name="pat:citingPartyCategory" select="."/>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="patcit">
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
								<xsl:for-each select="nplcit">
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
														<xsl:variable name="var10_resultof_filter" as="node()*" select="(./node())[fn:boolean(self::text())]"/>
														<pat:RelatedClaimBag>
															<pat:PatentClaimRange>
																<xsl:for-each select="$var10_resultof_filter">
																	<pat:PatentClaimStartNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</pat:PatentClaimStartNumber>
																</xsl:for-each>
																<xsl:for-each select="$var10_resultof_filter">
																	<pat:PatentClaimEndNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
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
								<!--<xsl:for-each select="classification-national">
									<pat:PatentClassificationBag>
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
												<xsl:for-each select="(./main-classification/node())[fn:boolean(self::text())]">
													<pat:PatentClassificationText>
														<xsl:sequence select="fn:string(.)"/>
													</pat:PatentClassificationText>
												</xsl:for-each>
											</pat:MainNationalClassification>
											<xsl:for-each select="further-classification">
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
									</pat:PatentClassificationBag>
								</xsl:for-each>-->
							</pat:ReferenceCitation>
						</xsl:for-each>
					</pat:ReferenceCitationBag>
				</xsl:for-each>
				<xsl:for-each select="number-of-claims">
					<pat:ClaimTotalQuantity>
						<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
					</pat:ClaimTotalQuantity>
				</xsl:for-each>
				<xsl:for-each select="field-of-search">
					<pat:SearchField>
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
										<xsl:sequence select="fn:string(main-classification)"/>
									</pat:MainClassification>
									<xsl:for-each select="further-classification">
										<pat:FurtherClassification>
											<xsl:sequence select="fn:string(.)"/>
										</pat:FurtherClassification>
									</xsl:for-each>
								</pat:IPCClassification>
							</xsl:for-each>
							<pat:IPCRClassificationBag>
								<xsl:for-each select="classifications-ipcr">
									<pat:IPCRClassification>
										<xsl:for-each select="@id">
											<xsl:attribute name="com:id" select="fn:string(.)"/>
										</xsl:for-each>
									</pat:IPCRClassification>
								</xsl:for-each>
							</pat:IPCRClassificationBag>
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
										<xsl:for-each select="(./main-classification/node())[fn:boolean(self::text())]">
											<pat:PatentClassificationText>
												<xsl:sequence select="fn:string(.)"/>
											</pat:PatentClassificationText>
										</xsl:for-each>
									</pat:MainNationalClassification>
									<xsl:for-each select="further-classification">
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
						</pat:PatentClassificationBag>
					</pat:SearchField>
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
				<xsl:for-each select="related-documents">
					<pat:RelatedDocumentBag>
						<xsl:for-each select="addition">
							<xsl:variable name="var19_relation" as="node()" select="relation"/>
							<pat:Addition>
								<xsl:variable name="var15_parent_doc" as="node()" select="$var19_relation/parent-doc"/>
								<xsl:variable name="var14_parent_grant_document" as="node()?" select="$var15_parent_doc/parent-grant-document"/>
								<xsl:variable name="var13_document_id" as="node()" select="$var15_parent_doc/document-id"/>
								<xsl:variable name="var12_country_as_string" as="xs:string" select="fn:string($var13_document_id/country)"/>
								<pat:ParentDocument>
									<pat:PatentDocumentIdentification>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="$var12_country_as_string"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:IPOfficeCode>
													<xsl:sequence select="$var12_country_as_string"/>
												</com:IPOfficeCode>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var13_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
											<xsl:for-each select="$var13_document_id/date">
												<pat:FilingDate>
													<xsl:sequence select="fn:string(.)"/>
												</pat:FilingDate>
											</xsl:for-each>
										</pat:ApplicationIdentification>
										<pat:PatentPublicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="fn:string($var13_document_id/country)"/>
											</com:IPOfficeCode>
											<pat:PublicationNumber>
												<xsl:sequence select="fn:string($var13_document_id/doc-number)"/>
											</pat:PublicationNumber>
											<xsl:for-each select="$var13_document_id/kind">
												<com:PatentDocumentKindCode>
													<xsl:sequence select="fn:string(.)"/>
												</com:PatentDocumentKindCode>
											</xsl:for-each>
											<xsl:for-each select="$var13_document_id/date">
												<com:PublicationDate>
													<xsl:sequence select="fn:string(.)"/>
												</com:PublicationDate>
											</xsl:for-each>
										</pat:PatentPublicationIdentification>
										<pat:PatentGrantIdentification>
											<xsl:for-each select="$var14_parent_grant_document">
												<com:IPOfficeCode>
													<xsl:sequence select="fn:string(document-id/country)"/>
												</com:IPOfficeCode>
											</xsl:for-each>
											<xsl:for-each select="$var14_parent_grant_document">
												<pat:PatentNumber>
													<xsl:sequence select="fn:string(document-id/doc-number)"/>
												</pat:PatentNumber>
											</xsl:for-each>
											<xsl:for-each select="$var14_parent_grant_document/document-id/kind">
												<com:PatentDocumentKindCode>
													<xsl:sequence select="fn:string(.)"/>
												</com:PatentDocumentKindCode>
											</xsl:for-each>
											<xsl:for-each select="$var14_parent_grant_document/document-id/date">
												<pat:GrantDate>
													<xsl:sequence select="fn:string(.)"/>
												</pat:GrantDate>
											</xsl:for-each>
										</pat:PatentGrantIdentification>
									</pat:PatentDocumentIdentification>
									<xsl:for-each select="$var15_parent_doc/parent-status">
										<pat:ParentDocumentStatusCode>
											<xsl:sequence select="fn:string(.)"/>
										</pat:ParentDocumentStatusCode>
									</xsl:for-each>
									<xsl:for-each select="$var15_parent_doc/parent-pct-document">
										<xsl:variable name="var11_document_id" as="node()" select="document-id"/>
										<xsl:variable name="var10_country_as_string" as="xs:string" select="fn:string($var11_document_id/country)"/>
										<pat:PCTDocumentParent>
											<pat:ApplicationIdentification>
												<com:IPOfficeCode>
													<xsl:sequence select="$var10_country_as_string"/>
												</com:IPOfficeCode>
												<com:ApplicationNumber>
													<com:IPOfficeCode>
														<xsl:sequence select="$var10_country_as_string"/>
													</com:IPOfficeCode>
													<com:ApplicationNumberText>
														<xsl:sequence select="fn:string($var11_document_id/doc-number)"/>
													</com:ApplicationNumberText>
												</com:ApplicationNumber>
												<xsl:for-each select="$var11_document_id/date">
													<pat:FilingDate>
														<xsl:sequence select="fn:string(.)"/>
													</pat:FilingDate>
												</xsl:for-each>
											</pat:ApplicationIdentification>
										</pat:PCTDocumentParent>
									</xsl:for-each>
								</pat:ParentDocument>
								<xsl:variable name="var18_child_doc" as="node()" select="$var19_relation/child-doc"/>
								<xsl:variable name="var17_document_id" as="node()" select="$var18_child_doc/document-id"/>
								<xsl:variable name="var16_country_as_string" as="xs:string" select="fn:string($var17_document_id/country)"/>
								<pat:ChildDocument>
									<pat:PatentDocumentIdentification>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="$var16_country_as_string"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:IPOfficeCode>
													<xsl:sequence select="$var16_country_as_string"/>
												</com:IPOfficeCode>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var17_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
											<xsl:for-each select="$var17_document_id/date">
												<pat:FilingDate>
													<xsl:sequence select="fn:string(.)"/>
												</pat:FilingDate>
											</xsl:for-each>
										</pat:ApplicationIdentification>
									</pat:PatentDocumentIdentification>
								</pat:ChildDocument>
							</pat:Addition>
						</xsl:for-each>
						<xsl:for-each select="division">
							<pat:Division>
								<xsl:sequence select="()"/>
							</pat:Division>
						</xsl:for-each>
						<xsl:for-each select="continuation">
							<xsl:variable name="var22_relation" as="node()" select="relation"/>
							<pat:Continuation>
								<xsl:variable name="var20_document_id" as="node()" select="$var22_relation/parent-doc/document-id"/>
								<pat:ParentDocument>
									<pat:PatentDocumentIdentification>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="fn:string($var20_document_id/country)"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var20_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
										</pat:ApplicationIdentification>
									</pat:PatentDocumentIdentification>
								</pat:ParentDocument>
								<xsl:variable name="var21_document_id" as="node()" select="$var22_relation/child-doc/document-id"/>
								<pat:ChildDocument>
									<pat:PatentDocumentIdentification>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="fn:string($var21_document_id/country)"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var21_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
										</pat:ApplicationIdentification>
									</pat:PatentDocumentIdentification>
								</pat:ChildDocument>
							</pat:Continuation>
						</xsl:for-each>
						<xsl:for-each select="continuation-in-part">
							<xsl:variable name="var27_relation" as="node()" select="relation"/>
							<pat:PartialContinuation>
								<xsl:variable name="var25_parent_doc" as="node()" select="$var27_relation/parent-doc"/>
								<pat:ParentDocument>
									<pat:PatentDocumentIdentification>
										<xsl:variable name="var23_document_id" as="node()" select="$var25_parent_doc/document-id"/>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="fn:string($var23_document_id/country)"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var23_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
											<xsl:for-each select="$var23_document_id/date">
												<pat:FilingDate>
													<xsl:sequence select="fn:string(.)"/>
												</pat:FilingDate>
											</xsl:for-each>
										</pat:ApplicationIdentification>
										<xsl:for-each select="$var25_parent_doc/parent-grant-document">
											<xsl:variable name="var24_document_id" as="node()" select="document-id"/>
											<pat:PatentGrantIdentification>
												<com:IPOfficeCode>
													<xsl:sequence select="fn:string($var24_document_id/country)"/>
												</com:IPOfficeCode>
												<pat:PatentNumber>
													<xsl:sequence select="fn:string($var24_document_id/doc-number)"/>
												</pat:PatentNumber>
												<xsl:for-each select="$var24_document_id/kind">
													<com:PatentDocumentKindCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:PatentDocumentKindCode>
												</xsl:for-each>
												<xsl:for-each select="$var24_document_id/date">
													<pat:GrantDate>
														<xsl:sequence select="fn:string(.)"/>
													</pat:GrantDate>
												</xsl:for-each>
											</pat:PatentGrantIdentification>
										</xsl:for-each>
									</pat:PatentDocumentIdentification>
									<xsl:for-each select="$var25_parent_doc/parent-status">
										<pat:ParentDocumentStatusCode>
											<xsl:sequence select="fn:string(.)"/>
										</pat:ParentDocumentStatusCode>
									</xsl:for-each>
								</pat:ParentDocument>
								<xsl:variable name="var26_document_id" as="node()" select="$var27_relation/child-doc/document-id"/>
								<pat:ChildDocument>
									<pat:PatentDocumentIdentification>
										<pat:ApplicationIdentification>
											<com:IPOfficeCode>
												<xsl:sequence select="fn:string($var26_document_id/country)"/>
											</com:IPOfficeCode>
											<com:ApplicationNumber>
												<com:ApplicationNumberText>
													<xsl:sequence select="fn:string($var26_document_id/doc-number)"/>
												</com:ApplicationNumberText>
											</com:ApplicationNumber>
										</pat:ApplicationIdentification>
									</pat:PatentDocumentIdentification>
								</pat:ChildDocument>
							</pat:PartialContinuation>
						</xsl:for-each>
						<xsl:for-each select="continuing-reissue">
							<pat:ContinuingReissue>
								<xsl:sequence select="()"/>
							</pat:ContinuingReissue>
						</xsl:for-each>
						<xsl:for-each select="reissue">
							<pat:Reissue>
								<xsl:sequence select="()"/>
							</pat:Reissue>
						</xsl:for-each>
						<xsl:for-each select="reexamination">
							<pat:Reexamination>
								<xsl:sequence select="()"/>
							</pat:Reexamination>
						</xsl:for-each>
						<xsl:for-each select="substitution">
							<pat:Substitution>
								<xsl:sequence select="()"/>
							</pat:Substitution>
						</xsl:for-each>
						<xsl:for-each select="utility-model-basis">
							<pat:UtilityModelBasis>
								<xsl:sequence select="()"/>
							</pat:UtilityModelBasis>
						</xsl:for-each>
						<xsl:for-each select="correction">
							<pat:Correction>
								<xsl:sequence select="()"/>
							</pat:Correction>
						</xsl:for-each>
						<xsl:for-each select="related-publication">
							<xsl:variable name="var28_document_id" as="node()" select="document-id"/>
							<pat:RelatedPublication>
								<pat:PatentDocumentIdentification>
									<pat:PatentPublicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var28_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PublicationNumber>
											<xsl:sequence select="fn:string($var28_document_id/doc-number)"/>
										</pat:PublicationNumber>
										<xsl:for-each select="$var28_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var28_document_id/date">
											<com:PublicationDate>
												<xsl:sequence select="fn:string(.)"/>
											</com:PublicationDate>
										</xsl:for-each>
									</pat:PatentPublicationIdentification>
								</pat:PatentDocumentIdentification>
							</pat:RelatedPublication>
						</xsl:for-each>
					</pat:RelatedDocumentBag>
				</xsl:for-each>
				<xsl:variable name="var31_parties" as="node()" select="parties"/>
				<xsl:for-each select="assignees">
					<xsl:variable name="var30_cur" as="node()" select="."/>
					<xsl:for-each select="$var63_cur/examiners">
						<xsl:variable name="var29_resultof_ST__partiesToST__PartyBag" as="node()?">
							<xsl:call-template name="WIPO:ST36partiesToST96PartyBag">
								<xsl:with-param name="parties" as="node()">
									<parties>
										<xsl:sequence select="($var31_parties/@node(), $var31_parties/node())"/>
									</parties>
								</xsl:with-param>
								<xsl:with-param name="assignees" as="node()">
									<assignees>
										<xsl:sequence select="($var30_cur/@node(), $var30_cur/node())"/>
									</assignees>
								</xsl:with-param>
								<xsl:with-param name="examiners" as="node()">
									<examiners>
										<xsl:sequence select="(./@node(), ./node())"/>
									</examiners>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var29_resultof_ST__partiesToST__PartyBag">
							<pat:PartyBag>
								<xsl:sequence select="(./@node(), ./node())"/>
							</pat:PartyBag>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="pct-or-regional-filing-data">
					<xsl:variable name="var33_document_id" as="node()" select="document-id"/>
					<xsl:variable name="var32_country_as_string" as="xs:string" select="fn:string($var33_document_id/country)"/>
					<pat:InternationalFilingData>
						<pat:ApplicationIdentification>
							<com:IPOfficeCode>
								<xsl:sequence select="$var32_country_as_string"/>
							</com:IPOfficeCode>
							<com:ApplicationNumber>
								<com:IPOfficeCode>
									<xsl:sequence select="$var32_country_as_string"/>
								</com:IPOfficeCode>
								<com:ApplicationNumberText>
									<xsl:sequence select="fn:string($var33_document_id/doc-number)"/>
								</com:ApplicationNumberText>
							</com:ApplicationNumber>
							<xsl:for-each select="$var33_document_id/@lang">
								<com:FilingLanguageCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:FilingLanguageCode>
							</xsl:for-each>
							<xsl:for-each select="$var33_document_id/date">
								<pat:FilingDate>
									<xsl:sequence select="fn:string(.)"/>
								</pat:FilingDate>
							</xsl:for-each>
						</pat:ApplicationIdentification>
						<xsl:for-each select="us-371c124-date">
							<pat:NationalStageFilingDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:NationalStageFilingDate>
						</xsl:for-each>
					</pat:InternationalFilingData>
				</xsl:for-each>
				<xsl:for-each select="pct-or-regional-publishing-data">
					<pat:InternationalPublishingData>
						<xsl:variable name="var34_document_id" as="node()" select="document-id"/>
						<pat:PatentDocumentIdentification>
							<pat:PatentPublicationIdentification>
								<com:IPOfficeCode>
									<xsl:sequence select="fn:string($var34_document_id/country)"/>
								</com:IPOfficeCode>
								<pat:PublicationNumber>
									<xsl:sequence select="fn:string($var34_document_id/doc-number)"/>
								</pat:PublicationNumber>
								<xsl:for-each select="$var34_document_id/kind">
									<com:PatentDocumentKindCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:PatentDocumentKindCode>
								</xsl:for-each>
								<xsl:for-each select="$var34_document_id/date">
									<com:PublicationDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:PublicationDate>
								</xsl:for-each>
							</pat:PatentPublicationIdentification>
						</pat:PatentDocumentIdentification>
						<xsl:for-each select="gazette-reference">
							<pat:GazetteReference>
								<xsl:for-each select="@id">
									<xsl:attribute name="com:id" select="fn:string(.)"/>
								</xsl:for-each>
								<pat:GazetteNumber>
									<xsl:sequence select="fn:string(gazette-num)"/>
								</pat:GazetteNumber>
								<com:PublicationDate>
									<xsl:sequence select="fn:string(date)"/>
								</com:PublicationDate>
								<xsl:for-each select="text">
									<pat:GazetteReferenceText>
										<xsl:sequence select="fn:string(.)"/>
									</pat:GazetteReferenceText>
								</xsl:for-each>
								<xsl:for-each select="@country">
									<com:IPOfficeCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:IPOfficeCode>
								</xsl:for-each>
							</pat:GazetteReference>
						</xsl:for-each>
					</pat:InternationalPublishingData>
				</xsl:for-each>
				<xsl:for-each select="patent-family">
					<pat:PatentFamily>
						<xsl:for-each select="@id">
							<xsl:attribute name="com:id" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:variable name="var37_priority_application" as="node()" select="priority-application"/>
						<xsl:variable name="var36_document_id" as="node()" select="$var37_priority_application/document-id"/>
						<xsl:variable name="var35_country_as_string" as="xs:string" select="fn:string($var36_document_id/country)"/>
						<pat:PriorityApplication>
							<pat:ApplicationIdentification>
								<com:IPOfficeCode>
									<xsl:sequence select="$var35_country_as_string"/>
								</com:IPOfficeCode>
								<com:ApplicationNumber>
									<com:IPOfficeCode>
										<xsl:sequence select="$var35_country_as_string"/>
									</com:IPOfficeCode>
									<com:ApplicationNumberText>
										<xsl:sequence select="fn:string($var36_document_id/doc-number)"/>
									</com:ApplicationNumberText>
								</com:ApplicationNumber>
								<xsl:for-each select="$var36_document_id/date">
									<pat:FilingDate>
										<xsl:sequence select="fn:string(.)"/>
									</pat:FilingDate>
								</xsl:for-each>
							</pat:ApplicationIdentification>
							<pat:PatentPublicationIdentification>
								<com:IPOfficeCode>
									<xsl:sequence select="fn:string($var36_document_id/country)"/>
								</com:IPOfficeCode>
								<pat:PublicationNumber>
									<xsl:sequence select="fn:string($var36_document_id/doc-number)"/>
								</pat:PublicationNumber>
								<xsl:for-each select="$var36_document_id/kind">
									<com:PatentDocumentKindCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:PatentDocumentKindCode>
								</xsl:for-each>
								<xsl:for-each select="$var36_document_id/date">
									<com:PublicationDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:PublicationDate>
								</xsl:for-each>
							</pat:PatentPublicationIdentification>
						</pat:PriorityApplication>
						<xsl:for-each select="family-member">
							<xsl:variable name="var39_document_id" as="node()" select="document-id"/>
							<xsl:variable name="var38_country_as_string" as="xs:string" select="fn:string($var39_document_id/country)"/>
							<pat:PatentFamilyMember>
								<pat:ApplicationIdentification>
									<com:IPOfficeCode>
										<xsl:sequence select="$var38_country_as_string"/>
									</com:IPOfficeCode>
									<com:ApplicationNumber>
										<com:IPOfficeCode>
											<xsl:sequence select="$var38_country_as_string"/>
										</com:IPOfficeCode>
										<com:ApplicationNumberText>
											<xsl:sequence select="fn:string($var39_document_id/doc-number)"/>
										</com:ApplicationNumberText>
									</com:ApplicationNumber>
									<xsl:for-each select="$var39_document_id/date">
										<pat:FilingDate>
											<xsl:sequence select="fn:string(.)"/>
										</pat:FilingDate>
									</xsl:for-each>
								</pat:ApplicationIdentification>
								<pat:PatentPublicationIdentification>
									<com:IPOfficeCode>
										<xsl:sequence select="fn:string($var39_document_id/country)"/>
									</com:IPOfficeCode>
									<pat:PublicationNumber>
										<xsl:sequence select="fn:string($var39_document_id/doc-number)"/>
									</pat:PublicationNumber>
									<xsl:for-each select="$var39_document_id/kind">
										<com:PatentDocumentKindCode>
											<xsl:sequence select="fn:string(.)"/>
										</com:PatentDocumentKindCode>
									</xsl:for-each>
									<xsl:for-each select="$var39_document_id/date">
										<com:PublicationDate>
											<xsl:sequence select="fn:string(.)"/>
										</com:PublicationDate>
									</xsl:for-each>
								</pat:PatentPublicationIdentification>
							</pat:PatentFamilyMember>
						</xsl:for-each>
						<xsl:for-each select="text">
							<pat:PatentFamilyText>
								<xsl:sequence select="fn:string(.)"/>
							</pat:PatentFamilyText>
						</xsl:for-each>
					</pat:PatentFamily>
				</xsl:for-each>
				<xsl:for-each select="bio-deposit">
					<xsl:variable name="var40_resultof_ST__bio_depositToST__BioDeposit_Bib" as="node()?">
						<xsl:call-template name="WIPO:ST36bio-depositToST96BioDeposit-Bib">
							<xsl:with-param name="biodeposit" as="node()">
								<bio-deposit>
									<xsl:sequence select="(./@node(), ./node())"/>
								</bio-deposit>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:for-each select="$var40_resultof_ST__bio_depositToST__BioDeposit_Bib">
						<com:BioDeposit>
							<xsl:sequence select="(./@node(), ./node())"/>
						</com:BioDeposit>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="plain-language-designation">
					<pat:PlainLanguageDesignationText>
						<xsl:for-each select="@lang">
							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</pat:PlainLanguageDesignationText>
				</xsl:for-each>
				<xsl:for-each select="language-of-filing">
					<com:FilingLanguageCode>
						<xsl:sequence select="fn:string(.)"/>
					</com:FilingLanguageCode>
				</xsl:for-each>
				<xsl:for-each select="language-of-publication">
					<com:PublicationLanguageCode>
						<xsl:sequence select="fn:string(.)"/>
					</com:PublicationLanguageCode>
				</xsl:for-each>
				<xsl:for-each select="designation-of-states">
					<xsl:variable name="var47_designation_pct" as="node()" select="designation-pct"/>
					<xsl:variable name="var45_regional" as="node()*" select="$var47_designation_pct/regional"/>
					<xsl:variable name="var46_national" as="node()?" select="$var47_designation_pct/national"/>
					<pat:StateDesignation>
						<xsl:for-each select="$var47_designation_pct/new-designation-country">
							<pat:NewDesignationCountryCode>
								<xsl:sequence select="fn:string(.)"/>
							</pat:NewDesignationCountryCode>
						</xsl:for-each>
						<xsl:for-each select="$var45_regional">
							<pat:NationalDesignation>
								<xsl:for-each select="$var46_national/country">
									<com:DesignatedCountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:DesignatedCountryCode>
								</xsl:for-each>
								<xsl:for-each select="$var46_national">
									<xsl:variable name="var44_cur" as="node()" select="."/>
									<xsl:for-each select="(./country/node())[fn:boolean(self::text())]">
										<xsl:variable name="var43_protection_request" as="node()*" select="$var44_cur/protection-request"/>
										<xsl:variable name="var42_map_of_protection_request" as="node()*">
											<xsl:for-each select="$var43_protection_request/document-id">
												<com:IPOfficeCode>
													<xsl:sequence select="fn:string(country)"/>
												</com:IPOfficeCode>
											</xsl:for-each>
										</xsl:variable>
										<pat:ProtectionRequest>
											<xsl:for-each select="$var43_protection_request/@subset">
												<xsl:variable name="var41_resultof_vmf__inputtoresult" as="xs:string?">
													<xsl:call-template name="vmf:vmf4_inputtoresult">
														<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:for-each select="$var41_resultof_vmf__inputtoresult">
													<xsl:attribute name="pat:subsetIndicator" select="xs:string(xs:boolean(.))"/>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="$var43_protection_request">
												<pat:ProtectionCategory>
													<xsl:sequence select="fn:string(kind-of-protection)"/>
												</pat:ProtectionCategory>
											</xsl:for-each>
											<pat:PatentDocumentIdentification>
												<pat:ApplicationIdentification>
													<xsl:sequence select="$var42_map_of_protection_request"/>
													<com:ApplicationNumber>
														<xsl:sequence select="$var42_map_of_protection_request"/>
														<xsl:for-each select="$var43_protection_request/document-id">
															<com:ApplicationNumberText>
																<xsl:sequence select="fn:string(doc-number)"/>
															</com:ApplicationNumberText>
														</xsl:for-each>
													</com:ApplicationNumber>
													<xsl:for-each select="$var43_protection_request/document-id/date">
														<pat:FilingDate>
															<xsl:sequence select="fn:string(.)"/>
														</pat:FilingDate>
													</xsl:for-each>
												</pat:ApplicationIdentification>
											</pat:PatentDocumentIdentification>
										</pat:ProtectionRequest>
									</xsl:for-each>
								</xsl:for-each>
							</pat:NationalDesignation>
						</xsl:for-each>
						<xsl:for-each select="$var46_national">
							<pat:RegionalDesignation>
								<xsl:for-each select="$var45_regional">
									<pat:RegionalOfficeCode>
										<xsl:sequence select="fn:string(region/country)"/>
									</pat:RegionalOfficeCode>
								</xsl:for-each>
								<xsl:for-each select="$var45_regional/country">
									<com:DesignatedCountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:DesignatedCountryCode>
								</xsl:for-each>
							</pat:RegionalDesignation>
						</xsl:for-each>
					</pat:StateDesignation>
				</xsl:for-each>
				<xsl:for-each select="date-of-earliest-priority">
					<pat:EarliestPriorityApplication>
						<pat:FilingDate>
							<xsl:sequence select="()"/>
						</pat:FilingDate>
					</pat:EarliestPriorityApplication>
				</xsl:for-each>
				<xsl:for-each select="date-complete-specification-filed">
					<pat:CompleteSpecificationFilingDate>
						<xsl:sequence select="()"/>
					</pat:CompleteSpecificationFilingDate>
				</xsl:for-each>
				<xsl:for-each select="dates-of-public-availability">
					<pat:PublicAvailabilityDataBag>
						<xsl:for-each select="gazette-reference">
							<xsl:variable name="var48_gazette_num" as="node()" select="gazette-num"/>
							<pat:GazetteReference>
								<xsl:for-each select="@id">
									<xsl:attribute name="com:id" select="fn:string(.)"/>
								</xsl:for-each>
								<pat:GazetteNumber>
									<xsl:sequence select="fn:string($var48_gazette_num)"/>
								</pat:GazetteNumber>
								<xsl:for-each select="($var48_gazette_num/node())[fn:boolean(self::text())]">
									<com:PublicationDate>
										<xsl:sequence select="fn:string(.)"/>
									</com:PublicationDate>
								</xsl:for-each>
								<xsl:for-each select="text">
									<pat:GazetteReferenceText>
										<xsl:sequence select="fn:string(.)"/>
									</pat:GazetteReferenceText>
								</xsl:for-each>
								<xsl:for-each select="@country">
									<com:IPOfficeCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:IPOfficeCode>
								</xsl:for-each>
							</pat:GazetteReference>
						</xsl:for-each>
						<xsl:for-each select="unexamined-not-printed-without-grant">
							<xsl:variable name="var50_document_id" as="node()" select="document-id"/>
							<xsl:variable name="var49_country_as_string" as="xs:string" select="fn:string($var50_document_id/country)"/>
							<pat:UnexaminedNoGrantNotPrintedPatentDocument>
								<pat:PatentDocumentIdentification>
									<pat:ApplicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="$var49_country_as_string"/>
										</com:IPOfficeCode>
										<com:ApplicationNumber>
											<com:IPOfficeCode>
												<xsl:sequence select="$var49_country_as_string"/>
											</com:IPOfficeCode>
											<com:ApplicationNumberText>
												<xsl:sequence select="fn:string($var50_document_id/doc-number)"/>
											</com:ApplicationNumberText>
										</com:ApplicationNumber>
										<xsl:for-each select="$var50_document_id/date">
											<pat:FilingDate>
												<xsl:sequence select="fn:string(.)"/>
											</pat:FilingDate>
										</xsl:for-each>
									</pat:ApplicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:UnexaminedNoGrantNotPrintedPatentDocument>
						</xsl:for-each>
						<xsl:for-each select="examined-not-printed-without-grant">
							<xsl:variable name="var52_document_id" as="node()" select="document-id"/>
							<xsl:variable name="var51_country_as_string" as="xs:string" select="fn:string($var52_document_id/country)"/>
							<pat:ExaminedNoGrantNotPrintedPatentDocument>
								<pat:PatentDocumentIdentification>
									<pat:ApplicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="$var51_country_as_string"/>
										</com:IPOfficeCode>
										<com:ApplicationNumber>
											<com:IPOfficeCode>
												<xsl:sequence select="$var51_country_as_string"/>
											</com:IPOfficeCode>
											<com:ApplicationNumberText>
												<xsl:sequence select="fn:string($var52_document_id/doc-number)"/>
											</com:ApplicationNumberText>
										</com:ApplicationNumber>
										<xsl:for-each select="$var52_document_id/date">
											<pat:FilingDate>
												<xsl:sequence select="fn:string(.)"/>
											</pat:FilingDate>
										</xsl:for-each>
									</pat:ApplicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:ExaminedNoGrantNotPrintedPatentDocument>
						</xsl:for-each>
						<xsl:for-each select="unexamined-printed-without-grant">
							<pat:UnexaminedNoGrantPrintedPatentDocument>
								<xsl:variable name="var53_document_id" as="node()" select="document-id"/>
								<pat:PatentDocumentIdentification>
									<pat:PatentPublicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var53_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PublicationNumber>
											<xsl:sequence select="fn:string($var53_document_id/doc-number)"/>
										</pat:PublicationNumber>
										<xsl:for-each select="$var53_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var53_document_id/date">
											<com:PublicationDate>
												<xsl:sequence select="fn:string(.)"/>
											</com:PublicationDate>
										</xsl:for-each>
									</pat:PatentPublicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:UnexaminedNoGrantPrintedPatentDocument>
						</xsl:for-each>
						<xsl:for-each select="examined-printed-without-grant">
							<pat:ExaminedNoGrantPrintedPatentDocument>
								<xsl:variable name="var54_document_id" as="node()" select="document-id"/>
								<pat:PatentDocumentIdentification>
									<pat:PatentPublicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var54_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PublicationNumber>
											<xsl:sequence select="fn:string($var54_document_id/doc-number)"/>
										</pat:PublicationNumber>
										<xsl:for-each select="$var54_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var54_document_id/date">
											<com:PublicationDate>
												<xsl:sequence select="fn:string(.)"/>
											</com:PublicationDate>
										</xsl:for-each>
									</pat:PatentPublicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:ExaminedNoGrantPrintedPatentDocument>
						</xsl:for-each>
						<xsl:for-each select="claims-only-available">
							<xsl:variable name="var56_document_id" as="node()" select="document-id"/>
							<xsl:variable name="var55_country_as_string" as="xs:string" select="fn:string($var56_document_id/country)"/>
							<pat:OnlyAvailableClaims>
								<pat:PatentDocumentIdentification>
									<pat:ApplicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="$var55_country_as_string"/>
										</com:IPOfficeCode>
										<com:ApplicationNumber>
											<com:IPOfficeCode>
												<xsl:sequence select="$var55_country_as_string"/>
											</com:IPOfficeCode>
											<com:ApplicationNumberText>
												<xsl:sequence select="fn:string($var56_document_id/doc-number)"/>
											</com:ApplicationNumberText>
										</com:ApplicationNumber>
										<xsl:for-each select="$var56_document_id/date">
											<pat:FilingDate>
												<xsl:sequence select="fn:string(.)"/>
											</pat:FilingDate>
										</xsl:for-each>
									</pat:ApplicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:OnlyAvailableClaims>
						</xsl:for-each>
						<xsl:for-each select="not-printed-with-grant">
							<xsl:variable name="var57_document_id" as="node()" select="document-id"/>
							<pat:NotPrintedPatentGrant>
								<pat:PatentDocumentIdentification>
									<pat:PatentGrantIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var57_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PatentNumber>
											<xsl:sequence select="fn:string($var57_document_id/doc-number)"/>
										</pat:PatentNumber>
										<xsl:for-each select="$var57_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var57_document_id/date">
											<pat:GrantDate>
												<xsl:sequence select="fn:string(.)"/>
											</pat:GrantDate>
										</xsl:for-each>
									</pat:PatentGrantIdentification>
								</pat:PatentDocumentIdentification>
							</pat:NotPrintedPatentGrant>
						</xsl:for-each>
						<xsl:for-each select="invalidation-of-patent">
							<xsl:variable name="var58_document_id" as="node()" select="document-id"/>
							<pat:PatentInvalidation>
								<pat:PatentDocumentIdentification>
									<pat:PatentGrantIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var58_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PatentNumber>
											<xsl:sequence select="fn:string($var58_document_id/doc-number)"/>
										</pat:PatentNumber>
										<xsl:for-each select="$var58_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var58_document_id/date">
											<pat:GrantDate>
												<xsl:sequence select="fn:string(.)"/>
											</pat:GrantDate>
										</xsl:for-each>
									</pat:PatentGrantIdentification>
								</pat:PatentDocumentIdentification>
							</pat:PatentInvalidation>
						</xsl:for-each>
						<xsl:for-each select="printed-as-amended">
							<pat:PrintedAsAmendedDocument>
								<xsl:variable name="var59_document_id" as="node()" select="document-id"/>
								<pat:PatentDocumentIdentification>
									<pat:PatentPublicationIdentification>
										<com:IPOfficeCode>
											<xsl:sequence select="fn:string($var59_document_id/country)"/>
										</com:IPOfficeCode>
										<pat:PublicationNumber>
											<xsl:sequence select="fn:string($var59_document_id/doc-number)"/>
										</pat:PublicationNumber>
										<xsl:for-each select="$var59_document_id/kind">
											<com:PatentDocumentKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:PatentDocumentKindCode>
										</xsl:for-each>
										<xsl:for-each select="$var59_document_id/date">
											<com:PublicationDate>
												<xsl:sequence select="fn:string(.)"/>
											</com:PublicationDate>
										</xsl:for-each>
									</pat:PatentPublicationIdentification>
								</pat:PatentDocumentIdentification>
								<xsl:for-each select="text">
									<com:CommentText>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</pat:PrintedAsAmendedDocument>
						</xsl:for-each>
					</pat:PublicAvailabilityDataBag>
				</xsl:for-each>
				<xsl:for-each select="dates-rights-effective">
					<pat:RightsEffectiveDateBag>
						<xsl:for-each select="request-for-examination">
							<com:ExaminationRequestDate>
								<xsl:sequence select="fn:string(date)"/>
							</com:ExaminationRequestDate>
						</xsl:for-each>
						<xsl:for-each select="first-examination-report-despatched">
							<pat:FirstDespatchedExaminationReportDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:FirstDespatchedExaminationReportDate>
						</xsl:for-each>
						<xsl:for-each select="patent-maintained-as-amended">
							<pat:PatentMaintainedAsAmendedDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:PatentMaintainedAsAmendedDate>
						</xsl:for-each>
						<xsl:for-each select="request-for-conversion-to-national-application">
							<pat:NationalApplicationConversionRequest>
								<pat:NationalApplicationConversionRequestDate>
									<xsl:sequence select="fn:string(date)"/>
								</pat:NationalApplicationConversionRequestDate>
								<com:IPOfficeCode>
									<xsl:sequence select="fn:string(country)"/>
								</com:IPOfficeCode>
							</pat:NationalApplicationConversionRequest>
						</xsl:for-each>
						<xsl:for-each select="proceedings-suspended">
							<pat:ProceedingsSuspensionDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:ProceedingsSuspensionDate>
						</xsl:for-each>
						<xsl:for-each select="proceedings-interrupted">
							<pat:ProceedingsInterruptionDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:ProceedingsInterruptionDate>
						</xsl:for-each>
						<xsl:for-each select="proceedings-resumed">
							<pat:ProceedingsResumptionDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:ProceedingsResumptionDate>
						</xsl:for-each>
						<xsl:for-each select="notification-of-rights-after-appeal">
							<pat:AfterAppealRightsNotificationDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:AfterAppealRightsNotificationDate>
						</xsl:for-each>
						<xsl:for-each select="date-entering-into-force">
							<pat:EnteredIntoForceDate>
								<xsl:sequence select="fn:string(date)"/>
							</pat:EnteredIntoForceDate>
						</xsl:for-each>
					</pat:RightsEffectiveDateBag>
				</xsl:for-each>
				<xsl:for-each select="st50-republication">
					<xsl:variable name="var62_modifications" as="node()?" select="modifications"/>
					<pat:PatentDocumentRepublication>
						<xsl:for-each select="republication-code">
							<pat:RepublicationCategory>
								<xsl:sequence select="fn:string(.)"/>
							</pat:RepublicationCategory>
						</xsl:for-each>
						<xsl:for-each select="cancellation-date">
							<pat:RepublicationCancellationDate>
								<xsl:sequence select="fn:string(.)"/>
							</pat:RepublicationCancellationDate>
						</xsl:for-each>
						<pat:ModificationPartIdentification>
							<xsl:for-each select="$var62_modifications/modified-bibliography">
								<xsl:variable name="var60_inid_code" as="node()+" select="inid-code"/>
								<pat:ModifiedBibliography>
									<xsl:for-each select="$var60_inid_code/@sequence">
										<xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="$var60_inid_code">
										<pat:PatentINIDCode>
											<xsl:sequence select="fn:string(.)"/>
										</pat:PatentINIDCode>
									</xsl:for-each>
								</pat:ModifiedBibliography>
							</xsl:for-each>
							<xsl:for-each select="$var62_modifications/modified-part">
								<pat:ModifiedPartInformation>
									<xsl:for-each select="@sequence">
										<xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="@lang">
										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
									</xsl:for-each>
									<pat:ModifiedPartCategory>
										<xsl:sequence select="fn:string(modified-part-name)"/>
									</pat:ModifiedPartCategory>
									<xsl:for-each select="modified-item">
										<pat:ModifiedItemText>
											<xsl:sequence select="fn:string(.)"/>
										</pat:ModifiedItemText>
									</xsl:for-each>
								</pat:ModifiedPartInformation>
							</xsl:for-each>
						</pat:ModificationPartIdentification>
						<xsl:for-each select="republication-notes">
							<pat:RepublicationNoteTextBag>
								<xsl:for-each select="republication-note">
									<pat:RepublicationNoteText>
										<xsl:for-each select="@lang">
											<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:for-each select="@sequence">
											<xsl:attribute name="com:sequenceNumber" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</pat:RepublicationNoteText>
								</xsl:for-each>
							</pat:RepublicationNoteTextBag>
						</xsl:for-each>
						<xsl:variable name="var61_gazette_reference" as="node()" select="correction-notice/gazette-reference"/>
						<pat:GazetteReference>
							<xsl:for-each select="$var61_gazette_reference/@id">
								<xsl:attribute name="com:id" select="fn:string(.)"/>
							</xsl:for-each>
							<pat:GazetteNumber>
								<xsl:sequence select="fn:string($var61_gazette_reference/gazette-num)"/>
							</pat:GazetteNumber>
							<com:PublicationDate>
								<xsl:sequence select="fn:string($var61_gazette_reference/date)"/>
							</com:PublicationDate>
							<xsl:for-each select="$var61_gazette_reference/text">
								<pat:GazetteReferenceText>
									<xsl:sequence select="fn:string(.)"/>
								</pat:GazetteReferenceText>
							</xsl:for-each>
							<xsl:for-each select="$var61_gazette_reference/@country">
								<com:IPOfficeCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:IPOfficeCode>
							</xsl:for-each>
						</pat:GazetteReference>
					</pat:PatentDocumentRepublication>
				</xsl:for-each>
				<xsl:for-each select="date-exhibition-filed">
					<pat:ExhibitionFilingDate>
						<xsl:sequence select="()"/>
					</pat:ExhibitionFilingDate>
				</xsl:for-each>
				<xsl:for-each select="date-rights-reestablished">
					<pat:RightsReestablishedDate>
						<xsl:sequence select="()"/>
					</pat:RightsReestablishedDate>
				</xsl:for-each>
				<xsl:for-each select="date-application-withdrawn-by-applicant">
					<pat:ApplicationWithdrawnDate>
						<xsl:sequence select="()"/>
					</pat:ApplicationWithdrawnDate>
				</xsl:for-each>
				<xsl:for-each select="date-application-deemed-withdrawn">
					<pat:ApplicationDeemedWithdrawnDate>
						<xsl:sequence select="()"/>
					</pat:ApplicationDeemedWithdrawnDate>
				</xsl:for-each>
				<xsl:for-each select="date-of-revocation">
					<pat:PatentRevocationDate>
						<xsl:sequence select="()"/>
					</pat:PatentRevocationDate>
				</xsl:for-each>
				<xsl:for-each select="date-pct-article-22-39-fulfilled">
					<pat:PCTNationalPhaseEntryDate>
						<xsl:sequence select="fn:string(date)"/>
					</pat:PCTNationalPhaseEntryDate>
				</xsl:for-each>
				<xsl:for-each select="date-application-partially-withdrawn">
					<pat:ApplicationPartiallyWithdrawnDate>
						<xsl:sequence select="fn:string(date)"/>
					</pat:ApplicationPartiallyWithdrawnDate>
				</xsl:for-each>
				<xsl:for-each select="opposition-data">
					<pat:OppositionData>
						<xsl:sequence select="()"/>
					</pat:OppositionData>
				</xsl:for-each>
			</xsl:for-each>
		</pat:BibliographicData>
	</xsl:template>
</xsl:stylesheet>
