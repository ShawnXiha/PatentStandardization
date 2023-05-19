<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
				xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO"
				xmlns:mathml="http://www.w3.org/1998/Math/MathML3"
				xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns:fn="http://www.w3.org/2005/xpath-functions"
				xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
				xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
				exclude-result-prefixes="WIPO vmf xs fn">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
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
				<xsl:variable name="var2_address" as="node()*" select="*:address"/>
				<com:BioDepositDepositary>
					<com:PostalAddressBag>
						<com:PostalAddress>
							<xsl:for-each select="$var2_address">
								<com:PostalStructuredAddress>
									<xsl:for-each select="*:address-1">
										<AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('1'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-5">
										<com:AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('4'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</com:AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-4">
										<com:AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('5'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</com:AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-3">
										<com:AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('3'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</com:AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:address-2">
										<com:AddressLineText>
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('2'))"/>
											<xsl:sequence select="fn:string(.)"/>
										</com:AddressLineText>
									</xsl:for-each>
									<xsl:for-each select="*:city">
										<com:CityName>
											<xsl:sequence select="fn:string(.)"/>
										</com:CityName>
									</xsl:for-each>
									<xsl:for-each select="*:county">
										<com:CountryCode>
											<xsl:sequence select="fn:string(.)"/>
										</com:CountryCode>
									</xsl:for-each>
									<xsl:for-each select="*:postcode">
										<com:PostalCode>
											<xsl:sequence select="fn:string(.)"/>
										</com:PostalCode>
									</xsl:for-each>
									<xsl:for-each select="*:mailcode">
										<com:PostalCode>
											<xsl:sequence select="fn:string(.)"/>
										</com:PostalCode>
									</xsl:for-each>
								</com:PostalStructuredAddress>
							</xsl:for-each>
							<xsl:for-each select="$var2_address">
								<xsl:variable name="var1_cur" as="node()?" select="."/>
								<xsl:for-each select="*:text">
									<com:PostalAddressText>
										<xsl:for-each select="$var1_cur/*:country">
											<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</com:PostalAddressText>
								</xsl:for-each>
							</xsl:for-each>
						</com:PostalAddress>
					</com:PostalAddressBag>
				</com:BioDepositDepositary>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:bio-accno">
				<com:BiologicalAccessionNumber>
					<xsl:sequence select="fn:string(.)"/>
				</com:BiologicalAccessionNumber>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:date">
				<com:BioDepositDate>
					<xsl:sequence select="fn:string(.)"/>
				</com:BioDepositDate>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:term">
				<com:BioDepositTermText>
					<xsl:for-each select="$var3_depositary/*:address/*:text">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:BioDepositTermText>
			</xsl:for-each>
			<xsl:for-each select="$biodeposit/*:dtext">
				<com:BioDepositText>
					<xsl:sequence select="fn:string(.)"/>
				</com:BioDepositText>
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
			<com:Name>
				<xsl:for-each select="$addressbook/*:last-name">
					<com:PersonName>
						<com:PersonStructuredName>
							<xsl:for-each select="$addressbook/*:prefix">
								<com:NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</com:NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:first-name">
								<com:FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FirstName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:middle-name">
								<com:MiddleName>
									<xsl:sequence select="fn:string(.)"/>
								</com:MiddleName>
							</xsl:for-each>
							<com:LastName>
								<xsl:sequence select="fn:string(.)"/>
							</com:LastName>
							<xsl:for-each select="$addressbook/*:first-last-name">
								<com:FirstLastName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FirstLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:second-last-name">
								<com:SecondLastName>
									<xsl:sequence select="fn:string(.)"/>
								</com:SecondLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:suffix">
								<com:NameSuffix>
									<xsl:sequence select="fn:string(.)"/>
								</com:NameSuffix>
							</xsl:for-each>
						</com:PersonStructuredName>
					</com:PersonName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:orgname">
					<com:OrganizationName>
						<com:OrganizationStandardName>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</com:OrganizationStandardName>
					</com:OrganizationName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:name">
					<com:EntityName>
						<xsl:for-each select="$addressbook/*:role">
							<xsl:attribute name="entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</com:EntityName>
				</xsl:for-each>
			</com:Name>
			<com:PostalAddressBag>
				<xsl:for-each select="$addressbook/*:address">
					<com:PostalAddress>
						<com:PostalStructuredAddress>
							<xsl:for-each select="*:address-1">
								<com:AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('1'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-4">
								<com:AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('4'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-2">
								<com:AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('2'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-3">
								<com:AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('3'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-5">
								<com:AddressLineText>
									<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:decimal('5'))"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:pobox">
								<com:AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Postal office box'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:room">
								<com:AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Room'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:address-floor">
								<com:AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Floor'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:building">
								<com:AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Building'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:street">
								<com:AddressLineText>
									<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Street'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:AddressLineText>
							</xsl:for-each>
							<xsl:for-each select="*:city">
								<com:CityName>
									<xsl:sequence select="fn:string(.)"/>
								</com:CityName>
							</xsl:for-each>
							<xsl:for-each select="*:county">
								<com:GeographicRegionName>
									<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'County'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:GeographicRegionName>
							</xsl:for-each>
							<xsl:for-each select="*:state">
								<com:GeographicRegionName>
									<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'State'"/>
									<xsl:sequence select="fn:string(.)"/>
								</com:GeographicRegionName>
							</xsl:for-each>
							<xsl:for-each select="*:country">
								<com:CountryCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:CountryCode>
							</xsl:for-each>
							<xsl:for-each select="*:mailcode">
								<com:PostalCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:PostalCode>
							</xsl:for-each>
							<xsl:for-each select="*:postcode">
								<com:PostalCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:PostalCode>
							</xsl:for-each>
						</com:PostalStructuredAddress>
						<xsl:for-each select="*:text">
							<com:PostalAddressText>
								<xsl:sequence select="fn:string(.)"/>
							</com:PostalAddressText>
						</xsl:for-each>
					</com:PostalAddress>
				</xsl:for-each>
			</com:PostalAddressBag>
			<xsl:for-each select="$addressbook/*:fax">
				<FaxNumberBag>
					<FaxNumber>
						<xsl:sequence select="fn:string(.)"/>
					</FaxNumber>
				</FaxNumberBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:email">
				<com:EmailAddressBag>
					<com:EmailAddressText>
						<xsl:for-each select="@email-purpose">
							<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_bibiliographic_5_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
								<xsl:attribute name="emailAddressPurposeCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</com:EmailAddressText>
				</com:EmailAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:url">
				<com:WebAddressBag>
					<com:WebAddressURI>
						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
					</com:WebAddressURI>
				</com:WebAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$addressbook/*:phone">
				<com:PhoneNumberBag>
					<com:PhoneNumber>
						<xsl:for-each select="$var2_ead">
							<xsl:attribute name="phoneNumberCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
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
	<xsl:template name="WIPO:ST36address-bookToST96PublicationContact">
		<xsl:param name="addressbook" select="()"/>
		<xsl:variable name="var1_address" as="node()*" select="$addressbook/address"/>
		<com:PublicationContact>
			<com:Name>
				<xsl:for-each select="$addressbook/*:last-name">
					<com:PersonName>
						<com:PersonStructuredName>
							<xsl:for-each select="$addressbook/*:prefix">
								<com:NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</com:NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:first-name">
								<com:FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FirstName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:middle-name">
								<com:MiddleName>
									<xsl:sequence select="fn:string(.)"/>
								</com:MiddleName>
							</xsl:for-each>
							<com:LastName>
								<xsl:sequence select="fn:string(.)"/>
							</com:LastName>
							<xsl:for-each select="$addressbook/*:first-last-name">
								<com:FirstLastName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FirstLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:second-last-name">
								<com:SecondLastName>
									<xsl:sequence select="fn:string(.)"/>
								</com:SecondLastName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:suffix">
								<com:NameSuffix>
									<xsl:sequence select="fn:string(.)"/>
								</com:NameSuffix>
							</xsl:for-each>
						</com:PersonStructuredName>
					</com:PersonName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:orgname">
					<com:OrganizationName>
						<com:OrganizationStandardName>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</com:OrganizationStandardName>
					</com:OrganizationName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:name">
					<com:EntityName>
						<xsl:sequence select="fn:string(.)"/>
					</com:EntityName>
				</xsl:for-each>
			</com:Name>
			<xsl:for-each select="$var1_address/*:city">
				<com:CityName>
					<xsl:sequence select="fn:string(.)"/>
				</com:CityName>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:state">
				<com:GeographicRegionName>
					<xsl:sequence select="fn:string(.)"/>
				</com:GeographicRegionName>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:country">
				<xsl:if test="fn:string(.) != 'unknown'">
					<com:CountryCode>
						<xsl:sequence select="fn:string(.)"/>
					</com:CountryCode>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:postcode">
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
			<pat:ApplicantBag>
				<xsl:for-each select="//*:applicant">
					<xsl:variable name="var4_sequence" as="node()?" select="@sequence"/>
					<pat:Applicant>
						<xsl:for-each select="$var4_sequence">
							<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="*:addressbook">
							<xsl:variable name="var1_resultof_ST__address_bookToST__PublicationContact" as="node()?">
								<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
									<xsl:with-param name="addressbook" as="node()?">
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
						<xsl:for-each select="name">
							<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<com:Name>
									<com:EntityName>
										<xsl:sequence select="fn:string(.)"/>
									</com:EntityName>
								</com:Name>
							</com:PublicationContact>
						</xsl:for-each>
						<xsl:for-each select="@app-type">
							<pat:ApplicantCategory>
								<xsl:call-template name="vmf:vmf_bibiliographic_6_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</pat:ApplicantCategory>
						</xsl:for-each>
						<xsl:for-each select="*:nationality/*:country">
							<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:NationalityCode>
						</xsl:for-each>
						<xsl:for-each select="@designation">
							<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_bibiliographic_7_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
								<pat:DesignationCategory>
									<xsl:sequence select="."/>
								</pat:DesignationCategory>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="*:residence/*:country">
							<com:ResidenceCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:ResidenceCountryCode>
						</xsl:for-each>
						<xsl:for-each select="*:rights">
							<pat:SuccessorRights>
								<xsl:for-each select="$var4_sequence">
									<xsl:attribute name="applicantSequenceNumberReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent" select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<pat:SuccessorRightsText>
										<xsl:sequence select="fn:string(.)"/>
									</pat:SuccessorRightsText>
								</xsl:for-each>
								<xsl:for-each select="@kind">
									<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
										<xsl:call-template name="vmf:vmf_bibiliographic_8_inputtoresult">
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
			<pat:InventorBag>
				<xsl:for-each select="//*:inventor">
					<xsl:variable name="var6_cur" as="node()?" select="."/>
					<pat:Inventor>
						<xsl:for-each select="@sequence">
							<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="*:addressbook">
							<xsl:variable name="var5_resultof_ST__address_bookToST__PublicationContact" as="node()?">
								<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
									<xsl:with-param name="addressbook" as="node()?">
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
						<xsl:for-each select="name">
							<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<com:Name>
									<com:EntityName>
										<xsl:sequence select="fn:string(.)"/>
									</com:EntityName>
								</com:Name>
							</com:PublicationContact>
						</xsl:for-each>
						<xsl:for-each select="*:designated-states">
							<pat:StateDesignation>
								<xsl:for-each select="$var6_cur/@designation">
									<NewDesignationCountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</NewDesignationCountryCode>
								</xsl:for-each>
								<xsl:for-each select="*:country">
									<NationalDesignation>
										<com:DesignatedCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
											<xsl:sequence select="fn:string(.)"/>
										</com:DesignatedCountryCode>
									</NationalDesignation>
								</xsl:for-each>
								<xsl:for-each select="*:region">
									<pat:RegionalDesignation>
										<xsl:for-each select="*:country">
											<com:DesignatedCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
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
			<pat:AssigneeBag>
				<xsl:for-each select="//*:assignee">
					<pat:Assignee>
						<xsl:for-each select="*:addressbook">
							<xsl:variable name="var7_resultof_ST__address_bookToST__PublicationContact" as="node()?">
								<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
									<xsl:with-param name="addressbook" as="node()?">
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
					</pat:Assignee>
				</xsl:for-each>
			</pat:AssigneeBag>
			<xsl:variable name="var10_cur" as="node()?" select="."/>
			<pat:RegisteredPractitionerBag>
				<xsl:for-each select="//*:agent">
					<pat:RegisteredPractitioner>
						<xsl:for-each select="@sequence">
							<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="$var10_cur/*:customer-number">
							<pat:RegisteredPractitionerRegistrationNumber>
								<xsl:sequence select="fn:string(.)"/>
							</pat:RegisteredPractitionerRegistrationNumber>
						</xsl:for-each>
						<xsl:for-each select="@rep-type">
							<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_bibiliographic_9_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
								<pat:RegisteredPractitionerCategory>
									<xsl:sequence select="."/>
								</pat:RegisteredPractitionerCategory>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="*:addressbook">
							<xsl:variable name="var9_resultof_ST__address_bookToST__PublicationContact" as="node()?">
								<xsl:call-template name="WIPO:ST36address-bookToST96PublicationContact">
									<xsl:with-param name="addressbook" as="node()?">
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
						<xsl:for-each select="agency/name">
							<com:PublicationContact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<com:Name>
									<com:EntityName>
										<xsl:sequence select="fn:string(.)"/>
									</com:EntityName>
								</com:Name>
							</com:PublicationContact>
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
					</pat:RegisteredPractitioner>
				</xsl:for-each>
				<xsl:for-each select="($var14_authorized_officer/*:name)[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
					<RegisteredPractitioner>
						<xsl:sequence select="()"/>
					</RegisteredPractitioner>
				</xsl:for-each>
			</pat:RegisteredPractitionerBag>
			<ExaminerBag>
				<xsl:for-each select="$examiners/*:primary-examiner">
					<xsl:variable name="var11_name" as="node()*" select="*:name"/>
					<PrimaryExaminer>
						<com:Name xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<com:PersonName>
								<xsl:for-each select="($var11_name)[fn:exists((./@name-type)[(fn:string(.) = 'natural')])]">
									<com:PersonFullName>
										<xsl:sequence select="fn:string(.)"/>
									</com:PersonFullName>
								</xsl:for-each>
								<com:PersonStructuredName>
									<xsl:for-each select="*:prefix">
										<com:NamePrefix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NamePrefix>
									</xsl:for-each>
									<xsl:for-each select="*:first-name">
										<com:FirstName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstName>
									</xsl:for-each>
									<xsl:for-each select="*:middle-name">
										<com:MiddleName>
											<xsl:sequence select="fn:string(.)"/>
										</com:MiddleName>
									</xsl:for-each>
									<xsl:for-each select="*:last-name">
										<com:LastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:LastName>
									</xsl:for-each>
									<xsl:for-each select="*:first-last-name">
										<com:FirstLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstLastName>
									</xsl:for-each>
									<xsl:for-each select="*:second-last-name">
										<com:SecondLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:SecondLastName>
									</xsl:for-each>
									<xsl:for-each select="*:suffix">
										<com:NameSuffix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NameSuffix>
									</xsl:for-each>
									<xsl:for-each select="*:synonym">
										<com:PersonOtherName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonOtherName>
									</xsl:for-each>
								</com:PersonStructuredName>
							</com:PersonName>
							<xsl:for-each select="*:orgname">
								<com:OrganizationName>
									<xsl:for-each select="($var11_name)[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
										<com:OrganizationStandardName>
											<xsl:sequence select="fn:string(.)"/>
										</com:OrganizationStandardName>
									</xsl:for-each>
								</com:OrganizationName>
							</xsl:for-each>
							<com:EntityName>
								<xsl:for-each select="*:role">
									<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
								</xsl:for-each>
							</com:EntityName>
						</com:Name>
						<xsl:for-each select="*:electronic-signature">
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
								<xsl:for-each select="*:basic-signature">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7">
											<xsl:attribute name="com:pkcs7Indicator" select="()"/>
										</xsl:for-each>
									</com:ElectronicEnhancedSignature>
								</xsl:for-each>
							</com:ElectronicSignature>
						</xsl:for-each>
					</PrimaryExaminer>
				</xsl:for-each>
				<xsl:for-each select="$examiners/*:assistant-examiner">
					<xsl:variable name="var12_cur" as="node()?" select="."/>
					<AssistantExaminer>
						<xsl:for-each select="(./*:name)[fn:exists((./@name-type)[(fn:string(.) = 'legal')])]">
							<com:Name xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<com:PersonName>
									<xsl:if test="fn:exists((./@name-type)[(fn:string(.) = 'natural')])">
										<com:PersonFullName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonFullName>
									</xsl:if>
									<com:PersonStructuredName>
										<xsl:for-each select="$var12_cur/*:prefix">
											<com:NamePrefix>
												<xsl:sequence select="fn:string(.)"/>
											</com:NamePrefix>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:first-name">
											<com:FirstName>
												<xsl:sequence select="fn:string(.)"/>
											</com:FirstName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:middle-name">
											<com:MiddleName>
												<xsl:sequence select="fn:string(.)"/>
											</com:MiddleName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:last-name">
											<com:LastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:LastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:first-last-name">
											<com:FirstLastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:FirstLastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:second-last-name">
											<com:SecondLastName>
												<xsl:sequence select="fn:string(.)"/>
											</com:SecondLastName>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:suffix">
											<com:NameSuffix>
												<xsl:sequence select="fn:string(.)"/>
											</com:NameSuffix>
										</xsl:for-each>
										<xsl:for-each select="$var12_cur/*:synonym">
											<com:PersonOtherName>
												<xsl:sequence select="fn:string(.)"/>
											</com:PersonOtherName>
										</xsl:for-each>
									</com:PersonStructuredName>
								</com:PersonName>
								<xsl:for-each select="$var12_cur/*:orgname">
									<com:OrganizationName>
										<xsl:sequence select="()"/>
									</com:OrganizationName>
								</xsl:for-each>
								<com:EntityName>
									<xsl:for-each select="$var12_cur/*:role">
										<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
									</xsl:for-each>
								</com:EntityName>
							</com:Name>
						</xsl:for-each>
						<xsl:for-each select="*:electronic-signature">
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
								<xsl:for-each select="*:basic-signature">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7">
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
								<xsl:for-each select="(./*:name)[fn:exists((./@name-type)[(fn:string(.) = 'natural')])]">
									<com:PersonFullName>
										<xsl:sequence select="fn:string(.)"/>
									</com:PersonFullName>
								</xsl:for-each>
								<com:PersonStructuredName>
									<xsl:for-each select="*:prefix">
										<com:NamePrefix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NamePrefix>
									</xsl:for-each>
									<xsl:for-each select="*:first-name">
										<com:FirstName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstName>
									</xsl:for-each>
									<xsl:for-each select="*:middle-name">
										<com:MiddleName>
											<xsl:sequence select="fn:string(.)"/>
										</com:MiddleName>
									</xsl:for-each>
									<xsl:for-each select="*:last-name">
										<com:LastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:LastName>
									</xsl:for-each>
									<xsl:for-each select="*:first-last-name">
										<com:FirstLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:FirstLastName>
									</xsl:for-each>
									<xsl:for-each select="*:second-last-name">
										<com:SecondLastName>
											<xsl:sequence select="fn:string(.)"/>
										</com:SecondLastName>
									</xsl:for-each>
									<xsl:for-each select="*:suffix">
										<com:NameSuffix>
											<xsl:sequence select="fn:string(.)"/>
										</com:NameSuffix>
									</xsl:for-each>
									<xsl:for-each select="*:synonym">
										<com:PersonOtherName>
											<xsl:sequence select="fn:string(.)"/>
										</com:PersonOtherName>
									</xsl:for-each>
								</com:PersonStructuredName>
							</com:PersonName>
							<xsl:for-each select="*:orgname">
								<com:OrganizationName>
									<xsl:sequence select="()"/>
								</com:OrganizationName>
							</xsl:for-each>
							<com:EntityName>
								<xsl:for-each select="*:role">
									<xsl:attribute name="com:entityNameCategory" select="fn:string(.)"/>
								</xsl:for-each>
							</com:EntityName>
						</com:Name>
						<xsl:for-each select="*:phone">
							<com:PhoneNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:PhoneNumber>
						</xsl:for-each>
						<xsl:for-each select="*:fax">
							<com:FaxNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:FaxNumber>
						</xsl:for-each>
						<xsl:for-each select="*:email">
							<com:EmailAddressText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:EmailAddressText>
						</xsl:for-each>
						<xsl:for-each select="*:electronic-signature">
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
								<xsl:for-each select="*:basic-signature">
									<com:ElectronicBasicSignature>
										<xsl:for-each select="*:fax-image/@file">
											<com:ElectronicBasicSignatureImageURI>
												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
											</com:ElectronicBasicSignatureImageURI>
										</xsl:for-each>
										<xsl:for-each select="*:text-string">
											<com:ElectronicBasicSignatureText>
												<xsl:sequence select="fn:string(.)"/>
											</com:ElectronicBasicSignatureText>
										</xsl:for-each>
										<xsl:for-each select="*:click-wrap">
											<com:ElectronicBasicSignatureClickWrap>
												<xsl:sequence select="()"/>
											</com:ElectronicBasicSignatureClickWrap>
										</xsl:for-each>
									</com:ElectronicBasicSignature>
								</xsl:for-each>
								<xsl:for-each select="*:enhanced-signature">
									<com:ElectronicEnhancedSignature>
										<xsl:for-each select="*:pkcs7">
											<xsl:attribute name="com:pkcs7Indicator" select="()"/>
										</xsl:for-each>
									</com:ElectronicEnhancedSignature>
								</xsl:for-each>
							</com:ElectronicSignature>
						</xsl:for-each>
					</AuthorizedOfficer>
				</xsl:for-each>
			</ExaminerBag>
			<xsl:for-each select="$parties/*:correspondence-address">
				<com:CorrespondenceAddress xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="*:customer-number">
						<com:PartyIdentifier>
							<xsl:sequence select="fn:string(.)"/>
						</com:PartyIdentifier>
					</xsl:for-each>
					<xsl:for-each select="*:addressbook">
						<xsl:variable name="var13_resultof_ST__address_bookToST__contact" as="node()?">
							<xsl:call-template name="WIPO:ST36address-bookToST96contact">
								<xsl:with-param name="addressbook" as="node()?">
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
	<xsl:template name="vmf:vmf_bibiliographic_1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='utility'">
				<xsl:copy-of select="'Utility'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_bibiliographic_2_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_3_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_4_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_5_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_6_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_7_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_8_inputtoresult">
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
	<xsl:template name="vmf:vmf_bibiliographic_9_inputtoresult">
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
	<xsl:template name="WIPO:ST36claim-textToST96ClaimText">
		<xsl:param name="claimtext" select="()"/>
		<pat:ClaimText>
			<xsl:for-each select="$claimtext/node()">
				<xsl:if test="fn:boolean(self::text())">
					<xsl:sequence select="fn:string(.)"/>
				</xsl:if>
				<xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:claim-text)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__claim_textToST__ClaimText" as="node()?">
						<xsl:call-template name="WIPO:ST36claim-textToST96ClaimText">
							<xsl:with-param name="claimtext" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
					<xsl:variable name="var12_resultof_ST__supToST__Sup" as="node()?">
						<xsl:call-template name="WIPO:ST36supToST96Sup">
							<xsl:with-param name="sup" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
					<xsl:variable name="var14_resultof_ST__subToST__Sub" as="node()?">
						<xsl:call-template name="WIPO:ST36subToST96Sub">
							<xsl:with-param name="sub" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:img)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
					<xsl:variable name="var16_resultof_ST__imgToST__Image" as="node()?">
						<xsl:call-template name="WIPO:ST36imgToST96Image">
							<xsl:with-param name="img" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
					<xsl:variable name="var18_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
						<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
							<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:br)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
					<com:Br>
						<xsl:sequence select="()"/>
					</com:Br>
				</xsl:for-each>
				<xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:pre)">
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
					<xsl:if test="fn:boolean(self::*:maths)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
					<xsl:variable name="var22_resultof_ST__mathsToST__Math" as="node()?">
						<xsl:call-template name="WIPO:ST36mathsToST96Math">
							<xsl:with-param name="maths" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:chemistry)">
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
						<xsl:for-each select="*:img">
							<xsl:variable name="var24_resultof_ST__imgToST__Image" as="node()?">
								<xsl:call-template name="WIPO:ST36imgToST96Image">
									<xsl:with-param name="img" as="node()?">
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
						<xsl:for-each select="*:chem">
							<com:InlineFormula>
								<xsl:sequence select="()"/>
							</com:InlineFormula>
						</xsl:for-each>
					</com:ChemicalFormulae>
				</xsl:for-each>
				<xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:tables)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
					<xsl:variable name="var26_resultof_ST__tablesToST__Table" as="node()?">
						<xsl:call-template name="WIPO:ST36tablesToST96Table">
							<xsl:with-param name="tables" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:claim-ref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
					<pat:ClaimReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="(./node())[fn:boolean(self::text())]">
							<xsl:sequence select="fn:string(.)"/>
						</xsl:for-each>
					</pat:ClaimReference>
				</xsl:for-each>
				<xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:figref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
					<com:FigureReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="@num">
							<xsl:attribute name="com:referencedFigureNumber" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
								<xsl:variable name="var30_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
								<xsl:variable name="var32_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
								<xsl:variable name="var34_resultof_ST__oToST__O" as="node()?">
									<xsl:call-template name="WIPO:ST36oToST96O">
										<xsl:with-param name="o" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
								<xsl:variable name="var36_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sub)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
								<xsl:variable name="var38_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sup)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var39_test_resultof_node_name_equal_qname">
								<xsl:variable name="var40_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:smallcaps)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var41_test_resultof_node_name_equal_qname">
								<xsl:variable name="var42_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:crossref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
					<com:CrossReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
								<xsl:variable name="var45_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
								<xsl:variable name="var47_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var48_test_resultof_node_name_equal_qname">
								<xsl:variable name="var49_resultof_ST__oToST__O" as="node()?">
									<xsl:call-template name="WIPO:ST36oToST96O">
										<xsl:with-param name="o" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var50_test_resultof_node_name_equal_qname">
								<xsl:variable name="var51_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sub)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var52_test_resultof_node_name_equal_qname">
								<xsl:variable name="var53_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sup)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var54_test_resultof_node_name_equal_qname">
								<xsl:variable name="var55_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
											<sup xmlns="">
												<xsl:sequence select="(./@node(), ./node())"/>
											</sup>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var55_resultof_ST__supToST__Sup">
									<com:Sup>
										<xsl:sequence select="(./@node(), ./node())"/>n
									</com:Sup>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:variable name="var56_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:smallcaps)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var56_test_resultof_node_name_equal_qname">
								<xsl:variable name="var57_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
			<xsl:for-each select="$tables/*:table">
				<com:IPOASISTable>
					<xsl:for-each select="@frame">
						<xsl:attribute name="tbl:frame" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="@colsep">
						<xsl:attribute name="tbl:colsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
					</xsl:for-each>
					<xsl:for-each select="@rowsep">
						<xsl:attribute name="tbl:rowsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
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
					<xsl:for-each select="*:title">
						<com:TableTitle>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="*:b">
								<xsl:variable name="var1_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
							<xsl:for-each select="*:i">
								<xsl:variable name="var2_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
							<xsl:for-each select="*:u">
								<xsl:variable name="var3_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
							<xsl:for-each select="*:sub">
								<xsl:variable name="var4_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
							<xsl:for-each select="*:sup">
								<xsl:variable name="var5_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
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
							<xsl:for-each select="*:smallcaps">
								<xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:for-each select="*:tgroup">
						<com:TableGroup>
							<xsl:for-each select="@cols">
								<xsl:attribute name="tbl:cols" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:integer(fn:string(.)))"/>
							</xsl:for-each>
							<xsl:for-each select="@colsep">
								<xsl:attribute name="tbl:colsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
							</xsl:for-each>
							<xsl:for-each select="@rowsep">
								<xsl:attribute name="tbl:rowsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
							</xsl:for-each>
							<xsl:for-each select="@align">
								<xsl:attribute name="tbl:align" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="*:colspec">
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
							<xsl:for-each select="*:thead">
								<tbl:thead xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0">
									<xsl:for-each select="@valign">
										<xsl:attribute name="tbl:valign" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="*:row">
										<tbl:row>
											<xsl:for-each select="@rowsep">
												<xsl:attribute name="tbl:rowsep" select="xs:string(xs:boolean(fn:string(.)))"/>
											</xsl:for-each>
											<xsl:for-each select="@valign">
												<xsl:attribute name="tbl:valign" select="fn:string(.)"/>
											</xsl:for-each>
										</tbl:row>
									</xsl:for-each>
								</tbl:thead>
							</xsl:for-each>
							<xsl:for-each select="*:tbody">
								<com:TableBody>
									<xsl:for-each select="@valign">
										<xsl:attribute name="tbl:valign" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="*:row">
										<com:Row>
											<xsl:for-each select="@rowsep">
												<xsl:attribute name="tbl:rowsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
											</xsl:for-each>
											<xsl:for-each select="@valign">
												<xsl:attribute name="tbl:valign" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:for-each select="*:entry">
												<com:Entry>
													<xsl:for-each select="@colname">
														<xsl:attribute name="tbl:colname" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@namest">
														<xsl:attribute name="tbl:namest" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@nameend">
														<xsl:attribute name="tbl:nameend" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@morerows">
														<xsl:attribute name="tbl:morerows" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:integer(fn:string(.)))"/>
													</xsl:for-each>
													<xsl:for-each select="@colsep">
														<xsl:attribute name="tbl:colsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
													</xsl:for-each>
													<xsl:for-each select="@rowsep">
														<xsl:attribute name="tbl:rowsep" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="xs:string(xs:boolean(fn:string(.)))"/>
													</xsl:for-each>
													<xsl:for-each select="@align">
														<xsl:attribute name="tbl:align" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@char">
														<xsl:attribute name="tbl:char" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@charoff">
														<xsl:attribute name="tbl:charoff" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@valign">
														<xsl:attribute name="tbl:valign" namespace="http://www.oasis-open.org/tables/exchange/1.0" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="node()">
														<xsl:if test="fn:boolean(self::text())">
															<xsl:sequence select="fn:string(.)"/>
														</xsl:if>
														<xsl:variable name="var7_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:b)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
															<xsl:variable name="var8_resultof_ST__bToST__B" as="node()*">
																<xsl:call-template name="WIPO:ST36bToST96B">
																	<xsl:with-param name="b" as="node()?">
																		<b xmlns="">
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
															<xsl:if test="fn:boolean(self::*:i)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
															<xsl:variable name="var10_resultof_ST__iToST__I" as="node()?">
																<xsl:call-template name="WIPO:ST36iToST96I">
																	<xsl:with-param name="i" as="node()?">
																		<i xmlns="">
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
															<xsl:if test="fn:boolean(self::*:u)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
															<xsl:variable name="var12_resultof_ST__uToST__U" as="node()?">
																<xsl:call-template name="WIPO:ST36uToST96U">
																	<xsl:with-param name="u" as="node()?">
																		<u xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
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
														<xsl:variable name="var13_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:sup)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var13_test_resultof_node_name_equal_qname">
															<xsl:variable name="var14_resultof_ST__supToST__Sup" as="node()?">
																<xsl:call-template name="WIPO:ST36supToST96Sup">
																	<xsl:with-param name="sup" as="node()?">
																		<sup xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
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
														<xsl:variable name="var15_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:sub)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var15_test_resultof_node_name_equal_qname">
															<xsl:variable name="var16_resultof_ST__subToST__Sub" as="node()?">
																<xsl:call-template name="WIPO:ST36subToST96Sub">
																	<xsl:with-param name="sub" as="node()?">
																		<sub xmlns="">
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
															<xsl:if test="fn:boolean(self::*:img)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
															<xsl:variable name="var18_resultof_ST__imgToST__Image" as="node()?">
																<xsl:call-template name="WIPO:ST36imgToST96Image">
																	<xsl:with-param name="img" as="node()?">
																		<img xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
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
														<xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:smallcaps)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
															<xsl:variable name="var20_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
																<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
																	<xsl:with-param name="smallcaps" as="node()?">
																		<smallcaps xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</smallcaps>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var20_resultof_ST__smallcapsToST__SmallCapitals">
																<com:SmallCapital>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</com:SmallCapital>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:br)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
															<com:Br>
																<xsl:sequence select="()"/>
															</com:Br>
														</xsl:for-each>
														<xsl:variable name="var22_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:ul)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var22_test_resultof_node_name_equal_qname">
															<com:UL>
																<xsl:for-each select="@id">
																	<xsl:attribute name="com:id" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@list-style">
																	<xsl:attribute name="com:ulStyle" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="*:li">
																	<xsl:variable name="var23_resultof_ST__liToST__LI" as="node()?">
																		<xsl:call-template name="WIPO:ST36liToST96LI">
																			<xsl:with-param name="li" as="node()?">
																				<li xmlns="">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</li>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var23_resultof_ST__liToST__LI">
																		<com:LI>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:LI>
																	</xsl:for-each>
																</xsl:for-each>
															</com:UL>
														</xsl:for-each>
														<xsl:variable name="var24_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:ol)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var24_test_resultof_node_name_equal_qname">
															<com:OL>
																<xsl:for-each select="@id">
																	<xsl:attribute name="com:id" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@ol-style">
																	<xsl:attribute name="com:olStyle" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="*:li">
																	<xsl:variable name="var25_resultof_ST__liToST__LI" as="node()?">
																		<xsl:call-template name="WIPO:ST36liToST96LI">
																			<xsl:with-param name="li" as="node()?">
																				<li xmlns="">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</li>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var25_resultof_ST__liToST__LI">
																		<com:LI>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:LI>
																	</xsl:for-each>
																</xsl:for-each>
															</com:OL>
														</xsl:for-each>
														<xsl:variable name="var26_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:dl)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var26_test_resultof_node_name_equal_qname">
															<com:DL>
																<xsl:for-each select="@id">
																	<xsl:attribute name="com:id" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="*:dt">
																	<xsl:variable name="var27_resultof_ST__dtToST__DT" as="node()?">
																		<xsl:call-template name="WIPO:ST36dtToST96DT">
																			<xsl:with-param name="dt" as="node()?">
																				<dt xmlns="">
																					<xsl:sequence select="fn:string(.)"/>
																				</dt>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var27_resultof_ST__dtToST__DT">
																		<com:DT>
																			<xsl:sequence select="fn:string(.)"/>
																		</com:DT>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="*:dd">
																	<com:DD>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DD>
																</xsl:for-each>
															</com:DL>
														</xsl:for-each>
														<xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:maths)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
															<xsl:variable name="var29_resultof_ST__mathsToST__Math" as="node()?">
																<xsl:call-template name="WIPO:ST36mathsToST96Math">
																	<xsl:with-param name="maths" as="node()?">
																		<maths xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
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
														<xsl:variable name="var30_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:chemistry)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var30_test_resultof_node_name_equal_qname">
															<com:ChemicalFormulae>
																<xsl:for-each select="@id">
																	<xsl:attribute name="com:id" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@num">
																	<xsl:attribute name="com:chemicalFormulaeNumber" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="*:img">
																	<xsl:variable name="var31_resultof_ST__imgToST__Image" as="node()?">
																		<xsl:call-template name="WIPO:ST36imgToST96Image">
																			<xsl:with-param name="img" as="node()?">
																				<img xmlns="">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</img>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var31_resultof_ST__imgToST__Image">
																		<com:Image>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Image>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="*:chem">
																	<com:InlineFormula>
																		<xsl:sequence select="()"/>
																	</com:InlineFormula>
																</xsl:for-each>
															</com:ChemicalFormulae>
														</xsl:for-each>
														<xsl:variable name="var32_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:patcit)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var32_test_resultof_node_name_equal_qname">
															<xsl:variable name="var33_resultof_ST__patcitToST__PatentCitation" as="node()?">
																<xsl:call-template name="WIPO:ST36patcitToST96PatentCitation">
																	<xsl:with-param name="patcit" as="node()?">
																		<patcit xmlns="">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</patcit>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var33_resultof_ST__patcitToST__PatentCitation">
																<com:PatentCitation>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</com:PatentCitation>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:nplcit)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
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
																<xsl:for-each select="*:text">
																	<com:NPLCitationText>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:NPLCitationText>
																</xsl:for-each>
																<xsl:for-each select="*:book">
																	<com:CitedBook>
																		<xsl:sequence select="()"/>
																	</com:CitedBook>
																</xsl:for-each>
																<xsl:for-each select="*:article">
																	<com:CitedJournalArticle>
																		<xsl:for-each select="*:author">
																			<com:AuthorName>
																				<xsl:sequence select="()"/>
																			</com:AuthorName>
																		</xsl:for-each>
																		<xsl:for-each select="*:subname">
																			<com:Subordinate>
																				<xsl:for-each select="@subname-type">
																					<xsl:attribute name="com:subordinateCategory" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="*:name">
																					<com:Name>
																						<xsl:sequence select="()"/>
																					</com:Name>
																				</xsl:for-each>
																			</com:Subordinate>
																		</xsl:for-each>
																		<xsl:for-each select="*:cpyrt">
																			<com:NPLCopyrightText>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NPLCopyrightText>
																		</xsl:for-each>
																		<xsl:for-each select="*:class">
																			<com:NPLClass>
																				<xsl:for-each select="@class-type">
																					<xsl:attribute name="com:classificationSystem" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NPLClass>
																		</xsl:for-each>
																		<xsl:for-each select="*:atl">
																			<com:SerialALTTitleText>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:SerialALTTitleText>
																		</xsl:for-each>
																	</com:CitedJournalArticle>
																</xsl:for-each>
																<xsl:for-each select="*:othercit">
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
														<xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:crossref)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
															<com:CrossReference>
																<xsl:for-each select="@idref">
																	<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
																</xsl:for-each>
																<xsl:for-each select="node()">
																	<xsl:if test="fn:boolean(self::text())">
																		<xsl:sequence select="fn:string(.)"/>
																	</xsl:if>
																	<xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:b)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var37_resultof_ST__bToST__B" as="node()*">
																			<xsl:call-template name="WIPO:ST36bToST96B">
																				<xsl:with-param name="b" as="node()?">
																					<b xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</b>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var37_resultof_ST__bToST__B">
																			<com:B>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:B>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:i)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var39_resultof_ST__iToST__I" as="node()?">
																			<xsl:call-template name="WIPO:ST36iToST96I">
																				<xsl:with-param name="i" as="node()?">
																					<i xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</i>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var39_resultof_ST__iToST__I">
																			<com:I>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:I>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:o)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var41_resultof_ST__oToST__O" as="node()?">
																			<xsl:call-template name="WIPO:ST36oToST96O">
																				<xsl:with-param name="o" as="node()?">
																					<o xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</o>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var41_resultof_ST__oToST__O">
																			<com:O>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:O>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:u)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var43_resultof_ST__uToST__U" as="node()?">
																			<xsl:call-template name="WIPO:ST36uToST96U">
																				<xsl:with-param name="u" as="node()?">
																					<u xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</u>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var43_resultof_ST__uToST__U">
																			<com:U>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:U>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:sub)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var45_resultof_ST__subToST__Sub" as="node()?">
																			<xsl:call-template name="WIPO:ST36subToST96Sub">
																				<xsl:with-param name="sub" as="node()?">
																					<sub xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</sub>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var45_resultof_ST__subToST__Sub">
																			<com:Sub>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:Sub>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var46_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:sup)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var46_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var47_resultof_ST__supToST__Sup" as="node()?">
																			<xsl:call-template name="WIPO:ST36supToST96Sup">
																				<xsl:with-param name="sup" as="node()?">
																					<sup xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</sup>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var47_resultof_ST__supToST__Sup">
																			<com:Sup>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:Sup>
																		</xsl:for-each>
																	</xsl:for-each>
																	<xsl:variable name="var48_test_resultof_node_name_equal_qname" as="node()?">
																		<xsl:if test="fn:boolean(self::*:smallcaps)">
																			<xsl:sequence select="."/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:for-each select="$var48_test_resultof_node_name_equal_qname">
																		<xsl:variable name="var49_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
																			<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
																				<xsl:with-param name="smallcaps" as="node()?">
																					<smallcaps xmlns="">
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</smallcaps>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var49_resultof_ST__smallcapsToST__SmallCapitals">
																			<com:SmallCapital>
																				<xsl:sequence select="(./@node(), ./node())"/>
																			</com:SmallCapital>
																		</xsl:for-each>
																	</xsl:for-each>
																</xsl:for-each>
															</com:CrossReference>
														</xsl:for-each>
														<xsl:variable name="var50_test_resultof_node_name_equal_qname" as="node()?">
															<xsl:if test="fn:boolean(self::*:bio-deposit)">
																<xsl:sequence select="."/>
															</xsl:if>
														</xsl:variable>
														<xsl:for-each select="$var50_test_resultof_node_name_equal_qname">
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
																<xsl:for-each select="*:depositary">
																	<xsl:variable name="var51_resultof_ST__depositaryToST__BioDepositDepositary" as="node()?">
																		<xsl:call-template name="WIPO:ST36depositaryToST96BioDepositDepositary">
																			<xsl:with-param name="depositary" as="node()?">
																				<depositary xmlns="">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</depositary>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var51_resultof_ST__depositaryToST__BioDepositDepositary">
																		<com:BioDepositDepositary>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:BioDepositDepositary>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="*:bio-accno">
																	<com:BiologicalAccessionNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:BiologicalAccessionNumber>
																</xsl:for-each>
																<xsl:for-each select="*:date">
																	<com:BioDepositDate>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:BioDepositDate>
																</xsl:for-each>
																<xsl:for-each select="*:term">
																	<com:BioDepositTermText>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:BioDepositTermText>
																</xsl:for-each>
																<xsl:for-each select="*:dtext">
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
			<xsl:for-each select="$tables/*:img">
				<xsl:variable name="var52_resultof_ST__imgToST__Image" as="node()?">
					<xsl:call-template name="WIPO:ST36imgToST96Image">
						<xsl:with-param name="img" as="node()?">
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
						<xsl:for-each select="$var1_address/*:address-1">
							<com:AddressLineText>
								<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('1'))"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:address-2">
							<com:AddressLineText>
								<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('2'))"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:address-3">
							<com:AddressLineText>
								<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('3'))"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:address-4">
							<com:AddressLineText>
								<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('4'))"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:address-5">
							<com:AddressLineText>
								<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:decimal('5'))"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:address-floor">
							<com:AddressLineText>
								<xsl:attribute name="com:addressLineCategory" select="'Floor'"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:pobox">
							<com:AddressLineText>
								<xsl:attribute name="com:addressLineCategory" select="'Postal office box'"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:building">
							<com:AddressLineText>
								<xsl:attribute name="com:addressLineCategory" select="'Building'"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:room">
							<com:AddressLineText>
								<xsl:attribute name="com:addressLineCategory" select="'Room'"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:street">
							<com:AddressLineText>
								<xsl:attribute name="com:addressLineCategory" select="'Street'"/>
							</com:AddressLineText>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:city">
							<com:CityName>
								<xsl:sequence select="fn:string(.)"/>
							</com:CityName>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:county">
							<com:GeographicRegionName>
								<xsl:attribute name="com:geographicRegionCategory" select="'County'"/>
							</com:GeographicRegionName>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:state">
							<com:GeographicRegionName>
								<xsl:attribute name="com:geographicRegionCategory" select="'State'"/>
							</com:GeographicRegionName>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:country">
							<com:CountryCode>
								<xsl:sequence select="fn:string(.)"/>
							</com:CountryCode>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:postcode">
							<com:PostalCode>
								<xsl:sequence select="fn:string(.)"/>
							</com:PostalCode>
						</xsl:for-each>
						<xsl:for-each select="$var1_address/*:mailcode">
							<com:PostalCode>
								<xsl:sequence select="fn:string(.)"/>
							</com:PostalCode>
						</xsl:for-each>
					</com:PostalStructuredAddress>
				</com:PostalAddress>
			</com:PostalAddressBag>
			<xsl:for-each select="$var1_address/*:text">
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
			<xsl:for-each select="$dt/*:b">
				<xsl:variable name="var1_resultof_ST__bToST__B" as="node()*">
					<xsl:call-template name="WIPO:ST36bToST96B">
						<xsl:with-param name="b" as="node()?">
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
			<xsl:for-each select="$dt/*:i">
				<xsl:variable name="var2_resultof_ST__iToST__I" as="node()?">
					<xsl:call-template name="WIPO:ST36iToST96I">
						<xsl:with-param name="i" as="node()?">
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
			<xsl:for-each select="$dt/*:o">
				<xsl:variable name="var3_resultof_ST__oToST__O" as="node()?">
					<xsl:call-template name="WIPO:ST36oToST96O">
						<xsl:with-param name="o" as="node()?">
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
			<xsl:for-each select="$dt/*:u">
				<xsl:variable name="var4_resultof_ST__uToST__U" as="node()?">
					<xsl:call-template name="WIPO:ST36uToST96U">
						<xsl:with-param name="u" as="node()?">
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
			<xsl:for-each select="$dt/*:sup">
				<xsl:variable name="var5_resultof_ST__subToST__Sub" as="node()?">
					<xsl:call-template name="WIPO:ST36subToST96Sub">
						<xsl:with-param name="sub" as="node()?">
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
			<xsl:for-each select="$dt/*:sub">
				<xsl:variable name="var6_resultof_ST__supToST__Sup" as="node()?">
					<xsl:call-template name="WIPO:ST36supToST96Sup">
						<xsl:with-param name="sup" as="node()?">
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
			<xsl:for-each select="$dt/*:smallcaps">
				<xsl:variable name="var7_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
					<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
						<xsl:with-param name="smallcaps" as="node()?">
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
		<com:Math>
			<xsl:if test="fn:exists($var2_num)">
				<xsl:attribute name="com:mathNumber" select="fn:string($var2_num)"/>
			</xsl:if>
			<xsl:for-each select="$maths/*:math">
				<mathml:math>
					<xsl:apply-templates/>
				</mathml:math>
			</xsl:for-each>
			<xsl:for-each select="$maths/*:img">
				<xsl:variable name="var1_resultof_ST__imgToST__Image" as="node()?">
					<xsl:call-template name="WIPO:ST36imgToST96Image">
						<xsl:with-param name="img" as="node()?">
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
					<xsl:call-template name="vmf:vmf_application_body4_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
					<xsl:attribute name="com:imageContentCategory" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$img/@orientation">
				<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf_application_body5_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
					<xsl:attribute name="com:orientationCategory" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$img/@inline">
				<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf_application_body6_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
					<xsl:attribute name="com:imageWrappingStyleCategory" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$img/@img-format">
				<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf_application_body7_inputtoresult">
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
					<xsl:sequence select="xs:string(xs:decimal(fn:string(.)))"/>
				</com:HeightMeasure>
			</xsl:for-each>
			<xsl:for-each select="$img/@wi">
				<com:WidthMeasure>
					<xsl:attribute name="com:measureUnitCode" select="'Px'"/>
					<xsl:sequence select="xs:string(xs:decimal(fn:string(.)))"/>
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
			<xsl:for-each select="$patcit/*:text">
				<com:PatentCitationText>
					<xsl:sequence select="fn:string(.)"/>
				</com:PatentCitationText>
			</xsl:for-each>
			<xsl:for-each select="$patcit/*:document-id">
				<com:CitedPatentDocumentIdentification>
					<xsl:for-each select="*:country">
						<com:IPOfficeCode>
							<xsl:sequence select="fn:string(.)"/>
						</com:IPOfficeCode>
					</xsl:for-each>
					<xsl:for-each select="*:doc-number">
						<com:DocumentNumber>
							<xsl:sequence select="fn:string(.)"/>
						</com:DocumentNumber>
					</xsl:for-each>
					<xsl:for-each select="*:kind">
						<com:PatentDocumentKindCode>
							<xsl:sequence select="fn:string(.)"/>
						</com:PatentDocumentKindCode>
					</xsl:for-each>
					<xsl:for-each select="*:date">
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
					<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:sup)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sup2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
					<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sup2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
					<xsl:if test="fn:boolean(self::*:img)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var53_test_resultof_node_name_equal_qname">
					<xsl:variable name="var54_resultof_ST__imgToST__Image" as="node()?">
						<xsl:call-template name="WIPO:ST36imgToST96Image">
							<xsl:with-param name="img" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
					<xsl:if test="fn:boolean(self::*:br)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var60_test_resultof_node_name_equal_qname">
					<com:Br>
						<xsl:sequence select="()"/>
					</com:Br>
				</xsl:for-each>
				<xsl:variable name="var61_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:ul)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var61_test_resultof_node_name_equal_qname">
					<com:UL>
						<xsl:sequence select="()"/>
					</com:UL>
				</xsl:for-each>
				<xsl:variable name="var62_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:ol)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var62_test_resultof_node_name_equal_qname">
					<com:OL>
						<xsl:sequence select="()"/>
					</com:OL>
				</xsl:for-each>
				<xsl:variable name="var63_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:pre)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var63_test_resultof_node_name_equal_qname">
					<com:Pre>
						<xsl:sequence select="()"/>
					</com:Pre>
				</xsl:for-each>
				<xsl:variable name="var64_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:dl)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var64_test_resultof_node_name_equal_qname">
					<com:DL>
						<xsl:sequence select="()"/>
					</com:DL>
				</xsl:for-each>
				<xsl:variable name="var65_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:maths)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var65_test_resultof_node_name_equal_qname">
					<xsl:variable name="var66_resultof_ST__mathsToST__Math" as="node()?">
						<xsl:call-template name="WIPO:ST36mathsToST96Math">
							<xsl:with-param name="maths" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:chemistry)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var67_test_resultof_node_name_equal_qname">
					<com:ChemicalFormulae>
						<xsl:sequence select="()"/>
					</com:ChemicalFormulae>
				</xsl:for-each>
				<xsl:variable name="var68_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:patcit)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var68_test_resultof_node_name_equal_qname">
					<xsl:variable name="var69_resultof_ST__patcitToST__PatentCitation" as="node()?">
						<xsl:call-template name="WIPO:ST36patcitToST96PatentCitation">
							<xsl:with-param name="patcit" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:nplcit)">
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
						<xsl:for-each select="*:text">
							<com:NPLCitationText>
								<xsl:sequence select="fn:string(.)"/>
							</com:NPLCitationText>
						</xsl:for-each>
						<xsl:for-each select="*:book">
							<com:CitedBook>
								<xsl:sequence select="()"/>
							</com:CitedBook>
						</xsl:for-each>
						<xsl:for-each select="*:article">
							<com:CitedJournalArticle>
								<xsl:for-each select="*:author">
									<com:AuthorName>
										<xsl:sequence select="()"/>
									</com:AuthorName>
								</xsl:for-each>
								<xsl:for-each select="*:subname">
									<com:Subordinate>
										<xsl:for-each select="@subname-type">
											<xsl:attribute name="com:subordinateCategory" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:for-each select="*:name">
											<com:Name>
												<xsl:sequence select="()"/>
											</com:Name>
										</xsl:for-each>
									</com:Subordinate>
								</xsl:for-each>
								<xsl:for-each select="*:cpyrt">
									<com:NPLCopyrightText>
										<xsl:sequence select="fn:string(.)"/>
									</com:NPLCopyrightText>
								</xsl:for-each>
								<xsl:for-each select="*:class">
									<com:NPLClass>
										<xsl:for-each select="@class-type">
											<xsl:attribute name="com:classificationSystem" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</com:NPLClass>
								</xsl:for-each>
								<xsl:for-each select="*:atl">
									<com:SerialALTTitleText>
										<xsl:sequence select="fn:string(.)"/>
									</com:SerialALTTitleText>
								</xsl:for-each>
							</com:CitedJournalArticle>
						</xsl:for-each>
						<xsl:for-each select="*:othercit">
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
					<xsl:if test="fn:boolean(self::*:figref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var71_test_resultof_node_name_equal_qname">
					<com:FigureReference>
						<xsl:sequence select="()"/>
					</com:FigureReference>
				</xsl:for-each>
				<xsl:variable name="var72_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:crossref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var72_test_resultof_node_name_equal_qname">
					<com:CrossReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var73_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var73_test_resultof_node_name_equal_qname">
								<xsl:variable name="var74_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var75_test_resultof_node_name_equal_qname">
								<xsl:variable name="var76_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var77_test_resultof_node_name_equal_qname">
								<xsl:variable name="var78_resultof_ST__oToST__O" as="node()?">
									<xsl:call-template name="WIPO:ST36oToST96O">
										<xsl:with-param name="o" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var79_test_resultof_node_name_equal_qname">
								<xsl:variable name="var80_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sub)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var81_test_resultof_node_name_equal_qname">
								<xsl:variable name="var82_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sup)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var83_test_resultof_node_name_equal_qname">
								<xsl:variable name="var84_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:smallcaps)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var85_test_resultof_node_name_equal_qname">
								<xsl:variable name="var86_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:bio-deposit)">
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
					<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:sup)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sup2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub2)">
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
											<xsl:if test="fn:boolean(self::*:b)">
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
											<xsl:if test="fn:boolean(self::*:i)">
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
											<xsl:if test="fn:boolean(self::*:o)">
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
											<xsl:if test="fn:boolean(self::*:u)">
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
					<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sup2)">
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
								<xsl:if test="fn:boolean(self::*:sub2)">
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
					<xsl:if test="fn:boolean(self::*:img)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
					<xsl:variable name="var46_resultof_ST__imgToST__Image" as="node()?">
						<xsl:call-template name="WIPO:ST36imgToST96Image">
							<xsl:with-param name="img" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
					<xsl:if test="fn:boolean(self::*:br)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var52_test_resultof_node_name_equal_qname">
					<com:Br>
						<xsl:sequence select="()"/>
					</com:Br>
				</xsl:for-each>
				<xsl:variable name="var53_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:ul)">
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
						<xsl:for-each select="*:li">
							<xsl:variable name="var54_resultof_ST__liToST__LI" as="node()?">
								<xsl:call-template name="WIPO:ST36liToST96LI">
									<xsl:with-param name="li" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:ol)">
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
						<xsl:for-each select="*:li">
							<xsl:variable name="var56_resultof_ST__liToST__LI" as="node()?">
								<xsl:call-template name="WIPO:ST36liToST96LI">
									<xsl:with-param name="li" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:pre)">
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
					<xsl:if test="fn:boolean(self::*:dl)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var58_test_resultof_node_name_equal_qname">
					<com:DL>
						<xsl:for-each select="@id">
							<xsl:attribute name="com:id" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="*:dt">
							<xsl:variable name="var59_resultof_ST__dtToST__DT" as="node()?">
								<xsl:call-template name="WIPO:ST36dtToST96DT">
									<xsl:with-param name="dt" as="node()?">
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
						<xsl:for-each select="*:dd">
							<com:DD>
								<xsl:sequence select="fn:string(.)"/>
							</com:DD>
						</xsl:for-each>
					</com:DL>
				</xsl:for-each>
				<xsl:variable name="var60_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:maths)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var60_test_resultof_node_name_equal_qname">
					<xsl:variable name="var61_resultof_ST__mathsToST__Math" as="node()?">
						<xsl:call-template name="WIPO:ST36mathsToST96Math">
							<xsl:with-param name="maths" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:chemistry)">
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
						<xsl:for-each select="*:img">
							<xsl:variable name="var63_resultof_ST__imgToST__Image" as="node()?">
								<xsl:call-template name="WIPO:ST36imgToST96Image">
									<xsl:with-param name="img" as="node()?">
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
						<xsl:for-each select="*:chem">
							<com:InlineFormula>
								<xsl:sequence select="()"/>
							</com:InlineFormula>
						</xsl:for-each>
					</com:ChemicalFormulae>
				</xsl:for-each>
				<xsl:variable name="var64_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:patcit)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var64_test_resultof_node_name_equal_qname">
					<xsl:variable name="var65_resultof_ST__patcitToST__PatentCitation" as="node()?">
						<xsl:call-template name="WIPO:ST36patcitToST96PatentCitation">
							<xsl:with-param name="patcit" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:nplcit)">
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
						<xsl:for-each select="*:text">
							<com:NPLCitationText>
								<xsl:sequence select="fn:string(.)"/>
							</com:NPLCitationText>
						</xsl:for-each>
						<xsl:for-each select="*:book">
							<com:CitedBook>
								<xsl:sequence select="()"/>
							</com:CitedBook>
						</xsl:for-each>
						<xsl:for-each select="*:article">
							<com:CitedJournalArticle>
								<xsl:for-each select="*:author">
									<com:AuthorName>
										<xsl:sequence select="()"/>
									</com:AuthorName>
								</xsl:for-each>
								<xsl:for-each select="*:subname">
									<com:Subordinate>
										<xsl:for-each select="@subname-type">
											<xsl:attribute name="com:subordinateCategory" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:for-each select="*:name">
											<com:Name>
												<xsl:sequence select="()"/>
											</com:Name>
										</xsl:for-each>
									</com:Subordinate>
								</xsl:for-each>
								<xsl:for-each select="*:cpyrt">
									<com:NPLCopyrightText>
										<xsl:sequence select="fn:string(.)"/>
									</com:NPLCopyrightText>
								</xsl:for-each>
								<xsl:for-each select="*:class">
									<com:NPLClass>
										<xsl:for-each select="@class-type">
											<xsl:attribute name="com:classificationSystem" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</com:NPLClass>
								</xsl:for-each>
								<xsl:for-each select="*:atl">
									<com:SerialALTTitleText>
										<xsl:sequence select="fn:string(.)"/>
									</com:SerialALTTitleText>
								</xsl:for-each>
							</com:CitedJournalArticle>
						</xsl:for-each>
						<xsl:for-each select="*:othercit">
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
					<xsl:if test="fn:boolean(self::*:figref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var67_test_resultof_node_name_equal_qname">
					<com:FigureReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="@num">
							<xsl:attribute name="com:referencedFigureNumber" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var68_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var68_test_resultof_node_name_equal_qname">
								<xsl:variable name="var69_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var70_test_resultof_node_name_equal_qname">
								<xsl:variable name="var71_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var72_test_resultof_node_name_equal_qname">
								<xsl:variable name="var73_resultof_ST__oToST__O" as="node()?">
									<xsl:call-template name="WIPO:ST36oToST96O">
										<xsl:with-param name="o" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var74_test_resultof_node_name_equal_qname">
								<xsl:variable name="var75_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sub)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var76_test_resultof_node_name_equal_qname">
								<xsl:variable name="var77_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sup)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var78_test_resultof_node_name_equal_qname">
								<xsl:variable name="var79_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:smallcaps)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var80_test_resultof_node_name_equal_qname">
								<xsl:variable name="var81_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:crossref)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var82_test_resultof_node_name_equal_qname">
					<com:CrossReference>
						<xsl:for-each select="@idref">
							<xsl:attribute name="com:idrefs" select="fn:string-join(fn:tokenize(fn:string(.), ' '), ' ')"/>
						</xsl:for-each>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var83_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var83_test_resultof_node_name_equal_qname">
								<xsl:variable name="var84_resultof_ST__bToST__B" as="node()*">
									<xsl:call-template name="WIPO:ST36bToST96B">
										<xsl:with-param name="b" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var85_test_resultof_node_name_equal_qname">
								<xsl:variable name="var86_resultof_ST__iToST__I" as="node()?">
									<xsl:call-template name="WIPO:ST36iToST96I">
										<xsl:with-param name="i" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var87_test_resultof_node_name_equal_qname">
								<xsl:variable name="var88_resultof_ST__oToST__O" as="node()?">
									<xsl:call-template name="WIPO:ST36oToST96O">
										<xsl:with-param name="o" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var89_test_resultof_node_name_equal_qname">
								<xsl:variable name="var90_resultof_ST__uToST__U" as="node()?">
									<xsl:call-template name="WIPO:ST36uToST96U">
										<xsl:with-param name="u" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sub)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var91_test_resultof_node_name_equal_qname">
								<xsl:variable name="var92_resultof_ST__subToST__Sub" as="node()?">
									<xsl:call-template name="WIPO:ST36subToST96Sub">
										<xsl:with-param name="sub" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:sup)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var93_test_resultof_node_name_equal_qname">
								<xsl:variable name="var94_resultof_ST__supToST__Sup" as="node()?">
									<xsl:call-template name="WIPO:ST36supToST96Sup">
										<xsl:with-param name="sup" as="node()?">
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
								<xsl:if test="fn:boolean(self::*:smallcaps)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var95_test_resultof_node_name_equal_qname">
								<xsl:variable name="var96_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
									<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
										<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:bio-deposit)">
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
						<xsl:for-each select="*:depositary">
							<xsl:variable name="var98_resultof_ST__depositaryToST__BioDepositDepositary" as="node()?">
								<xsl:call-template name="WIPO:ST36depositaryToST96BioDepositDepositary">
									<xsl:with-param name="depositary" as="node()?">
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
						<xsl:for-each select="*:bio-accno">
							<com:BiologicalAccessionNumber>
								<xsl:sequence select="fn:string(.)"/>
							</com:BiologicalAccessionNumber>
						</xsl:for-each>
						<xsl:for-each select="*:date">
							<com:BioDepositDate>
								<xsl:sequence select="fn:string(.)"/>
							</com:BioDepositDate>
						</xsl:for-each>
						<xsl:for-each select="*:term">
							<com:BioDepositTermText>
								<xsl:sequence select="fn:string(.)"/>
							</com:BioDepositTermText>
						</xsl:for-each>
						<xsl:for-each select="*:dtext">
							<com:BioDepositText>
								<xsl:sequence select="fn:string(.)"/>
							</com:BioDepositText>
						</xsl:for-each>
					</com:BioDeposit>
				</xsl:for-each>
				<xsl:variable name="var99_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:tables)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var99_test_resultof_node_name_equal_qname">
					<xsl:variable name="var100_resultof_ST__tablesToST__Table" as="node()?">
						<xsl:call-template name="WIPO:ST36tablesToST96Table">
							<xsl:with-param name="tables" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup2)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__sup_ToST__Sup_" as="node()?">
						<xsl:call-template name="WIPO:ST36sup2ToST96Sup2">
							<xsl:with-param name="sup2" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub2)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
					<xsl:variable name="var12_resultof_ST__sub_ToST__Sub_" as="node()?">
						<xsl:call-template name="WIPO:ST36sub2ToST96Sub2">
							<xsl:with-param name="sub2" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup2)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__sup_ToST__Sup_" as="node()?">
						<xsl:call-template name="WIPO:ST36sup2ToST96Sup2">
							<xsl:with-param name="sup2" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub2)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var11_test_resultof_node_name_equal_qname">
					<xsl:variable name="var12_resultof_ST__sub_ToST__Sub_" as="node()?">
						<xsl:call-template name="WIPO:ST36sub2ToST96Sub2">
							<xsl:with-param name="sub2" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
						<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
							<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__subToST__Sub" as="node()?">
						<xsl:call-template name="WIPO:ST36subToST96Sub">
							<xsl:with-param name="sub" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__supToST__Sup" as="node()?">
						<xsl:call-template name="WIPO:ST36supToST96Sup">
							<xsl:with-param name="sup" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:u)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__uToST__U" as="node()?">
						<xsl:call-template name="WIPO:ST36uToST96U">
							<xsl:with-param name="u" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:i)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__iToST__I" as="node()?">
						<xsl:call-template name="WIPO:ST36iToST96I">
							<xsl:with-param name="i" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
						<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
							<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__subToST__Sub" as="node()?">
						<xsl:call-template name="WIPO:ST36subToST96Sub">
							<xsl:with-param name="sub" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__supToST__Sup" as="node()?">
						<xsl:call-template name="WIPO:ST36supToST96Sup">
							<xsl:with-param name="sup" as="node()?">
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
				<xsl:variable name="var45_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:sub)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:if test="fn:boolean(self::text())">
					<xsl:sequence select="fn:string(.)"/>
				</xsl:if>
				<xsl:variable name="var1_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:o)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
					<xsl:if test="fn:boolean(self::*:u)">
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
								<xsl:if test="fn:boolean(self::*:b)">
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
								<xsl:if test="fn:boolean(self::*:i)">
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
								<xsl:if test="fn:boolean(self::*:sub)">
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
								<xsl:if test="fn:boolean(self::*:sup)">
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
				<xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
					<com:Sub>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var17_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var17_test_resultof_node_name_equal_qname">
								<com:B>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:B>
							</xsl:for-each>
							<xsl:variable name="var18_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var18_test_resultof_node_name_equal_qname">
								<com:I>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:I>
							</xsl:for-each>
							<xsl:variable name="var19_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var19_test_resultof_node_name_equal_qname">
								<com:O>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:O>
							</xsl:for-each>
							<xsl:variable name="var20_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var20_test_resultof_node_name_equal_qname">
								<com:U>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:U>
							</xsl:for-each>
							<xsl:variable name="var21_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:sup2)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var21_test_resultof_node_name_equal_qname">
								<com:Sup2>
									<xsl:for-each select="node()">
										<xsl:if test="fn:boolean(self::text())">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:if>
										<xsl:variable name="var22_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:b)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var22_test_resultof_node_name_equal_qname">
											<com:B>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:B>
										</xsl:for-each>
										<xsl:variable name="var23_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:i)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var23_test_resultof_node_name_equal_qname">
											<com:I>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:I>
										</xsl:for-each>
										<xsl:variable name="var24_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:o)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var24_test_resultof_node_name_equal_qname">
											<com:O>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:O>
										</xsl:for-each>
										<xsl:variable name="var25_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:u)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var25_test_resultof_node_name_equal_qname">
											<com:U>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:U>
										</xsl:for-each>
									</xsl:for-each>
								</com:Sup2>
							</xsl:for-each>
							<xsl:variable name="var26_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:sub2)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var26_test_resultof_node_name_equal_qname">
								<com:Sub2>
									<xsl:for-each select="node()">
										<xsl:if test="fn:boolean(self::text())">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:if>
										<xsl:variable name="var27_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:b)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var27_test_resultof_node_name_equal_qname">
											<com:B>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:B>
										</xsl:for-each>
										<xsl:variable name="var28_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:i)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var28_test_resultof_node_name_equal_qname">
											<com:I>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:I>
										</xsl:for-each>
										<xsl:variable name="var29_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:o)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var29_test_resultof_node_name_equal_qname">
											<com:O>
												<xsl:for-each select="(./node())[fn:boolean(self::text())]">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</com:O>
										</xsl:for-each>
										<xsl:variable name="var30_test_resultof_node_name_equal_qname" as="node()?">
											<xsl:if test="fn:boolean(self::*:u)">
												<xsl:sequence select="."/>
											</xsl:if>
										</xsl:variable>
										<xsl:for-each select="$var30_test_resultof_node_name_equal_qname">
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
				<xsl:for-each select="$var45_test_resultof_node_name_equal_qname">
					<xsl:variable name="var39_sup" as="node()*" select="$b/*:sup"/>
					<com:Sup>
						<xsl:for-each select="(./node())[fn:boolean(self::text())]">
							<xsl:sequence select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:b">
							<com:B>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</com:B>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:i">
							<com:I>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</com:I>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:o">
							<com:O>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</com:O>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:u">
							<com:U>
								<xsl:for-each select="(./node())[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</com:U>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:sup2">
							<com:Sup2>
								<xsl:for-each select="node()">
									<xsl:if test="fn:boolean(self::text())">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:if>
									<xsl:variable name="var31_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:b)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var31_test_resultof_node_name_equal_qname">
										<com:B>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:B>
									</xsl:for-each>
									<xsl:variable name="var32_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:i)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var32_test_resultof_node_name_equal_qname">
										<com:I>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:I>
									</xsl:for-each>
									<xsl:variable name="var33_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:o)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var33_test_resultof_node_name_equal_qname">
										<com:O>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:O>
									</xsl:for-each>
									<xsl:variable name="var34_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:u)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var34_test_resultof_node_name_equal_qname">
										<com:U>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:U>
									</xsl:for-each>
								</xsl:for-each>
							</com:Sup2>
						</xsl:for-each>
						<xsl:for-each select="$var39_sup/*:sub2">
							<com:Sub2>
								<xsl:for-each select="node()">
									<xsl:if test="fn:boolean(self::text())">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:if>
									<xsl:variable name="var35_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:b)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var35_test_resultof_node_name_equal_qname">
										<com:B>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:B>
									</xsl:for-each>
									<xsl:variable name="var36_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:i)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var36_test_resultof_node_name_equal_qname">
										<com:I>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:I>
									</xsl:for-each>
									<xsl:variable name="var37_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:o)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var37_test_resultof_node_name_equal_qname">
										<com:O>
											<xsl:for-each select="(./node())[fn:boolean(self::text())]">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</com:O>
									</xsl:for-each>
									<xsl:variable name="var38_test_resultof_node_name_equal_qname" as="node()?">
										<xsl:if test="fn:boolean(self::*:u)">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:variable>
									<xsl:for-each select="$var38_test_resultof_node_name_equal_qname">
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
				<xsl:variable name="var40_test_resultof_node_name_equal_qname" as="node()?">
					<xsl:if test="fn:boolean(self::*:smallcaps)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var40_test_resultof_node_name_equal_qname">
					<com:SmallCapital>
						<xsl:for-each select="node()">
							<xsl:if test="fn:boolean(self::text())">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:if>
							<xsl:variable name="var41_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:b)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var41_test_resultof_node_name_equal_qname">
								<com:B>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:B>
							</xsl:for-each>
							<xsl:variable name="var42_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:i)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var42_test_resultof_node_name_equal_qname">
								<com:I>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:I>
							</xsl:for-each>
							<xsl:variable name="var43_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:o)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var43_test_resultof_node_name_equal_qname">
								<com:O>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)"/>
									</xsl:for-each>
								</com:O>
							</xsl:for-each>
							<xsl:variable name="var44_test_resultof_node_name_equal_qname" as="node()?">
								<xsl:if test="fn:boolean(self::*:u)">
									<xsl:sequence select="."/>
								</xsl:if>
							</xsl:variable>
							<xsl:for-each select="$var44_test_resultof_node_name_equal_qname">
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
					<xsl:if test="fn:boolean(self::*:b)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var1_test_resultof_node_name_equal_qname">
					<xsl:variable name="var2_resultof_ST__bToST__B" as="node()*">
						<xsl:call-template name="WIPO:ST36bToST96B">
							<xsl:with-param name="b" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:o)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var3_test_resultof_node_name_equal_qname">
					<xsl:variable name="var4_resultof_ST__oToST__O" as="node()?">
						<xsl:call-template name="WIPO:ST36oToST96O">
							<xsl:with-param name="o" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sub)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var5_test_resultof_node_name_equal_qname">
					<xsl:variable name="var6_resultof_ST__subToST__Sub" as="node()?">
						<xsl:call-template name="WIPO:ST36subToST96Sub">
							<xsl:with-param name="sub" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:sup)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var7_test_resultof_node_name_equal_qname">
					<xsl:variable name="var8_resultof_ST__supToST__Sup" as="node()?">
						<xsl:call-template name="WIPO:ST36supToST96Sup">
							<xsl:with-param name="sup" as="node()?">
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
					<xsl:if test="fn:boolean(self::*:smallcaps)">
						<xsl:sequence select="."/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="$var9_test_resultof_node_name_equal_qname">
					<xsl:variable name="var10_resultof_ST__smallcapsToST__SmallCapitals" as="node()?">
						<xsl:call-template name="WIPO:ST36smallcapsToST96SmallCapitals">
							<xsl:with-param name="smallcaps" as="node()?">
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
					<xsl:for-each select="$i/*:u">
						<xsl:variable name="var11_resultof_ST__uToST__U" as="node()?">
							<xsl:call-template name="WIPO:ST36uToST96U">
								<xsl:with-param name="u" as="node()?">
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
	<xsl:template name="vmf:vmf_application_body1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='landscape'">
				<xsl:copy-of select="'Landscape'"/>
			</xsl:when>
			<xsl:when test="$input='portrait'">
				<xsl:copy-of select="'Portrait'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='jpg'">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input='tif'">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
			<xsl:when test="$input='pdf'">
				<xsl:copy-of select="'GIF'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='bw'">
				<xsl:copy-of select="'Black and white'"/>
			</xsl:when>
			<xsl:when test="$input='color'">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='drawing'">
				<xsl:copy-of select="'Drawing'"/>
			</xsl:when>
			<xsl:when test="$input='photograph'">
				<xsl:copy-of select="'Photograph'"/>
			</xsl:when>
			<xsl:when test="$input='character'">
				<xsl:copy-of select="'Character'"/>
			</xsl:when>
			<xsl:when test="$input='dna'">
				<xsl:copy-of select="'DNA'"/>
			</xsl:when>
			<xsl:when test="$input='chem'">
				<xsl:copy-of select="'Chemistry'"/>
			</xsl:when>
			<xsl:when test="$input='math'">
				<xsl:copy-of select="'Math'"/>
			</xsl:when>
			<xsl:when test="$input='table'">
				<xsl:copy-of select="'Table'"/>
			</xsl:when>
			<xsl:when test="$input='program-listing'">
				<xsl:copy-of select="'Program listing'"/>
			</xsl:when>
			<xsl:when test="$input='flowchart'">
				<xsl:copy-of select="'Flowchart'"/>
			</xsl:when>
			<xsl:when test="$input='graph'">
				<xsl:copy-of select="'Graph'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='portrait'">
				<xsl:copy-of select="'Portrait'"/>
			</xsl:when>
			<xsl:when test="$input='landscape'">
				<xsl:copy-of select="'Landscape'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='yes'">
				<xsl:copy-of select="'Inline'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_application_body7_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='jpg'">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input='tif'">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:variable name="var382_application_body" as="node()?" select="//patent-document"/>
		<xsl:variable name="var381_doc_page_of_application_body" as="node()*" select="$var382_application_body/doc-page"/>
		<pat:PatentPublication xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0" xmlns:mathml="http://www.w3.org/1998/Math/MathML3" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/ST96/Patent ../../Schemas/ST96Schema/ST96XMLSchema_Current_Flattened/ApplicationBody_V6_0.xsd'"/>
			<xsl:for-each select="$var382_application_body/@id">
				<xsl:attribute name="com:id" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var382_application_body/@file-reference-id">
				<xsl:attribute name="com:fileReferenceIdentifier" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var382_application_body">
				<xsl:attribute name="com:languageCode" select="fn:lower-case(fn:string(@lang))"/>
			</xsl:for-each>
			<xsl:for-each select="$var382_application_body">
				<xsl:attribute name="com:receivingOffice" select="fn:upper-case(fn:string(@country))"/>
			</xsl:for-each>
			<xsl:for-each select="$var382_application_body/@file">
				<xsl:attribute name="com:documentFileName" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:for-each select="$var382_application_body/@status">
				<xsl:attribute name="pat:applicationBodyStatus" select="fn:string(.)"/>
			</xsl:for-each>
			<xsl:attribute name="com:st96Version" select="'V6_0'"/>
			<xsl:variable name="var64_bibliographic_data" as="node()?" select="//bibliographic-data"/>
			<pat:BibliographicData>
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
					<xsl:variable name="var63_cur" as="node()?" select="."/>
					<xsl:variable name="var2_publication_reference" as="node()?" select="//publication-reference"/>
					<xsl:variable name="var1_document_id" as="node()?" select="$var2_publication_reference/document-id"/>
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
					<xsl:variable name="var6_application_reference" as="node()?" select="application-reference"/>
					<xsl:variable name="var5_document_id" as="node()?" select="$var6_application_reference/document-id"/>
					<xsl:variable name="var4_country_as_string" select="fn:string($var5_document_id/country)"/>
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
								<xsl:call-template name="vmf:vmf_bibiliographic_1_inputtoresult">
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
					<xsl:for-each select="//priority-claims">
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
										<xsl:call-template name="vmf:vmf_bibiliographic_2_inputtoresult">
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
						<xsl:for-each select="//classification-ipc">
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
						<xsl:for-each select="//classifications-ipcr">
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
						<xsl:for-each select="//classification-national">
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
						<xsl:for-each select="//classification-locarno">
							<xsl:variable name="var8_edition" as="node()?" select="edition"/>
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
					<xsl:for-each select="//references-cited">
						<pat:ReferenceCitationBag>
							<xsl:for-each select="citation">
								<pat:ReferenceCitation>
									<xsl:for-each select="@id">
										<xsl:attribute name="com:id" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="(./category/node())[fn:boolean(self::text())]">
										<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
											<xsl:call-template name="vmf:vmf_bibiliographic_3_inputtoresult">
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
					<xsl:for-each select="//number-of-claims">
						<pat:ClaimTotalQuantity>
							<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
						</pat:ClaimTotalQuantity>
					</xsl:for-each>
					<xsl:for-each select="//field-of-search">
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
					<xsl:for-each select="//figures">
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
					<xsl:for-each select="//related-documents">
						<pat:RelatedDocumentBag>
							<xsl:for-each select="addition">
								<xsl:variable name="var19_relation" as="node()?" select="relation"/>
								<pat:Addition>
									<xsl:variable name="var15_parent_doc" as="node()?" select="$var19_relation/parent-doc"/>
									<xsl:variable name="var14_parent_grant_document" as="node()?" select="$var15_parent_doc/parent-grant-document"/>
									<xsl:variable name="var13_document_id" as="node()?" select="$var15_parent_doc/document-id"/>
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
											<xsl:variable name="var11_document_id" as="node()?" select="document-id"/>
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
									<xsl:variable name="var18_child_doc" as="node()?" select="$var19_relation/child-doc"/>
									<xsl:variable name="var17_document_id" as="node()?" select="$var18_child_doc/document-id"/>
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
								<xsl:variable name="var22_relation" as="node()?" select="relation"/>
								<pat:Continuation>
									<xsl:variable name="var20_document_id" as="node()?" select="$var22_relation/parent-doc/document-id"/>
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
									<xsl:variable name="var21_document_id" as="node()?" select="$var22_relation/child-doc/document-id"/>
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
								<xsl:variable name="var27_relation" as="node()?" select="relation"/>
								<pat:PartialContinuation>
									<xsl:variable name="var25_parent_doc" as="node()?" select="$var27_relation/parent-doc"/>
									<pat:ParentDocument>
										<pat:PatentDocumentIdentification>
											<xsl:variable name="var23_document_id" as="node()?" select="$var25_parent_doc/document-id"/>
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
												<xsl:variable name="var24_document_id" as="node()?" select="document-id"/>
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
									<xsl:variable name="var26_document_id" as="node()?" select="$var27_relation/child-doc/document-id"/>
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
								<xsl:variable name="var28_document_id" as="node()?" select="document-id"/>
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
					<xsl:variable name="var31_parties" as="node()?" select="//parties"/>
					<xsl:variable name="var30_cur" as="node()?" select="."/>
					<xsl:for-each select="$var31_parties">
						<xsl:variable name="var29_resultof_ST__partiesToST__PartyBag" as="node()?">
							<xsl:call-template name="WIPO:ST36partiesToST96PartyBag">
								<xsl:with-param name="parties" as="node()?">
									<parties>
										<xsl:sequence select="($var31_parties/@node(), $var31_parties/node())"/>
									</parties>
								</xsl:with-param>
								<xsl:with-param name="assignees" as="node()?">
									<assignees>
										<xsl:sequence select="($var30_cur/@node(), $var30_cur/node())"/>
									</assignees>
								</xsl:with-param>
								<xsl:with-param name="examiners" as="node()?">
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
					<xsl:for-each select="//pct-or-regional-filing-data">
						<xsl:variable name="var33_document_id" as="node()?" select="document-id"/>
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
					<xsl:for-each select="//pct-or-regional-publishing-data">
						<pat:InternationalPublishingData>
							<xsl:variable name="var34_document_id" as="node()?" select="document-id"/>
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
					<xsl:for-each select="//patent-family">
						<pat:PatentFamily>
							<xsl:for-each select="@id">
								<xsl:attribute name="com:id" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:variable name="var37_priority_application" as="node()?" select="priority-application"/>
							<xsl:variable name="var36_document_id" as="node()?" select="$var37_priority_application/document-id"/>
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
								<xsl:variable name="var39_document_id" as="node()?" select="document-id"/>
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
					<xsl:for-each select="//bio-deposit">
						<xsl:variable name="var40_resultof_ST__bio_depositToST__BioDeposit_Bib" as="node()?">
							<xsl:call-template name="WIPO:ST36bio-depositToST96BioDeposit-Bib">
								<xsl:with-param name="biodeposit" as="node()?">
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
					<xsl:for-each select="//plain-language-designation">
						<pat:PlainLanguageDesignationText>
							<xsl:for-each select="@lang">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</pat:PlainLanguageDesignationText>
					</xsl:for-each>
					<xsl:for-each select="//language-of-filing">
						<com:FilingLanguageCode>
							<xsl:sequence select="fn:string(.)"/>
						</com:FilingLanguageCode>
					</xsl:for-each>
					<xsl:for-each select="//language-of-publication">
						<com:PublicationLanguageCode>
							<xsl:sequence select="fn:string(.)"/>
						</com:PublicationLanguageCode>
					</xsl:for-each>
					<xsl:for-each select="//designation-of-states">
						<xsl:variable name="var47_designation_pct" as="node()?" select="designation-pct"/>
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
										<xsl:variable name="var44_cur" as="node()?" select="."/>
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
														<xsl:call-template name="vmf:vmf_bibiliographic_4_inputtoresult">
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
					<xsl:for-each select="//date-of-earliest-priority">
						<pat:EarliestPriorityApplication>
							<pat:FilingDate>
								<xsl:sequence select="()"/>
							</pat:FilingDate>
						</pat:EarliestPriorityApplication>
					</xsl:for-each>
					<xsl:for-each select="//date-complete-specification-filed">
						<pat:CompleteSpecificationFilingDate>
							<xsl:sequence select="()"/>
						</pat:CompleteSpecificationFilingDate>
					</xsl:for-each>
					<xsl:for-each select="//dates-of-public-availability">
						<pat:PublicAvailabilityDataBag>
							<xsl:for-each select="gazette-reference">
								<xsl:variable name="var48_gazette_num" as="node()?" select="gazette-num"/>
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
								<xsl:variable name="var50_document_id" as="node()?" select="document-id"/>
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
								<xsl:variable name="var52_document_id" as="node()?" select="document-id"/>
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
									<xsl:variable name="var53_document_id" as="node()?" select="document-id"/>
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
									<xsl:variable name="var54_document_id" as="node()?" select="document-id"/>
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
								<xsl:variable name="var56_document_id" as="node()?" select="document-id"/>
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
								<xsl:variable name="var57_document_id" as="node()?" select="document-id"/>
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
								<xsl:variable name="var58_document_id" as="node()?" select="document-id"/>
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
									<xsl:variable name="var59_document_id" as="node()?" select="document-id"/>
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
					<xsl:for-each select="//dates-rights-effective">
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
					<xsl:for-each select="//st50-republication">
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
							<xsl:variable name="var61_gazette_reference" as="node()?" select="correction-notice/gazette-reference"/>
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
					<xsl:for-each select="//date-exhibition-filed">
						<pat:ExhibitionFilingDate>
							<xsl:sequence select="()"/>
						</pat:ExhibitionFilingDate>
					</xsl:for-each>
					<xsl:for-each select="//date-rights-reestablished">
						<pat:RightsReestablishedDate>
							<xsl:sequence select="()"/>
						</pat:RightsReestablishedDate>
					</xsl:for-each>
					<xsl:for-each select="//date-application-withdrawn-by-applicant">
						<pat:ApplicationWithdrawnDate>
							<xsl:sequence select="()"/>
						</pat:ApplicationWithdrawnDate>
					</xsl:for-each>
					<xsl:for-each select="//date-application-deemed-withdrawn">
						<pat:ApplicationDeemedWithdrawnDate>
							<xsl:sequence select="()"/>
						</pat:ApplicationDeemedWithdrawnDate>
					</xsl:for-each>
					<xsl:for-each select="//date-of-revocation">
						<pat:PatentRevocationDate>
							<xsl:sequence select="()"/>
						</pat:PatentRevocationDate>
					</xsl:for-each>
					<xsl:for-each select="//date-pct-article-22-39-fulfilled">
						<pat:PCTNationalPhaseEntryDate>
							<xsl:sequence select="fn:string(date)"/>
						</pat:PCTNationalPhaseEntryDate>
					</xsl:for-each>
					<xsl:for-each select="//date-application-partially-withdrawn">
						<pat:ApplicationPartiallyWithdrawnDate>
							<xsl:sequence select="fn:string(date)"/>
						</pat:ApplicationPartiallyWithdrawnDate>
					</xsl:for-each>
					<xsl:for-each select="//opposition-data">
						<pat:OppositionData>
							<xsl:sequence select="()"/>
						</pat:OppositionData>
					</xsl:for-each>
				</xsl:for-each>
			</pat:BibliographicData>
			<xsl:for-each select="($var381_doc_page_of_application_body)[fn:not(fn:exists(@ocr))]">
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
							<xsl:call-template name="vmf:vmf_application_body1_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
							<xsl:attribute name="com:orientationCategory" select="."/>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
						<xsl:call-template name="vmf:vmf_application_body2_inputtoresult">
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
							<xsl:call-template name="vmf:vmf_application_body3_inputtoresult">
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
			<xsl:for-each select="($var381_doc_page_of_application_body)[fn:exists(@ocr)]">
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
            <xsl:for-each select="//description">
                <pat:Description>
                    <xsl:for-each select="@id">
                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                    </xsl:for-each>
                    <xsl:for-each select="@lang">
                        <xsl:attribute name="com:languageCode" select="fn:string(.)"/>
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
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:TechnicalField>
                    </xsl:for-each>
                    <xsl:for-each select=".//background-art">
                        <pat:BackgroundArt>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
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
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:TechnicalProblem>
                            </xsl:for-each>
                            <xsl:for-each select="tech-solution">
                                <pat:TechnicalSolution>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:TechnicalSolution>
                            </xsl:for-each>
                            <xsl:for-each select="advantageous-effects">
                                <pat:AdvantageousEffects>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:AdvantageousEffects>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
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
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:TechnicalProblem>
                            </xsl:for-each>
                            <xsl:for-each select="tech-solution">
                                <pat:TechnicalSolution>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:TechnicalSolution>
                            </xsl:for-each>
                            <xsl:for-each select="advantageous-effects">
                                <pat:AdvantageousEffects>
                                    <xsl:for-each select="@id">
                                        <xsl:attribute name="com:id" select="fn:string(.)"/>
                                    </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:AdvantageousEffects>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:InventionSummary>
                    </xsl:for-each>
                    <xsl:for-each select=".//description-of-drawings">
                        <pat:DrawingDescription>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:DrawingDescription>
                    </xsl:for-each>
                    <xsl:for-each select=".//description-of-embodiments|.//detailed-description">
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
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </pat:EmbodimentExample>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:EmbodimentDescription>
                    </xsl:for-each>
                    <xsl:for-each select=".//best-mode">
                        <pat:BestMode>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:BestMode>
                    </xsl:for-each>
                    <xsl:for-each select=".//mode-for-invention">
                        <pat:InventionMode>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:InventionMode>
                    </xsl:for-each>
                    <xsl:for-each select=".//industrial-applicability">
                        <pat:IndustrialApplicability>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:IndustrialApplicability>
                    </xsl:for-each>
                    <xsl:for-each select=".//reference-signs-list">
                        <pat:ReferenceSignBag>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:ReferenceSignBag>
                    </xsl:for-each>
                    <xsl:for-each select=".//reference-to-deposited-biological-material">
                        <pat:DepositedBiologicalMaterialReference>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:DepositedBiologicalMaterialReference>
                    </xsl:for-each>
                    <xsl:for-each select=".//sequence-list-text">
                        <pat:SequenceListText>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                        </pat:SequenceListText>
                    </xsl:for-each>
                    <xsl:for-each select=".//citation-list">
                        <com:CitationBag>
                            <xsl:for-each select="@id">
                                <xsl:attribute name="com:id" select="fn:string(.)"/>
                            </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="patent-literature">
                                <com:PatentCitationBag>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </com:PatentCitationBag>
                            </xsl:for-each>
                            <xsl:for-each select="non-patent-literature">
                                <com:NPLCitationBag>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                                </com:NPLCitationBag>
                            </xsl:for-each>
                        </com:CitationBag>
                    </xsl:for-each>
                            <xsl:for-each select="heading|p">
                            <xsl:if test="fn:boolean(self::heading)">
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
                            </xsl:if>
                            <xsl:if test="fn:boolean(self::p)">
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
                            </xsl:if>
                            </xsl:for-each>
                </pat:Description>
            </xsl:for-each>
			<xsl:for-each select="//claims">
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
									<xsl:call-template name="vmf:vmf_application_body1_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var365_resultof_vmf__inputtoresult">
									<xsl:attribute name="com:orientationCategory" select="."/>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:variable name="var366_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_application_body2_inputtoresult">
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
									<xsl:call-template name="vmf:vmf_application_body3_inputtoresult">
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
										<xsl:with-param name="claimtext" as="node()?">
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
			<xsl:for-each select="//abstract">
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
									<xsl:call-template name="vmf:vmf_application_body1_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var370_resultof_vmf__inputtoresult">
									<xsl:attribute name="com:orientationCategory" select="."/>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:variable name="var371_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_application_body2_inputtoresult">
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
									<xsl:call-template name="vmf:vmf_application_body3_inputtoresult">
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
								<xsl:with-param name="p" as="node()?">
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
			<xsl:for-each select="//drawings">
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
									<xsl:call-template name="vmf:vmf_application_body1_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var375_resultof_vmf__inputtoresult">
									<xsl:attribute name="com:orientationCategory" select="."/>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:variable name="var376_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf_application_body2_inputtoresult">
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
									<xsl:call-template name="vmf:vmf_application_body3_inputtoresult">
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
							<xsl:variable name="var379_img" as="node()?" select="img"/>
							<xsl:variable name="var378_resultof_ST__imgToST__Image" as="node()?">
								<xsl:call-template name="WIPO:ST36imgToST96Image">
									<xsl:with-param name="img" as="node()?">
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
