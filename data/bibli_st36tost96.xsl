<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:com="http://www.wipo.int/standards/XMLSchema/CommonSchema" xmlns:pat="http://www.wipo.int/standards/XMLSchema/Patent" version="3.0">
  <template match="@* | node()">
    <copy>
      <apply-templates select="@* | node()"/>
    </copy>
  </template>
  <template match="bibliographic-data/@id">
    <apply-templates select="pat:BibliographicData/@com:id"/>
  </template>
  <template match="bibliographic-data/@country">
    <apply-templates select="pat:BibliographicData/@com:officeCode"/>
  </template>
  <template match="bibliographic-data/plain-language-designation">
    <apply-templates select="pat:BibliographicData/pat:PlainLanguageDesignationText"/>
  </template>
  <template match="bibliographic-data/plain-language-designation/@lang">
    <apply-templates select="pat:BibliographicData/pat:PlainLanguageDesignationText/@com:languageCode"/>
  </template>
  <template match="bibliographic-data/publication-reference">
    <apply-templates select="pat:BibliographicData/pat:PatentPublicationIdentification"/>
  </template>
  <template match="bibliographic-data/classification-ipc">
    <apply-templates select="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCClassification"/>
  </template>
  <template match="bibliographic-data/classifications-ipcr">
    <apply-templates select="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag"/>
  </template>
  <template match="bibliographic-data/classifications-ipcr/classification-ipcr">
    <apply-templates select="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification"/>
  </template>
  <template match="bibliographic-data/classification-national">
    <apply-templates select="pat:BibliographicData/pat:PatentClassificationBag/pat:NationalClassification"/>
  </template>
  <template match="bibliographic-data/classification-locarno">
    <apply-templates select="pat:BibliographicData/pat:PatentClassificationBag/com:LocarnoClassificationBag"/>
  </template>
  <template match="bibliographic-data/application-reference">
    <apply-templates select="pat:BibliographicData/pat:ApplicationIdentification"/>
  </template>
  <template match="bibliographic-data/language-of-filing">
    <apply-templates select="pat:BibliographicData/com:FilingLanguageCode"/>
  </template>
  <template match="bibliographic-data/language-of-publication">
    <apply-templates select="pat:BibliographicData/com:PublicationLanguageCode"/>
  </template>
  <template match="bibliographic-data/priority-claims">
    <apply-templates select="pat:BibliographicData/pat:PriorityClaimBag"/>
  </template>
  <template match="bibliographic-data/parties">
    <apply-templates select="pat:BibliographicData/pat:PartyBag"/>
  </template>
  <template match="bibliographic-data/designation-of-states">
    <apply-templates select="pat:BibliographicData/pat:StateDesignation"/>
  </template>
  <template match="bibliographic-data/invention-title">
    <apply-templates select="pat:BibliographicData/pat:InventionTitleBag/pat:InventionTitle/com:Del/text()"/>
  </template>
  <template match="bibliographic-data/assignees">
    <apply-templates select="pat:BibliographicData/pat:PartyBag"/>
  </template>
  <template match="bibliographic-data/licensee-data">
    <apply-templates select="pat:BibliographicData/pat:LicenceBag"/>
  </template>
  <template match="bibliographic-data/date-of-earliest-priority">
    <apply-templates select="pat:BibliographicData/pat:EarliestPriorityApplication/pat:FilingDate"/>
  </template>
  <template match="bibliographic-data/date-complete-specification-filed">
    <apply-templates select="pat:BibliographicData/pat:CompleteSpecificationFilingDate"/>
  </template>
  <template match="bibliographic-data/dates-of-public-availability">
    <apply-templates select="pat:BibliographicData/pat:PublicAvailabilityDataBag"/>
  </template>
  <template match="bibliographic-data/term-of-grant">
    <apply-templates select="pat:BibliographicData/pat:GrantTerm"/>
  </template>
  <template match="bibliographic-data/dates-rights-effective">
    <apply-templates select="pat:BibliographicData/pat:RightsEffectiveDateBag"/>
  </template>
  <template match="bibliographic-data/patent-family">
    <apply-templates select="pat:BibliographicData/pat:PatentFamily"/>
  </template>
  <template match="bibliographic-data/field-of-search">
    <apply-templates select="pat:BibliographicData/pat:SearchField"/>
  </template>
  <template match="bibliographic-data/figures">
    <apply-templates select="pat:BibliographicData/pat:FigureBag"/>
  </template>
  <template match="bibliographic-data/references-cited">
    <apply-templates select="pat:BibliographicData/pat:ReferenceCitationBag"/>
  </template>
  <template match="bibliographic-data/examiners">
    <apply-templates select="pat:BibliographicData/pat:PartyBag"/>
  </template>
  <template match="bibliographic-data/number-of-claims">
    <apply-templates select="pat:BibliographicData/pat:ClaimTotalQuantity"/>
  </template>
  <template match="bibliographic-data/related-documents">
    <apply-templates select="pat:BibliographicData/pat:RelatedDocumentBag"/>
  </template>
  <template match="bibliographic-data/st50-republication">
    <apply-templates select="pat:BibliographicData/pat:PatentDocumentRepublication"/>
  </template>
  <template match="bibliographic-data/date-exhibition-filed">
    <apply-templates select="pat:BibliographicData/pat:ExhibitionFilingDate"/>
  </template>
  <template match="bibliographic-data/date-pct-article-22-39-fulfilled/date">
    <apply-templates select="pat:BibliographicData/pat:PCTNationalPhaseEntryDate"/>
  </template>
  <template match="bibliographic-data/bio-deposit">
    <apply-templates select="pat:BibliographicData/com:BioDeposit"/>
  </template>
  <template match="bibliographic-data/pct-or-regional-filing-data">
    <apply-templates select="pat:BibliographicData/pat:InternationalFilingData"/>
  </template>
  <template match="bibliographic-data/pct-or-regional-publishing-data">
    <apply-templates select="pat:BibliographicData/pat:InternationalPublishingData"/>
  </template>
  <template match="bibliographic-data/date-rights-reestablished">
    <apply-templates select="pat:BibliographicData/pat:RightsReestablishedDate"/>
  </template>
  <template match="bibliographic-data/date-application-withdrawn-by-applicant">
    <apply-templates select="pat:BibliographicData/pat:ApplicationWithdrawnDate"/>
  </template>
  <template match="bibliographic-data/date-application-deemed-withdrawn">
    <apply-templates select="pat:BibliographicData/pat:ApplicationDeemedWithdrawnDate"/>
  </template>
  <template match="bibliographic-data/date-of-revocation">
    <apply-templates select="pat:BibliographicData/pat:PatentRevocationDate"/>
  </template>
  <template match="bibliographic-data/date-application-partially-withdrawn/date">
    <apply-templates select="pat:BibliographicData/pat:ApplicationPartiallyWithdrawnDate"/>
  </template>
  <template match="bibliographic-data/opposition-data">
    <apply-templates select="pat:BibliographicData/pat:OppositionData"/>
  </template>
  <template match="plain-language-designation">
    <apply-templates select="pat:PlainLanguageDesignationText"/>
  </template>
  <template match="plain-language-designation/@lang">
    <apply-templates select="pat:PlainLanguageDesignationText/@com:languageCode"/>
  </template>
  <template match="publication-reference">
    <apply-templates select="pat:PatentGrantIdentification"/>
  </template>
  <template match="publication-reference/@id">
    <apply-templates select="pat:PatentGrantIdentification/@com:id"/>
  </template>
  <template match="publication-reference/document-id/country">
    <apply-templates select="pat:PatentGrantIdentification/com:IPOfficeCode"/>
  </template>
  <template match="publication-reference/document-id/doc-number">
    <apply-templates select="pat:PatentGrantIdentification/pat:PatentNumber"/>
  </template>
  <template match="publication-reference/document-id/kind">
    <apply-templates select="pat:PatentGrantIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="publication-reference/document-id/date">
    <apply-templates select="pat:PatentGrantIdentification/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}IssueDate"/>
  </template>
  <template match="classification-ipc">
    <apply-templates select="pat:IPCClassification"/>
  </template>
  <template match="classification-ipc/@id">
    <apply-templates select="pat:IPCClassification/@com:id"/>
  </template>
  <template match="classification-ipc/edition">
    <apply-templates select="pat:IPCClassification/com:Edition"/>
  </template>
  <template match="classification-ipc/main-classification">
    <apply-templates select="pat:IPCClassification/pat:MainClassification"/>
  </template>
  <template match="classification-ipc/further-classification">
    <apply-templates select="pat:IPCClassification/pat:FurtherClassification"/>
  </template>
  <template match="classification-ipcr">
    <apply-templates select="pat:IPCRClassification"/>
  </template>
  <template match="classification-ipcr/@id">
    <apply-templates select="pat:IPCRClassification/@com:id"/>
  </template>
  <template match="classification-ipcr/@sequence">
    <apply-templates select="pat:IPCRClassification/@com:sequenceNumber"/>
  </template>
  <template match="classification-ipcr/ipc-version-indicator/date">
    <apply-templates select="pat:IPCRClassification/pat:ClassificationVersionDate"/>
  </template>
  <template match="classification-ipcr/classification-level">
    <apply-templates select="pat:IPCRClassification/pat:PatentClassificationLevelCode"/>
  </template>
  <template match="classification-ipcr/section">
    <apply-templates select="pat:IPCRClassification/pat:Section"/>
  </template>
  <template match="classification-ipcr/class">
    <apply-templates select="pat:IPCRClassification/pat:Class"/>
  </template>
  <template match="classification-ipcr/subclass">
    <apply-templates select="pat:IPCRClassification/pat:Subclass"/>
  </template>
  <template match="classification-ipcr/main-group">
    <apply-templates select="pat:IPCRClassification/pat:MainGroup"/>
  </template>
  <template match="classification-ipcr/subgroup">
    <apply-templates select="pat:IPCRClassification/pat:Subgroup"/>
  </template>
  <template match="classification-ipcr/symbol-position">
    <apply-templates select="pat:IPCRClassification/com:SymbolPositionCode"/>
  </template>
  <template match="classification-ipcr/classification-value">
    <apply-templates select="pat:IPCRClassification/pat:IPCClassificationValueCode"/>
  </template>
  <template match="classification-ipcr/action-date/date">
    <apply-templates select="pat:IPCRClassification/pat:ActionDate"/>
  </template>
  <template match="classification-ipcr/generating-office/country">
    <apply-templates select="pat:IPCRClassification/pat:GeneratingOfficeCode"/>
  </template>
  <template match="classification-ipcr/classification-status">
    <apply-templates select="pat:IPCRClassification/pat:IPCClassificationStatusCode"/>
  </template>
  <template match="classification-ipcr/classification-data-source">
    <apply-templates select="pat:IPCRClassification/pat:PatentClassificationDataSourceCode"/>
  </template>
  <template match="classification-ipcr/text">
    <apply-templates select="pat:IPCRClassification/pat:PatentClassificationText"/>
  </template>
  <template match="classification-national">
    <apply-templates select="pat:NationalClassification"/>
  </template>
  <template match="classification-national/@id">
    <apply-templates select="pat:NationalClassification/@com:id"/>
  </template>
  <template match="classification-national/country">
    <apply-templates select="pat:NationalClassification/com:IPOfficeCode"/>
  </template>
  <template match="classification-national/edition">
    <apply-templates select="pat:NationalClassification/com:Edition"/>
  </template>
  <template match="classification-national/main-classification">
    <apply-templates select="pat:NationalClassification/pat:MainNationalClassification"/>
  </template>
  <template match="classification-national/main-classification/text()">
    <apply-templates select="pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText"/>
  </template>
  <template match="classification-national/further-classification">
    <apply-templates select="pat:NationalClassification/pat:FurtherNationalClassification"/>
  </template>
  <template match="classification-national/further-classification/@id">
    <apply-templates select="pat:NationalClassification/pat:FurtherNationalClassification/@com:id"/>
  </template>
  <template match="classification-national/further-classification/text()">
    <apply-templates select="pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText"/>
  </template>
  <template match="classification-locarno">
    <apply-templates select="com:LocarnoClassificationBag"/>
  </template>
  <template match="classification-locarno/@id">
    <apply-templates select="com:LocarnoClassificationBag/@com:id"/>
  </template>
  <template match="classification-locarno/edition">
    <apply-templates select="com:LocarnoClassificationBag/com:LocarnoClassificationEdition"/>
  </template>
  <template match="classification-locarno/edition/text()">
    <apply-templates select="com:LocarnoClassificationBag/com:LocarnoClassificationDate"/>
  </template>
  <template match="classification-locarno/main-classification">
    <apply-templates select="com:LocarnoClassificationBag/com:LocarnoClassification/com:LocarnoClass"/>
  </template>
  <template match="classification-locarno/text">
    <apply-templates select="com:LocarnoClassificationBag/com:LocarnoClassificationText"/>
  </template>
  <template match="priority-claims">
    <apply-templates select="pat:PriorityClaimBag"/>
  </template>
  <template match="priority-claims/priority-claim">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim"/>
  </template>
  <template match="priority-claims/priority-claim/@id">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/@com:id"/>
  </template>
  <template match="priority-claims/priority-claim/@sequence">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/@com:sequenceNumber"/>
  </template>
  <template match="priority-claims/priority-claim/@kind">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:ApplicationFilingCategory"/>
  </template>
  <template match="priority-claims/priority-claim/country">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/com:IPOfficeCode"/>
  </template>
  <template match="priority-claims/priority-claim/doc-number">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber"/>
  </template>
  <template match="priority-claims/priority-claim/doc-number/text()">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="priority-claims/priority-claim/date">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:FilingDate"/>
  </template>
  <template match="priority-claims/priority-claim/priority-doc-requested">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:RequestedPriorityDocumentIndicator"/>
  </template>
  <template match="priority-claims/priority-claim/priority-doc-attached">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:AttachedPriorityDocumentIndicator"/>
  </template>
  <template match="priority-claims/priority-claim/priority-doc-from-library">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator"/>
  </template>
  <template match="priority-claims/priority-claim/priority-doc-from-library/@library-identifier">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@pat:libraryIdentifier"/>
  </template>
  <template match="priority-claims/priority-claim/priority-doc-from-library/@action-by">
    <apply-templates select="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@com:officeCode"/>
  </template>
  <template match="designation-of-states/designation-pct">
    <apply-templates select="pat:StateDesignation"/>
  </template>
  <template match="designation-of-states/designation-pct/regional">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation"/>
  </template>
  <template match="designation-of-states/designation-pct/regional/region/country">
    <apply-templates select="pat:StateDesignation/pat:RegionalDesignation/pat:RegionalOfficeCode"/>
  </template>
  <template match="designation-of-states/designation-pct/regional/country">
    <apply-templates select="pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode"/>
  </template>
  <template match="designation-of-states/designation-pct/national">
    <apply-templates select="pat:StateDesignation/pat:RegionalDesignation"/>
  </template>
  <template match="designation-of-states/designation-pct/national/country">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode"/>
  </template>
  <template match="designation-of-states/designation-pct/national/country/text()">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest"/>
  </template>
  <template match="designation-of-states/designation-pct/national/protection-request/@subset">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/@pat:subsetIndicator"/>
  </template>
  <template match="designation-of-states/designation-pct/national/protection-request/kind-of-protection">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:ProtectionCategory"/>
  </template>
  <template match="designation-of-states/designation-pct/national/protection-request/document-id">
    <apply-templates select="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="designation-of-states/designation-pct/new-designation-country">
    <apply-templates select="pat:StateDesignation/pat:NewDesignationCountryCode"/>
  </template>
  <template match="licensee-data">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:LicenseeBag"/>
  </template>
  <template match="licensee-data/licensee">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee"/>
  </template>
  <template match="licensee-data/licensee/addressbook">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee/com:Contact"/>
  </template>
  <template match="licensee-data/attorney-or-agent">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner"/>
  </template>
  <template match="licensee-data/attorney-or-agent/@rep-type">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory"/>
  </template>
  <template match="licensee-data/attorney-or-agent/addressbook">
    <apply-templates select="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:Contact"/>
  </template>
  <template match="licensee-data/effective-in">
    <apply-templates select="pat:LicenceBag/pat:Licence/com:EffectiveCountryBag"/>
  </template>
  <template match="licensee-data/effective-in/country">
    <apply-templates select="pat:LicenceBag/pat:Licence/com:EffectiveCountryBag/com:CountryCode"/>
  </template>
  <template match="dates-of-public-availability">
    <apply-templates select="pat:PublicAvailabilityDataBag"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference/@id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference/@com:id"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference/@country">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference/com:IPOfficeCode"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference/gazette-num">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteNumber"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference/gazette-num/text()">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference/com:PublicationDate"/>
  </template>
  <template match="dates-of-public-availability/gazette-reference/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteReferenceText"/>
  </template>
  <template match="dates-of-public-availability/unexamined-not-printed-without-grant">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument"/>
  </template>
  <template match="dates-of-public-availability/unexamined-not-printed-without-grant/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/unexamined-not-printed-without-grant/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/com:CommentText"/>
  </template>
  <template match="dates-of-public-availability/examined-not-printed-without-grant">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument"/>
  </template>
  <template match="dates-of-public-availability/examined-not-printed-without-grant/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/examined-not-printed-without-grant/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/com:CommentText"/>
  </template>
  <template match="dates-of-public-availability/unexamined-printed-without-grant">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument"/>
  </template>
  <template match="dates-of-public-availability/unexamined-printed-without-grant/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/unexamined-printed-without-grant/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/com:CommentText"/>
  </template>
  <template match="dates-of-public-availability/examined-printed-without-grant">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument"/>
  </template>
  <template match="dates-of-public-availability/examined-printed-without-grant/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/examined-printed-without-grant/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/com:CommentText"/>
  </template>
  <template match="dates-of-public-availability/claims-only-available">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims"/>
  </template>
  <template match="dates-of-public-availability/claims-only-available/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/claims-only-available/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/com:CommentText"/>
  </template>
  <template match="dates-of-public-availability/not-printed-with-grant">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant"/>
  </template>
  <template match="dates-of-public-availability/not-printed-with-grant/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant/pat:PatentDocumentIdentification/pat:PatentGrantIdentification"/>
  </template>
  <template match="dates-of-public-availability/invalidation-of-patent">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:PatentInvalidation"/>
  </template>
  <template match="dates-of-public-availability/invalidation-of-patent/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:PatentInvalidation/pat:PatentDocumentIdentification/pat:PatentGrantIdentification"/>
  </template>
  <template match="dates-of-public-availability/printed-as-amended">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument"/>
  </template>
  <template match="dates-of-public-availability/printed-as-amended/document-id">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="dates-of-public-availability/printed-as-amended/text">
    <apply-templates select="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/com:CommentText"/>
  </template>
  <template match="term-of-grant">
    <apply-templates select="pat:GrantTerm"/>
  </template>
  <template match="term-of-grant/disclaimer">
    <apply-templates select="pat:GrantTerm/pat:TerminalDisclaimer"/>
  </template>
  <template match="term-of-grant/disclaimer/date">
    <apply-templates select="pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerDate"/>
  </template>
  <template match="term-of-grant/disclaimer/text">
    <apply-templates select="pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerText"/>
  </template>
  <template match="term-of-grant/length-of-grant">
    <apply-templates select="pat:GrantTerm/pat:GrantLengthQuantity"/>
  </template>
  <template match="term-of-grant/lapse-of-patent">
    <apply-templates select="pat:GrantTerm/pat:PatentTermLapseQuantity"/>
  </template>
  <template match="dates-rights-effective">
    <apply-templates select="pat:RightsEffectiveDateBag"/>
  </template>
  <template match="dates-rights-effective/request-for-examination/date">
    <apply-templates select="pat:RightsEffectiveDateBag/com:ExaminationRequestDate"/>
  </template>
  <template match="dates-rights-effective/first-examination-report-despatched/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:FirstDespatchedExaminationReportDate"/>
  </template>
  <template match="dates-rights-effective/patent-maintained-as-amended/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:PatentMaintainedAsAmendedDate"/>
  </template>
  <template match="dates-rights-effective/request-for-conversion-to-national-application">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest"/>
  </template>
  <template match="dates-rights-effective/request-for-conversion-to-national-application/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/pat:NationalApplicationConversionRequestDate"/>
  </template>
  <template match="dates-rights-effective/request-for-conversion-to-national-application/country">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/com:IPOfficeCode"/>
  </template>
  <template match="dates-rights-effective/proceedings-suspended/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:ProceedingsSuspensionDate"/>
  </template>
  <template match="dates-rights-effective/proceedings-interrupted/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:ProceedingsInterruptionDate"/>
  </template>
  <template match="dates-rights-effective/proceedings-resumed/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:ProceedingsResumptionDate"/>
  </template>
  <template match="dates-rights-effective/notification-of-rights-after-appeal/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:AfterAppealRightsNotificationDate"/>
  </template>
  <template match="dates-rights-effective/date-entering-into-force/date">
    <apply-templates select="pat:RightsEffectiveDateBag/pat:EnteredIntoForceDate"/>
  </template>
  <template match="patent-family">
    <apply-templates select="pat:PatentFamily"/>
  </template>
  <template match="patent-family/@id">
    <apply-templates select="pat:PatentFamily/@com:id"/>
  </template>
  <template match="patent-family/priority-application">
    <apply-templates select="pat:PatentFamily/pat:PriorityApplication"/>
  </template>
  <template match="patent-family/priority-application/document-id">
    <apply-templates select="pat:PatentFamily/pat:PriorityApplication/pat:PatentPublicationIdentification"/>
  </template>
  <template match="patent-family/family-member">
    <apply-templates select="pat:PatentFamily/pat:PatentFamilyMember"/>
  </template>
  <template match="patent-family/family-member/document-id">
    <apply-templates select="pat:PatentFamily/pat:PatentFamilyMember/pat:PatentPublicationIdentification"/>
  </template>
  <template match="patent-family/text">
    <apply-templates select="pat:PatentFamily/pat:PatentFamilyText"/>
  </template>
  <template match="document-id">
    <apply-templates select="pat:PatentPublicationIdentification"/>
  </template>
  <template match="document-id/country">
    <apply-templates select="pat:PatentGrantIdentification/com:IPOfficeCode"/>
  </template>
  <template match="document-id/doc-number">
    <apply-templates select="pat:PatentGrantIdentification/pat:PatentNumber"/>
  </template>
  <template match="document-id/kind">
    <apply-templates select="pat:PatentGrantIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="document-id/date">
    <apply-templates select="pat:PatentGrantIdentification/pat:GrantDate"/>
  </template>
  <template match="field-of-search">
    <apply-templates select="pat:SearchField"/>
  </template>
  <template match="field-of-search/classification-ipc">
    <apply-templates select="pat:SearchField/pat:PatentClassificationBag/pat:IPCClassification"/>
  </template>
  <template match="field-of-search/classifications-ipcr">
    <apply-templates select="pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification"/>
  </template>
  <template match="field-of-search/classifications-ipcr/@id">
    <apply-templates select="pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification"/>
  </template>
  <template match="field-of-search/classification-national">
    <apply-templates select="pat:SearchField/pat:PatentClassificationBag/pat:NationalClassification"/>
  </template>
  <template match="figures">
    <apply-templates select="pat:FigureBag"/>
  </template>
  <template match="figures/number-of-drawing-sheets/text()">
    <apply-templates select="pat:FigureBag/pat:DrawingSheetTotalQuantity"/>
  </template>
  <template match="figures/number-of-figures/text()">
    <apply-templates select="pat:FigureBag/pat:FigureTotalQuantity"/>
  </template>
  <template match="figures/figure-to-publish">
    <apply-templates select="pat:FigureBag/pat:PublishFigure"/>
  </template>
  <template match="figures/figure-to-publish/fig-number/text()">
    <apply-templates select="pat:FigureBag/pat:PublishFigure/pat:FigureNumber"/>
  </template>
  <template match="references-cited">
    <apply-templates select="pat:ReferenceCitationBag"/>
  </template>
  <template match="references-cited/citation">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation"/>
  </template>
  <template match="references-cited/citation/@id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/@com:id"/>
  </template>
  <template match="references-cited/citation/patcit">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation"/>
  </template>
  <template match="references-cited/citation/patcit/@id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:id"/>
  </template>
  <template match="references-cited/citation/patcit/@num">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:sequenceNumber"/>
  </template>
  <template match="references-cited/citation/patcit/text">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:PatentCitationText"/>
  </template>
  <template match="references-cited/citation/patcit/document-id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/@lang">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/@com:languageCode"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/country">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/doc-number">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/kind">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/name">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:EntityName"/>
  </template>
  <template match="references-cited/citation/patcit/document-id/date">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate"/>
  </template>
  <template match="references-cited/citation/nplcit">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation"/>
  </template>
  <template match="references-cited/citation/nplcit/@id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:id"/>
  </template>
  <template match="references-cited/citation/nplcit/@num">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:sequenceNumber"/>
  </template>
  <template match="references-cited/citation/nplcit/@lang">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:languageCode"/>
  </template>
  <template match="references-cited/citation/nplcit/article">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedJournalArticle"/>
  </template>
  <template match="references-cited/citation/nplcit/book">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook"/>
  </template>
  <template match="references-cited/citation/nplcit/book/notes">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook/com:Notes"/>
  </template>
  <template match="references-cited/citation/nplcit/othercit">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:NPLCitationText"/>
  </template>
  <template match="references-cited/citation/rel-passage">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag"/>
  </template>
  <template match="references-cited/citation/rel-passage/text">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRangeText"/>
  </template>
  <template match="references-cited/citation/rel-passage/passage">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeStart"/>
  </template>
  <template match="references-cited/citation/rel-passage/passage/text()">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeEnd"/>
  </template>
  <template match="references-cited/citation/rel-passage/category">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:CitationCategoryCode"/>
  </template>
  <template match="references-cited/citation/rel-passage/rel-claims">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag"/>
  </template>
  <template match="references-cited/citation/rel-passage/rel-claims/text()">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimRange/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimEndNumber"/>
  </template>
  <template match="references-cited/citation/category/text()">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/@pat:citingPartyCategory"/>
  </template>
  <template match="references-cited/citation/classification-national">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification"/>
  </template>
  <template match="references-cited/citation/classification-national/@id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/@com:id"/>
  </template>
  <template match="references-cited/citation/classification-national/country">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:IPOfficeCode"/>
  </template>
  <template match="references-cited/citation/classification-national/edition">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:Edition"/>
  </template>
  <template match="references-cited/citation/classification-national/main-classification">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification"/>
  </template>
  <template match="references-cited/citation/classification-national/main-classification/text()">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText"/>
  </template>
  <template match="references-cited/citation/classification-national/further-classification">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification"/>
  </template>
  <template match="references-cited/citation/classification-national/further-classification/@id">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/@com:id"/>
  </template>
  <template match="references-cited/citation/classification-national/further-classification/text()">
    <apply-templates select="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText"/>
  </template>
  <template match="st50-republication">
    <apply-templates select="pat:PatentDocumentRepublication"/>
  </template>
  <template match="st50-republication/republication-code">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationCategory"/>
  </template>
  <template match="st50-republication/cancellation-date">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationCancellationDate"/>
  </template>
  <template match="st50-republication/modifications/modified-bibliography">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography"/>
  </template>
  <template match="st50-republication/modifications/modified-bibliography/inid-code">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/pat:PatentINIDCode"/>
  </template>
  <template match="st50-republication/modifications/modified-bibliography/inid-code/@sequence">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/@com:sequenceNumber"/>
  </template>
  <template match="st50-republication/modifications/modified-part">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation"/>
  </template>
  <template match="st50-republication/modifications/modified-part/@sequence">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:sequenceNumber"/>
  </template>
  <template match="st50-republication/modifications/modified-part/@lang">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:languageCode"/>
  </template>
  <template match="st50-republication/modifications/modified-part/modified-part-name">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedPartCategory"/>
  </template>
  <template match="st50-republication/modifications/modified-part/modified-item">
    <apply-templates select="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedItemText"/>
  </template>
  <template match="st50-republication/republication-notes">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag"/>
  </template>
  <template match="st50-republication/republication-notes/republication-note">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText"/>
  </template>
  <template match="st50-republication/republication-notes/republication-note/@sequence">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:sequenceNumber"/>
  </template>
  <template match="st50-republication/republication-notes/republication-note/@lang">
    <apply-templates select="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:languageCode"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference/@id">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference/@com:id"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference/@country">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference/com:IPOfficeCode"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference/gazette-num">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteNumber"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference/date">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference/com:PublicationDate"/>
  </template>
  <template match="st50-republication/correction-notice/gazette-reference/text">
    <apply-templates select="pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteReferenceText"/>
  </template>
  <template match="related-documents">
    <apply-templates select="pat:RelatedDocumentBag"/>
  </template>
  <template match="related-documents/addition">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc/parent-status">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:ParentDocumentStatusCode"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc/parent-grant-document/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc/parent-pct-document">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent"/>
  </template>
  <template match="related-documents/addition/relation/parent-doc/parent-pct-document/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent/pat:ApplicationIdentification"/>
  </template>
  <template match="related-documents/addition/relation/child-doc">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument"/>
  </template>
  <template match="related-documents/addition/relation/child-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="related-documents/division">
    <apply-templates select="pat:RelatedDocumentBag/pat:Division"/>
  </template>
  <template match="related-documents/continuation">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation"/>
  </template>
  <template match="related-documents/continuation/relation/parent-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="related-documents/continuation/relation/parent-doc/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/continuation/relation/parent-doc/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="related-documents/continuation/relation/child-doc">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument"/>
  </template>
  <template match="related-documents/continuation/relation/child-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification"/>
  </template>
  <template match="related-documents/continuation/relation/child-doc/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/continuation/relation/child-doc/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="related-documents/continuation-in-part">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/document-id/date">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/pat:FilingDate"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-status">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:ParentDocumentStatusCode"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:PatentNumber"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/kind">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/date">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:GrantDate"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/child-doc">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/child-doc/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/child-doc/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/continuation-in-part/relation/child-doc/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="related-documents/continuing-reissue">
    <apply-templates select="pat:RelatedDocumentBag/pat:ContinuingReissue"/>
  </template>
  <template match="related-documents/reissue">
    <apply-templates select="pat:RelatedDocumentBag/pat:Reissue"/>
  </template>
  <template match="related-documents/reexamination">
    <apply-templates select="pat:RelatedDocumentBag/pat:Reexamination"/>
  </template>
  <template match="related-documents/substitution">
    <apply-templates select="pat:RelatedDocumentBag/pat:Substitution"/>
  </template>
  <template match="related-documents/utility-model-basis">
    <apply-templates select="pat:RelatedDocumentBag/pat:UtilityModelBasis"/>
  </template>
  <template match="related-documents/correction">
    <apply-templates select="pat:RelatedDocumentBag/pat:Correction"/>
  </template>
  <template match="related-documents/related-publication">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication"/>
  </template>
  <template match="related-documents/related-publication/document-id">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="related-documents/related-publication/document-id/country">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:IPOfficeCode"/>
  </template>
  <template match="related-documents/related-publication/document-id/doc-number">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/pat:PublicationNumber"/>
  </template>
  <template match="related-documents/related-publication/document-id/kind">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="related-documents/related-publication/document-id/date">
    <apply-templates select="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PublicationDate"/>
  </template>
  <template match="pct-or-regional-filing-data">
    <apply-templates select="pat:InternationalFilingData"/>
  </template>
  <template match="pct-or-regional-filing-data/document-id/country">
    <apply-templates select="pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode"/>
  </template>
  <template match="pct-or-regional-filing-data/document-id/doc-number">
    <apply-templates select="pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="pct-or-regional-filing-data/document-id/date">
    <apply-templates select="pat:InternationalFilingData/pat:ApplicationIdentification/pat:FilingDate"/>
  </template>
  <template match="pct-or-regional-filing-data/us-371c124-date/date">
    <apply-templates select="pat:InternationalFilingData/pat:NationalStageFilingDate"/>
  </template>
  <template match="pct-or-regional-filing-data/document-id/@lang">
    <apply-templates select="pat:InternationalFilingData/pat:ApplicationIdentification/com:FilingLanguageCode"/>
  </template>
  <template match="application-reference">
    <apply-templates select="pat:ApplicationIdentification"/>
  </template>
  <template match="application-reference/@id">
    <apply-templates select="pat:ApplicationIdentification/@com:id"/>
  </template>
  <template match="application-reference/@appl-type">
    <apply-templates select="pat:ApplicationIdentification/pat:InventionSubjectMatterCategory"/>
  </template>
  <template match="application-reference/document-id/country">
    <apply-templates select="pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode"/>
  </template>
  <template match="application-reference/document-id/doc-number">
    <apply-templates select="pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText"/>
  </template>
  <template match="application-reference/document-id/date">
    <apply-templates select="pat:ApplicationIdentification/pat:FilingDate"/>
  </template>
  <template match="electronic-signature">
    <apply-templates select="com:ElectronicSignature"/>
  </template>
  <template match="electronic-signature/@date">
    <apply-templates select="com:ElectronicSignature/com:ElectronicSignatureDate"/>
  </template>
  <template match="electronic-signature/@place-signed">
    <apply-templates select="com:ElectronicSignature/com:ElectronicSignaturePlace"/>
  </template>
  <template match="electronic-signature/basic-signature">
    <apply-templates select="com:ElectronicSignature/com:ElectronicBasicSignature"/>
  </template>
  <template match="electronic-signature/basic-signature/fax-image/@file">
    <apply-templates select="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureImageURI"/>
  </template>
  <template match="electronic-signature/basic-signature/text-string">
    <apply-templates select="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureText"/>
  </template>
  <template match="electronic-signature/basic-signature/click-wrap">
    <apply-templates select="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureClickWrap"/>
  </template>
  <template match="electronic-signature/enhanced-signature">
    <apply-templates select="com:ElectronicSignature/com:ElectronicEnhancedSignature"/>
  </template>
  <template match="electronic-signature/enhanced-signature/pkcs7">
    <apply-templates select="com:ElectronicSignature/com:ElectronicEnhancedSignature/@com:pkcs7Indicator"/>
  </template>
  <template match="addressbook">
    <apply-templates select="com:PublicationContact"/>
  </template>
  <template match="addressbook/@lang">
    <apply-templates select="com:Contact/@com:languageCode"/>
  </template>
  <template match="addressbook/name">
    <apply-templates select="com:PublicationContact/com:Name/com:EntityName"/>
  </template>
  <template match="addressbook/prefix">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix"/>
  </template>
  <template match="addressbook/last-name">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/>
  </template>
  <template match="addressbook/orgname">
    <apply-templates select="com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName"/>
  </template>
  <template match="addressbook/orgname/text()">
    <apply-templates select="com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName/text()"/>
  </template>
  <template match="addressbook/first-name">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>
  </template>
  <template match="addressbook/middle-name">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>
  </template>
  <template match="addressbook/first-last-name">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName"/>
  </template>
  <template match="addressbook/second-last-name">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName"/>
  </template>
  <template match="addressbook/suffix">
    <apply-templates select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix"/>
  </template>
  <template match="addressbook/role">
    <apply-templates select="com:Contact/com:Name/com:EntityName/@com:entityNameCategory"/>
  </template>
  <template match="addressbook/address">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress"/>
  </template>
  <template match="addressbook/address/address-1">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="addressbook/address/address-1/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="addressbook/address/address-2">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="addressbook/address/address-2/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="addressbook/address/address-3">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="addressbook/address/address-3/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="addressbook/address/address-4">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="addressbook/address/address-4/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="addressbook/address/address-5">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="addressbook/address/address-5/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="addressbook/address/mailcode">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode"/>
  </template>
  <template match="addressbook/address/pobox">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)"/>
  </template>
  <template match="addressbook/address/pobox/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)"/>
  </template>
  <template match="addressbook/address/room">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)"/>
  </template>
  <template match="addressbook/address/room/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)"/>
  </template>
  <template match="addressbook/address/address-floor">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)"/>
  </template>
  <template match="addressbook/address/address-floor/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)"/>
  </template>
  <template match="addressbook/address/building">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)"/>
  </template>
  <template match="addressbook/address/building/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)"/>
  </template>
  <template match="addressbook/address/street">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)"/>
  </template>
  <template match="addressbook/address/street/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)"/>
  </template>
  <template match="addressbook/address/city">
    <apply-templates select="com:PublicationContact/com:CityName"/>
  </template>
  <template match="addressbook/address/county">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName"/>
  </template>
  <template match="addressbook/address/county/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName"/>
  </template>
  <template match="addressbook/address/state">
    <apply-templates select="com:PublicationContact/com:GeographicRegionName"/>
  </template>
  <template match="addressbook/address/state/text()">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)"/>
  </template>
  <template match="addressbook/address/postcode">
    <apply-templates select="com:PublicationContact/com:PostalCode"/>
  </template>
  <template match="addressbook/address/country">
    <apply-templates select="com:PublicationContact/com:CountryCode"/>
  </template>
  <template match="addressbook/address/text">
    <apply-templates select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText"/>
  </template>
  <template match="addressbook/phone">
    <apply-templates select="com:Contact/com:PhoneNumberBag/com:PhoneNumber"/>
  </template>
  <template match="addressbook/fax">
    <apply-templates select="com:Contact/com:FaxNumberBag/com:FaxNumber"/>
  </template>
  <template match="addressbook/email">
    <apply-templates select="com:Contact/com:EmailAddressBag/com:EmailAddressText"/>
  </template>
  <template match="addressbook/email/@email-purpose">
    <apply-templates select="com:Contact/com:EmailAddressBag/com:EmailAddressText/@com:emailAddressPurposeCategory"/>
  </template>
  <template match="addressbook/url">
    <apply-templates select="com:Contact/com:WebAddressBag/com:WebAddressURI"/>
  </template>
  <template match="addressbook/ead">
    <apply-templates select="com:Contact/com:OtherElectronicAddressBag"/>
  </template>
  <template match="parties">
    <apply-templates select="pat:PartyBag"/>
  </template>
  <template match="parties/applicants">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag"/>
  </template>
  <template match="parties/applicants/applicant">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant"/>
  </template>
  <template match="parties/applicants/applicant/@sequence">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/@pat:applicantSequenceNumberReference"/>
  </template>
  <template match="parties/applicants/applicant/@app-type">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:ApplicantCategory"/>
  </template>
  <template match="parties/applicants/applicant/@designation">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:DesignationCategory"/>
  </template>
  <template match="parties/applicants/applicant/addressbook">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:PublicationContact"/>
  </template>
  <template match="parties/applicants/applicant/nationality/country">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:NationalityCode"/>
  </template>
  <template match="parties/applicants/applicant/residence/country">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:ResidenceCountryCode"/>
  </template>
  <template match="parties/applicants/applicant/us-rights">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights"/>
  </template>
  <template match="parties/applicants/applicant/us-rights/@kind">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorCategory"/>
  </template>
  <template match="parties/applicants/applicant/us-rights/text()">
    <apply-templates select="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorRightsText"/>
  </template>
  <template match="parties/inventors">
    <apply-templates select="pat:PartyBag/pat:InventorBag"/>
  </template>
  <template match="parties/inventors/inventor">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor"/>
  </template>
  <template match="parties/inventors/inventor/@sequence">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/@com:sequenceNumber"/>
  </template>
  <template match="parties/inventors/inventor/@designation">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NewDesignationCountryCode"/>
  </template>
  <template match="parties/inventors/inventor/addressbook">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/com:PublicationContact"/>
  </template>
  <template match="parties/inventors/inventor/designated-states">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation"/>
  </template>
  <template match="parties/inventors/inventor/designated-states/country">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode"/>
  </template>
  <template match="parties/inventors/inventor/designated-states/region">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation"/>
  </template>
  <template match="parties/inventors/inventor/designated-states/region/country">
    <apply-templates select="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode"/>
  </template>
  <template match="parties/correspondence-address">
    <apply-templates select="pat:PartyBag/com:CorrespondenceAddress"/>
  </template>
  <template match="parties/correspondence-address/customer-number">
    <apply-templates select="pat:PartyBag/com:CorrespondenceAddress/com:PartyIdentifier"/>
  </template>
  <template match="parties/correspondence-address/addressbook">
    <apply-templates select="pat:PartyBag/com:CorrespondenceAddress/com:Contact"/>
  </template>
  <template match="parties/agents">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag"/>
  </template>
  <template match="parties/agents/customer-number">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerRegistrationNumber"/>
  </template>
  <template match="parties/agents/agent">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner"/>
  </template>
  <template match="parties/agents/agent/@sequence">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/@com:sequenceNumber"/>
  </template>
  <template match="parties/agents/agent/@rep-type">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory"/>
  </template>
  <template match="parties/agents/agent/addressbook">
    <apply-templates select="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:PublicationContact"/>
  </template>
  <template match="assignees">
    <apply-templates select="pat:PartyBag/pat:AssigneeBag"/>
  </template>
  <template match="assignees/assignee">
    <apply-templates select="pat:PartyBag/pat:AssigneeBag/pat:Assignee"/>
  </template>
  <template match="assignees/assignee/addressbook">
    <apply-templates select="pat:PartyBag/pat:AssigneeBag/pat:Assignee/com:PublicationContact"/>
  </template>
  <template match="examiners">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag"/>
  </template>
  <template match="examiners/primary-examiner">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer"/>
  </template>
  <template match="examiners/primary-examiner/name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationStandardName"/>
  </template>
  <template match="examiners/primary-examiner/prefix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix"/>
  </template>
  <template match="examiners/primary-examiner/last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/>
  </template>
  <template match="examiners/primary-examiner/orgname">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/primary-examiner/orgname/text()">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/primary-examiner/first-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>
  </template>
  <template match="examiners/primary-examiner/middle-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>
  </template>
  <template match="examiners/primary-examiner/first-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName"/>
  </template>
  <template match="examiners/primary-examiner/second-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName"/>
  </template>
  <template match="examiners/primary-examiner/suffix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix"/>
  </template>
  <template match="examiners/primary-examiner/role">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:EntityName/@com:entityNameCategory"/>
  </template>
  <template match="examiners/primary-examiner/synonym">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName"/>
  </template>
  <template match="examiners/primary-examiner/electronic-signature">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:ElectronicSignature"/>
  </template>
  <template match="examiners/assistant-examiner">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer"/>
  </template>
  <template match="examiners/assistant-examiner/name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonFullName"/>
  </template>
  <template match="examiners/assistant-examiner/prefix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix"/>
  </template>
  <template match="examiners/assistant-examiner/last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/>
  </template>
  <template match="examiners/assistant-examiner/orgname">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/assistant-examiner/orgname/text()">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/assistant-examiner/first-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>
  </template>
  <template match="examiners/assistant-examiner/middle-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>
  </template>
  <template match="examiners/assistant-examiner/first-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName"/>
  </template>
  <template match="examiners/assistant-examiner/second-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName"/>
  </template>
  <template match="examiners/assistant-examiner/suffix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix"/>
  </template>
  <template match="examiners/assistant-examiner/role">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:EntityName/@com:entityNameCategory"/>
  </template>
  <template match="examiners/assistant-examiner/synonym">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName"/>
  </template>
  <template match="examiners/assistant-examiner/electronic-signature">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:ElectronicSignature"/>
  </template>
  <template match="examiners/authorized-officer">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer"/>
  </template>
  <template match="examiners/authorized-officer/name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonFullName"/>
  </template>
  <template match="examiners/authorized-officer/prefix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix"/>
  </template>
  <template match="examiners/authorized-officer/last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/>
  </template>
  <template match="examiners/authorized-officer/orgname">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/authorized-officer/orgname/text()">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory"/>
  </template>
  <template match="examiners/authorized-officer/first-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>
  </template>
  <template match="examiners/authorized-officer/middle-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>
  </template>
  <template match="examiners/authorized-officer/first-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName"/>
  </template>
  <template match="examiners/authorized-officer/second-last-name">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName"/>
  </template>
  <template match="examiners/authorized-officer/suffix">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix"/>
  </template>
  <template match="examiners/authorized-officer/role">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:EntityName/@com:entityNameCategory"/>
  </template>
  <template match="examiners/authorized-officer/synonym">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName"/>
  </template>
  <template match="examiners/authorized-officer/phone">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:PhoneNumber"/>
  </template>
  <template match="examiners/authorized-officer/fax">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:FaxNumber"/>
  </template>
  <template match="examiners/authorized-officer/email">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:EmailAddressText"/>
  </template>
  <template match="examiners/authorized-officer/electronic-signature">
    <apply-templates select="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:ElectronicSignature"/>
  </template>
  <template match="invention-title">
    <apply-templates select="pat:InventionTitle"/>
  </template>
  <template match="invention-title/@id">
    <apply-templates select="pat:InventionTitle/@com:id"/>
  </template>
  <template match="invention-title/@lang">
    <apply-templates select="pat:InventionTitle/@com:languageCode"/>
  </template>
  <template match="invention-title/text()">
    <apply-templates select="pat:InventionTitle/text()"/>
  </template>
  <template match="invention-title/b">
    <apply-templates select="pat:InventionTitle/com:B"/>
  </template>
  <template match="invention-title/b/text()">
    <apply-templates select="pat:InventionTitle/com:B/text()"/>
  </template>
  <template match="invention-title/b/i">
    <apply-templates select="pat:InventionTitle/com:B/com:I"/>
  </template>
  <template match="invention-title/b/i/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:I/text()"/>
  </template>
  <template match="invention-title/b/u">
    <apply-templates select="pat:InventionTitle/com:B/com:U"/>
  </template>
  <template match="invention-title/b/u/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:U/text()"/>
  </template>
  <template match="invention-title/b/o">
    <apply-templates select="pat:InventionTitle/com:B/com:O"/>
  </template>
  <template match="invention-title/b/o/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:O/text()"/>
  </template>
  <template match="invention-title/b/smallcaps">
    <apply-templates select="pat:InventionTitle/com:B/com:SmallCapital"/>
  </template>
  <template match="invention-title/b/smallcaps/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:SmallCapital/text()"/>
  </template>
  <template match="invention-title/b/sup">
    <apply-templates select="pat:InventionTitle/com:B/com:Sup"/>
  </template>
  <template match="invention-title/b/sup/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:Sup/text()"/>
  </template>
  <template match="invention-title/b/sub">
    <apply-templates select="pat:InventionTitle/com:B/com:Sub"/>
  </template>
  <template match="invention-title/b/sub/text()">
    <apply-templates select="pat:InventionTitle/com:B/com:Sub/text()"/>
  </template>
  <template match="invention-title/i">
    <apply-templates select="pat:InventionTitle/com:I"/>
  </template>
  <template match="invention-title/i/text()">
    <apply-templates select="pat:InventionTitle/com:I/text()"/>
  </template>
  <template match="invention-title/u">
    <apply-templates select="pat:InventionTitle/com:U"/>
  </template>
  <template match="invention-title/u/text()">
    <apply-templates select="pat:InventionTitle/com:U/text()"/>
  </template>
  <template match="invention-title/o">
    <apply-templates select="pat:InventionTitle/com:O"/>
  </template>
  <template match="invention-title/o/text()">
    <apply-templates select="pat:InventionTitle/com:O/text()"/>
  </template>
  <template match="invention-title/sup">
    <apply-templates select="pat:InventionTitle/com:Sub"/>
  </template>
  <template match="invention-title/sup/text()">
    <apply-templates select="pat:InventionTitle/com:Sub/text()"/>
  </template>
  <template match="invention-title/sub">
    <apply-templates select="pat:InventionTitle/com:Sup"/>
  </template>
  <template match="invention-title/sub/text()">
    <apply-templates select="pat:InventionTitle/com:Sup/text()"/>
  </template>
  <template match="bio-deposit">
    <apply-templates select="com:BioDeposit"/>
  </template>
  <template match="bio-deposit/@id">
    <apply-templates select="com:BioDeposit/@com:id"/>
  </template>
  <template match="bio-deposit/@num">
    <apply-templates select="com:BioDeposit/@com:sequenceNumber"/>
  </template>
  <template match="bio-deposit/@url">
    <apply-templates select="com:BioDeposit/@com:sourceURI"/>
  </template>
  <template match="bio-deposit/depositary">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary"/>
  </template>
  <template match="bio-deposit/depositary/address">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress"/>
  </template>
  <template match="bio-deposit/depositary/address/address-1">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/address-1/text()">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/address-2">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-2/text()">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-3">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-3/text()">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-4">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-4/text()">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-5">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="bio-deposit/depositary/address/address-5/text()">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="bio-deposit/depositary/address/mailcode">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)"/>
  </template>
  <template match="bio-deposit/depositary/address/pobox">
    <apply-templates select="WIPO.poboxToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/pobox/text()">
    <apply-templates select="WIPO.poboxToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/room">
    <apply-templates select="WIPO.roomToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/room/text()">
    <apply-templates select="WIPO.roomToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/address-floor">
    <apply-templates select="WIPO.address-floorToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/address-floor/text()">
    <apply-templates select="WIPO.address-floorToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/building">
    <apply-templates select="WIPO.buildingToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/building/text()">
    <apply-templates select="WIPO.buildingToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/street">
    <apply-templates select="WIPO.streetToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/street/text()">
    <apply-templates select="WIPO.streetToAddressLineText"/>
  </template>
  <template match="bio-deposit/depositary/address/city">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName"/>
  </template>
  <template match="bio-deposit/depositary/address/county">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode"/>
  </template>
  <template match="bio-deposit/depositary/address/postcode">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode"/>
  </template>
  <template match="bio-deposit/depositary/address/country">
    <apply-templates select="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText/@com:languageCode"/>
  </template>
  <template match="bio-deposit/depositary/address/text">
    <apply-templates select="com:BioDeposit/com:BioDepositTermText/@com:languageCode"/>
  </template>
  <template match="bio-deposit/bio-accno">
    <apply-templates select="com:BioDeposit/com:BiologicalAccessionNumber"/>
  </template>
  <template match="bio-deposit/date">
    <apply-templates select="com:BioDeposit/com:BioDepositDate"/>
  </template>
  <template match="bio-deposit/term">
    <apply-templates select="com:BioDeposit/com:BioDepositTermText"/>
  </template>
  <template match="bio-deposit/dtext">
    <apply-templates select="com:BioDeposit/com:BioDepositText"/>
  </template>
  <template match="pct-or-regional-publishing-data">
    <apply-templates select="pat:InternationalPublishingData"/>
  </template>
  <template match="pct-or-regional-publishing-data/document-id">
    <apply-templates select="pat:InternationalPublishingData/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference/@id">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference/@com:id"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference/@country">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference/com:IPOfficeCode"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference/gazette-num">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteNumber"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference/date">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference/com:PublicationDate"/>
  </template>
  <template match="pct-or-regional-publishing-data/gazette-reference/text">
    <apply-templates select="pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteReferenceText"/>
  </template>
  <template match="name">
    <apply-templates select="com:OrganizationStandardName"/>
  </template>
  <template match="name/@name-type">
    <apply-templates select="com:OrganizationStandardName"/>
  </template>
  <template match="name/text()">
    <apply-templates select="com:OrganizationStandardName/text()"/>
  </template>
  <template match="orgname">
    <apply-templates select="com:OrganizationName"/>
  </template>
  <template match="orgname/text()">
    <apply-templates select="com:OrganizationName/com:OrganizationStandardName/text()"/>
  </template>
  <template match="state">
    <apply-templates select="com:GeographicRegionName"/>
  </template>
  <template match="address-2">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-5">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="county">
    <apply-templates select="com:GeographicRegionName"/>
  </template>
  <template match="address-3">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="pobox">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="room">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-floor">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="building">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="street">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-4">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-1">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="*[@bibliographic-data/@id]">
    <attribute name="pat:BibliographicData/@com:id" select="@bibliographic-data/@id"/>
  </template>
  <template match="*[@bibliographic-data/@country]">
    <attribute name="pat:BibliographicData/@com:officeCode" select="@bibliographic-data/@country"/>
  </template>
  <template match="*[@bibliographic-data/plain-language-designation/@lang]">
    <attribute name="pat:BibliographicData/pat:PlainLanguageDesignationText/@com:languageCode" select="@bibliographic-data/plain-language-designation/@lang"/>
  </template>
  <template match="*[@plain-language-designation/@lang]">
    <attribute name="pat:PlainLanguageDesignationText/@com:languageCode" select="@plain-language-designation/@lang"/>
  </template>
  <template match="*[@publication-reference/@id]">
    <attribute name="pat:PatentGrantIdentification/@com:id" select="@publication-reference/@id"/>
  </template>
  <template match="*[@classification-ipc/@id]">
    <attribute name="pat:IPCClassification/@com:id" select="@classification-ipc/@id"/>
  </template>
  <template match="*[@classification-ipcr/@id]">
    <attribute name="pat:IPCRClassification/@com:id" select="@classification-ipcr/@id"/>
  </template>
  <template match="*[@classification-ipcr/@sequence]">
    <attribute name="pat:IPCRClassification/@com:sequenceNumber" select="@classification-ipcr/@sequence"/>
  </template>
  <template match="*[@classification-national/@id]">
    <attribute name="pat:NationalClassification/@com:id" select="@classification-national/@id"/>
  </template>
  <template match="*[@classification-national/further-classification/@id]">
    <attribute name="pat:NationalClassification/pat:FurtherNationalClassification/@com:id" select="@classification-national/further-classification/@id"/>
  </template>
  <template match="*[@classification-locarno/@id]">
    <attribute name="com:LocarnoClassificationBag/@com:id" select="@classification-locarno/@id"/>
  </template>
  <template match="*[@priority-claims/priority-claim/@id]">
    <attribute name="pat:PriorityClaimBag/pat:PriorityClaim/@com:id" select="@priority-claims/priority-claim/@id"/>
  </template>
  <template match="*[@priority-claims/priority-claim/@sequence]">
    <attribute name="pat:PriorityClaimBag/pat:PriorityClaim/@com:sequenceNumber" select="@priority-claims/priority-claim/@sequence"/>
  </template>
  <template match="*[@priority-claims/priority-claim/@kind]">
    <attribute name="pat:PriorityClaimBag/pat:PriorityClaim/pat:ApplicationFilingCategory" select="@priority-claims/priority-claim/@kind"/>
  </template>
  <template match="*[@priority-claims/priority-claim/priority-doc-from-library/@library-identifier]">
    <attribute name="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@pat:libraryIdentifier" select="@priority-claims/priority-claim/priority-doc-from-library/@library-identifier"/>
  </template>
  <template match="*[@priority-claims/priority-claim/priority-doc-from-library/@action-by]">
    <attribute name="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@com:officeCode" select="@priority-claims/priority-claim/priority-doc-from-library/@action-by"/>
  </template>
  <template match="*[@designation-of-states/designation-pct/national/protection-request/@subset]">
    <attribute name="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/@pat:subsetIndicator" select="@designation-of-states/designation-pct/national/protection-request/@subset"/>
  </template>
  <template match="*[@licensee-data/attorney-or-agent/@rep-type]">
    <attribute name="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory" select="@licensee-data/attorney-or-agent/@rep-type"/>
  </template>
  <template match="*[@dates-of-public-availability/gazette-reference/@id]">
    <attribute name="pat:PublicAvailabilityDataBag/pat:GazetteReference/@com:id" select="@dates-of-public-availability/gazette-reference/@id"/>
  </template>
  <template match="*[@dates-of-public-availability/gazette-reference/@country]">
    <attribute name="pat:PublicAvailabilityDataBag/pat:GazetteReference/com:IPOfficeCode" select="@dates-of-public-availability/gazette-reference/@country"/>
  </template>
  <template match="*[@patent-family/@id]">
    <attribute name="pat:PatentFamily/@com:id" select="@patent-family/@id"/>
  </template>
  <template match="*[@field-of-search/classifications-ipcr/@id]">
    <attribute name="pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification" select="@field-of-search/classifications-ipcr/@id"/>
  </template>
  <template match="*[@references-cited/citation/@id]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/@com:id" select="@references-cited/citation/@id"/>
  </template>
  <template match="*[@references-cited/citation/patcit/@id]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:id" select="@references-cited/citation/patcit/@id"/>
  </template>
  <template match="*[@references-cited/citation/patcit/@num]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:sequenceNumber" select="@references-cited/citation/patcit/@num"/>
  </template>
  <template match="*[@references-cited/citation/patcit/document-id/@lang]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/@com:languageCode" select="@references-cited/citation/patcit/document-id/@lang"/>
  </template>
  <template match="*[@references-cited/citation/nplcit/@id]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:id" select="@references-cited/citation/nplcit/@id"/>
  </template>
  <template match="*[@references-cited/citation/nplcit/@num]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:sequenceNumber" select="@references-cited/citation/nplcit/@num"/>
  </template>
  <template match="*[@references-cited/citation/nplcit/@lang]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:languageCode" select="@references-cited/citation/nplcit/@lang"/>
  </template>
  <template match="*[@references-cited/citation/classification-national/@id]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/@com:id" select="@references-cited/citation/classification-national/@id"/>
  </template>
  <template match="*[@references-cited/citation/classification-national/further-classification/@id]">
    <attribute name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/@com:id" select="@references-cited/citation/classification-national/further-classification/@id"/>
  </template>
  <template match="*[@st50-republication/modifications/modified-bibliography/inid-code/@sequence]">
    <attribute name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/@com:sequenceNumber" select="@st50-republication/modifications/modified-bibliography/inid-code/@sequence"/>
  </template>
  <template match="*[@st50-republication/modifications/modified-part/@sequence]">
    <attribute name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:sequenceNumber" select="@st50-republication/modifications/modified-part/@sequence"/>
  </template>
  <template match="*[@st50-republication/modifications/modified-part/@lang]">
    <attribute name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:languageCode" select="@st50-republication/modifications/modified-part/@lang"/>
  </template>
  <template match="*[@st50-republication/republication-notes/republication-note/@sequence]">
    <attribute name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:sequenceNumber" select="@st50-republication/republication-notes/republication-note/@sequence"/>
  </template>
  <template match="*[@st50-republication/republication-notes/republication-note/@lang]">
    <attribute name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:languageCode" select="@st50-republication/republication-notes/republication-note/@lang"/>
  </template>
  <template match="*[@st50-republication/correction-notice/gazette-reference/@id]">
    <attribute name="pat:PatentDocumentRepublication/pat:GazetteReference/@com:id" select="@st50-republication/correction-notice/gazette-reference/@id"/>
  </template>
  <template match="*[@st50-republication/correction-notice/gazette-reference/@country]">
    <attribute name="pat:PatentDocumentRepublication/pat:GazetteReference/com:IPOfficeCode" select="@st50-republication/correction-notice/gazette-reference/@country"/>
  </template>
  <template match="*[@pct-or-regional-filing-data/document-id/@lang]">
    <attribute name="pat:InternationalFilingData/pat:ApplicationIdentification/com:FilingLanguageCode" select="@pct-or-regional-filing-data/document-id/@lang"/>
  </template>
  <template match="*[@application-reference/@id]">
    <attribute name="pat:ApplicationIdentification/@com:id" select="@application-reference/@id"/>
  </template>
  <template match="*[@application-reference/@appl-type]">
    <attribute name="pat:ApplicationIdentification/pat:InventionSubjectMatterCategory" select="@application-reference/@appl-type"/>
  </template>
  <template match="*[@electronic-signature/@date]">
    <attribute name="com:ElectronicSignature/com:ElectronicSignatureDate" select="@electronic-signature/@date"/>
  </template>
  <template match="*[@electronic-signature/@place-signed]">
    <attribute name="com:ElectronicSignature/com:ElectronicSignaturePlace" select="@electronic-signature/@place-signed"/>
  </template>
  <template match="*[@electronic-signature/basic-signature/fax-image/@file]">
    <attribute name="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureImageURI" select="@electronic-signature/basic-signature/fax-image/@file"/>
  </template>
  <template match="*[@addressbook/@lang]">
    <attribute name="com:Contact/@com:languageCode" select="@addressbook/@lang"/>
  </template>
  <template match="*[@addressbook/email/@email-purpose]">
    <attribute name="com:Contact/com:EmailAddressBag/com:EmailAddressText/@com:emailAddressPurposeCategory" select="@addressbook/email/@email-purpose"/>
  </template>
  <template match="*[@parties/applicants/applicant/@sequence]">
    <attribute name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/@pat:applicantSequenceNumberReference" select="@parties/applicants/applicant/@sequence"/>
  </template>
  <template match="*[@parties/applicants/applicant/@app-type]">
    <attribute name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:ApplicantCategory" select="@parties/applicants/applicant/@app-type"/>
  </template>
  <template match="*[@parties/applicants/applicant/@designation]">
    <attribute name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:DesignationCategory" select="@parties/applicants/applicant/@designation"/>
  </template>
  <template match="*[@parties/applicants/applicant/us-rights/@kind]">
    <attribute name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorCategory" select="@parties/applicants/applicant/us-rights/@kind"/>
  </template>
  <template match="*[@parties/inventors/inventor/@sequence]">
    <attribute name="pat:PartyBag/pat:InventorBag/pat:Inventor/@com:sequenceNumber" select="@parties/inventors/inventor/@sequence"/>
  </template>
  <template match="*[@parties/inventors/inventor/@designation]">
    <attribute name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NewDesignationCountryCode" select="@parties/inventors/inventor/@designation"/>
  </template>
  <template match="*[@parties/agents/agent/@sequence]">
    <attribute name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/@com:sequenceNumber" select="@parties/agents/agent/@sequence"/>
  </template>
  <template match="*[@parties/agents/agent/@rep-type]">
    <attribute name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory" select="@parties/agents/agent/@rep-type"/>
  </template>
  <template match="*[@invention-title/@id]">
    <attribute name="pat:InventionTitle/@com:id" select="@invention-title/@id"/>
  </template>
  <template match="*[@invention-title/@lang]">
    <attribute name="pat:InventionTitle/@com:languageCode" select="@invention-title/@lang"/>
  </template>
  <template match="*[@bio-deposit/@id]">
    <attribute name="com:BioDeposit/@com:id" select="@bio-deposit/@id"/>
  </template>
  <template match="*[@bio-deposit/@num]">
    <attribute name="com:BioDeposit/@com:sequenceNumber" select="@bio-deposit/@num"/>
  </template>
  <template match="*[@bio-deposit/@url]">
    <attribute name="com:BioDeposit/@com:sourceURI" select="@bio-deposit/@url"/>
  </template>
  <template match="*[@pct-or-regional-publishing-data/gazette-reference/@id]">
    <attribute name="pat:InternationalPublishingData/pat:GazetteReference/@com:id" select="@pct-or-regional-publishing-data/gazette-reference/@id"/>
  </template>
  <template match="*[@pct-or-regional-publishing-data/gazette-reference/@country]">
    <attribute name="pat:InternationalPublishingData/pat:GazetteReference/com:IPOfficeCode" select="@pct-or-regional-publishing-data/gazette-reference/@country"/>
  </template>
  <template match="*[@name/@name-type]">
    <attribute name="com:OrganizationStandardName" select="@name/@name-type"/>
  </template>
  <template match="*[text()=&quot;national&quot;]">
    <element name="National">National</element>
  </template>
  <template match="*[text()=&quot;regional&quot;]">
    <element name="Regional">Regional</element>
  </template>
  <template match="*[text()=&quot;international&quot;]">
    <element name="PCT">PCT</element>
  </template>
  <template match="*[text()=&quot;yes&quot;]">
    <element name="true">true</element>
  </template>
  <template match="*[text()=&quot;no&quot;]">
    <element name="false">false</element>
  </template>
  <template match="*[text()=&quot;agent&quot;]">
    <element name="Agent">Agent</element>
  </template>
  <template match="*[text()=&quot;attorney&quot;]">
    <element name="Attorney">Attorney</element>
  </template>
  <template match="*[text()=&quot;common-representative&quot;]">
    <element name="Common representative">Common representative</element>
  </template>
  <template match="*[text()=&quot;cited by applicant&quot;]">
    <element name="Applicant">Applicant</element>
  </template>
  <template match="*[text()=&quot;cited by examiner&quot;]">
    <element name="Examiner">Examiner</element>
  </template>
  <template match="*[text()=&quot;utility&quot;]">
    <element name="Utility">Utility</element>
  </template>
  <template match="*[text()=&quot;informal&quot;]">
    <element name="Informal">Informal</element>
  </template>
  <template match="*[text()=&quot;general&quot;]">
    <element name="General">General</element>
  </template>
  <template match="*[text()=&quot;advanced&quot;]">
    <element name="Advanced">Advanced</element>
  </template>
  <template match="*[text()=&quot;main&quot;]">
    <element name="Main">Main</element>
  </template>
  <template match="*[text()=&quot;applicant-inventor&quot;]">
    <element name="Applicant_Inventor">Applicant_Inventor</element>
  </template>
  <template match="*[text()=&quot;legal-representative&quot;]">
    <element name="Legal representative">Legal representative</element>
  </template>
  <template match="*[text()=&quot;otherwise&quot;]">
    <element name="Applicant">Applicant</element>
  </template>
  <template match="*[text()=&quot;heir&quot;]">
    <element name="Heir">Heir</element>
  </template>
  <template match="*[text()=&quot;heiress&quot;]">
    <element name="Heiress">Heiress</element>
  </template>
  <template match="*[text()=&quot;executor&quot;]">
    <element name="Executor">Executor</element>
  </template>
  <template match="*[text()=&quot;executrix&quot;]">
    <element name="Executrix">Executrix</element>
  </template>
  <template match="*[text()=&quot;estate&quot;]">
    <element name="Estate">Estate</element>
  </template>
  <template match="*[text()=&quot;administrator&quot;]">
    <element name="Administrator">Administrator</element>
  </template>
  <template match="*[text()=&quot;administratrix&quot;]">
    <element name="Administratrix">Administratrix</element>
  </template>
  <template match="*[text()=&quot;legal-representatives&quot;]">
    <element name="Legal representatives">Legal representatives</element>
  </template>
  <template match="*[text()=&quot;heirs&quot;]">
    <element name="Heirs">Heirs</element>
  </template>
  <template match="*[text()=&quot;executors&quot;]">
    <element name="Executors">Executors</element>
  </template>
  <template match="*[text()=&quot;legal-heirs&quot;]">
    <element name="Legal heirs">Legal heirs</element>
  </template>
  <template match="*[text()=&quot;all&quot;]">
    <element name="All">All</element>
  </template>
  <template match="*[text()=&quot;all-except-us&quot;]">
    <element name="All except US">All except US</element>
  </template>
  <template match="*[text()=&quot;us-only&quot;]">
    <element name="US only">US only</element>
  </template>
  <template match="*[text()=&quot;as-indicated&quot;]">
    <element name="As indicated">As indicated</element>
  </template>
</stylesheet>
