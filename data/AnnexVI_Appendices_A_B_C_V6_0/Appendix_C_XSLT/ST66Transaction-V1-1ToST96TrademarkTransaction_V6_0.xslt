<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WIPO="http://www.altova.com/MapForce/UDF/WIPO" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="http://www.wipo.int/standards/XMLSchema/trademarks" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark" exclude-result-prefixes="WIPO vmf xs fn ns0">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="st66model-V1-13" select="'st66model-V1-1.xml'"/>
	<xsl:param name="st66model-V1-14" select="'st66model-V1-1.xml'"/>
	<xsl:param name="st66model-V1-15" select="'st66model-V1-1.xml'"/>
	<xsl:param name="st66model-V1-16" select="'st66model-V1-1.xml'"/>
	<xsl:template name="WIPO:MappingST66ApplicantToST96Applicant">
		<xsl:param name="Applicant" select="()"/>
		<tmk:Applicant>
			<xsl:for-each select="$Applicant/@operationCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf47_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<xsl:attribute name="com:operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantSequenceNumber">
				<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantLegalEntity">
				<com:LegalEntityName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:LegalEntityName>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantIdentifier">
				<com:PartyIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@identifierKindCode">
						<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantAddressBook">
				<xsl:variable name="var2_resultof_MappingST__AddressBookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_MappingST__AddressBookToST__Contact">
					<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="(./@node(), ./node())"/>
					</com:Contact>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantNationalityCode">
				<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantIncorporationCountryCode">
				<com:IncorporationCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantIncorporationState">
				<com:IncorporationState xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:IncorporationState>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:Comment">
				<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantEntitlement">
				<Entitlement>
					<xsl:for-each select="ns0:EntitlementNationalityCode">
						<com:EntitlementNationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:sequence select="fn:string(.)"/>
						</com:EntitlementNationalityCode>
					</xsl:for-each>
					<xsl:for-each select="ns0:EntitlementEstablishment">
						<com:EntitlementEstablishment xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns0:EntitlementEstablishmentCode">
								<com:EntitlementEstablishmentCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementEstablishmentCode>
							</xsl:for-each>
							<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
								<xsl:variable name="var3_resultof_MappingST__AddressBookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var3_resultof_MappingST__AddressBookToST__Contact">
									<com:Contact>
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</com:EntitlementEstablishment>
					</xsl:for-each>
					<xsl:for-each select="ns0:EntitlementDomiciled">
						<com:EntitlementDomiciled xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
							<xsl:for-each select="ns0:EntitlementDomiciledCode">
								<com:EntitlementDomiciledCode>
									<xsl:sequence select="fn:string(.)"/>
								</com:EntitlementDomiciledCode>
							</xsl:for-each>
							<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
								<xsl:variable name="var4_resultof_MappingST__AddressBookToST__Contact" as="node()?">
									<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
										<xsl:with-param name="AddressBook" as="node()">
											<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
												<xsl:sequence select="(./@node(), ./node())"/>
											</AddressBookType>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var4_resultof_MappingST__AddressBookToST__Contact">
									<com:Contact>
										<xsl:sequence select="(./@node(), ./node())"/>
									</com:Contact>
								</xsl:for-each>
							</xsl:for-each>
						</com:EntitlementDomiciled>
					</xsl:for-each>
				</Entitlement>
			</xsl:for-each>
			<xsl:for-each select="$Applicant/ns0:ApplicantVersion">
				<com:Version xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="ns0:Comment">
						<com:CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</com:CommentText>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionNumber">
						<com:VersionNumber>
							<xsl:sequence select="fn:string(.)"/>
						</com:VersionNumber>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionDate">
						<com:VersionDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</com:VersionDate>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionDateTime">
						<com:VersionDateTime>
							<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
						</com:VersionDateTime>
					</xsl:for-each>
				</com:Version>
			</xsl:for-each>
		</tmk:Applicant>
	</xsl:template>
	<xsl:template name="WIPO:MappingST66RepresentativeToST96Representative">
		<xsl:param name="Representative" select="()"/>
		<com:Representative>
			<xsl:for-each select="$Representative/@operationCode">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf48_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<xsl:attribute name="operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeSequenceNumber">
				<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeLegalEntity">
				<LegalEntityName>
					<xsl:sequence select="fn:string(.)"/>
				</LegalEntityName>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeIdentifier">
				<PartyIdentifier>
					<xsl:for-each select="@identifierKindCode">
						<xsl:attribute name="officeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</PartyIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeAddressBook">
				<xsl:variable name="var2_resultof_MappingST__AddressBookToST__Contact" as="node()?">
					<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
						<xsl:with-param name="AddressBook" as="node()">
							<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
								<xsl:sequence select="(./@node(), ./node())"/>
							</AddressBookType>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_MappingST__AddressBookToST__Contact">
					<Contact>
						<xsl:sequence select="(./@node(), ./node())"/>
					</Contact>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeNationalityCode">
				<NationalityCode>
					<xsl:sequence select="fn:string(.)"/>
				</NationalityCode>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeIncorporationCountryCode">
				<IncorporationCountryCode>
					<xsl:sequence select="fn:string(.)"/>
				</IncorporationCountryCode>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeIncorporationState">
				<IncorporationState>
					<xsl:sequence select="fn:string(.)"/>
				</IncorporationState>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeKindCode">
				<xsl:variable name="var3_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf49_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_vmf___inputtoresult">
					<RepresentativeCategory>
						<xsl:sequence select="."/>
					</RepresentativeCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:Comment">
				<CommentText>
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</CommentText>
			</xsl:for-each>
			<xsl:for-each select="$Representative/ns0:RepresentativeVersion">
				<Version>
					<xsl:for-each select="ns0:Comment">
						<CommentText>
							<xsl:for-each select="@languageCode">
								<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:sequence select="fn:string(.)"/>
						</CommentText>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionNumber">
						<VersionNumber>
							<xsl:sequence select="fn:string(.)"/>
						</VersionNumber>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionDate">
						<VersionDate>
							<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
						</VersionDate>
					</xsl:for-each>
					<xsl:for-each select="ns0:VersionDateTime">
						<VersionDateTime>
							<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
						</VersionDateTime>
					</xsl:for-each>
				</Version>
			</xsl:for-each>
		</com:Representative>
	</xsl:template>
	<xsl:template name="WIPO:MappingST66OppositionToST96Opposition">
		<xsl:param name="Opposition" select="()"/>
		<tmk:Opposition>
			<xsl:for-each select="$Opposition/ns0:OppositionIdentifier">
				<com:OppositionIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionIdentifier>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionDate">
				<com:OppositionDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionReference">
				<com:OppositionReference xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionReference>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionLanguageCode">
				<com:OppositionLanguageCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionLanguageCode>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:ProceedingLanguageCode">
				<com:ProceedingLanguageCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="fn:string(.)"/>
				</com:ProceedingLanguageCode>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:EarlierRightDate">
				<com:EarlierRightDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:EarlierRightDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:EarlierRightKind">
				<xsl:variable name="var1_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf50_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var1_resultof_vmf___inputtoresult">
					<com:EarlierRightCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
						<xsl:sequence select="."/>
					</com:EarlierRightCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionBasisCode">
				<xsl:variable name="var2_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf51_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_vmf___inputtoresult">
					<OppositionBasisCategory>
						<xsl:sequence select="."/>
					</OppositionBasisCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionGroundText">
				<com:OppositionGroundsText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionGroundsText>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionExtentText">
				<com:OppositionExtentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="@languageCode">
						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
					</xsl:for-each>
					<xsl:sequence select="fn:string(.)"/>
				</com:OppositionExtentText>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionCurrentStatusCode">
				<xsl:variable name="var3_resultof_vmf___inputtoresult" as="xs:string?">
					<xsl:call-template name="vmf:vmf52_inputtoresult">
						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_vmf___inputtoresult">
					<OppositionCurrentStatusCategory>
						<xsl:sequence select="."/>
					</OppositionCurrentStatusCategory>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionCurrentStatusDate">
				<com:OppositionCurrentStatusDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
				</com:OppositionCurrentStatusDate>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:EarlierMarkDetails">
				<EarlierMarkBag>
					<xsl:for-each select="ns0:EarlierMark">
						<EarlierMark>
							<xsl:for-each select="ns0:EarlierMarkCountryCode">
								<EarlierMarkCountryCode>
									<xsl:sequence select="fn:string(.)"/>
								</EarlierMarkCountryCode>
							</xsl:for-each>
							<xsl:for-each select="ns0:EarlierMarkKind">
								<xsl:variable name="var4_resultof_vmf___inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf53_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var4_resultof_vmf___inputtoresult">
									<EarlierMarkCategory>
										<xsl:sequence select="."/>
									</EarlierMarkCategory>
								</xsl:for-each>
							</xsl:for-each>
							<BaseGoodsServicesBag>
								<xsl:for-each select="ns0:BaseGoodsServicesDetails/ns0:GoodsServices">
									<GoodsServices>
										<xsl:for-each select="ns0:ClassificationKindCode">
											<ClassificationKindCode>
												<xsl:sequence select="fn:string(.)"/>
											</ClassificationKindCode>
										</xsl:for-each>
										<xsl:for-each select="ns0:ClassificationVersion">
											<com:ClassificationVersion xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
												<xsl:sequence select="fn:string(.)"/>
											</com:ClassificationVersion>
										</xsl:for-each>
										<com:CommentTextBag xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
											<xsl:for-each select="ns0:Comment">
												<com:CommentText>
													<xsl:for-each select="@languageCode">
														<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:sequence select="fn:string(.)"/>
												</com:CommentText>
											</xsl:for-each>
										</com:CommentTextBag>
										<xsl:for-each select="ns0:ProposedLeadingClassNumber">
											<ProposedLeadingClassNumber>
												<xsl:sequence select="fn:string(.)"/>
											</ProposedLeadingClassNumber>
										</xsl:for-each>
										<xsl:for-each select="ns0:ClassDescriptionDetails">
											<ClassDescriptionBag>
												<xsl:for-each select="ns0:ClassDescription">
													<ClassDescription>
														<xsl:for-each select="ns0:ClassNumber">
															<ClassNumber>
																<xsl:sequence select="fn:string(.)"/>
															</ClassNumber>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClassNumberStatusCode">
															<ClassNumberStatusCategory>
																<xsl:sequence select="fn:string(.)"/>
															</ClassNumberStatusCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:GoodsServicesDescription">
															<GoodsServicesDescriptionText>
																<xsl:for-each select="@languageCode">
																	<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@sequenceNumber">
																	<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</GoodsServicesDescriptionText>
														</xsl:for-each>
														<xsl:for-each select="ns0:UseNiceHeadingIndicator">
															<UseNiceHeadingIndicator>
																<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
															</UseNiceHeadingIndicator>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClassificationTermDetails">
															<ClassificationTermBag>
																<xsl:for-each select="ns0:ClassificationTerm">
																	<ClassificationTerm>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermIdentifier">
																			<ClassificationTermIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermOffice">
																			<ClassificationTermOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																			<ClassificationTermOfficeIdentification>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermOfficeIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermSource">
																			<ClassificationTermSourceCategory>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermSourceCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermEntryDate">
																			<ClassificationTermEntryDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</ClassificationTermEntryDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassNumber">
																			<ClassNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassNumber>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermText">
																			<ClassificationTermText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																			<ClassificationTermEquivalentGroup>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermEquivalentGroup>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																			<ClassificationTermReferenceGroup>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermReferenceGroup>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																			<ClassificationTermTranslationGroup>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermTranslationGroup>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationTermStatus">
																			<ClassificationTermStatus>
																				<xsl:for-each select="@officeCode">
																					<xsl:attribute name="com:officeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</ClassificationTermStatus>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:WIPOBasicNumber">
																			<WIPOBasicNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</WIPOBasicNumber>
																		</xsl:for-each>
																	</ClassificationTerm>
																</xsl:for-each>
															</ClassificationTermBag>
														</xsl:for-each>
													</ClassDescription>
												</xsl:for-each>
											</ClassDescriptionBag>
										</xsl:for-each>
									</GoodsServices>
								</xsl:for-each>
							</BaseGoodsServicesBag>
							<com:ApplicationNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="ns0:ApplicationNumber">
									<com:ApplicationNumberText>
										<xsl:sequence select="fn:string(.)"/>
									</com:ApplicationNumberText>
								</xsl:for-each>
							</com:ApplicationNumber>
							<xsl:for-each select="ns0:RegistrationNumber">
								<com:RegistrationNumber xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="fn:string(.)"/>
								</com:RegistrationNumber>
							</xsl:for-each>
							<xsl:for-each select="ns0:ApplicationDate">
								<com:ApplicationDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:ApplicationDate>
							</xsl:for-each>
							<xsl:for-each select="ns0:RegistrationDate">
								<com:RegistrationDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:RegistrationDate>
							</xsl:for-each>
							<xsl:for-each select="ns0:MarkFeature">
								<xsl:variable name="var5_resultof_vmf___inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf54_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var5_resultof_vmf___inputtoresult">
									<MarkFeatureCategory>
										<xsl:sequence select="."/>
									</MarkFeatureCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns0:MarkImageDetails">
								<MarkImageBag>
									<xsl:for-each select="ns0:MarkImage">
										<xsl:variable name="var15_MarkImageRepresentationSize" as="node()*" select="ns0:MarkImageRepresentationSize"/>
										<MarkImage>
											<xsl:for-each select="ns0:MarkImageFilename">
												<com:FileName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
													<xsl:sequence select="fn:string(.)"/>
												</com:FileName>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageFileFormat">
												<xsl:variable name="var6_resultof_vmf___inputtoresult" as="xs:string?">
													<xsl:call-template name="vmf:vmf11_inputtoresult">
														<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:for-each select="$var6_resultof_vmf___inputtoresult">
													<com:ImageFormatCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
														<xsl:sequence select="."/>
													</com:ImageFormatCategory>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageColourClaimedText">
												<MarkImageColourClaimedText>
													<xsl:for-each select="@languageCode">
														<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@sequenceNumber">
														<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
													</xsl:for-each>
													<xsl:sequence select="fn:string(.)"/>
												</MarkImageColourClaimedText>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageColourPartClaimedText">
												<MarkImageColourPartClaimedText>
													<xsl:for-each select="@languageCode">
														<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:for-each select="@sequenceNumber">
														<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
													</xsl:for-each>
													<xsl:sequence select="fn:string(.)"/>
												</MarkImageColourPartClaimedText>
											</xsl:for-each>
											<xsl:for-each select="$var15_MarkImageRepresentationSize">
												<xsl:variable name="var7_cur" as="node()" select="."/>
												<xsl:for-each select="ns0:Height">
													<com:HeightMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
														<xsl:for-each select="$var7_cur/ns0:Unit">
															<xsl:attribute name="com:measureUnitCode">
																<xsl:call-template name="vmf:vmf12_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:attribute>
														</xsl:for-each>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</com:HeightMeasure>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="$var15_MarkImageRepresentationSize">
												<xsl:variable name="var8_cur" as="node()" select="."/>
												<xsl:for-each select="ns0:Width">
													<com:WidthMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
														<xsl:for-each select="$var8_cur/ns0:Unit">
															<xsl:attribute name="com:measureUnitCode">
																<xsl:call-template name="vmf:vmf12_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:attribute>
														</xsl:for-each>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</com:WidthMeasure>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageCategory">
												<MarkImageClassification>
													<com:FigurativeElementClassificationBag xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
														<com:NationalFigurativeElementClassificationBag>
															<xsl:for-each select="ns0:CategoryVersion">
																<com:NationalClassificationEdition>
																	<xsl:sequence select="fn:string(.)"/>
																</com:NationalClassificationEdition>
															</xsl:for-each>
															<xsl:for-each select="ns0:CategoryCodeDetails/ns0:CategoryCode">
																<com:NationalFigurativeElementClassification>
																	<xsl:sequence select="fn:string(.)"/>
																</com:NationalFigurativeElementClassification>
															</xsl:for-each>
														</com:NationalFigurativeElementClassificationBag>
													</com:FigurativeElementClassificationBag>
												</MarkImageClassification>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageQualityIndicator">
												<MarkImageQualityIndicator>
													<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
												</MarkImageQualityIndicator>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageRenditionDetails">
												<MarkImageRenditionBag>
													<xsl:for-each select="ns0:MarkImageRendition">
														<xsl:variable name="var13_MarkImageRenditionRepresentati" as="node()*" select="ns0:MarkImageRenditionRepresentationSize"/>
														<MarkImageRendition>
															<xsl:for-each select="ns0:MarkImageRenditionKind">
																<xsl:variable name="var9_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf13_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var9_resultof_vmf___inputtoresult">
																	<MarkImageRenditionCategory>
																		<xsl:sequence select="."/>
																	</MarkImageRenditionCategory>
																</xsl:for-each>
															</xsl:for-each>
															<xsl:for-each select="ns0:MarkImageRenditionFilename">
																<com:FileName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
																	<xsl:sequence select="fn:string(.)"/>
																</com:FileName>
															</xsl:for-each>
															<xsl:for-each select="ns0:MarkImageRenditionFileFormat">
																<xsl:variable name="var10_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf14_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var10_resultof_vmf___inputtoresult">
																	<com:ImageFormatCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
																		<xsl:sequence select="."/>
																	</com:ImageFormatCategory>
																</xsl:for-each>
															</xsl:for-each>
															<xsl:for-each select="ns0:MarkImageRenditionColourMode">
																<com:ColourModeCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
																	<xsl:sequence select="fn:string(.)"/>
																</com:ColourModeCategory>
															</xsl:for-each>
															<xsl:for-each select="$var13_MarkImageRenditionRepresentati">
																<xsl:variable name="var11_cur" as="node()" select="."/>
																<xsl:for-each select="ns0:Height">
																	<com:HeightMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
																		<xsl:for-each select="$var11_cur/ns0:Unit">
																			<xsl:attribute name="com:measureUnitCode">
																				<xsl:call-template name="vmf:vmf15_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:attribute>
																		</xsl:for-each>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</com:HeightMeasure>
																</xsl:for-each>
															</xsl:for-each>
															<xsl:for-each select="$var13_MarkImageRenditionRepresentati">
																<xsl:variable name="var12_cur" as="node()" select="."/>
																<xsl:for-each select="ns0:Width">
																	<com:WidthMeasure xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
																		<xsl:for-each select="$var12_cur/ns0:Unit">
																			<xsl:attribute name="com:measureUnitCode">
																				<xsl:call-template name="vmf:vmf15_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:attribute>
																		</xsl:for-each>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</com:WidthMeasure>
																</xsl:for-each>
															</xsl:for-each>
														</MarkImageRendition>
													</xsl:for-each>
												</MarkImageRenditionBag>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageColourIndicator">
												<com:ColourIndicator xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
													<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
												</com:ColourIndicator>
											</xsl:for-each>
											<xsl:for-each select="ns0:MarkImageColourMode">
												<xsl:variable name="var14_resultof_vmf___inputtoresult" as="xs:string?">
													<xsl:call-template name="vmf:vmf16_inputtoresult">
														<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:for-each select="$var14_resultof_vmf___inputtoresult">
													<com:ColourModeCategory xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
														<xsl:sequence select="."/>
													</com:ColourModeCategory>
												</xsl:for-each>
											</xsl:for-each>
										</MarkImage>
									</xsl:for-each>
								</MarkImageBag>
							</xsl:for-each>
							<xsl:for-each select="ns0:WordMarkSpecification">
								<WordMarkSpecification>
									<xsl:for-each select="ns0:MarkVerbalElementText">
										<MarkVerbalElementText>
											<xsl:for-each select="@languageCode">
												<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:sequence select="fn:string(.)"/>
										</MarkVerbalElementText>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkSignificantVerbalElement">
										<MarkSignificantVerbalElementText>
											<xsl:for-each select="@languageCode">
												<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:sequence select="fn:string(.)"/>
										</MarkSignificantVerbalElementText>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkVerbalElementSignificantIndicator">
										<MarkVerbalElementSignificantIndicator>
											<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
										</MarkVerbalElementSignificantIndicator>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkTranslation">
										<MarkTranslationText>
											<xsl:for-each select="@languageCode">
												<xsl:attribute name="com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:for-each select="@sequenceNumber">
												<xsl:attribute name="com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
											</xsl:for-each>
											<xsl:sequence select="fn:string(.)"/>
										</MarkTranslationText>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkTransliteration">
										<MarkTransliteration>
											<xsl:sequence select="fn:string(.)"/>
										</MarkTransliteration>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkTranscription">
										<MarkTranscription>
											<xsl:sequence select="fn:string(.)"/>
										</MarkTranscription>
									</xsl:for-each>
									<xsl:for-each select="ns0:MarkStandardCharacterIndicator">
										<MarkStandardCharacterIndicator>
											<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
										</MarkStandardCharacterIndicator>
									</xsl:for-each>
								</WordMarkSpecification>
							</xsl:for-each>
						</EarlierMark>
					</xsl:for-each>
				</EarlierMarkBag>
			</xsl:for-each>
			<PlaintiffBag>
				<xsl:for-each select="$Opposition/ns0:OpponentDetails/ns0:Opponent">
					<Plaintiff>
						<xsl:for-each select="ns0:OpponentLegalEntity">
							<com:LegalEntityName xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:LegalEntityName>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentIdentifier">
							<com:PartyIdentifier xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="@identifierKindCode">
									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:sequence select="fn:string(.)"/>
							</com:PartyIdentifier>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentAddressBook">
							<xsl:variable name="var16_resultof_MappingST__AddressBookToST__Contact" as="node()?">
								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
									<xsl:with-param name="AddressBook" as="node()">
										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
											<xsl:sequence select="(./@node(), ./node())"/>
										</AddressBookType>
									</xsl:with-param>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var16_resultof_MappingST__AddressBookToST__Contact">
								<com:Contact xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="(./@node(), ./node())"/>
								</com:Contact>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentNationalityCode">
							<com:NationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:NationalityCode>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentIncorporationCountryCode">
							<com:IncorporationCountryCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:IncorporationCountryCode>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentIncorporationState">
							<com:IncorporationState xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:sequence select="fn:string(.)"/>
							</com:IncorporationState>
						</xsl:for-each>
						<xsl:for-each select="ns0:Comment">
							<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
								<xsl:for-each select="@languageCode">
									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
								</xsl:for-each>
								<xsl:sequence select="fn:string(.)"/>
							</com:CommentText>
						</xsl:for-each>
						<xsl:for-each select="ns0:OpponentEntitlement">
							<Entitlement>
								<xsl:for-each select="ns0:EntitlementNationalityCode">
									<com:EntitlementNationalityCode xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:sequence select="fn:string(.)"/>
									</com:EntitlementNationalityCode>
								</xsl:for-each>
								<xsl:for-each select="ns0:EntitlementEstablishment">
									<com:EntitlementEstablishment xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
											<com:EntitlementEstablishmentCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:EntitlementEstablishmentCode>
										</xsl:for-each>
										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
											<xsl:variable name="var17_resultof_MappingST__AddressBookToST__Contact" as="node()?">
												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
													<xsl:with-param name="AddressBook" as="node()">
														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
															<xsl:sequence select="(./@node(), ./node())"/>
														</AddressBookType>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:variable>
											<xsl:for-each select="$var17_resultof_MappingST__AddressBookToST__Contact">
												<com:Contact>
													<xsl:sequence select="(./@node(), ./node())"/>
												</com:Contact>
											</xsl:for-each>
										</xsl:for-each>
									</com:EntitlementEstablishment>
								</xsl:for-each>
								<xsl:for-each select="ns0:EntitlementDomiciled">
									<com:EntitlementDomiciled xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
										<xsl:for-each select="ns0:EntitlementDomiciledCode">
											<com:EntitlementDomiciledCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:EntitlementDomiciledCode>
										</xsl:for-each>
										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
											<xsl:variable name="var18_resultof_MappingST__AddressBookToST__Contact" as="node()?">
												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
													<xsl:with-param name="AddressBook" as="node()">
														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
															<xsl:sequence select="(./@node(), ./node())"/>
														</AddressBookType>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:variable>
											<xsl:for-each select="$var18_resultof_MappingST__AddressBookToST__Contact">
												<com:Contact>
													<xsl:sequence select="(./@node(), ./node())"/>
												</com:Contact>
											</xsl:for-each>
										</xsl:for-each>
									</com:EntitlementDomiciled>
								</xsl:for-each>
							</Entitlement>
						</xsl:for-each>
					</Plaintiff>
				</xsl:for-each>
			</PlaintiffBag>
			<xsl:for-each select="$Opposition/ns0:OppositionEventDetails">
				<OppositionEventBag>
					<xsl:for-each select="ns0:OppositionEvent">
						<OppositionEvent>
							<xsl:for-each select="ns0:OppositionEventCode">
								<xsl:variable name="var19_resultof_vmf___inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf55_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var19_resultof_vmf___inputtoresult">
									<OppositionEventCategory>
										<xsl:sequence select="."/>
									</OppositionEventCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns0:OppositionEventResponseDate">
								<com:OppositionEventResponseDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:OppositionEventResponseDate>
							</xsl:for-each>
							<xsl:for-each select="ns0:Comment">
								<com:CommentText xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:for-each select="@languageCode">
										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:sequence select="fn:string(.)"/>
								</com:CommentText>
							</xsl:for-each>
							<xsl:for-each select="ns0:OppositionEventDate">
								<com:OppositionEventDate xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:OppositionEventDate>
							</xsl:for-each>
							<xsl:for-each select="ns0:OppositionEventDateTime">
								<com:OppositionEventDateTime xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
									<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
								</com:OppositionEventDateTime>
							</xsl:for-each>
						</OppositionEvent>
					</xsl:for-each>
				</OppositionEventBag>
			</xsl:for-each>
			<xsl:for-each select="$Opposition/ns0:OppositionDocumentDetails">
				<com:OppositionDocumentBag xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
					<xsl:for-each select="ns0:OppositionDocument">
						<com:OppositionDocument>
							<xsl:for-each select="ns0:DocumentLanguageCode">
								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentName">
								<com:DocumentName>
									<xsl:sequence select="fn:string(.)"/>
								</com:DocumentName>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentFilename">
								<com:FileName>
									<xsl:sequence select="fn:string(.)"/>
								</com:FileName>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentFileFormat">
								<xsl:variable name="var20_resultof_vmf___inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf22_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var20_resultof_vmf___inputtoresult">
									<com:DocumentFormatCategory>
										<xsl:sequence select="."/>
									</com:DocumentFormatCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentDate">
								<com:DocumentDate>
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</com:DocumentDate>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentMedia">
								<xsl:variable name="var21_resultof_vmf___inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf23_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var21_resultof_vmf___inputtoresult">
									<com:DocumentMediaCategory>
										<xsl:sequence select="."/>
									</com:DocumentMediaCategory>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentLocation">
								<com:DocumentLocationURI>
									<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
								</com:DocumentLocationURI>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentVersion">
								<com:DocumentVersion>
									<xsl:sequence select="fn:string(.)"/>
								</com:DocumentVersion>
							</xsl:for-each>
							<xsl:for-each select="ns0:DocumentSizeInByte">
								<com:DocumentSizeQuantity>
									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
								</com:DocumentSizeQuantity>
							</xsl:for-each>
							<xsl:for-each select="ns0:Comment">
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
		</tmk:Opposition>
	</xsl:template>
	<xsl:template name="WIPO:MappingST66AddressBookToST96Contact">
		<xsl:param name="AddressBook" select="()"/>
		<xsl:variable name="var4_ContactInformationDetails" as="node()*" select="$AddressBook/ns0:ContactInformationDetails"/>
		<xsl:variable name="var5_FormattedNameAddress" as="node()*" select="$AddressBook/ns0:FormattedNameAddress"/>
		<com:Contact>
			<xsl:for-each select="$AddressBook/ns0:AddressLanguageCode">
				<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
			</xsl:for-each>
			<Name>
				<xsl:for-each select="($var5_FormattedNameAddress/ns0:Name/ns0:FormattedName)[fn:exists(ns0:LastName)]">
					<PersonName>
						<PersonStructuredName>
							<xsl:for-each select="ns0:NamePrefix">
								<NamePrefix>
									<xsl:sequence select="fn:string(.)"/>
								</NamePrefix>
							</xsl:for-each>
							<xsl:for-each select="ns0:FirstName">
								<FirstName>
									<xsl:sequence select="fn:string(.)"/>
								</FirstName>
							</xsl:for-each>
							<xsl:for-each select="ns0:MiddleName">
								<MiddleName>
									<xsl:sequence select="fn:string(.)"/>
								</MiddleName>
							</xsl:for-each>
							<xsl:for-each select="ns0:LastName">
								<LastName>
									<xsl:sequence select="fn:string(.)"/>
								</LastName>
							</xsl:for-each>
							<xsl:for-each select="ns0:SecondLastName">
								<SecondLastName>
									<xsl:sequence select="fn:string(.)"/>
								</SecondLastName>
							</xsl:for-each>
							<xsl:for-each select="ns0:NameSuffix">
								<NameSuffix>
									<xsl:sequence select="fn:string(.)"/>
								</NameSuffix>
							</xsl:for-each>
							<xsl:for-each select="ns0:NameSynonym">
								<PersonOtherName>
									<xsl:sequence select="fn:string(.)"/>
								</PersonOtherName>
							</xsl:for-each>
						</PersonStructuredName>
					</PersonName>
				</xsl:for-each>
				<xsl:for-each select="$var5_FormattedNameAddress/ns0:Name/ns0:FormattedName">
					<xsl:variable name="var1_cur" as="node()" select="."/>
					<xsl:for-each select="ns0:OrganizationName">
						<OrganizationName>
							<OrganizationStandardName>
								<xsl:sequence select="fn:string(.)"/>
							</OrganizationStandardName>
							<xsl:for-each select="$var1_cur/ns0:OrganizationDepartment">
								<OrganizationOtherName>
									<xsl:attribute name="organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Department'"/>
									<xsl:sequence select="fn:string(.)"/>
								</OrganizationOtherName>
							</xsl:for-each>
						</OrganizationName>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="$var5_FormattedNameAddress/ns0:Name/ns0:FreeFormatName/ns0:FreeFormatNameDetails/ns0:FreeFormatNameLine">
					<EntityName>
						<xsl:for-each select="@languageCode">
							<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</EntityName>
				</xsl:for-each>
			</Name>
			<xsl:for-each select="$var5_FormattedNameAddress/ns0:Address">
				<xsl:variable name="var2_cur" as="node()" select="."/>
				<PostalAddressBag>
					<xsl:for-each select="ns0:FormattedAddress">
						<PostalAddress>
							<PostalStructuredAddress>
								<xsl:for-each select="ns0:AddressLine">
									<AddressLineText>
										<xsl:for-each select="@sequenceNumber">
											<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:concat(xs:string(xs:integer(fn:string(.))), '001')"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressStreet">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Street'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressBuilding">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Building'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressPostOfficeBox">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Post office box'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressRoom">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Room'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressFloor">
									<AddressLineText>
										<xsl:attribute name="addressLineCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'Floor'"/>
										<xsl:sequence select="fn:string(.)"/>
									</AddressLineText>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressCity">
									<CityName>
										<xsl:sequence select="fn:string(.)"/>
									</CityName>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressCounty">
									<GeographicRegionName>
										<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'County'"/>
										<xsl:sequence select="fn:string(.)"/>
									</GeographicRegionName>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressState">
									<GeographicRegionName>
										<xsl:attribute name="geographicRegionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="'State'"/>
										<xsl:sequence select="fn:string(.)"/>
									</GeographicRegionName>
								</xsl:for-each>
								<xsl:for-each select="$var2_cur/ns0:AddressCountryCode">
									<CountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</CountryCode>
								</xsl:for-each>
								<xsl:for-each select="ns0:FormattedAddressCountryCode">
									<CountryCode>
										<xsl:sequence select="fn:string(.)"/>
									</CountryCode>
								</xsl:for-each>
								<xsl:for-each select="ns0:AddressPostcode">
									<PostalCode>
										<xsl:sequence select="fn:string(.)"/>
									</PostalCode>
								</xsl:for-each>
							</PostalStructuredAddress>
							<xsl:for-each select="$AddressBook/ns0:PostalAddress">
								<PostalAddressText>
									<xsl:sequence select="fn:string(.)"/>
								</PostalAddressText>
							</xsl:for-each>
							<xsl:for-each select="$var2_cur/ns0:FreeFormatAddress/ns0:FreeFormatAddressLine">
								<PostalAddressText>
									<xsl:for-each select="@languageCode">
										<xsl:attribute name="languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="fn:string(.)"/>
									</xsl:for-each>
									<xsl:for-each select="@sequenceNumber">
										<xsl:attribute name="sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="xs:string(xs:integer(fn:string(.)))"/>
									</xsl:for-each>
									<xsl:sequence select="fn:string(.)"/>
								</PostalAddressText>
							</xsl:for-each>
						</PostalAddress>
					</xsl:for-each>
				</PostalAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$var4_ContactInformationDetails/ns0:Fax">
				<FaxNumberBag>
					<FaxNumber>
						<xsl:sequence select="fn:string(.)"/>
					</FaxNumber>
				</FaxNumberBag>
			</xsl:for-each>
			<xsl:for-each select="$var4_ContactInformationDetails/ns0:Email">
				<EmailAddressBag>
					<EmailAddressText>
						<xsl:sequence select="fn:string(.)"/>
					</EmailAddressText>
				</EmailAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$var4_ContactInformationDetails/ns0:URL">
				<WebAddressBag>
					<WebAddressURI>
						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
					</WebAddressURI>
				</WebAddressBag>
			</xsl:for-each>
			<xsl:for-each select="$var4_ContactInformationDetails/ns0:Phone">
				<PhoneNumberBag>
					<PhoneNumber>
						<xsl:for-each select="@phoneKind">
							<xsl:variable name="var3_resultof_vmf___inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf56_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var3_resultof_vmf___inputtoresult">
								<xsl:attribute name="phoneNumberCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Common" select="."/>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:sequence select="fn:string(.)"/>
					</PhoneNumber>
				</PhoneNumberBag>
			</xsl:for-each>
			<xsl:for-each select="$var4_ContactInformationDetails/ns0:OtherElectronicAddress">
				<OtherElectronicAddressBag>
					<OtherElectronicAddressText>
						<xsl:sequence select="fn:string(.)"/>
					</OtherElectronicAddressText>
				</OtherElectronicAddressBag>
			</xsl:for-each>
		</com:Contact>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Trade Mark E-Filing'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
			<xsl:when test="$input='Trade Mark B2B-Filing'">
				<xsl:copy-of select="'Trademark B2B Filing'"/>
			</xsl:when>
			<xsl:when test="$input='Trade Mark Information'">
				<xsl:copy-of select="'Trademark information'"/>
			</xsl:when>
			<xsl:when test="$input='Trade Mark Identifier List'">
				<xsl:copy-of select="'Trademark identifier list'"/>
			</xsl:when>
			<xsl:when test="$input='Trade Mark List'">
				<xsl:copy-of select="'Trademark list'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition E-Filing'">
				<xsl:copy-of select="'Opposition eFiling'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition Information'">
				<xsl:copy-of select="'Opposition information'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition Identifier List'">
				<xsl:copy-of select="'Opposition identifier list'"/>
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
			<xsl:when test="$input='Certification Agreement Date'">
				<xsl:copy-of select="'Certification agreement date'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Action before Court of Justice pending'">
				<xsl:copy-of select="'Action before court of justice pending'"/>
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
	<xsl:template name="vmf:vmf5_inputtoresult">
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
	<xsl:template name="vmf:vmf6_inputtoresult">
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
	<xsl:template name="vmf:vmf7_inputtoresult">
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
	<xsl:template name="vmf:vmf8_inputtoresult">
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
			<xsl:when test="$input='3-D'">
				<xsl:copy-of select="'Three dimensional'"/>
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
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Chimney'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Kennfaden'">
				<xsl:copy-of select="'tracer'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf9_inputtoresult">
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
	<xsl:template name="vmf:vmf10_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='To Lowercase'">
				<xsl:copy-of select="'To lowercase'"/>
			</xsl:when>
			<xsl:when test="$input='To Uppercase'">
				<xsl:copy-of select="'To uppercase'"/>
			</xsl:when>
			<xsl:when test="$input='To Phonetic Code'">
				<xsl:copy-of select="'To phonetic code'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf11_inputtoresult">
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
	<xsl:template name="vmf:vmf12_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Centimeter'">
				<xsl:copy-of select="'Cm'"/>
			</xsl:when>
			<xsl:when test="$input='Pixel'">
				<xsl:copy-of select="'Px'"/>
			</xsl:when>
			<xsl:when test="$input='Inch'">
				<xsl:copy-of select="'In'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="'mm'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf13_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Greyscale'">
				<xsl:copy-of select="'Greyscale'"/>
			</xsl:when>
			<xsl:when test="$input='Office Copy'">
				<xsl:copy-of select="'Office copy'"/>
			</xsl:when>
			<xsl:when test="$input='Thumbnail'">
				<xsl:copy-of select="'Thumbnail'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf14_inputtoresult">
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
	<xsl:template name="vmf:vmf15_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Centimetre'">
				<xsl:copy-of select="'Cm'"/>
			</xsl:when>
			<xsl:when test="$input='Inch'">
				<xsl:copy-of select="'In'"/>
			</xsl:when>
			<xsl:when test="$input='Pixel'">
				<xsl:copy-of select="'Px'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="'mm'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf16_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Black and White'">
				<xsl:copy-of select="'Black and white'"/>
			</xsl:when>
			<xsl:when test="$input='Greyscale'">
				<xsl:copy-of select="'Greyscale'"/>
			</xsl:when>
			<xsl:when test="$input='Colour'">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf17_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='MP3'">
				<xsl:copy-of select="'MP3'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf18_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Provisional'">
				<xsl:copy-of select="'Provisional'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf19_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Nice'">
				<xsl:copy-of select="'Nice'"/>
			</xsl:when>
			<xsl:when test="$input='Office'">
				<xsl:copy-of select="'Office'"/>
			</xsl:when>
			<xsl:when test="$input='EM-JP-US'">
				<xsl:copy-of select="'EM_JP_US'"/>
			</xsl:when>
			<xsl:when test="$input='EM-US'">
				<xsl:copy-of select="'EM_US'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf20_inputtoresult">
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
	<xsl:template name="vmf:vmf21_inputtoresult">
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
	<xsl:template name="vmf:vmf22_inputtoresult">
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
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf23_inputtoresult">
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
	<xsl:template name="vmf:vmf24_inputtoresult">
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
	<xsl:template name="vmf:vmf25_inputtoresult">
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
	<xsl:template name="vmf:vmf26_inputtoresult">
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
	<xsl:template name="vmf:vmf27_inputtoresult">
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
	<xsl:template name="vmf:vmf28_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='General Authorization'">
				<xsl:copy-of select="'General authorization'"/>
			</xsl:when>
			<xsl:when test="$input='Specific Authorization'">
				<xsl:copy-of select="'Specific authorization'"/>
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
			<xsl:when test="$input='Appeal Expired'">
				<xsl:copy-of select="'Appeal expired'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal Lapsed'">
				<xsl:copy-of select="'Appeal lapsed'"/>
			</xsl:when>
			<xsl:when test="$input='Appeal Withdrawn'">
				<xsl:copy-of select="'Appeal withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Complementary Renewal'">
				<xsl:copy-of select="'Complementary renewal'"/>
			</xsl:when>
			<xsl:when test="$input='Effect Continuation'">
				<xsl:copy-of select="'Effect continuation'"/>
			</xsl:when>
			<xsl:when test="$input='Final Confirmation Refusal'">
				<xsl:copy-of select="'Final confirmation refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Final Other Decision'">
				<xsl:copy-of select="'Final other decision'"/>
			</xsl:when>
			<xsl:when test="$input='Final Reversing Refusal'">
				<xsl:copy-of select="'Final reversing refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Final Total Refusal'">
				<xsl:copy-of select="'Final total refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Judicial Action'">
				<xsl:copy-of select="'Judicial action'"/>
			</xsl:when>
			<xsl:when test="$input='Limitation'">
				<xsl:copy-of select="'Limitation'"/>
			</xsl:when>
			<xsl:when test="$input='No Effect Limitation'">
				<xsl:copy-of select="'No effect limitation'"/>
			</xsl:when>
			<xsl:when test="$input='Non Renewal'">
				<xsl:copy-of select="'NonRenewal'"/>
			</xsl:when>
			<xsl:when test="$input='Non Renewal Certain Parties'">
				<xsl:copy-of select="'NonRenewal certain parties'"/>
			</xsl:when>
			<xsl:when test="$input='Non Renewal Under Rule 40.3'">
				<xsl:copy-of select="'NonRenewal under rule 40_3'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Cancellation'">
				<xsl:copy-of select="'Partial cancellation'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Ceasing Effect'">
				<xsl:copy-of select="'Partial ceasing effect'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Invalidation'">
				<xsl:copy-of select="'Partial invalidation'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Refusal'">
				<xsl:copy-of select="'Partial refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Protection Granted'">
				<xsl:copy-of select="'Protection granted'"/>
			</xsl:when>
			<xsl:when test="$input='Registration'">
				<xsl:copy-of select="'Registration'"/>
			</xsl:when>
			<xsl:when test="$input='Renewal'">
				<xsl:copy-of select="'Renewal'"/>
			</xsl:when>
			<xsl:when test="$input='Renewal Under Rule 40.3'">
				<xsl:copy-of select="'Renewal under rule 40_3'"/>
			</xsl:when>
			<xsl:when test="$input='Renunciation'">
				<xsl:copy-of select="'Renunciation'"/>
			</xsl:when>
			<xsl:when test="$input='Representative Appointed'">
				<xsl:copy-of select="'Representative appointed'"/>
			</xsl:when>
			<xsl:when test="$input='Second Part Fee Not Paid'">
				<xsl:copy-of select="'Second part fee not paid'"/>
			</xsl:when>
			<xsl:when test="$input='Second Part Fee Paid'">
				<xsl:copy-of select="'Second part fee paid'"/>
			</xsl:when>
			<xsl:when test="$input='Subsequent Designation'">
				<xsl:copy-of select="'Subsequent designation'"/>
			</xsl:when>
			<xsl:when test="$input='Total Cancellation'">
				<xsl:copy-of select="'Total cancellation'"/>
			</xsl:when>
			<xsl:when test="$input='Total Ceasing Effect'">
				<xsl:copy-of select="'Total ceasing effect'"/>
			</xsl:when>
			<xsl:when test="$input='Total Invalidation'">
				<xsl:copy-of select="'Total invalidation'"/>
			</xsl:when>
			<xsl:when test="$input='Total Refusal'">
				<xsl:copy-of select="'Total refusal'"/>
			</xsl:when>
			<xsl:when test="$input='Transfer Refusal'">
				<xsl:copy-of select="'Transfer refusal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf31_inputtoresult">
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
	<xsl:template name="vmf:vmf32_inputtoresult">
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
	<xsl:template name="vmf:vmf33_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Holder Right Restriction Opposition Period'">
				<xsl:copy-of select="'Holder right restriction opposition period'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition Period'">
				<xsl:copy-of select="'Opposition period'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Protection Granted Opposition Period'">
				<xsl:copy-of select="'Protection granted opposition period'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf34_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Transfer'">
				<xsl:copy-of select="'Partial transfer'"/>
			</xsl:when>
			<xsl:when test="$input='Total Transfer'">
				<xsl:copy-of select="'Total transfer'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf35_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Rejected'">
				<xsl:copy-of select="'Rejected'"/>
			</xsl:when>
			<xsl:when test="$input='To Check'">
				<xsl:copy-of select="'To check'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf36_inputtoresult">
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
	<xsl:template name="vmf:vmf37_inputtoresult">
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
	<xsl:template name="vmf:vmf38_inputtoresult">
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
			<xsl:when test="$input='Licence'">
				<xsl:copy-of select="'Licence'"/>
			</xsl:when>
			<xsl:when test="$input='Other'">
				<xsl:copy-of select="'Other'"/>
			</xsl:when>
			<xsl:when test="$input='Sub-Licence'">
				<xsl:copy-of select="'Sublicence'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf41_inputtoresult">
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
	<xsl:template name="vmf:vmf42_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Unknown'">
				<xsl:copy-of select="'Unknown'"/>
			</xsl:when>
			<xsl:when test="$input='Exclusive'">
				<xsl:copy-of select="'Exclusive'"/>
			</xsl:when>
			<xsl:when test="$input='Nonexclusive'">
				<xsl:copy-of select="'NonExclusive'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf43_inputtoresult">
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
			<xsl:when test="$input='To Verify'">
				<xsl:copy-of select="'To verify'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf44_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accepted'">
				<xsl:copy-of select="'Accepted'"/>
			</xsl:when>
			<xsl:when test="$input='Rejected'">
				<xsl:copy-of select="'Rejected'"/>
			</xsl:when>
			<xsl:when test="$input='To Check'">
				<xsl:copy-of select="'To check'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawn'">
				<xsl:copy-of select="'Withdrawn'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf45_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Merger'">
				<xsl:copy-of select="'Merger'"/>
			</xsl:when>
			<xsl:when test="$input='Partial Transfer'">
				<xsl:copy-of select="'Partial transfer'"/>
			</xsl:when>
			<xsl:when test="$input='Short Notation'">
				<xsl:copy-of select="'Short notation'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf46_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Action before Court of Justice pending'">
				<xsl:copy-of select="'Action before court of justice pending'"/>
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
	<xsl:template name="vmf:vmf47_inputtoresult">
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
	<xsl:template name="vmf:vmf48_inputtoresult">
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
	<xsl:template name="vmf:vmf49_inputtoresult">
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
	<xsl:template name="vmf:vmf50_inputtoresult">
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
	<xsl:template name="vmf:vmf51_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Mark'">
				<xsl:copy-of select="'Mark'"/>
			</xsl:when>
			<xsl:when test="$input='Registered mark with reputation'">
				<xsl:copy-of select="'Registered mark with reputation'"/>
			</xsl:when>
			<xsl:when test="$input='Well-known mark'">
				<xsl:copy-of select="'Well known mark'"/>
			</xsl:when>
			<xsl:when test="$input='Non-registered mark'">
				<xsl:copy-of select="'NonRegistered mark'"/>
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
	<xsl:template name="vmf:vmf52_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility checked'">
				<xsl:copy-of select="'Admissibility of opposition filing checked'"/>
			</xsl:when>
			<xsl:when test="$input='Cooling-off period'">
				<xsl:copy-of select="'Cooling off period taken'"/>
			</xsl:when>
			<xsl:when test="$input='Commencement of proceeding'">
				<xsl:copy-of select="'Proceedings of opposition commenced'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties'">
				<xsl:copy-of select="'Agreement between parties reached'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM withdrawn'">
				<xsl:copy-of select="'Application or trademark finally withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM limited'">
				<xsl:copy-of select="'Application or trademark finally  limited'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition withdrawn'">
				<xsl:copy-of select="'Final decision_Opposition withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected by ED'">
				<xsl:copy-of select="'Application or trademark finally rejected in full'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected in part'">
				<xsl:copy-of select="'Application or trademark finally in part'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition rejected'">
				<xsl:copy-of select="'Opposition finally rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition not duly entered'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='No decision - Opposition not duly entered'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='Opposition closed'">
				<xsl:copy-of select="'Opposition closed'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf53_inputtoresult">
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
	<xsl:template name="vmf:vmf54_inputtoresult">
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
			<xsl:when test="$input='3-D'">
				<xsl:copy-of select="'Three dimensional'"/>
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
	<xsl:template name="vmf:vmf55_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Opposition filed'">
				<xsl:copy-of select="'Opposition filed'"/>
			</xsl:when>
			<xsl:when test="$input='Admissibility checked'">
				<xsl:copy-of select="'Admissibility checked'"/>
			</xsl:when>
			<xsl:when test="$input='Cooling-off period'">
				<xsl:copy-of select="'Coolingoff period'"/>
			</xsl:when>
			<xsl:when test="$input='Commencement of proceeding'">
				<xsl:copy-of select="'Commencement of proceeding'"/>
			</xsl:when>
			<xsl:when test="$input='Agreement between parties'">
				<xsl:copy-of select="'Agreement between parties'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM withdrawn'">
				<xsl:copy-of select="'Final decision_CTM withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM limited'">
				<xsl:copy-of select="'Final decision_CTM limited'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition withdrawn'">
				<xsl:copy-of select="'Final decision_Opposition withdrawn'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected by ED'">
				<xsl:copy-of select="'Final decision_CTM rejected by ED'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected in part'">
				<xsl:copy-of select="'Final decision_CTM rejected in part'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - CTM rejected'">
				<xsl:copy-of select="'Final decision_CTM rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition rejected'">
				<xsl:copy-of select="'Final decision_Opposition rejected'"/>
			</xsl:when>
			<xsl:when test="$input='Final decision - Opposition not duly entered'">
				<xsl:copy-of select="'Final decision_Opposition not duly entered'"/>
			</xsl:when>
			<xsl:when test="$input='No decision - Opposition not duly entered'">
				<xsl:copy-of select="'No decision_Opposition not duly entered'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition closed'">
				<xsl:copy-of select="'Opposition closed'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf56_inputtoresult">
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
	<xsl:template match="/">
		<xsl:variable name="var256_Transaction" as="node()?" select="ns0:Transaction"/>
		<tmk:TrademarkTransaction xmlns:tmk="http://www.wipo.int/standards/XMLSchema/ST96/Trademark" xmlns:tbl="http://www.oasis-open.org/tables/exchange/1.0" xmlns:mathml="http://www.w3.org/1998/Math/MathML3" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/ST96/Trademark ../../Schemas/ST96Schema/ST96XMLSchema_Current_Flattened/TrademarkTransaction_V6_0.xsd'"/>
			<xsl:for-each select="$var256_Transaction">
				<xsl:attribute name="com:st96Version" select="'V6_0'"/>
			</xsl:for-each>
			<xsl:for-each select="$var256_Transaction">
				<xsl:for-each select="ns0:TransactionHeader">
					<com:TransactionHeader>
						<xsl:for-each select="ns0:SenderDetails">
							<com:SenderBag>
								<xsl:for-each select="ns0:RequestIdentifier">
									<com:RequestIdentifier>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestIdentifier>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestLanguageCode">
									<com:RequestLanguageCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestLanguageCode>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestXSDVersion">
									<com:RequestXSDVersion>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestXSDVersion>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestFilename">
									<com:FileName>
										<xsl:sequence select="fn:string(.)"/>
									</com:FileName>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestStatus">
									<com:RequestStatusCategory>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestStatusCategory>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestProducer">
									<com:RequestProducer>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestProducer>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestReceivingOfficeCode">
									<com:RequestReceivingOfficeCode>
										<xsl:sequence select="fn:string(.)"/>
									</com:RequestReceivingOfficeCode>
								</xsl:for-each>
								<xsl:for-each select="ns0:LoginInformation">
									<com:LoginInformation>
										<xsl:for-each select="ns0:Login">
											<com:Login>
												<xsl:sequence select="fn:string(.)"/>
											</com:Login>
										</xsl:for-each>
										<xsl:for-each select="ns0:LoginEmail">
											<com:LoginEmail>
												<xsl:sequence select="fn:string(.)"/>
											</com:LoginEmail>
										</xsl:for-each>
										<xsl:for-each select="ns0:Password">
											<com:Password>
												<xsl:sequence select="fn:string(.)"/>
											</com:Password>
										</xsl:for-each>
									</com:LoginInformation>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestProducerDate">
									<com:RequestDate>
										<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
									</com:RequestDate>
								</xsl:for-each>
								<xsl:for-each select="ns0:RequestProducerDateTime">
									<com:RequestDateTime>
										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
									</com:RequestDateTime>
								</xsl:for-each>
							</com:SenderBag>
						</xsl:for-each>
						<xsl:for-each select="ns0:ReceiverDetails">
							<com:ReceiverBag>
								<xsl:for-each select="ns0:ReceiverDateTime">
									<com:ReceiverDateTime>
										<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
									</com:ReceiverDateTime>
								</xsl:for-each>
								<xsl:for-each select="ns0:Comment">
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
				<xsl:for-each select="ns0:TradeMarkTransactionBody">
					<tmk:TrademarkTransactionBody>
						<xsl:attribute name="com:st96Version" select="'V6_0'"/>
						<xsl:for-each select="ns0:TransactionErrorDetails">
							<com:TransactionErrorBag>
								<xsl:for-each select="ns0:TransactionError">
									<com:TransactionError>
										<xsl:for-each select="ns0:TransactionErrorCode">
											<com:TransactionErrorCode>
												<xsl:sequence select="fn:string(.)"/>
											</com:TransactionErrorCode>
										</xsl:for-each>
										<xsl:for-each select="ns0:TransactionErrorText">
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
						<xsl:variable name="var255_TransactionContentDetails" as="node()" select="ns0:TransactionContentDetails"/>
						<tmk:TransactionContentBag>
							<xsl:attribute name="com:st96Version" select="'V6_0'"/>
							<xsl:for-each select="$var255_TransactionContentDetails/ns0:TransactionIdentifier">
								<com:TransactionIdentifier>
									<xsl:sequence select="fn:string(.)"/>
								</com:TransactionIdentifier>
							</xsl:for-each>
							<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf1_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var255_TransactionContentDetails/ns0:TransactionCode)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var1_resultof_vmf__inputtoresult">
								<com:TransactionCategory>
									<xsl:sequence select="."/>
								</com:TransactionCategory>
							</xsl:for-each>
							<xsl:for-each select="$var255_TransactionContentDetails/ns0:TransactionSubCode">
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
							<xsl:variable name="var254_TransactionData" as="node()" select="$var255_TransactionContentDetails/ns0:TransactionData"/>
							<xsl:variable name="var253_TradeMarkApplication" as="node()?" select="$var254_TransactionData/ns0:TradeMarkApplication"/>
							<tmk:TransactionData>
								<xsl:attribute name="com:st96Version" select="'V6_0'"/>
								<xsl:for-each select="$var253_TradeMarkApplication">
									<tmk:TrademarkApplication>
										<xsl:attribute name="com:st96Version" select="'V6_0'"/>
										<xsl:for-each select="ns0:RequestSoftware">
											<com:RequestSoftware>
												<com:RequestSoftwareName>
													<xsl:sequence select="fn:string(ns0:RequestSoftwareName)"/>
												</com:RequestSoftwareName>
												<xsl:for-each select="ns0:RequestSoftwareVersion">
													<com:RequestSoftwareVersion>
														<xsl:sequence select="fn:string(.)"/>
													</com:RequestSoftwareVersion>
												</xsl:for-each>
											</com:RequestSoftware>
										</xsl:for-each>
										<xsl:for-each select="ns0:ApplicationFormName">
											<tmk:ApplicationFormName>
												<xsl:sequence select="fn:string(.)"/>
											</tmk:ApplicationFormName>
										</xsl:for-each>
										<xsl:for-each select="ns0:RequestSearch">
											<tmk:RequestSearch>
												<tmk:RequestSearchCategory>
													<xsl:sequence select="fn:string(ns0:RequestSearchKindCode)"/>
												</tmk:RequestSearchCategory>
											</tmk:RequestSearch>
										</xsl:for-each>
										<xsl:for-each select="ns0:RequestExamination">
											<com:RequestExamination>
												<com:RequestExaminationCategory>
													<xsl:sequence select="fn:string(ns0:RequestExaminationKindCode)"/>
												</com:RequestExaminationCategory>
											</com:RequestExamination>
										</xsl:for-each>
										<xsl:for-each select="ns0:DocumentIncludedDetails">
											<com:DocumentIncludedBag>
												<xsl:for-each select="ns0:DocumentIncluded">
													<com:DocumentIncluded>
														<xsl:for-each select="ns0:DocumentName">
															<com:DocumentName>
																<xsl:sequence select="fn:string(.)"/>
															</com:DocumentName>
														</xsl:for-each>
													</com:DocumentIncluded>
												</xsl:for-each>
											</com:DocumentIncludedBag>
										</xsl:for-each>
										<xsl:for-each select="ns0:TradeMarkDetails">
											<tmk:TrademarkBag>
												<xsl:for-each select="ns0:TradeMark">
													<tmk:Trademark>
														<xsl:sequence select="()"/>
													</tmk:Trademark>
												</xsl:for-each>
											</tmk:TrademarkBag>
										</xsl:for-each>
										<xsl:for-each select="ns0:PaymentDetails">
											<com:PaymentBag>
												<xsl:for-each select="ns0:Payment">
													<com:Payment>
														<xsl:for-each select="ns0:PaymentFeeDetails/ns0:PaymentFee">
															<xsl:variable name="var3_FeeAmount" as="node()" select="ns0:FeeAmount"/>
															<com:FeePayableTotalAmount>
																<xsl:for-each select="$var3_FeeAmount/@currencyCode">
																	<xsl:attribute name="com:currencyCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="xs:string(xs:decimal(fn:string($var3_FeeAmount)))"/>
															</com:FeePayableTotalAmount>
														</xsl:for-each>
													</com:Payment>
												</xsl:for-each>
											</com:PaymentBag>
										</xsl:for-each>
										<xsl:for-each select="ns0:ReimbursementDetails">
											<com:ReimbursementBag>
												<xsl:for-each select="ns0:Reimbursement">
													<com:Reimbursement>
														<xsl:sequence select="()"/>
													</com:Reimbursement>
												</xsl:for-each>
											</com:ReimbursementBag>
										</xsl:for-each>
										<xsl:for-each select="ns0:SignatoryDetails">
											<com:SignatureBag>
												<xsl:for-each select="ns0:Signatory">
													<com:Signature>
														<xsl:for-each select="ns0:SignatoryAddress">
															<com:Contact>
																<xsl:sequence select="()"/>
															</com:Contact>
														</xsl:for-each>
													</com:Signature>
												</xsl:for-each>
											</com:SignatureBag>
										</xsl:for-each>
									</tmk:TrademarkApplication>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:TradeMarkDetails">
									<tmk:TrademarkBag>
										<xsl:for-each select="ns0:TradeMark">
											<xsl:variable name="var151_cur" as="node()" select="."/>
											<tmk:Trademark>
												<xsl:for-each select="@operationCode">
													<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:for-each select="ns0:RegistrationOfficeCode">
													<com:RegistrationOfficeCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:RegistrationOfficeCode>
												</xsl:for-each>
												<xsl:for-each select="ns0:ReceivingOfficeCode">
													<com:ReceivingOfficeCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:ReceivingOfficeCode>
												</xsl:for-each>
												<xsl:for-each select="ns0:ReceivingOfficeDate">
													<com:ReceivingOfficeDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ReceivingOfficeDate>
												</xsl:for-each>
												<com:ApplicationNumber>
													<xsl:for-each select="ns0:ApplicationNumber">
														<com:ApplicationNumberText>
															<xsl:sequence select="fn:string(.)"/>
														</com:ApplicationNumberText>
													</xsl:for-each>
												</com:ApplicationNumber>
												<xsl:for-each select="ns0:RegistrationNumber">
													<com:RegistrationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</com:RegistrationNumber>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicationDate">
													<com:ApplicationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ApplicationDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicationDateTime">
													<com:ApplicationDateTime>
														<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
													</com:ApplicationDateTime>
												</xsl:for-each>
												<xsl:for-each select="ns0:RegistrationDate">
													<com:RegistrationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:RegistrationDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:OtherDate">
													<tmk:OtherDate>
														<xsl:for-each select="@otherDateKind">
															<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf3_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var4_resultof_vmf__inputtoresult">
																<xsl:attribute name="tmk:otherDateCategory" select="."/>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:OtherDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:FilingPlace">
													<com:FilingPlace>
														<xsl:sequence select="fn:string(.)"/>
													</com:FilingPlace>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicationReference">
													<com:ApplicantFileReference>
														<xsl:sequence select="fn:string(.)"/>
													</com:ApplicantFileReference>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicantSideCaseKey">
													<tmk:ApplicantSideCaseIdentifier>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ApplicantSideCaseIdentifier>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicationLanguageCode">
													<com:ApplicationLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:ApplicationLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns0:SecondLanguageCode">
													<com:SecondLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:SecondLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns0:CorrespondenceLanguageCode">
													<com:CorrespondenceLanguageCode>
														<xsl:sequence select="fn:string(.)"/>
													</com:CorrespondenceLanguageCode>
												</xsl:for-each>
												<xsl:for-each select="ns0:ExaminedApplicationNumber">
													<tmk:ExaminedApplicationNumber>
														<com:ApplicationNumberText>
															<xsl:sequence select="fn:string(.)"/>
														</com:ApplicationNumberText>
													</tmk:ExaminedApplicationNumber>
												</xsl:for-each>
												<xsl:for-each select="ns0:ExpiryDate">
													<com:ExpiryDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:ExpiryDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:TerminationDate">
													<tmk:TerminationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:TerminationDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:MarkCurrentStatusCode">
													<xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf4_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var5_resultof_vmf__inputtoresult">
														<tmk:MarkCurrentStatusCode>
															<xsl:sequence select="."/>
														</tmk:MarkCurrentStatusCode>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="ns0:MarkCurrentStatusDate">
													<tmk:MarkCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:MarkCurrentStatusDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:DesignatedCountryDetails">
													<tmk:DesignatedCountryBag>
														<xsl:for-each select="ns0:DesignatedCountry">
															<tmk:DesignatedCountry>
																<com:DesignatedCountryCode>
																	<xsl:sequence select="fn:string(ns0:DesignatedCountryCode)"/>
																</com:DesignatedCountryCode>
																<xsl:for-each select="ns0:DesignatedUnderCode">
																	<xsl:variable name="var6_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf5_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var6_resultof_vmf__inputtoresult">
																		<tmk:MadridSystemCategory>
																			<xsl:sequence select="."/>
																		</tmk:MadridSystemCategory>
																	</xsl:for-each>
																</xsl:for-each>
															</tmk:DesignatedCountry>
														</xsl:for-each>
													</tmk:DesignatedCountryBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:PreviousRegistrationDetails">
													<tmk:PreviousRegistrationBag>
														<xsl:for-each select="ns0:PreviousRegistration">
															<tmk:PreviousRegistration>
																<xsl:for-each select="ns0:RegistrationOfficeCode">
																	<com:RegistrationOfficeCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:RegistrationOfficeCode>
																</xsl:for-each>
																<tmk:PreviousRegistrationNumber>
																	<xsl:sequence select="fn:string(ns0:PreviousRegistrationNumber)"/>
																</tmk:PreviousRegistrationNumber>
																<xsl:for-each select="ns0:PreviousRegistrationDate">
																	<tmk:PreviousRegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:PreviousRegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:PreviousRegistrationBasis">
																	<xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf6_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var7_resultof_vmf__inputtoresult">
																		<tmk:PreviousRegistrationBasisCategory>
																			<xsl:sequence select="."/>
																		</tmk:PreviousRegistrationBasisCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:PreviousRegistrationCancellationDate">
																	<tmk:PreviousRegistrationCancellationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:PreviousRegistrationCancellationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:PreviousRegistrationPriorityDate">
																	<tmk:PreviousRegistrationPriorityDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:PreviousRegistrationPriorityDate>
																</xsl:for-each>
															</tmk:PreviousRegistration>
														</xsl:for-each>
													</tmk:PreviousRegistrationBag>
												</xsl:for-each>
												<tmk:AssociatedMarkBag>
													<xsl:for-each select="ns0:AssociatedMarkDetails">
														<tmk:AssociatedMark>
															<tmk:AssociatedApplicationNumber>
																<xsl:for-each select="ns0:AssociatedApplicationNumber">
																	<com:ApplicationNumberText>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ApplicationNumberText>
																</xsl:for-each>
															</tmk:AssociatedApplicationNumber>
														</tmk:AssociatedMark>
													</xsl:for-each>
												</tmk:AssociatedMarkBag>
												<xsl:for-each select="ns0:DivisionalApplicationDetails">
													<tmk:DivisionalApplicationBag>
														<tmk:InitialApplicationNumber>
															<com:ApplicationNumberText>
																<xsl:sequence select="fn:string(ns0:InitialApplicationNumber)"/>
															</com:ApplicationNumberText>
														</tmk:InitialApplicationNumber>
														<xsl:for-each select="ns0:InitialApplicationDate">
															<tmk:InitialApplicationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</tmk:InitialApplicationDate>
														</xsl:for-each>
													</tmk:DivisionalApplicationBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:BasicRegistrationApplicationDetails">
													<tmk:BasicRegistrationApplicationBag>
														<xsl:for-each select="ns0:BasicRegistrationApplication">
															<tmk:BasicRegistrationApplication>
																<xsl:for-each select="ns0:RegistrationOfficeCode">
																	<com:RegistrationOfficeCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:RegistrationOfficeCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:BasicApplicationDetails">
																	<tmk:BasicApplicationBag>
																		<xsl:for-each select="ns0:BasicApplication">
																			<tmk:BasicApplication>
																				<tmk:BasicApplicationNumber>
																					<xsl:for-each select="ns0:BasicApplicationNumber">
																						<com:ApplicationNumberText>
																							<xsl:sequence select="fn:string(.)"/>
																						</com:ApplicationNumberText>
																					</xsl:for-each>
																				</tmk:BasicApplicationNumber>
																				<xsl:for-each select="ns0:BasicApplicationDate">
																					<tmk:BasicApplicationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</tmk:BasicApplicationDate>
																				</xsl:for-each>
																			</tmk:BasicApplication>
																		</xsl:for-each>
																	</tmk:BasicApplicationBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:BasicRegistrationDetails">
																	<tmk:BasicRegistrationBag>
																		<xsl:for-each select="ns0:BasicRegistration">
																			<tmk:BasicRegistration>
																				<xsl:for-each select="ns0:BasicRegistrationNumber">
																					<tmk:BasicRegistrationNumber>
																						<xsl:sequence select="fn:string(.)"/>
																					</tmk:BasicRegistrationNumber>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:BasicRegistrationDate">
																					<tmk:BasicRegistrationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</tmk:BasicRegistrationDate>
																				</xsl:for-each>
																			</tmk:BasicRegistration>
																		</xsl:for-each>
																	</tmk:BasicRegistrationBag>
																</xsl:for-each>
															</tmk:BasicRegistrationApplication>
														</xsl:for-each>
													</tmk:BasicRegistrationApplicationBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:InternationalMarkKey">
													<tmk:InternationalMarkIdentifierBag>
														<xsl:for-each select="ns0:Identifier">
															<tmk:InternationalMarkIdentifier>
																<xsl:for-each select="@identifierKindCode">
																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</tmk:InternationalMarkIdentifier>
														</xsl:for-each>
													</tmk:InternationalMarkIdentifierBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:KindMark">
													<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf7_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
														<tmk:MarkCategory>
															<xsl:sequence select="."/>
														</tmk:MarkCategory>
													</xsl:for-each>
												</xsl:for-each>
												<tmk:MarkRepresentation>
													<xsl:for-each select="ns0:MarkFeature">
														<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf8_inputtoresult">
																<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var9_resultof_vmf__inputtoresult">
															<tmk:MarkFeatureCategory>
																<xsl:sequence select="."/>
															</tmk:MarkFeatureCategory>
														</xsl:for-each>
													</xsl:for-each>
													<tmk:MarkReproduction>
														<xsl:for-each select="ns0:WordMarkSpecification">
															<tmk:WordMarkSpecification>
																<xsl:for-each select="ns0:MarkVerbalElementText">
																	<tmk:MarkVerbalElementText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkVerbalElementText>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkSignificantVerbalElement">
																	<tmk:MarkSignificantVerbalElementText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkSignificantVerbalElementText>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkVerbalElementSignificantIndicator">
																	<tmk:MarkVerbalElementSignificantIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</tmk:MarkVerbalElementSignificantIndicator>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkTranslation">
																	<tmk:MarkTranslationText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="@sequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkTranslationText>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkTransliteration">
																	<tmk:MarkTransliteration>
																		<xsl:for-each select="@transliterationKind">
																			<xsl:variable name="var10_resultof_vmf__inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf9_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var10_resultof_vmf__inputtoresult">
																				<xsl:attribute name="tmk:transliterationCategory" select="."/>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkTransliteration>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkTranscription">
																	<tmk:MarkTranscription>
																		<xsl:for-each select="@transcriptionKind">
																			<xsl:variable name="var11_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf10_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var11_resultof_vmf___inputtoresult">
																				<xsl:attribute name="tmk:transcriptionCategory" select="."/>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkTranscription>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkStandardCharacterIndicator">
																	<tmk:MarkStandardCharacterIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</tmk:MarkStandardCharacterIndicator>
																</xsl:for-each>
															</tmk:WordMarkSpecification>
														</xsl:for-each>
														<xsl:for-each select="ns0:MarkImageDetails">
															<tmk:MarkImageBag>
																<xsl:for-each select="ns0:MarkImage">
																	<xsl:variable name="var21_MarkImageRepresentationSize" as="node()?" select="ns0:MarkImageRepresentationSize"/>
																	<tmk:MarkImage>
																		<xsl:for-each select="ns0:MarkImageFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageFileFormat">
																			<xsl:variable name="var12_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf11_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var12_resultof_vmf___inputtoresult">
																				<com:ImageFormatCategory>
																					<xsl:sequence select="."/>
																				</com:ImageFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageColourClaimedText">
																			<tmk:MarkImageColourClaimedText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="@sequenceNumber">
																					<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:MarkImageColourClaimedText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageColourPartClaimedText">
																			<tmk:MarkImageColourPartClaimedText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="@sequenceNumber">
																					<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:MarkImageColourPartClaimedText>
																		</xsl:for-each>
																		<xsl:for-each select="$var21_MarkImageRepresentationSize">
																			<xsl:variable name="var13_cur" as="node()" select="."/>
																			<xsl:for-each select="ns0:Height">
																				<com:HeightMeasure>
																					<xsl:for-each select="$var13_cur/ns0:Unit">
																						<xsl:attribute name="com:measureUnitCode">
																							<xsl:call-template name="vmf:vmf12_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:attribute>
																					</xsl:for-each>
																					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																				</com:HeightMeasure>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="$var21_MarkImageRepresentationSize">
																			<xsl:variable name="var14_cur" as="node()" select="."/>
																			<xsl:for-each select="ns0:Width">
																				<com:WidthMeasure>
																					<xsl:for-each select="$var14_cur/ns0:Unit">
																						<xsl:attribute name="com:measureUnitCode">
																							<xsl:call-template name="vmf:vmf12_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:attribute>
																					</xsl:for-each>
																					<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																				</com:WidthMeasure>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageCategory">
																			<tmk:MarkImageClassification>
																				<com:FigurativeElementClassificationBag>
																					<com:NationalFigurativeElementClassificationBag>
																						<xsl:for-each select="ns0:CategoryVersion">
																							<com:NationalClassificationEdition>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalClassificationEdition>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:CategoryCodeDetails/ns0:CategoryCode">
																							<com:NationalFigurativeElementClassification>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalFigurativeElementClassification>
																						</xsl:for-each>
																					</com:NationalFigurativeElementClassificationBag>
																				</com:FigurativeElementClassificationBag>
																			</tmk:MarkImageClassification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageQualityIndicator">
																			<tmk:MarkImageQualityIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</tmk:MarkImageQualityIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageRenditionDetails">
																			<tmk:MarkImageRenditionBag>
																				<xsl:for-each select="ns0:MarkImageRendition">
																					<xsl:variable name="var19_MarkImageRenditionRepresentati" as="node()?" select="ns0:MarkImageRenditionRepresentationSize"/>
																					<tmk:MarkImageRendition>
																						<xsl:for-each select="ns0:MarkImageRenditionKind">
																							<xsl:variable name="var15_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf13_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var15_resultof_vmf___inputtoresult">
																								<tmk:MarkImageRenditionCategory>
																									<xsl:sequence select="."/>
																								</tmk:MarkImageRenditionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:MarkImageRenditionFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:MarkImageRenditionFileFormat">
																							<xsl:variable name="var16_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf14_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var16_resultof_vmf___inputtoresult">
																								<com:ImageFormatCategory>
																									<xsl:sequence select="."/>
																								</com:ImageFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:MarkImageRenditionColourMode">
																							<com:ColourModeCategory>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:ColourModeCategory>
																						</xsl:for-each>
																						<xsl:for-each select="$var19_MarkImageRenditionRepresentati">
																							<xsl:variable name="var17_cur" as="node()" select="."/>
																							<xsl:for-each select="ns0:Height">
																								<com:HeightMeasure>
																									<xsl:for-each select="$var17_cur/ns0:Unit">
																										<xsl:attribute name="com:measureUnitCode">
																											<xsl:call-template name="vmf:vmf15_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:attribute>
																									</xsl:for-each>
																									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																								</com:HeightMeasure>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="$var19_MarkImageRenditionRepresentati">
																							<xsl:variable name="var18_cur" as="node()" select="."/>
																							<xsl:for-each select="ns0:Width">
																								<com:WidthMeasure>
																									<xsl:for-each select="$var18_cur/ns0:Unit">
																										<xsl:attribute name="com:measureUnitCode">
																											<xsl:call-template name="vmf:vmf15_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:attribute>
																									</xsl:for-each>
																									<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																								</com:WidthMeasure>
																							</xsl:for-each>
																						</xsl:for-each>
																					</tmk:MarkImageRendition>
																				</xsl:for-each>
																			</tmk:MarkImageRenditionBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageColourIndicator">
																			<com:ColourIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</com:ColourIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkImageColourMode">
																			<xsl:variable name="var20_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf16_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var20_resultof_vmf___inputtoresult">
																				<com:ColourModeCategory>
																					<xsl:sequence select="."/>
																				</com:ColourModeCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																	</tmk:MarkImage>
																</xsl:for-each>
															</tmk:MarkImageBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:MarkSoundDetails">
															<xsl:variable name="var23_MarkSound" as="node()" select="ns0:MarkSound"/>
															<tmk:MarkSoundBag>
																<tmk:MarkSound>
																	<com:FileName>
																		<xsl:sequence select="fn:string($var23_MarkSound/ns0:MarkSoundFilename)"/>
																	</com:FileName>
																	<xsl:for-each select="$var23_MarkSound/ns0:MarkSoundFileFormat">
																		<xsl:variable name="var22_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf17_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var22_resultof_vmf___inputtoresult">
																			<tmk:SoundFileFormatCategory>
																				<xsl:sequence select="."/>
																			</tmk:SoundFileFormatCategory>
																		</xsl:for-each>
																	</xsl:for-each>
																</tmk:MarkSound>
															</tmk:MarkSoundBag>
														</xsl:for-each>
													</tmk:MarkReproduction>
													<xsl:for-each select="ns0:MarkDescriptionDetails">
														<xsl:variable name="var24_MarkDescription" as="node()+" select="ns0:MarkDescription"/>
														<tmk:MarkDescriptionBag>
															<xsl:for-each select="$var24_MarkDescription">
																<tmk:MarkDescriptionText>
																	<xsl:sequence select="fn:string(.)"/>
																</tmk:MarkDescriptionText>
															</xsl:for-each>
															<tmk:MarkDescriptionImage>
																<xsl:for-each select="$var24_MarkDescription/@sequenceNumber">
																	<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																</xsl:for-each>
															</tmk:MarkDescriptionImage>
														</tmk:MarkDescriptionBag>
													</xsl:for-each>
												</tmk:MarkRepresentation>
												<xsl:for-each select="ns0:MarkDisclaimerDetails">
													<tmk:MarkDisclaimerBag>
														<xsl:for-each select="ns0:MarkDisclaimer">
															<tmk:MarkDisclaimerText>
																<xsl:for-each select="@languageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="@sequenceNumber">
																	<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</tmk:MarkDisclaimerText>
														</xsl:for-each>
													</tmk:MarkDisclaimerBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:NonUseCancelledIndicator">
													<tmk:NonUseCancelledIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</tmk:NonUseCancelledIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns0:SpecialCircumstanceText">
													<tmk:SpecialCircumstanceText>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:SpecialCircumstanceText>
												</xsl:for-each>
												<xsl:for-each select="ns0:TradeDistinctivenessIndicator">
													<tmk:TradeDistinctivenessIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</tmk:TradeDistinctivenessIndicator>
												</xsl:for-each>
												<xsl:for-each select="ns0:TradeDistinctivenessText">
													<tmk:TradeDistinctivenessText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:TradeDistinctivenessText>
												</xsl:for-each>
												<xsl:for-each select="ns0:UseRight">
													<tmk:UseRight>
														<xsl:for-each select="ns0:UseRightIndicator">
															<tmk:UseRightIndicator>
																<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
															</tmk:UseRightIndicator>
														</xsl:for-each>
														<xsl:for-each select="ns0:UseRightText">
															<tmk:UseRightText>
																<xsl:for-each select="@languageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</tmk:UseRightText>
														</xsl:for-each>
														<xsl:for-each select="ns0:UseRightGoodsServices">
															<tmk:UseRightGoodsServices>
																<xsl:for-each select="$var253_TradeMarkApplication/ns0:TradeMarkDetails/ns0:TradeMark/ns0:UseRight/ns0:UseRightGoodsServices">
																	<tmk:GoodsServicesClassificationBag>
																		<xsl:sequence select="()"/>
																	</tmk:GoodsServicesClassificationBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:ClassificationKindCode">
																	<tmk:ClassificationKindCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:ClassificationKindCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:ClassificationVersion">
																	<com:ClassificationVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ClassificationVersion>
																</xsl:for-each>
																<com:CommentTextBag>
																	<xsl:for-each select="ns0:Comment">
																		<com:CommentText>
																			<xsl:for-each select="@languageCode">
																				<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																			</xsl:for-each>
																			<xsl:sequence select="fn:string(.)"/>
																		</com:CommentText>
																	</xsl:for-each>
																</com:CommentTextBag>
																<xsl:for-each select="ns0:ProposedLeadingClassNumber">
																	<tmk:ProposedLeadingClassNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:ProposedLeadingClassNumber>
																</xsl:for-each>
																<tmk:ClassDescriptionBag>
																	<xsl:for-each select="ns0:ClassDescriptionDetails/ns0:ClassDescription">
																		<tmk:ClassDescription>
																			<xsl:for-each select="ns0:ClassNumber">
																				<tmk:ClassNumber>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:ClassNumber>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:ClassNumberStatusCode">
																				<xsl:variable name="var25_resultof_vmf___inputtoresult" as="xs:string?">
																					<xsl:call-template name="vmf:vmf18_inputtoresult">
																						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var25_resultof_vmf___inputtoresult">
																					<tmk:ClassNumberStatusCategory>
																						<xsl:sequence select="."/>
																					</tmk:ClassNumberStatusCategory>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:GoodsServicesDescription">
																				<tmk:GoodsServicesDescriptionText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:for-each select="@sequenceNumber">
																						<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:GoodsServicesDescriptionText>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																				<tmk:UseNiceHeadingIndicator>
																					<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																				</tmk:UseNiceHeadingIndicator>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:ClassificationTermDetails">
																				<tmk:ClassificationTermBag>
																					<xsl:for-each select="ns0:ClassificationTerm">
																						<tmk:ClassificationTerm>
																							<xsl:for-each select="@operationCode">
																								<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermIdentifier">
																								<tmk:ClassificationTermIdentifier>
																									<xsl:for-each select="@identifierKindCode">
																										<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermIdentifier>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermOffice">
																								<tmk:ClassificationTermOfficeCode>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermOfficeCode>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																								<tmk:ClassificationTermOfficeIdentification>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermOfficeIdentification>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermSource">
																								<xsl:variable name="var26_resultof_vmf___inputtoresult" as="xs:string?">
																									<xsl:call-template name="vmf:vmf19_inputtoresult">
																										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																									</xsl:call-template>
																								</xsl:variable>
																								<xsl:for-each select="$var26_resultof_vmf___inputtoresult">
																									<tmk:ClassificationTermSourceCategory>
																										<xsl:sequence select="."/>
																									</tmk:ClassificationTermSourceCategory>
																								</xsl:for-each>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermEntryDate">
																								<tmk:ClassificationTermEntryDate>
																									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																								</tmk:ClassificationTermEntryDate>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassNumber">
																								<tmk:ClassNumber>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassNumber>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermText">
																								<tmk:ClassificationTermText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermText>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																								<tmk:ClassificationTermEquivalentGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermEquivalentGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																								<tmk:ClassificationTermReferenceGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermReferenceGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																								<tmk:ClassificationTermTranslationGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermTranslationGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermStatus">
																								<xsl:variable name="var28_cur" as="node()" select="."/>
																								<xsl:variable name="var27_resultof_vmf___inputtoresult" as="xs:string?">
																									<xsl:call-template name="vmf:vmf20_inputtoresult">
																										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																									</xsl:call-template>
																								</xsl:variable>
																								<xsl:for-each select="$var27_resultof_vmf___inputtoresult">
																									<tmk:ClassificationTermStatus>
																										<xsl:for-each select="$var28_cur/@officeCode">
																											<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="."/>
																									</tmk:ClassificationTermStatus>
																								</xsl:for-each>
																							</xsl:for-each>
																							<xsl:for-each select="$var151_cur/ns0:AsItIsProtectionIndicator">
																								<tmk:WIPOBasicNumber>
																									<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																								</tmk:WIPOBasicNumber>
																							</xsl:for-each>
																						</tmk:ClassificationTerm>
																					</xsl:for-each>
																				</tmk:ClassificationTermBag>
																			</xsl:for-each>
																		</tmk:ClassDescription>
																	</xsl:for-each>
																</tmk:ClassDescriptionBag>
															</tmk:UseRightGoodsServices>
														</xsl:for-each>
													</tmk:UseRight>
												</xsl:for-each>
												<xsl:for-each select="ns0:UseRequirementText">
													<tmk:UseRequirementText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:UseRequirementText>
												</xsl:for-each>
												<xsl:for-each select="ns0:UseLimitationText">
													<tmk:UseLimitationText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:UseLimitationText>
												</xsl:for-each>
												<xsl:for-each select="ns0:Comment">
													<com:CommentText>
														<xsl:sequence select="fn:string(.)"/>
													</com:CommentText>
												</xsl:for-each>
												<xsl:for-each select="ns0:OppositionPeriodStartDate">
													<tmk:OppositionPeriodStartDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:OppositionPeriodStartDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:OppositionPeriodEndDate">
													<tmk:OppositionPeriodEndDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:OppositionPeriodEndDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:GoodsServicesDetails">
													<tmk:GoodsServicesBag>
														<xsl:for-each select="ns0:GoodsServices">
															<tmk:GoodsServices>
																<xsl:for-each select="ns0:ClassificationKindCode">
																	<tmk:ClassificationKindCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:ClassificationKindCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:ClassificationVersion">
																	<com:ClassificationVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ClassificationVersion>
																</xsl:for-each>
																<com:CommentTextBag>
																	<xsl:for-each select="ns0:Comment">
																		<com:CommentText>
																			<xsl:for-each select="@languageCode">
																				<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																			</xsl:for-each>
																			<xsl:sequence select="fn:string(.)"/>
																		</com:CommentText>
																	</xsl:for-each>
																</com:CommentTextBag>
																<xsl:for-each select="ns0:ProposedLeadingClassNumber">
																	<tmk:ProposedLeadingClassNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:ProposedLeadingClassNumber>
																</xsl:for-each>
																<tmk:ClassDescriptionBag>
																	<xsl:for-each select="ns0:ClassDescriptionDetails/ns0:ClassDescription">
																		<tmk:ClassDescription>
																			<xsl:for-each select="ns0:ClassNumber">
																				<tmk:ClassNumber>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:ClassNumber>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:ClassNumberStatusCode">
																				<tmk:ClassNumberStatusCategory>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:ClassNumberStatusCategory>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:GoodsServicesDescription">
																				<tmk:GoodsServicesDescriptionText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:for-each select="@sequenceNumber">
																						<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:GoodsServicesDescriptionText>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																				<tmk:UseNiceHeadingIndicator>
																					<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																				</tmk:UseNiceHeadingIndicator>
																			</xsl:for-each>
																			<xsl:for-each select="ns0:ClassificationTermDetails">
																				<tmk:ClassificationTermBag>
																					<xsl:for-each select="ns0:ClassificationTerm">
																						<tmk:ClassificationTerm>
																							<xsl:for-each select="@operationCode">
																								<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermIdentifier">
																								<tmk:ClassificationTermIdentifier>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermIdentifier>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermOffice">
																								<tmk:ClassificationTermOfficeCode>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermOfficeCode>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																								<tmk:ClassificationTermOfficeIdentification>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermOfficeIdentification>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermSource">
																								<tmk:ClassificationTermSourceCategory>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermSourceCategory>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermEntryDate">
																								<tmk:ClassificationTermEntryDate>
																									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																								</tmk:ClassificationTermEntryDate>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassNumber">
																								<tmk:ClassNumber>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassNumber>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermText">
																								<tmk:ClassificationTermText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermText>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																								<tmk:ClassificationTermEquivalentGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermEquivalentGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																								<tmk:ClassificationTermReferenceGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermReferenceGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																								<tmk:ClassificationTermTranslationGroup>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermTranslationGroup>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:ClassificationTermStatus">
																								<tmk:ClassificationTermStatus>
																									<xsl:for-each select="@officeCode">
																										<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:ClassificationTermStatus>
																							</xsl:for-each>
																							<xsl:for-each select="ns0:WIPOBasicNumber">
																								<tmk:WIPOBasicNumber>
																									<xsl:sequence select="fn:string(.)"/>
																								</tmk:WIPOBasicNumber>
																							</xsl:for-each>
																						</tmk:ClassificationTerm>
																					</xsl:for-each>
																				</tmk:ClassificationTermBag>
																			</xsl:for-each>
																		</tmk:ClassDescription>
																	</xsl:for-each>
																</tmk:ClassDescriptionBag>
															</tmk:GoodsServices>
														</xsl:for-each>
													</tmk:GoodsServicesBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:PriorityDetails">
													<tmk:PriorityBag>
														<xsl:for-each select="ns0:Priority">
															<tmk:Priority>
																<com:PriorityCountryCode>
																	<xsl:sequence select="fn:string(ns0:PriorityCountryCode)"/>
																</com:PriorityCountryCode>
																<xsl:for-each select="ns0:PriorityNumber">
																	<com:ApplicationNumber>
																		<com:ApplicationNumberText>
																			<xsl:sequence select="fn:string(.)"/>
																		</com:ApplicationNumberText>
																	</com:ApplicationNumber>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityDate">
																	<com:PriorityApplicationFilingDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:PriorityApplicationFilingDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityHolderName">
																	<com:PriorityHolderName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PriorityHolderName>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityStatusCode">
																	<xsl:variable name="var29_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf21_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var29_resultof_vmf___inputtoresult">
																		<com:PriorityStatusCategory>
																			<xsl:sequence select="."/>
																		</com:PriorityStatusCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityStatusDate">
																	<com:PriorityStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:PriorityStatusDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityDocument">
																	<com:PriorityDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var30_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var30_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var31_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var31_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:PriorityDocument>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityPartialIndicator">
																	<tmk:PriorityPartialIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</tmk:PriorityPartialIndicator>
																</xsl:for-each>
																<xsl:for-each select="ns0:PriorityPartialGoodsServices">
																	<tmk:PriorityPartialGoodsServices>
																		<xsl:for-each select="ns0:ClassificationKindCode">
																			<tmk:ClassificationKindCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:ClassificationKindCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationVersion">
																			<com:ClassificationVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:ClassificationVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ProposedLeadingClassNumber">
																			<tmk:ProposedLeadingClassNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:ProposedLeadingClassNumber>
																		</xsl:for-each>
																	</tmk:PriorityPartialGoodsServices>
																</xsl:for-each>
															</tmk:Priority>
														</xsl:for-each>
													</tmk:PriorityBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:ExhibitionPriorityDetails">
													<com:ExhibitionPriorityBag>
														<xsl:for-each select="ns0:ExhibitionPriority">
															<com:ExhibitionPriority>
																<xsl:for-each select="ns0:ExhibitionCountryCode">
																	<com:ExhibitionCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ExhibitionCountryCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:ExhibitionCityName">
																	<com:ExhibitionCityName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ExhibitionCityName>
																</xsl:for-each>
																<xsl:for-each select="ns0:ExhibitionName">
																	<com:ExhibitionName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:ExhibitionName>
																</xsl:for-each>
																<com:ExhibitionDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(ns0:ExhibitionDate)))"/>
																</com:ExhibitionDate>
																<xsl:for-each select="ns0:ExhibitionFirstDisplayDate">
																	<com:ExhibitionFirstDisplayDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:ExhibitionFirstDisplayDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:ExhibitionStatusCode">
																	<xsl:variable name="var32_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf24_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var32_resultof_vmf___inputtoresult">
																		<com:ExhibitionStatusCategory>
																			<xsl:sequence select="."/>
																		</com:ExhibitionStatusCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:ExhibitionStatusDate">
																	<com:ExhibitionStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:ExhibitionStatusDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
																<xsl:for-each select="ns0:ExhibitionDocument">
																	<com:ExhibitionDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var33_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var33_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var34_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var34_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:ExhibitionDocument>
																</xsl:for-each>
															</com:ExhibitionPriority>
														</xsl:for-each>
													</com:ExhibitionPriorityBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:SeniorityDetails">
													<tmk:SeniorityBag>
														<xsl:for-each select="ns0:Seniority">
															<tmk:Seniority>
																<tmk:SeniorityCountryCode>
																	<xsl:sequence select="fn:string(ns0:SeniorityCountryCode)"/>
																</tmk:SeniorityCountryCode>
																<tmk:SeniorityApplicationNumber>
																	<xsl:for-each select="ns0:SeniorityApplicationNumber">
																		<com:ApplicationNumberText>
																			<xsl:sequence select="fn:string(.)"/>
																		</com:ApplicationNumberText>
																	</xsl:for-each>
																</tmk:SeniorityApplicationNumber>
																<xsl:for-each select="ns0:SeniorityApplicationDate">
																	<tmk:SeniorityApplicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:SeniorityApplicationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityFilingDate">
																	<tmk:SeniorityFilingDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:SeniorityFilingDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityRegistrationNumber">
																	<tmk:SeniorityRegistrationNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:SeniorityRegistrationNumber>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityRegistrationDate">
																	<tmk:SeniorityRegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:SeniorityRegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityPublicationDate">
																	<tmk:SeniorityPublicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:SeniorityPublicationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:InternationalTradeMarkCode">
																	<xsl:variable name="var35_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf25_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var35_resultof_vmf___inputtoresult">
																		<tmk:InternationalTrademarkCategory>
																			<xsl:sequence select="."/>
																		</tmk:InternationalTrademarkCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityPartialIndicator">
																	<tmk:SeniorityPartialIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</tmk:SeniorityPartialIndicator>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityPartialGoodsServices">
																	<tmk:SeniorityPartialGoodsServices>
																		<xsl:for-each select="ns0:ClassificationKindCode">
																			<tmk:ClassificationKindCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:ClassificationKindCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClassificationVersion">
																			<com:ClassificationVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:ClassificationVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ProposedLeadingClassNumber">
																			<tmk:ProposedLeadingClassNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:ProposedLeadingClassNumber>
																		</xsl:for-each>
																	</tmk:SeniorityPartialGoodsServices>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityStatusCode">
																	<xsl:variable name="var36_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf26_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var36_resultof_vmf___inputtoresult">
																		<tmk:SeniorityStatusCategory>
																			<xsl:sequence select="."/>
																		</tmk:SeniorityStatusCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityStatusDate">
																	<tmk:SeniorityStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:SeniorityStatusDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
																<xsl:for-each select="ns0:SeniorityDocument">
																	<tmk:SeniorityDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var37_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var37_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var38_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var38_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</tmk:SeniorityDocument>
																</xsl:for-each>
															</tmk:Seniority>
														</xsl:for-each>
													</tmk:SeniorityBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:PublicationDetails">
													<tmk:PublicationBag>
														<xsl:for-each select="ns0:Publication">
															<tmk:Publication>
																<com:PublicationIdentifier>
																	<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																</com:PublicationIdentifier>
																<xsl:for-each select="ns0:PublicationSection">
																	<xsl:variable name="var39_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf27_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var39_resultof_vmf___inputtoresult">
																		<tmk:PublicationSectionCategory>
																			<xsl:sequence select="."/>
																		</tmk:PublicationSectionCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:PublicationSubsection">
																	<com:PublicationSubsection>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PublicationSubsection>
																</xsl:for-each>
																<xsl:for-each select="ns0:PublicationDate">
																	<com:PublicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:PublicationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:PublicationPage">
																	<com:PublicationPage>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PublicationPage>
																</xsl:for-each>
															</tmk:Publication>
														</xsl:for-each>
													</tmk:PublicationBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:ApplicantDetails">
													<tmk:ApplicantBag>
														<xsl:for-each select="ns0:ApplicantKey">
															<com:PartyIdentifierBag>
																<xsl:for-each select="ns0:Identifier">
																	<com:PartyIdentifier>
																		<xsl:for-each select="@identifierKindCode">
																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
															</com:PartyIdentifierBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:Applicant">
															<tmk:Applicant>
																<xsl:for-each select="@operationCode">
																	<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantSequenceNumber">
																	<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantLegalEntity">
																	<com:LegalEntityName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:LegalEntityName>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantIdentifier">
																	<com:PartyIdentifier>
																		<xsl:for-each select="@identifierKindCode">
																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantAddressBook">
																	<xsl:variable name="var40_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																			<xsl:with-param name="AddressBook" as="node()">
																				<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</AddressBookType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var40_resultof_MappingST__AddressBookToST__Contact">
																		<com:Contact>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Contact>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantNationalityCode">
																	<com:NationalityCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:NationalityCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantIncorporationCountryCode">
																	<com:IncorporationCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:IncorporationCountryCode>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantIncorporationState">
																	<com:IncorporationState>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:IncorporationState>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantEntitlement">
																	<tmk:Entitlement>
																		<xsl:for-each select="ns0:EntitlementNationalityCode">
																			<com:EntitlementNationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:EntitlementNationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:EntitlementEstablishment">
																			<com:EntitlementEstablishment>
																				<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																					<com:EntitlementEstablishmentCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementEstablishmentCode>
																				</xsl:for-each>
																			</com:EntitlementEstablishment>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:EntitlementDomiciled">
																			<com:EntitlementDomiciled>
																				<xsl:for-each select="ns0:EntitlementDomiciledCode">
																					<com:EntitlementDomiciledCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementDomiciledCode>
																				</xsl:for-each>
																			</com:EntitlementDomiciled>
																		</xsl:for-each>
																	</tmk:Entitlement>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantVersion">
																	<com:Version>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:VersionNumber">
																			<com:VersionNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:VersionNumber>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:VersionDate">
																			<com:VersionDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:VersionDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:VersionDateTime">
																			<com:VersionDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:VersionDateTime>
																		</xsl:for-each>
																	</com:Version>
																</xsl:for-each>
															</tmk:Applicant>
														</xsl:for-each>
													</tmk:ApplicantBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:RepresentativeDetails">
													<com:RepresentativeBag>
														<xsl:for-each select="ns0:Representative">
															<xsl:variable name="var41_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																	<xsl:with-param name="Representative" as="node()">
																		<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</RepresentativeType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var41_resultof_MappingST__RepresentativeToST__Representative">
																<com:Representative>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</com:Representative>
															</xsl:for-each>
														</xsl:for-each>
													</com:RepresentativeBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:StaffDetails">
													<com:StaffBag>
														<xsl:for-each select="ns0:Staff">
															<com:Staff>
																<xsl:for-each select="ns0:OfficialTitle">
																	<com:OfficialTitleText>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:OfficialTitleText>
																</xsl:for-each>
																<xsl:for-each select="ns0:StaffIdentifier">
																	<com:PartyIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
																<xsl:for-each select="ns0:StaffName">
																	<com:StaffName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:StaffName>
																</xsl:for-each>
															</com:Staff>
														</xsl:for-each>
													</com:StaffBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:Authorization">
													<com:Authorization>
														<xsl:for-each select="ns0:AuthorizationIdentifier">
															<com:AuthorizationIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:AuthorizationIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:AuthorizationDate">
															<com:AuthorizationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:AuthorizationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:AuthorizationKind">
															<xsl:variable name="var42_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf28_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var42_resultof_vmf___inputtoresult">
																<com:AuthorizationCategory>
																	<xsl:sequence select="."/>
																</com:AuthorizationCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:Comment">
															<com:CommentText>
																<xsl:for-each select="@languageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</com:CommentText>
														</xsl:for-each>
														<xsl:for-each select="ns0:AuthorizationDocumentSupply">
															<xsl:variable name="var43_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf29_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var43_resultof_vmf___inputtoresult">
																<com:AuthorizationDocumentSupplyCategory>
																	<xsl:sequence select="."/>
																</com:AuthorizationDocumentSupplyCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:AuthorizationDocument">
															<com:AuthorizationDocument>
																<xsl:for-each select="ns0:DocumentLanguageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentName">
																	<com:DocumentName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentName>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentFilename">
																	<com:FileName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:FileName>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentFileFormat">
																	<xsl:variable name="var44_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf22_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var44_resultof_vmf___inputtoresult">
																		<com:DocumentFormatCategory>
																			<xsl:sequence select="."/>
																		</com:DocumentFormatCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentDate">
																	<com:DocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:DocumentDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentMedia">
																	<xsl:variable name="var45_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf23_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var45_resultof_vmf___inputtoresult">
																		<com:DocumentMediaCategory>
																			<xsl:sequence select="."/>
																		</com:DocumentMediaCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentLocation">
																	<com:DocumentLocationURI>
																		<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																	</com:DocumentLocationURI>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentVersion">
																	<com:DocumentVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentVersion>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentSizeInByte">
																	<com:DocumentSizeQuantity>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</com:DocumentSizeQuantity>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
															</com:AuthorizationDocument>
														</xsl:for-each>
													</com:Authorization>
												</xsl:for-each>
												<xsl:for-each select="ns0:OppositionDetails">
													<tmk:OppositionBag>
														<xsl:for-each select="ns0:Opposition">
															<xsl:variable name="var46_resultof_MappingST__OppositionToST__Opposition" as="node()?">
																<xsl:call-template name="WIPO:MappingST66OppositionToST96Opposition">
																	<xsl:with-param name="Opposition" as="node()">
																		<OppositionType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</OppositionType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var46_resultof_MappingST__OppositionToST__Opposition">
																<tmk:Opposition>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</tmk:Opposition>
															</xsl:for-each>
														</xsl:for-each>
													</tmk:OppositionBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:MarkRecordDetails">
													<tmk:MarkRecordBag>
														<xsl:for-each select="ns0:MarkRecord">
															<tmk:MarkRecord>
																<xsl:for-each select="ns0:BasicRecord">
																	<tmk:BasicRecord>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:BasicRecordKind">
																			<xsl:variable name="var47_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf30_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var47_resultof_vmf___inputtoresult">
																				<tmk:BasicRecordCategory>
																					<xsl:sequence select="."/>
																				</tmk:BasicRecordCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordReference">
																			<com:RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordLanguageCode">
																			<com:RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var48_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var48_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var49_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var49_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var50_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var50_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var51_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var51_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<com:RecordEventCategory>
																							<xsl:sequence select="fn:string(ns0:RecordEventCode)"/>
																						</com:RecordEventCategory>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var52_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var52_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var53_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var53_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusCode">
																			<xsl:variable name="var54_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf31_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var54_resultof_vmf___inputtoresult">
																				<com:RecordCurrentStatusCategory>
																					<xsl:sequence select="."/>
																				</com:RecordCurrentStatusCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusDate">
																			<com:RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:FactDecisionText">
																			<tmk:ReasonDocument>
																				<tmk:FactDecisionText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</tmk:FactDecisionText>
																			</tmk:ReasonDocument>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordInterestedOfficeCode">
																			<com:RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDesignatedCountryDetails">
																			<com:RecordDesignatedCountryCodeBag>
																				<xsl:for-each select="ns0:RecordDesignatedCountryCode">
																					<com:RecordDesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:RecordDesignatedCountryCode>
																				</xsl:for-each>
																			</com:RecordDesignatedCountryCodeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordUseIntentDetails">
																			<tmk:RecordUseIntentBag>
																				<xsl:for-each select="ns0:RecordUseIntentCountryCode">
																					<tmk:RecordUseIntentCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</tmk:RecordUseIntentCountryCode>
																				</xsl:for-each>
																			</tmk:RecordUseIntentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
																			<tmk:GoodsServicesLimitationBag>
																				<xsl:for-each select="ns0:GoodsServicesLimitation">
																					<tmk:GoodsServicesLimitation>
																						<xsl:for-each select="ns0:LimitationCountryDetails">
																							<com:LimitationCountryCodeBag>
																								<xsl:for-each select="ns0:LimitationCountryCode">
																									<com:LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:LimitationCountryCode>
																								</xsl:for-each>
																							</com:LimitationCountryCodeBag>
																						</xsl:for-each>
																						<com:CommentTextBag>
																							<xsl:for-each select="ns0:Comment">
																								<com:CommentText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</com:CommentText>
																							</xsl:for-each>
																						</com:CommentTextBag>
																						<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																							<xsl:variable name="var55_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf32_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var55_resultof_vmf___inputtoresult">
																								<tmk:GoodsServicesLimitationCategory>
																									<xsl:sequence select="."/>
																								</tmk:GoodsServicesLimitationCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																							<tmk:LimitationClassDescriptionBag>
																								<xsl:for-each select="ns0:ClassDescription">
																									<tmk:ClassDescription>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumberStatusCode">
																											<xsl:variable name="var56_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf18_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var56_resultof_vmf___inputtoresult">
																												<tmk:ClassNumberStatusCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassNumberStatusCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:GoodsServicesDescription">
																											<tmk:GoodsServicesDescriptionText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@sequenceNumber">
																													<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:GoodsServicesDescriptionText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																											<tmk:UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</tmk:UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermDetails">
																											<tmk:ClassificationTermBag>
																												<xsl:for-each select="ns0:ClassificationTerm">
																													<tmk:ClassificationTerm>
																														<xsl:for-each select="@operationCode">
																															<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermIdentifier">
																															<tmk:ClassificationTermIdentifier>
																																<xsl:for-each select="@identifierKindCode">
																																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOffice">
																															<tmk:ClassificationTermOfficeCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																															<tmk:ClassificationTermOfficeIdentification>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeIdentification>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermSource">
																															<xsl:variable name="var57_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf19_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var57_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermSourceCategory>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermSourceCategory>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEntryDate">
																															<tmk:ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</tmk:ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassNumber">
																															<tmk:ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassNumber>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermText">
																															<tmk:ClassificationTermText>
																																<xsl:for-each select="@languageCode">
																																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermText>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																															<tmk:ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																															<tmk:ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																															<tmk:ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermStatus">
																															<xsl:variable name="var59_cur" as="node()" select="."/>
																															<xsl:variable name="var58_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf20_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var58_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermStatus>
																																	<xsl:for-each select="$var59_cur/@officeCode">
																																		<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:WIPOBasicNumber">
																															<tmk:WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:WIPOBasicNumber>
																														</xsl:for-each>
																													</tmk:ClassificationTerm>
																												</xsl:for-each>
																											</tmk:ClassificationTermBag>
																										</xsl:for-each>
																									</tmk:ClassDescription>
																								</xsl:for-each>
																							</tmk:LimitationClassDescriptionBag>
																						</xsl:for-each>
																					</tmk:GoodsServicesLimitation>
																				</xsl:for-each>
																			</tmk:GoodsServicesLimitationBag>
																		</xsl:for-each>
																	</tmk:BasicRecord>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordOppositionPeriod">
																	<tmk:RecordOppositionPeriod>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var60_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf33_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordOppositionPeriodKind)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var60_resultof_vmf___inputtoresult">
																			<tmk:RecordOppositionPeriodCategory>
																				<xsl:sequence select="."/>
																			</tmk:RecordOppositionPeriodCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var61_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var61_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordInterestedOfficeCode">
																			<com:RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordOppositionPeriodStartDate">
																			<tmk:RecordOppositionPeriodStartDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</tmk:RecordOppositionPeriodStartDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordOppositionPeriodEndDate">
																			<tmk:RecordOppositionPeriodEndDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</tmk:RecordOppositionPeriodEndDate>
																		</xsl:for-each>
																	</tmk:RecordOppositionPeriod>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordTransfer">
																	<tmk:RecordTransfer>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var62_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf34_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordTransferKind)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var62_resultof_vmf___inputtoresult">
																			<com:RecordTransferCategory>
																				<xsl:sequence select="."/>
																			</com:RecordTransferCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordReference">
																			<com:RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordLanguageCode">
																			<com:RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var63_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var63_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var64_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var64_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var65_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var65_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var66_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var66_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<xsl:variable name="var67_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf35_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var67_resultof_vmf___inputtoresult">
																							<com:RecordEventCategory>
																								<xsl:sequence select="."/>
																							</com:RecordEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var68_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var68_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var69_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var69_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusCode">
																			<xsl:variable name="var70_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf36_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var70_resultof_vmf___inputtoresult">
																				<com:RecordCurrentStatusCategory>
																					<xsl:sequence select="."/>
																				</com:RecordCurrentStatusCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusDate">
																			<com:RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:CorrespondenceAddress">
																			<com:CorrespondenceAddress>
																				<xsl:for-each select="ns0:CorrespondenceAddressParty">
																					<xsl:variable name="var71_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf37_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var71_resultof_vmf___inputtoresult">
																						<com:CorrespondenceAddressPartyCategory>
																							<xsl:sequence select="."/>
																						</com:CorrespondenceAddressPartyCategory>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:CorrespondenceAddressIdentifier">
																					<com:PartyIdentifier>
																						<xsl:for-each select="@identifierKindCode">
																							<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:PartyIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:CorrespondenceAddressBook">
																					<xsl:variable name="var72_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																							<xsl:with-param name="AddressBook" as="node()">
																								<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</AddressBookType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var72_resultof_MappingST__AddressBookToST__Contact">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:CorrespondenceAddress>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:HolderDetails">
																			<tmk:HolderChangeBag>
																				<xsl:for-each select="ns0:PreviousHolder">
																					<xsl:variable name="var73_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																							<xsl:with-param name="Applicant" as="node()">
																								<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var73_resultof_MappingST__ApplicantToST__Applicant">
																						<tmk:PreviousHolderBag>
																							<xsl:sequence select="()"/>
																						</tmk:PreviousHolderBag>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:NewHolder">
																					<xsl:variable name="var74_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																							<xsl:with-param name="Applicant" as="node()">
																								<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var74_resultof_MappingST__ApplicantToST__Applicant">
																						<tmk:HolderBag>
																							<xsl:sequence select="()"/>
																						</tmk:HolderBag>
																					</xsl:for-each>
																				</xsl:for-each>
																			</tmk:HolderChangeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
																			<tmk:GoodsServicesLimitationBag>
																				<xsl:for-each select="ns0:GoodsServicesLimitation">
																					<tmk:GoodsServicesLimitation>
																						<xsl:for-each select="ns0:LimitationCountryDetails">
																							<com:LimitationCountryCodeBag>
																								<xsl:for-each select="ns0:LimitationCountryCode">
																									<com:LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:LimitationCountryCode>
																								</xsl:for-each>
																							</com:LimitationCountryCodeBag>
																						</xsl:for-each>
																						<com:CommentTextBag>
																							<xsl:for-each select="ns0:Comment">
																								<com:CommentText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</com:CommentText>
																							</xsl:for-each>
																						</com:CommentTextBag>
																						<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																							<xsl:variable name="var75_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf32_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var75_resultof_vmf___inputtoresult">
																								<tmk:GoodsServicesLimitationCategory>
																									<xsl:sequence select="."/>
																								</tmk:GoodsServicesLimitationCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																							<tmk:LimitationClassDescriptionBag>
																								<xsl:for-each select="ns0:ClassDescription">
																									<tmk:ClassDescription>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumberStatusCode">
																											<xsl:variable name="var76_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf18_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var76_resultof_vmf___inputtoresult">
																												<tmk:ClassNumberStatusCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassNumberStatusCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:GoodsServicesDescription">
																											<tmk:GoodsServicesDescriptionText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@sequenceNumber">
																													<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:GoodsServicesDescriptionText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																											<tmk:UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</tmk:UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermDetails">
																											<tmk:ClassificationTermBag>
																												<xsl:for-each select="ns0:ClassificationTerm">
																													<tmk:ClassificationTerm>
																														<xsl:for-each select="@operationCode">
																															<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermIdentifier">
																															<tmk:ClassificationTermIdentifier>
																																<xsl:for-each select="@identifierKindCode">
																																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOffice">
																															<tmk:ClassificationTermOfficeCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																															<tmk:ClassificationTermOfficeIdentification>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeIdentification>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermSource">
																															<xsl:variable name="var77_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf19_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var77_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermSourceCategory>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermSourceCategory>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEntryDate">
																															<tmk:ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</tmk:ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassNumber">
																															<tmk:ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassNumber>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermText">
																															<tmk:ClassificationTermText>
																																<xsl:for-each select="@languageCode">
																																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermText>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																															<tmk:ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																															<tmk:ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																															<tmk:ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermStatus">
																															<xsl:variable name="var79_cur" as="node()" select="."/>
																															<xsl:variable name="var78_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf20_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var78_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermStatus>
																																	<xsl:for-each select="$var79_cur/@officeCode">
																																		<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:WIPOBasicNumber">
																															<tmk:WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:WIPOBasicNumber>
																														</xsl:for-each>
																													</tmk:ClassificationTerm>
																												</xsl:for-each>
																											</tmk:ClassificationTermBag>
																										</xsl:for-each>
																									</tmk:ClassDescription>
																								</xsl:for-each>
																							</tmk:LimitationClassDescriptionBag>
																						</xsl:for-each>
																					</tmk:GoodsServicesLimitation>
																				</xsl:for-each>
																			</tmk:GoodsServicesLimitationBag>
																		</xsl:for-each>
																	</tmk:RecordTransfer>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordChangeNameAddress">
																	<tmk:RecordChangeNameAddress>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var80_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf38_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordChangeNameAddressKind)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var80_resultof_vmf___inputtoresult">
																			<com:RecordChangeNameAddressCategory>
																				<xsl:sequence select="."/>
																			</com:RecordChangeNameAddressCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordReference">
																			<com:RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordLanguageCode">
																			<com:RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var81_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var81_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var82_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var82_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var83_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var83_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var84_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var84_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<xsl:variable name="var85_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf35_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var85_resultof_vmf___inputtoresult">
																							<com:RecordEventCategory>
																								<xsl:sequence select="."/>
																							</com:RecordEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var86_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var86_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var87_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var87_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusCode">
																			<xsl:variable name="var88_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf39_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var88_resultof_vmf___inputtoresult">
																				<com:RecordCurrentStatusCategory>
																					<xsl:sequence select="."/>
																				</com:RecordCurrentStatusCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusDate">
																			<com:RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:CorrespondenceAddress">
																			<com:CorrespondenceAddress>
																				<xsl:for-each select="ns0:CorrespondenceAddressParty">
																					<xsl:variable name="var89_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf37_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var89_resultof_vmf___inputtoresult">
																						<com:CorrespondenceAddressPartyCategory>
																							<xsl:sequence select="."/>
																						</com:CorrespondenceAddressPartyCategory>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:CorrespondenceAddressIdentifier">
																					<com:PartyIdentifier>
																						<xsl:for-each select="@identifierKindCode">
																							<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:PartyIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:CorrespondenceAddressBook">
																					<xsl:variable name="var90_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																							<xsl:with-param name="AddressBook" as="node()">
																								<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</AddressBookType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var90_resultof_MappingST__AddressBookToST__Contact">
																						<com:Contact>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Contact>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:CorrespondenceAddress>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:HolderDetails">
																			<tmk:HolderChangeBag>
																				<xsl:for-each select="ns0:PreviousHolder">
																					<xsl:variable name="var91_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																							<xsl:with-param name="Applicant" as="node()">
																								<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var91_resultof_MappingST__ApplicantToST__Applicant">
																						<tmk:PreviousHolderBag>
																							<xsl:sequence select="()"/>
																						</tmk:PreviousHolderBag>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:NewHolder">
																					<xsl:variable name="var92_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																							<xsl:with-param name="Applicant" as="node()">
																								<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var92_resultof_MappingST__ApplicantToST__Applicant">
																						<tmk:HolderBag>
																							<xsl:sequence select="()"/>
																						</tmk:HolderBag>
																					</xsl:for-each>
																				</xsl:for-each>
																			</tmk:HolderChangeBag>
																		</xsl:for-each>
																	</tmk:RecordChangeNameAddress>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordLicence">
																	<tmk:RecordLicence>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var93_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf40_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordLicenceKind)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var93_resultof_vmf___inputtoresult">
																			<com:RecordLicenceCategory>
																				<xsl:sequence select="."/>
																			</com:RecordLicenceCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordReference">
																			<com:RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordLanguageCode">
																			<com:RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var94_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var94_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var95_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var95_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var96_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var96_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var97_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var97_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<xsl:variable name="var98_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf35_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var98_resultof_vmf___inputtoresult">
																							<com:RecordEventCategory>
																								<xsl:sequence select="."/>
																							</com:RecordEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var99_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var99_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var100_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var100_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusCode">
																			<xsl:variable name="var101_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf41_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var101_resultof_vmf___inputtoresult">
																				<com:RecordCurrentStatusCategory>
																					<xsl:sequence select="."/>
																				</com:RecordCurrentStatusCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordCurrentStatusDate">
																			<com:RecordCurrentStatusDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordCurrentStatusDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordInterestedOfficeCode">
																			<com:RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDesignatedCountryDetails">
																			<com:RecordDesignatedCountryCodeBag>
																				<xsl:for-each select="ns0:RecordDesignatedCountryCode">
																					<com:RecordDesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:RecordDesignatedCountryCode>
																				</xsl:for-each>
																			</com:RecordDesignatedCountryCodeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceDetails">
																			<tmk:LicenceBag>
																				<xsl:for-each select="ns0:Licence">
																					<tmk:Licence>
																						<xsl:for-each select="ns0:LicenceIdentifier">
																							<com:LicenceIdentifier>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LicenceIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceDate">
																							<com:LicenceDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:LicenceDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceNumber">
																							<com:LicenceNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LicenceNumber>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceReference">
																							<com:LicenceReference>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LicenceReference>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceKind">
																							<xsl:variable name="var102_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf42_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var102_resultof_vmf___inputtoresult">
																								<com:LicenceCategory>
																									<xsl:sequence select="."/>
																								</com:LicenceCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:SubLicenceIndicator">
																							<com:SublicenceIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</com:SublicenceIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RelatedLicenceIdentifier">
																							<com:RelatedLicenceIdentifier>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:RelatedLicenceIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesLimitationIndicator">
																							<tmk:GoodsServicesLimitationIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</tmk:GoodsServicesLimitationIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesLimitation">
																							<tmk:GoodsServicesLimitation>
																								<xsl:for-each select="ns0:LimitationCountryDetails">
																									<com:LimitationCountryCodeBag>
																										<xsl:for-each select="ns0:LimitationCountryCode">
																											<com:LimitationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:LimitationCountryCode>
																										</xsl:for-each>
																									</com:LimitationCountryCodeBag>
																								</xsl:for-each>
																								<com:CommentTextBag>
																									<xsl:for-each select="ns0:Comment">
																										<com:CommentText>
																											<xsl:for-each select="@languageCode">
																												<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string(.)"/>
																										</com:CommentText>
																									</xsl:for-each>
																								</com:CommentTextBag>
																								<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																									<xsl:variable name="var103_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf32_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var103_resultof_vmf___inputtoresult">
																										<tmk:GoodsServicesLimitationCategory>
																											<xsl:sequence select="."/>
																										</tmk:GoodsServicesLimitationCategory>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																									<tmk:LimitationClassDescriptionBag>
																										<xsl:for-each select="ns0:ClassDescription">
																											<tmk:ClassDescription>
																												<xsl:for-each select="ns0:ClassNumber">
																													<tmk:ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassNumberStatusCode">
																													<xsl:variable name="var104_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf18_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var104_resultof_vmf___inputtoresult">
																														<tmk:ClassNumberStatusCategory>
																															<xsl:sequence select="."/>
																														</tmk:ClassNumberStatusCategory>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:GoodsServicesDescription">
																													<tmk:GoodsServicesDescriptionText>
																														<xsl:for-each select="@languageCode">
																															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="@sequenceNumber">
																															<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:GoodsServicesDescriptionText>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																													<tmk:UseNiceHeadingIndicator>
																														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																													</tmk:UseNiceHeadingIndicator>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermDetails">
																													<tmk:ClassificationTermBag>
																														<xsl:for-each select="ns0:ClassificationTerm">
																															<tmk:ClassificationTerm>
																																<xsl:for-each select="@operationCode">
																																	<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermIdentifier">
																																	<tmk:ClassificationTermIdentifier>
																																		<xsl:for-each select="@identifierKindCode">
																																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermIdentifier>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermOffice">
																																	<tmk:ClassificationTermOfficeCode>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermOfficeCode>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																																	<tmk:ClassificationTermOfficeIdentification>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermOfficeIdentification>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermSource">
																																	<xsl:variable name="var105_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf19_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var105_resultof_vmf___inputtoresult">
																																		<tmk:ClassificationTermSourceCategory>
																																			<xsl:sequence select="."/>
																																		</tmk:ClassificationTermSourceCategory>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermEntryDate">
																																	<tmk:ClassificationTermEntryDate>
																																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																																	</tmk:ClassificationTermEntryDate>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassNumber">
																																	<tmk:ClassNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassNumber>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermText">
																																	<tmk:ClassificationTermText>
																																		<xsl:for-each select="@languageCode">
																																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermText>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																																	<tmk:ClassificationTermEquivalentGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermEquivalentGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																																	<tmk:ClassificationTermReferenceGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermReferenceGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																																	<tmk:ClassificationTermTranslationGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermTranslationGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermStatus">
																																	<xsl:variable name="var107_cur" as="node()" select="."/>
																																	<xsl:variable name="var106_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf20_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var106_resultof_vmf___inputtoresult">
																																		<tmk:ClassificationTermStatus>
																																			<xsl:for-each select="$var107_cur/@officeCode">
																																				<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																			</xsl:for-each>
																																			<xsl:sequence select="."/>
																																		</tmk:ClassificationTermStatus>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:WIPOBasicNumber">
																																	<tmk:WIPOBasicNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:WIPOBasicNumber>
																																</xsl:for-each>
																															</tmk:ClassificationTerm>
																														</xsl:for-each>
																													</tmk:ClassificationTermBag>
																												</xsl:for-each>
																											</tmk:ClassDescription>
																										</xsl:for-each>
																									</tmk:LimitationClassDescriptionBag>
																								</xsl:for-each>
																							</tmk:GoodsServicesLimitation>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:TerritoryLimitationIndicator">
																							<com:TerritoryLimitationIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</com:TerritoryLimitationIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:TerritoryLimitationText">
																							<com:TerritoryLimitationText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:TerritoryLimitationText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PeriodLimitationIndicator">
																							<com:PeriodLimitationIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</com:PeriodLimitationIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PeriodLimitationText">
																							<com:PeriodLimitationText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PeriodLimitationText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PeriodLimitationStartDate">
																							<com:PeriodLimitationStartDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PeriodLimitationStartDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PeriodLimitationEndDate">
																							<com:PeriodLimitationEndDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PeriodLimitationEndDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceStatusCode">
																							<xsl:variable name="var108_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf43_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var108_resultof_vmf___inputtoresult">
																								<com:LicenceStatusCategory>
																									<xsl:sequence select="."/>
																								</com:LicenceStatusCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeDetails">
																							<tmk:LicenseeBag>
																								<xsl:for-each select="ns0:Licensee">
																									<tmk:Licensee>
																										<xsl:for-each select="@operationCode">
																											<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeSequenceNumber">
																											<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeLegalEntity">
																											<com:LegalEntityName>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:LegalEntityName>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeIdentifier">
																											<com:PartyIdentifier>
																												<xsl:for-each select="@identifierKindCode">
																													<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:PartyIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeAddressBook">
																											<xsl:variable name="var109_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var109_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeNationalityCode">
																											<com:NationalityCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:NationalityCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeIncorporationCountryCode">
																											<com:IncorporationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:IncorporationCountryCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeIncorporationState">
																											<com:IncorporationState>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:IncorporationState>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:Comment">
																											<com:CommentText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:CommentText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenseeEntitlement">
																											<tmk:Entitlement>
																												<xsl:for-each select="ns0:EntitlementNationalityCode">
																													<com:EntitlementNationalityCode>
																														<xsl:sequence select="fn:string(.)"/>
																													</com:EntitlementNationalityCode>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:EntitlementEstablishment">
																													<com:EntitlementEstablishment>
																														<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																															<com:EntitlementEstablishmentCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</com:EntitlementEstablishmentCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																															<xsl:variable name="var110_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																																<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																																	<xsl:with-param name="AddressBook" as="node()">
																																		<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																																			<xsl:sequence select="(./@node(), ./node())"/>
																																		</AddressBookType>
																																	</xsl:with-param>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var110_resultof_MappingST__AddressBookToST__Contact">
																																<com:Contact>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</com:Contact>
																															</xsl:for-each>
																														</xsl:for-each>
																													</com:EntitlementEstablishment>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:EntitlementDomiciled">
																													<com:EntitlementDomiciled>
																														<xsl:for-each select="ns0:EntitlementDomiciledCode">
																															<com:EntitlementDomiciledCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</com:EntitlementDomiciledCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																															<xsl:variable name="var111_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																																<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																																	<xsl:with-param name="AddressBook" as="node()">
																																		<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																																			<xsl:sequence select="(./@node(), ./node())"/>
																																		</AddressBookType>
																																	</xsl:with-param>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var111_resultof_MappingST__AddressBookToST__Contact">
																																<com:Contact>
																																	<xsl:sequence select="(./@node(), ./node())"/>
																																</com:Contact>
																															</xsl:for-each>
																														</xsl:for-each>
																													</com:EntitlementDomiciled>
																												</xsl:for-each>
																											</tmk:Entitlement>
																										</xsl:for-each>
																									</tmk:Licensee>
																								</xsl:for-each>
																							</tmk:LicenseeBag>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RepresentativeDetails">
																							<com:RepresentativeBag>
																								<xsl:for-each select="ns0:Representative">
																									<xsl:variable name="var112_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																										<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																											<xsl:with-param name="Representative" as="node()">
																												<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</RepresentativeType>
																											</xsl:with-param>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var112_resultof_MappingST__RepresentativeToST__Representative">
																										<com:Representative>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</com:Representative>
																									</xsl:for-each>
																								</xsl:for-each>
																							</com:RepresentativeBag>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceEventDetails">
																							<com:LicenceEventBag>
																								<xsl:for-each select="ns0:LicenceEvent">
																									<com:LicenceEvent>
																										<xsl:variable name="var113_resultof_vmf___inputtoresult" as="xs:string?">
																											<xsl:call-template name="vmf:vmf44_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(ns0:LicenceEventCode)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var113_resultof_vmf___inputtoresult">
																											<com:LicenceEventCategory>
																												<xsl:sequence select="."/>
																											</com:LicenceEventCategory>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenceEventResponseDate">
																											<com:LicenceEventResponseDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</com:LicenceEventResponseDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:Comment">
																											<com:CommentText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:CommentText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenceEventDate">
																											<com:LicenceEventDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</com:LicenceEventDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:LicenceEventDateTime">
																											<com:LicenceEventDateTime>
																												<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																											</com:LicenceEventDateTime>
																										</xsl:for-each>
																									</com:LicenceEvent>
																								</xsl:for-each>
																							</com:LicenceEventBag>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceDocumentDetails">
																							<com:LicenceDocumentBag>
																								<xsl:for-each select="ns0:LicenceDocument">
																									<com:LicenceDocument>
																										<xsl:for-each select="ns0:DocumentLanguageCode">
																											<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentName">
																											<com:DocumentName>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:DocumentName>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentFilename">
																											<com:FileName>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:FileName>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentFileFormat">
																											<xsl:variable name="var114_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf22_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var114_resultof_vmf___inputtoresult">
																												<com:DocumentFormatCategory>
																													<xsl:sequence select="."/>
																												</com:DocumentFormatCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentDate">
																											<com:DocumentDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</com:DocumentDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentMedia">
																											<xsl:variable name="var115_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf23_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var115_resultof_vmf___inputtoresult">
																												<com:DocumentMediaCategory>
																													<xsl:sequence select="."/>
																												</com:DocumentMediaCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentLocation">
																											<com:DocumentLocationURI>
																												<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																											</com:DocumentLocationURI>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentVersion">
																											<com:DocumentVersion>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:DocumentVersion>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:DocumentSizeInByte">
																											<com:DocumentSizeQuantity>
																												<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																											</com:DocumentSizeQuantity>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:Comment">
																											<com:CommentText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:CommentText>
																										</xsl:for-each>
																									</com:LicenceDocument>
																								</xsl:for-each>
																							</com:LicenceDocumentBag>
																						</xsl:for-each>
																					</tmk:Licence>
																				</xsl:for-each>
																			</tmk:LicenceBag>
																		</xsl:for-each>
																	</tmk:RecordLicence>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordNationalInternationalReplacement">
																	<tmk:RecordNationalInternationalReplacement>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TradeMarkKeyDetails">
																			<tmk:TrademarkIdentification>
																				<xsl:for-each select="ns0:TradeMarkKey">
																					<tmk:TrademarkIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<tmk:TrademarkIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:TrademarkIdentifier>
																						</xsl:for-each>
																					</tmk:TrademarkIdentifierBag>
																				</xsl:for-each>
																			</tmk:TrademarkIdentification>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var116_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var116_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var117_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var117_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var118_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var118_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var119_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var119_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<xsl:variable name="var120_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf35_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var120_resultof_vmf___inputtoresult">
																							<com:RecordEventCategory>
																								<xsl:sequence select="."/>
																							</com:RecordEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var121_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var121_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var122_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var122_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordInterestedOfficeCode">
																			<com:RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
																			<tmk:GoodsServicesLimitationBag>
																				<xsl:for-each select="ns0:GoodsServicesLimitation">
																					<tmk:GoodsServicesLimitation>
																						<xsl:for-each select="ns0:LimitationCountryDetails">
																							<com:LimitationCountryCodeBag>
																								<xsl:for-each select="ns0:LimitationCountryCode">
																									<com:LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:LimitationCountryCode>
																								</xsl:for-each>
																							</com:LimitationCountryCodeBag>
																						</xsl:for-each>
																						<com:CommentTextBag>
																							<xsl:for-each select="ns0:Comment">
																								<com:CommentText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</com:CommentText>
																							</xsl:for-each>
																						</com:CommentTextBag>
																						<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																							<xsl:variable name="var123_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf32_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var123_resultof_vmf___inputtoresult">
																								<tmk:GoodsServicesLimitationCategory>
																									<xsl:sequence select="."/>
																								</tmk:GoodsServicesLimitationCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																							<tmk:LimitationClassDescriptionBag>
																								<xsl:for-each select="ns0:ClassDescription">
																									<tmk:ClassDescription>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumberStatusCode">
																											<xsl:variable name="var124_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf18_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var124_resultof_vmf___inputtoresult">
																												<tmk:ClassNumberStatusCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassNumberStatusCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:GoodsServicesDescription">
																											<tmk:GoodsServicesDescriptionText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@sequenceNumber">
																													<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:GoodsServicesDescriptionText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																											<tmk:UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</tmk:UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermDetails">
																											<tmk:ClassificationTermBag>
																												<xsl:for-each select="ns0:ClassificationTerm">
																													<tmk:ClassificationTerm>
																														<xsl:for-each select="@operationCode">
																															<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermIdentifier">
																															<tmk:ClassificationTermIdentifier>
																																<xsl:for-each select="@identifierKindCode">
																																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOffice">
																															<tmk:ClassificationTermOfficeCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																															<tmk:ClassificationTermOfficeIdentification>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeIdentification>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermSource">
																															<xsl:variable name="var125_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf19_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var125_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermSourceCategory>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermSourceCategory>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEntryDate">
																															<tmk:ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</tmk:ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassNumber">
																															<tmk:ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassNumber>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermText">
																															<tmk:ClassificationTermText>
																																<xsl:for-each select="@languageCode">
																																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermText>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																															<tmk:ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																															<tmk:ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																															<tmk:ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermStatus">
																															<xsl:variable name="var127_cur" as="node()" select="."/>
																															<xsl:variable name="var126_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf20_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var126_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermStatus>
																																	<xsl:for-each select="$var127_cur/@officeCode">
																																		<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:WIPOBasicNumber">
																															<tmk:WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:WIPOBasicNumber>
																														</xsl:for-each>
																													</tmk:ClassificationTerm>
																												</xsl:for-each>
																											</tmk:ClassificationTermBag>
																										</xsl:for-each>
																									</tmk:ClassDescription>
																								</xsl:for-each>
																							</tmk:LimitationClassDescriptionBag>
																						</xsl:for-each>
																					</tmk:GoodsServicesLimitation>
																				</xsl:for-each>
																			</tmk:GoodsServicesLimitationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:NationalMarkDetails">
																			<tmk:NationalMarkBag>
																				<xsl:for-each select="ns0:NationalMark">
																					<tmk:NationalMark>
																						<tmk:NationalMarkRegistrationNumber>
																							<xsl:sequence select="fn:string(ns0:NationalMarkRegistrationNumber)"/>
																						</tmk:NationalMarkRegistrationNumber>
																						<xsl:for-each select="ns0:NationalMarkFilingDate">
																							<tmk:NationalMarkFilingDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</tmk:NationalMarkFilingDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:NationalMarkRegistrationDate">
																							<tmk:NationalMarkRegistrationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</tmk:NationalMarkRegistrationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:NationalMarkPriorityDate">
																							<tmk:NationalMarkPriorityDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</tmk:NationalMarkPriorityDate>
																						</xsl:for-each>
																					</tmk:NationalMark>
																				</xsl:for-each>
																			</tmk:NationalMarkBag>
																		</xsl:for-each>
																	</tmk:RecordNationalInternationalReplacement>
																</xsl:for-each>
																<xsl:for-each select="ns0:RecordShortNotation">
																	<tmk:RecordShortNotation>
																		<xsl:for-each select="ns0:RecordIdentifier">
																			<com:RecordIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFilingDate">
																			<com:RecordFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordNotificationDate">
																			<com:RecordNotificationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordNotificationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEffectiveDate">
																			<com:RecordEffectiveDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEffectiveDate>
																		</xsl:for-each>
																		<xsl:variable name="var128_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf45_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordShortNotationKind)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var128_resultof_vmf___inputtoresult">
																			<tmk:RecordShortNotationCategory>
																				<xsl:sequence select="."/>
																			</tmk:RecordShortNotationCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordReference">
																			<com:RecordReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordLanguageCode">
																			<com:RecordLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordPublicationDetails">
																			<tmk:RecordPublicationBag>
																				<xsl:for-each select="ns0:RecordPublication">
																					<tmk:RecordPublication>
																						<com:PublicationIdentifier>
																							<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																						</com:PublicationIdentifier>
																						<xsl:for-each select="ns0:PublicationSection">
																							<xsl:variable name="var129_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf27_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var129_resultof_vmf___inputtoresult">
																								<tmk:PublicationSectionCategory>
																									<xsl:sequence select="."/>
																								</tmk:PublicationSectionCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationSubsection">
																							<com:PublicationSubsection>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationSubsection>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationDate">
																							<com:PublicationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:PublicationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:PublicationPage">
																							<com:PublicationPage>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PublicationPage>
																						</xsl:for-each>
																					</tmk:RecordPublication>
																				</xsl:for-each>
																			</tmk:RecordPublicationBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantDetails">
																			<tmk:ClaimantBag>
																				<xsl:for-each select="ns0:ClaimantKey">
																					<com:PartyIdentifierBag>
																						<xsl:for-each select="ns0:Identifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																					</com:PartyIdentifierBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:Claimant">
																					<tmk:Claimant>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantAddressBook">
																							<xsl:variable name="var130_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var130_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClaimantEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var131_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var131_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<com:Contact>
																												<xsl:sequence select="()"/>
																											</com:Contact>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Claimant>
																				</xsl:for-each>
																			</tmk:ClaimantBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var132_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var132_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDetails">
																			<com:RecordEventBag>
																				<xsl:for-each select="ns0:RecordEvent">
																					<com:RecordEvent>
																						<xsl:variable name="var133_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf35_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var133_resultof_vmf___inputtoresult">
																							<com:RecordEventCategory>
																								<xsl:sequence select="."/>
																							</com:RecordEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventResponseDate">
																							<com:RecordEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDate">
																							<com:RecordEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RecordEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RecordEventDateTime">
																							<com:RecordEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:RecordEventDateTime>
																						</xsl:for-each>
																					</com:RecordEvent>
																				</xsl:for-each>
																			</com:RecordEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordDocumentDetails">
																			<com:RecordDocumentBag>
																				<xsl:for-each select="ns0:RecordDocument">
																					<com:RecordDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var134_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var134_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var135_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var135_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:RecordDocument>
																				</xsl:for-each>
																			</com:RecordDocumentBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordInterestedOfficeCode">
																			<com:RecordInterestedOfficeCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RecordInterestedOfficeCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordToRegistration">
																			<tmk:RecordToRegistration>
																				<xsl:for-each select="ns0:RegistrationIdentifier">
																					<tmk:RegistrationIdentifier>
																						<xsl:sequence select="fn:string(.)"/>
																					</tmk:RegistrationIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:RegistrationDate">
																					<com:RegistrationDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</com:RegistrationDate>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:MarkVerbalElementText">
																					<tmk:MarkVerbalElementText>
																						<xsl:for-each select="@languageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</tmk:MarkVerbalElementText>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:DesignatedCountryDetails">
																					<tmk:DesignatedCountryCodeBag>
																						<xsl:for-each select="ns0:DesignatedCountryCode">
																							<com:DesignatedCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DesignatedCountryCode>
																						</xsl:for-each>
																					</tmk:DesignatedCountryCodeBag>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:GoodsServicesLimitation">
																					<tmk:GoodsServicesLimitation>
																						<xsl:for-each select="ns0:LimitationCountryDetails">
																							<com:LimitationCountryCodeBag>
																								<xsl:for-each select="ns0:LimitationCountryCode">
																									<com:LimitationCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:LimitationCountryCode>
																								</xsl:for-each>
																							</com:LimitationCountryCodeBag>
																						</xsl:for-each>
																						<com:CommentTextBag>
																							<xsl:for-each select="ns0:Comment">
																								<com:CommentText>
																									<xsl:for-each select="@languageCode">
																										<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</com:CommentText>
																							</xsl:for-each>
																						</com:CommentTextBag>
																						<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																							<xsl:variable name="var136_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf32_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var136_resultof_vmf___inputtoresult">
																								<tmk:GoodsServicesLimitationCategory>
																									<xsl:sequence select="."/>
																								</tmk:GoodsServicesLimitationCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																							<tmk:LimitationClassDescriptionBag>
																								<xsl:for-each select="ns0:ClassDescription">
																									<tmk:ClassDescription>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumberStatusCode">
																											<xsl:variable name="var137_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf18_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var137_resultof_vmf___inputtoresult">
																												<tmk:ClassNumberStatusCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassNumberStatusCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:GoodsServicesDescription">
																											<tmk:GoodsServicesDescriptionText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="@sequenceNumber">
																													<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:GoodsServicesDescriptionText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																											<tmk:UseNiceHeadingIndicator>
																												<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																											</tmk:UseNiceHeadingIndicator>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermDetails">
																											<tmk:ClassificationTermBag>
																												<xsl:for-each select="ns0:ClassificationTerm">
																													<tmk:ClassificationTerm>
																														<xsl:for-each select="@operationCode">
																															<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermIdentifier">
																															<tmk:ClassificationTermIdentifier>
																																<xsl:for-each select="@identifierKindCode">
																																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermIdentifier>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOffice">
																															<tmk:ClassificationTermOfficeCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeCode>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																															<tmk:ClassificationTermOfficeIdentification>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermOfficeIdentification>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermSource">
																															<xsl:variable name="var138_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf19_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var138_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermSourceCategory>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermSourceCategory>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEntryDate">
																															<tmk:ClassificationTermEntryDate>
																																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																															</tmk:ClassificationTermEntryDate>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassNumber">
																															<tmk:ClassNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassNumber>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermText">
																															<tmk:ClassificationTermText>
																																<xsl:for-each select="@languageCode">
																																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermText>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																															<tmk:ClassificationTermEquivalentGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermEquivalentGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																															<tmk:ClassificationTermReferenceGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermReferenceGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																															<tmk:ClassificationTermTranslationGroup>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:ClassificationTermTranslationGroup>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:ClassificationTermStatus">
																															<xsl:variable name="var140_cur" as="node()" select="."/>
																															<xsl:variable name="var139_resultof_vmf___inputtoresult" as="xs:string?">
																																<xsl:call-template name="vmf:vmf20_inputtoresult">
																																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																</xsl:call-template>
																															</xsl:variable>
																															<xsl:for-each select="$var139_resultof_vmf___inputtoresult">
																																<tmk:ClassificationTermStatus>
																																	<xsl:for-each select="$var140_cur/@officeCode">
																																		<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																	</xsl:for-each>
																																	<xsl:sequence select="."/>
																																</tmk:ClassificationTermStatus>
																															</xsl:for-each>
																														</xsl:for-each>
																														<xsl:for-each select="ns0:WIPOBasicNumber">
																															<tmk:WIPOBasicNumber>
																																<xsl:sequence select="fn:string(.)"/>
																															</tmk:WIPOBasicNumber>
																														</xsl:for-each>
																													</tmk:ClassificationTerm>
																												</xsl:for-each>
																											</tmk:ClassificationTermBag>
																										</xsl:for-each>
																									</tmk:ClassDescription>
																								</xsl:for-each>
																							</tmk:LimitationClassDescriptionBag>
																						</xsl:for-each>
																					</tmk:GoodsServicesLimitation>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:ApplicantDetails">
																					<tmk:ApplicantBag>
																						<xsl:for-each select="ns0:Applicant">
																							<xsl:variable name="var141_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																									<xsl:with-param name="Applicant" as="node()">
																										<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</ApplicantType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var141_resultof_MappingST__ApplicantToST__Applicant">
																								<tmk:Applicant>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</tmk:Applicant>
																							</xsl:for-each>
																						</xsl:for-each>
																					</tmk:ApplicantBag>
																				</xsl:for-each>
																			</tmk:RecordToRegistration>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordFromRegistrationDetails">
																			<tmk:RecordFromRegistrationBag>
																				<xsl:for-each select="ns0:RecordFromRegistration">
																					<tmk:RecordFromRegistration>
																						<xsl:for-each select="ns0:RegistrationIdentifier">
																							<tmk:RegistrationIdentifier>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:RegistrationIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:RegistrationDate">
																							<com:RegistrationDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:RegistrationDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:MarkVerbalElementText">
																							<tmk:MarkVerbalElementText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:MarkVerbalElementText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DesignatedCountryDetails">
																							<tmk:DesignatedCountryCodeBag>
																								<xsl:for-each select="ns0:DesignatedCountryCode">
																									<com:DesignatedCountryCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:DesignatedCountryCode>
																								</xsl:for-each>
																							</tmk:DesignatedCountryCodeBag>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesLimitation">
																							<tmk:GoodsServicesLimitation>
																								<xsl:for-each select="ns0:LimitationCountryDetails">
																									<com:LimitationCountryCodeBag>
																										<xsl:for-each select="ns0:LimitationCountryCode">
																											<com:LimitationCountryCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:LimitationCountryCode>
																										</xsl:for-each>
																									</com:LimitationCountryCodeBag>
																								</xsl:for-each>
																								<com:CommentTextBag>
																									<xsl:for-each select="ns0:Comment">
																										<com:CommentText>
																											<xsl:for-each select="@languageCode">
																												<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string(.)"/>
																										</com:CommentText>
																									</xsl:for-each>
																								</com:CommentTextBag>
																								<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																									<xsl:variable name="var142_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf32_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var142_resultof_vmf___inputtoresult">
																										<tmk:GoodsServicesLimitationCategory>
																											<xsl:sequence select="."/>
																										</tmk:GoodsServicesLimitationCategory>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																									<tmk:LimitationClassDescriptionBag>
																										<xsl:for-each select="ns0:ClassDescription">
																											<tmk:ClassDescription>
																												<xsl:for-each select="ns0:ClassNumber">
																													<tmk:ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassNumberStatusCode">
																													<xsl:variable name="var143_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf18_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var143_resultof_vmf___inputtoresult">
																														<tmk:ClassNumberStatusCategory>
																															<xsl:sequence select="."/>
																														</tmk:ClassNumberStatusCategory>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:GoodsServicesDescription">
																													<tmk:GoodsServicesDescriptionText>
																														<xsl:for-each select="@languageCode">
																															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:for-each select="@sequenceNumber">
																															<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:GoodsServicesDescriptionText>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																													<tmk:UseNiceHeadingIndicator>
																														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																													</tmk:UseNiceHeadingIndicator>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermDetails">
																													<tmk:ClassificationTermBag>
																														<xsl:for-each select="ns0:ClassificationTerm">
																															<tmk:ClassificationTerm>
																																<xsl:for-each select="@operationCode">
																																	<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermIdentifier">
																																	<tmk:ClassificationTermIdentifier>
																																		<xsl:for-each select="@identifierKindCode">
																																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermIdentifier>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermOffice">
																																	<tmk:ClassificationTermOfficeCode>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermOfficeCode>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																																	<tmk:ClassificationTermOfficeIdentification>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermOfficeIdentification>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermSource">
																																	<xsl:variable name="var144_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf19_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var144_resultof_vmf___inputtoresult">
																																		<tmk:ClassificationTermSourceCategory>
																																			<xsl:sequence select="."/>
																																		</tmk:ClassificationTermSourceCategory>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermEntryDate">
																																	<tmk:ClassificationTermEntryDate>
																																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																																	</tmk:ClassificationTermEntryDate>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassNumber">
																																	<tmk:ClassNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassNumber>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermText">
																																	<tmk:ClassificationTermText>
																																		<xsl:for-each select="@languageCode">
																																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermText>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																																	<tmk:ClassificationTermEquivalentGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermEquivalentGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																																	<tmk:ClassificationTermReferenceGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermReferenceGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																																	<tmk:ClassificationTermTranslationGroup>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:ClassificationTermTranslationGroup>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:ClassificationTermStatus">
																																	<xsl:variable name="var146_cur" as="node()" select="."/>
																																	<xsl:variable name="var145_resultof_vmf___inputtoresult" as="xs:string?">
																																		<xsl:call-template name="vmf:vmf20_inputtoresult">
																																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																																		</xsl:call-template>
																																	</xsl:variable>
																																	<xsl:for-each select="$var145_resultof_vmf___inputtoresult">
																																		<tmk:ClassificationTermStatus>
																																			<xsl:for-each select="$var146_cur/@officeCode">
																																				<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																																			</xsl:for-each>
																																			<xsl:sequence select="."/>
																																		</tmk:ClassificationTermStatus>
																																	</xsl:for-each>
																																</xsl:for-each>
																																<xsl:for-each select="ns0:WIPOBasicNumber">
																																	<tmk:WIPOBasicNumber>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</tmk:WIPOBasicNumber>
																																</xsl:for-each>
																															</tmk:ClassificationTerm>
																														</xsl:for-each>
																													</tmk:ClassificationTermBag>
																												</xsl:for-each>
																											</tmk:ClassDescription>
																										</xsl:for-each>
																									</tmk:LimitationClassDescriptionBag>
																								</xsl:for-each>
																							</tmk:GoodsServicesLimitation>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ApplicantDetails">
																							<tmk:ApplicantBag>
																								<xsl:for-each select="ns0:Applicant">
																									<xsl:variable name="var147_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																										<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																											<xsl:with-param name="Applicant" as="node()">
																												<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</ApplicantType>
																											</xsl:with-param>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var147_resultof_MappingST__ApplicantToST__Applicant">
																										<tmk:Applicant>
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</tmk:Applicant>
																									</xsl:for-each>
																								</xsl:for-each>
																							</tmk:ApplicantBag>
																						</xsl:for-each>
																					</tmk:RecordFromRegistration>
																				</xsl:for-each>
																			</tmk:RecordFromRegistrationBag>
																		</xsl:for-each>
																	</tmk:RecordShortNotation>
																</xsl:for-each>
															</tmk:MarkRecord>
														</xsl:for-each>
													</tmk:MarkRecordBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:MarkEventDetails">
													<tmk:MarkEventBag>
														<xsl:for-each select="ns0:MarkEvent">
															<tmk:MarkEvent>
																<xsl:variable name="var148_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf46_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(ns0:MarkEventCode)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var148_resultof_vmf___inputtoresult">
																	<tmk:MarkEventCategory>
																		<xsl:sequence select="."/>
																	</tmk:MarkEventCategory>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkEventResponseDate">
																	<tmk:MarkEventResponseDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:MarkEventResponseDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkEventDate">
																	<tmk:MarkEventDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</tmk:MarkEventDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkEventDateTime">
																	<tmk:MarkEventDateTime>
																		<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																	</tmk:MarkEventDateTime>
																</xsl:for-each>
															</tmk:MarkEvent>
														</xsl:for-each>
													</tmk:MarkEventBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:TradeMarkDocumentDetails">
													<tmk:TrademarkDocumentBag>
														<xsl:for-each select="ns0:TradeMarkDocument">
															<tmk:TrademarkDocument>
																<xsl:for-each select="ns0:DocumentLanguageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentName">
																	<com:DocumentName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentName>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentFilename">
																	<com:FileName>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:FileName>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentFileFormat">
																	<com:DocumentFormatCategory>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentFormatCategory>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentDate">
																	<com:DocumentDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:DocumentDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentMedia">
																	<com:DocumentMediaCategory>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentMediaCategory>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentLocation">
																	<com:DocumentLocationURI>
																		<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																	</com:DocumentLocationURI>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentVersion">
																	<com:DocumentVersion>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:DocumentVersion>
																</xsl:for-each>
																<xsl:for-each select="ns0:DocumentSizeInByte">
																	<com:DocumentSizeQuantity>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</com:DocumentSizeQuantity>
																</xsl:for-each>
																<xsl:for-each select="ns0:Comment">
																	<com:CommentText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="@sequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:CommentText>
																</xsl:for-each>
															</tmk:TrademarkDocument>
														</xsl:for-each>
													</tmk:TrademarkDocumentBag>
												</xsl:for-each>
												<xsl:for-each select="ns0:TradeMarkVersion">
													<com:Version>
														<xsl:for-each select="ns0:Comment">
															<com:CommentText>
																<xsl:for-each select="@languageCode">
																	<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</com:CommentText>
														</xsl:for-each>
														<xsl:for-each select="ns0:VersionNumber">
															<com:VersionNumber>
																<xsl:sequence select="fn:string(.)"/>
															</com:VersionNumber>
														</xsl:for-each>
														<xsl:for-each select="ns0:VersionDate">
															<com:VersionDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:VersionDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:VersionDateTime">
															<com:VersionDateTime>
																<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
															</com:VersionDateTime>
														</xsl:for-each>
													</com:Version>
												</xsl:for-each>
												<xsl:for-each select="ns0:CorrespondenceAddress">
													<com:CorrespondenceAddress>
														<xsl:for-each select="ns0:CorrespondenceAddressParty">
															<xsl:variable name="var149_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf37_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var149_resultof_vmf___inputtoresult">
																<com:CorrespondenceAddressPartyCategory>
																	<xsl:sequence select="."/>
																</com:CorrespondenceAddressPartyCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:CorrespondenceAddressIdentifier">
															<com:PartyIdentifier>
																<xsl:for-each select="@identifierKindCode">
																	<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:sequence select="fn:string(.)"/>
															</com:PartyIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:CorrespondenceAddressBook">
															<xsl:variable name="var150_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																	<xsl:with-param name="AddressBook" as="node()">
																		<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</AddressBookType>
																	</xsl:with-param>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var150_resultof_MappingST__AddressBookToST__Contact">
																<com:Contact>
																	<xsl:sequence select="(./@node(), ./node())"/>
																</com:Contact>
															</xsl:for-each>
														</xsl:for-each>
													</com:CorrespondenceAddress>
												</xsl:for-each>
											</tmk:Trademark>
										</xsl:for-each>
									</tmk:TrademarkBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:ApplicantDetails">
									<tmk:ApplicantBag>
										<xsl:for-each select="ns0:Applicant">
											<tmk:Applicant>
												<xsl:sequence select="()"/>
											</tmk:Applicant>
										</xsl:for-each>
									</tmk:ApplicantBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:RepresentativeDetails">
									<com:RepresentativeBag>
										<xsl:for-each select="ns0:Representative">
											<com:Representative>
												<xsl:sequence select="()"/>
											</com:Representative>
										</xsl:for-each>
									</com:RepresentativeBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:MarkRecordDetails">
									<tmk:MarkRecordBag>
										<xsl:for-each select="ns0:MarkRecord">
											<tmk:MarkRecord>
												<xsl:for-each select="ns0:BasicRecord">
													<tmk:BasicRecord>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:BasicRecordKind">
															<xsl:variable name="var152_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf30_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var152_resultof_vmf___inputtoresult">
																<tmk:BasicRecordCategory>
																	<xsl:sequence select="."/>
																</tmk:BasicRecordCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var153_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var153_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var154_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var154_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var155_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var155_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var156_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var156_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<com:RecordEventCategory>
																			<xsl:sequence select="fn:string(ns0:RecordEventCode)"/>
																		</com:RecordEventCategory>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var157_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var157_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var158_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var158_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusCode">
															<xsl:variable name="var159_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf31_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var159_resultof_vmf___inputtoresult">
																<com:RecordCurrentStatusCategory>
																	<xsl:sequence select="."/>
																</com:RecordCurrentStatusCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:FactDecisionText">
															<tmk:ReasonDocument>
																<tmk:FactDecisionText>
																	<xsl:for-each select="@languageCode">
																		<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</tmk:FactDecisionText>
															</tmk:ReasonDocument>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDesignatedCountryDetails">
															<com:RecordDesignatedCountryCodeBag>
																<xsl:for-each select="ns0:RecordDesignatedCountryCode">
																	<com:RecordDesignatedCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:RecordDesignatedCountryCode>
																</xsl:for-each>
															</com:RecordDesignatedCountryCodeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordUseIntentDetails">
															<tmk:RecordUseIntentBag>
																<xsl:for-each select="ns0:RecordUseIntentCountryCode">
																	<tmk:RecordUseIntentCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:RecordUseIntentCountryCode>
																</xsl:for-each>
															</tmk:RecordUseIntentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
															<tmk:GoodsServicesLimitationBag>
																<xsl:for-each select="ns0:GoodsServicesLimitation">
																	<tmk:GoodsServicesLimitation>
																		<xsl:for-each select="ns0:LimitationCountryDetails">
																			<com:LimitationCountryCodeBag>
																				<xsl:for-each select="ns0:LimitationCountryCode">
																					<com:LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:LimitationCountryCode>
																				</xsl:for-each>
																			</com:LimitationCountryCodeBag>
																		</xsl:for-each>
																		<com:CommentTextBag>
																			<xsl:for-each select="ns0:Comment">
																				<com:CommentText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</com:CommentText>
																			</xsl:for-each>
																		</com:CommentTextBag>
																		<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																			<xsl:variable name="var160_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf32_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var160_resultof_vmf___inputtoresult">
																				<tmk:GoodsServicesLimitationCategory>
																					<xsl:sequence select="."/>
																				</tmk:GoodsServicesLimitationCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																			<tmk:LimitationClassDescriptionBag>
																				<xsl:for-each select="ns0:ClassDescription">
																					<tmk:ClassDescription>
																						<xsl:for-each select="ns0:ClassNumber">
																							<tmk:ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassNumberStatusCode">
																							<xsl:variable name="var161_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf18_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var161_resultof_vmf___inputtoresult">
																								<tmk:ClassNumberStatusCategory>
																									<xsl:sequence select="."/>
																								</tmk:ClassNumberStatusCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesDescription">
																							<tmk:GoodsServicesDescriptionText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@sequenceNumber">
																									<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:GoodsServicesDescriptionText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																							<tmk:UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</tmk:UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassificationTermDetails">
																							<tmk:ClassificationTermBag>
																								<xsl:for-each select="ns0:ClassificationTerm">
																									<tmk:ClassificationTerm>
																										<xsl:for-each select="@operationCode">
																											<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermIdentifier">
																											<tmk:ClassificationTermIdentifier>
																												<xsl:for-each select="@identifierKindCode">
																													<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOffice">
																											<tmk:ClassificationTermOfficeCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																											<tmk:ClassificationTermOfficeIdentification>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeIdentification>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermSource">
																											<xsl:variable name="var162_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf19_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var162_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermSourceCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermSourceCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEntryDate">
																											<tmk:ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</tmk:ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermText">
																											<tmk:ClassificationTermText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																											<tmk:ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																											<tmk:ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																											<tmk:ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermStatus">
																											<xsl:variable name="var164_cur" as="node()" select="."/>
																											<xsl:variable name="var163_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf20_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var163_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermStatus>
																													<xsl:for-each select="$var164_cur/@officeCode">
																														<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:WIPOBasicNumber">
																											<tmk:WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:WIPOBasicNumber>
																										</xsl:for-each>
																									</tmk:ClassificationTerm>
																								</xsl:for-each>
																							</tmk:ClassificationTermBag>
																						</xsl:for-each>
																					</tmk:ClassDescription>
																				</xsl:for-each>
																			</tmk:LimitationClassDescriptionBag>
																		</xsl:for-each>
																	</tmk:GoodsServicesLimitation>
																</xsl:for-each>
															</tmk:GoodsServicesLimitationBag>
														</xsl:for-each>
													</tmk:BasicRecord>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordOppositionPeriod">
													<tmk:RecordOppositionPeriod>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var165_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf33_inputtoresult">
																<xsl:with-param name="input" select="fn:string(ns0:RecordOppositionPeriodKind)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var165_resultof_vmf___inputtoresult">
															<tmk:RecordOppositionPeriodCategory>
																<xsl:sequence select="."/>
															</tmk:RecordOppositionPeriodCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var166_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var166_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordOppositionPeriodStartDate">
															<tmk:RecordOppositionPeriodStartDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</tmk:RecordOppositionPeriodStartDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordOppositionPeriodEndDate">
															<tmk:RecordOppositionPeriodEndDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</tmk:RecordOppositionPeriodEndDate>
														</xsl:for-each>
													</tmk:RecordOppositionPeriod>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordTransfer">
													<tmk:RecordTransfer>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var167_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf34_inputtoresult">
																<xsl:with-param name="input" select="fn:string(ns0:RecordTransferKind)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var167_resultof_vmf___inputtoresult">
															<com:RecordTransferCategory>
																<xsl:sequence select="."/>
															</com:RecordTransferCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var168_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var168_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var169_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var169_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var170_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var170_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var171_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var171_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<xsl:variable name="var172_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf35_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var172_resultof_vmf___inputtoresult">
																			<com:RecordEventCategory>
																				<xsl:sequence select="."/>
																			</com:RecordEventCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var173_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var173_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var174_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var174_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusCode">
															<xsl:variable name="var175_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf36_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var175_resultof_vmf___inputtoresult">
																<com:RecordCurrentStatusCategory>
																	<xsl:sequence select="."/>
																</com:RecordCurrentStatusCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:CorrespondenceAddress">
															<com:CorrespondenceAddress>
																<xsl:for-each select="ns0:CorrespondenceAddressParty">
																	<xsl:variable name="var176_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf37_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var176_resultof_vmf___inputtoresult">
																		<com:CorrespondenceAddressPartyCategory>
																			<xsl:sequence select="."/>
																		</com:CorrespondenceAddressPartyCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:CorrespondenceAddressIdentifier">
																	<com:PartyIdentifier>
																		<xsl:for-each select="@identifierKindCode">
																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
																<xsl:for-each select="ns0:CorrespondenceAddressBook">
																	<xsl:variable name="var177_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																			<xsl:with-param name="AddressBook" as="node()">
																				<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</AddressBookType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var177_resultof_MappingST__AddressBookToST__Contact">
																		<com:Contact>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Contact>
																	</xsl:for-each>
																</xsl:for-each>
															</com:CorrespondenceAddress>
														</xsl:for-each>
														<xsl:for-each select="ns0:HolderDetails">
															<tmk:HolderChangeBag>
																<xsl:for-each select="ns0:PreviousHolder">
																	<xsl:variable name="var178_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																			<xsl:with-param name="Applicant" as="node()">
																				<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var178_resultof_MappingST__ApplicantToST__Applicant">
																		<tmk:PreviousHolderBag>
																			<xsl:sequence select="()"/>
																		</tmk:PreviousHolderBag>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:NewHolder">
																	<xsl:variable name="var179_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																			<xsl:with-param name="Applicant" as="node()">
																				<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var179_resultof_MappingST__ApplicantToST__Applicant">
																		<tmk:HolderBag>
																			<xsl:sequence select="()"/>
																		</tmk:HolderBag>
																	</xsl:for-each>
																</xsl:for-each>
															</tmk:HolderChangeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
															<tmk:GoodsServicesLimitationBag>
																<xsl:for-each select="ns0:GoodsServicesLimitation">
																	<tmk:GoodsServicesLimitation>
																		<xsl:for-each select="ns0:LimitationCountryDetails">
																			<com:LimitationCountryCodeBag>
																				<xsl:for-each select="ns0:LimitationCountryCode">
																					<com:LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:LimitationCountryCode>
																				</xsl:for-each>
																			</com:LimitationCountryCodeBag>
																		</xsl:for-each>
																		<com:CommentTextBag>
																			<xsl:for-each select="ns0:Comment">
																				<com:CommentText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</com:CommentText>
																			</xsl:for-each>
																		</com:CommentTextBag>
																		<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																			<xsl:variable name="var180_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf32_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var180_resultof_vmf___inputtoresult">
																				<tmk:GoodsServicesLimitationCategory>
																					<xsl:sequence select="."/>
																				</tmk:GoodsServicesLimitationCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																			<tmk:LimitationClassDescriptionBag>
																				<xsl:for-each select="ns0:ClassDescription">
																					<tmk:ClassDescription>
																						<xsl:for-each select="ns0:ClassNumber">
																							<tmk:ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassNumberStatusCode">
																							<xsl:variable name="var181_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf18_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var181_resultof_vmf___inputtoresult">
																								<tmk:ClassNumberStatusCategory>
																									<xsl:sequence select="."/>
																								</tmk:ClassNumberStatusCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesDescription">
																							<tmk:GoodsServicesDescriptionText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@sequenceNumber">
																									<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:GoodsServicesDescriptionText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																							<tmk:UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</tmk:UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassificationTermDetails">
																							<tmk:ClassificationTermBag>
																								<xsl:for-each select="ns0:ClassificationTerm">
																									<tmk:ClassificationTerm>
																										<xsl:for-each select="@operationCode">
																											<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermIdentifier">
																											<tmk:ClassificationTermIdentifier>
																												<xsl:for-each select="@identifierKindCode">
																													<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOffice">
																											<tmk:ClassificationTermOfficeCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																											<tmk:ClassificationTermOfficeIdentification>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeIdentification>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermSource">
																											<xsl:variable name="var182_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf19_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var182_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermSourceCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermSourceCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEntryDate">
																											<tmk:ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</tmk:ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermText">
																											<tmk:ClassificationTermText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																											<tmk:ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																											<tmk:ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																											<tmk:ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermStatus">
																											<xsl:variable name="var184_cur" as="node()" select="."/>
																											<xsl:variable name="var183_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf20_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var183_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermStatus>
																													<xsl:for-each select="$var184_cur/@officeCode">
																														<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:WIPOBasicNumber">
																											<tmk:WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:WIPOBasicNumber>
																										</xsl:for-each>
																									</tmk:ClassificationTerm>
																								</xsl:for-each>
																							</tmk:ClassificationTermBag>
																						</xsl:for-each>
																					</tmk:ClassDescription>
																				</xsl:for-each>
																			</tmk:LimitationClassDescriptionBag>
																		</xsl:for-each>
																	</tmk:GoodsServicesLimitation>
																</xsl:for-each>
															</tmk:GoodsServicesLimitationBag>
														</xsl:for-each>
													</tmk:RecordTransfer>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordChangeNameAddress">
													<tmk:RecordChangeNameAddress>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var185_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf38_inputtoresult">
																<xsl:with-param name="input" select="fn:string(ns0:RecordChangeNameAddressKind)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var185_resultof_vmf___inputtoresult">
															<com:RecordChangeNameAddressCategory>
																<xsl:sequence select="."/>
															</com:RecordChangeNameAddressCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var186_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var186_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var187_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var187_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var188_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var188_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var189_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var189_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<xsl:variable name="var190_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf35_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var190_resultof_vmf___inputtoresult">
																			<com:RecordEventCategory>
																				<xsl:sequence select="."/>
																			</com:RecordEventCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var191_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var191_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var192_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var192_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusCode">
															<xsl:variable name="var193_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf39_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var193_resultof_vmf___inputtoresult">
																<com:RecordCurrentStatusCategory>
																	<xsl:sequence select="."/>
																</com:RecordCurrentStatusCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:CorrespondenceAddress">
															<com:CorrespondenceAddress>
																<xsl:for-each select="ns0:CorrespondenceAddressParty">
																	<xsl:variable name="var194_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf37_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var194_resultof_vmf___inputtoresult">
																		<com:CorrespondenceAddressPartyCategory>
																			<xsl:sequence select="."/>
																		</com:CorrespondenceAddressPartyCategory>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:CorrespondenceAddressIdentifier">
																	<com:PartyIdentifier>
																		<xsl:for-each select="@identifierKindCode">
																			<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:PartyIdentifier>
																</xsl:for-each>
																<xsl:for-each select="ns0:CorrespondenceAddressBook">
																	<xsl:variable name="var195_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																			<xsl:with-param name="AddressBook" as="node()">
																				<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</AddressBookType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var195_resultof_MappingST__AddressBookToST__Contact">
																		<com:Contact>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Contact>
																	</xsl:for-each>
																</xsl:for-each>
															</com:CorrespondenceAddress>
														</xsl:for-each>
														<xsl:for-each select="ns0:HolderDetails">
															<tmk:HolderChangeBag>
																<xsl:for-each select="ns0:PreviousHolder">
																	<xsl:variable name="var196_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																			<xsl:with-param name="Applicant" as="node()">
																				<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var196_resultof_MappingST__ApplicantToST__Applicant">
																		<tmk:PreviousHolderBag>
																			<xsl:sequence select="()"/>
																		</tmk:PreviousHolderBag>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="ns0:NewHolder">
																	<xsl:variable name="var197_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																			<xsl:with-param name="Applicant" as="node()">
																				<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</ApplicantType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var197_resultof_MappingST__ApplicantToST__Applicant">
																		<tmk:HolderBag>
																			<xsl:sequence select="()"/>
																		</tmk:HolderBag>
																	</xsl:for-each>
																</xsl:for-each>
															</tmk:HolderChangeBag>
														</xsl:for-each>
													</tmk:RecordChangeNameAddress>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordLicence">
													<tmk:RecordLicence>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var198_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf40_inputtoresult">
																<xsl:with-param name="input" select="fn:string(ns0:RecordLicenceKind)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var198_resultof_vmf___inputtoresult">
															<com:RecordLicenceCategory>
																<xsl:sequence select="."/>
															</com:RecordLicenceCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var199_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var199_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var200_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var200_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var201_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var201_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var202_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var202_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<xsl:variable name="var203_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf35_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var203_resultof_vmf___inputtoresult">
																			<com:RecordEventCategory>
																				<xsl:sequence select="."/>
																			</com:RecordEventCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var204_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var204_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var205_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var205_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusCode">
															<xsl:variable name="var206_resultof_vmf___inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf41_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var206_resultof_vmf___inputtoresult">
																<com:RecordCurrentStatusCategory>
																	<xsl:sequence select="."/>
																</com:RecordCurrentStatusCategory>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordCurrentStatusDate">
															<com:RecordCurrentStatusDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordCurrentStatusDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDesignatedCountryDetails">
															<com:RecordDesignatedCountryCodeBag>
																<xsl:for-each select="ns0:RecordDesignatedCountryCode">
																	<com:RecordDesignatedCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</com:RecordDesignatedCountryCode>
																</xsl:for-each>
															</com:RecordDesignatedCountryCodeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:LicenceDetails">
															<tmk:LicenceBag>
																<xsl:for-each select="ns0:Licence">
																	<tmk:Licence>
																		<xsl:for-each select="ns0:LicenceIdentifier">
																			<com:LicenceIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LicenceIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceDate">
																			<com:LicenceDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:LicenceDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceNumber">
																			<com:LicenceNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LicenceNumber>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceReference">
																			<com:LicenceReference>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LicenceReference>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceKind">
																			<xsl:variable name="var207_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf42_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var207_resultof_vmf___inputtoresult">
																				<com:LicenceCategory>
																					<xsl:sequence select="."/>
																				</com:LicenceCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:SubLicenceIndicator">
																			<com:SublicenceIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</com:SublicenceIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RelatedLicenceIdentifier">
																			<com:RelatedLicenceIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:RelatedLicenceIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitationIndicator">
																			<tmk:GoodsServicesLimitationIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</tmk:GoodsServicesLimitationIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitation">
																			<tmk:GoodsServicesLimitation>
																				<xsl:for-each select="ns0:LimitationCountryDetails">
																					<com:LimitationCountryCodeBag>
																						<xsl:for-each select="ns0:LimitationCountryCode">
																							<com:LimitationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LimitationCountryCode>
																						</xsl:for-each>
																					</com:LimitationCountryCodeBag>
																				</xsl:for-each>
																				<com:CommentTextBag>
																					<xsl:for-each select="ns0:Comment">
																						<com:CommentText>
																							<xsl:for-each select="@languageCode">
																								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</com:CommentText>
																					</xsl:for-each>
																				</com:CommentTextBag>
																				<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																					<xsl:variable name="var208_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf32_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var208_resultof_vmf___inputtoresult">
																						<tmk:GoodsServicesLimitationCategory>
																							<xsl:sequence select="."/>
																						</tmk:GoodsServicesLimitationCategory>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																					<tmk:LimitationClassDescriptionBag>
																						<xsl:for-each select="ns0:ClassDescription">
																							<tmk:ClassDescription>
																								<xsl:for-each select="ns0:ClassNumber">
																									<tmk:ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</tmk:ClassNumber>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:ClassNumberStatusCode">
																									<xsl:variable name="var209_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf18_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var209_resultof_vmf___inputtoresult">
																										<tmk:ClassNumberStatusCategory>
																											<xsl:sequence select="."/>
																										</tmk:ClassNumberStatusCategory>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:GoodsServicesDescription">
																									<tmk:GoodsServicesDescriptionText>
																										<xsl:for-each select="@languageCode">
																											<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@sequenceNumber">
																											<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</tmk:GoodsServicesDescriptionText>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																									<tmk:UseNiceHeadingIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</tmk:UseNiceHeadingIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:ClassificationTermDetails">
																									<tmk:ClassificationTermBag>
																										<xsl:for-each select="ns0:ClassificationTerm">
																											<tmk:ClassificationTerm>
																												<xsl:for-each select="@operationCode">
																													<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermIdentifier">
																													<tmk:ClassificationTermIdentifier>
																														<xsl:for-each select="@identifierKindCode">
																															<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermIdentifier>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermOffice">
																													<tmk:ClassificationTermOfficeCode>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermOfficeCode>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																													<tmk:ClassificationTermOfficeIdentification>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermOfficeIdentification>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermSource">
																													<xsl:variable name="var210_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf19_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var210_resultof_vmf___inputtoresult">
																														<tmk:ClassificationTermSourceCategory>
																															<xsl:sequence select="."/>
																														</tmk:ClassificationTermSourceCategory>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermEntryDate">
																													<tmk:ClassificationTermEntryDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</tmk:ClassificationTermEntryDate>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassNumber">
																													<tmk:ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermText">
																													<tmk:ClassificationTermText>
																														<xsl:for-each select="@languageCode">
																															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermText>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																													<tmk:ClassificationTermEquivalentGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermEquivalentGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																													<tmk:ClassificationTermReferenceGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermReferenceGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																													<tmk:ClassificationTermTranslationGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermTranslationGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermStatus">
																													<xsl:variable name="var212_cur" as="node()" select="."/>
																													<xsl:variable name="var211_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf20_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var211_resultof_vmf___inputtoresult">
																														<tmk:ClassificationTermStatus>
																															<xsl:for-each select="$var212_cur/@officeCode">
																																<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="."/>
																														</tmk:ClassificationTermStatus>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:WIPOBasicNumber">
																													<tmk:WIPOBasicNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:WIPOBasicNumber>
																												</xsl:for-each>
																											</tmk:ClassificationTerm>
																										</xsl:for-each>
																									</tmk:ClassificationTermBag>
																								</xsl:for-each>
																							</tmk:ClassDescription>
																						</xsl:for-each>
																					</tmk:LimitationClassDescriptionBag>
																				</xsl:for-each>
																			</tmk:GoodsServicesLimitation>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TerritoryLimitationIndicator">
																			<com:TerritoryLimitationIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</com:TerritoryLimitationIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:TerritoryLimitationText">
																			<com:TerritoryLimitationText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:TerritoryLimitationText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PeriodLimitationIndicator">
																			<com:PeriodLimitationIndicator>
																				<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																			</com:PeriodLimitationIndicator>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PeriodLimitationText">
																			<com:PeriodLimitationText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PeriodLimitationText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PeriodLimitationStartDate">
																			<com:PeriodLimitationStartDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PeriodLimitationStartDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PeriodLimitationEndDate">
																			<com:PeriodLimitationEndDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PeriodLimitationEndDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceStatusCode">
																			<xsl:variable name="var213_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf43_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var213_resultof_vmf___inputtoresult">
																				<com:LicenceStatusCategory>
																					<xsl:sequence select="."/>
																				</com:LicenceStatusCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenseeDetails">
																			<tmk:LicenseeBag>
																				<xsl:for-each select="ns0:Licensee">
																					<tmk:Licensee>
																						<xsl:for-each select="@operationCode">
																							<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeSequenceNumber">
																							<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeLegalEntity">
																							<com:LegalEntityName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LegalEntityName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeIdentifier">
																							<com:PartyIdentifier>
																								<xsl:for-each select="@identifierKindCode">
																									<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:PartyIdentifier>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeAddressBook">
																							<xsl:variable name="var214_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var214_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeNationalityCode">
																							<com:NationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:NationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeIncorporationCountryCode">
																							<com:IncorporationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationCountryCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeIncorporationState">
																							<com:IncorporationState>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:IncorporationState>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenseeEntitlement">
																							<tmk:Entitlement>
																								<xsl:for-each select="ns0:EntitlementNationalityCode">
																									<com:EntitlementNationalityCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</com:EntitlementNationalityCode>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementEstablishment">
																									<com:EntitlementEstablishment>
																										<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																											<com:EntitlementEstablishmentCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementEstablishmentCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																											<xsl:variable name="var215_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var215_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementEstablishment>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:EntitlementDomiciled">
																									<com:EntitlementDomiciled>
																										<xsl:for-each select="ns0:EntitlementDomiciledCode">
																											<com:EntitlementDomiciledCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</com:EntitlementDomiciledCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																											<xsl:variable name="var216_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																												<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																													<xsl:with-param name="AddressBook" as="node()">
																														<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																															<xsl:sequence select="(./@node(), ./node())"/>
																														</AddressBookType>
																													</xsl:with-param>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var216_resultof_MappingST__AddressBookToST__Contact">
																												<com:Contact>
																													<xsl:sequence select="(./@node(), ./node())"/>
																												</com:Contact>
																											</xsl:for-each>
																										</xsl:for-each>
																									</com:EntitlementDomiciled>
																								</xsl:for-each>
																							</tmk:Entitlement>
																						</xsl:for-each>
																					</tmk:Licensee>
																				</xsl:for-each>
																			</tmk:LicenseeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RepresentativeDetails">
																			<com:RepresentativeBag>
																				<xsl:for-each select="ns0:Representative">
																					<xsl:variable name="var217_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																							<xsl:with-param name="Representative" as="node()">
																								<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</RepresentativeType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var217_resultof_MappingST__RepresentativeToST__Representative">
																						<com:Representative>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</com:Representative>
																					</xsl:for-each>
																				</xsl:for-each>
																			</com:RepresentativeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceEventDetails">
																			<com:LicenceEventBag>
																				<xsl:for-each select="ns0:LicenceEvent">
																					<com:LicenceEvent>
																						<xsl:variable name="var218_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf44_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(ns0:LicenceEventCode)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var218_resultof_vmf___inputtoresult">
																							<com:LicenceEventCategory>
																								<xsl:sequence select="."/>
																							</com:LicenceEventCategory>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceEventResponseDate">
																							<com:LicenceEventResponseDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:LicenceEventResponseDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceEventDate">
																							<com:LicenceEventDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:LicenceEventDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:LicenceEventDateTime">
																							<com:LicenceEventDateTime>
																								<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																							</com:LicenceEventDateTime>
																						</xsl:for-each>
																					</com:LicenceEvent>
																				</xsl:for-each>
																			</com:LicenceEventBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LicenceDocumentDetails">
																			<com:LicenceDocumentBag>
																				<xsl:for-each select="ns0:LicenceDocument">
																					<com:LicenceDocument>
																						<xsl:for-each select="ns0:DocumentLanguageCode">
																							<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentName">
																							<com:DocumentName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFilename">
																							<com:FileName>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:FileName>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentFileFormat">
																							<xsl:variable name="var219_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf22_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var219_resultof_vmf___inputtoresult">
																								<com:DocumentFormatCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentFormatCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentDate">
																							<com:DocumentDate>
																								<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																							</com:DocumentDate>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentMedia">
																							<xsl:variable name="var220_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf23_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var220_resultof_vmf___inputtoresult">
																								<com:DocumentMediaCategory>
																									<xsl:sequence select="."/>
																								</com:DocumentMediaCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentLocation">
																							<com:DocumentLocationURI>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</com:DocumentLocationURI>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentVersion">
																							<com:DocumentVersion>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:DocumentVersion>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:DocumentSizeInByte">
																							<com:DocumentSizeQuantity>
																								<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																							</com:DocumentSizeQuantity>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:Comment">
																							<com:CommentText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:CommentText>
																						</xsl:for-each>
																					</com:LicenceDocument>
																				</xsl:for-each>
																			</com:LicenceDocumentBag>
																		</xsl:for-each>
																	</tmk:Licence>
																</xsl:for-each>
															</tmk:LicenceBag>
														</xsl:for-each>
													</tmk:RecordLicence>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordNationalInternationalReplacement">
													<tmk:RecordNationalInternationalReplacement>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:TradeMarkKeyDetails">
															<tmk:TrademarkIdentification>
																<xsl:for-each select="ns0:TradeMarkKey">
																	<tmk:TrademarkIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<tmk:TrademarkIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:TrademarkIdentifier>
																		</xsl:for-each>
																	</tmk:TrademarkIdentifierBag>
																</xsl:for-each>
															</tmk:TrademarkIdentification>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var221_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var221_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var222_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var222_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var223_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var223_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var224_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var224_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<xsl:variable name="var225_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf35_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var225_resultof_vmf___inputtoresult">
																			<com:RecordEventCategory>
																				<xsl:sequence select="."/>
																			</com:RecordEventCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var226_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var226_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var227_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var227_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:GoodsServicesLimitationDetails">
															<tmk:GoodsServicesLimitationBag>
																<xsl:for-each select="ns0:GoodsServicesLimitation">
																	<tmk:GoodsServicesLimitation>
																		<xsl:for-each select="ns0:LimitationCountryDetails">
																			<com:LimitationCountryCodeBag>
																				<xsl:for-each select="ns0:LimitationCountryCode">
																					<com:LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:LimitationCountryCode>
																				</xsl:for-each>
																			</com:LimitationCountryCodeBag>
																		</xsl:for-each>
																		<com:CommentTextBag>
																			<xsl:for-each select="ns0:Comment">
																				<com:CommentText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</com:CommentText>
																			</xsl:for-each>
																		</com:CommentTextBag>
																		<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																			<xsl:variable name="var228_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf32_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var228_resultof_vmf___inputtoresult">
																				<tmk:GoodsServicesLimitationCategory>
																					<xsl:sequence select="."/>
																				</tmk:GoodsServicesLimitationCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																			<tmk:LimitationClassDescriptionBag>
																				<xsl:for-each select="ns0:ClassDescription">
																					<tmk:ClassDescription>
																						<xsl:for-each select="ns0:ClassNumber">
																							<tmk:ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassNumberStatusCode">
																							<xsl:variable name="var229_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf18_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var229_resultof_vmf___inputtoresult">
																								<tmk:ClassNumberStatusCategory>
																									<xsl:sequence select="."/>
																								</tmk:ClassNumberStatusCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesDescription">
																							<tmk:GoodsServicesDescriptionText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@sequenceNumber">
																									<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:GoodsServicesDescriptionText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																							<tmk:UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</tmk:UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassificationTermDetails">
																							<tmk:ClassificationTermBag>
																								<xsl:for-each select="ns0:ClassificationTerm">
																									<tmk:ClassificationTerm>
																										<xsl:for-each select="@operationCode">
																											<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermIdentifier">
																											<tmk:ClassificationTermIdentifier>
																												<xsl:for-each select="@identifierKindCode">
																													<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOffice">
																											<tmk:ClassificationTermOfficeCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																											<tmk:ClassificationTermOfficeIdentification>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeIdentification>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermSource">
																											<xsl:variable name="var230_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf19_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var230_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermSourceCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermSourceCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEntryDate">
																											<tmk:ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</tmk:ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermText">
																											<tmk:ClassificationTermText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																											<tmk:ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																											<tmk:ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																											<tmk:ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermStatus">
																											<xsl:variable name="var232_cur" as="node()" select="."/>
																											<xsl:variable name="var231_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf20_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var231_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermStatus>
																													<xsl:for-each select="$var232_cur/@officeCode">
																														<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:WIPOBasicNumber">
																											<tmk:WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:WIPOBasicNumber>
																										</xsl:for-each>
																									</tmk:ClassificationTerm>
																								</xsl:for-each>
																							</tmk:ClassificationTermBag>
																						</xsl:for-each>
																					</tmk:ClassDescription>
																				</xsl:for-each>
																			</tmk:LimitationClassDescriptionBag>
																		</xsl:for-each>
																	</tmk:GoodsServicesLimitation>
																</xsl:for-each>
															</tmk:GoodsServicesLimitationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:NationalMarkDetails">
															<tmk:NationalMarkBag>
																<xsl:for-each select="ns0:NationalMark">
																	<tmk:NationalMark>
																		<tmk:NationalMarkRegistrationNumber>
																			<xsl:sequence select="fn:string(ns0:NationalMarkRegistrationNumber)"/>
																		</tmk:NationalMarkRegistrationNumber>
																		<xsl:for-each select="ns0:NationalMarkFilingDate">
																			<tmk:NationalMarkFilingDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</tmk:NationalMarkFilingDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:NationalMarkRegistrationDate">
																			<tmk:NationalMarkRegistrationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</tmk:NationalMarkRegistrationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:NationalMarkPriorityDate">
																			<tmk:NationalMarkPriorityDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</tmk:NationalMarkPriorityDate>
																		</xsl:for-each>
																	</tmk:NationalMark>
																</xsl:for-each>
															</tmk:NationalMarkBag>
														</xsl:for-each>
													</tmk:RecordNationalInternationalReplacement>
												</xsl:for-each>
												<xsl:for-each select="ns0:RecordShortNotation">
													<tmk:RecordShortNotation>
														<xsl:for-each select="ns0:RecordIdentifier">
															<com:RecordIdentifier>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordIdentifier>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFilingDate">
															<com:RecordFilingDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordFilingDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordNotificationDate">
															<com:RecordNotificationDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordNotificationDate>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEffectiveDate">
															<com:RecordEffectiveDate>
																<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
															</com:RecordEffectiveDate>
														</xsl:for-each>
														<xsl:variable name="var233_resultof_vmf___inputtoresult" as="xs:string?">
															<xsl:call-template name="vmf:vmf45_inputtoresult">
																<xsl:with-param name="input" select="fn:string(ns0:RecordShortNotationKind)" as="xs:string"/>
															</xsl:call-template>
														</xsl:variable>
														<xsl:for-each select="$var233_resultof_vmf___inputtoresult">
															<tmk:RecordShortNotationCategory>
																<xsl:sequence select="."/>
															</tmk:RecordShortNotationCategory>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordReference">
															<com:RecordReference>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordReference>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordLanguageCode">
															<com:RecordLanguageCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordLanguageCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordPublicationDetails">
															<tmk:RecordPublicationBag>
																<xsl:for-each select="ns0:RecordPublication">
																	<tmk:RecordPublication>
																		<com:PublicationIdentifier>
																			<xsl:sequence select="fn:string(ns0:PublicationIdentifier)"/>
																		</com:PublicationIdentifier>
																		<xsl:for-each select="ns0:PublicationSection">
																			<xsl:variable name="var234_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf27_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var234_resultof_vmf___inputtoresult">
																				<tmk:PublicationSectionCategory>
																					<xsl:sequence select="."/>
																				</tmk:PublicationSectionCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationSubsection">
																			<com:PublicationSubsection>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationSubsection>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationDate">
																			<com:PublicationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:PublicationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:PublicationPage">
																			<com:PublicationPage>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PublicationPage>
																		</xsl:for-each>
																	</tmk:RecordPublication>
																</xsl:for-each>
															</tmk:RecordPublicationBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:ClaimantDetails">
															<tmk:ClaimantBag>
																<xsl:for-each select="ns0:ClaimantKey">
																	<com:PartyIdentifierBag>
																		<xsl:for-each select="ns0:Identifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																	</com:PartyIdentifierBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:Claimant">
																	<tmk:Claimant>
																		<xsl:for-each select="@operationCode">
																			<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantSequenceNumber">
																			<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantLegalEntity">
																			<com:LegalEntityName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:LegalEntityName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIdentifier">
																			<com:PartyIdentifier>
																				<xsl:for-each select="@identifierKindCode">
																					<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:PartyIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantAddressBook">
																			<xsl:variable name="var235_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																					<xsl:with-param name="AddressBook" as="node()">
																						<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</AddressBookType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var235_resultof_MappingST__AddressBookToST__Contact">
																				<com:Contact>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</com:Contact>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantNationalityCode">
																			<com:NationalityCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:NationalityCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationCountryCode">
																			<com:IncorporationCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationCountryCode>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantIncorporationState">
																			<com:IncorporationState>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:IncorporationState>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ClaimantEntitlement">
																			<tmk:Entitlement>
																				<xsl:for-each select="ns0:EntitlementNationalityCode">
																					<com:EntitlementNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:EntitlementNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementEstablishment">
																					<com:EntitlementEstablishment>
																						<xsl:for-each select="ns0:EntitlementEstablishmentCode">
																							<com:EntitlementEstablishmentCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementEstablishmentCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementEstablishmentAddressBook">
																							<xsl:variable name="var236_resultof_MappingST__AddressBookToST__Contact" as="node()?">
																								<xsl:call-template name="WIPO:MappingST66AddressBookToST96Contact">
																									<xsl:with-param name="AddressBook" as="node()">
																										<AddressBookType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																											<xsl:sequence select="(./@node(), ./node())"/>
																										</AddressBookType>
																									</xsl:with-param>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var236_resultof_MappingST__AddressBookToST__Contact">
																								<com:Contact>
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</com:Contact>
																							</xsl:for-each>
																						</xsl:for-each>
																					</com:EntitlementEstablishment>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:EntitlementDomiciled">
																					<com:EntitlementDomiciled>
																						<xsl:for-each select="ns0:EntitlementDomiciledCode">
																							<com:EntitlementDomiciledCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:EntitlementDomiciledCode>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:EntitlementDomiciledAddressBook">
																							<com:Contact>
																								<xsl:sequence select="()"/>
																							</com:Contact>
																						</xsl:for-each>
																					</com:EntitlementDomiciled>
																				</xsl:for-each>
																			</tmk:Entitlement>
																		</xsl:for-each>
																	</tmk:Claimant>
																</xsl:for-each>
															</tmk:ClaimantBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RepresentativeDetails">
															<com:RepresentativeBag>
																<xsl:for-each select="ns0:Representative">
																	<xsl:variable name="var237_resultof_MappingST__RepresentativeToST__Representative" as="node()?">
																		<xsl:call-template name="WIPO:MappingST66RepresentativeToST96Representative">
																			<xsl:with-param name="Representative" as="node()">
																				<RepresentativeType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</RepresentativeType>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var237_resultof_MappingST__RepresentativeToST__Representative">
																		<com:Representative>
																			<xsl:sequence select="(./@node(), ./node())"/>
																		</com:Representative>
																	</xsl:for-each>
																</xsl:for-each>
															</com:RepresentativeBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordEventDetails">
															<com:RecordEventBag>
																<xsl:for-each select="ns0:RecordEvent">
																	<com:RecordEvent>
																		<xsl:variable name="var238_resultof_vmf___inputtoresult" as="xs:string?">
																			<xsl:call-template name="vmf:vmf35_inputtoresult">
																				<xsl:with-param name="input" select="fn:string(ns0:RecordEventCode)" as="xs:string"/>
																			</xsl:call-template>
																		</xsl:variable>
																		<xsl:for-each select="$var238_resultof_vmf___inputtoresult">
																			<com:RecordEventCategory>
																				<xsl:sequence select="."/>
																			</com:RecordEventCategory>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventResponseDate">
																			<com:RecordEventResponseDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventResponseDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDate">
																			<com:RecordEventDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RecordEventDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RecordEventDateTime">
																			<com:RecordEventDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</com:RecordEventDateTime>
																		</xsl:for-each>
																	</com:RecordEvent>
																</xsl:for-each>
															</com:RecordEventBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordDocumentDetails">
															<com:RecordDocumentBag>
																<xsl:for-each select="ns0:RecordDocument">
																	<com:RecordDocument>
																		<xsl:for-each select="ns0:DocumentLanguageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentName">
																			<com:DocumentName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFilename">
																			<com:FileName>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:FileName>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentFileFormat">
																			<xsl:variable name="var239_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf22_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var239_resultof_vmf___inputtoresult">
																				<com:DocumentFormatCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentFormatCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentDate">
																			<com:DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentMedia">
																			<xsl:variable name="var240_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf23_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var240_resultof_vmf___inputtoresult">
																				<com:DocumentMediaCategory>
																					<xsl:sequence select="."/>
																				</com:DocumentMediaCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentLocation">
																			<com:DocumentLocationURI>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</com:DocumentLocationURI>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentVersion">
																			<com:DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DocumentSizeInByte">
																			<com:DocumentSizeQuantity>
																				<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																			</com:DocumentSizeQuantity>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:Comment">
																			<com:CommentText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:CommentText>
																		</xsl:for-each>
																	</com:RecordDocument>
																</xsl:for-each>
															</com:RecordDocumentBag>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordInterestedOfficeCode">
															<com:RecordInterestedOfficeCode>
																<xsl:sequence select="fn:string(.)"/>
															</com:RecordInterestedOfficeCode>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordToRegistration">
															<tmk:RecordToRegistration>
																<xsl:for-each select="ns0:RegistrationIdentifier">
																	<tmk:RegistrationIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:RegistrationIdentifier>
																</xsl:for-each>
																<xsl:for-each select="ns0:RegistrationDate">
																	<com:RegistrationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</com:RegistrationDate>
																</xsl:for-each>
																<xsl:for-each select="ns0:MarkVerbalElementText">
																	<tmk:MarkVerbalElementText>
																		<xsl:for-each select="@languageCode">
																			<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</tmk:MarkVerbalElementText>
																</xsl:for-each>
																<xsl:for-each select="ns0:DesignatedCountryDetails">
																	<tmk:DesignatedCountryCodeBag>
																		<xsl:for-each select="ns0:DesignatedCountryCode">
																			<com:DesignatedCountryCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</com:DesignatedCountryCode>
																		</xsl:for-each>
																	</tmk:DesignatedCountryCodeBag>
																</xsl:for-each>
																<xsl:for-each select="ns0:GoodsServicesLimitation">
																	<tmk:GoodsServicesLimitation>
																		<xsl:for-each select="ns0:LimitationCountryDetails">
																			<com:LimitationCountryCodeBag>
																				<xsl:for-each select="ns0:LimitationCountryCode">
																					<com:LimitationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:LimitationCountryCode>
																				</xsl:for-each>
																			</com:LimitationCountryCodeBag>
																		</xsl:for-each>
																		<com:CommentTextBag>
																			<xsl:for-each select="ns0:Comment">
																				<com:CommentText>
																					<xsl:for-each select="@languageCode">
																						<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</com:CommentText>
																			</xsl:for-each>
																		</com:CommentTextBag>
																		<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																			<xsl:variable name="var241_resultof_vmf___inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf32_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var241_resultof_vmf___inputtoresult">
																				<tmk:GoodsServicesLimitationCategory>
																					<xsl:sequence select="."/>
																				</tmk:GoodsServicesLimitationCategory>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																			<tmk:LimitationClassDescriptionBag>
																				<xsl:for-each select="ns0:ClassDescription">
																					<tmk:ClassDescription>
																						<xsl:for-each select="ns0:ClassNumber">
																							<tmk:ClassNumber>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:ClassNumber>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassNumberStatusCode">
																							<xsl:variable name="var242_resultof_vmf___inputtoresult" as="xs:string?">
																								<xsl:call-template name="vmf:vmf18_inputtoresult">
																									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																								</xsl:call-template>
																							</xsl:variable>
																							<xsl:for-each select="$var242_resultof_vmf___inputtoresult">
																								<tmk:ClassNumberStatusCategory>
																									<xsl:sequence select="."/>
																								</tmk:ClassNumberStatusCategory>
																							</xsl:for-each>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:GoodsServicesDescription">
																							<tmk:GoodsServicesDescriptionText>
																								<xsl:for-each select="@languageCode">
																									<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																								</xsl:for-each>
																								<xsl:for-each select="@sequenceNumber">
																									<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</tmk:GoodsServicesDescriptionText>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																							<tmk:UseNiceHeadingIndicator>
																								<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																							</tmk:UseNiceHeadingIndicator>
																						</xsl:for-each>
																						<xsl:for-each select="ns0:ClassificationTermDetails">
																							<tmk:ClassificationTermBag>
																								<xsl:for-each select="ns0:ClassificationTerm">
																									<tmk:ClassificationTerm>
																										<xsl:for-each select="@operationCode">
																											<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermIdentifier">
																											<tmk:ClassificationTermIdentifier>
																												<xsl:for-each select="@identifierKindCode">
																													<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermIdentifier>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOffice">
																											<tmk:ClassificationTermOfficeCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeCode>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																											<tmk:ClassificationTermOfficeIdentification>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermOfficeIdentification>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermSource">
																											<xsl:variable name="var243_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf19_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var243_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermSourceCategory>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermSourceCategory>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEntryDate">
																											<tmk:ClassificationTermEntryDate>
																												<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																											</tmk:ClassificationTermEntryDate>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassNumber">
																											<tmk:ClassNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassNumber>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermText">
																											<tmk:ClassificationTermText>
																												<xsl:for-each select="@languageCode">
																													<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermText>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																											<tmk:ClassificationTermEquivalentGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermEquivalentGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																											<tmk:ClassificationTermReferenceGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermReferenceGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																											<tmk:ClassificationTermTranslationGroup>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:ClassificationTermTranslationGroup>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:ClassificationTermStatus">
																											<xsl:variable name="var245_cur" as="node()" select="."/>
																											<xsl:variable name="var244_resultof_vmf___inputtoresult" as="xs:string?">
																												<xsl:call-template name="vmf:vmf20_inputtoresult">
																													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																												</xsl:call-template>
																											</xsl:variable>
																											<xsl:for-each select="$var244_resultof_vmf___inputtoresult">
																												<tmk:ClassificationTermStatus>
																													<xsl:for-each select="$var245_cur/@officeCode">
																														<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="."/>
																												</tmk:ClassificationTermStatus>
																											</xsl:for-each>
																										</xsl:for-each>
																										<xsl:for-each select="ns0:WIPOBasicNumber">
																											<tmk:WIPOBasicNumber>
																												<xsl:sequence select="fn:string(.)"/>
																											</tmk:WIPOBasicNumber>
																										</xsl:for-each>
																									</tmk:ClassificationTerm>
																								</xsl:for-each>
																							</tmk:ClassificationTermBag>
																						</xsl:for-each>
																					</tmk:ClassDescription>
																				</xsl:for-each>
																			</tmk:LimitationClassDescriptionBag>
																		</xsl:for-each>
																	</tmk:GoodsServicesLimitation>
																</xsl:for-each>
																<xsl:for-each select="ns0:ApplicantDetails">
																	<tmk:ApplicantBag>
																		<xsl:for-each select="ns0:Applicant">
																			<xsl:variable name="var246_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																				<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																					<xsl:with-param name="Applicant" as="node()">
																						<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</ApplicantType>
																					</xsl:with-param>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var246_resultof_MappingST__ApplicantToST__Applicant">
																				<tmk:Applicant>
																					<xsl:sequence select="(./@node(), ./node())"/>
																				</tmk:Applicant>
																			</xsl:for-each>
																		</xsl:for-each>
																	</tmk:ApplicantBag>
																</xsl:for-each>
															</tmk:RecordToRegistration>
														</xsl:for-each>
														<xsl:for-each select="ns0:RecordFromRegistrationDetails">
															<tmk:RecordFromRegistrationBag>
																<xsl:for-each select="ns0:RecordFromRegistration">
																	<tmk:RecordFromRegistration>
																		<xsl:for-each select="ns0:RegistrationIdentifier">
																			<tmk:RegistrationIdentifier>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:RegistrationIdentifier>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:RegistrationDate">
																			<com:RegistrationDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</com:RegistrationDate>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:MarkVerbalElementText">
																			<tmk:MarkVerbalElementText>
																				<xsl:for-each select="@languageCode">
																					<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</tmk:MarkVerbalElementText>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:DesignatedCountryDetails">
																			<tmk:DesignatedCountryCodeBag>
																				<xsl:for-each select="ns0:DesignatedCountryCode">
																					<com:DesignatedCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</com:DesignatedCountryCode>
																				</xsl:for-each>
																			</tmk:DesignatedCountryCodeBag>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:GoodsServicesLimitation">
																			<tmk:GoodsServicesLimitation>
																				<xsl:for-each select="ns0:LimitationCountryDetails">
																					<com:LimitationCountryCodeBag>
																						<xsl:for-each select="ns0:LimitationCountryCode">
																							<com:LimitationCountryCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</com:LimitationCountryCode>
																						</xsl:for-each>
																					</com:LimitationCountryCodeBag>
																				</xsl:for-each>
																				<com:CommentTextBag>
																					<xsl:for-each select="ns0:Comment">
																						<com:CommentText>
																							<xsl:for-each select="@languageCode">
																								<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</com:CommentText>
																					</xsl:for-each>
																				</com:CommentTextBag>
																				<xsl:for-each select="ns0:GoodsServicesLimitationCode">
																					<xsl:variable name="var247_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf32_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var247_resultof_vmf___inputtoresult">
																						<tmk:GoodsServicesLimitationCategory>
																							<xsl:sequence select="."/>
																						</tmk:GoodsServicesLimitationCategory>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="ns0:LimitationClassDescriptionDetails">
																					<tmk:LimitationClassDescriptionBag>
																						<xsl:for-each select="ns0:ClassDescription">
																							<tmk:ClassDescription>
																								<xsl:for-each select="ns0:ClassNumber">
																									<tmk:ClassNumber>
																										<xsl:sequence select="fn:string(.)"/>
																									</tmk:ClassNumber>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:ClassNumberStatusCode">
																									<xsl:variable name="var248_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf18_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var248_resultof_vmf___inputtoresult">
																										<tmk:ClassNumberStatusCategory>
																											<xsl:sequence select="."/>
																										</tmk:ClassNumberStatusCategory>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:GoodsServicesDescription">
																									<tmk:GoodsServicesDescriptionText>
																										<xsl:for-each select="@languageCode">
																											<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@sequenceNumber">
																											<xsl:attribute name="com:sequenceNumber" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</tmk:GoodsServicesDescriptionText>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:UseNiceHeadingIndicator">
																									<tmk:UseNiceHeadingIndicator>
																										<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																									</tmk:UseNiceHeadingIndicator>
																								</xsl:for-each>
																								<xsl:for-each select="ns0:ClassificationTermDetails">
																									<tmk:ClassificationTermBag>
																										<xsl:for-each select="ns0:ClassificationTerm">
																											<tmk:ClassificationTerm>
																												<xsl:for-each select="@operationCode">
																													<xsl:attribute name="com:operationCategory" select="fn:string(.)"/>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermIdentifier">
																													<tmk:ClassificationTermIdentifier>
																														<xsl:for-each select="@identifierKindCode">
																															<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermIdentifier>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermOffice">
																													<tmk:ClassificationTermOfficeCode>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermOfficeCode>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermOfficeKey">
																													<tmk:ClassificationTermOfficeIdentification>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermOfficeIdentification>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermSource">
																													<xsl:variable name="var249_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf19_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var249_resultof_vmf___inputtoresult">
																														<tmk:ClassificationTermSourceCategory>
																															<xsl:sequence select="."/>
																														</tmk:ClassificationTermSourceCategory>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermEntryDate">
																													<tmk:ClassificationTermEntryDate>
																														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																													</tmk:ClassificationTermEntryDate>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassNumber">
																													<tmk:ClassNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassNumber>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermText">
																													<tmk:ClassificationTermText>
																														<xsl:for-each select="@languageCode">
																															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermText>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
																													<tmk:ClassificationTermEquivalentGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermEquivalentGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
																													<tmk:ClassificationTermReferenceGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermReferenceGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
																													<tmk:ClassificationTermTranslationGroup>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:ClassificationTermTranslationGroup>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:ClassificationTermStatus">
																													<xsl:variable name="var251_cur" as="node()" select="."/>
																													<xsl:variable name="var250_resultof_vmf___inputtoresult" as="xs:string?">
																														<xsl:call-template name="vmf:vmf20_inputtoresult">
																															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																														</xsl:call-template>
																													</xsl:variable>
																													<xsl:for-each select="$var250_resultof_vmf___inputtoresult">
																														<tmk:ClassificationTermStatus>
																															<xsl:for-each select="$var251_cur/@officeCode">
																																<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:sequence select="."/>
																														</tmk:ClassificationTermStatus>
																													</xsl:for-each>
																												</xsl:for-each>
																												<xsl:for-each select="ns0:WIPOBasicNumber">
																													<tmk:WIPOBasicNumber>
																														<xsl:sequence select="fn:string(.)"/>
																													</tmk:WIPOBasicNumber>
																												</xsl:for-each>
																											</tmk:ClassificationTerm>
																										</xsl:for-each>
																									</tmk:ClassificationTermBag>
																								</xsl:for-each>
																							</tmk:ClassDescription>
																						</xsl:for-each>
																					</tmk:LimitationClassDescriptionBag>
																				</xsl:for-each>
																			</tmk:GoodsServicesLimitation>
																		</xsl:for-each>
																		<xsl:for-each select="ns0:ApplicantDetails">
																			<tmk:ApplicantBag>
																				<xsl:for-each select="ns0:Applicant">
																					<xsl:variable name="var252_resultof_MappingST__ApplicantToST__Applicant" as="node()?">
																						<xsl:call-template name="WIPO:MappingST66ApplicantToST96Applicant">
																							<xsl:with-param name="Applicant" as="node()">
																								<ApplicantType xmlns="http://www.wipo.int/standards/XMLSchema/trademarks">
																									<xsl:sequence select="(./@node(), ./node())"/>
																								</ApplicantType>
																							</xsl:with-param>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var252_resultof_MappingST__ApplicantToST__Applicant">
																						<tmk:Applicant>
																							<xsl:sequence select="(./@node(), ./node())"/>
																						</tmk:Applicant>
																					</xsl:for-each>
																				</xsl:for-each>
																			</tmk:ApplicantBag>
																		</xsl:for-each>
																	</tmk:RecordFromRegistration>
																</xsl:for-each>
															</tmk:RecordFromRegistrationBag>
														</xsl:for-each>
													</tmk:RecordShortNotation>
												</xsl:for-each>
											</tmk:MarkRecord>
										</xsl:for-each>
									</tmk:MarkRecordBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:MarkRecordRelationDetails">
									<tmk:MarkRecordRelationBag>
										<xsl:for-each select="ns0:MarkRecordRelation">
											<tmk:MarkRecordRelation>
												<tmk:TrademarkIdentifierBag>
													<xsl:for-each select="ns0:TradeMarkKey/ns0:Identifier">
														<tmk:TrademarkIdentifier>
															<xsl:sequence select="fn:string(.)"/>
														</tmk:TrademarkIdentifier>
													</xsl:for-each>
												</tmk:TrademarkIdentifierBag>
												<com:RecordIdentifierBag>
													<xsl:for-each select="ns0:RecordKey/ns0:Identifier">
														<com:RecordIdentifier>
															<xsl:sequence select="fn:string(.)"/>
														</com:RecordIdentifier>
													</xsl:for-each>
												</com:RecordIdentifierBag>
											</tmk:MarkRecordRelation>
										</xsl:for-each>
									</tmk:MarkRecordRelationBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:ClassificationTermDetails">
									<tmk:ClassificationTermBag>
										<xsl:for-each select="ns0:ClassificationTerm">
											<tmk:ClassificationTerm>
												<xsl:for-each select="ns0:ClassificationTermIdentifier">
													<tmk:ClassificationTermIdentifier>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermIdentifier>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermEntryDate">
													<tmk:ClassificationTermEntryDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:ClassificationTermEntryDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassNumber">
													<tmk:ClassNumber>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassNumber>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermText">
													<tmk:ClassificationTermText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermText>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermEquivalentGroup">
													<tmk:ClassificationTermEquivalentGroup>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermEquivalentGroup>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermReferenceGroup">
													<tmk:ClassificationTermReferenceGroup>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermReferenceGroup>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermTranslationGroup">
													<tmk:ClassificationTermTranslationGroup>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermTranslationGroup>
												</xsl:for-each>
												<xsl:for-each select="ns0:ClassificationTermStatus">
													<tmk:ClassificationTermStatus>
														<xsl:for-each select="@officeCode">
															<xsl:attribute name="com:officeCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:ClassificationTermStatus>
												</xsl:for-each>
												<xsl:for-each select="ns0:WIPOBasicNumber">
													<tmk:WIPOBasicNumber>
														<xsl:sequence select="fn:string(.)"/>
													</tmk:WIPOBasicNumber>
												</xsl:for-each>
											</tmk:ClassificationTerm>
										</xsl:for-each>
									</tmk:ClassificationTermBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:TermSynonymRelationDetails">
									<tmk:TermSynonymRelationBag>
										<xsl:for-each select="ns0:TermSynonymRelation">
											<tmk:TermSynonymRelation>
												<tmk:TermIdentifier>
													<xsl:sequence select="fn:string(ns0:TermKey)"/>
												</tmk:TermIdentifier>
												<tmk:TermSynonymIdentifier>
													<xsl:sequence select="fn:string(ns0:TermSynonymKey)"/>
												</tmk:TermSynonymIdentifier>
											</tmk:TermSynonymRelation>
										</xsl:for-each>
									</tmk:TermSynonymRelationBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:TermTranslationRelationDetails">
									<tmk:TermTranslationRelationBag>
										<xsl:for-each select="ns0:TermTranslationRelation">
											<tmk:TermTranslationRelation>
												<tmk:TermIdentifier>
													<xsl:sequence select="fn:string(ns0:TermKey)"/>
												</tmk:TermIdentifier>
												<tmk:TermTranslationIdentifier>
													<xsl:sequence select="fn:string(ns0:TermTranslationKey)"/>
												</tmk:TermTranslationIdentifier>
											</tmk:TermTranslationRelation>
										</xsl:for-each>
									</tmk:TermTranslationRelationBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:DecisionDetails">
									<tmk:DecisionBag>
										<xsl:for-each select="ns0:Decision">
											<tmk:Decision>
												<com:DecisionIdentifier>
													<xsl:sequence select="fn:string(ns0:DecisionIdentifier)"/>
												</com:DecisionIdentifier>
												<xsl:for-each select="ns0:DecisionDate">
													<com:DecisionDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</com:DecisionDate>
												</xsl:for-each>
												<xsl:for-each select="ns0:DecisionText">
													<com:DecisionText>
														<xsl:for-each select="@languageCode">
															<xsl:attribute name="com:languageCode" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</com:DecisionText>
												</xsl:for-each>
												<xsl:for-each select="ns0:DecisionCurrentStatusDate">
													<tmk:DecisionCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</tmk:DecisionCurrentStatusDate>
												</xsl:for-each>
											</tmk:Decision>
										</xsl:for-each>
									</tmk:DecisionBag>
								</xsl:for-each>
								<xsl:for-each select="$var254_TransactionData/ns0:DecisionCaseRelationDetails">
									<tmk:DecisionCaseRelationBag>
										<xsl:for-each select="ns0:DecisionCaseRelation">
											<tmk:DecisionCaseRelation>
												<xsl:sequence select="()"/>
											</tmk:DecisionCaseRelation>
										</xsl:for-each>
									</tmk:DecisionCaseRelationBag>
								</xsl:for-each>
							</tmk:TransactionData>
						</tmk:TransactionContentBag>
					</tmk:TrademarkTransactionBody>
				</xsl:for-each>
			</xsl:for-each>
		</tmk:TrademarkTransaction>
	</xsl:template>
</xsl:stylesheet>
