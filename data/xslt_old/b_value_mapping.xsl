<xsl:stylesheet version="2.0" xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO"
                xmlns:mathml="http://www.w3.org/1998/Math/MathML" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
                xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
                exclude-result-prefixes="WIPO vmf xs fn">
	<xsl:template name="vmf:vmf_b_1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('utility', 'Utility')">
				<xsl:copy-of select="'Utility'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_b_2_inputtoresult">
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
	<xsl:template name="vmf:vmf_b_3_inputtoresult">
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
	<xsl:template name="vmf:vmf_b_4_inputtoresult">
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
	<xsl:template name="vmf:vmf_b_5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('agent', 'Agent')">
				<xsl:copy-of select="'Agent'"/>
			</xsl:when>
			<xsl:when test="$input=('attorney', 'Attorney')">
				<xsl:copy-of select="'Attorney'"/>
			</xsl:when>
			<xsl:when test="$input=('common-representative','Common representative' )">
				<xsl:copy-of select="'Common representative'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_b_6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('applicant-inventor', 'Applicant_Inventor')">
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
	<xsl:template name="vmf:vmf_b_7_inputtoresult">
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

    <xsl:template name="WIPO:ST36address-bookToST96PublicationContact2">
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
                <xsl:for-each select="$addressbook/name|$addressbook/address/text">
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
	<xsl:template name="WIPO:ST36address-bookToST96PublicationContact3">
		<xsl:param name="addressbook" select="()"/>
		<xsl:variable name="var1_address" as="node()*" select="$addressbook/*:Address"/>
		<com:PublicationContact>
			<com:Name>
				<xsl:for-each select="$addressbook/*:LastName">
					<com:PersonName>
						<com:PersonStructuredName>
							<xsl:for-each select="$addressbook/*:Prefix">
								<com:NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</com:NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:FirstName">
								<com:FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FirstName>
							</xsl:for-each>
							<xsl:for-each select="$addressbook/*:MiddleName">
								<com:MiddleName>
									<xsl:sequence select="fn:string(.)"/>
								</com:MiddleName>
							</xsl:for-each>
							<com:LastName>
								<xsl:sequence select="fn:string(.)"/>
							</com:LastName>
						</com:PersonStructuredName>
					</com:PersonName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:OrganizationName">
					<com:OrganizationName>
						<com:OrganizationStandardName>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</com:OrganizationStandardName>
					</com:OrganizationName>
				</xsl:for-each>
				<xsl:for-each select="$addressbook/*:Name|$addressbook/*:Address/*:Text">
					<com:EntityName>
						<xsl:sequence select="fn:string(.)"/>
					</com:EntityName>
				</xsl:for-each>
			</com:Name>
			<xsl:for-each select="$var1_address/*:City">
				<com:CityName>
					<xsl:sequence select="fn:string(.)"/>
				</com:CityName>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:State">
				<com:GeographicRegionName>
					<xsl:sequence select="fn:string(.)"/>
				</com:GeographicRegionName>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:Province">
				<com:GeographicRegionName>
					<xsl:sequence select="fn:string(.)"/>
				</com:GeographicRegionName>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:WIPOST3Code">
				<com:CountryCode>
					<xsl:sequence select="fn:string(.)"/>
				</com:CountryCode>
			</xsl:for-each>
			<xsl:for-each select="$var1_address/*:PostCode">
				<com:PostalCode>
					<xsl:sequence select="fn:string(.)"/>
				</com:PostalCode>
			</xsl:for-each>
		</com:PublicationContact>
	</xsl:template>
</xsl:stylesheet>