<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:dgn="http://www.wipo.int/standards/XMLSchema/ST96/Design" xmlns:ns1="http://www.wipo.int/standards/XMLSchema/designs" exclude-result-prefixes="WIPO vmf xs fn dgn ns1">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="st86model-V1-010" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-011" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-012" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-013" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-014" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-015" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-016" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-017" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-03" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-04" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-05" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-06" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-07" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-08" select="'st86model-V1-0.xml'"/>
	<xsl:param name="st86model-V1-09" select="'st86model-V1-0.xml'"/>
	<xsl:template name="WIPO:ST86RelatedApplicationToST96RelatedApplication">
		<xsl:param name="RelatedApplication" select="()"/>
		<dgn:RelatedApplication>
			<xsl:for-each select="$RelatedApplication/ns1:RelatedApplicationKind">
				<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf5_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
					<RelatedApplicationCategory>
						<xsl:sequence select="."/>
					</RelatedApplicationCategory>
				</xsl:for-each>
			</xsl:for-each>
			<RelatedApplicationNumber>
				<xsl:for-each select="$RelatedApplication/ns1:RelatedApplicationNumber">
					<com:ApplicationNumberText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="fn:string(.)"/>
					</com:ApplicationNumberText>
				</xsl:for-each>
			</RelatedApplicationNumber>
			<xsl:for-each select="$RelatedApplication/ns1:RelatedApplicationDate">
				<RelatedApplicationDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</RelatedApplicationDate>
			</xsl:for-each>
			<xsl:for-each select="$RelatedApplication/ns1:RelatedApplicationReference">
				<RelatedApplicationReference>
					<xsl:sequence select="fn:string(.)"/>
				</RelatedApplicationReference>
			</xsl:for-each>
			<xsl:for-each select="$RelatedApplication/ns1:RelatedApplicationRegistrationNumber">
				<RelatedApplicationRegistrationNumber>
					<xsl:sequence select="fn:string(.)"/>
				</RelatedApplicationRegistrationNumber>
			</xsl:for-each>
		</dgn:RelatedApplication>
	</xsl:template>
	<xsl:template name="WIPO:ST86ExhibitionPriorityToST96ExhibitionPriority">
		<xsl:param name="ExhibitionPriority" select="()"/>
		<com:ExhibitionPriority>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionCountryCode">
				<ExhibitionCountryCode>
					<xsl:sequence select="fn:string(.)"/>
				</ExhibitionCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionCityName">
				<ExhibitionCityName>
					<xsl:sequence select="fn:string(.)"/>
				</ExhibitionCityName>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionName">
				<ExhibitionName>
					<xsl:sequence select="fn:string(.)"/>
				</ExhibitionName>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionDate">
				<ExhibitionDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</ExhibitionDate>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionFirstDisplayDate">
				<ExhibitionFirstDisplayDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</ExhibitionFirstDisplayDate>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionStatusCode">
				<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf6_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
					<ExhibitionStatusCategory>
						<xsl:sequence select="."/>
					</ExhibitionStatusCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionStatusDate">
				<ExhibitionStatusDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</ExhibitionStatusDate>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:Comment">
				<CommentText>
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</CommentText>
			</xsl:for-each>
			<xsl:for-each select="$ExhibitionPriority/ns1:ExhibitionDocument">
				<ExhibitionDocument>
					<xsl:for-each select="ns1:DocumentLanguageCode">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentName">
						<DocumentName>
							<xsl:sequence select="fn:string(.)"/>
						</DocumentName>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentFilename">
						<FileName>
							<xsl:sequence select="fn:string(.)"/>
						</FileName>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentFileFormat">
						<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf7_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
							<DocumentFormatCategory>
								<xsl:sequence select="."/>
							</DocumentFormatCategory>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentDate">
						<DocumentDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</DocumentDate>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentMedia">
						<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf8_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
							<DocumentMediaCategory>
								<xsl:sequence select="."/>
							</DocumentMediaCategory>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentLocation">
						<DocumentLocationURI>
							<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
						</DocumentLocationURI>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentVersion">
						<DocumentVersion>
							<xsl:sequence select="fn:string(.)"/>
						</DocumentVersion>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentSizeInByte">
						<DocumentSizeQuantity>
							<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
						</DocumentSizeQuantity>
					</xsl:for-each>
					<xsl:for-each select="ns1:Comment">
						<CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</CommentText>
					</xsl:for-each>
				</ExhibitionDocument>
			</xsl:for-each>
		</com:ExhibitionPriority>
	</xsl:template>
	<xsl:template name="WIPO:ST86PublicationToST96Publication">
		<xsl:param name="Publication" select="()"/>
		<dgn:Publication>
			<xsl:for-each select="$Publication/ns1:PublicationIdentifier">
				<com:PublicationIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PublicationIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Publication/ns1:PublicationSection">
				<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf9_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
					<PublicationSectionCategory>
						<xsl:sequence select="."/>
					</PublicationSectionCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Publication/ns1:PublicationSubsection">
				<com:PublicationSubsection xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PublicationSubsection>
			</xsl:for-each>
			<xsl:for-each select="$Publication/ns1:PublicationDate">
				<com:PublicationDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:PublicationDate>
			</xsl:for-each>
			<xsl:for-each select="$Publication/ns1:PublicationPage">
				<com:PublicationPage xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PublicationPage>
			</xsl:for-each>
		</dgn:Publication>
	</xsl:template>
	<xsl:template name="WIPO:ST86DesignEventToST96DesignEvent">
		<xsl:param name="DesignEvent" select="()"/>
		<dgn:DesignEvent>
			<xsl:for-each select="$DesignEvent/ns1:DesignEventCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf10_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<DesignEventCategory>
						<xsl:sequence select="."/>
					</DesignEventCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$DesignEvent/ns1:DesignEventResponseDate">
				<DesignEventResponseDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</DesignEventResponseDate>
			</xsl:for-each>
			<xsl:for-each select="$DesignEvent/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$DesignEvent/ns1:DesignEventDate">
				<DesignEventDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</DesignEventDate>
			</xsl:for-each>
			<xsl:for-each select="$DesignEvent/ns1:DesignEventDateTime">
				<DesignEventDateTime>
					<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
				</DesignEventDateTime>
			</xsl:for-each>
		</dgn:DesignEvent>
	</xsl:template>
	<xsl:template name="WIPO:ST86ApplicantToST96Applicant">
		<xsl:param name="Applicant" select="()"/>
		<dgn:Applicant>
			<xsl:for-each select="$Applicant/@operationCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf11_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<xsl:attribute name="com:operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantSequenceNumber">
				<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantNationalityCode">
				<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantLegalEntity">
				<com:LegalEntityName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:LegalEntityName>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantIncorporationCountryCode">
				<com:IncorporationCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantIncorporationState">
				<com:IncorporationState xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationState>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantEntitlement">
				<Entitlement>
					<xsl:for-each select="ns1:EntitlementNationalityCode">
						<com:EntitlementNationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:sequence select="fn:string(.)"/>
						</com:EntitlementNationalityCode>
					</xsl:for-each>
					<xsl:for-each select="ns1:HabitualResidence">
						<HabitualResidence>
							<xsl:for-each select="ns1:HabitualResidenceCode">
								<HabitualResidenceCode>
									<xsl:sequence select="fn:string(.)"/>
								</HabitualResidenceCode>
							</xsl:for-each>
							<xsl:for-each select="ns1:HabitualResidenceAddressBook">
								<xsl:variable name="var2_resultof_ST__AddressbookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var2_resultof_ST__AddressbookToST__Contact">
									<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</HabitualResidence>
					</xsl:for-each>
					<xsl:for-each select="ns1:EntitlementEstablishment">
						<com:EntitlementEstablishment xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns1:EntitlementEstablishmentCode">
								<com:EntitlementEstablishmentCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementEstablishmentCode>
							</xsl:for-each>
						</com:EntitlementEstablishment>
					</xsl:for-each>
					<xsl:for-each select="ns1:EntitlementDomiciled">
						<com:EntitlementDomiciled xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns1:EntitlementDomiciledCode">
								<com:EntitlementDomiciledCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementDomiciledCode>
							</xsl:for-each>
							<xsl:for-each select="ns1:EntitlementDomiciledAddressBook">
								<xsl:variable name="var3_resultof_ST__AddressbookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var3_resultof_ST__AddressbookToST__Contact">
									<com:Contact>
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</com:EntitlementDomiciled>
					</xsl:for-each>
				</Entitlement>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantContractingParty">
				<ApplicantContractingParty>
					<xsl:sequence select="fn:string(.)"/>
				</ApplicantContractingParty>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantVersion">
				<com:Version xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="ns1:Comment">
						<com:CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</com:CommentText>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionNumber">
						<com:VersionNumber>
							<xsl:sequence select="fn:string(.)"/>
						</com:VersionNumber>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionDate">
						<com:VersionDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</com:VersionDate>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionDateTime">
						<com:VersionDateTime>
							<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
						</com:VersionDateTime>
					</xsl:for-each>
				</com:Version>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantIdentifier">
				<com:PartyIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns1:ApplicantAddressBook">
				<xsl:variable name="var4_resultof_ST__AddressbookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var4_resultof_ST__AddressbookToST__Contact">
					<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="(./@node(), ./node())"/>
					</com:Contact>
				</xsl:for-each>
			</xsl:for-each>
		</dgn:Applicant>
	</xsl:template>
	<xsl:template name="WIPO:ST86DesignerToST96Designer">
		<xsl:param name="Designer" select="()"/>
		<dgn:Designer>
			<xsl:for-each select="$Designer/@operationCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf12_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<xsl:attribute name="com:operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Designer/ns1:DesignerSequenceNumber">
				<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$Designer/ns1:DesignerNationalityCode">
				<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Designer/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Designer/ns1:DesignerIdentifier">
				<com:PartyIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Designer/ns1:DesignerAddressBook">
				<xsl:variable name="var2_resultof_ST__AddressbookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_ST__AddressbookToST__Contact">
					<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="(./@node(), ./node())"/>
					</com:Contact>
				</xsl:for-each>
			</xsl:for-each>
		</dgn:Designer>
	</xsl:template>
	<xsl:template name="WIPO:ST86RepresentativeToST96Representative">
		<xsl:param name="Representative" select="()"/>
		<Representative xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:for-each select="$Representative/@operationCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf13_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<xsl:attribute name="operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeSequenceNumber">
				<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeLegalEntity">
				<LegalEntityName>
					<xsl:sequence select="fn:string(.)"/>
				</LegalEntityName>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeIdentifier">
				<PartyIdentifier>
					<xsl:sequence select="fn:string(.)"/>
				</PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeAddressBook">
				<xsl:variable name="var2_resultof_ST__AddressbookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_ST__AddressbookToST__Contact">
					<Contact>
						<xsl:sequence select="(./@node(), ./node())"/>
					</Contact>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeNationalityCode">
				<NationalityCode>
					<xsl:sequence select="fn:string(.)"/>
				</NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeIncorporationCountryCode">
				<IncorporationCountryCode>
					<xsl:sequence select="fn:string(.)"/>
				</IncorporationCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeIncorporationState">
				<IncorporationState>
					<xsl:sequence select="fn:string(.)"/>
				</IncorporationState>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeKindCode">
				<xsl:variable name="var3_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf14_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_vmf___inputtoresult">
					<RepresentativeCategory>
						<xsl:sequence select="."/>
					</RepresentativeCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:Comment">
				<CommentText>
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns1:RepresentativeVersion">
				<Version>
					<xsl:for-each select="ns1:Comment">
						<CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</CommentText>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionNumber">
						<VersionNumber>
							<xsl:sequence select="fn:string(.)"/>
						</VersionNumber>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionDate">
						<VersionDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</VersionDate>
					</xsl:for-each>
					<xsl:for-each select="ns1:VersionDateTime">
						<VersionDateTime>
							<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
						</VersionDateTime>
					</xsl:for-each>
				</Version>
			</xsl:for-each>
		</Representative>
	</xsl:template>
	<xsl:template name="WIPO:ST86PriorityToST96Priority">
		<xsl:param name="Priority" select="()"/>
		<dgn:Priority>
			<xsl:for-each select="$Priority/ns1:PriorityCountryCode">
				<com:PriorityCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PriorityCountryCode>
			</xsl:for-each>
			<com:ApplicationNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
				<xsl:for-each select="$Priority/ns1:PriorityNumber">
					<com:ApplicationNumberText>
						<xsl:sequence select="fn:string(.)"/>
					</com:ApplicationNumberText>
				</xsl:for-each>
			</com:ApplicationNumber>
			<xsl:for-each select="$Priority/ns1:PriorityDate">
				<com:PriorityApplicationFilingDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:PriorityApplicationFilingDate>
			</xsl:for-each>
			<xsl:for-each select="$Priority/ns1:PriorityHolderName">
				<com:PriorityHolderName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PriorityHolderName>
			</xsl:for-each>
			<xsl:for-each select="$Priority/ns1:PriorityStatusCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf15_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<com:PriorityStatusCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="."/>
					</com:PriorityStatusCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Priority/ns1:PriorityStatusDate">
				<com:PriorityStatusDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:PriorityStatusDate>
			</xsl:for-each>
			<xsl:for-each select="$Priority/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Priority/ns1:PriorityDocument">
				<com:PriorityDocument xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="ns1:DocumentLanguageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentName">
						<com:DocumentName>
							<xsl:sequence select="fn:string(.)"/>
						</com:DocumentName>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentFilename">
						<com:FileName>
							<xsl:sequence select="fn:string(.)"/>
						</com:FileName>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentFileFormat">
						<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf7_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
							<com:DocumentFormatCategory>
								<xsl:sequence select="."/>
							</com:DocumentFormatCategory>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentDate">
						<com:DocumentDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</com:DocumentDate>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentMedia">
						<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf8_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
							<com:DocumentMediaCategory>
								<xsl:sequence select="."/>
							</com:DocumentMediaCategory>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentLocation">
						<com:DocumentLocationURI>
							<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
						</com:DocumentLocationURI>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentVersion">
						<com:DocumentVersion>
							<xsl:sequence select="fn:string(.)"/>
						</com:DocumentVersion>
					</xsl:for-each>
					<xsl:for-each select="ns1:DocumentSizeInByte">
						<com:DocumentSizeQuantity>
							<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
						</com:DocumentSizeQuantity>
					</xsl:for-each>
					<xsl:for-each select="ns1:Comment">
						<com:CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</com:CommentText>
					</xsl:for-each>
				</com:PriorityDocument>
			</xsl:for-each>
		</dgn:Priority>
	</xsl:template>
	<xsl:template name="WIPO:ST86DesignSpecimenToST96DesignSpecimen">
		<xsl:param name="DesignSpecimen" select="()"/>
		<dgn:DesignSpecimen>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenIdentifier">
				<SpecimenIdentifier>
					<xsl:sequence select="fn:string(.)"/>
				</SpecimenIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenKind">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf16_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<DesignSpecimenCategory>
						<xsl:sequence select="."/>
					</DesignSpecimenCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenDescription">
				<SpecimenDescriptionText>
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</SpecimenDescriptionText>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenFilename">
				<com:FileName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:FileName>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenFileFormat">
				<xsl:variable name="var2_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf17_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_vmf___inputtoresult">
					<com:ImageFormatCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="."/>
					</com:ImageFormatCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:SpecimenColourIndicator">
				<com:ColourIndicator xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
				</com:ColourIndicator>
			</xsl:for-each>
			<xsl:for-each select="$DesignSpecimen/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
		</dgn:DesignSpecimen>
	</xsl:template>
	<xsl:template name="WIPO:ST86OppositionEventToST96OppositionEvent">
		<xsl:param name="OppositionEvent" select="()"/>
		<dgn:OppositionEvent>
			<xsl:for-each select="$OppositionEvent/ns1:OppositionEventCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf18_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<OppositionEventCategory>
						<xsl:sequence select="."/>
					</OppositionEventCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$OppositionEvent/ns1:OppositionEventResponseDate">
				<com:OppositionEventResponseDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionEventResponseDate>
			</xsl:for-each>
			<xsl:for-each select="$OppositionEvent/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$OppositionEvent/ns1:OppositionEventDate">
				<com:OppositionEventDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionEventDate>
			</xsl:for-each>
			<xsl:for-each select="$OppositionEvent/ns1:OppositionEventDateTime">
				<com:OppositionEventDateTime xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
				</com:OppositionEventDateTime>
			</xsl:for-each>
		</dgn:OppositionEvent>
	</xsl:template>
	<xsl:template name="WIPO:ST86AddressbookToST96Contact">
		<xsl:param name="AddressBook" select="()"/>
		<xsl:variable name="var6_FormattedNameAddress" as="node()*" select="$AddressBook/ns1:FormattedNameAddress"/>
		<xsl:variable name="var7_ContactInformationDetails" as="node()*" select="$AddressBook/ns1:ContactInformationDetails"/>
		<Contact xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:for-each select="$AddressBook/ns1:AddressLanguageCode">
				<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
			</xsl:for-each>
			<Name>
				<xsl:for-each select="($var6_FormattedNameAddress/ns1:Name/ns1:FormattedName)[fn:exists(ns1:LastName)]">
					<PersonName>
						<PersonStructuredName>
							<xsl:for-each select="ns1:NamePrefix">
								<NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="ns1:FirstName">
								<FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</FirstName>
							</xsl:for-each>
							<xsl:for-each select="ns1:MiddleName">
								<LastName>
									<xsl:sequence select="fn:string(.)"/>
								</LastName>
							</xsl:for-each>
							<xsl:for-each select="ns1:SecondLastName">
								<SecondLastName>
									<xsl:sequence select="fn:string(.)"/>
								</SecondLastName>
							</xsl:for-each>
							<xsl:for-each select="ns1:NameSuffix">
								<NameSuffix>
									<xsl:sequence select="fn:string(.)"/>
								</NameSuffix>
							</xsl:for-each>
							<xsl:for-each select="ns1:NameSynonym">
								<PersonOtherName>
									<xsl:sequence select="fn:string(.)"/>
								</PersonOtherName>
							</xsl:for-each>
						</PersonStructuredName>
					</PersonName>
				</xsl:for-each>
				<xsl:for-each select="$var6_FormattedNameAddress/ns1:Name/ns1:FormattedName">
					<xsl:variable name="var2_cur" as="node()" select="."/>
					<xsl:for-each select="ns1:OrganizationName">
						<xsl:variable name="var1_cur_as_string" as="xs:string" select="fn:string(.)"/>
						<OrganizationName>
							<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="$var1_cur_as_string"/>
							<OrganizationStandardName>
								<xsl:sequence select="$var1_cur_as_string"/>
							</OrganizationStandardName>
							<xsl:for-each select="$var2_cur/ns1:OrganizationDepartment">
								<OrganizationOtherName>
									<xsl:attribute name="organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Department'"/>
									<xsl:sequence select="fn:string(.)"/>
								</OrganizationOtherName>
							</xsl:for-each>
						</OrganizationName>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="$var6_FormattedNameAddress/ns1:Name/ns1:FreeFormatName">
					<xsl:variable name="var3_cur" as="node()" select="."/>
					<xsl:for-each select="(./ns1:FreeFormatNameDetails/ns1:FreeFormatNameLine)[fn:not(fn:exists($var3_cur/ns1:NameKind))]">
						<EntityName>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</EntityName>
					</xsl:for-each>
				</xsl:for-each>
			</Name>
			<PostalAddressBag>
				<xsl:for-each select="$var6_FormattedNameAddress/ns1:Address">
					<xsl:variable name="var4_cur" as="node()" select="."/>
					<PostalAddress>
						<xsl:for-each select="ns1:FormattedAddress">
							<PostalStructuredAddress>
								<xsl:for-each select="$var4_cur/ns1:FreeFormatAddress/ns1:FreeFormatAddressLine">
									<AddressLineText>
										<xsl:for-each select="@sequenceNumber">
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressRoom">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Room'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressFloor">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Floor'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressBuilding">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Building'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressStreet">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Street'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressLine">
									<AddressLineText>
										<xsl:for-each select="@sequenceNumber">
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressCity">
									<CityName>
										<xsl:sequence select="fn:string(.)"/>
									</CityName>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressCounty">
									<GeographicRegionName>
										<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'County'"/>
										<xsl:sequence select="fn:string(.)"/>
									</GeographicRegionName>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressState">
									<GeographicRegionName>
										<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'State'"/>
										<xsl:sequence select="fn:string(.)"/>
									</GeographicRegionName>
								</xsl:for-each>
								<xsl:for-each select="ns1:FormattedAddressCountryCode">
									<CountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</CountryCode>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressPostcode">
									<PostalCode>
										<xsl:sequence select="fn:string(.)"/>
									</PostalCode>
								</xsl:for-each>
								<xsl:for-each select="ns1:AddressMailCode">
									<PostalCode>
										<xsl:sequence select="fn:string(.)"/>
									</PostalCode>
								</xsl:for-each>
							</PostalStructuredAddress>
						</xsl:for-each>
						<xsl:for-each select="$AddressBook/ns1:PostalAddress">
							<PostalAddressText>
								<xsl:sequence select="fn:string(.)"/>
							</PostalAddressText>
						</xsl:for-each>
					</PostalAddress>
				</xsl:for-each>
			</PostalAddressBag>
			<FaxNumberBag>
				<xsl:for-each select="$var7_ContactInformationDetails/ns1:Fax">
					<FaxNumber>
						<xsl:sequence select="fn:string(.)"/>
					</FaxNumber>
				</xsl:for-each>
			</FaxNumberBag>
			<EmailAddressBag>
				<xsl:for-each select="$var7_ContactInformationDetails/ns1:Email">
					<EmailAddressText>
						<xsl:sequence select="fn:string(.)"/>
					</EmailAddressText>
				</xsl:for-each>
			</EmailAddressBag>
			<WebAddressBag>
				<xsl:for-each select="$var7_ContactInformationDetails/ns1:URL">
					<WebAddressURI>
						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
					</WebAddressURI>
				</xsl:for-each>
			</WebAddressBag>
			<PhoneNumberBag>
				<xsl:for-each select="$var7_ContactInformationDetails/ns1:Phone">
					<PhoneNumber>
						<xsl:for-each select="@phoneKind">
							<xsl:variable name="var5_resultof_vmf___inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf19_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var5_resultof_vmf___inputtoresult">
								<xsl:attribute name="phoneNumberCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</PhoneNumber>
				</xsl:for-each>
			</PhoneNumberBag>
			<OtherElectronicAddressBag>
				<xsl:for-each select="$var7_ContactInformationDetails/ns1:OtherElectronicAddress">
					<OtherElectronicAddressText>
						<xsl:sequence select="fn:string(.)"/>
					</OtherElectronicAddressText>
				</xsl:for-each>
			</OtherElectronicAddressBag>
		</Contact>
	</xsl:template>
	<xsl:template name="WIPO:ST86OpponentToST96Opponent">
		<xsl:param name="Opponent" select="()"/>
		<dgn:Opponent>
			<xsl:for-each select="$Opponent/ns1:OpponentNationalityCode">
				<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentLegalEntity">
				<com:LegalEntityName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:LegalEntityName>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentIncorporationCountryCode">
				<com:IncorporationCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentIncorporationState">
				<com:IncorporationState xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationState>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentEntitlement">
				<Entitlement>
					<xsl:for-each select="ns1:EntitlementNationalityCode">
						<com:EntitlementNationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:sequence select="fn:string(.)"/>
						</com:EntitlementNationalityCode>
					</xsl:for-each>
					<xsl:for-each select="ns1:HabitualResidence">
						<HabitualResidence>
							<xsl:for-each select="ns1:HabitualResidenceCode">
								<HabitualResidenceCode>
									<xsl:sequence select="fn:string(.)"/>
								</HabitualResidenceCode>
							</xsl:for-each>
							<xsl:for-each select="ns1:HabitualResidenceAddressBook">
								<xsl:variable name="var1_resultof_ST__AddressbookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var1_resultof_ST__AddressbookToST__Contact">
									<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</HabitualResidence>
					</xsl:for-each>
					<xsl:for-each select="ns1:EntitlementEstablishment">
						<com:EntitlementEstablishment xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns1:EntitlementEstablishmentCode">
								<com:EntitlementEstablishmentCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementEstablishmentCode>
							</xsl:for-each>
							<xsl:for-each select="ns1:EntitlementEstablishmentAddressBook">
								<xsl:variable name="var2_resultof_ST__AddressbookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var2_resultof_ST__AddressbookToST__Contact">
									<com:Contact>
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</com:EntitlementEstablishment>
					</xsl:for-each>
					<xsl:for-each select="ns1:EntitlementDomiciled">
						<com:EntitlementDomiciled xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns1:EntitlementDomiciledCode">
								<com:EntitlementDomiciledCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementDomiciledCode>
							</xsl:for-each>
							<xsl:for-each select="ns1:EntitlementDomiciledAddressBook">
								<xsl:variable name="var3_resultof_ST__AddressbookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var3_resultof_ST__AddressbookToST__Contact">
									<com:Contact>
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</com:EntitlementDomiciled>
					</xsl:for-each>
				</Entitlement>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentIdentifier">
				<com:PartyIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Opponent/ns1:OpponentAddressBook">
				<xsl:variable name="var4_resultof_ST__AddressbookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:ST86AddressbookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var4_resultof_ST__AddressbookToST__Contact">
					<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="(./@node(), ./node())"/>
					</com:Contact>
				</xsl:for-each>
			</xsl:for-each>
		</dgn:Opponent>
	</xsl:template>
	<xsl:template name="WIPO:ST86DesignRepresentationSheetToST96DesignRepresentationSheet">
		<xsl:param name="DesignRepresentationSheet" select="()"/>
		<dgn:DesignRepresentation>
			<DesignRepresentationSheetBag>
				<DesignRepresentationSheet>
					<xsl:for-each select="$DesignRepresentationSheet/ns1:RepresentationSheetFilename">
						<com:FileName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:sequence select="fn:string(.)"/>
						</com:FileName>
					</xsl:for-each>
					<xsl:for-each select="$DesignRepresentationSheet/ns1:RepresentationSheetFileFormat">
						<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf20_inputtoresult">
								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
							<com:ImageFormatCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="."/>
							</com:ImageFormatCategory>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="$DesignRepresentationSheet/ns1:RepresentationSheetColourIndicator">
						<com:ColourIndicator xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
						</com:ColourIndicator>
					</xsl:for-each>
				</DesignRepresentationSheet>
			</DesignRepresentationSheetBag>
			<xsl:for-each select="$DesignRepresentationSheet/ns1:ViewDetails">
				<ViewBag>
					<xsl:for-each select="ns1:View">
						<xsl:variable name="var2_ViewRepresentationSize" as="node()*" select="ns1:ViewRepresentationSize"/>
						<View>
							<xsl:for-each select="ns1:ViewFilename">
								<com:FileName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="fn:string(.)"/>
								</com:FileName>
							</xsl:for-each>
							<xsl:for-each select="ns1:ViewFileFormat">
								<ViewFileFormatCategory>
									<xsl:sequence select="fn:string(.)"/>
								</ViewFileFormatCategory>
							</xsl:for-each>
							<xsl:for-each select="ns1:ViewTitle">
								<com:Caption xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="fn:string(.)"/>
								</com:Caption>
							</xsl:for-each>
							<xsl:for-each select="ns1:ViewColourIndicator">
								<com:ColourIndicator xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
								</com:ColourIndicator>
							</xsl:for-each>
							<xsl:for-each select="ns1:ViewKind">
								<RepresentationFormCategory>
									<xsl:sequence select="fn:string(.)"/>
								</RepresentationFormCategory>
							</xsl:for-each>
							<xsl:for-each select="ns1:ViewCategory">
								<ViewClassification>
									<com:FigurativeElementClassificationBag xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<com:NationalFigurativeElementClassificationBag>
											<xsl:for-each select="ns1:CategoryVersion">
												<com:NationalClassificationEdition>
													<xsl:sequence select="fn:string(.)"/>
												</com:NationalClassificationEdition>
											</xsl:for-each>
											<xsl:for-each select="ns1:CategoryCodeDetails/ns1:CategoryCode">
												<com:NationalFigurativeElementClassification>
													<xsl:sequence select="fn:string(.)"/>
												</com:NationalFigurativeElementClassification>
											</xsl:for-each>
										</com:NationalFigurativeElementClassificationBag>
									</com:FigurativeElementClassificationBag>
								</ViewClassification>
							</xsl:for-each>
							<xsl:for-each select="$var2_ViewRepresentationSize/ns1:Height">
								<com:HeightMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
								</com:HeightMeasure>
							</xsl:for-each>
							<xsl:for-each select="$var2_ViewRepresentationSize/ns1:Width">
								<com:WidthMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
								</com:WidthMeasure>
							</xsl:for-each>
						</View>
					</xsl:for-each>
				</ViewBag>
			</xsl:for-each>
		</dgn:DesignRepresentation>
	</xsl:template>
	<xsl:template name="WIPO:ST86EarlierDesignToST96EarlierDesign">
		<xsl:param name="EarlierDesign" select="()"/>
		<dgn:EarlierDesign>
			<xsl:for-each select="$EarlierDesign/ns1:DesignApplicationDate">
				<com:ApplicationDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:ApplicationDate>
			</xsl:for-each>
			<DesignRepresentationBag>
				<xsl:for-each select="$EarlierDesign/ns1:DesignRepresentationSheetDetails/ns1:DesignRepresentationSheet">
					<xsl:variable name="var1_resultof_ST__DesignRepresentationSheetToST__DesignRepresentationSheet" as="node()?">
						<xsl:call-template name="WIPO:ST86DesignRepresentationSheetToST96DesignRepresentationSheet">
							<xsl:with-param name="DesignRepresentationSheet" as="node()">
								<DesignRepresentationSheetType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
									<xsl:sequence select="(./@node(), ./node())"/>
								</DesignRepresentationSheetType>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:for-each select="$var1_resultof_ST__DesignRepresentationSheetToST__DesignRepresentationSheet">
						<DesignRepresentation>
							<xsl:for-each select="dgn:DesignRepresentationSheetBag">
								<DesignRepresentationSheetBag>
									<xsl:sequence select="()"/>
								</DesignRepresentationSheetBag>
							</xsl:for-each>
						</DesignRepresentation>
					</xsl:for-each>
				</xsl:for-each>
			</DesignRepresentationBag>
			<xsl:for-each select="$EarlierDesign/ns1:DesignApplicationIdentifier">
				<DesignApplicationIdentifier>
					<xsl:sequence select="fn:string(.)"/>
				</DesignApplicationIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$EarlierDesign/ns1:DesignRegistrationIdentifier">
				<DesignRegistrationIdentifier>
					<xsl:sequence select="fn:string(.)"/>
				</DesignRegistrationIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$EarlierDesign/ns1:DesignRegistrationDate">
				<DesignRegistrationDate>
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</DesignRegistrationDate>
			</xsl:for-each>
			<xsl:for-each select="$EarlierDesign/ns1:EarlierDesignCountryCode">
				<EarlierDesignCountryCode>
					<xsl:sequence select="fn:string(.)"/>
				</EarlierDesignCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$EarlierDesign/ns1:EarlierDesignKind">
				<xsl:variable name="var2_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf21_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_vmf___inputtoresult">
					<EarlierDesignCategory>
						<xsl:sequence select="."/>
					</EarlierDesignCategory>
				</xsl:for-each>
			</xsl:for-each>
		</dgn:EarlierDesign>
	</xsl:template>
	<xsl:template name="WIPO:ST86OppositionToST96Opposition">
		<xsl:param name="Opposition" select="()"/>
		<dgn:Opposition>
			<xsl:for-each select="$Opposition/ns1:OppositionIdentifier">
				<com:OppositionIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionDate">
				<com:OppositionDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionReference">
				<com:OppositionReference xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionReference>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionLanguageCode">
				<com:OppositionLanguageCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionLanguageCode>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:ProceedingLanguageCode">
				<com:ProceedingLanguageCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:ProceedingLanguageCode>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:EarlierRightDate">
				<com:EarlierRightDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:EarlierRightDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:EarlierRightKind">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf22_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<com:EarlierRightCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="."/>
					</com:EarlierRightCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionBasisCode">
				<xsl:variable name="var2_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf23_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_vmf___inputtoresult">
					<OppositionBasisCategory>
						<xsl:sequence select="."/>
					</OppositionBasisCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionGroundText">
				<com:OppositionGroundsText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionGroundsText>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionExtentText">
				<com:OppositionExtentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionExtentText>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionCurrentStatusCode">
				<xsl:variable name="var3_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf24_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_vmf___inputtoresult">
					<OppositionCurrentStatusCategory>
						<xsl:sequence select="."/>
					</OppositionCurrentStatusCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionCurrentStatusDate">
				<com:OppositionCurrentStatusDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionCurrentStatusDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:EarlierDesignDetails">
				<EarlierDesignBag>
					<xsl:for-each select="ns1:EarlierDesign">
						<xsl:variable name="var4_resultof_ST__EarlierDesignToST__EarlierDesign" as="node()?">
							<xsl:call-template name="WIPO:ST86EarlierDesignToST96EarlierDesign">
								<xsl:with-param name="EarlierDesign" as="node()">
									<EarlierDesignType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
										<xsl:sequence select="(./@node(), ./node())"/>
									</EarlierDesignType>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var4_resultof_ST__EarlierDesignToST__EarlierDesign">
							<EarlierDesign>
								<xsl:sequence select="(./@node(), ./node())"/>
							</EarlierDesign>
						</xsl:for-each>
					</xsl:for-each>
				</EarlierDesignBag>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OpponentDetails">
				<OpponentBag>
					<xsl:for-each select="ns1:Opponent">
						<xsl:variable name="var5_resultof_ST__OpponentToST__Opponent" as="node()?">
							<xsl:call-template name="WIPO:ST86OpponentToST96Opponent">
								<xsl:with-param name="Opponent" as="node()">
									<OpponentType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
										<xsl:sequence select="(./@node(), ./node())"/>
									</OpponentType>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var5_resultof_ST__OpponentToST__Opponent">
							<Opponent>
								<xsl:sequence select="(./@node(), ./node())"/>
							</Opponent>
						</xsl:for-each>
					</xsl:for-each>
				</OpponentBag>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionEventDetails">
				<OppositionEventBag>
					<xsl:for-each select="ns1:OppositionEvent">
						<xsl:variable name="var6_resultof_ST__OppositionEventToST__OppositionEvent" as="node()?">
							<xsl:call-template name="WIPO:ST86OppositionEventToST96OppositionEvent">
								<xsl:with-param name="OppositionEvent" as="node()">
									<OppositionEventType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
										<xsl:sequence select="(./@node(), ./node())"/>
									</OppositionEventType>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var6_resultof_ST__OppositionEventToST__OppositionEvent">
							<OppositionEvent>
								<xsl:sequence select="(./@node(), ./node())"/>
							</OppositionEvent>
						</xsl:for-each>
					</xsl:for-each>
				</OppositionEventBag>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns1:OppositionDocumentDetails">
				<com:OppositionDocumentBag xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="ns1:OppositionDocument">
						<com:OppositionDocument>
							<xsl:for-each select="ns1:DocumentLanguageCode">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentName">
								<com:DocumentName>
									<xsl:sequence select="fn:string(.)"/>
								</com:DocumentName>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentFilename">
								<com:FileName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FileName>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentFileFormat">
								<xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf7_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var7_resultof_vmf__inputtoresult">
									<com:DocumentFormatCategory>
										<xsl:sequence select="."/>
									</com:DocumentFormatCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentDate">
								<com:DocumentDate>
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:DocumentDate>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentMedia">
								<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf8_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
									<com:DocumentMediaCategory>
										<xsl:sequence select="."/>
									</com:DocumentMediaCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentLocation">
								<com:DocumentLocationURI>
									<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
								</com:DocumentLocationURI>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentVersion">
								<com:DocumentVersion>
									<xsl:sequence select="fn:string(.)"/>
								</com:DocumentVersion>
							</xsl:for-each>
							<xsl:for-each select="ns1:DocumentSizeInByte">
								<com:DocumentSizeQuantity>
									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
								</com:DocumentSizeQuantity>
							</xsl:for-each>
							<xsl:for-each select="ns1:Comment">
								<com:CommentText>
									<xsl:for-each select="@languageCode">
										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:sequence select="fn:string(.)"/>
								</com:CommentText>
							</xsl:for-each>
						</com:OppositionDocument>
					</xsl:for-each>
				</com:OppositionDocumentBag>
			</xsl:for-each>
		</dgn:Opposition>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Design E-Filing'">
				<xsl:copy-of select="'Design eFiling'"/>
			</xsl:when>
			<xsl:when test="$input='Design B2B-Filing'">
				<xsl:copy-of select="'Design B2B filing'"/>
			</xsl:when>
			<xsl:when test="$input='Design Information'">
				<xsl:copy-of select="'Design information'"/>
			</xsl:when>
			<xsl:when test="$input='Design Identifier List'">
				<xsl:copy-of select="'Design identifier list'"/>
			</xsl:when>
			<xsl:when test="$input='Design List'">
				<xsl:copy-of select="'Design list'"/>
			</xsl:when>
			<xsl:when test="$input='Design Opposition E-Filing'">
				<xsl:copy-of select="'Design opposition eFiling'"/>
			</xsl:when>
			<xsl:when test="$input='Design Opposition Information'">
				<xsl:copy-of select="'Design opposition information'"/>
			</xsl:when>
			<xsl:when test="$input='Design Opposition Identifier List'">
				<xsl:copy-of select="'Design opposition identifier list'"/>
			</xsl:when>
			<xsl:when test="$input='Representative Appointment'">
				<xsl:copy-of select="'Representative appointment'"/>
			</xsl:when>
			<xsl:when test="$input='Amendment Registered Design'">
				<xsl:copy-of select="'Amendment registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Amendment Application'">
				<xsl:copy-of select="'Amendment application'"/>
			</xsl:when>
			<xsl:when test="$input='Convention Application'">
				<xsl:copy-of select="'Convention application'"/>
			</xsl:when>
			<xsl:when test="$input='Additional Application'">
				<xsl:copy-of select="'Additional application'"/>
			</xsl:when>
			<xsl:when test="$input='Subsequent Application'">
				<xsl:copy-of select="'Subsequent application'"/>
			</xsl:when>
			<xsl:when test="$input='Divisional Application'">
				<xsl:copy-of select="'Divisional application'"/>
			</xsl:when>
			<xsl:when test="$input='Assignment Application'">
				<xsl:copy-of select="'Assignment application'"/>
			</xsl:when>
			<xsl:when test="$input='Assignment Registered Design'">
				<xsl:copy-of select="'Assignment registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Request Certified Copies'">
				<xsl:copy-of select="'Request certified copies'"/>
			</xsl:when>
			<xsl:when test="$input='Request Extension Time'">
				<xsl:copy-of select="'Request extension time'"/>
			</xsl:when>
			<xsl:when test="$input='Request Hearing'">
				<xsl:copy-of select="'Request hearing'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition First Extension'">
				<xsl:copy-of select="'Opposition first extension'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition Various Renewal/Extension of Registration Restoration'">
				<xsl:copy-of select="'Opposition various renewal or extension of registration restoration'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawal'">
				<xsl:copy-of select="'Withdrawal'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw Application'">
				<xsl:copy-of select="'Withdraw application'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw Design'">
				<xsl:copy-of select="'Withdraw design'"/>
			</xsl:when>
			<xsl:when test="$input='Response Examination Report'">
				<xsl:copy-of select="'Response examination report'"/>
			</xsl:when>
			<xsl:when test="$input='Statement Support'">
				<xsl:copy-of select="'Statement support'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw Service Request'">
				<xsl:copy-of select="'Withdraw service request'"/>
			</xsl:when>
			<xsl:when test="$input='Request Publication'">
				<xsl:copy-of select="'Request publication'"/>
			</xsl:when>
			<xsl:when test="$input='Request Registration'">
				<xsl:copy-of select="'Request registration'"/>
			</xsl:when>
			<xsl:when test="$input='Offer Surrender'">
				<xsl:copy-of select="'Offer surrender'"/>
			</xsl:when>
			<xsl:when test="$input='Request Exclusion'">
				<xsl:copy-of select="'Request exclusion'"/>
			</xsl:when>
			<xsl:when test="$input='Request Conversion'">
				<xsl:copy-of select="'Request conversion'"/>
			</xsl:when>
			<xsl:when test="$input='Duplicate Certificate'">
				<xsl:copy-of select="'Duplicate certificate'"/>
			</xsl:when>
			<xsl:when test="$input='Request Supply Documents'">
				<xsl:copy-of select="'Request supply documents'"/>
			</xsl:when>
			<xsl:when test="$input='Request Delayed Registration'">
				<xsl:copy-of select="'Request delayed registration'"/>
			</xsl:when>
			<xsl:when test="$input='Request Accelerated Examination'">
				<xsl:copy-of select="'Request accelerated examination'"/>
			</xsl:when>
			<xsl:when test="$input='Expiry Notice'">
				<xsl:copy-of select="'Expiry notice'"/>
			</xsl:when>
			<xsl:when test="$input='Refusal Withdrawal Notification'">
				<xsl:copy-of select="'Refusal withdrawal notification'"/>
			</xsl:when>
			<xsl:when test="$input='Division International Registration Notification'">
				<xsl:copy-of select="'Division international registration notification'"/>
			</xsl:when>
			<xsl:when test="$input='Refusal Notification'">
				<xsl:copy-of select="'Refusal notification'"/>
			</xsl:when>
			<xsl:when test="$input='Providing Certificate To Holder'">
				<xsl:copy-of select="'Providing certificate to holder'"/>
			</xsl:when>
			<xsl:when test="$input='Transmittal Application To IB'">
				<xsl:copy-of select="'Transmittal application to IB'"/>
			</xsl:when>
			<xsl:when test="$input='Irregularities'">
				<xsl:copy-of select="'Irregularities'"/>
			</xsl:when>
			<xsl:when test="$input='Invalidation Notification'">
				<xsl:copy-of select="'Invalidation notification'"/>
			</xsl:when>
			<xsl:when test="$input='Cancellation Representative Appointment'">
				<xsl:copy-of select="'Cancellation representative appointment'"/>
			</xsl:when>
			<xsl:when test="$input='Application Receipt'">
				<xsl:copy-of select="'Application receipt'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Design Formality Examination'">
				<xsl:copy-of select="'Notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Design Substantial Examination'">
				<xsl:copy-of select="'Notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Design Registration'">
				<xsl:copy-of select="'Notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Trial Examination - Invitation'">
				<xsl:copy-of select="'Notice document by trial examination_invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Trial Examination'">
				<xsl:copy-of select="'Notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document By Trial Examination - Decision'">
				<xsl:copy-of select="'Notice document by trial examination_decision'"/>
			</xsl:when>
			<xsl:when test="$input='Memo By Design Formality Examination'">
				<xsl:copy-of select="'Memo by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo By Design Substantial Examination'">
				<xsl:copy-of select="'Memo by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo By Trial Examination'">
				<xsl:copy-of select="'Memo by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo By Trial Notice'">
				<xsl:copy-of select="'Memo by trial notice'"/>
			</xsl:when>
			<xsl:when test="$input='Memo By Trial Examination - Correction'">
				<xsl:copy-of select="'Memo by trial examination_correction'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Application Document'">
				<xsl:copy-of select="'Accept design application document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Applicant Document'">
				<xsl:copy-of select="'Accept design applicant document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Attorney Document'">
				<xsl:copy-of select="'Accept design attorney document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Withdrawal And Abandonment Document'">
				<xsl:copy-of select="'Accept design withdrawal and abandonment document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Response Document'">
				<xsl:copy-of select="'Accept design response document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Submission Document'">
				<xsl:copy-of select="'Accept design submission document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Amendment Document'">
				<xsl:copy-of select="'Accept design amendment document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Design Request For Inspection'">
				<xsl:copy-of select="'Accept design request for inspection'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Demand For A Trial'">
				<xsl:copy-of select="'Accept demand for a trial'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Trial Intermediate Document'">
				<xsl:copy-of select="'Accept trial intermediate document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Application Document'">
				<xsl:copy-of select="'Inspection accept design application document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Applicant Document'">
				<xsl:copy-of select="'Inspection accept design applicant document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Attorney Document'">
				<xsl:copy-of select="'Inspection accept design attorney document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Withdrawal And Abandonment Document'">
				<xsl:copy-of select="'Inspection accept design withdrawal and abandonment document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Response Document'">
				<xsl:copy-of select="'Inspection accept design response document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Submission Document'">
				<xsl:copy-of select="'Inspection accept design submission document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Amendment Document'">
				<xsl:copy-of select="'Inspection accept design amendment document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Design Request For Inspection'">
				<xsl:copy-of select="'Inspection accept design request for inspection'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Demand For A Trial'">
				<xsl:copy-of select="'Inspection accept demand for a trial'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Accept Trial Intermediate Document'">
				<xsl:copy-of select="'Inspection accept trial intermediate document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Design Formality Examination'">
				<xsl:copy-of select="'Inspection notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Design Substantial Examination'">
				<xsl:copy-of select="'Inspection notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Design Registration'">
				<xsl:copy-of select="'Inspection notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Trial Examination - Invitation'">
				<xsl:copy-of select="'Inspection notice document by trial examination_invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Trial Examination'">
				<xsl:copy-of select="'Inspection notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Notice Document By Trial Examination - Decision'">
				<xsl:copy-of select="'Inspection notice document by trial examination_decision'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Memo By Design Formality Examination'">
				<xsl:copy-of select="'Inspection memo by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Memo By Design Substantial Examination'">
				<xsl:copy-of select="'Inspection memo by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Memo By Trial Examination'">
				<xsl:copy-of select="'Inspection memo by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection Memo By Trial Notice'">
				<xsl:copy-of select="'Inspection memo by trial notice'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Design Formality Examination'">
				<xsl:copy-of select="'Certified copy notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Design Substantial Examination'">
				<xsl:copy-of select="'Certified copy Notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Design Registration'">
				<xsl:copy-of select="'Certified copy notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Trial Examination - Invitation'">
				<xsl:copy-of select="'Certified copy notice document by trial examination_invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Trial Examination'">
				<xsl:copy-of select="'Certified copy notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified Copy Notice Document By Trial Examination - Decision'">
				<xsl:copy-of select="'Certified copy notice document by trial examination_decision'"/>
			</xsl:when>
			<xsl:when test="$input='Accept Document List'">
				<xsl:copy-of select="'Accept document list'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document List'">
				<xsl:copy-of select="'Notice document list'"/>
			</xsl:when>
			<xsl:when test="$input='Application Information'">
				<xsl:copy-of select="'Application information'"/>
			</xsl:when>
			<xsl:when test="$input='Balance Sheet Reference'">
				<xsl:copy-of select="'Balance sheet reference'"/>
			</xsl:when>
			<xsl:when test="$input='Division Number List'">
				<xsl:copy-of select="'Division number list'"/>
			</xsl:when>
			<xsl:when test="$input='Record Licence'">
				<xsl:copy-of select="'Record licence'"/>
			</xsl:when>
			<xsl:when test="$input='Record Mortgagee'">
				<xsl:copy-of select="'Record mortgagee'"/>
			</xsl:when>
			<xsl:when test="$input='Terminate Licence'">
				<xsl:copy-of select="'Terminate licence'"/>
			</xsl:when>
			<xsl:when test="$input='Discharge Mortgagee'">
				<xsl:copy-of select="'Discharge mortgagee'"/>
			</xsl:when>
			<xsl:when test="$input='Change of Name'">
				<xsl:copy-of select="'Change of name'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accelerated Registration'">
				<xsl:copy-of select="'Accelerated registration'"/>
			</xsl:when>
			<xsl:when test="$input='Normal'">
				<xsl:copy-of select="'Normal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='InYear'">
				<xsl:copy-of select="'In year'"/>
			</xsl:when>
			<xsl:when test="$input='InMonth'">
				<xsl:copy-of select="'In month'"/>
			</xsl:when>
			<xsl:when test="$input='InWeek'">
				<xsl:copy-of select="'In week'"/>
			</xsl:when>
			<xsl:when test="$input='InDay'">
				<xsl:copy-of select="'In day'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Filed'">
				<xsl:copy-of select="'Filed'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Rejected'">
				<xsl:copy-of select="'Rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Registered'">
				<xsl:copy-of select="'Registered'"/>
			</xsl:when>
			<xsl:when test="$input='Cancelled'">
				<xsl:copy-of select="'Cancelled'"/>
			</xsl:when>
			<xsl:when test="$input='Expired'">
				<xsl:copy-of select="'Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Division'">
				<xsl:copy-of select="'Division'"/>
			</xsl:when>
			<xsl:when test="$input='Related Design'">
				<xsl:copy-of select="'Related design'"/>
			</xsl:when>
			<xsl:when test="$input='Design Application Based on Patent or Utility Model'">
				<xsl:copy-of select="'Design application based on patent or utility model'"/>
			</xsl:when>
			<xsl:when test="$input='New Application for Amended Design'">
				<xsl:copy-of select="'New application for amended design'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf6_inputtoresult">
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
	<xsl:template name="vmf:vmf7_inputtoresult">
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
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf8_inputtoresult">
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
	<xsl:template name="vmf:vmf9_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Applications'">
				<xsl:copy-of select="'Applications'"/>
			</xsl:when>
			<xsl:when test="$input='Amendments to applications'">
				<xsl:copy-of select="'Amendments to applications'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of errors on applications'">
				<xsl:copy-of select="'Correction of errors on applications'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawals'">
				<xsl:copy-of select="'Withdrawals'"/>
			</xsl:when>
			<xsl:when test="$input='Limitations'">
				<xsl:copy-of select="'Limitations'"/>
			</xsl:when>
			<xsl:when test="$input='Total refusals'">
				<xsl:copy-of select="'Total refusals'"/>
			</xsl:when>
			<xsl:when test="$input='Partial refusals'">
				<xsl:copy-of select="'Partial refusals'"/>
			</xsl:when>
			<xsl:when test="$input='Registrations with no amendments'">
				<xsl:copy-of select="'Registrations with no amendments'"/>
			</xsl:when>
			<xsl:when test="$input='Registrations with amendments'">
				<xsl:copy-of select="'Registrations with amendments'"/>
			</xsl:when>
			<xsl:when test="$input='Correction of errors on registrations'">
				<xsl:copy-of select="'Correction of errors on registrations'"/>
			</xsl:when>
			<xsl:when test="$input='Total transfers'">
				<xsl:copy-of select="'Total transfers'"/>
			</xsl:when>
			<xsl:when test="$input='Partial transfers'">
				<xsl:copy-of select="'Partial transfers'"/>
			</xsl:when>
			<xsl:when test="$input='Change of name and address of proprietor'">
				<xsl:copy-of select="'Change of name and address of proprietor'"/>
			</xsl:when>
			<xsl:when test="$input='Change of name and professional address of representative'">
				<xsl:copy-of select="'Change of name and professional address of representative'"/>
			</xsl:when>
			<xsl:when test="$input='Replacement of representative'">
				<xsl:copy-of select="'Replacement of representative'"/>
			</xsl:when>
			<xsl:when test="$input='Appointment of a new representative'">
				<xsl:copy-of select="'Appointment of a new representative'"/>
			</xsl:when>
			<xsl:when test="$input='Deletion of the representative'">
				<xsl:copy-of select="'Deletion of the representative'"/>
			</xsl:when>
			<xsl:when test="$input='Total surrender of designs'">
				<xsl:copy-of select="'Total surrender of designs'"/>
			</xsl:when>
			<xsl:when test="$input='Partial surrender of designs'">
				<xsl:copy-of select="'Partial surrender of designs'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf10_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Registered'">
				<xsl:copy-of select="'Registered'"/>
			</xsl:when>
			<xsl:when test="$input='Expired'">
				<xsl:copy-of select="'Expired'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf11_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Insert'">
				<xsl:copy-of select="'Insert'"/>
			</xsl:when>
			<xsl:when test="$input='Update'">
				<xsl:copy-of select="'Update'"/>
			</xsl:when>
			<xsl:when test="$input='Delete'">
				<xsl:copy-of select="'Delete'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf12_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Insert'">
				<xsl:copy-of select="'Insert'"/>
			</xsl:when>
			<xsl:when test="$input='Update'">
				<xsl:copy-of select="'Update'"/>
			</xsl:when>
			<xsl:when test="$input='Delete'">
				<xsl:copy-of select="'Delete'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf13_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Insert'">
				<xsl:copy-of select="'Insert'"/>
			</xsl:when>
			<xsl:when test="$input='Update'">
				<xsl:copy-of select="'Update'"/>
			</xsl:when>
			<xsl:when test="$input='Delete'">
				<xsl:copy-of select="'Delete'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf14_inputtoresult">
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
			<xsl:when test="$input='Professional Representative'">
				<xsl:copy-of select="'Professional representative'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf15_inputtoresult">
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
			<xsl:when test="$input='Partially Refused'">
				<xsl:copy-of select="'Partially refused'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf16_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Object'">
				<xsl:copy-of select="'Object'"/>
			</xsl:when>
			<xsl:when test="$input='Model'">
				<xsl:copy-of select="'Model'"/>
			</xsl:when>
			<xsl:when test="$input='Sample'">
				<xsl:copy-of select="'Sample'"/>
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
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility checked'">
				<xsl:copy-of select="'Admissibility checked'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties'">
				<xsl:copy-of select="'Agreement between parties'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision'">
				<xsl:copy-of select="'Final decision'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf19_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Fixed'">
				<xsl:copy-of select="'Business fixed'"/>
			</xsl:when>
			<xsl:when test="$input='Mobile Phone'">
				<xsl:copy-of select="'Business mobile'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf20_inputtoresult">
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
	<xsl:template name="vmf:vmf21_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Registered design'">
				<xsl:copy-of select="'Registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Unregistered design'">
				<xsl:copy-of select="'Unregistered design'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf22_inputtoresult">
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
	<xsl:template name="vmf:vmf23_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Design application'">
				<xsl:copy-of select="'Design application'"/>
			</xsl:when>
			<xsl:when test="$input='Registered design'">
				<xsl:copy-of select="'Registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Non-registered design'">
				<xsl:copy-of select="'Non-registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Trade mark'">
				<xsl:copy-of select="'Trademark'"/>
			</xsl:when>
			<xsl:when test="$input='Patent'">
				<xsl:copy-of select="'Patent'"/>
			</xsl:when>
			<xsl:when test="$input='Utility model'">
				<xsl:copy-of select="'Utility model'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf24_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility checked'">
				<xsl:copy-of select="'Admissibility checked'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties'">
				<xsl:copy-of select="'Agreement between parties'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision'">
				<xsl:copy-of select="'Final decision'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:variable name="var21_Transaction" as="node()?" select="ns1:Transaction"/>
		<dgn:DesignTransaction xmlns:dgn="http://www.wipo.int/standards/XMLSchema/ST96/Design" xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0" xmlns:mathml="http://www.w3.org/1998/Math/MathML3" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/ST96/Design ../../Schemas/ST96Schema/ST96XMLSchema_Current_Flattened/DesignTransaction_V6_0.xsd'"/>
			<xsl:for-each select="$var21_Transaction">
				<xsl:attribute name="com:st96Version" select="'V6_0'"/>
			</xsl:for-each>
			<xsl:for-each select="$var21_Transaction">
				<xsl:for-each select="ns1:TransactionHeader">
					<com:TransactionHeader>
						<xsl:for-each select="ns1:SenderDetails">
							<com:SenderBag>
								<xsl:for-each select="ns1:RequestIdentifier">
									<com:RequestIdentifier>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestIdentifier>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestLanguageCode">
									<com:RequestLanguageCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestLanguageCode>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestXSDVersion">
									<com:RequestXSDVersion>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestXSDVersion>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestFilename">
									<com:FileName>
										<xsl:sequence select="fn:string(.)"/>
									</com:FileName>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestStatus">
									<com:RequestStatusCategory>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestStatusCategory>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestProducer">
									<com:RequestProducer>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestProducer>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestReceivingOfficeCode">
									<com:RequestReceivingOfficeCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestReceivingOfficeCode>
								</xsl:for-each>
								<xsl:for-each select="ns1:LoginInformation">
									<com:LoginInformation>
										<xsl:for-each select="ns1:Login">
											<com:Login>
												<xsl:sequence select="fn:string(.)"/>
											</com:Login>
										</xsl:for-each>
										<xsl:for-each select="ns1:LoginEmail">
											<com:LoginEmail>
												<xsl:sequence select="fn:string(.)"/>
											</com:LoginEmail>
										</xsl:for-each>
										<xsl:for-each select="ns1:Password">
											<com:Password>
												<xsl:sequence select="fn:string(.)"/>
											</com:Password>
										</xsl:for-each>
									</com:LoginInformation>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestProducerDate">
									<com:RequestDate>
										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
									</com:RequestDate>
								</xsl:for-each>
								<xsl:for-each select="ns1:RequestProducerDateTime">
									<com:RequestDateTime>
										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
									</com:RequestDateTime>
								</xsl:for-each>
							</com:SenderBag>
						</xsl:for-each>
						<xsl:for-each select="ns1:ReceiverDetails">
							<com:ReceiverBag>
								<xsl:for-each select="ns1:ReceiverDateTime">
									<com:ReceiverDateTime>
										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
									</com:ReceiverDateTime>
								</xsl:for-each>
								<xsl:for-each select="ns1:Comment">
									<com:CommentText>
										<xsl:for-each select="@languageCode">
											<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</com:CommentText>
								</xsl:for-each>
							</com:ReceiverBag>
						</xsl:for-each>
					</com:TransactionHeader>
				</xsl:for-each>
				<xsl:for-each select="ns1:DesignTransactionBody">
					<dgn:DesignTransactionBody>
						<xsl:attribute name="com:st96Version" select="'V6_0'"/>
						<xsl:for-each select="ns1:TransactionErrorDetails">
							<com:TransactionErrorBag>
								<xsl:for-each select="ns1:TransactionError">
									<com:TransactionError>
										<xsl:for-each select="ns1:TransactionErrorCode">
											<com:TransactionErrorCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:TransactionErrorCode>
										</xsl:for-each>
										<xsl:for-each select="ns1:TransactionErrorText">
											<com:TransactionErrorText>
												<xsl:for-each select="@languageCode">
													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:sequence select="fn:string(.)"/>
											</com:TransactionErrorText>
										</xsl:for-each>
									</com:TransactionError>
								</xsl:for-each>
							</com:TransactionErrorBag>
						</xsl:for-each>
						<xsl:variable name="var20_TransactionContentDetails" as="node()" select="ns1:TransactionContentDetails"/>
						<dgn:TransactionContentBag>
							<xsl:attribute name="com:st96Version" select="'V6_0'"/>
							<xsl:for-each select="$var20_TransactionContentDetails/ns1:TransactionIdentifier">
								<com:TransactionIdentifier>
									<xsl:sequence select="fn:string(.)"/>
								</com:TransactionIdentifier>
							</xsl:for-each>
							<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf1_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var20_TransactionContentDetails/ns1:TransactionCode)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
								<com:TransactionCategory>
									<xsl:sequence select="."/>
								</com:TransactionCategory>
							</xsl:for-each>
							<xsl:for-each select="$var20_TransactionContentDetails/ns1:TransactionSubCode">
								<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf2_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
									<com:TransactionSubCode>
										<xsl:sequence select="."/>
									</com:TransactionSubCode>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:variable name="var19_TransactionData" as="node()" select="$var20_TransactionContentDetails/ns1:TransactionData"/>
							<dgn:TransactionData>
								<xsl:attribute name="com:st96Version" select="'V6_0'"/>
								<xsl:for-each select="$var19_TransactionData/ns1:DesignApplicationDetails">
									<dgn:DesignApplicationBag>
										<xsl:attribute name="com:st96Version" select="'V6_0'"/>
										<xsl:for-each select="ns1:DesignApplication">
											<xsl:variable name="var3_cur" as="node()" select="."/>
											<dgn:DesignApplication>
												<xsl:attribute name="com:st96Version" select="'V6_0'"/>
												<xsl:for-each select="ns1:RequestSoftware">
													<com:RequestSoftware>
														<com:RequestSoftwareName>
															<xsl:sequence select="fn:string(ns1:RequestSoftwareName)"/>
														</com:RequestSoftwareName>
														<xsl:for-each select="ns1:RequestSoftwareVersion">
															<com:RequestSoftwareVersion>
																<xsl:sequence select="fn:string(.)"/>
															</com:RequestSoftwareVersion>
														</xsl:for-each>
													</com:RequestSoftware>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationFormName">
													<dgn:DesignApplicationFormName>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignApplicationFormName>
												</xsl:for-each>
												<xsl:for-each select="ns1:RequestExamination">
													<com:RequestExamination>
														<xsl:for-each select="ns1:RequestExaminationAuthority">
															<com:RequestExaminationAuthority>
																<xsl:sequence select="fn:string(.)"/>
															</com:RequestExaminationAuthority>
														</xsl:for-each>
														<com:RequestExaminationCategory>
															<xsl:sequence select="fn:string(ns1:RequestExaminationKindCode)"/>
														</com:RequestExaminationCategory>
													</com:RequestExamination>
												</xsl:for-each>
												<com:RegistrationOfficeCode>
													<xsl:sequence select="fn:string(ns1:RegistrationOfficeCode)"/>
												</com:RegistrationOfficeCode>
												<xsl:for-each select="ns1:ReceivingOfficeCode">
													<com:ReceivingOfficeCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:ReceivingOfficeCode>
												</xsl:for-each>
												<xsl:for-each select="ns1:ReceivingOfficeDate">
													<com:ReceivingOfficeDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ReceivingOfficeDate>
												</xsl:for-each>
												<xsl:for-each select="ns1:ReceiptNumber">
													<dgn:ReceiptNumber>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:ReceiptNumber>
												</xsl:for-each>
												<xsl:for-each select="ns1:SealedDepositIndicator">
													<dgn:SealedDepositIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:SealedDepositIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:FilingPlace">
													<com:FilingPlace>
														<xsl:sequence select="fn:string(.)"/>
													</com:FilingPlace>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationReference">
													<com:ApplicantFileReference>
														<xsl:sequence select="fn:string(.)"/>
													</com:ApplicantFileReference>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationLanguageCode">
													<dgn:DesignApplicationLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignApplicationLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns1:SecondLanguageCode">
													<com:SecondLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:SecondLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns1:CorrespondenceLanguageCode">
													<com:CorrespondenceLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:CorrespondenceLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationCurrentStatusDate">
													<dgn:DesignApplicationCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</dgn:DesignApplicationCurrentStatusDate>
												</xsl:for-each>
												<dgn:DesignBag>
													<xsl:for-each select="ns1:DesignDetails/ns1:Design">
														<dgn:Design>
															<xsl:for-each select="ns1:DesignIdentifier">
																<dgn:DesignIdentifier>
																	<xsl:sequence select="fn:string(.)"/>
																</dgn:DesignIdentifier>
															</xsl:for-each>
															<xsl:for-each select="ns1:DesignReference">
																<dgn:DesignReference>
																	<xsl:sequence select="fn:string(.)"/>
																</dgn:DesignReference>
															</xsl:for-each>
															<xsl:for-each select="ns1:RegistrationNumber">
																<com:RegistrationNumber>
																	<xsl:sequence select="fn:string(.)"/>
																</com:RegistrationNumber>
															</xsl:for-each>
															<xsl:for-each select="ns1:RegistrationDate">
																<com:RegistrationDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																</com:RegistrationDate>
															</xsl:for-each>
															<xsl:for-each select="ns1:PublicationKindDescription">
																<dgn:PublicationKindDescription>
																	<xsl:for-each select="@languageCode">
																		<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</dgn:PublicationKindDescription>
															</xsl:for-each>
															<xsl:for-each select="ns1:PartialDesignIndicator">
																<dgn:PartialDesignIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:PartialDesignIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:PublicationDefermentIndicator">
																<dgn:PublicationDefermentIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:PublicationDefermentIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:DefermentPeriod">
																<dgn:DefermentPeriod>
																	<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																</dgn:DefermentPeriod>
															</xsl:for-each>
															<xsl:for-each select="ns1:ColourIndicator">
																<com:ColourIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</com:ColourIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:DesignerWaiverIndicator">
																<dgn:DesignerWaiverIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:DesignerWaiverIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:PublicationInColourIndicator">
																<dgn:PublicationInColourIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:PublicationInColourIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:ImmediatePublicationIndicator">
																<dgn:ImmediatePublicationIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:ImmediatePublicationIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:DescriptionPublicationIndicator">
																<dgn:DescriptionPublicationIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:DescriptionPublicationIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:DesignOpenToLicensingIndicator">
																<dgn:DesignOpenToLicensingIndicator>
																	<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																</dgn:DesignOpenToLicensingIndicator>
															</xsl:for-each>
															<xsl:for-each select="ns1:ExpiryDate">
																<com:ExpiryDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																</com:ExpiryDate>
															</xsl:for-each>
															<xsl:for-each select="ns1:DesignCurrentStatusDate">
																<dgn:DesignCurrentStatusDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																</dgn:DesignCurrentStatusDate>
															</xsl:for-each>
															<dgn:ApplicantBag>
																<xsl:for-each select="$var3_cur/ns1:ApplicantDetails/ns1:Applicant">
																	<dgn:Applicant>
																		<xsl:for-each select="ns1:ApplicantContractingParty">
																			<dgn:ApplicantContractingParty>
																				<xsl:sequence select="fn:string(.)"/>
																			</dgn:ApplicantContractingParty>
																		</xsl:for-each>
																	</dgn:Applicant>
																</xsl:for-each>
															</dgn:ApplicantBag>
														</dgn:Design>
													</xsl:for-each>
												</dgn:DesignBag>
												<xsl:for-each select="ns1:Authorization">
													<com:Authorization>
														<xsl:for-each select="ns1:AuthorizationIdentifier">
															<com:AuthorizationIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:AuthorizationIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns1:AuthorizationDate">
															<com:AuthorizationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:AuthorizationDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:AuthorizationDocument">
															<com:AuthorizationDocument>
																<xsl:for-each select="ns1:DocumentName">
																	<com:DocumentName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentName>
																</xsl:for-each>
																<xsl:for-each select="ns1:DocumentDate">
																	<com:DocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:DocumentDate>
																</xsl:for-each>
																<xsl:for-each select="ns1:DocumentVersion">
																	<com:DocumentVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentVersion>
																</xsl:for-each>
															</com:AuthorizationDocument>
														</xsl:for-each>
													</com:Authorization>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationDate">
													<com:ApplicationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ApplicationDate>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignApplicationDateTime">
													<com:ApplicationDateTime>
														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
													</com:ApplicationDateTime>
												</xsl:for-each>
												<xsl:for-each select="ns1:CorrespondenceAddress">
													<com:CorrespondenceAddress>
														<xsl:sequence select="()"/>
													</com:CorrespondenceAddress>
												</xsl:for-each>
											</dgn:DesignApplication>
										</xsl:for-each>
									</dgn:DesignApplicationBag>
								</xsl:for-each>
								<xsl:for-each select="$var19_TransactionData/ns1:DesignDetails">
									<dgn:DesignBag>
										<xsl:for-each select="ns1:Design">
											<dgn:Design>
												<xsl:for-each select="ns1:DesignIdentifier">
													<dgn:DesignIdentifier>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignIdentifier>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignReference">
													<dgn:DesignReference>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignReference>
												</xsl:for-each>
												<xsl:for-each select="ns1:RegistrationNumber">
													<com:RegistrationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</com:RegistrationNumber>
												</xsl:for-each>
												<xsl:for-each select="ns1:RegistrationDate">
													<com:RegistrationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:RegistrationDate>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignTitle">
													<dgn:DesignTitleText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignTitleText>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignDescription">
													<dgn:DesignDescriptionText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:for-each select="@sequenceNumber">
															<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:DesignDescriptionText>
												</xsl:for-each>
												<xsl:for-each select="ns1:PublicationKindDescription">
													<dgn:PublicationKindDescription>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:PublicationKindDescription>
												</xsl:for-each>
												<xsl:for-each select="ns1:NoveltyStatement">
													<dgn:NoveltyStatementText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:NoveltyStatementText>
												</xsl:for-each>
												<xsl:for-each select="ns1:PartialDesignIndicator">
													<dgn:PartialDesignIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:PartialDesignIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:PartialDisclaimer">
													<dgn:PartialDisclaimerText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:PartialDisclaimerText>
												</xsl:for-each>
												<xsl:for-each select="ns1:DefermentPeriod">
													<dgn:DefermentPeriod>
														<xsl:for-each select="@periodCode">
															<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf3_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var4_resultof_vmf__inputtoresult">
																<xsl:attribute name="com:periodCategory" select="."/>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</dgn:DefermentPeriod>
												</xsl:for-each>
												<xsl:for-each select="ns1:ColourIndicator">
													<com:ColourIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</com:ColourIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignerWaiverIndicator">
													<dgn:DesignerWaiverIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:DesignerWaiverIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:PublicationInColourIndicator">
													<dgn:PublicationInColourIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:PublicationInColourIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:ImmediatePublicationIndicator">
													<dgn:ImmediatePublicationIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:ImmediatePublicationIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:DescriptionPublicationIndicator">
													<dgn:DescriptionPublicationIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:DescriptionPublicationIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignOpenToLicensingIndicator">
													<dgn:DesignOpenToLicensingIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</dgn:DesignOpenToLicensingIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns1:TotalSpecimen">
													<dgn:SpecimenTotalQuantity>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</dgn:SpecimenTotalQuantity>
												</xsl:for-each>
												<xsl:for-each select="ns1:TotalRepresentationSheet">
													<dgn:RepresentationSheetTotalQuantity>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</dgn:RepresentationSheetTotalQuantity>
												</xsl:for-each>
												<xsl:for-each select="ns1:TotalColourView">
													<dgn:ColourViewTotalQuantity>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</dgn:ColourViewTotalQuantity>
												</xsl:for-each>
												<xsl:for-each select="ns1:TotalBWView">
													<dgn:BlackWhiteViewTotalQuantity>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</dgn:BlackWhiteViewTotalQuantity>
												</xsl:for-each>
												<xsl:for-each select="ns1:ExpiryDate">
													<com:ExpiryDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ExpiryDate>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignCurrentStatusCode">
													<xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf4_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var5_resultof_vmf__inputtoresult">
														<dgn:DesignCurrentStatusCategory>
															<xsl:sequence select="."/>
														</dgn:DesignCurrentStatusCategory>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignCurrentStatusDate">
													<dgn:DesignCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</dgn:DesignCurrentStatusDate>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignSpecimenDetails">
													<dgn:DesignSpecimenBag>
														<xsl:for-each select="ns1:DesignSpecimen">
															<xsl:variable name="var6_resultof_ST__DesignSpecimenToST__DesignSpecimen" as="node()?">
																<xsl:call-template name="WIPO:ST86DesignSpecimenToST96DesignSpecimen">
																	<xsl:with-param name="DesignSpecimen" as="node()">
																		<DesignSpecimenType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</DesignSpecimenType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var6_resultof_ST__DesignSpecimenToST__DesignSpecimen">
																<dgn:DesignSpecimen>
																	<xsl:sequence select="()"/>
																</dgn:DesignSpecimen>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:DesignSpecimenBag>
												</xsl:for-each>
												<dgn:DesignRepresentationBag>
													<dgn:DesignRepresentation>
														<xsl:for-each select="ns1:DesignRepresentationSheetDetails">
															<dgn:DesignRepresentationSheetBag>
																<xsl:sequence select="()"/>
															</dgn:DesignRepresentationSheetBag>
														</xsl:for-each>
													</dgn:DesignRepresentation>
												</dgn:DesignRepresentationBag>
												<com:DesignClassificationBag>
													<xsl:for-each select="ns1:IndicationProductDetails/ns1:IndicationProduct">
														<com:NationalDesignClassificationBag>
															<xsl:for-each select="ns1:ClassificationVersion">
																<com:NationalClassificationEdition>
																	<xsl:sequence select="fn:string(.)"/>
																</com:NationalClassificationEdition>
															</xsl:for-each>
															<xsl:for-each select="ns1:IndicationProductDescription">
																<com:NationalDesignProductIndicationText>
																	<xsl:for-each select="@languageCode">
																		<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:for-each select="@sequenceNumber">
																		<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</com:NationalDesignProductIndicationText>
															</xsl:for-each>
														</com:NationalDesignClassificationBag>
													</xsl:for-each>
												</com:DesignClassificationBag>
												<xsl:for-each select="ns1:PriorityDetails">
													<dgn:PriorityBag>
														<xsl:for-each select="ns1:Priority">
															<xsl:variable name="var7_resultof_ST__PriorityToST__Priority" as="node()?">
																<xsl:call-template name="WIPO:ST86PriorityToST96Priority">
																	<xsl:with-param name="Priority" as="node()">
																		<PriorityType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</PriorityType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var7_resultof_ST__PriorityToST__Priority">
																<dgn:Priority>
																	<xsl:sequence select="()"/>
																</dgn:Priority>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:PriorityBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:ExhibitionPriorityDetails">
													<com:ExhibitionPriorityBag>
														<xsl:for-each select="ns1:ExhibitionPriority">
															<xsl:variable name="var8_resultof_ST__ExhibitionPriorityToST__ExhibitionPriority" as="node()?">
																<xsl:call-template name="WIPO:ST86ExhibitionPriorityToST96ExhibitionPriority">
																	<xsl:with-param name="ExhibitionPriority" as="node()">
																		<ExhibitionPriorityType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</ExhibitionPriorityType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var8_resultof_ST__ExhibitionPriorityToST__ExhibitionPriority">
																<com:ExhibitionPriority>
																	<xsl:sequence select="()"/>
																</com:ExhibitionPriority>
															</xsl:for-each>
														</xsl:for-each>
													</com:ExhibitionPriorityBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:RelatedApplicationDetails">
													<dgn:RelatedApplicationBag>
														<xsl:for-each select="ns1:RelatedApplication">
															<xsl:variable name="var9_resultof_ST__RelatedApplicationToST__RelatedApplication" as="node()?">
																<xsl:call-template name="WIPO:ST86RelatedApplicationToST96RelatedApplication">
																	<xsl:with-param name="RelatedApplication" as="node()">
																		<RelatedApplicationType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</RelatedApplicationType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var9_resultof_ST__RelatedApplicationToST__RelatedApplication">
																<dgn:RelatedApplication>
																	<xsl:sequence select="()"/>
																</dgn:RelatedApplication>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:RelatedApplicationBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:StaffDetails">
													<com:StaffBag>
														<xsl:for-each select="ns1:Staff">
															<com:Staff>
																<xsl:sequence select="()"/>
															</com:Staff>
														</xsl:for-each>
													</com:StaffBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:PublicationDetails">
													<dgn:PublicationBag>
														<xsl:for-each select="ns1:Publication">
															<xsl:variable name="var10_resultof_ST__PublicationToST__Publication" as="node()?">
																<xsl:call-template name="WIPO:ST86PublicationToST96Publication">
																	<xsl:with-param name="Publication" as="node()">
																		<PublicationType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</PublicationType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var10_resultof_ST__PublicationToST__Publication">
																<dgn:Publication>
																	<xsl:sequence select="()"/>
																</dgn:Publication>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:PublicationBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:CitationReferenceDetails">
													<dgn:PatentIdentificationBag>
														<xsl:for-each select="ns1:CitationReference">
															<xsl:variable name="var11_CitationIdentifier" as="node()?" select="ns1:CitationIdentifier"/>
															<xsl:variable name="var12_CitationDocument" as="node()?" select="ns1:CitationDocument"/>
															<com:CitedPatentDocumentIdentification>
																<xsl:for-each select="$var12_CitationDocument/ns1:DocumentLocation">
																	<xsl:attribute name="com:sourceURI" select="xs:string(xs:anyURI(fn:string(.)))"/>
																</xsl:for-each>
																<xsl:for-each select="$var11_CitationIdentifier/@identifierKindCode">
																	<com:IPOfficeCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:IPOfficeCode>
																</xsl:for-each>
																<xsl:for-each select="$var11_CitationIdentifier">
																	<com:DocumentNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentNumber>
																</xsl:for-each>
																<xsl:for-each select="ns1:CitationKind">
																	<com:PatentDocumentKindCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PatentDocumentKindCode>
																</xsl:for-each>
																<xsl:for-each select="$var12_CitationDocument/ns1:DocumentDate">
																	<com:PatentDocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:PatentDocumentDate>
																</xsl:for-each>
															</com:CitedPatentDocumentIdentification>
														</xsl:for-each>
													</dgn:PatentIdentificationBag>
												</xsl:for-each>
												<xsl:variable name="var14_ApplicantDetails" as="node()" select="ns1:ApplicantDetails"/>
												<dgn:ApplicantBag>
													<xsl:for-each select="$var14_ApplicantDetails/ns1:ApplicantKey">
														<com:PartyIdentifierBag>
															<xsl:for-each select="ns1:Identifier">
																<com:PartyIdentifier>
																	<xsl:for-each select="@identifierKindCode">
																		<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</com:PartyIdentifier>
															</xsl:for-each>
														</com:PartyIdentifierBag>
													</xsl:for-each>
													<xsl:for-each select="$var14_ApplicantDetails/ns1:Applicant">
														<xsl:variable name="var13_resultof_ST__ApplicantToST__Applicant" as="node()?">
															<xsl:call-template name="WIPO:ST86ApplicantToST96Applicant">
																<xsl:with-param name="Applicant" as="node()">
																	<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																		<xsl:sequence select="(./@node(), ./node())"/>
																	</ApplicantType>
																</xsl:with-param>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var13_resultof_ST__ApplicantToST__Applicant">
															<dgn:Applicant>
																<xsl:sequence select="()"/>
															</dgn:Applicant>
														</xsl:for-each>
													</xsl:for-each>
												</dgn:ApplicantBag>
												<xsl:for-each select="ns1:RepresentativeDetails">
													<com:RepresentativeBag>
														<xsl:for-each select="ns1:RepresentativeKey">
															<com:PartyIdentifierBag>
																<xsl:sequence select="()"/>
															</com:PartyIdentifierBag>
														</xsl:for-each>
														<xsl:for-each select="ns1:Representative">
															<xsl:variable name="var15_resultof_ST__RepresentativeToST__Representative" as="node()?">
																<xsl:call-template name="WIPO:ST86RepresentativeToST96Representative">
																	<xsl:with-param name="Representative" as="node()">
																		<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</RepresentativeType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var15_resultof_ST__RepresentativeToST__Representative">
																<com:Representative>
																	<xsl:sequence select="()"/>
																</com:Representative>
															</xsl:for-each>
														</xsl:for-each>
													</com:RepresentativeBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignerDetails">
													<dgn:DesignerBag>
														<xsl:for-each select="ns1:DesignerKey">
															<com:PartyIdentifierBag>
																<xsl:for-each select="ns1:Identifier">
																	<com:PartyIdentifier>
																		<xsl:for-each select="@identifierKindCode">
																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
															</com:PartyIdentifierBag>
														</xsl:for-each>
														<xsl:for-each select="ns1:Designer">
															<xsl:variable name="var16_resultof_ST__DesignerToST__Designer" as="node()?">
																<xsl:call-template name="WIPO:ST86DesignerToST96Designer">
																	<xsl:with-param name="Designer" as="node()">
																		<DesignerType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</DesignerType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var16_resultof_ST__DesignerToST__Designer">
																<dgn:Designer>
																	<xsl:sequence select="()"/>
																</dgn:Designer>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:DesignerBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:DesignEventDetails">
													<dgn:DesignEventBag>
														<xsl:for-each select="ns1:DesignEvent">
															<xsl:variable name="var17_resultof_ST__DesignEventToST__DesignEvent" as="node()?">
																<xsl:call-template name="WIPO:ST86DesignEventToST96DesignEvent">
																	<xsl:with-param name="DesignEvent" as="node()">
																		<DesignEventType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</DesignEventType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var17_resultof_ST__DesignEventToST__DesignEvent">
																<dgn:DesignEvent>
																	<xsl:sequence select="()"/>
																</dgn:DesignEvent>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:DesignEventBag>
												</xsl:for-each>
												<xsl:for-each select="ns1:OppositionDetails">
													<dgn:OppositionBag>
														<xsl:for-each select="ns1:Opposition">
															<xsl:variable name="var18_resultof_ST__OppositionToST__Opposition" as="node()?">
																<xsl:call-template name="WIPO:ST86OppositionToST96Opposition">
																	<xsl:with-param name="Opposition" as="node()">
																		<OppositionType xmlns="http://www.wipo.int/standards/XMLSchema/designs">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</OppositionType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var18_resultof_ST__OppositionToST__Opposition">
																<dgn:Opposition>
																	<xsl:sequence select="()"/>
																</dgn:Opposition>
															</xsl:for-each>
														</xsl:for-each>
													</dgn:OppositionBag>
												</xsl:for-each>
											</dgn:Design>
										</xsl:for-each>
									</dgn:DesignBag>
								</xsl:for-each>
								<xsl:for-each select="$var19_TransactionData/ns1:ApplicantDetails">
									<dgn:ApplicantBag>
										<xsl:for-each select="ns1:Applicant">
											<dgn:Applicant>
												<xsl:for-each select="ns1:ApplicantContractingParty">
													<dgn:ApplicantContractingParty>
														<xsl:sequence select="fn:string(.)"/>
													</dgn:ApplicantContractingParty>
												</xsl:for-each>
											</dgn:Applicant>
										</xsl:for-each>
									</dgn:ApplicantBag>
								</xsl:for-each>
								<xsl:for-each select="$var19_TransactionData/ns1:RepresentativeDetails">
									<com:RepresentativeBag>
										<xsl:for-each select="ns1:Representative">
											<com:Representative>
												<xsl:sequence select="()"/>
											</com:Representative>
										</xsl:for-each>
									</com:RepresentativeBag>
								</xsl:for-each>
								<xsl:for-each select="$var19_TransactionData/ns1:DesignRecordDetails">
									<dgn:DesignRecordBag>
										<xsl:for-each select="ns1:DesignRecord">
											<dgn:DesignRecord>
												<xsl:for-each select="ns1:DesignBasicRecord">
													<dgn:DesignBasicRecord>
														<xsl:for-each select="ns1:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
													</dgn:DesignBasicRecord>
												</xsl:for-each>
												<xsl:for-each select="ns1:RecordTransfer">
													<dgn:RecordTransfer>
														<xsl:for-each select="ns1:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:CorrespondenceAddress">
															<com:CorrespondenceAddress>
																<xsl:sequence select="()"/>
															</com:CorrespondenceAddress>
														</xsl:for-each>
													</dgn:RecordTransfer>
												</xsl:for-each>
												<xsl:for-each select="ns1:RecordChangeNameAddress">
													<dgn:RecordChangeNameAddress>
														<xsl:for-each select="ns1:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:CorrespondenceAddress">
															<com:CorrespondenceAddress>
																<xsl:sequence select="()"/>
															</com:CorrespondenceAddress>
														</xsl:for-each>
													</dgn:RecordChangeNameAddress>
												</xsl:for-each>
												<xsl:for-each select="ns1:RecordLicence">
													<dgn:RecordLicence>
														<xsl:for-each select="ns1:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns1:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
													</dgn:RecordLicence>
												</xsl:for-each>
											</dgn:DesignRecord>
										</xsl:for-each>
									</dgn:DesignRecordBag>
								</xsl:for-each>
								<xsl:for-each select="$var19_TransactionData/ns1:DesignRecordRelationDetails">
									<dgn:DesignRecordRelationBag>
										<xsl:for-each select="ns1:DesignRecordRelation">
											<dgn:DesignRecordRelation>
												<xsl:sequence select="()"/>
											</dgn:DesignRecordRelation>
										</xsl:for-each>
									</dgn:DesignRecordRelationBag>
								</xsl:for-each>
							</dgn:TransactionData>
						</dgn:TransactionContentBag>
					</dgn:DesignTransactionBody>
				</xsl:for-each>
			</xsl:for-each>
		</dgn:DesignTransaction>
	</xsl:template>
</xsl:stylesheet>
