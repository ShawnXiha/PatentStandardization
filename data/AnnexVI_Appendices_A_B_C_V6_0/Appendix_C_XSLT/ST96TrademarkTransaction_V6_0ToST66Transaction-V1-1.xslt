<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark" exclude-result-prefixes="WIPO vmf xs fn com tmk">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="TrademarkTransaction_V6_03" select="'TrademarkTransaction_V6_0.xml'"/>
	<xsl:template name="WIPO:ST96ContactToST66AddressBook">
		<xsl:param name="Contact" select="()"/>
		<xsl:variable name="var10_PostalAddressBag" as="node()*" select="$Contact/com:PostalAddressBag"/>
		<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
			<xsl:for-each select="$Contact/@com:languageCode">
				<AddressLanguageCode>
					<xsl:sequence select="fn:string(.)"/>
				</AddressLanguageCode>
			</xsl:for-each>
			<FormattedNameAddress>
				<xsl:for-each select="$Contact/com:Name">
					<xsl:variable name="var3_OrganizationName" as="node()*" select="com:OrganizationName"/>
					<xsl:variable name="var4_PersonName" as="node()*" select="com:PersonName"/>
					<Name>
						<xsl:for-each select="com:EntityName">
							<FreeFormatName>
								<FreeFormatNameDetails>
									<xsl:for-each select="$var4_PersonName">
										<xsl:variable name="var1_cur" as="node()" select="."/>
										<xsl:for-each select="com:PersonFullName">
											<FreeFormatNameLine>
												<xsl:for-each select="$var1_cur/@com:languageCode">
													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:sequence select="fn:string(.)"/>
											</FreeFormatNameLine>
										</xsl:for-each>
									</xsl:for-each>
									<FreeFormatNameLine>
										<xsl:for-each select="@com:languageCode">
											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</FreeFormatNameLine>
								</FreeFormatNameDetails>
							</FreeFormatName>
						</xsl:for-each>
						<xsl:for-each select="$var4_PersonName">
							<xsl:variable name="var2_cur" as="node()" select="."/>
							<xsl:for-each select="com:PersonStructuredName">
								<FormattedName>
									<xsl:for-each select="com:NamePrefix">
										<NamePrefix>
											<xsl:sequence select="fn:string(.)"/>
										</NamePrefix>
									</xsl:for-each>
									<xsl:for-each select="com:FirstName">
										<FirstName>
											<xsl:sequence select="fn:string(.)"/>
										</FirstName>
									</xsl:for-each>
									<xsl:for-each select="com:MiddleName">
										<MiddleName>
											<xsl:sequence select="fn:string(.)"/>
										</MiddleName>
									</xsl:for-each>
									<xsl:for-each select="com:LastName">
										<LastName>
											<xsl:sequence select="fn:string(.)"/>
										</LastName>
									</xsl:for-each>
									<xsl:for-each select="com:SecondLastName">
										<SecondLastName>
											<xsl:sequence select="fn:string(.)"/>
										</SecondLastName>
									</xsl:for-each>
									<xsl:for-each select="com:NameSuffix">
										<NameSuffix>
											<xsl:sequence select="fn:string(.)"/>
										</NameSuffix>
									</xsl:for-each>
									<xsl:for-each select="($var3_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
										<OrganizationDepartment>
											<xsl:sequence select="fn:string(.)"/>
										</OrganizationDepartment>
									</xsl:for-each>
									<xsl:for-each select="$var2_cur/com:PreferredName">
										<NameSynonym>
											<xsl:sequence select="fn:string(.)"/>
										</NameSynonym>
									</xsl:for-each>
								</FormattedName>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="$var3_OrganizationName">
							<FormattedName>
								<xsl:for-each select="com:OrganizationStandardName">
									<OrganizationName>
										<xsl:sequence select="fn:string(.)"/>
									</OrganizationName>
								</xsl:for-each>
							</FormattedName>
						</xsl:for-each>
					</Name>
				</xsl:for-each>
				<Address>
					<xsl:for-each select="$var10_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
						<FreeFormatAddress>
							<FreeFormatAddressLine>
								<xsl:for-each select="@com:languageCode">
									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:for-each select="@com:sequenceNumber">
									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
								</xsl:for-each>
								<xsl:sequence select="fn:string(.)"/>
							</FreeFormatAddressLine>
						</FreeFormatAddress>
					</xsl:for-each>
					<xsl:for-each select="$var10_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
						<xsl:variable name="var7_AddressLineText" as="node()*" select="com:AddressLineText"/>
						<xsl:variable name="var8_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
						<xsl:variable name="var6_resultof_filter" as="node()*" select="($var8_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]"/>
						<FormattedAddress>
							<xsl:for-each select="($var7_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
								<xsl:variable name="var5_cur" as="node()" select="."/>
								<AddressLine>
									<xsl:for-each select="(./@com:sequenceNumber)[fn:not(fn:exists($var5_cur/@com:addressLineCategory))]">
										<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
									</xsl:for-each>
									<xsl:sequence select="fn:string(.)"/>
								</AddressLine>
							</xsl:for-each>
							<xsl:for-each select="com:PostalCode">
								<AddressMailCode>
									<xsl:sequence select="fn:string(.)"/>
								</AddressMailCode>
							</xsl:for-each>
							<xsl:for-each select="($var7_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office code')])]">
								<AddressPostOfficeBox>
									<xsl:sequence select="fn:string(.)"/>
								</AddressPostOfficeBox>
							</xsl:for-each>
							<xsl:for-each select="($var7_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
								<AddressRoom>
									<xsl:sequence select="fn:string(.)"/>
								</AddressRoom>
							</xsl:for-each>
							<xsl:for-each select="($var7_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
								<AddressFloor>
									<xsl:sequence select="fn:string(.)"/>
								</AddressFloor>
							</xsl:for-each>
							<xsl:for-each select="$var7_AddressLineText/@com:addressLineCategory">
								<AddressBuilding>
									<xsl:sequence select="xs:string((fn:string(.) = 'Building'))"/>
								</AddressBuilding>
							</xsl:for-each>
							<xsl:for-each select="($var7_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
								<AddressStreet>
									<xsl:sequence select="fn:string(.)"/>
								</AddressStreet>
							</xsl:for-each>
							<xsl:for-each select="com:CityName">
								<AddressCity>
									<xsl:sequence select="fn:string(.)"/>
								</AddressCity>
							</xsl:for-each>
							<xsl:for-each select="($var8_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
								<AddressCounty>
									<xsl:sequence select="fn:string(.)"/>
								</AddressCounty>
							</xsl:for-each>
							<xsl:for-each select="$var6_resultof_filter">
								<AddressState>
									<xsl:sequence select="fn:string(.)"/>
								</AddressState>
							</xsl:for-each>
							<xsl:for-each select="$var6_resultof_filter">
								<AddressPostcode>
									<xsl:sequence select="fn:string(.)"/>
								</AddressPostcode>
							</xsl:for-each>
							<xsl:for-each select="com:CountryCode">
								<FormattedAddressCountryCode>
									<xsl:sequence select="fn:string(.)"/>
								</FormattedAddressCountryCode>
							</xsl:for-each>
						</FormattedAddress>
					</xsl:for-each>
				</Address>
			</FormattedNameAddress>
			<ContactInformationDetails>
				<xsl:for-each select="$Contact/com:PhoneNumberBag/com:PhoneNumber">
					<Phone>
						<xsl:for-each select="@com:phoneNumberCategory">
							<xsl:variable name="var9_resultof_vmf___inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf53_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var9_resultof_vmf___inputtoresult">
								<xsl:attribute name="phoneKind" namespace="" select="."/>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</Phone>
				</xsl:for-each>
				<xsl:for-each select="$Contact/com:FaxNumberBag/com:FaxNumber">
					<Fax>
						<xsl:sequence select="fn:string(.)"/>
					</Fax>
				</xsl:for-each>
				<xsl:for-each select="$Contact/com:EmailAddressBag/com:EmailAddressText">
					<Email>
						<xsl:sequence select="fn:string(.)"/>
					</Email>
				</xsl:for-each>
				<xsl:for-each select="$Contact/com:WebAddressBag/com:WebAddressURI">
					<URL>
						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
					</URL>
				</xsl:for-each>
				<xsl:for-each select="$Contact/com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
					<OtherElectronicAddress>
						<xsl:sequence select="fn:string(.)"/>
					</OtherElectronicAddress>
				</xsl:for-each>
			</ContactInformationDetails>
		</AddressBookType>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=''">
				<xsl:copy-of select="'Trademark E-Filing'"/>
			</xsl:when>
			<xsl:when test="$input='Trade Mark B2B Filing'">
				<xsl:copy-of select="'Trademark B2B-Filing'"/>
			</xsl:when>
			<xsl:when test="$input='Trademark information'">
				<xsl:copy-of select="'Trade Mark Information'"/>
			</xsl:when>
			<xsl:when test="$input='Trademark identifier list'">
				<xsl:copy-of select="'Trade Mark Identifier List'"/>
			</xsl:when>
			<xsl:when test="$input='Trademark list'">
				<xsl:copy-of select="'Trade Mark List'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition eFiling'">
				<xsl:copy-of select="'Opposition E-Filing'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition information'">
				<xsl:copy-of select="'Opposition Information'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition identifier list'">
				<xsl:copy-of select="'Opposition Identifier List'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accelerated registration'">
				<xsl:copy-of select="'Accelerated Registration'"/>
			</xsl:when>
			<xsl:when test="$input='Normal'">
				<xsl:copy-of select="'Normal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Action before court of justice pending'">
				<xsl:copy-of select="'Action before Court of Justice pending'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal pending'">
				<xsl:copy-of select="'Appeal pending'"/>
			</xsl:when>
			<xsl:when test="$input='Application accepted'">
				<xsl:copy-of select="'Application accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Application deemed withdrawn'">
				<xsl:copy-of select="'Application deemed withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Application filed'">
				<xsl:copy-of select="'Application filed'"/>
			</xsl:when>
			<xsl:when test="$input='Application opposed'">
				<xsl:copy-of select="'Application opposed'"/>
			</xsl:when>
			<xsl:when test="$input='Application published'">
				<xsl:copy-of select="'Application published'"/>
			</xsl:when>
			<xsl:when test="$input='Application refused'">
				<xsl:copy-of select="'Application refused'"/>
			</xsl:when>
			<xsl:when test="$input='Application withdrawn'">
				<xsl:copy-of select="'Application withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Classification checked'">
				<xsl:copy-of select="'Classification checked'"/>
			</xsl:when>
			<xsl:when test="$input='Conversion requested'">
				<xsl:copy-of select="'Conversion requested'"/>
			</xsl:when>
			<xsl:when test="$input='Expired'">
				<xsl:copy-of select="'Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Filing date accorded'">
				<xsl:copy-of select="'Filing date accorded'"/>
			</xsl:when>
			<xsl:when test="$input='Interruption of proceedings'">
				<xsl:copy-of select="'Interruption of proceedings'"/>
			</xsl:when>
			<xsl:when test="$input='Invalidity proceeding pending'">
				<xsl:copy-of select="'Invalidity proceeding pending'"/>
			</xsl:when>
			<xsl:when test="$input='Registered'">
				<xsl:copy-of select="'Registered'"/>
			</xsl:when>
			<xsl:when test="$input='Registration cancellation pending'">
				<xsl:copy-of select="'Registration cancellation pending'"/>
			</xsl:when>
			<xsl:when test="$input='Registration cancelled'">
				<xsl:copy-of select="'Registration cancelled'"/>
			</xsl:when>
			<xsl:when test="$input='Registration opposed'">
				<xsl:copy-of select="'Registration opposed'"/>
			</xsl:when>
			<xsl:when test="$input='Registration surrendered'">
				<xsl:copy-of select="'Registration surrendered'"/>
			</xsl:when>
			<xsl:when test="$input='Revocation proceeding pending'">
				<xsl:copy-of select="'Revocation proceeding pending'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Agreement'">
				<xsl:copy-of select="'Agreement'"/>
			</xsl:when>
			<xsl:when test="$input='Protocol'">
				<xsl:copy-of select="'Protocol'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Transformation'">
				<xsl:copy-of select="'Transformation'"/>
			</xsl:when>
			<xsl:when test="$input='Renewal'">
				<xsl:copy-of select="'Renewal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Certificate'">
				<xsl:copy-of select="'Certificate'"/>
			</xsl:when>
			<xsl:when test="$input='Collective'">
				<xsl:copy-of select="'Collective'"/>
			</xsl:when>
			<xsl:when test="$input='Defensive'">
				<xsl:copy-of select="'Defensive'"/>
			</xsl:when>
			<xsl:when test="$input='Individual'">
				<xsl:copy-of select="'Individual'"/>
			</xsl:when>
			<xsl:when test="$input='Guarantee'">
				<xsl:copy-of select="'Guarantee'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf7_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Word'">
				<xsl:copy-of select="'Word'"/>
			</xsl:when>
			<xsl:when test="$input='Stylized characters'">
				<xsl:copy-of select="'Stylized characters'"/>
			</xsl:when>
			<xsl:when test="$input='Figurative'">
				<xsl:copy-of select="'Figurative'"/>
			</xsl:when>
			<xsl:when test="$input='Combined'">
				<xsl:copy-of select="'Combined'"/>
			</xsl:when>
			<xsl:when test="$input='Three dimensional'">
				<xsl:copy-of select="'3-D'"/>
			</xsl:when>
			<xsl:when test="$input='Colour'">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
			<xsl:when test="$input='Sound'">
				<xsl:copy-of select="'Sound'"/>
			</xsl:when>
			<xsl:when test="$input='Hologram'">
				<xsl:copy-of select="'Hologram'"/>
			</xsl:when>
			<xsl:when test="$input='Olfactory'">
				<xsl:copy-of select="'Olfactory'"/>
			</xsl:when>
			<xsl:when test="$input='Motion'">
				<xsl:copy-of select="'Motion'"/>
			</xsl:when>
			<xsl:when test="$input='Multimedia'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Position'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='tracer'">
				<xsl:copy-of select="'kennfaden'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
			<xsl:when test="$input='taste'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='touch'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf8_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Provisional'">
				<xsl:copy-of select="'Provisional'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf9_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Nice'">
				<xsl:copy-of select="'Nice'"/>
			</xsl:when>
			<xsl:when test="$input='Office'">
				<xsl:copy-of select="'Office'"/>
			</xsl:when>
			<xsl:when test="$input='EM_JP_US'">
				<xsl:copy-of select="'EM-JP-US'"/>
			</xsl:when>
			<xsl:when test="$input='EM_US'">
				<xsl:copy-of select="'EM-US'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf10_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Requested'">
				<xsl:copy-of select="'Requested'"/>
			</xsl:when>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
			<xsl:when test="$input='No longer in use'">
				<xsl:copy-of select="'No longer in use'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf11_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Arabic to Latin'">
				<xsl:copy-of select="'Arabic to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Armenian to Latin'">
				<xsl:copy-of select="'Armenian to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Chinese to Latin'">
				<xsl:copy-of select="'Chinese to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Cyrillic to Latin'">
				<xsl:copy-of select="'Cyrillic to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Georgian to Latin'">
				<xsl:copy-of select="'Georgian to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Greek to Latin'">
				<xsl:copy-of select="'Greek to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Hebrew to Latin'">
				<xsl:copy-of select="'Hebrew to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Indic to Latin'">
				<xsl:copy-of select="'Indic to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Japanese to Latin'">
				<xsl:copy-of select="'Japanese to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Korean to Latin'">
				<xsl:copy-of select="'Korean to Latin'"/>
			</xsl:when>
			<xsl:when test="$input='Thai to Latin'">
				<xsl:copy-of select="'Thai to Latin'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf12_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='To lowercase'">
				<xsl:copy-of select="'To Lowercase'"/>
			</xsl:when>
			<xsl:when test="$input='To uppercase'">
				<xsl:copy-of select="'To Uppercase'"/>
			</xsl:when>
			<xsl:when test="$input='To phonetic code'">
				<xsl:copy-of select="'To Phonetic Code'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf13_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='JPEG'">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input='TIFF'">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
			<xsl:when test="$input='PNG'">
				<xsl:copy-of select="'PNG'"/>
			</xsl:when>
			<xsl:when test="$input='GIF'">
				<xsl:copy-of select="'GIF'"/>
			</xsl:when>
			<xsl:when test="$input='SVG'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf14_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Black and white'">
				<xsl:copy-of select="'Black and White'"/>
			</xsl:when>
			<xsl:when test="$input='Greyscale'">
				<xsl:copy-of select="'Greyscale'"/>
			</xsl:when>
			<xsl:when test="$input='Colour'">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf15_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Cm'">
				<xsl:copy-of select="'Centimetre'"/>
			</xsl:when>
			<xsl:when test="$input='Px'">
				<xsl:copy-of select="'Pixel'"/>
			</xsl:when>
			<xsl:when test="$input='In'">
				<xsl:copy-of select="'Inch'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf16_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Greyscale'">
				<xsl:copy-of select="'Greyscale'"/>
			</xsl:when>
			<xsl:when test="$input='Office copy'">
				<xsl:copy-of select="'Office Copy'"/>
			</xsl:when>
			<xsl:when test="$input='Thumbnail'">
				<xsl:copy-of select="'Thumbnail'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf17_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='JPEG'">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input='TIFF'">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
			<xsl:when test="$input='PNG'">
				<xsl:copy-of select="'PNG'"/>
			</xsl:when>
			<xsl:when test="$input='GIF'">
				<xsl:copy-of select="'GIF'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf18_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Cm'">
				<xsl:copy-of select="'Centimetre'"/>
			</xsl:when>
			<xsl:when test="$input='Px'">
				<xsl:copy-of select="'Pixel'"/>
			</xsl:when>
			<xsl:when test="$input='In'">
				<xsl:copy-of select="'Inch'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf19_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='MP3'">
				<xsl:copy-of select="'MP3'"/>
			</xsl:when>
			<xsl:when test="$input='WAV'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='WMA'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf20_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Abandoned'">
				<xsl:copy-of select="'Abandoned'"/>
			</xsl:when>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Claimed'">
				<xsl:copy-of select="'Claimed'"/>
			</xsl:when>
			<xsl:when test="$input='Partially refused'">
				<xsl:copy-of select="'Partially Refused'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf21_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='JPEG'">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input='TIFF'">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
			<xsl:when test="$input='PNG'">
				<xsl:copy-of select="'PNG'"/>
			</xsl:when>
			<xsl:when test="$input='GIF'">
				<xsl:copy-of select="'GIF'"/>
			</xsl:when>
			<xsl:when test="$input='CDX'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='MOL'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='NB'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='MS Excel'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='SVG'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf22_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Paper'">
				<xsl:copy-of select="'Paper'"/>
			</xsl:when>
			<xsl:when test="$input='Fax'">
				<xsl:copy-of select="'Fax'"/>
			</xsl:when>
			<xsl:when test="$input='File'">
				<xsl:copy-of select="'File'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf23_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Claimed'">
				<xsl:copy-of select="'Claimed'"/>
			</xsl:when>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf24_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Madrid'">
				<xsl:copy-of select="'Madrid'"/>
			</xsl:when>
			<xsl:when test="$input='EU'">
				<xsl:copy-of select="'EU'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf25_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Abandoned'">
				<xsl:copy-of select="'Abandoned'"/>
			</xsl:when>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Claimed'">
				<xsl:copy-of select="'Claimed'"/>
			</xsl:when>
			<xsl:when test="$input='Partially refused'">
				<xsl:copy-of select="'Partially Refused'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf26_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Amendments to applications'">
				<xsl:copy-of select="'Amendments to applications'"/>
			</xsl:when>
			<xsl:when test="$input='Applications'">
				<xsl:copy-of select="'Applications'"/>
			</xsl:when>
			<xsl:when test="$input='Appointment of a new representative'">
				<xsl:copy-of select="'Appointment of a new representative'"/>
			</xsl:when>
			<xsl:when test="$input='Change of name and address of proprietor'">
				<xsl:copy-of select="'Change of name and address of proprietor'"/>
			</xsl:when>
			<xsl:when test="$input='Change of name and professional address of representative'">
				<xsl:copy-of select="'Change of name and professional address of representative'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of absolute errors on applications'">
				<xsl:copy-of select="'Correction of absolute errors on applications'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of absolute errors on registrations'">
				<xsl:copy-of select="'Correction of absolute errors on registrations'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of relative errors on applications'">
				<xsl:copy-of select="'Correction of relative errors on applications'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of relative errors on registrations'">
				<xsl:copy-of select="'Correction of relative errors on registrations'"/>
			</xsl:when>
			<xsl:when test="$input='Deletion of the representative'">
				<xsl:copy-of select="'Deletion of the representative'"/>
			</xsl:when>
			<xsl:when test="$input='Partial refusals'">
				<xsl:copy-of select="'Partial refusals'"/>
			</xsl:when>
			<xsl:when test="$input='Partial surrender of trade mark'">
				<xsl:copy-of select="'Partial surrender of trademarks'"/>
			</xsl:when>
			<xsl:when test="$input='Partial transfers'">
				<xsl:copy-of select="'Partial transfers'"/>
			</xsl:when>
			<xsl:when test="$input='Registrations with amendments'">
				<xsl:copy-of select="'Registrations with amendments'"/>
			</xsl:when>
			<xsl:when test="$input='Registrations with no amendments'">
				<xsl:copy-of select="'Registrations with no amendments'"/>
			</xsl:when>
			<xsl:when test="$input='Replacement of representative'">
				<xsl:copy-of select="'Replacement of representative'"/>
			</xsl:when>
			<xsl:when test="$input='Restrictions'">
				<xsl:copy-of select="'Restrictions'"/>
			</xsl:when>
			<xsl:when test="$input='Total refusals'">
				<xsl:copy-of select="'Total refusals'"/>
			</xsl:when>
			<xsl:when test="$input='Total surrender of trade mark'">
				<xsl:copy-of select="'Total surrender of trademarks'"/>
			</xsl:when>
			<xsl:when test="$input='Total transfers'">
				<xsl:copy-of select="'Total transfers'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawals'">
				<xsl:copy-of select="'Withdrawals'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf27_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Association'">
				<xsl:copy-of select="'Association'"/>
			</xsl:when>
			<xsl:when test="$input='Employee'">
				<xsl:copy-of select="'Employee'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Lawyer'">
				<xsl:copy-of select="'Lawyer'"/>
			</xsl:when>
			<xsl:when test="$input='Professional representative'">
				<xsl:copy-of select="'Professional Representative'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf28_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='General authorization'">
				<xsl:copy-of select="'General Authorization'"/>
			</xsl:when>
			<xsl:when test="$input='Specific authorization'">
				<xsl:copy-of select="'Specific Authorization'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf29_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Already on file'">
				<xsl:copy-of select="'Already on file'"/>
			</xsl:when>
			<xsl:when test="$input='Attached'">
				<xsl:copy-of select="'Attached'"/>
			</xsl:when>
			<xsl:when test="$input='To follow'">
				<xsl:copy-of select="'To follow'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf30_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Applicant'">
				<xsl:copy-of select="'Applicant'"/>
			</xsl:when>
			<xsl:when test="$input='Representative'">
				<xsl:copy-of select="'Representative'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf31_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Filing date'">
				<xsl:copy-of select="'Filing date'"/>
			</xsl:when>
			<xsl:when test="$input='Registration date'">
				<xsl:copy-of select="'Registration date'"/>
			</xsl:when>
			<xsl:when test="$input='Use date'">
				<xsl:copy-of select="'Use date'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf32_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Mark'">
				<xsl:copy-of select="'Mark'"/>
			</xsl:when>
			<xsl:when test="$input='Registered mark with reputation'">
				<xsl:copy-of select="'Registered mark with reputation'"/>
			</xsl:when>
			<xsl:when test="$input='Well known mark'">
				<xsl:copy-of select="'Well-known mark'"/>
			</xsl:when>
			<xsl:when test="$input='NonRegistered mark'">
				<xsl:copy-of select="'Non-registered mark'"/>
			</xsl:when>
			<xsl:when test="$input='Sign used in trade'">
				<xsl:copy-of select="'Sign used in trade'"/>
			</xsl:when>
			<xsl:when test="$input='Mark filed by an agent'">
				<xsl:copy-of select="'Mark filed by an agent'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf33_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility of opposition filing checked'">
				<xsl:copy-of select="'Admissibility checked'"/>
			</xsl:when>
			<xsl:when test="$input='Cooling off period taken'">
				<xsl:copy-of select="'Cooling-off period'"/>
			</xsl:when>
			<xsl:when test="$input='Proceedings of opposition commenced'">
				<xsl:copy-of select="'Commencement of proceeding'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties reached'">
				<xsl:copy-of select="'Agreement between parties'"/>
			</xsl:when>
			<xsl:when test="$input='Application or trademark finally withdrawn'">
				<xsl:copy-of select="'Final decision - CTM withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Application or trademark finally limited'">
				<xsl:copy-of select="'Final decision - CTM limited'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition finally withdrawn'">
				<xsl:copy-of select="'Final decision - Opposition withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Application or trademark finally rejected in Full'">
				<xsl:copy-of select="'Final decision - CTM rejected by ED'"/>
			</xsl:when>
			<xsl:when test="$input='Application or trademark finally rejected in part'">
				<xsl:copy-of select="'Final decision - CTM rejected in part'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition finally rejected'">
				<xsl:copy-of select="'Final decision - Opposition rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition deemed to be withdrawn'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Opposition closed'">
				<xsl:copy-of select="'Opposition closed'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf34_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Certificate'">
				<xsl:copy-of select="'Certificate'"/>
			</xsl:when>
			<xsl:when test="$input='Collective'">
				<xsl:copy-of select="'Collective'"/>
			</xsl:when>
			<xsl:when test="$input='Defensive'">
				<xsl:copy-of select="'Defensive'"/>
			</xsl:when>
			<xsl:when test="$input='Individual'">
				<xsl:copy-of select="'Individual'"/>
			</xsl:when>
			<xsl:when test="$input='Guarantee'">
				<xsl:copy-of select="'Guarantee'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf35_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Word'">
				<xsl:copy-of select="'Word'"/>
			</xsl:when>
			<xsl:when test="$input='Stylized characters'">
				<xsl:copy-of select="'Stylized characters'"/>
			</xsl:when>
			<xsl:when test="$input='Figurative'">
				<xsl:copy-of select="'Figurative'"/>
			</xsl:when>
			<xsl:when test="$input='Combined'">
				<xsl:copy-of select="'Combined'"/>
			</xsl:when>
			<xsl:when test="$input='Three dimensional'">
				<xsl:copy-of select="'3-D'"/>
			</xsl:when>
			<xsl:when test="$input='Colour'">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
			<xsl:when test="$input='Sound'">
				<xsl:copy-of select="'Sound'"/>
			</xsl:when>
			<xsl:when test="$input='Hologram'">
				<xsl:copy-of select="'Hologram'"/>
			</xsl:when>
			<xsl:when test="$input='Olfactory'">
				<xsl:copy-of select="'Olfactory'"/>
			</xsl:when>
			<xsl:when test="$input='Motion'">
				<xsl:copy-of select="'Motion'"/>
			</xsl:when>
			<xsl:when test="$input='Municipal'">
				<xsl:copy-of select="'Municipal'"/>
			</xsl:when>
			<xsl:when test="$input='Chimney'">
				<xsl:copy-of select="'Chimney'"/>
			</xsl:when>
			<xsl:when test="$input='Kennfaden'">
				<xsl:copy-of select="'Kennfaden'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf36_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility checked'">
				<xsl:copy-of select="'Admissibility checked'"/>
			</xsl:when>
			<xsl:when test="$input='Coolingoff period'">
				<xsl:copy-of select="'Cooling-off period'"/>
			</xsl:when>
			<xsl:when test="$input='Commencement of proceeding'">
				<xsl:copy-of select="'Commencement of proceeding'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties'">
				<xsl:copy-of select="'Agreement between parties'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_CTM withdrawn'">
				<xsl:copy-of select="'Final decision - CTM withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_CTM limited'">
				<xsl:copy-of select="'Final decision - CTM limited'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_Opposition withdrawn'">
				<xsl:copy-of select="'Final decision - Opposition withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_CTM rejected by ED'">
				<xsl:copy-of select="'Final decision - CTM rejected by ED'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_CTM rejected in part'">
				<xsl:copy-of select="'Final decision - CTM rejected in part'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_CTM rejected'">
				<xsl:copy-of select="'Final decision - CTM rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_Opposition rejected'">
				<xsl:copy-of select="'Final decision - Opposition rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision_Opposition not duly entered'">
				<xsl:copy-of select="'Final decision - Opposition not duly entered'"/>
			</xsl:when>
			<xsl:when test="$input='No decision_Opposition not duly entered'">
				<xsl:copy-of select="'No decision - Opposition not duly entered'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition closed'">
				<xsl:copy-of select="'Opposition closed'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf37_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Appeal expired'">
				<xsl:copy-of select="'Appeal Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal lapsed'">
				<xsl:copy-of select="'Appeal Lapsed'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal withdrawn'">
				<xsl:copy-of select="'Appeal Withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Complementary renewal'">
				<xsl:copy-of select="'Complementary Renewal'"/>
			</xsl:when>
			<xsl:when test="$input='Effect continuation'">
				<xsl:copy-of select="'Effect Continuation'"/>
			</xsl:when>
			<xsl:when test="$input='Final confirmation refusal'">
				<xsl:copy-of select="'Final Confirmation Refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Final other decision'">
				<xsl:copy-of select="'Final Other Decision'"/>
			</xsl:when>
			<xsl:when test="$input='Final reversing refusal'">
				<xsl:copy-of select="'Final Reversing Refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Final total refusal'">
				<xsl:copy-of select="'Final Total Refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Judicial action'">
				<xsl:copy-of select="'Judicial Action'"/>
			</xsl:when>
			<xsl:when test="$input='Limitation'">
				<xsl:copy-of select="'Limitation'"/>
			</xsl:when>
			<xsl:when test="$input='No effect limitation'">
				<xsl:copy-of select="'No Effect Limitation'"/>
			</xsl:when>
			<xsl:when test="$input='NonRenewal'">
				<xsl:copy-of select="'Non Renewal'"/>
			</xsl:when>
			<xsl:when test="$input='NonRenewal certain parties'">
				<xsl:copy-of select="'Non Renewal Certain Parties'"/>
			</xsl:when>
			<xsl:when test="$input='NonRenewal under rule 40_3'">
				<xsl:copy-of select="'Non Renewal Under Rule 40.3'"/>
			</xsl:when>
			<xsl:when test="$input='Partial cancellation'">
				<xsl:copy-of select="'Partial Cancellation'"/>
			</xsl:when>
			<xsl:when test="$input='Partial ceasing effect'">
				<xsl:copy-of select="'Partial Ceasing Effect'"/>
			</xsl:when>
			<xsl:when test="$input='Partial invalidation'">
				<xsl:copy-of select="'Partial Invalidation'"/>
			</xsl:when>
			<xsl:when test="$input='Partial refusal'">
				<xsl:copy-of select="'Partial Refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Protection granted'">
				<xsl:copy-of select="'Protection Granted'"/>
			</xsl:when>
			<xsl:when test="$input='Registration'">
				<xsl:copy-of select="'Registration'"/>
			</xsl:when>
			<xsl:when test="$input='Renewal'">
				<xsl:copy-of select="'Renewal'"/>
			</xsl:when>
			<xsl:when test="$input='Renewal under rule 40_3'">
				<xsl:copy-of select="'Renewal Under Rule 40.3'"/>
			</xsl:when>
			<xsl:when test="$input='Renunciation'">
				<xsl:copy-of select="'Renunciation'"/>
			</xsl:when>
			<xsl:when test="$input='Representative appointed'">
				<xsl:copy-of select="'Representative Appointed'"/>
			</xsl:when>
			<xsl:when test="$input='Second part fee not paid'">
				<xsl:copy-of select="'Second Part Fee Not Paid'"/>
			</xsl:when>
			<xsl:when test="$input='Second Part Fee Paid'">
				<xsl:copy-of select="'Second Part Fee Paid'"/>
			</xsl:when>
			<xsl:when test="$input='Subsequent designation'">
				<xsl:copy-of select="'Subsequent Designation'"/>
			</xsl:when>
			<xsl:when test="$input='Total cancellation'">
				<xsl:copy-of select="'Total Cancellation'"/>
			</xsl:when>
			<xsl:when test="$input='Total ceasing effect'">
				<xsl:copy-of select="'Total Ceasing Effect'"/>
			</xsl:when>
			<xsl:when test="$input='Total invalidation'">
				<xsl:copy-of select="'Total Invalidation'"/>
			</xsl:when>
			<xsl:when test="$input='Total refusal'">
				<xsl:copy-of select="'Total Refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Transfer refusal'">
				<xsl:copy-of select="'Transfer Refusal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf38_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Rejected'">
				<xsl:copy-of select="'Rejected'"/>
			</xsl:when>
			<xsl:when test="$input='To check'">
				<xsl:copy-of select="'To Check'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf39_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Record filed'">
				<xsl:copy-of select="'Record filed'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf40_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='List limited to'">
				<xsl:copy-of select="'List limited to'"/>
			</xsl:when>
			<xsl:when test="$input='Remove from list'">
				<xsl:copy-of select="'Remove from list'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf41_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Holder right restriction opposition period'">
				<xsl:copy-of select="'Holder Right Restriction Opposition Period'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition period'">
				<xsl:copy-of select="'Opposition Period'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Protection granted opposition period'">
				<xsl:copy-of select="'Protection Granted Opposition Period'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf42_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Partial transfer'">
				<xsl:copy-of select="'Partial Transfer'"/>
			</xsl:when>
			<xsl:when test="$input='Total transfer'">
				<xsl:copy-of select="'Total Transfer'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf43_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Record filed'">
				<xsl:copy-of select="'Record filed'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf44_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Change applicant name or address'">
				<xsl:copy-of select="'Change applicant name or address'"/>
			</xsl:when>
			<xsl:when test="$input='Holder'">
				<xsl:copy-of select="'Holder'"/>
			</xsl:when>
			<xsl:when test="$input='Licensee'">
				<xsl:copy-of select="'Licensee'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf45_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Record filed'">
				<xsl:copy-of select="'Record filed'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf46_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Licence'">
				<xsl:copy-of select="'Licence'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Sublicence'">
				<xsl:copy-of select="'Sub-Licence'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf47_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Record filed'">
				<xsl:copy-of select="'Record filed'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf48_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Unknown'">
				<xsl:copy-of select="'Unknown'"/>
			</xsl:when>
			<xsl:when test="$input='Exclusive'">
				<xsl:copy-of select="'Exclusive'"/>
			</xsl:when>
			<xsl:when test="$input='NonExclusive'">
				<xsl:copy-of select="'Nonexclusive'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf49_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Cancelled'">
				<xsl:copy-of select="'Cancelled'"/>
			</xsl:when>
			<xsl:when test="$input='Expired'">
				<xsl:copy-of select="'Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Valid'">
				<xsl:copy-of select="'Valid'"/>
			</xsl:when>
			<xsl:when test="$input='To verify'">
				<xsl:copy-of select="'To Verify'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf50_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Rejected'">
				<xsl:copy-of select="'Rejected'"/>
			</xsl:when>
			<xsl:when test="$input='To check'">
				<xsl:copy-of select="'To Check'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf51_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Merger'">
				<xsl:copy-of select="'Merger'"/>
			</xsl:when>
			<xsl:when test="$input='Partial transfer'">
				<xsl:copy-of select="'Partial Transfer'"/>
			</xsl:when>
			<xsl:when test="$input='Short notation'">
				<xsl:copy-of select="'Short Notation'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf52_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Action before Court of Justice pending'">
				<xsl:copy-of select="'Action before Court of Justice pending'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal pending'">
				<xsl:copy-of select="'Appeal pending'"/>
			</xsl:when>
			<xsl:when test="$input='Application accepted'">
				<xsl:copy-of select="'Application accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Application deemed withdrawn'">
				<xsl:copy-of select="'Application deemed withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Application filed'">
				<xsl:copy-of select="'Application filed'"/>
			</xsl:when>
			<xsl:when test="$input='Application opposed'">
				<xsl:copy-of select="'Application opposed'"/>
			</xsl:when>
			<xsl:when test="$input='Application published'">
				<xsl:copy-of select="'Application published'"/>
			</xsl:when>
			<xsl:when test="$input='Application refused'">
				<xsl:copy-of select="'Application refused'"/>
			</xsl:when>
			<xsl:when test="$input='Application withdrawn'">
				<xsl:copy-of select="'Application withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Classification checked'">
				<xsl:copy-of select="'Classification checked'"/>
			</xsl:when>
			<xsl:when test="$input='Conversion requested'">
				<xsl:copy-of select="'Conversion requested'"/>
			</xsl:when>
			<xsl:when test="$input='Expired'">
				<xsl:copy-of select="'Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Filing date accorded'">
				<xsl:copy-of select="'Filing date accorded'"/>
			</xsl:when>
			<xsl:when test="$input='Interruption of proceedings'">
				<xsl:copy-of select="'Interruption of proceedings'"/>
			</xsl:when>
			<xsl:when test="$input='Invalidity proceeding pending'">
				<xsl:copy-of select="'Invalidity proceeding pending'"/>
			</xsl:when>
			<xsl:when test="$input='Registered'">
				<xsl:copy-of select="'Registered'"/>
			</xsl:when>
			<xsl:when test="$input='Registration cancellation pending'">
				<xsl:copy-of select="'Registration cancellation pending'"/>
			</xsl:when>
			<xsl:when test="$input='Registration cancelled'">
				<xsl:copy-of select="'Registration cancelled'"/>
			</xsl:when>
			<xsl:when test="$input='Registration opposed'">
				<xsl:copy-of select="'Registration opposed'"/>
			</xsl:when>
			<xsl:when test="$input='Registration surrendered'">
				<xsl:copy-of select="'Registration surrendered'"/>
			</xsl:when>
			<xsl:when test="$input='Revocation proceeding pending'">
				<xsl:copy-of select="'Revocation proceeding pending'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf53_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Business fixed'">
				<xsl:copy-of select="'Fixed'"/>
			</xsl:when>
			<xsl:when test="$input='Business mobile'">
				<xsl:copy-of select="'Mobile Phone'"/>
			</xsl:when>
			<xsl:when test="$input='Private fixed'">
				<xsl:copy-of select="'Fixed'"/>
			</xsl:when>
			<xsl:when test="$input='Private mobile'">
				<xsl:copy-of select="'Mobile Phone'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<Transaction xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/trademarks ../../Schemas/ST66Schema/st66model-V1-1.xsd'"/>
			<xsl:for-each select="tmk:TrademarkTransaction">
				<xsl:for-each select="com:TransactionHeader">
					<TransactionHeader>
						<xsl:variable name="var1_SenderBag" as="node()" select="com:SenderBag"/>
						<SenderDetails>
							<xsl:for-each select="$var1_SenderBag/com:RequestIdentifier">
								<RequestIdentifier>
									<xsl:sequence select="fn:string(.)"/>
								</RequestIdentifier>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestLanguageCode">
								<RequestLanguageCode>
									<xsl:sequence select="fn:string(.)"/>
								</RequestLanguageCode>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestXSDVersion">
								<RequestXSDVersion>
									<xsl:sequence select="fn:string(.)"/>
								</RequestXSDVersion>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:FileName">
								<RequestFilename>
									<xsl:sequence select="fn:string(.)"/>
								</RequestFilename>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestStatusCategory">
								<RequestStatus>
									<xsl:sequence select="fn:string(.)"/>
								</RequestStatus>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestProducer">
								<RequestProducer>
									<xsl:sequence select="fn:string(.)"/>
								</RequestProducer>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestDate">
								<RequestProducerDate>
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</RequestProducerDate>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestDateTime">
								<RequestProducerDateTime>
									<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
								</RequestProducerDateTime>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestReceivingOfficeCode">
								<RequestReceivingOfficeCode>
									<xsl:sequence select="fn:string(.)"/>
								</RequestReceivingOfficeCode>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:LoginInformation">
								<LoginInformation>
									<Login>
										<xsl:sequence select="fn:string(com:Login)"/>
									</Login>
									<xsl:for-each select="com:LoginEmail">
										<LoginEmail>
											<xsl:sequence select="fn:string(.)"/>
										</LoginEmail>
									</xsl:for-each>
									<xsl:for-each select="com:Password">
										<Password>
											<xsl:sequence select="fn:string(.)"/>
										</Password>
									</xsl:for-each>
								</LoginInformation>
							</xsl:for-each>
						</SenderDetails>
						<xsl:for-each select="com:ReceiverBag">
							<ReceiverDetails>
								<ReceiverDateTime>
									<xsl:sequence select="xs:string(xs:dateTime(fn:string(com:ReceiverDateTime)))"/>
								</ReceiverDateTime>
								<xsl:for-each select="com:CommentText">
									<Comment>
										<xsl:for-each select="@com:languageCode">
											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</Comment>
								</xsl:for-each>
							</ReceiverDetails>
						</xsl:for-each>
					</TransactionHeader>
				</xsl:for-each>
				<xsl:for-each select="tmk:TrademarkTransactionBody">
					<TradeMarkTransactionBody>
						<xsl:for-each select="com:TransactionErrorBag">
							<TransactionErrorDetails>
								<xsl:for-each select="com:TransactionError">
									<TransactionError>
										<xsl:for-each select="com:TransactionErrorCode">
											<TransactionErrorCode>
												<xsl:sequence select="fn:string(.)"/>
											</TransactionErrorCode>
										</xsl:for-each>
										<xsl:for-each select="com:TransactionErrorText">
											<TransactionErrorText>
												<xsl:for-each select="@com:languageCode">
													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:sequence select="fn:string(.)"/>
											</TransactionErrorText>
										</xsl:for-each>
									</TransactionError>
								</xsl:for-each>
							</TransactionErrorDetails>
						</xsl:for-each>
						<xsl:variable name="var366_TransactionContentBag" as="node()" select="tmk:TransactionContentBag"/>
						<TransactionContentDetails>
							<TransactionIdentifier>
								<xsl:sequence select="fn:string($var366_TransactionContentBag/com:TransactionIdentifier)"/>
							</TransactionIdentifier>
							<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf1_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var366_TransactionContentBag/com:TransactionCategory)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
								<TransactionCode>
									<xsl:sequence select="."/>
								</TransactionCode>
							</xsl:for-each>
							<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf2_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var366_TransactionContentBag/com:TransactionSubCode)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
								<TransactionSubCode>
									<xsl:sequence select="."/>
								</TransactionSubCode>
							</xsl:for-each>
							<xsl:variable name="var365_TransactionData" as="node()" select="$var366_TransactionContentBag/tmk:TransactionData"/>
							<TransactionData>
								<xsl:for-each select="$var365_TransactionData/tmk:TrademarkBag">
									<TradeMarkDetails>
										<xsl:for-each select="tmk:Trademark">
											<xsl:variable name="var230_MarkRepresentation" as="node()?" select="tmk:MarkRepresentation"/>
											<xsl:variable name="var231_ApplicationNumber" as="node()*" select="com:ApplicationNumber"/>
											<TradeMark>
												<xsl:for-each select="@com:operationCategory">
													<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:for-each select="com:RegistrationOfficeCode">
													<RegistrationOfficeCode>
														<xsl:sequence select="fn:string(.)"/>
													</RegistrationOfficeCode>
												</xsl:for-each>
												<xsl:for-each select="com:ReceivingOfficeCode">
													<ReceivingOfficeCode>
														<xsl:sequence select="fn:string(.)"/>
													</ReceivingOfficeCode>
												</xsl:for-each>
												<xsl:for-each select="com:ReceivingOfficeDate">
													<ReceivingOfficeDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</ReceivingOfficeDate>
												</xsl:for-each>
												<xsl:for-each select="$var231_ApplicationNumber/com:ApplicationNumberText">
													<ApplicationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</ApplicationNumber>
												</xsl:for-each>
												<xsl:for-each select="$var231_ApplicationNumber/com:ST13ApplicationNumber">
													<ApplicationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</ApplicationNumber>
												</xsl:for-each>
												<xsl:for-each select="com:ApplicationDate">
													<ApplicationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</ApplicationDate>
												</xsl:for-each>
												<xsl:for-each select="com:ApplicationDateTime">
													<ApplicationDateTime>
														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
													</ApplicationDateTime>
												</xsl:for-each>
												<xsl:for-each select="com:RegistrationNumber">
													<RegistrationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</RegistrationNumber>
												</xsl:for-each>
												<xsl:for-each select="com:RegistrationDate">
													<RegistrationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</RegistrationDate>
												</xsl:for-each>
												<xsl:for-each select="tmk:OtherDate">
													<OtherDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</OtherDate>
												</xsl:for-each>
												<xsl:for-each select="com:FilingPlace">
													<FilingPlace>
														<xsl:sequence select="fn:string(.)"/>
													</FilingPlace>
												</xsl:for-each>
												<xsl:for-each select="com:ApplicantFileReference">
													<ApplicationReference>
														<xsl:sequence select="fn:string(.)"/>
													</ApplicationReference>
												</xsl:for-each>
												<xsl:for-each select="tmk:ApplicantSideCaseIdentifier">
													<ApplicantSideCaseKey>
														<xsl:sequence select="fn:string(.)"/>
													</ApplicantSideCaseKey>
												</xsl:for-each>
												<xsl:for-each select="com:ApplicationLanguageCode">
													<ApplicationLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</ApplicationLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="com:SecondLanguageCode">
													<SecondLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</SecondLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="com:CorrespondenceLanguageCode">
													<CorrespondenceLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</CorrespondenceLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="tmk:ExaminedApplicationNumber/com:ApplicationNumberText">
													<ExaminedApplicationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</ExaminedApplicationNumber>
												</xsl:for-each>
												<xsl:for-each select="com:ExpiryDate">
													<ExpiryDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</ExpiryDate>
												</xsl:for-each>
												<xsl:for-each select="tmk:TerminationDate">
													<TerminationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</TerminationDate>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkCurrentStatusCode">
													<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf3_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var4_resultof_vmf__inputtoresult">
														<MarkCurrentStatusCode>
															<xsl:sequence select="."/>
														</MarkCurrentStatusCode>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkCurrentStatusDate">
													<MarkCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</MarkCurrentStatusDate>
												</xsl:for-each>
												<xsl:for-each select="tmk:DesignatedCountryBag">
													<DesignatedCountryDetails>
														<xsl:for-each select="tmk:DesignatedCountry">
															<DesignatedCountry>
																<DesignatedCountryCode>
																	<xsl:sequence select="fn:string(com:DesignatedCountryCode)"/>
																</DesignatedCountryCode>
																<xsl:for-each select="tmk:MadridSystemCategory">
																	<xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf4_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var5_resultof_vmf__inputtoresult">
																		<DesignatedUnderCode>
																			<xsl:sequence select="."/>
																		</DesignatedUnderCode>
																	</xsl:for-each>
																</xsl:for-each>
															</DesignatedCountry>
														</xsl:for-each>
													</DesignatedCountryDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:PreviousRegistrationBag">
													<PreviousRegistrationDetails>
														<xsl:for-each select="tmk:PreviousRegistration">
															<PreviousRegistration>
																<xsl:for-each select="com:RegistrationOfficeCode">
																	<RegistrationOfficeCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RegistrationOfficeCode>
																</xsl:for-each>
																<PreviousRegistrationNumber>
																	<xsl:sequence select="fn:string(tmk:PreviousRegistrationNumber)"/>
																</PreviousRegistrationNumber>
																<xsl:for-each select="tmk:PreviousRegistrationDate">
																	<PreviousRegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PreviousRegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:PreviousRegistrationBasisCategory">
																	<xsl:variable name="var6_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf5_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var6_resultof_vmf__inputtoresult">
																		<PreviousRegistrationBasis>
																			<xsl:sequence select="."/>
																		</PreviousRegistrationBasis>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:PreviousRegistrationCancellationDate">
																	<PreviousRegistrationCancellationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PreviousRegistrationCancellationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:PreviousRegistrationPriorityDate">
																	<PreviousRegistrationPriorityDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PreviousRegistrationPriorityDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</PreviousRegistration>
														</xsl:for-each>
													</PreviousRegistrationDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:AssociatedMarkBag/tmk:AssociatedMark">
													<AssociatedMarkDetails>
														<xsl:for-each select="tmk:AssociatedApplicationNumber/com:ApplicationNumberText">
															<AssociatedApplicationNumber>
																<xsl:sequence select="fn:string(.)"/>
															</AssociatedApplicationNumber>
														</xsl:for-each>
													</AssociatedMarkDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:DivisionalApplicationBag">
													<DivisionalApplicationDetails>
														<xsl:variable name="var8_InitialApplicationNumber" as="node()" select="tmk:InitialApplicationNumber"/>
														<xsl:for-each select="$var8_InitialApplicationNumber/com:ST13ApplicationNumber">
															<xsl:variable name="var7_cur" as="node()" select="."/>
															<xsl:for-each select="$var8_InitialApplicationNumber/com:ApplicationNumberText">
																<InitialApplicationNumber>
																	<xsl:sequence select="xs:string(fn:exists(((xs:boolean(fn:string($var7_cur)), xs:boolean(fn:string(.))))[.]))"/>
																</InitialApplicationNumber>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="tmk:InitialApplicationDate">
															<InitialApplicationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</InitialApplicationDate>
														</xsl:for-each>
													</DivisionalApplicationDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:BasicRegistrationApplicationBag">
													<BasicRegistrationApplicationDetails>
														<xsl:for-each select="tmk:BasicRegistrationApplication">
															<BasicRegistrationApplication>
																<xsl:for-each select="com:RegistrationOfficeCode">
																	<RegistrationOfficeCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RegistrationOfficeCode>
																</xsl:for-each>
																<xsl:for-each select="tmk:BasicApplicationBag">
																	<BasicApplicationDetails>
																		<xsl:for-each select="tmk:BasicApplication">
																			<BasicApplication>
																				<xsl:for-each select="tmk:BasicApplicationNumber/com:ApplicationNumberText">
																					<BasicApplicationNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</BasicApplicationNumber>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:BasicApplicationDate">
																					<BasicApplicationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</BasicApplicationDate>
																				</xsl:for-each>
																			</BasicApplication>
																		</xsl:for-each>
																	</BasicApplicationDetails>
																</xsl:for-each>
																<xsl:for-each select="tmk:BasicRegistrationBag">
																	<BasicRegistrationDetails>
																		<xsl:for-each select="tmk:BasicRegistration">
																			<BasicRegistration>
																				<BasicRegistrationNumber>
																					<xsl:sequence select="fn:string(tmk:BasicRegistrationNumber)"/>
																				</BasicRegistrationNumber>
																				<BasicRegistrationDate>
																					<xsl:sequence select="xs:string(xs:date(fn:string(tmk:BasicRegistrationDate)))"/>
																				</BasicRegistrationDate>
																			</BasicRegistration>
																		</xsl:for-each>
																	</BasicRegistrationDetails>
																</xsl:for-each>
															</BasicRegistrationApplication>
														</xsl:for-each>
													</BasicRegistrationApplicationDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:InternationalMarkIdentifierBag">
													<InternationalMarkKey>
														<xsl:for-each select="tmk:InternationalMarkIdentifier">
															<Identifier>
																<xsl:sequence select="fn:string(.)"/>
															</Identifier>
														</xsl:for-each>
													</InternationalMarkKey>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkCategory">
													<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf6_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var9_resultof_vmf__inputtoresult">
														<KindMark>
															<xsl:sequence select="."/>
														</KindMark>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="$var230_MarkRepresentation/tmk:MarkFeatureCategory">
													<xsl:variable name="var10_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf7_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var10_resultof_vmf__inputtoresult">
														<MarkFeature>
															<xsl:sequence select="."/>
														</MarkFeature>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="$var230_MarkRepresentation/tmk:MarkDescriptionBag">
													<MarkDescriptionDetails>
														<xsl:for-each select="tmk:MarkDescriptionText">
															<MarkDescription>
																<xsl:sequence select="fn:string(.)"/>
															</MarkDescription>
														</xsl:for-each>
													</MarkDescriptionDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkDisclaimerBag">
													<MarkDisclaimerDetails>
														<xsl:for-each select="tmk:MarkDisclaimerText">
															<MarkDisclaimer>
																<xsl:for-each select="@com:languageCode">
																	<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@com:sequenceNumber">
																	<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</MarkDisclaimer>
														</xsl:for-each>
													</MarkDisclaimerDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:NonUseCancelledIndicator">
													<NonUseCancelledIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</NonUseCancelledIndicator>
												</xsl:for-each>
												<xsl:for-each select="tmk:SpecialCircumstanceText">
													<SpecialCircumstanceText>
														<xsl:sequence select="fn:string(.)"/>
													</SpecialCircumstanceText>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkSeriesTotalQuantity">
													<TotalMarkSeries>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</TotalMarkSeries>
												</xsl:for-each>
												<xsl:for-each select="tmk:TradeDistinctivenessIndicator">
													<TradeDistinctivenessIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</TradeDistinctivenessIndicator>
												</xsl:for-each>
												<xsl:for-each select="tmk:TradeDistinctivenessText">
													<TradeDistinctivenessText>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</TradeDistinctivenessText>
												</xsl:for-each>
												<xsl:for-each select="tmk:UseRight">
													<UseRight>
														<UseRightIndicator>
															<xsl:sequence select="xs:string(xs:boolean(fn:string(tmk:UseRightIndicator)))"/>
														</UseRightIndicator>
														<xsl:for-each select="tmk:UseRightText">
															<UseRightText>
																<xsl:for-each select="@com:languageCode">
																	<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</UseRightText>
														</xsl:for-each>
														<xsl:for-each select="tmk:UseRightGoodsServices">
															<UseRightGoodsServices>
																<xsl:for-each select="tmk:ClassificationKindCode">
																	<ClassificationKindCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ClassificationKindCode>
																</xsl:for-each>
																<xsl:for-each select="com:ClassificationVersion">
																	<ClassificationVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</ClassificationVersion>
																</xsl:for-each>
																<xsl:for-each select="com:CommentTextBag/com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="tmk:ProposedLeadingClassNumber">
																	<ProposedLeadingClassNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</ProposedLeadingClassNumber>
																</xsl:for-each>
																<xsl:for-each select="tmk:ClassDescriptionBag">
																	<ClassDescriptionDetails>
																		<xsl:for-each select="tmk:ClassDescription">
																			<ClassDescription>
																				<xsl:for-each select="tmk:ClassNumber">
																					<ClassNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</ClassNumber>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:ClassNumberStatusCategory">
																					<xsl:variable name="var11_resultof_vmf__inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf8_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var11_resultof_vmf__inputtoresult">
																						<ClassNumberStatusCode>
																							<xsl:sequence select="."/>
																						</ClassNumberStatusCode>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																					<GoodsServicesDescription>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</GoodsServicesDescription>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																					<UseNiceHeadingIndicator>
																						<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																					</UseNiceHeadingIndicator>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:ClassificationTermBag">
																					<ClassificationTermDetails>
																						<xsl:for-each select="tmk:ClassificationTerm">
																							<ClassificationTerm>
																								<xsl:for-each select="@com:operationCategory">
																									<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermIdentifier">
																									<ClassificationTermIdentifier>
																										<xsl:for-each select="@com:officeCode">
																											<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermIdentifier>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																									<ClassificationTermOffice>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermOffice>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																									<ClassificationTermOfficeKey>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermOfficeKey>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																									<xsl:variable name="var12_resultof_vmf__inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf9_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var12_resultof_vmf__inputtoresult">
																										<ClassificationTermSource>
																											<xsl:sequence select="."/>
																										</ClassificationTermSource>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermEntryDate">
																									<ClassificationTermEntryDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</ClassificationTermEntryDate>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassNumber">
																									<ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassNumber>
																								</xsl:for-each>
																								<xsl:variable name="var13_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																								<ClassificationTermText>
																									<xsl:for-each select="$var13_ClassificationTermText/@com:languageCode">
																										<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string($var13_ClassificationTermText)"/>
																								</ClassificationTermText>
																								<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																									<ClassificationTermEquivalentGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermEquivalentGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																									<ClassificationTermReferenceGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermReferenceGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																									<ClassificationTermTranslationGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermTranslationGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermStatus">
																									<xsl:variable name="var15_cur" as="node()" select="."/>
																									<xsl:variable name="var14_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf10_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var14_resultof_vmf___inputtoresult">
																										<ClassificationTermStatus>
																											<xsl:for-each select="$var15_cur/@com:officeCode">
																												<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="."/>
																										</ClassificationTermStatus>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:WIPOBasicNumber">
																									<WIPOBasicNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</WIPOBasicNumber>
																								</xsl:for-each>
																							</ClassificationTerm>
																						</xsl:for-each>
																					</ClassificationTermDetails>
																				</xsl:for-each>
																			</ClassDescription>
																		</xsl:for-each>
																	</ClassDescriptionDetails>
																</xsl:for-each>
															</UseRightGoodsServices>
														</xsl:for-each>
													</UseRight>
												</xsl:for-each>
												<xsl:for-each select="tmk:AsItIsProtectionIndicator">
													<AsItIsProtectionIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</AsItIsProtectionIndicator>
												</xsl:for-each>
												<xsl:for-each select="tmk:UseRequirementText">
													<UseRequirementText>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</UseRequirementText>
												</xsl:for-each>
												<xsl:for-each select="tmk:UseLimitationText">
													<UseLimitationText>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</UseLimitationText>
												</xsl:for-each>
												<xsl:for-each select="com:CommentText">
													<Comment>
														<xsl:sequence select="fn:string(.)"/>
													</Comment>
												</xsl:for-each>
												<xsl:for-each select="tmk:OppositionPeriodStartDate">
													<OppositionPeriodStartDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</OppositionPeriodStartDate>
												</xsl:for-each>
												<xsl:for-each select="tmk:OppositionPeriodEndDate">
													<OppositionPeriodEndDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</OppositionPeriodEndDate>
												</xsl:for-each>
												<xsl:for-each select="$var230_MarkRepresentation/tmk:MarkReproduction/tmk:WordMarkSpecification">
													<WordMarkSpecification>
														<xsl:for-each select="tmk:MarkVerbalElementText">
															<MarkVerbalElementText>
																<xsl:for-each select="@com:languageCode">
																	<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</MarkVerbalElementText>
														</xsl:for-each>
														<xsl:for-each select="tmk:MarkVerbalElementSignificantIndicator">
															<MarkVerbalElementSignificantIndicator>
																<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
															</MarkVerbalElementSignificantIndicator>
														</xsl:for-each>
														<xsl:for-each select="tmk:MarkTransliteration">
															<MarkTransliteration>
																<xsl:for-each select="@tmk:transliterationCategory">
																	<xsl:variable name="var16_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf11_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var16_resultof_vmf___inputtoresult">
																		<xsl:attribute name="transliterationKind" namespace="" select="."/>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</MarkTransliteration>
														</xsl:for-each>
														<xsl:for-each select="tmk:MarkTranscription">
															<MarkTranscription>
																<xsl:for-each select="@tmk:transcriptionCategory">
																	<xsl:variable name="var17_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf12_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var17_resultof_vmf___inputtoresult">
																		<xsl:attribute name="transcriptionKind" namespace="" select="."/>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</MarkTranscription>
														</xsl:for-each>
														<xsl:for-each select="tmk:MarkStandardCharacterIndicator">
															<MarkStandardCharacterIndicator>
																<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
															</MarkStandardCharacterIndicator>
														</xsl:for-each>
													</WordMarkSpecification>
												</xsl:for-each>
												<xsl:for-each select="$var230_MarkRepresentation/tmk:MarkReproduction/tmk:MarkImageBag">
													<MarkImageDetails>
														<xsl:for-each select="tmk:MarkImage">
															<xsl:variable name="var26_HeightMeasure" as="node()?" select="com:HeightMeasure"/>
															<MarkImage>
																<MarkImageFilename>
																	<xsl:sequence select="fn:string(com:FileName)"/>
																</MarkImageFilename>
																<xsl:for-each select="com:ImageFormatCategory">
																	<xsl:variable name="var18_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf13_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var18_resultof_vmf___inputtoresult">
																		<MarkImageFileFormat>
																			<xsl:sequence select="."/>
																		</MarkImageFileFormat>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:ColourIndicator">
																	<MarkImageColourIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</MarkImageColourIndicator>
																</xsl:for-each>
																<xsl:for-each select="com:ColourModeCategory">
																	<xsl:variable name="var19_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf14_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var19_resultof_vmf___inputtoresult">
																		<MarkImageColourMode>
																			<xsl:sequence select="."/>
																		</MarkImageColourMode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkImageColourClaimedText">
																	<MarkImageColourClaimedText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</MarkImageColourClaimedText>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkImageColourPartClaimedText">
																	<MarkImageColourPartClaimedText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</MarkImageColourPartClaimedText>
																</xsl:for-each>
																<MarkImageRepresentationSize>
																	<xsl:for-each select="$var26_HeightMeasure">
																		<Height>
																			<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																		</Height>
																	</xsl:for-each>
																	<xsl:for-each select="com:WidthMeasure">
																		<Width>
																			<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																		</Width>
																	</xsl:for-each>
																	<xsl:for-each select="$var26_HeightMeasure">
																		<xsl:variable name="var20_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf15_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(@com:measureUnitCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var20_resultof_vmf___inputtoresult">
																			<Unit>
																				<xsl:sequence select="."/>
																			</Unit>
																		</xsl:for-each>
																	</xsl:for-each>
																</MarkImageRepresentationSize>
																<xsl:for-each select="tmk:MarkImageClassification">
																	<xsl:variable name="var21_ViennaClassificationBag" as="node()*" select="com:FigurativeElementClassificationBag/com:ViennaClassificationBag"/>
																	<MarkImageCategory>
																		<xsl:for-each select="$var21_ViennaClassificationBag/com:ViennaClassificationEdition">
																			<CategoryVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</CategoryVersion>
																		</xsl:for-each>
																		<xsl:for-each select="$var21_ViennaClassificationBag/com:ViennaClassification">
																			<CategoryCodeDetails>
																				<CategoryCode>
																					<xsl:sequence select="fn:string(com:ViennaCategory)"/>
																				</CategoryCode>
																			</CategoryCodeDetails>
																		</xsl:for-each>
																	</MarkImageCategory>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkImageQualityIndicator">
																	<MarkImageQualityIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</MarkImageQualityIndicator>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkImageRenditionBag">
																	<MarkImageRenditionDetails>
																		<xsl:for-each select="tmk:MarkImageRendition">
																			<xsl:variable name="var25_HeightMeasure" as="node()" select="com:HeightMeasure"/>
																			<MarkImageRendition>
																				<xsl:for-each select="tmk:MarkImageRenditionCategory">
																					<xsl:variable name="var22_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf16_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var22_resultof_vmf___inputtoresult">
																						<MarkImageRenditionKind>
																							<xsl:sequence select="."/>
																						</MarkImageRenditionKind>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:FileName">
																					<MarkImageRenditionFilename>
																						<xsl:sequence select="fn:string(.)"/>
																					</MarkImageRenditionFilename>
																				</xsl:for-each>
																				<xsl:for-each select="com:ImageFormatCategory">
																					<xsl:variable name="var23_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf17_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var23_resultof_vmf___inputtoresult">
																						<MarkImageRenditionFileFormat>
																							<xsl:sequence select="."/>
																						</MarkImageRenditionFileFormat>
																					</xsl:for-each>
																				</xsl:for-each>
																				<MarkImageRenditionRepresentationSize>
																					<Height>
																						<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string($var25_HeightMeasure))))"/>
																					</Height>
																					<Width>
																						<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(com:WidthMeasure))))"/>
																					</Width>
																					<xsl:variable name="var24_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf18_inputtoresult">
																							<xsl:with-param name="input" select="fn:string($var25_HeightMeasure/@com:measureUnitCode)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var24_resultof_vmf___inputtoresult">
																						<Unit>
																							<xsl:sequence select="."/>
																						</Unit>
																					</xsl:for-each>
																				</MarkImageRenditionRepresentationSize>
																			</MarkImageRendition>
																		</xsl:for-each>
																	</MarkImageRenditionDetails>
																</xsl:for-each>
															</MarkImage>
														</xsl:for-each>
													</MarkImageDetails>
												</xsl:for-each>
												<xsl:for-each select="$var230_MarkRepresentation/tmk:MarkReproduction/tmk:MarkSoundBag">
													<MarkSoundDetails>
														<xsl:for-each select="tmk:MarkSound">
															<MarkSound>
																<MarkSoundFilename>
																	<xsl:sequence select="fn:string(com:FileName)"/>
																</MarkSoundFilename>
																<xsl:for-each select="tmk:SoundFileFormatCategory">
																	<xsl:variable name="var27_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf19_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var27_resultof_vmf___inputtoresult">
																		<MarkSoundFileFormat>
																			<xsl:sequence select="."/>
																		</MarkSoundFileFormat>
																	</xsl:for-each>
																</xsl:for-each>
															</MarkSound>
														</xsl:for-each>
													</MarkSoundDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:GoodsServicesBag">
													<GoodsServicesDetails>
														<xsl:for-each select="tmk:GoodsServices">
															<GoodsServices>
																<xsl:for-each select="tmk:ClassificationKindCode">
																	<ClassificationKindCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ClassificationKindCode>
																</xsl:for-each>
																<xsl:for-each select="com:ClassificationVersion">
																	<ClassificationVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</ClassificationVersion>
																</xsl:for-each>
																<xsl:for-each select="com:CommentTextBag/com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="tmk:ProposedLeadingClassNumber">
																	<ProposedLeadingClassNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</ProposedLeadingClassNumber>
																</xsl:for-each>
																<xsl:for-each select="tmk:ClassDescriptionBag">
																	<ClassDescriptionDetails>
																		<xsl:for-each select="tmk:ClassDescription">
																			<ClassDescription>
																				<xsl:for-each select="tmk:ClassNumber">
																					<ClassNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</ClassNumber>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:ClassNumberStatusCategory">
																					<xsl:variable name="var28_resultof_vmf__inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf8_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var28_resultof_vmf__inputtoresult">
																						<ClassNumberStatusCode>
																							<xsl:sequence select="."/>
																						</ClassNumberStatusCode>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																					<GoodsServicesDescription>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</GoodsServicesDescription>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																					<UseNiceHeadingIndicator>
																						<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																					</UseNiceHeadingIndicator>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:ClassificationTermBag">
																					<ClassificationTermDetails>
																						<xsl:for-each select="tmk:ClassificationTerm">
																							<ClassificationTerm>
																								<xsl:for-each select="@com:operationCategory">
																									<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermIdentifier">
																									<ClassificationTermIdentifier>
																										<xsl:for-each select="@com:officeCode">
																											<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermIdentifier>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																									<ClassificationTermOffice>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermOffice>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																									<ClassificationTermOfficeKey>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermOfficeKey>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																									<xsl:variable name="var29_resultof_vmf__inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf9_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var29_resultof_vmf__inputtoresult">
																										<ClassificationTermSource>
																											<xsl:sequence select="."/>
																										</ClassificationTermSource>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermEntryDate">
																									<ClassificationTermEntryDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</ClassificationTermEntryDate>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassNumber">
																									<ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassNumber>
																								</xsl:for-each>
																								<xsl:variable name="var30_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																								<ClassificationTermText>
																									<xsl:for-each select="$var30_ClassificationTermText/@com:languageCode">
																										<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string($var30_ClassificationTermText)"/>
																								</ClassificationTermText>
																								<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																									<ClassificationTermEquivalentGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermEquivalentGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																									<ClassificationTermReferenceGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermReferenceGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																									<ClassificationTermTranslationGroup>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationTermTranslationGroup>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermStatus">
																									<xsl:variable name="var32_cur" as="node()" select="."/>
																									<xsl:variable name="var31_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf10_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var31_resultof_vmf___inputtoresult">
																										<ClassificationTermStatus>
																											<xsl:for-each select="$var32_cur/@com:officeCode">
																												<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="."/>
																										</ClassificationTermStatus>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:WIPOBasicNumber">
																									<WIPOBasicNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</WIPOBasicNumber>
																								</xsl:for-each>
																							</ClassificationTerm>
																						</xsl:for-each>
																					</ClassificationTermDetails>
																				</xsl:for-each>
																			</ClassDescription>
																		</xsl:for-each>
																	</ClassDescriptionDetails>
																</xsl:for-each>
															</GoodsServices>
														</xsl:for-each>
													</GoodsServicesDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:PriorityBag">
													<PriorityDetails>
														<xsl:for-each select="tmk:Priority">
															<Priority>
																<PriorityCountryCode>
																	<xsl:sequence select="fn:string(com:PriorityCountryCode)"/>
																</PriorityCountryCode>
																<xsl:for-each select="com:ApplicationNumber/com:ApplicationNumberText">
																	<PriorityNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</PriorityNumber>
																</xsl:for-each>
																<PriorityDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(com:PriorityApplicationFilingDate)))"/>
																</PriorityDate>
																<xsl:for-each select="com:PriorityHolderName">
																	<PriorityHolderName>
																		<xsl:sequence select="fn:string(.)"/>
																	</PriorityHolderName>
																</xsl:for-each>
																<xsl:for-each select="tmk:PriorityPartialIndicator">
																	<PriorityPartialIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</PriorityPartialIndicator>
																</xsl:for-each>
																<xsl:for-each select="tmk:PriorityPartialGoodsServices">
																	<PriorityPartialGoodsServices>
																		<xsl:for-each select="tmk:ClassificationKindCode">
																			<ClassificationKindCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationKindCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:ClassificationVersion">
																			<ClassificationVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ProposedLeadingClassNumber">
																			<ProposedLeadingClassNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</ProposedLeadingClassNumber>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClassDescriptionBag">
																			<ClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var33_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var33_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var34_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var34_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var35_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var35_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var35_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var37_cur" as="node()" select="."/>
																											<xsl:variable name="var36_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var36_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var37_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</ClassDescriptionDetails>
																		</xsl:for-each>
																	</PriorityPartialGoodsServices>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityStatusCategory">
																	<xsl:variable name="var38_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf20_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var38_resultof_vmf___inputtoresult">
																		<PriorityStatusCode>
																			<xsl:sequence select="."/>
																		</PriorityStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityStatusDate">
																	<PriorityStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PriorityStatusDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityDocument">
																	<PriorityDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var39_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var39_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var40_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var40_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</PriorityDocument>
																</xsl:for-each>
															</Priority>
														</xsl:for-each>
													</PriorityDetails>
												</xsl:for-each>
												<xsl:for-each select="com:ExhibitionPriorityBag">
													<ExhibitionPriorityDetails>
														<xsl:for-each select="com:ExhibitionPriority">
															<ExhibitionPriority>
																<xsl:for-each select="com:ExhibitionCountryCode">
																	<ExhibitionCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionCountryCode>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionCityName">
																	<ExhibitionCityName>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionCityName>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionName">
																	<ExhibitionName>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionName>
																</xsl:for-each>
																<ExhibitionDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(com:ExhibitionDate)))"/>
																</ExhibitionDate>
																<xsl:for-each select="com:ExhibitionFirstDisplayDate">
																	<ExhibitionFirstDisplayDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</ExhibitionFirstDisplayDate>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionStatusCategory">
																	<xsl:variable name="var41_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf23_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var41_resultof_vmf___inputtoresult">
																		<ExhibitionStatusCode>
																			<xsl:sequence select="."/>
																		</ExhibitionStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionStatusDate">
																	<ExhibitionStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</ExhibitionStatusDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionDocument">
																	<ExhibitionDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var42_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var42_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var43_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var43_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</ExhibitionDocument>
																</xsl:for-each>
															</ExhibitionPriority>
														</xsl:for-each>
													</ExhibitionPriorityDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:SeniorityBag">
													<SeniorityDetails>
														<xsl:for-each select="tmk:Seniority">
															<Seniority>
																<SeniorityCountryCode>
																	<xsl:sequence select="fn:string(tmk:SeniorityCountryCode)"/>
																</SeniorityCountryCode>
																<xsl:for-each select="tmk:SeniorityApplicationNumber">
																	<xsl:variable name="var45_cur" as="node()" select="."/>
																	<xsl:for-each select="com:ST13ApplicationNumber">
																		<xsl:variable name="var44_cur" as="node()" select="."/>
																		<xsl:for-each select="$var45_cur/com:ApplicationNumberText">
																			<SeniorityApplicationNumber>
																				<xsl:sequence select="xs:string(fn:exists(((xs:boolean(fn:string($var44_cur)), xs:boolean(fn:string(.))))[.]))"/>
																			</SeniorityApplicationNumber>
																		</xsl:for-each>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityApplicationDate">
																	<SeniorityApplicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</SeniorityApplicationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityFilingDate">
																	<SeniorityFilingDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</SeniorityFilingDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityRegistrationNumber">
																	<SeniorityRegistrationNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</SeniorityRegistrationNumber>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityRegistrationDate">
																	<SeniorityRegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</SeniorityRegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityPublicationDate">
																	<SeniorityPublicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</SeniorityPublicationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:InternationalTrademarkCategory">
																	<xsl:variable name="var46_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf24_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var46_resultof_vmf___inputtoresult">
																		<InternationalTradeMarkCode>
																			<xsl:sequence select="."/>
																		</InternationalTradeMarkCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityPartialIndicator">
																	<SeniorityPartialIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</SeniorityPartialIndicator>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityPartialGoodsServices">
																	<SeniorityPartialGoodsServices>
																		<xsl:for-each select="tmk:ClassificationKindCode">
																			<ClassificationKindCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationKindCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:ClassificationVersion">
																			<ClassificationVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ProposedLeadingClassNumber">
																			<ProposedLeadingClassNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</ProposedLeadingClassNumber>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClassDescriptionBag">
																			<ClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var47_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var47_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var48_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var48_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var49_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var49_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var49_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var51_cur" as="node()" select="."/>
																											<xsl:variable name="var50_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var50_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var51_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</ClassDescriptionDetails>
																		</xsl:for-each>
																	</SeniorityPartialGoodsServices>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityStatusCategory">
																	<xsl:variable name="var52_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf25_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var52_resultof_vmf___inputtoresult">
																		<SeniorityStatusCode>
																			<xsl:sequence select="."/>
																		</SeniorityStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityStatusDate">
																	<SeniorityStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</SeniorityStatusDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="tmk:SeniorityDocument">
																	<SeniorityDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var53_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var53_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var54_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var54_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</SeniorityDocument>
																</xsl:for-each>
															</Seniority>
														</xsl:for-each>
													</SeniorityDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:PublicationBag">
													<PublicationDetails>
														<xsl:for-each select="tmk:Publication">
															<Publication>
																<PublicationIdentifier>
																	<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																</PublicationIdentifier>
																<xsl:for-each select="tmk:PublicationSectionCategory">
																	<xsl:variable name="var55_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf26_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var55_resultof_vmf___inputtoresult">
																		<PublicationSection>
																			<xsl:sequence select="."/>
																		</PublicationSection>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationSubsection">
																	<PublicationSubsection>
																		<xsl:sequence select="fn:string(.)"/>
																	</PublicationSubsection>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationDate">
																	<PublicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PublicationDate>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationPage">
																	<PublicationPage>
																		<xsl:sequence select="fn:string(.)"/>
																	</PublicationPage>
																</xsl:for-each>
															</Publication>
														</xsl:for-each>
													</PublicationDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:ApplicantBag">
													<ApplicantDetails>
														<xsl:for-each select="tmk:Applicant">
															<Applicant>
																<xsl:for-each select="@com:operationCategory">
																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="com:PartyIdentifier">
																	<ApplicantIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</ApplicantIdentifier>
																</xsl:for-each>
																<xsl:for-each select="@com:sequenceNumber">
																	<ApplicantSequenceNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</ApplicantSequenceNumber>
																</xsl:for-each>
																<xsl:for-each select="com:NationalityCode">
																	<ApplicantNationalityCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ApplicantNationalityCode>
																</xsl:for-each>
																<xsl:for-each select="com:LegalEntityName">
																	<ApplicantLegalEntity>
																		<xsl:sequence select="fn:string(.)"/>
																	</ApplicantLegalEntity>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationCountryCode">
																	<ApplicantIncorporationCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ApplicantIncorporationCountryCode>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationState">
																	<ApplicantIncorporationState>
																		<xsl:sequence select="fn:string(.)"/>
																	</ApplicantIncorporationState>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var56_resultof_ST__ContactToST__AddressBook" as="node()?">
																		<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																			<xsl:with-param name="Contact" as="node()">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var56_resultof_ST__ContactToST__AddressBook">
																		<ApplicantAddressBook>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</ApplicantAddressBook>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:Entitlement">
																	<ApplicantEntitlement>
																		<xsl:for-each select="com:EntitlementNationalityCode">
																			<EntitlementNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</EntitlementNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:EntitlementEstablishment">
																			<EntitlementEstablishment>
																				<EntitlementEstablishmentCode>
																					<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																				</EntitlementEstablishmentCode>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var57_resultof_ST__ContactToST__AddressBook" as="node()?">
																						<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																							<xsl:with-param name="Contact" as="node()">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var57_resultof_ST__ContactToST__AddressBook">
																						<EntitlementEstablishmentAddressBook>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</EntitlementEstablishmentAddressBook>
																					</xsl:for-each>
																				</xsl:for-each>
																			</EntitlementEstablishment>
																		</xsl:for-each>
																		<xsl:for-each select="com:EntitlementDomiciled">
																			<EntitlementDomiciled>
																				<xsl:for-each select="com:EntitlementDomiciledCode">
																					<EntitlementDomiciledCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementDomiciledCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var58_resultof_ST__ContactToST__AddressBook" as="node()?">
																						<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																							<xsl:with-param name="Contact" as="node()">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var58_resultof_ST__ContactToST__AddressBook">
																						<EntitlementDomiciledAddressBook>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</EntitlementDomiciledAddressBook>
																					</xsl:for-each>
																				</xsl:for-each>
																			</EntitlementDomiciled>
																		</xsl:for-each>
																	</ApplicantEntitlement>
																</xsl:for-each>
																<xsl:for-each select="com:Version">
																	<ApplicantVersion>
																		<xsl:for-each select="com:VersionNumber">
																			<VersionNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</VersionNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDate">
																			<VersionDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</VersionDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDateTime">
																			<VersionDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</VersionDateTime>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</ApplicantVersion>
																</xsl:for-each>
															</Applicant>
														</xsl:for-each>
													</ApplicantDetails>
												</xsl:for-each>
												<xsl:for-each select="com:RepresentativeBag">
													<RepresentativeDetails>
														<xsl:for-each select="com:Representative">
															<Representative>
																<xsl:for-each select="@com:operationCategory">
																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="com:PartyIdentifier">
																	<RepresentativeIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIdentifier>
																</xsl:for-each>
																<xsl:for-each select="@com:sequenceNumber">
																	<RepresentativeSequenceNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</RepresentativeSequenceNumber>
																</xsl:for-each>
																<xsl:for-each select="com:RepresentativeCategory">
																	<xsl:variable name="var59_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf27_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var59_resultof_vmf___inputtoresult">
																		<RepresentativeKindCode>
																			<xsl:sequence select="."/>
																		</RepresentativeKindCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:NationalityCode">
																	<RepresentativeNationalityCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeNationalityCode>
																</xsl:for-each>
																<xsl:for-each select="com:LegalEntityName">
																	<RepresentativeLegalEntity>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeLegalEntity>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationCountryCode">
																	<RepresentativeIncorporationCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIncorporationCountryCode>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationState">
																	<RepresentativeIncorporationState>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIncorporationState>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var60_resultof_ST__ContactToST__AddressBook" as="node()?">
																		<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																			<xsl:with-param name="Contact" as="node()">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var60_resultof_ST__ContactToST__AddressBook">
																		<RepresentativeAddressBook>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</RepresentativeAddressBook>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:Version">
																	<RepresentativeVersion>
																		<xsl:for-each select="com:VersionNumber">
																			<VersionNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</VersionNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDate">
																			<VersionDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</VersionDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDateTime">
																			<VersionDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</VersionDateTime>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RepresentativeVersion>
																</xsl:for-each>
															</Representative>
														</xsl:for-each>
													</RepresentativeDetails>
												</xsl:for-each>
												<xsl:for-each select="com:StaffBag">
													<StaffDetails>
														<xsl:for-each select="com:Staff">
															<Staff>
																<xsl:for-each select="com:PartyIdentifier">
																	<StaffIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</StaffIdentifier>
																</xsl:for-each>
																<xsl:for-each select="com:StaffName">
																	<StaffName>
																		<xsl:sequence select="fn:string(.)"/>
																	</StaffName>
																</xsl:for-each>
																<xsl:for-each select="com:OfficialTitleText">
																	<OfficialTitle>
																		<xsl:sequence select="fn:string(.)"/>
																	</OfficialTitle>
																</xsl:for-each>
															</Staff>
														</xsl:for-each>
													</StaffDetails>
												</xsl:for-each>
												<xsl:for-each select="com:Authorization">
													<Authorization>
														<xsl:for-each select="com:AuthorizationIdentifier">
															<AuthorizationIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</AuthorizationIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:AuthorizationDate">
															<AuthorizationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</AuthorizationDate>
														</xsl:for-each>
														<xsl:variable name="var61_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf28_inputtoresult">
																<xsl:with-param name="input" select="fn:string(com:AuthorizationCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var61_resultof_vmf___inputtoresult">
															<AuthorizationKind>
																<xsl:sequence select="."/>
															</AuthorizationKind>
														</xsl:for-each>
														<xsl:for-each select="com:CommentText">
															<Comment>
																<xsl:for-each select="@com:languageCode">
																	<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</Comment>
														</xsl:for-each>
														<xsl:for-each select="com:AuthorizationDocumentSupplyCategory">
															<xsl:variable name="var62_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf29_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var62_resultof_vmf___inputtoresult">
																<AuthorizationDocumentSupply>
																	<xsl:sequence select="."/>
																</AuthorizationDocumentSupply>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:AuthorizationDocument">
															<AuthorizationDocument>
																<DocumentName>
																	<xsl:sequence select="fn:string(com:DocumentName)"/>
																</DocumentName>
																<xsl:for-each select="com:FileName">
																	<DocumentFilename>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentFilename>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentFormatCategory">
																	<xsl:variable name="var63_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf21_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var63_resultof_vmf___inputtoresult">
																		<DocumentFileFormat>
																			<xsl:sequence select="."/>
																		</DocumentFileFormat>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentDate">
																	<DocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</DocumentDate>
																</xsl:for-each>
																<xsl:for-each select="@com:languageCode">
																	<DocumentLanguageCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentLanguageCode>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentMediaCategory">
																	<xsl:variable name="var64_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf22_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var64_resultof_vmf___inputtoresult">
																		<DocumentMedia>
																			<xsl:sequence select="."/>
																		</DocumentMedia>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentLocationURI">
																	<DocumentLocation>
																		<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																	</DocumentLocation>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentVersion">
																	<DocumentVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentVersion>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentSizeQuantity">
																	<DocumentSizeInByte>
																		<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																	</DocumentSizeInByte>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</AuthorizationDocument>
														</xsl:for-each>
													</Authorization>
												</xsl:for-each>
												<xsl:for-each select="com:CorrespondenceAddress">
													<CorrespondenceAddress>
														<xsl:for-each select="com:PartyIdentifier">
															<CorrespondenceAddressIdentifier>
																<xsl:for-each select="@com:officeCode">
																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</CorrespondenceAddressIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:CorrespondenceAddressPartyCategory">
															<xsl:variable name="var65_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf30_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var65_resultof_vmf___inputtoresult">
																<CorrespondenceAddressParty>
																	<xsl:sequence select="."/>
																</CorrespondenceAddressParty>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:Contact">
															<xsl:variable name="var66_resultof_ST__ContactToST__AddressBook" as="node()?">
																<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																	<xsl:with-param name="Contact" as="node()">
																		<com:Contact>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Contact>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var66_resultof_ST__ContactToST__AddressBook">
																<CorrespondenceAddressBook>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</CorrespondenceAddressBook>
															</xsl:for-each>
														</xsl:for-each>
													</CorrespondenceAddress>
												</xsl:for-each>
												<xsl:for-each select="tmk:OppositionBag">
													<OppositionDetails>
														<xsl:for-each select="tmk:Opposition">
															<xsl:variable name="var95_PlaintiffBag" as="node()?" select="tmk:PlaintiffBag"/>
															<Opposition>
																<xsl:for-each select="com:OppositionIdentifier">
																	<OppositionIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionIdentifier>
																</xsl:for-each>
																<OppositionDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(com:OppositionDate)))"/>
																</OppositionDate>
																<xsl:for-each select="com:OppositionReference">
																	<OppositionReference>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionReference>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionLanguageCode">
																	<OppositionLanguageCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionLanguageCode>
																</xsl:for-each>
																<xsl:for-each select="com:ProceedingLanguageCode">
																	<ProceedingLanguageCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ProceedingLanguageCode>
																</xsl:for-each>
																<xsl:for-each select="com:EarlierRightDate">
																	<EarlierRightDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</EarlierRightDate>
																</xsl:for-each>
																<xsl:for-each select="com:EarlierRightCategory">
																	<xsl:variable name="var67_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf31_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var67_resultof_vmf___inputtoresult">
																		<EarlierRightKind>
																			<xsl:sequence select="."/>
																		</EarlierRightKind>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="tmk:OppositionBasisCategory">
																	<xsl:variable name="var68_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf32_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var68_resultof_vmf___inputtoresult">
																		<OppositionBasisCode>
																			<xsl:sequence select="."/>
																		</OppositionBasisCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionGroundsText">
																	<OppositionGroundText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionGroundText>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionExtentText">
																	<OppositionExtentText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionExtentText>
																</xsl:for-each>
																<xsl:for-each select="tmk:OppositionCurrentStatusCategory">
																	<xsl:variable name="var69_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf33_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var69_resultof_vmf___inputtoresult">
																		<OppositionCurrentStatusCode>
																			<xsl:sequence select="."/>
																		</OppositionCurrentStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionCurrentStatusDate">
																	<OppositionCurrentStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</OppositionCurrentStatusDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:EarlierMarkBag">
																	<EarlierMarkDetails>
																		<xsl:for-each select="tmk:EarlierMark">
																			<EarlierMark>
																				<xsl:for-each select="tmk:EarlierMarkCountryCode">
																					<EarlierMarkCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EarlierMarkCountryCode>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:EarlierMarkCategory">
																					<xsl:variable name="var70_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf34_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var70_resultof_vmf___inputtoresult">
																						<EarlierMarkKind>
																							<xsl:sequence select="."/>
																						</EarlierMarkKind>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:ApplicationNumber/com:ApplicationNumberText">
																					<ApplicationNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicationNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:ApplicationDate">
																					<ApplicationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</ApplicationDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:RegistrationNumber">
																					<RegistrationNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</RegistrationNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:RegistrationDate">
																					<RegistrationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</RegistrationDate>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:MarkFeatureCategory">
																					<xsl:variable name="var71_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf35_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var71_resultof_vmf___inputtoresult">
																						<MarkFeature>
																							<xsl:sequence select="."/>
																						</MarkFeature>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:WordMarkSpecification">
																					<WordMarkSpecification>
																						<xsl:for-each select="tmk:MarkVerbalElementText">
																							<MarkVerbalElementText>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</MarkVerbalElementText>
																						</xsl:for-each>
																						<xsl:variable name="var72_MarkSignificantVerbalElementTe" as="node()" select="tmk:MarkSignificantVerbalElementText"/>
																						<MarkSignificantVerbalElement>
																							<xsl:for-each select="$var72_MarkSignificantVerbalElementTe/@com:languageCode">
																								<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string($var72_MarkSignificantVerbalElementTe)"/>
																						</MarkSignificantVerbalElement>
																						<xsl:for-each select="tmk:MarkVerbalElementSignificantIndicator">
																							<MarkVerbalElementSignificantIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</MarkVerbalElementSignificantIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:MarkTranslationText">
																							<MarkTranslation>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</MarkTranslation>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:MarkTransliteration">
																							<MarkTransliteration>
																								<xsl:sequence select="fn:string(.)"/>
																							</MarkTransliteration>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:MarkTranscription">
																							<MarkTranscription>
																								<xsl:sequence select="fn:string(.)"/>
																							</MarkTranscription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:MarkStandardCharacterIndicator">
																							<MarkStandardCharacterIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</MarkStandardCharacterIndicator>
																						</xsl:for-each>
																					</WordMarkSpecification>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:MarkImageBag">
																					<MarkImageDetails>
																						<xsl:for-each select="tmk:MarkImage">
																							<xsl:variable name="var81_HeightMeasure" as="node()?" select="com:HeightMeasure"/>
																							<MarkImage>
																								<MarkImageFilename>
																									<xsl:sequence select="fn:string(com:FileName)"/>
																								</MarkImageFilename>
																								<xsl:for-each select="com:ImageFormatCategory">
																									<xsl:variable name="var73_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf13_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var73_resultof_vmf___inputtoresult">
																										<MarkImageFileFormat>
																											<xsl:sequence select="."/>
																										</MarkImageFileFormat>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="com:ColourIndicator">
																									<MarkImageColourIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</MarkImageColourIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="com:ColourModeCategory">
																									<xsl:variable name="var74_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf14_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var74_resultof_vmf___inputtoresult">
																										<MarkImageColourMode>
																											<xsl:sequence select="."/>
																										</MarkImageColourMode>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:MarkImageColourClaimedText">
																									<MarkImageColourClaimedText>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</MarkImageColourClaimedText>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:MarkImageColourPartClaimedText">
																									<MarkImageColourPartClaimedText>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</MarkImageColourPartClaimedText>
																								</xsl:for-each>
																								<MarkImageRepresentationSize>
																									<xsl:for-each select="$var81_HeightMeasure">
																										<Height>
																											<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																										</Height>
																									</xsl:for-each>
																									<xsl:for-each select="com:WidthMeasure">
																										<Width>
																											<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																										</Width>
																									</xsl:for-each>
																									<xsl:for-each select="$var81_HeightMeasure">
																										<xsl:variable name="var75_resultof_vmf___inputtoresult" as="xs:string?">
																											<xsl:call-template name="vmf:vmf15_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(@com:measureUnitCode)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var75_resultof_vmf___inputtoresult">
																											<Unit>
																												<xsl:sequence select="."/>
																											</Unit>
																										</xsl:for-each>
																									</xsl:for-each>
																								</MarkImageRepresentationSize>
																								<xsl:for-each select="tmk:MarkImageClassification">
																									<xsl:variable name="var76_ViennaClassificationBag" as="node()*" select="com:FigurativeElementClassificationBag/com:ViennaClassificationBag"/>
																									<MarkImageCategory>
																										<xsl:for-each select="$var76_ViennaClassificationBag/com:ViennaClassificationEdition">
																											<CategoryVersion>
																												<xsl:sequence select="fn:string(.)"/>
																											</CategoryVersion>
																										</xsl:for-each>
																										<xsl:for-each select="$var76_ViennaClassificationBag/com:ViennaClassification">
																											<CategoryCodeDetails>
																												<CategoryCode>
																													<xsl:sequence select="fn:string(com:ViennaCategory)"/>
																												</CategoryCode>
																											</CategoryCodeDetails>
																										</xsl:for-each>
																									</MarkImageCategory>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:MarkImageQualityIndicator">
																									<MarkImageQualityIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</MarkImageQualityIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:MarkImageRenditionBag">
																									<MarkImageRenditionDetails>
																										<xsl:for-each select="tmk:MarkImageRendition">
																											<xsl:variable name="var80_HeightMeasure" as="node()" select="com:HeightMeasure"/>
																											<MarkImageRendition>
																												<xsl:for-each select="tmk:MarkImageRenditionCategory">
																													<xsl:variable name="var77_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf16_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var77_resultof_vmf___inputtoresult">
																														<MarkImageRenditionKind>
																															<xsl:sequence select="."/>
																														</MarkImageRenditionKind>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="com:FileName">
																													<MarkImageRenditionFilename>
																														<xsl:sequence select="fn:string(.)"/>
																													</MarkImageRenditionFilename>
																												</xsl:for-each>
																												<xsl:for-each select="com:ImageFormatCategory">
																													<xsl:variable name="var78_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf17_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var78_resultof_vmf___inputtoresult">
																														<MarkImageRenditionFileFormat>
																															<xsl:sequence select="."/>
																														</MarkImageRenditionFileFormat>
																													</xsl:for-each>
																												</xsl:for-each>
																												<MarkImageRenditionRepresentationSize>
																													<Height>
																														<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string($var80_HeightMeasure))))"/>
																													</Height>
																													<Width>
																														<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(com:WidthMeasure))))"/>
																													</Width>
																													<xsl:variable name="var79_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf18_inputtoresult">
																															<xsl:with-param name="input" select="fn:string($var80_HeightMeasure/@com:measureUnitCode)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var79_resultof_vmf___inputtoresult">
																														<Unit>
																															<xsl:sequence select="."/>
																														</Unit>
																													</xsl:for-each>
																												</MarkImageRenditionRepresentationSize>
																											</MarkImageRendition>
																										</xsl:for-each>
																									</MarkImageRenditionDetails>
																								</xsl:for-each>
																							</MarkImage>
																						</xsl:for-each>
																					</MarkImageDetails>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:BaseGoodsServicesBag">
																					<BaseGoodsServicesDetails>
																						<xsl:for-each select="tmk:GoodsServices">
																							<GoodsServices>
																								<xsl:for-each select="tmk:ClassificationKindCode">
																									<ClassificationKindCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationKindCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:ClassificationVersion">
																									<ClassificationVersion>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassificationVersion>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentTextBag/com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ProposedLeadingClassNumber">
																									<ProposedLeadingClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</ProposedLeadingClassNumber>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassDescriptionBag">
																									<ClassDescriptionDetails>
																										<xsl:for-each select="tmk:ClassDescription">
																											<ClassDescription>
																												<xsl:for-each select="tmk:ClassNumber">
																													<ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassNumberStatusCategory">
																													<xsl:variable name="var82_resultof_vmf__inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf8_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var82_resultof_vmf__inputtoresult">
																														<ClassNumberStatusCode>
																															<xsl:sequence select="."/>
																														</ClassNumberStatusCode>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																													<GoodsServicesDescription>
																														<xsl:for-each select="@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="@com:sequenceNumber">
																															<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</GoodsServicesDescription>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																													<UseNiceHeadingIndicator>
																														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																													</UseNiceHeadingIndicator>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermBag">
																													<ClassificationTermDetails>
																														<xsl:for-each select="tmk:ClassificationTerm">
																															<ClassificationTerm>
																																<xsl:for-each select="@com:operationCategory">
																																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermIdentifier">
																																	<ClassificationTermIdentifier>
																																		<xsl:for-each select="@com:officeCode">
																																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermIdentifier>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																																	<ClassificationTermOffice>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOffice>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																																	<ClassificationTermOfficeKey>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOfficeKey>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																																	<xsl:variable name="var83_resultof_vmf__inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf9_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var83_resultof_vmf__inputtoresult">
																																		<ClassificationTermSource>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermSource>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermEntryDate">
																																	<ClassificationTermEntryDate>
																																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																																	</ClassificationTermEntryDate>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassNumber">
																																	<ClassNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassNumber>
																																</xsl:for-each>
																																<xsl:variable name="var84_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																																<ClassificationTermText>
																																	<xsl:for-each select="$var84_ClassificationTermText/@com:languageCode">
																																		<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="fn:string($var84_ClassificationTermText)"/>
																																</ClassificationTermText>
																																<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																																	<ClassificationTermEquivalentGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermEquivalentGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																																	<ClassificationTermReferenceGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermReferenceGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																																	<ClassificationTermTranslationGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermTranslationGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermStatus">
																																	<xsl:variable name="var86_cur" as="node()" select="."/>
																																	<xsl:variable name="var85_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf10_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var85_resultof_vmf___inputtoresult">
																																		<ClassificationTermStatus>
																																			<xsl:for-each select="$var86_cur/@com:officeCode">
																																				<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																			</xsl:for-each>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermStatus>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:WIPOBasicNumber">
																																	<WIPOBasicNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</WIPOBasicNumber>
																																</xsl:for-each>
																															</ClassificationTerm>
																														</xsl:for-each>
																													</ClassificationTermDetails>
																												</xsl:for-each>
																											</ClassDescription>
																										</xsl:for-each>
																									</ClassDescriptionDetails>
																								</xsl:for-each>
																							</GoodsServices>
																						</xsl:for-each>
																					</BaseGoodsServicesDetails>
																				</xsl:for-each>
																			</EarlierMark>
																		</xsl:for-each>
																	</EarlierMarkDetails>
																</xsl:for-each>
																<OpponentDetails>
																	<xsl:for-each select="$var95_PlaintiffBag/tmk:Plaintiff">
																		<Opponent>
																			<xsl:for-each select="com:PartyIdentifier">
																				<OpponentIdentifier>
																					<xsl:for-each select="@com:officeCode">
																						<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</OpponentIdentifier>
																			</xsl:for-each>
																			<xsl:for-each select="com:NationalityCode">
																				<OpponentNationalityCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</OpponentNationalityCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:LegalEntityName">
																				<OpponentLegalEntity>
																					<xsl:sequence select="fn:string(.)"/>
																				</OpponentLegalEntity>
																			</xsl:for-each>
																			<xsl:for-each select="com:IncorporationCountryCode">
																				<OpponentIncorporationCountryCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</OpponentIncorporationCountryCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:IncorporationState">
																				<OpponentIncorporationState>
																					<xsl:sequence select="fn:string(.)"/>
																				</OpponentIncorporationState>
																			</xsl:for-each>
																			<xsl:for-each select="com:CommentText">
																				<Comment>
																					<xsl:for-each select="@com:languageCode">
																						<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</Comment>
																			</xsl:for-each>
																			<xsl:for-each select="com:Contact">
																				<xsl:variable name="var87_resultof_ST__ContactToST__AddressBook" as="node()?">
																					<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																						<xsl:with-param name="Contact" as="node()">
																							<com:Contact>
																								<xsl:sequence select="(./@node(), ./node())"/>
																							</com:Contact>
																						</xsl:with-param>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var87_resultof_ST__ContactToST__AddressBook">
																					<OpponentAddressBook>
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</OpponentAddressBook>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="tmk:Entitlement">
																				<OpponentEntitlement>
																					<xsl:for-each select="com:EntitlementNationalityCode">
																						<EntitlementNationalityCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</EntitlementNationalityCode>
																					</xsl:for-each>
																					<xsl:for-each select="com:EntitlementEstablishment">
																						<EntitlementEstablishment>
																							<EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																							</EntitlementEstablishmentCode>
																							<xsl:for-each select="com:Contact">
																								<xsl:variable name="var88_resultof_ST__ContactToST__AddressBook" as="node()?">
																									<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																										<xsl:with-param name="Contact" as="node()">
																											<com:Contact>
																												<xsl:sequence select="(./@node(), ./node())"/>
																											</com:Contact>
																										</xsl:with-param>
																									</xsl:call-template>
																								</xsl:variable>
																								<xsl:for-each select="$var88_resultof_ST__ContactToST__AddressBook">
																									<EntitlementEstablishmentAddressBook>
																										<xsl:sequence select="(./@node(), ./node())"/>
																									</EntitlementEstablishmentAddressBook>
																								</xsl:for-each>
																							</xsl:for-each>
																						</EntitlementEstablishment>
																					</xsl:for-each>
																					<xsl:for-each select="com:EntitlementDomiciled">
																						<EntitlementDomiciled>
																							<xsl:for-each select="com:EntitlementDomiciledCode">
																								<EntitlementDomiciledCode>
																									<xsl:sequence select="fn:string(.)"/>
																								</EntitlementDomiciledCode>
																							</xsl:for-each>
																							<xsl:for-each select="com:Contact">
																								<xsl:variable name="var89_resultof_ST__ContactToST__AddressBook" as="node()?">
																									<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																										<xsl:with-param name="Contact" as="node()">
																											<com:Contact>
																												<xsl:sequence select="(./@node(), ./node())"/>
																											</com:Contact>
																										</xsl:with-param>
																									</xsl:call-template>
																								</xsl:variable>
																								<xsl:for-each select="$var89_resultof_ST__ContactToST__AddressBook">
																									<EntitlementDomiciledAddressBook>
																										<xsl:sequence select="(./@node(), ./node())"/>
																									</EntitlementDomiciledAddressBook>
																								</xsl:for-each>
																							</xsl:for-each>
																						</EntitlementDomiciled>
																					</xsl:for-each>
																				</OpponentEntitlement>
																			</xsl:for-each>
																		</Opponent>
																	</xsl:for-each>
																</OpponentDetails>
																<RepresentativeDetails>
																	<xsl:for-each select="$var95_PlaintiffBag/tmk:Plaintiff/com:RepresentativeBag/com:Representative">
																		<Representative>
																			<xsl:for-each select="@com:operationCategory">
																				<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																			</xsl:for-each>
																			<xsl:for-each select="com:PartyIdentifier">
																				<RepresentativeIdentifier>
																					<xsl:for-each select="@com:officeCode">
																						<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</RepresentativeIdentifier>
																			</xsl:for-each>
																			<xsl:for-each select="@com:sequenceNumber">
																				<RepresentativeSequenceNumber>
																					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																				</RepresentativeSequenceNumber>
																			</xsl:for-each>
																			<xsl:for-each select="com:RepresentativeCategory">
																				<xsl:variable name="var90_resultof_vmf___inputtoresult" as="xs:string?">
																					<xsl:call-template name="vmf:vmf27_inputtoresult">
																						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var90_resultof_vmf___inputtoresult">
																					<RepresentativeKindCode>
																						<xsl:sequence select="."/>
																					</RepresentativeKindCode>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="com:NationalityCode">
																				<RepresentativeNationalityCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</RepresentativeNationalityCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:LegalEntityName">
																				<RepresentativeLegalEntity>
																					<xsl:sequence select="fn:string(.)"/>
																				</RepresentativeLegalEntity>
																			</xsl:for-each>
																			<xsl:for-each select="com:IncorporationCountryCode">
																				<RepresentativeIncorporationCountryCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</RepresentativeIncorporationCountryCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:IncorporationState">
																				<RepresentativeIncorporationState>
																					<xsl:sequence select="fn:string(.)"/>
																				</RepresentativeIncorporationState>
																			</xsl:for-each>
																			<xsl:for-each select="com:CommentText">
																				<Comment>
																					<xsl:for-each select="@com:languageCode">
																						<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</Comment>
																			</xsl:for-each>
																			<xsl:for-each select="com:Contact">
																				<xsl:variable name="var91_resultof_ST__ContactToST__AddressBook" as="node()?">
																					<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																						<xsl:with-param name="Contact" as="node()">
																							<com:Contact>
																								<xsl:sequence select="(./@node(), ./node())"/>
																							</com:Contact>
																						</xsl:with-param>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var91_resultof_ST__ContactToST__AddressBook">
																					<RepresentativeAddressBook>
																						<xsl:sequence select="(./@node(), ./node())"/>
																					</RepresentativeAddressBook>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="com:Version">
																				<RepresentativeVersion>
																					<xsl:for-each select="com:VersionNumber">
																						<VersionNumber>
																							<xsl:sequence select="fn:string(.)"/>
																						</VersionNumber>
																					</xsl:for-each>
																					<xsl:for-each select="com:VersionDate">
																						<VersionDate>
																							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																						</VersionDate>
																					</xsl:for-each>
																					<xsl:for-each select="com:VersionDateTime">
																						<VersionDateTime>
																							<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																						</VersionDateTime>
																					</xsl:for-each>
																					<xsl:for-each select="com:CommentText">
																						<Comment>
																							<xsl:for-each select="@com:languageCode">
																								<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</Comment>
																					</xsl:for-each>
																				</RepresentativeVersion>
																			</xsl:for-each>
																		</Representative>
																	</xsl:for-each>
																</RepresentativeDetails>
																<xsl:for-each select="tmk:OppositionEventBag">
																	<OppositionEventDetails>
																		<xsl:for-each select="tmk:OppositionEvent">
																			<OppositionEvent>
																				<xsl:for-each select="com:OppositionEventDate">
																					<OppositionEventDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</OppositionEventDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:OppositionEventDateTime">
																					<OppositionEventDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</OppositionEventDateTime>
																				</xsl:for-each>
																				<xsl:variable name="var92_resultof_vmf___inputtoresult" as="xs:string?">
																					<xsl:call-template name="vmf:vmf36_inputtoresult">
																						<xsl:with-param name="input" select="fn:string(tmk:OppositionEventCategory)" as="xs:string"/>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var92_resultof_vmf___inputtoresult">
																					<OppositionEventCode>
																						<xsl:sequence select="."/>
																					</OppositionEventCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:OppositionEventResponseDate">
																					<OppositionEventResponseDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</OppositionEventResponseDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</OppositionEvent>
																		</xsl:for-each>
																	</OppositionEventDetails>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionDocumentBag">
																	<OppositionDocumentDetails>
																		<xsl:for-each select="com:OppositionDocument">
																			<OppositionDocument>
																				<DocumentName>
																					<xsl:sequence select="fn:string(com:DocumentName)"/>
																				</DocumentName>
																				<xsl:for-each select="com:FileName">
																					<DocumentFilename>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentFilename>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentFormatCategory">
																					<xsl:variable name="var93_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf21_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var93_resultof_vmf___inputtoresult">
																						<DocumentFileFormat>
																							<xsl:sequence select="."/>
																						</DocumentFileFormat>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentDate">
																					<DocumentDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</DocumentDate>
																				</xsl:for-each>
																				<xsl:for-each select="@com:languageCode">
																					<DocumentLanguageCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentLanguageCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentMediaCategory">
																					<xsl:variable name="var94_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf22_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var94_resultof_vmf___inputtoresult">
																						<DocumentMedia>
																							<xsl:sequence select="."/>
																						</DocumentMedia>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentLocationURI">
																					<DocumentLocation>
																						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																					</DocumentLocation>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentVersion">
																					<DocumentVersion>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentVersion>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentSizeQuantity">
																					<DocumentSizeInByte>
																						<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																					</DocumentSizeInByte>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</OppositionDocument>
																		</xsl:for-each>
																	</OppositionDocumentDetails>
																</xsl:for-each>
															</Opposition>
														</xsl:for-each>
													</OppositionDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkRecordBag">
													<MarkRecordDetails>
														<xsl:for-each select="tmk:MarkRecord">
															<MarkRecord>
																<xsl:for-each select="tmk:BasicRecord">
																	<BasicRecord>
																		<RecordIdentifier>
																			<xsl:sequence select="fn:string(com:RecordIdentifier)"/>
																		</RecordIdentifier>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:BasicRecordCategory">
																			<xsl:variable name="var96_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf37_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var96_resultof_vmf___inputtoresult">
																				<BasicRecordKind>
																					<xsl:sequence select="."/>
																				</BasicRecordKind>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordReference">
																			<RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordLanguageCode">
																			<RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:TrademarkIdentification">
																			<TradeMarkKeyDetails>
																				<xsl:for-each select="tmk:TrademarkIdentifierBag">
																					<TradeMarkKey>
																						<xsl:for-each select="tmk:TrademarkIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</TradeMarkKey>
																				</xsl:for-each>
																			</TradeMarkKeyDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var97_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var97_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<ClaimantKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</ClaimantKey>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var98_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var98_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var99_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var99_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var100_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var100_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var101_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var101_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var102_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var102_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var103_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var103_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var104_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var104_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var105_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var105_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusCategory">
																			<xsl:variable name="var106_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf39_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var106_resultof_vmf___inputtoresult">
																				<RecordCurrentStatusCode>
																					<xsl:sequence select="."/>
																				</RecordCurrentStatusCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusDate">
																			<RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordInterestedOfficeCode">
																			<RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDesignatedCountryCodeBag">
																			<RecordDesignatedCountryDetails>
																				<xsl:for-each select="com:RecordDesignatedCountryCode">
																					<RecordDesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</RecordDesignatedCountryCode>
																				</xsl:for-each>
																			</RecordDesignatedCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordUseIntentBag">
																			<RecordUseIntentDetails>
																				<xsl:for-each select="tmk:RecordUseIntentCountryCode">
																					<RecordUseIntentCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</RecordUseIntentCountryCode>
																				</xsl:for-each>
																			</RecordUseIntentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationBag">
																			<GoodsServicesLimitationDetails>
																				<xsl:for-each select="tmk:GoodsServicesLimitation">
																					<GoodsServicesLimitation>
																						<xsl:for-each select="com:LimitationCountryCodeBag">
																							<LimitationCountryDetails>
																								<xsl:for-each select="com:LimitationCountryCode">
																									<LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</LimitationCountryCode>
																								</xsl:for-each>
																							</LimitationCountryDetails>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																							<xsl:variable name="var107_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf40_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var107_resultof_vmf___inputtoresult">
																								<GoodsServicesLimitationCode>
																									<xsl:sequence select="."/>
																								</GoodsServicesLimitationCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentTextBag/com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																							<LimitationClassDescriptionDetails>
																								<xsl:for-each select="tmk:ClassDescription">
																									<ClassDescription>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumberStatusCategory">
																											<xsl:variable name="var108_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf8_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var108_resultof_vmf__inputtoresult">
																												<ClassNumberStatusCode>
																													<xsl:sequence select="."/>
																												</ClassNumberStatusCode>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																											<GoodsServicesDescription>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@com:sequenceNumber">
																													<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</GoodsServicesDescription>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																											<UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermBag">
																											<ClassificationTermDetails>
																												<xsl:for-each select="tmk:ClassificationTerm">
																													<ClassificationTerm>
																														<xsl:for-each select="@com:operationCategory">
																															<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermIdentifier">
																															<ClassificationTermIdentifier>
																																<xsl:for-each select="@com:officeCode">
																																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																															<ClassificationTermOffice>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOffice>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																															<ClassificationTermOfficeKey>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOfficeKey>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																															<xsl:variable name="var109_resultof_vmf__inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf9_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var109_resultof_vmf__inputtoresult">
																																<ClassificationTermSource>
																																	<xsl:sequence select="."/>
																																</ClassificationTermSource>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermEntryDate">
																															<ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassNumber">
																															<ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassNumber>
																														</xsl:for-each>
																														<xsl:variable name="var110_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																														<ClassificationTermText>
																															<xsl:for-each select="$var110_ClassificationTermText/@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string($var110_ClassificationTermText)"/>
																														</ClassificationTermText>
																														<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																															<ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																															<ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																															<ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermStatus">
																															<xsl:variable name="var112_cur" as="node()" select="."/>
																															<xsl:variable name="var111_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf10_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var111_resultof_vmf___inputtoresult">
																																<ClassificationTermStatus>
																																	<xsl:for-each select="$var112_cur/@com:officeCode">
																																		<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:WIPOBasicNumber">
																															<WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</WIPOBasicNumber>
																														</xsl:for-each>
																													</ClassificationTerm>
																												</xsl:for-each>
																											</ClassificationTermDetails>
																										</xsl:for-each>
																									</ClassDescription>
																								</xsl:for-each>
																							</LimitationClassDescriptionDetails>
																						</xsl:for-each>
																					</GoodsServicesLimitation>
																				</xsl:for-each>
																			</GoodsServicesLimitationDetails>
																		</xsl:for-each>
																	</BasicRecord>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordOppositionPeriod">
																	<RecordOppositionPeriod>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var113_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf41_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(tmk:RecordOppositionPeriodCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var113_resultof_vmf___inputtoresult">
																			<RecordOppositionPeriodKind>
																				<xsl:sequence select="."/>
																			</RecordOppositionPeriodKind>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:TrademarkIdentification">
																			<TradeMarkKeyDetails>
																				<xsl:for-each select="tmk:TrademarkIdentifierBag">
																					<TradeMarkKey>
																						<xsl:for-each select="tmk:TrademarkIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</TradeMarkKey>
																				</xsl:for-each>
																			</TradeMarkKeyDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var114_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var114_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordInterestedOfficeCode">
																			<RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordOppositionPeriodStartDate">
																			<RecordOppositionPeriodStartDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordOppositionPeriodStartDate>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordOppositionPeriodEndDate">
																			<RecordOppositionPeriodEndDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordOppositionPeriodEndDate>
																		</xsl:for-each>
																	</RecordOppositionPeriod>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordTransfer">
																	<RecordTransfer>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var115_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf42_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordTransferCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var115_resultof_vmf___inputtoresult">
																			<RecordTransferKind>
																				<xsl:sequence select="."/>
																			</RecordTransferKind>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordReference">
																			<RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordLanguageCode">
																			<RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:TrademarkIdentification">
																			<TradeMarkKeyDetails>
																				<xsl:for-each select="tmk:TrademarkIdentifierBag">
																					<TradeMarkKey>
																						<xsl:for-each select="tmk:TrademarkIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</TradeMarkKey>
																				</xsl:for-each>
																			</TradeMarkKeyDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var116_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var116_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<ClaimantKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</ClaimantKey>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var117_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var117_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var118_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var118_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var119_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var119_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var120_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var120_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var121_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var121_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var122_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var122_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var123_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var123_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var124_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var124_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusCategory">
																			<xsl:variable name="var125_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf43_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var125_resultof_vmf___inputtoresult">
																				<RecordCurrentStatusCode>
																					<xsl:sequence select="."/>
																				</RecordCurrentStatusCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusDate">
																			<RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CorrespondenceAddress">
																			<CorrespondenceAddress>
																				<xsl:for-each select="com:PartyIdentifier">
																					<CorrespondenceAddressIdentifier>
																						<xsl:for-each select="@com:officeCode">
																							<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</CorrespondenceAddressIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="com:CorrespondenceAddressPartyCategory">
																					<xsl:variable name="var126_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf30_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var126_resultof_vmf___inputtoresult">
																						<CorrespondenceAddressParty>
																							<xsl:sequence select="."/>
																						</CorrespondenceAddressParty>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var127_resultof_ST__ContactToST__AddressBook" as="node()?">
																						<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																							<xsl:with-param name="Contact" as="node()">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var127_resultof_ST__ContactToST__AddressBook">
																						<CorrespondenceAddressBook>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</CorrespondenceAddressBook>
																					</xsl:for-each>
																				</xsl:for-each>
																			</CorrespondenceAddress>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:HolderChangeBag">
																			<HolderDetails>
																				<xsl:for-each select="tmk:PreviousHolderBag/tmk:PreviousHolder">
																					<PreviousHolder>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ApplicantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ApplicantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ApplicantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ApplicantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ApplicantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ApplicantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ApplicantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var128_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var128_resultof_ST__ContactToST__AddressBook">
																								<ApplicantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ApplicantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var129_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var129_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var130_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var130_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ApplicantEntitlement>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<ApplicantVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</ApplicantVersion>
																						</xsl:for-each>
																					</PreviousHolder>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:HolderBag/tmk:Holder">
																					<NewHolder>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ApplicantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ApplicantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ApplicantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ApplicantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ApplicantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ApplicantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ApplicantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var131_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var131_resultof_ST__ContactToST__AddressBook">
																								<ApplicantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ApplicantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var132_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var132_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var133_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var133_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ApplicantEntitlement>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<ApplicantVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</ApplicantVersion>
																						</xsl:for-each>
																					</NewHolder>
																				</xsl:for-each>
																			</HolderDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationBag">
																			<GoodsServicesLimitationDetails>
																				<xsl:for-each select="tmk:GoodsServicesLimitation">
																					<GoodsServicesLimitation>
																						<xsl:for-each select="com:LimitationCountryCodeBag">
																							<LimitationCountryDetails>
																								<xsl:for-each select="com:LimitationCountryCode">
																									<LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</LimitationCountryCode>
																								</xsl:for-each>
																							</LimitationCountryDetails>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																							<xsl:variable name="var134_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf40_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var134_resultof_vmf___inputtoresult">
																								<GoodsServicesLimitationCode>
																									<xsl:sequence select="."/>
																								</GoodsServicesLimitationCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentTextBag/com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																							<LimitationClassDescriptionDetails>
																								<xsl:for-each select="tmk:ClassDescription">
																									<ClassDescription>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumberStatusCategory">
																											<xsl:variable name="var135_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf8_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var135_resultof_vmf__inputtoresult">
																												<ClassNumberStatusCode>
																													<xsl:sequence select="."/>
																												</ClassNumberStatusCode>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																											<GoodsServicesDescription>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@com:sequenceNumber">
																													<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</GoodsServicesDescription>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																											<UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermBag">
																											<ClassificationTermDetails>
																												<xsl:for-each select="tmk:ClassificationTerm">
																													<ClassificationTerm>
																														<xsl:for-each select="@com:operationCategory">
																															<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermIdentifier">
																															<ClassificationTermIdentifier>
																																<xsl:for-each select="@com:officeCode">
																																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																															<ClassificationTermOffice>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOffice>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																															<ClassificationTermOfficeKey>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOfficeKey>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																															<xsl:variable name="var136_resultof_vmf__inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf9_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var136_resultof_vmf__inputtoresult">
																																<ClassificationTermSource>
																																	<xsl:sequence select="."/>
																																</ClassificationTermSource>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermEntryDate">
																															<ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassNumber">
																															<ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassNumber>
																														</xsl:for-each>
																														<xsl:variable name="var137_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																														<ClassificationTermText>
																															<xsl:for-each select="$var137_ClassificationTermText/@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string($var137_ClassificationTermText)"/>
																														</ClassificationTermText>
																														<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																															<ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																															<ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																															<ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermStatus">
																															<xsl:variable name="var139_cur" as="node()" select="."/>
																															<xsl:variable name="var138_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf10_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var138_resultof_vmf___inputtoresult">
																																<ClassificationTermStatus>
																																	<xsl:for-each select="$var139_cur/@com:officeCode">
																																		<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:WIPOBasicNumber">
																															<WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</WIPOBasicNumber>
																														</xsl:for-each>
																													</ClassificationTerm>
																												</xsl:for-each>
																											</ClassificationTermDetails>
																										</xsl:for-each>
																									</ClassDescription>
																								</xsl:for-each>
																							</LimitationClassDescriptionDetails>
																						</xsl:for-each>
																					</GoodsServicesLimitation>
																				</xsl:for-each>
																			</GoodsServicesLimitationDetails>
																		</xsl:for-each>
																	</RecordTransfer>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordChangeNameAddress">
																	<RecordChangeNameAddress>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var140_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf44_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordChangeNameAddressCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var140_resultof_vmf___inputtoresult">
																			<RecordChangeNameAddressKind>
																				<xsl:sequence select="."/>
																			</RecordChangeNameAddressKind>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordReference">
																			<RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordLanguageCode">
																			<RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:TrademarkIdentification">
																			<TradeMarkKeyDetails>
																				<xsl:for-each select="tmk:TrademarkIdentifierBag">
																					<TradeMarkKey>
																						<xsl:for-each select="tmk:TrademarkIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</TradeMarkKey>
																				</xsl:for-each>
																			</TradeMarkKeyDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var141_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var141_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<ClaimantKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</ClaimantKey>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var142_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var142_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var143_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var143_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var144_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var144_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var145_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var145_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var146_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var146_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var147_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var147_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var148_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var148_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var149_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var149_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusCategory">
																			<xsl:variable name="var150_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf45_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var150_resultof_vmf___inputtoresult">
																				<RecordCurrentStatusCode>
																					<xsl:sequence select="."/>
																				</RecordCurrentStatusCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusDate">
																			<RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CorrespondenceAddress">
																			<CorrespondenceAddress>
																				<xsl:for-each select="com:PartyIdentifier">
																					<CorrespondenceAddressIdentifier>
																						<xsl:for-each select="@com:officeCode">
																							<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</CorrespondenceAddressIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="com:CorrespondenceAddressPartyCategory">
																					<xsl:variable name="var151_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf30_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var151_resultof_vmf___inputtoresult">
																						<CorrespondenceAddressParty>
																							<xsl:sequence select="."/>
																						</CorrespondenceAddressParty>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var152_resultof_ST__ContactToST__AddressBook" as="node()?">
																						<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																							<xsl:with-param name="Contact" as="node()">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var152_resultof_ST__ContactToST__AddressBook">
																						<CorrespondenceAddressBook>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</CorrespondenceAddressBook>
																					</xsl:for-each>
																				</xsl:for-each>
																			</CorrespondenceAddress>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:HolderChangeBag">
																			<HolderDetails>
																				<xsl:for-each select="tmk:PreviousHolderBag/tmk:PreviousHolder">
																					<PreviousHolder>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ApplicantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ApplicantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ApplicantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ApplicantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ApplicantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ApplicantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ApplicantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var153_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var153_resultof_ST__ContactToST__AddressBook">
																								<ApplicantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ApplicantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var154_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var154_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var155_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var155_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ApplicantEntitlement>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<ApplicantVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</ApplicantVersion>
																						</xsl:for-each>
																					</PreviousHolder>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:HolderBag/tmk:Holder">
																					<NewHolder>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ApplicantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ApplicantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ApplicantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ApplicantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ApplicantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ApplicantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ApplicantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var156_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var156_resultof_ST__ContactToST__AddressBook">
																								<ApplicantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ApplicantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var157_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var157_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var158_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var158_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ApplicantEntitlement>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<ApplicantVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</ApplicantVersion>
																						</xsl:for-each>
																					</NewHolder>
																				</xsl:for-each>
																			</HolderDetails>
																		</xsl:for-each>
																	</RecordChangeNameAddress>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordLicence">
																	<RecordLicence>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<RecordEffectiveDate>
																			<xsl:sequence select="xs:string(xs:date(fn:string(com:RecordEffectiveDate)))"/>
																		</RecordEffectiveDate>
																		<xsl:variable name="var159_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf46_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordLicenceCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var159_resultof_vmf___inputtoresult">
																			<RecordLicenceKind>
																				<xsl:sequence select="."/>
																			</RecordLicenceKind>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordReference">
																			<RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordLanguageCode">
																			<RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:TrademarkIdentification">
																			<TradeMarkKeyDetails>
																				<xsl:for-each select="tmk:TrademarkIdentifierBag">
																					<TradeMarkKey>
																						<xsl:for-each select="tmk:TrademarkIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</TradeMarkKey>
																				</xsl:for-each>
																			</TradeMarkKeyDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var160_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var160_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<ClaimantKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</ClaimantKey>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var161_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var161_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var162_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var162_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var163_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var163_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var164_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var164_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var165_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var165_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var166_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var166_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var167_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var167_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var168_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var168_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusCategory">
																			<xsl:variable name="var169_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf47_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var169_resultof_vmf___inputtoresult">
																				<RecordCurrentStatusCode>
																					<xsl:sequence select="."/>
																				</RecordCurrentStatusCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordCurrentStatusDate">
																			<RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordInterestedOfficeCode">
																			<RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDesignatedCountryCodeBag">
																			<RecordDesignatedCountryDetails>
																				<xsl:for-each select="com:RecordDesignatedCountryCode">
																					<RecordDesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</RecordDesignatedCountryCode>
																				</xsl:for-each>
																			</RecordDesignatedCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:LicenceBag">
																			<LicenceDetails>
																				<xsl:for-each select="tmk:Licence">
																					<Licence>
																						<xsl:for-each select="com:LicenceIdentifier">
																							<LicenceIdentifier>
																								<xsl:sequence select="fn:string(.)"/>
																							</LicenceIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceDate">
																							<LicenceDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</LicenceDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceNumber">
																							<LicenceNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</LicenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceReference">
																							<LicenceReference>
																								<xsl:sequence select="fn:string(.)"/>
																							</LicenceReference>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceCategory">
																							<xsl:variable name="var170_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf48_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var170_resultof_vmf___inputtoresult">
																								<LicenceKind>
																									<xsl:sequence select="."/>
																								</LicenceKind>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:SublicenceIndicator">
																							<SubLicenceIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</SubLicenceIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="com:RelatedLicenceIdentifier">
																							<RelatedLicenceIdentifier>
																								<xsl:sequence select="fn:string(.)"/>
																							</RelatedLicenceIdentifier>
																						</xsl:for-each>
																						<GoodsServicesLimitationIndicator>
																							<xsl:sequence select="xs:string(xs:boolean(fn:string(tmk:GoodsServicesLimitationIndicator)))"/>
																						</GoodsServicesLimitationIndicator>
																						<xsl:for-each select="tmk:GoodsServicesLimitation">
																							<GoodsServicesLimitation>
																								<xsl:for-each select="com:LimitationCountryCodeBag">
																									<LimitationCountryDetails>
																										<xsl:for-each select="com:LimitationCountryCode">
																											<LimitationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</LimitationCountryCode>
																										</xsl:for-each>
																									</LimitationCountryDetails>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																									<xsl:variable name="var171_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf40_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var171_resultof_vmf___inputtoresult">
																										<GoodsServicesLimitationCode>
																											<xsl:sequence select="."/>
																										</GoodsServicesLimitationCode>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentTextBag/com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																									<LimitationClassDescriptionDetails>
																										<xsl:for-each select="tmk:ClassDescription">
																											<ClassDescription>
																												<xsl:for-each select="tmk:ClassNumber">
																													<ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassNumberStatusCategory">
																													<xsl:variable name="var172_resultof_vmf__inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf8_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var172_resultof_vmf__inputtoresult">
																														<ClassNumberStatusCode>
																															<xsl:sequence select="."/>
																														</ClassNumberStatusCode>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																													<GoodsServicesDescription>
																														<xsl:for-each select="@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="@com:sequenceNumber">
																															<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</GoodsServicesDescription>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																													<UseNiceHeadingIndicator>
																														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																													</UseNiceHeadingIndicator>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermBag">
																													<ClassificationTermDetails>
																														<xsl:for-each select="tmk:ClassificationTerm">
																															<ClassificationTerm>
																																<xsl:for-each select="@com:operationCategory">
																																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermIdentifier">
																																	<ClassificationTermIdentifier>
																																		<xsl:for-each select="@com:officeCode">
																																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermIdentifier>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																																	<ClassificationTermOffice>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOffice>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																																	<ClassificationTermOfficeKey>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOfficeKey>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																																	<xsl:variable name="var173_resultof_vmf__inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf9_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var173_resultof_vmf__inputtoresult">
																																		<ClassificationTermSource>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermSource>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermEntryDate">
																																	<ClassificationTermEntryDate>
																																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																																	</ClassificationTermEntryDate>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassNumber">
																																	<ClassNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassNumber>
																																</xsl:for-each>
																																<xsl:variable name="var174_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																																<ClassificationTermText>
																																	<xsl:for-each select="$var174_ClassificationTermText/@com:languageCode">
																																		<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="fn:string($var174_ClassificationTermText)"/>
																																</ClassificationTermText>
																																<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																																	<ClassificationTermEquivalentGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermEquivalentGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																																	<ClassificationTermReferenceGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermReferenceGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																																	<ClassificationTermTranslationGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermTranslationGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermStatus">
																																	<xsl:variable name="var176_cur" as="node()" select="."/>
																																	<xsl:variable name="var175_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf10_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var175_resultof_vmf___inputtoresult">
																																		<ClassificationTermStatus>
																																			<xsl:for-each select="$var176_cur/@com:officeCode">
																																				<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																			</xsl:for-each>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermStatus>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:WIPOBasicNumber">
																																	<WIPOBasicNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</WIPOBasicNumber>
																																</xsl:for-each>
																															</ClassificationTerm>
																														</xsl:for-each>
																													</ClassificationTermDetails>
																												</xsl:for-each>
																											</ClassDescription>
																										</xsl:for-each>
																									</LimitationClassDescriptionDetails>
																								</xsl:for-each>
																							</GoodsServicesLimitation>
																						</xsl:for-each>
																						<xsl:for-each select="com:TerritoryLimitationIndicator">
																							<TerritoryLimitationIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</TerritoryLimitationIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="com:TerritoryLimitationText">
																							<TerritoryLimitationText>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</TerritoryLimitationText>
																						</xsl:for-each>
																						<xsl:for-each select="com:PeriodLimitationIndicator">
																							<PeriodLimitationIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</PeriodLimitationIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="com:PeriodLimitationText">
																							<PeriodLimitationText>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</PeriodLimitationText>
																						</xsl:for-each>
																						<xsl:for-each select="com:PeriodLimitationStartDate">
																							<PeriodLimitationStartDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PeriodLimitationStartDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PeriodLimitationEndDate">
																							<PeriodLimitationEndDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PeriodLimitationEndDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceStatusCategory">
																							<xsl:variable name="var177_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf49_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var177_resultof_vmf___inputtoresult">
																								<LicenceStatusCode>
																									<xsl:sequence select="."/>
																								</LicenceStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<LicenseeDetails>
																							<xsl:for-each select="tmk:LicenseeBag/tmk:Licensee">
																								<Licensee>
																									<xsl:for-each select="@com:operationCategory">
																										<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:for-each select="com:PartyIdentifier">
																										<LicenseeIdentifier>
																											<xsl:for-each select="@com:officeCode">
																												<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string(.)"/>
																										</LicenseeIdentifier>
																									</xsl:for-each>
																									<xsl:for-each select="@com:sequenceNumber">
																										<LicenseeSequenceNumber>
																											<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																										</LicenseeSequenceNumber>
																									</xsl:for-each>
																									<xsl:for-each select="com:NationalityCode">
																										<LicenseeNationalityCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</LicenseeNationalityCode>
																									</xsl:for-each>
																									<xsl:for-each select="com:LegalEntityName">
																										<LicenseeLegalEntity>
																											<xsl:sequence select="fn:string(.)"/>
																										</LicenseeLegalEntity>
																									</xsl:for-each>
																									<xsl:for-each select="com:IncorporationCountryCode">
																										<LicenseeIncorporationCountryCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</LicenseeIncorporationCountryCode>
																									</xsl:for-each>
																									<xsl:for-each select="com:IncorporationState">
																										<LicenseeIncorporationState>
																											<xsl:sequence select="fn:string(.)"/>
																										</LicenseeIncorporationState>
																									</xsl:for-each>
																									<xsl:for-each select="com:CommentText">
																										<Comment>
																											<xsl:for-each select="@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string(.)"/>
																										</Comment>
																									</xsl:for-each>
																									<xsl:for-each select="com:Contact">
																										<xsl:variable name="var178_resultof_ST__ContactToST__AddressBook" as="node()?">
																											<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																												<xsl:with-param name="Contact" as="node()">
																													<com:Contact>
																														<xsl:sequence select="(./@node(), ./node())"/>
																													</com:Contact>
																												</xsl:with-param>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var178_resultof_ST__ContactToST__AddressBook">
																											<LicenseeAddressBook>
																												<xsl:sequence select="(./@node(), ./node())"/>
																											</LicenseeAddressBook>
																										</xsl:for-each>
																									</xsl:for-each>
																									<xsl:for-each select="tmk:Entitlement">
																										<LicenseeEntitlement>
																											<xsl:for-each select="com:EntitlementNationalityCode">
																												<EntitlementNationalityCode>
																													<xsl:sequence select="fn:string(.)"/>
																												</EntitlementNationalityCode>
																											</xsl:for-each>
																											<xsl:for-each select="com:EntitlementEstablishment">
																												<EntitlementEstablishment>
																													<EntitlementEstablishmentCode>
																														<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																													</EntitlementEstablishmentCode>
																													<xsl:for-each select="com:Contact">
																														<xsl:variable name="var179_resultof_ST__ContactToST__AddressBook" as="node()?">
																															<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																																<xsl:with-param name="Contact" as="node()">
																																	<com:Contact>
																																		<xsl:sequence select="(./@node(), ./node())"/>
																																	</com:Contact>
																																</xsl:with-param>
																															</xsl:call-template>
																														</xsl:variable>
																														<xsl:for-each select="$var179_resultof_ST__ContactToST__AddressBook">
																															<EntitlementEstablishmentAddressBook>
																																<xsl:sequence select="(./@node(), ./node())"/>
																															</EntitlementEstablishmentAddressBook>
																														</xsl:for-each>
																													</xsl:for-each>
																												</EntitlementEstablishment>
																											</xsl:for-each>
																											<xsl:for-each select="com:EntitlementDomiciled">
																												<EntitlementDomiciled>
																													<xsl:for-each select="com:EntitlementDomiciledCode">
																														<EntitlementDomiciledCode>
																															<xsl:sequence select="fn:string(.)"/>
																														</EntitlementDomiciledCode>
																													</xsl:for-each>
																													<xsl:for-each select="com:Contact">
																														<xsl:variable name="var180_resultof_ST__ContactToST__AddressBook" as="node()?">
																															<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																																<xsl:with-param name="Contact" as="node()">
																																	<com:Contact>
																																		<xsl:sequence select="(./@node(), ./node())"/>
																																	</com:Contact>
																																</xsl:with-param>
																															</xsl:call-template>
																														</xsl:variable>
																														<xsl:for-each select="$var180_resultof_ST__ContactToST__AddressBook">
																															<EntitlementDomiciledAddressBook>
																																<xsl:sequence select="(./@node(), ./node())"/>
																															</EntitlementDomiciledAddressBook>
																														</xsl:for-each>
																													</xsl:for-each>
																												</EntitlementDomiciled>
																											</xsl:for-each>
																										</LicenseeEntitlement>
																									</xsl:for-each>
																								</Licensee>
																							</xsl:for-each>
																						</LicenseeDetails>
																						<xsl:for-each select="com:RepresentativeBag">
																							<RepresentativeDetails>
																								<xsl:for-each select="com:Representative">
																									<Representative>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="com:PartyIdentifier">
																											<RepresentativeIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</RepresentativeIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<RepresentativeSequenceNumber>
																												<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																											</RepresentativeSequenceNumber>
																										</xsl:for-each>
																										<xsl:for-each select="com:RepresentativeCategory">
																											<xsl:variable name="var181_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf27_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var181_resultof_vmf___inputtoresult">
																												<RepresentativeKindCode>
																													<xsl:sequence select="."/>
																												</RepresentativeKindCode>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="com:NationalityCode">
																											<RepresentativeNationalityCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</RepresentativeNationalityCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:LegalEntityName">
																											<RepresentativeLegalEntity>
																												<xsl:sequence select="fn:string(.)"/>
																											</RepresentativeLegalEntity>
																										</xsl:for-each>
																										<xsl:for-each select="com:IncorporationCountryCode">
																											<RepresentativeIncorporationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</RepresentativeIncorporationCountryCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:IncorporationState">
																											<RepresentativeIncorporationState>
																												<xsl:sequence select="fn:string(.)"/>
																											</RepresentativeIncorporationState>
																										</xsl:for-each>
																										<xsl:for-each select="com:CommentText">
																											<Comment>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</Comment>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var182_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var182_resultof_ST__ContactToST__AddressBook">
																												<RepresentativeAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</RepresentativeAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="com:Version">
																											<RepresentativeVersion>
																												<xsl:for-each select="com:VersionNumber">
																													<VersionNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</VersionNumber>
																												</xsl:for-each>
																												<xsl:for-each select="com:VersionDate">
																													<VersionDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</VersionDate>
																												</xsl:for-each>
																												<xsl:for-each select="com:VersionDateTime">
																													<VersionDateTime>
																														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																													</VersionDateTime>
																												</xsl:for-each>
																												<xsl:for-each select="com:CommentText">
																													<Comment>
																														<xsl:for-each select="@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</Comment>
																												</xsl:for-each>
																											</RepresentativeVersion>
																										</xsl:for-each>
																									</Representative>
																								</xsl:for-each>
																							</RepresentativeDetails>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceEventBag">
																							<LicenceEventDetails>
																								<xsl:for-each select="com:LicenceEvent">
																									<LicenceEvent>
																										<xsl:for-each select="com:LicenceEventDate">
																											<LicenceEventDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</LicenceEventDate>
																										</xsl:for-each>
																										<xsl:for-each select="com:LicenceEventDateTime">
																											<LicenceEventDateTime>
																												<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																											</LicenceEventDateTime>
																										</xsl:for-each>
																										<xsl:variable name="var183_resultof_vmf___inputtoresult" as="xs:string?">
																											<xsl:call-template name="vmf:vmf50_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(com:LicenceEventCategory)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var183_resultof_vmf___inputtoresult">
																											<LicenceEventCode>
																												<xsl:sequence select="."/>
																											</LicenceEventCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:LicenceEventResponseDate">
																											<LicenceEventResponseDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</LicenceEventResponseDate>
																										</xsl:for-each>
																										<xsl:for-each select="com:CommentText">
																											<Comment>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</Comment>
																										</xsl:for-each>
																									</LicenceEvent>
																								</xsl:for-each>
																							</LicenceEventDetails>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceDocumentBag">
																							<LicenceDocumentDetails>
																								<xsl:for-each select="com:LicenceDocument">
																									<LicenceDocument>
																										<DocumentName>
																											<xsl:sequence select="fn:string(com:DocumentName)"/>
																										</DocumentName>
																										<xsl:for-each select="com:FileName">
																											<DocumentFilename>
																												<xsl:sequence select="fn:string(.)"/>
																											</DocumentFilename>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentFormatCategory">
																											<xsl:variable name="var184_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf21_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var184_resultof_vmf___inputtoresult">
																												<DocumentFileFormat>
																													<xsl:sequence select="."/>
																												</DocumentFileFormat>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentDate">
																											<DocumentDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</DocumentDate>
																										</xsl:for-each>
																										<xsl:for-each select="@com:languageCode">
																											<DocumentLanguageCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</DocumentLanguageCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentMediaCategory">
																											<xsl:variable name="var185_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf22_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var185_resultof_vmf___inputtoresult">
																												<DocumentMedia>
																													<xsl:sequence select="."/>
																												</DocumentMedia>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentLocationURI">
																											<DocumentLocation>
																												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																											</DocumentLocation>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentVersion">
																											<DocumentVersion>
																												<xsl:sequence select="fn:string(.)"/>
																											</DocumentVersion>
																										</xsl:for-each>
																										<xsl:for-each select="com:DocumentSizeQuantity">
																											<DocumentSizeInByte>
																												<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																											</DocumentSizeInByte>
																										</xsl:for-each>
																										<xsl:for-each select="com:CommentText">
																											<Comment>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</Comment>
																										</xsl:for-each>
																									</LicenceDocument>
																								</xsl:for-each>
																							</LicenceDocumentDetails>
																						</xsl:for-each>
																					</Licence>
																				</xsl:for-each>
																			</LicenceDetails>
																		</xsl:for-each>
																	</RecordLicence>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordNationalInternationalReplacement">
																	<RecordNationalInternationalReplacement>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<TradeMarkKeyDetails>
																			<xsl:for-each select="tmk:TrademarkIdentification/tmk:TrademarkIdentifierBag">
																				<TradeMarkKey>
																					<xsl:for-each select="tmk:TrademarkIdentifier">
																						<Identifier>
																							<xsl:for-each select="@com:officeCode">
																								<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</Identifier>
																					</xsl:for-each>
																				</TradeMarkKey>
																			</xsl:for-each>
																		</TradeMarkKeyDetails>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var186_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var186_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<ClaimantKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</ClaimantKey>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var187_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var187_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var188_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var188_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var189_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var189_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var190_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var190_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var191_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var191_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var192_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var192_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var193_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var193_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var194_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var194_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordInterestedOfficeCode">
																			<RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationBag">
																			<GoodsServicesLimitationDetails>
																				<xsl:for-each select="tmk:GoodsServicesLimitation">
																					<GoodsServicesLimitation>
																						<xsl:for-each select="com:LimitationCountryCodeBag">
																							<LimitationCountryDetails>
																								<xsl:for-each select="com:LimitationCountryCode">
																									<LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</LimitationCountryCode>
																								</xsl:for-each>
																							</LimitationCountryDetails>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																							<xsl:variable name="var195_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf40_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var195_resultof_vmf___inputtoresult">
																								<GoodsServicesLimitationCode>
																									<xsl:sequence select="."/>
																								</GoodsServicesLimitationCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentTextBag/com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																							<LimitationClassDescriptionDetails>
																								<xsl:for-each select="tmk:ClassDescription">
																									<ClassDescription>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumberStatusCategory">
																											<xsl:variable name="var196_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf8_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var196_resultof_vmf__inputtoresult">
																												<ClassNumberStatusCode>
																													<xsl:sequence select="."/>
																												</ClassNumberStatusCode>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																											<GoodsServicesDescription>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@com:sequenceNumber">
																													<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</GoodsServicesDescription>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																											<UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermBag">
																											<ClassificationTermDetails>
																												<xsl:for-each select="tmk:ClassificationTerm">
																													<ClassificationTerm>
																														<xsl:for-each select="@com:operationCategory">
																															<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermIdentifier">
																															<ClassificationTermIdentifier>
																																<xsl:for-each select="@com:officeCode">
																																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																															<ClassificationTermOffice>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOffice>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																															<ClassificationTermOfficeKey>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOfficeKey>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																															<xsl:variable name="var197_resultof_vmf__inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf9_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var197_resultof_vmf__inputtoresult">
																																<ClassificationTermSource>
																																	<xsl:sequence select="."/>
																																</ClassificationTermSource>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermEntryDate">
																															<ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassNumber">
																															<ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassNumber>
																														</xsl:for-each>
																														<xsl:variable name="var198_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																														<ClassificationTermText>
																															<xsl:for-each select="$var198_ClassificationTermText/@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string($var198_ClassificationTermText)"/>
																														</ClassificationTermText>
																														<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																															<ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																															<ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																															<ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermStatus">
																															<xsl:variable name="var200_cur" as="node()" select="."/>
																															<xsl:variable name="var199_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf10_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var199_resultof_vmf___inputtoresult">
																																<ClassificationTermStatus>
																																	<xsl:for-each select="$var200_cur/@com:officeCode">
																																		<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:WIPOBasicNumber">
																															<WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</WIPOBasicNumber>
																														</xsl:for-each>
																													</ClassificationTerm>
																												</xsl:for-each>
																											</ClassificationTermDetails>
																										</xsl:for-each>
																									</ClassDescription>
																								</xsl:for-each>
																							</LimitationClassDescriptionDetails>
																						</xsl:for-each>
																					</GoodsServicesLimitation>
																				</xsl:for-each>
																			</GoodsServicesLimitationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:NationalMarkBag">
																			<NationalMarkDetails>
																				<xsl:for-each select="tmk:NationalMark">
																					<NationalMark>
																						<xsl:for-each select="tmk:NationalMarkRegistrationNumber">
																							<NationalMarkRegistrationNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</NationalMarkRegistrationNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:NationalMarkFilingDate">
																							<NationalMarkFilingDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</NationalMarkFilingDate>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:NationalMarkRegistrationDate">
																							<NationalMarkRegistrationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</NationalMarkRegistrationDate>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:NationalMarkPriorityDate">
																							<NationalMarkPriorityDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</NationalMarkPriorityDate>
																						</xsl:for-each>
																					</NationalMark>
																				</xsl:for-each>
																			</NationalMarkDetails>
																		</xsl:for-each>
																	</RecordNationalInternationalReplacement>
																</xsl:for-each>
																<xsl:for-each select="tmk:RecordShortNotation">
																	<RecordShortNotation>
																		<xsl:for-each select="com:RecordIdentifier">
																			<RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordFilingDate">
																			<RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordNotificationDate">
																			<RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEffectiveDate">
																			<RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var201_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf51_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(tmk:RecordShortNotationCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var201_resultof_vmf___inputtoresult">
																			<RecordShortNotationKind>
																				<xsl:sequence select="."/>
																			</RecordShortNotationKind>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordReference">
																			<RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordLanguageCode">
																			<RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordPublicationBag">
																			<RecordPublicationDetails>
																				<xsl:for-each select="tmk:RecordPublication">
																					<RecordPublication>
																						<PublicationIdentifier>
																							<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																						</PublicationIdentifier>
																						<xsl:for-each select="tmk:PublicationSectionCategory">
																							<xsl:variable name="var202_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf26_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var202_resultof_vmf___inputtoresult">
																								<PublicationSection>
																									<xsl:sequence select="."/>
																								</PublicationSection>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationSubsection">
																							<PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationDate">
																							<PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:PublicationPage">
																							<PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</PublicationPage>
																						</xsl:for-each>
																					</RecordPublication>
																				</xsl:for-each>
																			</RecordPublicationDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ClaimantBag">
																			<ClaimantDetails>
																				<xsl:for-each select="tmk:Claimant">
																					<Claimant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ClaimantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ClaimantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ClaimantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ClaimantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ClaimantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ClaimantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ClaimantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClaimantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var203_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var203_resultof_ST__ContactToST__AddressBook">
																								<ClaimantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ClaimantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ClaimantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var204_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var204_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var205_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var205_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ClaimantEntitlement>
																						</xsl:for-each>
																					</Claimant>
																				</xsl:for-each>
																			</ClaimantDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:PartyIdentifierBag">
																					<RepresentativeKey>
																						<xsl:for-each select="com:PartyIdentifier">
																							<Identifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Identifier>
																						</xsl:for-each>
																					</RepresentativeKey>
																				</xsl:for-each>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var206_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var206_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var207_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var207_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventBag">
																			<RecordEventDetails>
																				<xsl:for-each select="com:RecordEvent">
																					<RecordEvent>
																						<xsl:for-each select="com:RecordEventDate">
																							<RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventDateTime">
																							<RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</RecordEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var208_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf38_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var208_resultof_vmf___inputtoresult">
																							<RecordEventCode>
																								<xsl:sequence select="."/>
																							</RecordEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:RecordEventResponseDate">
																							<RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordEvent>
																				</xsl:for-each>
																			</RecordEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordDocumentBag">
																			<RecordDocumentDetails>
																				<xsl:for-each select="com:RecordDocument">
																					<RecordDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var209_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var209_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var210_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var210_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</RecordDocument>
																				</xsl:for-each>
																			</RecordDocumentDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordInterestedOfficeCode">
																			<RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordToRegistration">
																			<RecordToRegistration>
																				<RegistrationIdentifier>
																					<xsl:sequence select="fn:string(tmk:RegistrationIdentifier)"/>
																				</RegistrationIdentifier>
																				<xsl:for-each select="com:RegistrationDate">
																					<RegistrationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</RegistrationDate>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:MarkVerbalElementText">
																					<MarkVerbalElementText>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</MarkVerbalElementText>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:DesignatedCountryCodeBag">
																					<DesignatedCountryDetails>
																						<xsl:for-each select="com:DesignatedCountryCode">
																							<DesignatedCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DesignatedCountryCode>
																						</xsl:for-each>
																					</DesignatedCountryDetails>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:GoodsServicesLimitation">
																					<GoodsServicesLimitation>
																						<xsl:for-each select="com:LimitationCountryCodeBag">
																							<LimitationCountryDetails>
																								<xsl:for-each select="com:LimitationCountryCode">
																									<LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</LimitationCountryCode>
																								</xsl:for-each>
																							</LimitationCountryDetails>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																							<xsl:variable name="var211_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf40_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var211_resultof_vmf___inputtoresult">
																								<GoodsServicesLimitationCode>
																									<xsl:sequence select="."/>
																								</GoodsServicesLimitationCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentTextBag/com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																							<LimitationClassDescriptionDetails>
																								<xsl:for-each select="tmk:ClassDescription">
																									<ClassDescription>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumberStatusCategory">
																											<xsl:variable name="var212_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf8_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var212_resultof_vmf__inputtoresult">
																												<ClassNumberStatusCode>
																													<xsl:sequence select="."/>
																												</ClassNumberStatusCode>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																											<GoodsServicesDescription>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@com:sequenceNumber">
																													<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</GoodsServicesDescription>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																											<UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermBag">
																											<ClassificationTermDetails>
																												<xsl:for-each select="tmk:ClassificationTerm">
																													<ClassificationTerm>
																														<xsl:for-each select="@com:operationCategory">
																															<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermIdentifier">
																															<ClassificationTermIdentifier>
																																<xsl:for-each select="@com:officeCode">
																																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																															<ClassificationTermOffice>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOffice>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																															<ClassificationTermOfficeKey>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermOfficeKey>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																															<xsl:variable name="var213_resultof_vmf__inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf9_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var213_resultof_vmf__inputtoresult">
																																<ClassificationTermSource>
																																	<xsl:sequence select="."/>
																																</ClassificationTermSource>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermEntryDate">
																															<ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassNumber">
																															<ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassNumber>
																														</xsl:for-each>
																														<xsl:variable name="var214_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																														<ClassificationTermText>
																															<xsl:for-each select="$var214_ClassificationTermText/@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string($var214_ClassificationTermText)"/>
																														</ClassificationTermText>
																														<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																															<ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																															<ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																															<ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:ClassificationTermStatus">
																															<xsl:variable name="var216_cur" as="node()" select="."/>
																															<xsl:variable name="var215_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf10_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var215_resultof_vmf___inputtoresult">
																																<ClassificationTermStatus>
																																	<xsl:for-each select="$var216_cur/@com:officeCode">
																																		<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="tmk:WIPOBasicNumber">
																															<WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</WIPOBasicNumber>
																														</xsl:for-each>
																													</ClassificationTerm>
																												</xsl:for-each>
																											</ClassificationTermDetails>
																										</xsl:for-each>
																									</ClassDescription>
																								</xsl:for-each>
																							</LimitationClassDescriptionDetails>
																						</xsl:for-each>
																					</GoodsServicesLimitation>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:ApplicantBag">
																					<ApplicantDetails>
																						<xsl:for-each select="tmk:Applicant">
																							<Applicant>
																								<xsl:for-each select="@com:operationCategory">
																									<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="com:PartyIdentifier">
																									<ApplicantIdentifier>
																										<xsl:for-each select="@com:officeCode">
																											<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</ApplicantIdentifier>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<ApplicantSequenceNumber>
																										<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																									</ApplicantSequenceNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:NationalityCode">
																									<ApplicantNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</ApplicantNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:LegalEntityName">
																									<ApplicantLegalEntity>
																										<xsl:sequence select="fn:string(.)"/>
																									</ApplicantLegalEntity>
																								</xsl:for-each>
																								<xsl:for-each select="com:IncorporationCountryCode">
																									<ApplicantIncorporationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</ApplicantIncorporationCountryCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:IncorporationState">
																									<ApplicantIncorporationState>
																										<xsl:sequence select="fn:string(.)"/>
																									</ApplicantIncorporationState>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var217_resultof_ST__ContactToST__AddressBook" as="node()?">
																										<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																											<xsl:with-param name="Contact" as="node()">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:with-param>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var217_resultof_ST__ContactToST__AddressBook">
																										<ApplicantAddressBook>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</ApplicantAddressBook>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:Entitlement">
																									<ApplicantEntitlement>
																										<xsl:for-each select="com:EntitlementNationalityCode">
																											<EntitlementNationalityCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementNationalityCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:EntitlementEstablishment">
																											<EntitlementEstablishment>
																												<EntitlementEstablishmentCode>
																													<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																												</EntitlementEstablishmentCode>
																												<xsl:for-each select="com:Contact">
																													<xsl:variable name="var218_resultof_ST__ContactToST__AddressBook" as="node()?">
																														<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																															<xsl:with-param name="Contact" as="node()">
																																<com:Contact>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</com:Contact>
																															</xsl:with-param>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var218_resultof_ST__ContactToST__AddressBook">
																														<EntitlementEstablishmentAddressBook>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</EntitlementEstablishmentAddressBook>
																													</xsl:for-each>
																												</xsl:for-each>
																											</EntitlementEstablishment>
																										</xsl:for-each>
																										<xsl:for-each select="com:EntitlementDomiciled">
																											<EntitlementDomiciled>
																												<xsl:for-each select="com:EntitlementDomiciledCode">
																													<EntitlementDomiciledCode>
																														<xsl:sequence select="fn:string(.)"/>
																													</EntitlementDomiciledCode>
																												</xsl:for-each>
																												<xsl:for-each select="com:Contact">
																													<xsl:variable name="var219_resultof_ST__ContactToST__AddressBook" as="node()?">
																														<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																															<xsl:with-param name="Contact" as="node()">
																																<com:Contact>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</com:Contact>
																															</xsl:with-param>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var219_resultof_ST__ContactToST__AddressBook">
																														<EntitlementDomiciledAddressBook>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</EntitlementDomiciledAddressBook>
																													</xsl:for-each>
																												</xsl:for-each>
																											</EntitlementDomiciled>
																										</xsl:for-each>
																									</ApplicantEntitlement>
																								</xsl:for-each>
																								<xsl:for-each select="com:Version">
																									<ApplicantVersion>
																										<xsl:for-each select="com:VersionNumber">
																											<VersionNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</VersionNumber>
																										</xsl:for-each>
																										<xsl:for-each select="com:VersionDate">
																											<VersionDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</VersionDate>
																										</xsl:for-each>
																										<xsl:for-each select="com:VersionDateTime">
																											<VersionDateTime>
																												<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																											</VersionDateTime>
																										</xsl:for-each>
																										<xsl:for-each select="com:CommentText">
																											<Comment>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</Comment>
																										</xsl:for-each>
																									</ApplicantVersion>
																								</xsl:for-each>
																							</Applicant>
																						</xsl:for-each>
																					</ApplicantDetails>
																				</xsl:for-each>
																			</RecordToRegistration>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:RecordFromRegistrationBag">
																			<RecordFromRegistrationDetails>
																				<xsl:for-each select="tmk:RecordFromRegistration">
																					<RecordFromRegistration>
																						<RegistrationIdentifier>
																							<xsl:sequence select="fn:string(tmk:RegistrationIdentifier)"/>
																						</RegistrationIdentifier>
																						<xsl:for-each select="com:RegistrationDate">
																							<RegistrationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</RegistrationDate>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:MarkVerbalElementText">
																							<MarkVerbalElementText>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</MarkVerbalElementText>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:DesignatedCountryCodeBag">
																							<DesignatedCountryDetails>
																								<xsl:for-each select="com:DesignatedCountryCode">
																									<DesignatedCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</DesignatedCountryCode>
																								</xsl:for-each>
																							</DesignatedCountryDetails>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesLimitation">
																							<GoodsServicesLimitation>
																								<xsl:for-each select="com:LimitationCountryCodeBag">
																									<LimitationCountryDetails>
																										<xsl:for-each select="com:LimitationCountryCode">
																											<LimitationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</LimitationCountryCode>
																										</xsl:for-each>
																									</LimitationCountryDetails>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																									<xsl:variable name="var220_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf40_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var220_resultof_vmf___inputtoresult">
																										<GoodsServicesLimitationCode>
																											<xsl:sequence select="."/>
																										</GoodsServicesLimitationCode>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentTextBag/com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																									<LimitationClassDescriptionDetails>
																										<xsl:for-each select="tmk:ClassDescription">
																											<ClassDescription>
																												<xsl:for-each select="tmk:ClassNumber">
																													<ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassNumberStatusCategory">
																													<xsl:variable name="var221_resultof_vmf__inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf8_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var221_resultof_vmf__inputtoresult">
																														<ClassNumberStatusCode>
																															<xsl:sequence select="."/>
																														</ClassNumberStatusCode>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																													<GoodsServicesDescription>
																														<xsl:for-each select="@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="@com:sequenceNumber">
																															<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</GoodsServicesDescription>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																													<UseNiceHeadingIndicator>
																														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																													</UseNiceHeadingIndicator>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermBag">
																													<ClassificationTermDetails>
																														<xsl:for-each select="tmk:ClassificationTerm">
																															<ClassificationTerm>
																																<xsl:for-each select="@com:operationCategory">
																																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermIdentifier">
																																	<ClassificationTermIdentifier>
																																		<xsl:for-each select="@com:officeCode">
																																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermIdentifier>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																																	<ClassificationTermOffice>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOffice>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																																	<ClassificationTermOfficeKey>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermOfficeKey>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																																	<xsl:variable name="var222_resultof_vmf__inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf9_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var222_resultof_vmf__inputtoresult">
																																		<ClassificationTermSource>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermSource>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermEntryDate">
																																	<ClassificationTermEntryDate>
																																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																																	</ClassificationTermEntryDate>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassNumber">
																																	<ClassNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassNumber>
																																</xsl:for-each>
																																<xsl:variable name="var223_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																																<ClassificationTermText>
																																	<xsl:for-each select="$var223_ClassificationTermText/@com:languageCode">
																																		<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="fn:string($var223_ClassificationTermText)"/>
																																</ClassificationTermText>
																																<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																																	<ClassificationTermEquivalentGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermEquivalentGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																																	<ClassificationTermReferenceGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermReferenceGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																																	<ClassificationTermTranslationGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</ClassificationTermTranslationGroup>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:ClassificationTermStatus">
																																	<xsl:variable name="var225_cur" as="node()" select="."/>
																																	<xsl:variable name="var224_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf10_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var224_resultof_vmf___inputtoresult">
																																		<ClassificationTermStatus>
																																			<xsl:for-each select="$var225_cur/@com:officeCode">
																																				<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																																			</xsl:for-each>
																																			<xsl:sequence select="."/>
																																		</ClassificationTermStatus>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="tmk:WIPOBasicNumber">
																																	<WIPOBasicNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</WIPOBasicNumber>
																																</xsl:for-each>
																															</ClassificationTerm>
																														</xsl:for-each>
																													</ClassificationTermDetails>
																												</xsl:for-each>
																											</ClassDescription>
																										</xsl:for-each>
																									</LimitationClassDescriptionDetails>
																								</xsl:for-each>
																							</GoodsServicesLimitation>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ApplicantBag">
																							<ApplicantDetails>
																								<xsl:for-each select="tmk:Applicant">
																									<Applicant>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="com:PartyIdentifier">
																											<ApplicantIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ApplicantIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<ApplicantSequenceNumber>
																												<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																											</ApplicantSequenceNumber>
																										</xsl:for-each>
																										<xsl:for-each select="com:NationalityCode">
																											<ApplicantNationalityCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</ApplicantNationalityCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:LegalEntityName">
																											<ApplicantLegalEntity>
																												<xsl:sequence select="fn:string(.)"/>
																											</ApplicantLegalEntity>
																										</xsl:for-each>
																										<xsl:for-each select="com:IncorporationCountryCode">
																											<ApplicantIncorporationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</ApplicantIncorporationCountryCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:IncorporationState">
																											<ApplicantIncorporationState>
																												<xsl:sequence select="fn:string(.)"/>
																											</ApplicantIncorporationState>
																										</xsl:for-each>
																										<xsl:for-each select="com:CommentText">
																											<Comment>
																												<xsl:for-each select="@com:languageCode">
																													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</Comment>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var226_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var226_resultof_ST__ContactToST__AddressBook">
																												<ApplicantAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</ApplicantAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:Entitlement">
																											<ApplicantEntitlement>
																												<xsl:for-each select="com:EntitlementNationalityCode">
																													<EntitlementNationalityCode>
																														<xsl:sequence select="fn:string(.)"/>
																													</EntitlementNationalityCode>
																												</xsl:for-each>
																												<xsl:for-each select="com:EntitlementEstablishment">
																													<EntitlementEstablishment>
																														<EntitlementEstablishmentCode>
																															<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																														</EntitlementEstablishmentCode>
																														<xsl:for-each select="com:Contact">
																															<xsl:variable name="var227_resultof_ST__ContactToST__AddressBook" as="node()?">
																																<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																																	<xsl:with-param name="Contact" as="node()">
																																		<com:Contact>
																																			<xsl:sequence select="(./@node(), ./node())"/>
																																		</com:Contact>
																																	</xsl:with-param>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var227_resultof_ST__ContactToST__AddressBook">
																																<EntitlementEstablishmentAddressBook>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</EntitlementEstablishmentAddressBook>
																															</xsl:for-each>
																														</xsl:for-each>
																													</EntitlementEstablishment>
																												</xsl:for-each>
																												<xsl:for-each select="com:EntitlementDomiciled">
																													<EntitlementDomiciled>
																														<xsl:for-each select="com:EntitlementDomiciledCode">
																															<EntitlementDomiciledCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</EntitlementDomiciledCode>
																														</xsl:for-each>
																														<xsl:for-each select="com:Contact">
																															<xsl:variable name="var228_resultof_ST__ContactToST__AddressBook" as="node()?">
																																<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																																	<xsl:with-param name="Contact" as="node()">
																																		<com:Contact>
																																			<xsl:sequence select="(./@node(), ./node())"/>
																																		</com:Contact>
																																	</xsl:with-param>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var228_resultof_ST__ContactToST__AddressBook">
																																<EntitlementDomiciledAddressBook>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</EntitlementDomiciledAddressBook>
																															</xsl:for-each>
																														</xsl:for-each>
																													</EntitlementDomiciled>
																												</xsl:for-each>
																											</ApplicantEntitlement>
																										</xsl:for-each>
																										<xsl:for-each select="com:Version">
																											<ApplicantVersion>
																												<xsl:for-each select="com:VersionNumber">
																													<VersionNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</VersionNumber>
																												</xsl:for-each>
																												<xsl:for-each select="com:VersionDate">
																													<VersionDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</VersionDate>
																												</xsl:for-each>
																												<xsl:for-each select="com:VersionDateTime">
																													<VersionDateTime>
																														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																													</VersionDateTime>
																												</xsl:for-each>
																												<xsl:for-each select="com:CommentText">
																													<Comment>
																														<xsl:for-each select="@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</Comment>
																												</xsl:for-each>
																											</ApplicantVersion>
																										</xsl:for-each>
																									</Applicant>
																								</xsl:for-each>
																							</ApplicantDetails>
																						</xsl:for-each>
																					</RecordFromRegistration>
																				</xsl:for-each>
																			</RecordFromRegistrationDetails>
																		</xsl:for-each>
																	</RecordShortNotation>
																</xsl:for-each>
															</MarkRecord>
														</xsl:for-each>
													</MarkRecordDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:MarkEventBag">
													<MarkEventDetails>
														<xsl:for-each select="tmk:MarkEvent">
															<MarkEvent>
																<xsl:for-each select="tmk:MarkEventDate">
																	<MarkEventDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</MarkEventDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkEventDateTime">
																	<MarkEventDateTime>
																		<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																	</MarkEventDateTime>
																</xsl:for-each>
																<xsl:variable name="var229_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf52_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(tmk:MarkEventCategory)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var229_resultof_vmf___inputtoresult">
																	<MarkEventCode>
																		<xsl:sequence select="."/>
																	</MarkEventCode>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkEventResponseDate">
																	<MarkEventResponseDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</MarkEventResponseDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</MarkEvent>
														</xsl:for-each>
													</MarkEventDetails>
												</xsl:for-each>
												<xsl:for-each select="tmk:TrademarkDocumentBag">
													<TradeMarkDocumentDetails>
														<xsl:for-each select="tmk:TrademarkDocument">
															<TradeMarkDocument>
																<DocumentName>
																	<xsl:sequence select="fn:string(com:DocumentName)"/>
																</DocumentName>
																<xsl:for-each select="com:FileName">
																	<DocumentFilename>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentFilename>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentFormatCategory">
																	<DocumentFileFormat>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentFileFormat>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentDate">
																	<DocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</DocumentDate>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentMediaCategory">
																	<DocumentMedia>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentMedia>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentLocationURI">
																	<DocumentLocation>
																		<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																	</DocumentLocation>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentVersion">
																	<DocumentVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</DocumentVersion>
																</xsl:for-each>
																<xsl:for-each select="com:DocumentSizeQuantity">
																	<DocumentSizeInByte>
																		<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																	</DocumentSizeInByte>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</TradeMarkDocument>
														</xsl:for-each>
													</TradeMarkDocumentDetails>
												</xsl:for-each>
												<xsl:for-each select="com:Version">
													<TradeMarkVersion>
														<xsl:for-each select="com:VersionNumber">
															<VersionNumber>
																<xsl:sequence select="fn:string(.)"/>
															</VersionNumber>
														</xsl:for-each>
														<xsl:for-each select="com:VersionDate">
															<VersionDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</VersionDate>
														</xsl:for-each>
														<xsl:for-each select="com:VersionDateTime">
															<VersionDateTime>
																<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
															</VersionDateTime>
														</xsl:for-each>
														<xsl:for-each select="com:CommentText">
															<Comment>
																<xsl:for-each select="@com:languageCode">
																	<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</Comment>
														</xsl:for-each>
													</TradeMarkVersion>
												</xsl:for-each>
											</TradeMark>
										</xsl:for-each>
									</TradeMarkDetails>
								</xsl:for-each>
								<xsl:for-each select="$var365_TransactionData/tmk:MarkRecordBag">
									<MarkRecordDetails>
										<xsl:for-each select="tmk:MarkRecord">
											<MarkRecord>
												<xsl:for-each select="tmk:BasicRecord">
													<BasicRecord>
														<RecordIdentifier>
															<xsl:sequence select="fn:string(com:RecordIdentifier)"/>
														</RecordIdentifier>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="tmk:BasicRecordCategory">
															<xsl:variable name="var232_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf37_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var232_resultof_vmf___inputtoresult">
																<BasicRecordKind>
																	<xsl:sequence select="."/>
																</BasicRecordKind>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:RecordReference">
															<RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</RecordReference>
														</xsl:for-each>
														<xsl:for-each select="com:RecordLanguageCode">
															<RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:TrademarkIdentification">
															<TradeMarkKeyDetails>
																<xsl:for-each select="tmk:TrademarkIdentifierBag">
																	<TradeMarkKey>
																		<xsl:for-each select="tmk:TrademarkIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</TradeMarkKey>
																</xsl:for-each>
															</TradeMarkKeyDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var233_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var233_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<ClaimantKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</ClaimantKey>
																</xsl:for-each>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var234_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var234_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var235_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var235_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var236_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var236_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var237_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var237_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var238_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var238_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var239_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var239_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var240_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var240_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var241_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var241_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusCategory">
															<xsl:variable name="var242_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf39_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var242_resultof_vmf___inputtoresult">
																<RecordCurrentStatusCode>
																	<xsl:sequence select="."/>
																</RecordCurrentStatusCode>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusDate">
															<RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordInterestedOfficeCode">
															<RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDesignatedCountryCodeBag">
															<RecordDesignatedCountryDetails>
																<xsl:for-each select="com:RecordDesignatedCountryCode">
																	<RecordDesignatedCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RecordDesignatedCountryCode>
																</xsl:for-each>
															</RecordDesignatedCountryDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordUseIntentBag">
															<RecordUseIntentDetails>
																<xsl:for-each select="tmk:RecordUseIntentCountryCode">
																	<RecordUseIntentCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RecordUseIntentCountryCode>
																</xsl:for-each>
															</RecordUseIntentDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:GoodsServicesLimitationBag">
															<GoodsServicesLimitationDetails>
																<xsl:for-each select="tmk:GoodsServicesLimitation">
																	<GoodsServicesLimitation>
																		<xsl:for-each select="com:LimitationCountryCodeBag">
																			<LimitationCountryDetails>
																				<xsl:for-each select="com:LimitationCountryCode">
																					<LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</LimitationCountryCode>
																				</xsl:for-each>
																			</LimitationCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																			<xsl:variable name="var243_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf40_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var243_resultof_vmf___inputtoresult">
																				<GoodsServicesLimitationCode>
																					<xsl:sequence select="."/>
																				</GoodsServicesLimitationCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																			<LimitationClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var244_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var244_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var245_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var245_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var246_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var246_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var246_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var248_cur" as="node()" select="."/>
																											<xsl:variable name="var247_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var247_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var248_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</LimitationClassDescriptionDetails>
																		</xsl:for-each>
																	</GoodsServicesLimitation>
																</xsl:for-each>
															</GoodsServicesLimitationDetails>
														</xsl:for-each>
													</BasicRecord>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordOppositionPeriod">
													<RecordOppositionPeriod>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var249_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf41_inputtoresult">
																<xsl:with-param name="input" select="fn:string(tmk:RecordOppositionPeriodCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var249_resultof_vmf___inputtoresult">
															<RecordOppositionPeriodKind>
																<xsl:sequence select="."/>
															</RecordOppositionPeriodKind>
														</xsl:for-each>
														<xsl:for-each select="tmk:TrademarkIdentification">
															<TradeMarkKeyDetails>
																<xsl:for-each select="tmk:TrademarkIdentifierBag">
																	<TradeMarkKey>
																		<xsl:for-each select="tmk:TrademarkIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</TradeMarkKey>
																</xsl:for-each>
															</TradeMarkKeyDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var250_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var250_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordInterestedOfficeCode">
															<RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordOppositionPeriodStartDate">
															<RecordOppositionPeriodStartDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordOppositionPeriodStartDate>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordOppositionPeriodEndDate">
															<RecordOppositionPeriodEndDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordOppositionPeriodEndDate>
														</xsl:for-each>
													</RecordOppositionPeriod>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordTransfer">
													<RecordTransfer>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var251_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf42_inputtoresult">
																<xsl:with-param name="input" select="fn:string(com:RecordTransferCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var251_resultof_vmf___inputtoresult">
															<RecordTransferKind>
																<xsl:sequence select="."/>
															</RecordTransferKind>
														</xsl:for-each>
														<xsl:for-each select="com:RecordReference">
															<RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</RecordReference>
														</xsl:for-each>
														<xsl:for-each select="com:RecordLanguageCode">
															<RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:TrademarkIdentification">
															<TradeMarkKeyDetails>
																<xsl:for-each select="tmk:TrademarkIdentifierBag">
																	<TradeMarkKey>
																		<xsl:for-each select="tmk:TrademarkIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</TradeMarkKey>
																</xsl:for-each>
															</TradeMarkKeyDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var252_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var252_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<ClaimantKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</ClaimantKey>
																</xsl:for-each>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var253_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var253_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var254_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var254_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var255_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var255_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var256_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var256_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var257_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var257_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var258_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var258_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var259_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var259_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var260_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var260_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusCategory">
															<xsl:variable name="var261_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf43_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var261_resultof_vmf___inputtoresult">
																<RecordCurrentStatusCode>
																	<xsl:sequence select="."/>
																</RecordCurrentStatusCode>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusDate">
															<RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="com:CorrespondenceAddress">
															<CorrespondenceAddress>
																<xsl:for-each select="com:PartyIdentifier">
																	<CorrespondenceAddressIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</CorrespondenceAddressIdentifier>
																</xsl:for-each>
																<xsl:for-each select="com:CorrespondenceAddressPartyCategory">
																	<xsl:variable name="var262_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf30_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var262_resultof_vmf___inputtoresult">
																		<CorrespondenceAddressParty>
																			<xsl:sequence select="."/>
																		</CorrespondenceAddressParty>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var263_resultof_ST__ContactToST__AddressBook" as="node()?">
																		<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																			<xsl:with-param name="Contact" as="node()">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var263_resultof_ST__ContactToST__AddressBook">
																		<CorrespondenceAddressBook>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</CorrespondenceAddressBook>
																	</xsl:for-each>
																</xsl:for-each>
															</CorrespondenceAddress>
														</xsl:for-each>
														<xsl:for-each select="tmk:HolderChangeBag">
															<HolderDetails>
																<xsl:for-each select="tmk:PreviousHolderBag/tmk:PreviousHolder">
																	<PreviousHolder>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ApplicantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ApplicantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ApplicantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ApplicantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ApplicantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ApplicantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ApplicantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var264_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var264_resultof_ST__ContactToST__AddressBook">
																				<ApplicantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ApplicantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var265_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var265_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var266_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var266_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ApplicantEntitlement>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<ApplicantVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</ApplicantVersion>
																		</xsl:for-each>
																	</PreviousHolder>
																</xsl:for-each>
																<xsl:for-each select="tmk:HolderBag/tmk:Holder">
																	<NewHolder>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ApplicantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ApplicantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ApplicantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ApplicantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ApplicantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ApplicantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ApplicantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var267_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var267_resultof_ST__ContactToST__AddressBook">
																				<ApplicantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ApplicantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var268_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var268_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var269_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var269_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ApplicantEntitlement>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<ApplicantVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</ApplicantVersion>
																		</xsl:for-each>
																	</NewHolder>
																</xsl:for-each>
															</HolderDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:GoodsServicesLimitationBag">
															<GoodsServicesLimitationDetails>
																<xsl:for-each select="tmk:GoodsServicesLimitation">
																	<GoodsServicesLimitation>
																		<xsl:for-each select="com:LimitationCountryCodeBag">
																			<LimitationCountryDetails>
																				<xsl:for-each select="com:LimitationCountryCode">
																					<LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</LimitationCountryCode>
																				</xsl:for-each>
																			</LimitationCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																			<xsl:variable name="var270_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf40_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var270_resultof_vmf___inputtoresult">
																				<GoodsServicesLimitationCode>
																					<xsl:sequence select="."/>
																				</GoodsServicesLimitationCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																			<LimitationClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var271_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var271_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var272_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var272_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var273_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var273_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var273_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var275_cur" as="node()" select="."/>
																											<xsl:variable name="var274_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var274_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var275_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</LimitationClassDescriptionDetails>
																		</xsl:for-each>
																	</GoodsServicesLimitation>
																</xsl:for-each>
															</GoodsServicesLimitationDetails>
														</xsl:for-each>
													</RecordTransfer>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordChangeNameAddress">
													<RecordChangeNameAddress>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var276_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf44_inputtoresult">
																<xsl:with-param name="input" select="fn:string(com:RecordChangeNameAddressCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var276_resultof_vmf___inputtoresult">
															<RecordChangeNameAddressKind>
																<xsl:sequence select="."/>
															</RecordChangeNameAddressKind>
														</xsl:for-each>
														<xsl:for-each select="com:RecordReference">
															<RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</RecordReference>
														</xsl:for-each>
														<xsl:for-each select="com:RecordLanguageCode">
															<RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:TrademarkIdentification">
															<TradeMarkKeyDetails>
																<xsl:for-each select="tmk:TrademarkIdentifierBag">
																	<TradeMarkKey>
																		<xsl:for-each select="tmk:TrademarkIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</TradeMarkKey>
																</xsl:for-each>
															</TradeMarkKeyDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var277_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var277_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<ClaimantKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</ClaimantKey>
																</xsl:for-each>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var278_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var278_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var279_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var279_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var280_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var280_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var281_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var281_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var282_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var282_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var283_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var283_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var284_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var284_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var285_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var285_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusCategory">
															<xsl:variable name="var286_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf45_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var286_resultof_vmf___inputtoresult">
																<RecordCurrentStatusCode>
																	<xsl:sequence select="."/>
																</RecordCurrentStatusCode>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusDate">
															<RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="com:CorrespondenceAddress">
															<CorrespondenceAddress>
																<xsl:for-each select="com:PartyIdentifier">
																	<CorrespondenceAddressIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</CorrespondenceAddressIdentifier>
																</xsl:for-each>
																<xsl:for-each select="com:CorrespondenceAddressPartyCategory">
																	<xsl:variable name="var287_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf30_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var287_resultof_vmf___inputtoresult">
																		<CorrespondenceAddressParty>
																			<xsl:sequence select="."/>
																		</CorrespondenceAddressParty>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var288_resultof_ST__ContactToST__AddressBook" as="node()?">
																		<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																			<xsl:with-param name="Contact" as="node()">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var288_resultof_ST__ContactToST__AddressBook">
																		<CorrespondenceAddressBook>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</CorrespondenceAddressBook>
																	</xsl:for-each>
																</xsl:for-each>
															</CorrespondenceAddress>
														</xsl:for-each>
														<xsl:for-each select="tmk:HolderChangeBag">
															<HolderDetails>
																<xsl:for-each select="tmk:PreviousHolderBag/tmk:PreviousHolder">
																	<PreviousHolder>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ApplicantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ApplicantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ApplicantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ApplicantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ApplicantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ApplicantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ApplicantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var289_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var289_resultof_ST__ContactToST__AddressBook">
																				<ApplicantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ApplicantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var290_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var290_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var291_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var291_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ApplicantEntitlement>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<ApplicantVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</ApplicantVersion>
																		</xsl:for-each>
																	</PreviousHolder>
																</xsl:for-each>
																<xsl:for-each select="tmk:HolderBag/tmk:Holder">
																	<NewHolder>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ApplicantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ApplicantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ApplicantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ApplicantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ApplicantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ApplicantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ApplicantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ApplicantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var292_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var292_resultof_ST__ContactToST__AddressBook">
																				<ApplicantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ApplicantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var293_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var293_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var294_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var294_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ApplicantEntitlement>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<ApplicantVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</ApplicantVersion>
																		</xsl:for-each>
																	</NewHolder>
																</xsl:for-each>
															</HolderDetails>
														</xsl:for-each>
													</RecordChangeNameAddress>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordLicence">
													<RecordLicence>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<RecordEffectiveDate>
															<xsl:sequence select="xs:string(xs:date(fn:string(com:RecordEffectiveDate)))"/>
														</RecordEffectiveDate>
														<xsl:variable name="var295_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf46_inputtoresult">
																<xsl:with-param name="input" select="fn:string(com:RecordLicenceCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var295_resultof_vmf___inputtoresult">
															<RecordLicenceKind>
																<xsl:sequence select="."/>
															</RecordLicenceKind>
														</xsl:for-each>
														<xsl:for-each select="com:RecordReference">
															<RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</RecordReference>
														</xsl:for-each>
														<xsl:for-each select="com:RecordLanguageCode">
															<RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:TrademarkIdentification">
															<TradeMarkKeyDetails>
																<xsl:for-each select="tmk:TrademarkIdentifierBag">
																	<TradeMarkKey>
																		<xsl:for-each select="tmk:TrademarkIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</TradeMarkKey>
																</xsl:for-each>
															</TradeMarkKeyDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var296_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var296_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<ClaimantKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</ClaimantKey>
																</xsl:for-each>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var297_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var297_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var298_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var298_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var299_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var299_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var300_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var300_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var301_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var301_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var302_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var302_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var303_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var303_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var304_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var304_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusCategory">
															<xsl:variable name="var305_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf47_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var305_resultof_vmf___inputtoresult">
																<RecordCurrentStatusCode>
																	<xsl:sequence select="."/>
																</RecordCurrentStatusCode>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="com:RecordCurrentStatusDate">
															<RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordInterestedOfficeCode">
															<RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDesignatedCountryCodeBag">
															<RecordDesignatedCountryDetails>
																<xsl:for-each select="com:RecordDesignatedCountryCode">
																	<RecordDesignatedCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RecordDesignatedCountryCode>
																</xsl:for-each>
															</RecordDesignatedCountryDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:LicenceBag">
															<LicenceDetails>
																<xsl:for-each select="tmk:Licence">
																	<Licence>
																		<xsl:for-each select="com:LicenceIdentifier">
																			<LicenceIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</LicenceIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceDate">
																			<LicenceDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</LicenceDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceNumber">
																			<LicenceNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</LicenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceReference">
																			<LicenceReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</LicenceReference>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceCategory">
																			<xsl:variable name="var306_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf48_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var306_resultof_vmf___inputtoresult">
																				<LicenceKind>
																					<xsl:sequence select="."/>
																				</LicenceKind>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:SublicenceIndicator">
																			<SubLicenceIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</SubLicenceIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="com:RelatedLicenceIdentifier">
																			<RelatedLicenceIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</RelatedLicenceIdentifier>
																		</xsl:for-each>
																		<GoodsServicesLimitationIndicator>
																			<xsl:sequence select="xs:string(xs:boolean(fn:string(tmk:GoodsServicesLimitationIndicator)))"/>
																		</GoodsServicesLimitationIndicator>
																		<xsl:for-each select="tmk:GoodsServicesLimitation">
																			<GoodsServicesLimitation>
																				<xsl:for-each select="com:LimitationCountryCodeBag">
																					<LimitationCountryDetails>
																						<xsl:for-each select="com:LimitationCountryCode">
																							<LimitationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</LimitationCountryCode>
																						</xsl:for-each>
																					</LimitationCountryDetails>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																					<xsl:variable name="var307_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf40_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var307_resultof_vmf___inputtoresult">
																						<GoodsServicesLimitationCode>
																							<xsl:sequence select="."/>
																						</GoodsServicesLimitationCode>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentTextBag/com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																					<LimitationClassDescriptionDetails>
																						<xsl:for-each select="tmk:ClassDescription">
																							<ClassDescription>
																								<xsl:for-each select="tmk:ClassNumber">
																									<ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassNumber>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassNumberStatusCategory">
																									<xsl:variable name="var308_resultof_vmf__inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf8_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var308_resultof_vmf__inputtoresult">
																										<ClassNumberStatusCode>
																											<xsl:sequence select="."/>
																										</ClassNumberStatusCode>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																									<GoodsServicesDescription>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</GoodsServicesDescription>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																									<UseNiceHeadingIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</UseNiceHeadingIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermBag">
																									<ClassificationTermDetails>
																										<xsl:for-each select="tmk:ClassificationTerm">
																											<ClassificationTerm>
																												<xsl:for-each select="@com:operationCategory">
																													<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermIdentifier">
																													<ClassificationTermIdentifier>
																														<xsl:for-each select="@com:officeCode">
																															<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermIdentifier>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																													<ClassificationTermOffice>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermOffice>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																													<ClassificationTermOfficeKey>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermOfficeKey>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																													<xsl:variable name="var309_resultof_vmf__inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf9_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var309_resultof_vmf__inputtoresult">
																														<ClassificationTermSource>
																															<xsl:sequence select="."/>
																														</ClassificationTermSource>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermEntryDate">
																													<ClassificationTermEntryDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</ClassificationTermEntryDate>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassNumber">
																													<ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassNumber>
																												</xsl:for-each>
																												<xsl:variable name="var310_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																												<ClassificationTermText>
																													<xsl:for-each select="$var310_ClassificationTermText/@com:languageCode">
																														<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string($var310_ClassificationTermText)"/>
																												</ClassificationTermText>
																												<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																													<ClassificationTermEquivalentGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermEquivalentGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																													<ClassificationTermReferenceGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermReferenceGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																													<ClassificationTermTranslationGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermTranslationGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermStatus">
																													<xsl:variable name="var312_cur" as="node()" select="."/>
																													<xsl:variable name="var311_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf10_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var311_resultof_vmf___inputtoresult">
																														<ClassificationTermStatus>
																															<xsl:for-each select="$var312_cur/@com:officeCode">
																																<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="."/>
																														</ClassificationTermStatus>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:WIPOBasicNumber">
																													<WIPOBasicNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</WIPOBasicNumber>
																												</xsl:for-each>
																											</ClassificationTerm>
																										</xsl:for-each>
																									</ClassificationTermDetails>
																								</xsl:for-each>
																							</ClassDescription>
																						</xsl:for-each>
																					</LimitationClassDescriptionDetails>
																				</xsl:for-each>
																			</GoodsServicesLimitation>
																		</xsl:for-each>
																		<xsl:for-each select="com:TerritoryLimitationIndicator">
																			<TerritoryLimitationIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</TerritoryLimitationIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="com:TerritoryLimitationText">
																			<TerritoryLimitationText>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</TerritoryLimitationText>
																		</xsl:for-each>
																		<xsl:for-each select="com:PeriodLimitationIndicator">
																			<PeriodLimitationIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</PeriodLimitationIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="com:PeriodLimitationText">
																			<PeriodLimitationText>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</PeriodLimitationText>
																		</xsl:for-each>
																		<xsl:for-each select="com:PeriodLimitationStartDate">
																			<PeriodLimitationStartDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PeriodLimitationStartDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PeriodLimitationEndDate">
																			<PeriodLimitationEndDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PeriodLimitationEndDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceStatusCategory">
																			<xsl:variable name="var313_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf49_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var313_resultof_vmf___inputtoresult">
																				<LicenceStatusCode>
																					<xsl:sequence select="."/>
																				</LicenceStatusCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<LicenseeDetails>
																			<xsl:for-each select="tmk:LicenseeBag/tmk:Licensee">
																				<Licensee>
																					<xsl:for-each select="@com:operationCategory">
																						<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:for-each select="com:PartyIdentifier">
																						<LicenseeIdentifier>
																							<xsl:for-each select="@com:officeCode">
																								<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</LicenseeIdentifier>
																					</xsl:for-each>
																					<xsl:for-each select="@com:sequenceNumber">
																						<LicenseeSequenceNumber>
																							<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																						</LicenseeSequenceNumber>
																					</xsl:for-each>
																					<xsl:for-each select="com:NationalityCode">
																						<LicenseeNationalityCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</LicenseeNationalityCode>
																					</xsl:for-each>
																					<xsl:for-each select="com:LegalEntityName">
																						<LicenseeLegalEntity>
																							<xsl:sequence select="fn:string(.)"/>
																						</LicenseeLegalEntity>
																					</xsl:for-each>
																					<xsl:for-each select="com:IncorporationCountryCode">
																						<LicenseeIncorporationCountryCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</LicenseeIncorporationCountryCode>
																					</xsl:for-each>
																					<xsl:for-each select="com:IncorporationState">
																						<LicenseeIncorporationState>
																							<xsl:sequence select="fn:string(.)"/>
																						</LicenseeIncorporationState>
																					</xsl:for-each>
																					<xsl:for-each select="com:CommentText">
																						<Comment>
																							<xsl:for-each select="@com:languageCode">
																								<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</Comment>
																					</xsl:for-each>
																					<xsl:for-each select="com:Contact">
																						<xsl:variable name="var314_resultof_ST__ContactToST__AddressBook" as="node()?">
																							<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																								<xsl:with-param name="Contact" as="node()">
																									<com:Contact>
																										<xsl:sequence select="(./@node(), ./node())"/>
																									</com:Contact>
																								</xsl:with-param>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var314_resultof_ST__ContactToST__AddressBook">
																							<LicenseeAddressBook>
																								<xsl:sequence select="(./@node(), ./node())"/>
																							</LicenseeAddressBook>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:for-each select="tmk:Entitlement">
																						<LicenseeEntitlement>
																							<xsl:for-each select="com:EntitlementNationalityCode">
																								<EntitlementNationalityCode>
																									<xsl:sequence select="fn:string(.)"/>
																								</EntitlementNationalityCode>
																							</xsl:for-each>
																							<xsl:for-each select="com:EntitlementEstablishment">
																								<EntitlementEstablishment>
																									<EntitlementEstablishmentCode>
																										<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																									</EntitlementEstablishmentCode>
																									<xsl:for-each select="com:Contact">
																										<xsl:variable name="var315_resultof_ST__ContactToST__AddressBook" as="node()?">
																											<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																												<xsl:with-param name="Contact" as="node()">
																													<com:Contact>
																														<xsl:sequence select="(./@node(), ./node())"/>
																													</com:Contact>
																												</xsl:with-param>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var315_resultof_ST__ContactToST__AddressBook">
																											<EntitlementEstablishmentAddressBook>
																												<xsl:sequence select="(./@node(), ./node())"/>
																											</EntitlementEstablishmentAddressBook>
																										</xsl:for-each>
																									</xsl:for-each>
																								</EntitlementEstablishment>
																							</xsl:for-each>
																							<xsl:for-each select="com:EntitlementDomiciled">
																								<EntitlementDomiciled>
																									<xsl:for-each select="com:EntitlementDomiciledCode">
																										<EntitlementDomiciledCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</EntitlementDomiciledCode>
																									</xsl:for-each>
																									<xsl:for-each select="com:Contact">
																										<xsl:variable name="var316_resultof_ST__ContactToST__AddressBook" as="node()?">
																											<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																												<xsl:with-param name="Contact" as="node()">
																													<com:Contact>
																														<xsl:sequence select="(./@node(), ./node())"/>
																													</com:Contact>
																												</xsl:with-param>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var316_resultof_ST__ContactToST__AddressBook">
																											<EntitlementDomiciledAddressBook>
																												<xsl:sequence select="(./@node(), ./node())"/>
																											</EntitlementDomiciledAddressBook>
																										</xsl:for-each>
																									</xsl:for-each>
																								</EntitlementDomiciled>
																							</xsl:for-each>
																						</LicenseeEntitlement>
																					</xsl:for-each>
																				</Licensee>
																			</xsl:for-each>
																		</LicenseeDetails>
																		<xsl:for-each select="com:RepresentativeBag">
																			<RepresentativeDetails>
																				<xsl:for-each select="com:Representative">
																					<Representative>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<RepresentativeIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<RepresentativeSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</RepresentativeSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:RepresentativeCategory">
																							<xsl:variable name="var317_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var317_resultof_vmf___inputtoresult">
																								<RepresentativeKindCode>
																									<xsl:sequence select="."/>
																								</RepresentativeKindCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<RepresentativeNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<RepresentativeLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<RepresentativeIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<RepresentativeIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</RepresentativeIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var318_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var318_resultof_ST__ContactToST__AddressBook">
																								<RepresentativeAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<RepresentativeVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</RepresentativeVersion>
																						</xsl:for-each>
																					</Representative>
																				</xsl:for-each>
																			</RepresentativeDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceEventBag">
																			<LicenceEventDetails>
																				<xsl:for-each select="com:LicenceEvent">
																					<LicenceEvent>
																						<xsl:for-each select="com:LicenceEventDate">
																							<LicenceEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</LicenceEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceEventDateTime">
																							<LicenceEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</LicenceEventDateTime>
																						</xsl:for-each>
																						<xsl:variable name="var319_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf50_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(com:LicenceEventCategory)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var319_resultof_vmf___inputtoresult">
																							<LicenceEventCode>
																								<xsl:sequence select="."/>
																							</LicenceEventCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LicenceEventResponseDate">
																							<LicenceEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</LicenceEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</LicenceEvent>
																				</xsl:for-each>
																			</LicenceEventDetails>
																		</xsl:for-each>
																		<xsl:for-each select="com:LicenceDocumentBag">
																			<LicenceDocumentDetails>
																				<xsl:for-each select="com:LicenceDocument">
																					<LicenceDocument>
																						<DocumentName>
																							<xsl:sequence select="fn:string(com:DocumentName)"/>
																						</DocumentName>
																						<xsl:for-each select="com:FileName">
																							<DocumentFilename>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentFilename>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentFormatCategory">
																							<xsl:variable name="var320_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf21_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var320_resultof_vmf___inputtoresult">
																								<DocumentFileFormat>
																									<xsl:sequence select="."/>
																								</DocumentFileFormat>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentDate">
																							<DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="@com:languageCode">
																							<DocumentLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentLanguageCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentMediaCategory">
																							<xsl:variable name="var321_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var321_resultof_vmf___inputtoresult">
																								<DocumentMedia>
																									<xsl:sequence select="."/>
																								</DocumentMedia>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentLocationURI">
																							<DocumentLocation>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</DocumentLocation>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentVersion">
																							<DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="com:DocumentSizeQuantity">
																							<DocumentSizeInByte>
																								<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																							</DocumentSizeInByte>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</LicenceDocument>
																				</xsl:for-each>
																			</LicenceDocumentDetails>
																		</xsl:for-each>
																	</Licence>
																</xsl:for-each>
															</LicenceDetails>
														</xsl:for-each>
													</RecordLicence>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordNationalInternationalReplacement">
													<RecordNationalInternationalReplacement>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<TradeMarkKeyDetails>
															<xsl:for-each select="tmk:TrademarkIdentification/tmk:TrademarkIdentifierBag">
																<TradeMarkKey>
																	<xsl:for-each select="tmk:TrademarkIdentifier">
																		<Identifier>
																			<xsl:for-each select="@com:officeCode">
																				<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																			</xsl:for-each>
																			<xsl:sequence select="fn:string(.)"/>
																		</Identifier>
																	</xsl:for-each>
																</TradeMarkKey>
															</xsl:for-each>
														</TradeMarkKeyDetails>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var322_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var322_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<ClaimantKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</ClaimantKey>
																</xsl:for-each>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var323_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var323_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var324_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var324_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var325_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var325_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var326_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var326_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var327_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var327_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var328_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var328_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var329_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var329_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var330_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var330_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordInterestedOfficeCode">
															<RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:GoodsServicesLimitationBag">
															<GoodsServicesLimitationDetails>
																<xsl:for-each select="tmk:GoodsServicesLimitation">
																	<GoodsServicesLimitation>
																		<xsl:for-each select="com:LimitationCountryCodeBag">
																			<LimitationCountryDetails>
																				<xsl:for-each select="com:LimitationCountryCode">
																					<LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</LimitationCountryCode>
																				</xsl:for-each>
																			</LimitationCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																			<xsl:variable name="var331_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf40_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var331_resultof_vmf___inputtoresult">
																				<GoodsServicesLimitationCode>
																					<xsl:sequence select="."/>
																				</GoodsServicesLimitationCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																			<LimitationClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var332_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var332_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var333_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var333_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var334_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var334_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var334_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var336_cur" as="node()" select="."/>
																											<xsl:variable name="var335_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var335_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var336_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</LimitationClassDescriptionDetails>
																		</xsl:for-each>
																	</GoodsServicesLimitation>
																</xsl:for-each>
															</GoodsServicesLimitationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:NationalMarkBag">
															<NationalMarkDetails>
																<xsl:for-each select="tmk:NationalMark">
																	<NationalMark>
																		<xsl:for-each select="tmk:NationalMarkRegistrationNumber">
																			<NationalMarkRegistrationNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</NationalMarkRegistrationNumber>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:NationalMarkFilingDate">
																			<NationalMarkFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</NationalMarkFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:NationalMarkRegistrationDate">
																			<NationalMarkRegistrationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</NationalMarkRegistrationDate>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:NationalMarkPriorityDate">
																			<NationalMarkPriorityDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</NationalMarkPriorityDate>
																		</xsl:for-each>
																	</NationalMark>
																</xsl:for-each>
															</NationalMarkDetails>
														</xsl:for-each>
													</RecordNationalInternationalReplacement>
												</xsl:for-each>
												<xsl:for-each select="tmk:RecordShortNotation">
													<RecordShortNotation>
														<xsl:for-each select="com:RecordIdentifier">
															<RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="com:RecordFilingDate">
															<RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordNotificationDate">
															<RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEffectiveDate">
															<RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var337_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf51_inputtoresult">
																<xsl:with-param name="input" select="fn:string(tmk:RecordShortNotationCategory)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var337_resultof_vmf___inputtoresult">
															<RecordShortNotationKind>
																<xsl:sequence select="."/>
															</RecordShortNotationKind>
														</xsl:for-each>
														<xsl:for-each select="com:RecordReference">
															<RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</RecordReference>
														</xsl:for-each>
														<xsl:for-each select="com:RecordLanguageCode">
															<RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordPublicationBag">
															<RecordPublicationDetails>
																<xsl:for-each select="tmk:RecordPublication">
																	<RecordPublication>
																		<PublicationIdentifier>
																			<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																		</PublicationIdentifier>
																		<xsl:for-each select="tmk:PublicationSectionCategory">
																			<xsl:variable name="var338_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf26_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var338_resultof_vmf___inputtoresult">
																				<PublicationSection>
																					<xsl:sequence select="."/>
																				</PublicationSection>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationSubsection">
																			<PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationDate">
																			<PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:PublicationPage">
																			<PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</PublicationPage>
																		</xsl:for-each>
																	</RecordPublication>
																</xsl:for-each>
															</RecordPublicationDetails>
														</xsl:for-each>
														<xsl:for-each select="tmk:ClaimantBag">
															<ClaimantDetails>
																<xsl:for-each select="tmk:Claimant">
																	<Claimant>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<ClaimantIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<ClaimantSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</ClaimantSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<ClaimantNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<ClaimantLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<ClaimantIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<ClaimantIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClaimantIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var339_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var339_resultof_ST__ContactToST__AddressBook">
																				<ClaimantAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ClaimantAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:Entitlement">
																			<ClaimantEntitlement>
																				<xsl:for-each select="com:EntitlementNationalityCode">
																					<EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementEstablishment">
																					<EntitlementEstablishment>
																						<EntitlementEstablishmentCode>
																							<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																						</EntitlementEstablishmentCode>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var340_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var340_resultof_ST__ContactToST__AddressBook">
																								<EntitlementEstablishmentAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementEstablishmentAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="com:EntitlementDomiciled">
																					<EntitlementDomiciled>
																						<xsl:for-each select="com:EntitlementDomiciledCode">
																							<EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var341_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var341_resultof_ST__ContactToST__AddressBook">
																								<EntitlementDomiciledAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</EntitlementDomiciledAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																					</EntitlementDomiciled>
																				</xsl:for-each>
																			</ClaimantEntitlement>
																		</xsl:for-each>
																	</Claimant>
																</xsl:for-each>
															</ClaimantDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RepresentativeBag">
															<RepresentativeDetails>
																<xsl:for-each select="com:PartyIdentifierBag">
																	<RepresentativeKey>
																		<xsl:for-each select="com:PartyIdentifier">
																			<Identifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Identifier>
																		</xsl:for-each>
																	</RepresentativeKey>
																</xsl:for-each>
																<xsl:for-each select="com:Representative">
																	<Representative>
																		<xsl:for-each select="@com:operationCategory">
																			<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="com:PartyIdentifier">
																			<RepresentativeIdentifier>
																				<xsl:for-each select="@com:officeCode">
																					<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="@com:sequenceNumber">
																			<RepresentativeSequenceNumber>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</RepresentativeSequenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:RepresentativeCategory">
																			<xsl:variable name="var342_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var342_resultof_vmf___inputtoresult">
																				<RepresentativeKindCode>
																					<xsl:sequence select="."/>
																				</RepresentativeKindCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:NationalityCode">
																			<RepresentativeNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:LegalEntityName">
																			<RepresentativeLegalEntity>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeLegalEntity>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationCountryCode">
																			<RepresentativeIncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:IncorporationState">
																			<RepresentativeIncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</RepresentativeIncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="com:Contact">
																			<xsl:variable name="var343_resultof_ST__ContactToST__AddressBook" as="node()?">
																				<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																					<xsl:with-param name="Contact" as="node()">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var343_resultof_ST__ContactToST__AddressBook">
																				<RepresentativeAddressBook>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeAddressBook>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:Version">
																			<RepresentativeVersion>
																				<xsl:for-each select="com:VersionNumber">
																					<VersionNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</VersionNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDate">
																					<VersionDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</VersionDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:VersionDateTime">
																					<VersionDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</VersionDateTime>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</RepresentativeVersion>
																		</xsl:for-each>
																	</Representative>
																</xsl:for-each>
															</RepresentativeDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordEventBag">
															<RecordEventDetails>
																<xsl:for-each select="com:RecordEvent">
																	<RecordEvent>
																		<xsl:for-each select="com:RecordEventDate">
																			<RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventDateTime">
																			<RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</RecordEventDateTime>
																		</xsl:for-each>
																		<xsl:variable name="var344_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(com:RecordEventCategory)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var344_resultof_vmf___inputtoresult">
																			<RecordEventCode>
																				<xsl:sequence select="."/>
																			</RecordEventCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:RecordEventResponseDate">
																			<RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordEvent>
																</xsl:for-each>
															</RecordEventDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordDocumentBag">
															<RecordDocumentDetails>
																<xsl:for-each select="com:RecordDocument">
																	<RecordDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var345_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf21_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var345_resultof_vmf___inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var346_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var346_resultof_vmf___inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RecordDocument>
																</xsl:for-each>
															</RecordDocumentDetails>
														</xsl:for-each>
														<xsl:for-each select="com:RecordInterestedOfficeCode">
															<RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordToRegistration">
															<RecordToRegistration>
																<RegistrationIdentifier>
																	<xsl:sequence select="fn:string(tmk:RegistrationIdentifier)"/>
																</RegistrationIdentifier>
																<xsl:for-each select="com:RegistrationDate">
																	<RegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</RegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="tmk:MarkVerbalElementText">
																	<MarkVerbalElementText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</MarkVerbalElementText>
																</xsl:for-each>
																<xsl:for-each select="tmk:DesignatedCountryCodeBag">
																	<DesignatedCountryDetails>
																		<xsl:for-each select="com:DesignatedCountryCode">
																			<DesignatedCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DesignatedCountryCode>
																		</xsl:for-each>
																	</DesignatedCountryDetails>
																</xsl:for-each>
																<xsl:for-each select="tmk:GoodsServicesLimitation">
																	<GoodsServicesLimitation>
																		<xsl:for-each select="com:LimitationCountryCodeBag">
																			<LimitationCountryDetails>
																				<xsl:for-each select="com:LimitationCountryCode">
																					<LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</LimitationCountryCode>
																				</xsl:for-each>
																			</LimitationCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																			<xsl:variable name="var347_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf40_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var347_resultof_vmf___inputtoresult">
																				<GoodsServicesLimitationCode>
																					<xsl:sequence select="."/>
																				</GoodsServicesLimitationCode>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentTextBag/com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																			<LimitationClassDescriptionDetails>
																				<xsl:for-each select="tmk:ClassDescription">
																					<ClassDescription>
																						<xsl:for-each select="tmk:ClassNumber">
																							<ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassNumberStatusCategory">
																							<xsl:variable name="var348_resultof_vmf__inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf8_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var348_resultof_vmf__inputtoresult">
																								<ClassNumberStatusCode>
																									<xsl:sequence select="."/>
																								</ClassNumberStatusCode>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																							<GoodsServicesDescription>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@com:sequenceNumber">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</GoodsServicesDescription>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																							<UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:ClassificationTermBag">
																							<ClassificationTermDetails>
																								<xsl:for-each select="tmk:ClassificationTerm">
																									<ClassificationTerm>
																										<xsl:for-each select="@com:operationCategory">
																											<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermIdentifier">
																											<ClassificationTermIdentifier>
																												<xsl:for-each select="@com:officeCode">
																													<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																											<ClassificationTermOffice>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOffice>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																											<ClassificationTermOfficeKey>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermOfficeKey>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																											<xsl:variable name="var349_resultof_vmf__inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf9_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var349_resultof_vmf__inputtoresult">
																												<ClassificationTermSource>
																													<xsl:sequence select="."/>
																												</ClassificationTermSource>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermEntryDate">
																											<ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassNumber">
																											<ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassNumber>
																										</xsl:for-each>
																										<xsl:variable name="var350_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																										<ClassificationTermText>
																											<xsl:for-each select="$var350_ClassificationTermText/@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string($var350_ClassificationTermText)"/>
																										</ClassificationTermText>
																										<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																											<ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																											<ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																											<ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:ClassificationTermStatus">
																											<xsl:variable name="var352_cur" as="node()" select="."/>
																											<xsl:variable name="var351_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf10_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var351_resultof_vmf___inputtoresult">
																												<ClassificationTermStatus>
																													<xsl:for-each select="$var352_cur/@com:officeCode">
																														<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="tmk:WIPOBasicNumber">
																											<WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</WIPOBasicNumber>
																										</xsl:for-each>
																									</ClassificationTerm>
																								</xsl:for-each>
																							</ClassificationTermDetails>
																						</xsl:for-each>
																					</ClassDescription>
																				</xsl:for-each>
																			</LimitationClassDescriptionDetails>
																		</xsl:for-each>
																	</GoodsServicesLimitation>
																</xsl:for-each>
																<xsl:for-each select="tmk:ApplicantBag">
																	<ApplicantDetails>
																		<xsl:for-each select="tmk:Applicant">
																			<Applicant>
																				<xsl:for-each select="@com:operationCategory">
																					<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="com:PartyIdentifier">
																					<ApplicantIdentifier>
																						<xsl:for-each select="@com:officeCode">
																							<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicantIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="@com:sequenceNumber">
																					<ApplicantSequenceNumber>
																						<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																					</ApplicantSequenceNumber>
																				</xsl:for-each>
																				<xsl:for-each select="com:NationalityCode">
																					<ApplicantNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicantNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:LegalEntityName">
																					<ApplicantLegalEntity>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicantLegalEntity>
																				</xsl:for-each>
																				<xsl:for-each select="com:IncorporationCountryCode">
																					<ApplicantIncorporationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicantIncorporationCountryCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:IncorporationState">
																					<ApplicantIncorporationState>
																						<xsl:sequence select="fn:string(.)"/>
																					</ApplicantIncorporationState>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var353_resultof_ST__ContactToST__AddressBook" as="node()?">
																						<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																							<xsl:with-param name="Contact" as="node()">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var353_resultof_ST__ContactToST__AddressBook">
																						<ApplicantAddressBook>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</ApplicantAddressBook>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:Entitlement">
																					<ApplicantEntitlement>
																						<xsl:for-each select="com:EntitlementNationalityCode">
																							<EntitlementNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:EntitlementEstablishment">
																							<EntitlementEstablishment>
																								<EntitlementEstablishmentCode>
																									<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																								</EntitlementEstablishmentCode>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var354_resultof_ST__ContactToST__AddressBook" as="node()?">
																										<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																											<xsl:with-param name="Contact" as="node()">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:with-param>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var354_resultof_ST__ContactToST__AddressBook">
																										<EntitlementEstablishmentAddressBook>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</EntitlementEstablishmentAddressBook>
																									</xsl:for-each>
																								</xsl:for-each>
																							</EntitlementEstablishment>
																						</xsl:for-each>
																						<xsl:for-each select="com:EntitlementDomiciled">
																							<EntitlementDomiciled>
																								<xsl:for-each select="com:EntitlementDomiciledCode">
																									<EntitlementDomiciledCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementDomiciledCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var355_resultof_ST__ContactToST__AddressBook" as="node()?">
																										<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																											<xsl:with-param name="Contact" as="node()">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:with-param>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var355_resultof_ST__ContactToST__AddressBook">
																										<EntitlementDomiciledAddressBook>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</EntitlementDomiciledAddressBook>
																									</xsl:for-each>
																								</xsl:for-each>
																							</EntitlementDomiciled>
																						</xsl:for-each>
																					</ApplicantEntitlement>
																				</xsl:for-each>
																				<xsl:for-each select="com:Version">
																					<ApplicantVersion>
																						<xsl:for-each select="com:VersionNumber">
																							<VersionNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</VersionNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:VersionDate">
																							<VersionDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</VersionDate>
																						</xsl:for-each>
																						<xsl:for-each select="com:VersionDateTime">
																							<VersionDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</VersionDateTime>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																					</ApplicantVersion>
																				</xsl:for-each>
																			</Applicant>
																		</xsl:for-each>
																	</ApplicantDetails>
																</xsl:for-each>
															</RecordToRegistration>
														</xsl:for-each>
														<xsl:for-each select="tmk:RecordFromRegistrationBag">
															<RecordFromRegistrationDetails>
																<xsl:for-each select="tmk:RecordFromRegistration">
																	<RecordFromRegistration>
																		<RegistrationIdentifier>
																			<xsl:sequence select="fn:string(tmk:RegistrationIdentifier)"/>
																		</RegistrationIdentifier>
																		<xsl:for-each select="com:RegistrationDate">
																			<RegistrationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</RegistrationDate>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:MarkVerbalElementText">
																			<MarkVerbalElementText>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</MarkVerbalElementText>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:DesignatedCountryCodeBag">
																			<DesignatedCountryDetails>
																				<xsl:for-each select="com:DesignatedCountryCode">
																					<DesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</DesignatedCountryCode>
																				</xsl:for-each>
																			</DesignatedCountryDetails>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:GoodsServicesLimitation">
																			<GoodsServicesLimitation>
																				<xsl:for-each select="com:LimitationCountryCodeBag">
																					<LimitationCountryDetails>
																						<xsl:for-each select="com:LimitationCountryCode">
																							<LimitationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</LimitationCountryCode>
																						</xsl:for-each>
																					</LimitationCountryDetails>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:GoodsServicesLimitationCategory">
																					<xsl:variable name="var356_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf40_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var356_resultof_vmf___inputtoresult">
																						<GoodsServicesLimitationCode>
																							<xsl:sequence select="."/>
																						</GoodsServicesLimitationCode>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentTextBag/com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																				<xsl:for-each select="tmk:LimitationClassDescriptionBag">
																					<LimitationClassDescriptionDetails>
																						<xsl:for-each select="tmk:ClassDescription">
																							<ClassDescription>
																								<xsl:for-each select="tmk:ClassNumber">
																									<ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</ClassNumber>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassNumberStatusCategory">
																									<xsl:variable name="var357_resultof_vmf__inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf8_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var357_resultof_vmf__inputtoresult">
																										<ClassNumberStatusCode>
																											<xsl:sequence select="."/>
																										</ClassNumberStatusCode>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:GoodsServicesDescriptionText">
																									<GoodsServicesDescription>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</GoodsServicesDescription>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:UseNiceHeadingIndicator">
																									<UseNiceHeadingIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</UseNiceHeadingIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="tmk:ClassificationTermBag">
																									<ClassificationTermDetails>
																										<xsl:for-each select="tmk:ClassificationTerm">
																											<ClassificationTerm>
																												<xsl:for-each select="@com:operationCategory">
																													<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermIdentifier">
																													<ClassificationTermIdentifier>
																														<xsl:for-each select="@com:officeCode">
																															<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermIdentifier>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermOfficeCode">
																													<ClassificationTermOffice>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermOffice>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermOfficeIdentification">
																													<ClassificationTermOfficeKey>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermOfficeKey>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermSourceCategory">
																													<xsl:variable name="var358_resultof_vmf__inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf9_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var358_resultof_vmf__inputtoresult">
																														<ClassificationTermSource>
																															<xsl:sequence select="."/>
																														</ClassificationTermSource>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermEntryDate">
																													<ClassificationTermEntryDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</ClassificationTermEntryDate>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassNumber">
																													<ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassNumber>
																												</xsl:for-each>
																												<xsl:variable name="var359_ClassificationTermText" as="node()" select="tmk:ClassificationTermText"/>
																												<ClassificationTermText>
																													<xsl:for-each select="$var359_ClassificationTermText/@com:languageCode">
																														<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string($var359_ClassificationTermText)"/>
																												</ClassificationTermText>
																												<xsl:for-each select="tmk:ClassificationTermEquivalentGroup">
																													<ClassificationTermEquivalentGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermEquivalentGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermReferenceGroup">
																													<ClassificationTermReferenceGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermReferenceGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermTranslationGroup">
																													<ClassificationTermTranslationGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</ClassificationTermTranslationGroup>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:ClassificationTermStatus">
																													<xsl:variable name="var361_cur" as="node()" select="."/>
																													<xsl:variable name="var360_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf10_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var360_resultof_vmf___inputtoresult">
																														<ClassificationTermStatus>
																															<xsl:for-each select="$var361_cur/@com:officeCode">
																																<xsl:attribute name="officeCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="."/>
																														</ClassificationTermStatus>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="tmk:WIPOBasicNumber">
																													<WIPOBasicNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</WIPOBasicNumber>
																												</xsl:for-each>
																											</ClassificationTerm>
																										</xsl:for-each>
																									</ClassificationTermDetails>
																								</xsl:for-each>
																							</ClassDescription>
																						</xsl:for-each>
																					</LimitationClassDescriptionDetails>
																				</xsl:for-each>
																			</GoodsServicesLimitation>
																		</xsl:for-each>
																		<xsl:for-each select="tmk:ApplicantBag">
																			<ApplicantDetails>
																				<xsl:for-each select="tmk:Applicant">
																					<Applicant>
																						<xsl:for-each select="@com:operationCategory">
																							<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="com:PartyIdentifier">
																							<ApplicantIdentifier>
																								<xsl:for-each select="@com:officeCode">
																									<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<ApplicantSequenceNumber>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</ApplicantSequenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="com:NationalityCode">
																							<ApplicantNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:LegalEntityName">
																							<ApplicantLegalEntity>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantLegalEntity>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationCountryCode">
																							<ApplicantIncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="com:IncorporationState">
																							<ApplicantIncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</ApplicantIncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="com:CommentText">
																							<Comment>
																								<xsl:for-each select="@com:languageCode">
																									<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Comment>
																						</xsl:for-each>
																						<xsl:for-each select="com:Contact">
																							<xsl:variable name="var362_resultof_ST__ContactToST__AddressBook" as="node()?">
																								<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																									<xsl:with-param name="Contact" as="node()">
																										<com:Contact>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Contact>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var362_resultof_ST__ContactToST__AddressBook">
																								<ApplicantAddressBook>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantAddressBook>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="tmk:Entitlement">
																							<ApplicantEntitlement>
																								<xsl:for-each select="com:EntitlementNationalityCode">
																									<EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementEstablishment">
																									<EntitlementEstablishment>
																										<EntitlementEstablishmentCode>
																											<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																										</EntitlementEstablishmentCode>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var363_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var363_resultof_ST__ContactToST__AddressBook">
																												<EntitlementEstablishmentAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementEstablishmentAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="com:EntitlementDomiciled">
																									<EntitlementDomiciled>
																										<xsl:for-each select="com:EntitlementDomiciledCode">
																											<EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="com:Contact">
																											<xsl:variable name="var364_resultof_ST__ContactToST__AddressBook" as="node()?">
																												<xsl:call-template name="WIPO:ST96ContactToST66AddressBook">
																													<xsl:with-param name="Contact" as="node()">
																														<com:Contact>
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</com:Contact>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var364_resultof_ST__ContactToST__AddressBook">
																												<EntitlementDomiciledAddressBook>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</EntitlementDomiciledAddressBook>
																											</xsl:for-each>
																										</xsl:for-each>
																									</EntitlementDomiciled>
																								</xsl:for-each>
																							</ApplicantEntitlement>
																						</xsl:for-each>
																						<xsl:for-each select="com:Version">
																							<ApplicantVersion>
																								<xsl:for-each select="com:VersionNumber">
																									<VersionNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</VersionNumber>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDate">
																									<VersionDate>
																										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																									</VersionDate>
																								</xsl:for-each>
																								<xsl:for-each select="com:VersionDateTime">
																									<VersionDateTime>
																										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																									</VersionDateTime>
																								</xsl:for-each>
																								<xsl:for-each select="com:CommentText">
																									<Comment>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</Comment>
																								</xsl:for-each>
																							</ApplicantVersion>
																						</xsl:for-each>
																					</Applicant>
																				</xsl:for-each>
																			</ApplicantDetails>
																		</xsl:for-each>
																	</RecordFromRegistration>
																</xsl:for-each>
															</RecordFromRegistrationDetails>
														</xsl:for-each>
													</RecordShortNotation>
												</xsl:for-each>
											</MarkRecord>
										</xsl:for-each>
									</MarkRecordDetails>
								</xsl:for-each>
							</TransactionData>
						</TransactionContentDetails>
					</TradeMarkTransactionBody>
				</xsl:for-each>
			</xsl:for-each>
		</Transaction>
	</xsl:template>
</xsl:stylesheet>
