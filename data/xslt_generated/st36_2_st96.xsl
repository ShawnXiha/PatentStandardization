
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent"
    xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">

    <xsl:template match="/">
        <pat:PatentPublication>
            <xsl:apply-templates select="patent-document"/>
        </pat:PatentPublication>
    </xsl:template>

    
    <xsl:template match="patent-document/bibliographic-data">
        <xsl:element name="{'pat:PatentPublication/pat:BibliographicData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/@id">
        <xsl:element name="{'pat:BibliographicData/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/@country">
        <xsl:element name="{'pat:BibliographicData/@com:officeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/plain-language-designation">
        <xsl:element name="{'pat:BibliographicData/pat:PlainLanguageDesignationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/plain-language-designation/@lang">
        <xsl:element name="{'pat:BibliographicData/pat:PlainLanguageDesignationText/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/publication-reference">
        <xsl:element name="{'pat:BibliographicData/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/classification-ipc">
        <xsl:element name="{'pat:BibliographicData/pat:PatentClassificationBag/pat:IPCClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/classifications-ipcr">
        <xsl:element name="{'pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/classifications-ipcr/classification-ipcr">
        <xsl:element name="{'pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/classification-national">
        <xsl:element name="{'pat:BibliographicData/pat:PatentClassificationBag/pat:NationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/classification-locarno">
        <xsl:element name="{'pat:BibliographicData/pat:PatentClassificationBag/com:LocarnoClassificationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/application-reference">
        <xsl:element name="{'pat:BibliographicData/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/language-of-filing">
        <xsl:element name="{'pat:BibliographicData/com:FilingLanguageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/language-of-publication">
        <xsl:element name="{'pat:BibliographicData/com:PublicationLanguageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/priority-claims">
        <xsl:element name="{'pat:BibliographicData/pat:PriorityClaimBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/parties">
        <xsl:element name="{'pat:BibliographicData/pat:PartyBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/designation-of-states">
        <xsl:element name="{'pat:BibliographicData/pat:StateDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/invention-title">
        <xsl:element name="{'pat:BibliographicData/pat:InventionTitleBag/pat:InventionTitle/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/assignees">
        <xsl:element name="{'pat:BibliographicData/pat:PartyBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/licensee-data">
        <xsl:element name="{'pat:BibliographicData/pat:LicenceBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-of-earliest-priority">
        <xsl:element name="{'pat:BibliographicData/pat:EarliestPriorityApplication/pat:FilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-complete-specification-filed">
        <xsl:element name="{'pat:BibliographicData/pat:CompleteSpecificationFilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/dates-of-public-availability">
        <xsl:element name="{'pat:BibliographicData/pat:PublicAvailabilityDataBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/term-of-grant">
        <xsl:element name="{'pat:BibliographicData/pat:GrantTerm': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/dates-rights-effective">
        <xsl:element name="{'pat:BibliographicData/pat:RightsEffectiveDateBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/patent-family">
        <xsl:element name="{'pat:BibliographicData/pat:PatentFamily': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/field-of-search">
        <xsl:element name="{'pat:BibliographicData/pat:SearchField': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/figures">
        <xsl:element name="{'pat:BibliographicData/pat:FigureBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/references-cited">
        <xsl:element name="{'pat:BibliographicData/pat:ReferenceCitationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/examiners">
        <xsl:element name="{'pat:BibliographicData/pat:PartyBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/number-of-claims">
        <xsl:element name="{'pat:BibliographicData/pat:ClaimTotalQuantity': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/related-documents">
        <xsl:element name="{'pat:BibliographicData/pat:RelatedDocumentBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/st50-republication">
        <xsl:element name="{'pat:BibliographicData/pat:PatentDocumentRepublication': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-exhibition-filed">
        <xsl:element name="{'pat:BibliographicData/pat:ExhibitionFilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-pct-article-22-39-fulfilled/date">
        <xsl:element name="{'pat:BibliographicData/pat:PCTNationalPhaseEntryDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/bio-deposit">
        <xsl:element name="{'pat:BibliographicData/com:BioDeposit': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/pct-or-regional-filing-data">
        <xsl:element name="{'pat:BibliographicData/pat:InternationalFilingData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/pct-or-regional-publishing-data">
        <xsl:element name="{'pat:BibliographicData/pat:InternationalPublishingData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-rights-reestablished">
        <xsl:element name="{'pat:BibliographicData/pat:RightsReestablishedDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-application-withdrawn-by-applicant">
        <xsl:element name="{'pat:BibliographicData/pat:ApplicationWithdrawnDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-application-deemed-withdrawn">
        <xsl:element name="{'pat:BibliographicData/pat:ApplicationDeemedWithdrawnDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-of-revocation">
        <xsl:element name="{'pat:BibliographicData/pat:PatentRevocationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/date-application-partially-withdrawn/date">
        <xsl:element name="{'pat:BibliographicData/pat:ApplicationPartiallyWithdrawnDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliographic-data/opposition-data">
        <xsl:element name="{'pat:BibliographicData/pat:OppositionData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="plain-language-designation">
        <xsl:element name="{'pat:PlainLanguageDesignationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="plain-language-designation/@lang">
        <xsl:element name="{'pat:PlainLanguageDesignationText/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference">
        <xsl:element name="{'pat:PatentGrantIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference/@id">
        <xsl:element name="{'pat:PatentGrantIdentification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference/document-id/country">
        <xsl:element name="{'pat:PatentGrantIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference/document-id/doc-number">
        <xsl:element name="{'pat:PatentGrantIdentification/pat:PatentNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference/document-id/kind">
        <xsl:element name="{'pat:PatentGrantIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="publication-reference/document-id/date">
        <xsl:element name="{'pat:PatentGrantIdentification/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}IssueDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipc">
        <xsl:element name="{'pat:IPCClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipc/@id">
        <xsl:element name="{'pat:IPCClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipc/edition">
        <xsl:element name="{'pat:IPCClassification/com:Edition': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipc/main-classification">
        <xsl:element name="{'pat:IPCClassification/pat:MainClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipc/further-classification">
        <xsl:element name="{'pat:IPCClassification/pat:FurtherClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr">
        <xsl:element name="{'pat:IPCRClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/@id">
        <xsl:element name="{'pat:IPCRClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/@sequence">
        <xsl:element name="{'pat:IPCRClassification/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/ipc-version-indicator/date">
        <xsl:element name="{'pat:IPCRClassification/pat:ClassificationVersionDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/classification-level">
        <xsl:element name="{'pat:IPCRClassification/pat:PatentClassificationLevelCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/section">
        <xsl:element name="{'pat:IPCRClassification/pat:Section': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/class">
        <xsl:element name="{'pat:IPCRClassification/pat:Class': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/subclass">
        <xsl:element name="{'pat:IPCRClassification/pat:Subclass': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/main-group">
        <xsl:element name="{'pat:IPCRClassification/pat:MainGroup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/subgroup">
        <xsl:element name="{'pat:IPCRClassification/pat:Subgroup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/symbol-position">
        <xsl:element name="{'pat:IPCRClassification/com:SymbolPositionCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/classification-value">
        <xsl:element name="{'pat:IPCRClassification/pat:IPCClassificationValueCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/action-date/date">
        <xsl:element name="{'pat:IPCRClassification/pat:ActionDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/generating-office/country">
        <xsl:element name="{'pat:IPCRClassification/pat:GeneratingOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/classification-status">
        <xsl:element name="{'pat:IPCRClassification/pat:IPCClassificationStatusCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/classification-data-source">
        <xsl:element name="{'pat:IPCRClassification/pat:PatentClassificationDataSourceCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-ipcr/text">
        <xsl:element name="{'pat:IPCRClassification/pat:PatentClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national">
        <xsl:element name="{'pat:NationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/@id">
        <xsl:element name="{'pat:NationalClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/country">
        <xsl:element name="{'pat:NationalClassification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/edition">
        <xsl:element name="{'pat:NationalClassification/com:Edition': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/main-classification">
        <xsl:element name="{'pat:NationalClassification/pat:MainNationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/main-classification/text()">
        <xsl:element name="{'pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/further-classification">
        <xsl:element name="{'pat:NationalClassification/pat:FurtherNationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/further-classification/@id">
        <xsl:element name="{'pat:NationalClassification/pat:FurtherNationalClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-national/further-classification/text()">
        <xsl:element name="{'pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno">
        <xsl:element name="{'com:LocarnoClassificationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno/@id">
        <xsl:element name="{'com:LocarnoClassificationBag/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno/edition">
        <xsl:element name="{'com:LocarnoClassificationBag/com:LocarnoClassificationEdition': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno/edition/text()">
        <xsl:element name="{'com:LocarnoClassificationBag/com:LocarnoClassificationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno/main-classification">
        <xsl:element name="{'com:LocarnoClassificationBag/com:LocarnoClassification/com:LocarnoClass': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="classification-locarno/text">
        <xsl:element name="{'com:LocarnoClassificationBag/com:LocarnoClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims">
        <xsl:element name="{'pat:PriorityClaimBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/@id">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/@sequence">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/@kind">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:ApplicationFilingCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/country">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/doc-number">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/doc-number/text()">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/date">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:FilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/priority-doc-requested">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:RequestedPriorityDocumentIndicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/priority-doc-attached">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:AttachedPriorityDocumentIndicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/priority-doc-from-library">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/priority-doc-from-library/@library-identifier">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@pat:libraryIdentifier': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="priority-claims/priority-claim/priority-doc-from-library/@action-by">
        <xsl:element name="{'pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@com:officeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct">
        <xsl:element name="{'pat:StateDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/regional">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/regional/region/country">
        <xsl:element name="{'pat:StateDesignation/pat:RegionalDesignation/pat:RegionalOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/regional/country">
        <xsl:element name="{'pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national">
        <xsl:element name="{'pat:StateDesignation/pat:RegionalDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national/country">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national/country/text()">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national/protection-request/@subset">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/@pat:subsetIndicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national/protection-request/kind-of-protection">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:ProtectionCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/national/protection-request/document-id">
        <xsl:element name="{'pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation-of-states/designation-pct/new-designation-country">
        <xsl:element name="{'pat:StateDesignation/pat:NewDesignationCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:LicenseeBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/licensee">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/licensee/addressbook">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee/com:Contact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/attorney-or-agent">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/attorney-or-agent/@rep-type">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/attorney-or-agent/addressbook">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:Contact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/effective-in">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/com:EffectiveCountryBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="licensee-data/effective-in/country">
        <xsl:element name="{'pat:LicenceBag/pat:Licence/com:EffectiveCountryBag/com:CountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability">
        <xsl:element name="{'pat:PublicAvailabilityDataBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference/@id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference/@country">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference/gazette-num">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference/gazette-num/text()">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference/com:PublicationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/gazette-reference/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteReferenceText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-printed-without-grant">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-printed-without-grant/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/examined-printed-without-grant/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/claims-only-available">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/claims-only-available/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/claims-only-available/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/not-printed-with-grant">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/not-printed-with-grant/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant/pat:PatentDocumentIdentification/pat:PatentGrantIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/invalidation-of-patent">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:PatentInvalidation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/invalidation-of-patent/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:PatentInvalidation/pat:PatentDocumentIdentification/pat:PatentGrantIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/printed-as-amended">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/printed-as-amended/document-id">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-of-public-availability/printed-as-amended/text">
        <xsl:element name="{'pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/com:CommentText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant">
        <xsl:element name="{'pat:GrantTerm': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant/disclaimer">
        <xsl:element name="{'pat:GrantTerm/pat:TerminalDisclaimer': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant/disclaimer/date">
        <xsl:element name="{'pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant/disclaimer/text">
        <xsl:element name="{'pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant/length-of-grant">
        <xsl:element name="{'pat:GrantTerm/pat:GrantLengthQuantity': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term-of-grant/lapse-of-patent">
        <xsl:element name="{'pat:GrantTerm/pat:PatentTermLapseQuantity': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective">
        <xsl:element name="{'pat:RightsEffectiveDateBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/request-for-examination/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/com:ExaminationRequestDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/first-examination-report-despatched/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:FirstDespatchedExaminationReportDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/patent-maintained-as-amended/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:PatentMaintainedAsAmendedDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/pat:NationalApplicationConversionRequestDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application/country">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/proceedings-suspended/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:ProceedingsSuspensionDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/proceedings-interrupted/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:ProceedingsInterruptionDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/proceedings-resumed/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:ProceedingsResumptionDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/notification-of-rights-after-appeal/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:AfterAppealRightsNotificationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dates-rights-effective/date-entering-into-force/date">
        <xsl:element name="{'pat:RightsEffectiveDateBag/pat:EnteredIntoForceDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family">
        <xsl:element name="{'pat:PatentFamily': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/@id">
        <xsl:element name="{'pat:PatentFamily/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/priority-application">
        <xsl:element name="{'pat:PatentFamily/pat:PriorityApplication': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/priority-application/document-id">
        <xsl:element name="{'pat:PatentFamily/pat:PriorityApplication/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/family-member">
        <xsl:element name="{'pat:PatentFamily/pat:PatentFamilyMember': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/family-member/document-id">
        <xsl:element name="{'pat:PatentFamily/pat:PatentFamilyMember/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-family/text">
        <xsl:element name="{'pat:PatentFamily/pat:PatentFamilyText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document-id">
        <xsl:element name="{'pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document-id/country">
        <xsl:element name="{'pat:PatentGrantIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document-id/doc-number">
        <xsl:element name="{'pat:PatentGrantIdentification/pat:PatentNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document-id/kind">
        <xsl:element name="{'pat:PatentGrantIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="document-id/date">
        <xsl:element name="{'pat:PatentGrantIdentification/pat:GrantDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="field-of-search">
        <xsl:element name="{'pat:SearchField': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="field-of-search/classification-ipc">
        <xsl:element name="{'pat:SearchField/pat:PatentClassificationBag/pat:IPCClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="field-of-search/classifications-ipcr">
        <xsl:element name="{'pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="field-of-search/classifications-ipcr/@id">
        <xsl:element name="{'pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="field-of-search/classification-national">
        <xsl:element name="{'pat:SearchField/pat:PatentClassificationBag/pat:NationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figures">
        <xsl:element name="{'pat:FigureBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figures/number-of-drawing-sheets/text()">
        <xsl:element name="{'pat:FigureBag/pat:DrawingSheetTotalQuantity': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figures/number-of-figures/text()">
        <xsl:element name="{'pat:FigureBag/pat:FigureTotalQuantity': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figures/figure-to-publish">
        <xsl:element name="{'pat:FigureBag/pat:PublishFigure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figures/figure-to-publish/fig-number/text()">
        <xsl:element name="{'pat:FigureBag/pat:PublishFigure/pat:FigureNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited">
        <xsl:element name="{'pat:ReferenceCitationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/@id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/@id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/@num">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/text">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:PatentCitationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/@lang">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/country">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/doc-number">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/kind">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/name">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:EntityName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/patcit/document-id/date">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/@id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/@num">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/@lang">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/article">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedJournalArticle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/book">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/book/notes">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook/com:Notes': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/nplcit/othercit">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:NPLCitationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/text">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRangeText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/passage">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeStart': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/passage/text()">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeEnd': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/category">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:CitationCategoryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/rel-claims">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/rel-passage/rel-claims/text()">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimRange/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimEndNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/category/text()">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/@pat:citingPartyCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/@id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/country">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/edition">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:Edition': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/main-classification">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/main-classification/text()">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/further-classification">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/further-classification/@id">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="references-cited/citation/classification-national/further-classification/text()">
        <xsl:element name="{'pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication">
        <xsl:element name="{'pat:PatentDocumentRepublication': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/republication-code">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/cancellation-date">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationCancellationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-bibliography">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-bibliography/inid-code">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/pat:PatentINIDCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-bibliography/inid-code/@sequence">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-part">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-part/@sequence">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-part/@lang">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-part/modified-part-name">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedPartCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/modifications/modified-part/modified-item">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedItemText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/republication-notes">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/republication-notes/republication-note">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/republication-notes/republication-note/@sequence">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/republication-notes/republication-note/@lang">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference/@id">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference/@country">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference/gazette-num">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference/date">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference/com:PublicationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="st50-republication/correction-notice/gazette-reference/text">
        <xsl:element name="{'pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteReferenceText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents">
        <xsl:element name="{'pat:RelatedDocumentBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc/parent-status">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:ParentDocumentStatusCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc/parent-grant-document/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc/parent-pct-document">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/parent-doc/parent-pct-document/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/child-doc">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/addition/relation/child-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/division">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Division': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/parent-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/parent-doc/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/parent-doc/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/child-doc">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/child-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/child-doc/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation/relation/child-doc/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/document-id/date">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/pat:FilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-status">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:ParentDocumentStatusCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:PatentNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/kind">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/date">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:GrantDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/child-doc">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/child-doc/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/child-doc/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuation-in-part/relation/child-doc/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/continuing-reissue">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:ContinuingReissue': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/reissue">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Reissue': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/reexamination">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Reexamination': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/substitution">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Substitution': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/utility-model-basis">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:UtilityModelBasis': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/correction">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:Correction': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication/document-id">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication/document-id/country">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication/document-id/doc-number">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/pat:PublicationNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication/document-id/kind">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="related-documents/related-publication/document-id/date">
        <xsl:element name="{'pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PublicationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data">
        <xsl:element name="{'pat:InternationalFilingData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data/document-id/country">
        <xsl:element name="{'pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data/document-id/doc-number">
        <xsl:element name="{'pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data/document-id/date">
        <xsl:element name="{'pat:InternationalFilingData/pat:ApplicationIdentification/pat:FilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data/us-371c124-date/date">
        <xsl:element name="{'pat:InternationalFilingData/pat:NationalStageFilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-filing-data/document-id/@lang">
        <xsl:element name="{'pat:InternationalFilingData/pat:ApplicationIdentification/com:FilingLanguageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference">
        <xsl:element name="{'pat:ApplicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference/@id">
        <xsl:element name="{'pat:ApplicationIdentification/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference/@appl-type">
        <xsl:element name="{'pat:ApplicationIdentification/pat:InventionSubjectMatterCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference/document-id/country">
        <xsl:element name="{'pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference/document-id/doc-number">
        <xsl:element name="{'pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="application-reference/document-id/date">
        <xsl:element name="{'pat:ApplicationIdentification/pat:FilingDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature">
        <xsl:element name="{'com:ElectronicSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/@date">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicSignatureDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/@place-signed">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicSignaturePlace': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/basic-signature">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicBasicSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/basic-signature/fax-image/@file">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureImageURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/basic-signature/text-string">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/basic-signature/click-wrap">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureClickWrap': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/enhanced-signature">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicEnhancedSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="electronic-signature/enhanced-signature/pkcs7">
        <xsl:element name="{'com:ElectronicSignature/com:ElectronicEnhancedSignature/@com:pkcs7Indicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook">
        <xsl:element name="{'com:PublicationContact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/@lang">
        <xsl:element name="{'com:Contact/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:EntityName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/prefix">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/last-name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/orgname">
        <xsl:element name="{'com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/orgname/text()">
        <xsl:element name="{'com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/first-name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/middle-name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/first-last-name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/second-last-name">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/suffix">
        <xsl:element name="{'com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/role">
        <xsl:element name="{'com:Contact/com:Name/com:EntityName/@com:entityNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-1">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-1/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-2">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-2/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-3">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-3/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-4">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-4/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-5">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-5/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/mailcode">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/pobox">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/pobox/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/room">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/room/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-floor">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/address-floor/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/building">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/building/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/street">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/street/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/city">
        <xsl:element name="{'com:PublicationContact/com:CityName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/county">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/county/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/state">
        <xsl:element name="{'com:PublicationContact/com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/state/text()">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/postcode">
        <xsl:element name="{'com:PublicationContact/com:PostalCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/country">
        <xsl:element name="{'com:PublicationContact/com:CountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/address/text">
        <xsl:element name="{'com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/phone">
        <xsl:element name="{'com:Contact/com:PhoneNumberBag/com:PhoneNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/fax">
        <xsl:element name="{'com:Contact/com:FaxNumberBag/com:FaxNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/email">
        <xsl:element name="{'com:Contact/com:EmailAddressBag/com:EmailAddressText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/email/@email-purpose">
        <xsl:element name="{'com:Contact/com:EmailAddressBag/com:EmailAddressText/@com:emailAddressPurposeCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/url">
        <xsl:element name="{'com:Contact/com:WebAddressBag/com:WebAddressURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="addressbook/ead">
        <xsl:element name="{'com:Contact/com:OtherElectronicAddressBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties">
        <xsl:element name="{'pat:PartyBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/@sequence">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/@pat:applicantSequenceNumberReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/@app-type">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:ApplicantCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/@designation">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:DesignationCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/addressbook">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:PublicationContact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/nationality/country">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:NationalityCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/residence/country">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:ResidenceCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/us-rights">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/us-rights/@kind">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/applicants/applicant/us-rights/text()">
        <xsl:element name="{'pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorRightsText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/@sequence">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/@designation">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NewDesignationCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/addressbook">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/com:PublicationContact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/designated-states">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/designated-states/country">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/designated-states/region">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/inventors/inventor/designated-states/region/country">
        <xsl:element name="{'pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/correspondence-address">
        <xsl:element name="{'pat:PartyBag/com:CorrespondenceAddress': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/correspondence-address/customer-number">
        <xsl:element name="{'pat:PartyBag/com:CorrespondenceAddress/com:PartyIdentifier': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/correspondence-address/addressbook">
        <xsl:element name="{'pat:PartyBag/com:CorrespondenceAddress/com:Contact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents/customer-number">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerRegistrationNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents/agent">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents/agent/@sequence">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents/agent/@rep-type">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="parties/agents/agent/addressbook">
        <xsl:element name="{'pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:PublicationContact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="assignees">
        <xsl:element name="{'pat:PartyBag/pat:AssigneeBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="assignees/assignee">
        <xsl:element name="{'pat:PartyBag/pat:AssigneeBag/pat:Assignee': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="assignees/assignee/addressbook">
        <xsl:element name="{'pat:PartyBag/pat:AssigneeBag/pat:Assignee/com:PublicationContact': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationStandardName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/prefix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/orgname">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/orgname/text()">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/first-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/middle-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/first-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/second-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/suffix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/role">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:EntityName/@com:entityNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/synonym">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/primary-examiner/electronic-signature">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:ElectronicSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonFullName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/prefix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/orgname">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/orgname/text()">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/first-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/middle-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/first-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/second-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/suffix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/role">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:EntityName/@com:entityNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/synonym">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/assistant-examiner/electronic-signature">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:ElectronicSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonFullName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/prefix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/orgname">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/orgname/text()">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/first-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/middle-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/first-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/second-last-name">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/suffix">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/role">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:EntityName/@com:entityNameCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/synonym">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/phone">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:PhoneNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/fax">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:FaxNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/email">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:EmailAddressText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="examiners/authorized-officer/electronic-signature">
        <xsl:element name="{'pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:ElectronicSignature': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title">
        <xsl:element name="{'pat:InventionTitle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/@id">
        <xsl:element name="{'pat:InventionTitle/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/@lang">
        <xsl:element name="{'pat:InventionTitle/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/text()">
        <xsl:element name="{'pat:InventionTitle/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b">
        <xsl:element name="{'pat:InventionTitle/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/i">
        <xsl:element name="{'pat:InventionTitle/com:B/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/i/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/u">
        <xsl:element name="{'pat:InventionTitle/com:B/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/u/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/o">
        <xsl:element name="{'pat:InventionTitle/com:B/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/o/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/smallcaps">
        <xsl:element name="{'pat:InventionTitle/com:B/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/smallcaps/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/sup">
        <xsl:element name="{'pat:InventionTitle/com:B/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/sup/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/sub">
        <xsl:element name="{'pat:InventionTitle/com:B/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/b/sub/text()">
        <xsl:element name="{'pat:InventionTitle/com:B/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/i">
        <xsl:element name="{'pat:InventionTitle/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/i/text()">
        <xsl:element name="{'pat:InventionTitle/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/u">
        <xsl:element name="{'pat:InventionTitle/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/u/text()">
        <xsl:element name="{'pat:InventionTitle/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/o">
        <xsl:element name="{'pat:InventionTitle/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/o/text()">
        <xsl:element name="{'pat:InventionTitle/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/sup">
        <xsl:element name="{'pat:InventionTitle/com:Sub': True, 'pat:InventionTitle/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/sup/text()">
        <xsl:element name="{'pat:InventionTitle/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/sub">
        <xsl:element name="{'pat:InventionTitle/com:Sup': True, 'pat:InventionTitle/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="invention-title/sub/text()">
        <xsl:element name="{'pat:InventionTitle/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit">
        <xsl:element name="{'com:BioDeposit': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/@id">
        <xsl:element name="{'com:BioDeposit/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/@num">
        <xsl:element name="{'com:BioDeposit/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/@url">
        <xsl:element name="{'com:BioDeposit/@com:sourceURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-1">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-1/text()">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-2">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-2/text()">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-3">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-3/text()">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-4">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-4/text()">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-5">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-5/text()">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/mailcode">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/pobox">
        <xsl:element name="{'WIPO.poboxToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/pobox/text()">
        <xsl:element name="{'WIPO.poboxToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/room">
        <xsl:element name="{'WIPO.roomToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/room/text()">
        <xsl:element name="{'WIPO.roomToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-floor">
        <xsl:element name="{'WIPO.address-floorToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/address-floor/text()">
        <xsl:element name="{'WIPO.address-floorToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/building">
        <xsl:element name="{'WIPO.buildingToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/building/text()">
        <xsl:element name="{'WIPO.buildingToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/street">
        <xsl:element name="{'WIPO.streetToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/street/text()">
        <xsl:element name="{'WIPO.streetToAddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/city">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/county">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/postcode">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/country">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/depositary/address/text">
        <xsl:element name="{'com:BioDeposit/com:BioDepositTermText/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/bio-accno">
        <xsl:element name="{'com:BioDeposit/com:BiologicalAccessionNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/date">
        <xsl:element name="{'com:BioDeposit/com:BioDepositDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/term">
        <xsl:element name="{'com:BioDeposit/com:BioDepositTermText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bio-deposit/dtext">
        <xsl:element name="{'com:BioDeposit/com:BioDepositText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data">
        <xsl:element name="{'pat:InternationalPublishingData': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/document-id">
        <xsl:element name="{'pat:InternationalPublishingData/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference/@id">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference/@country">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference/gazette-num">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference/date">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference/com:PublicationDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pct-or-regional-publishing-data/gazette-reference/text">
        <xsl:element name="{'pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteReferenceText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name">
        <xsl:element name="{'com:OrganizationStandardName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name/@name-type">
        <xsl:element name="{'com:OrganizationStandardName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="name/text()">
        <xsl:element name="{'com:OrganizationStandardName/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orgname">
        <xsl:element name="{'com:OrganizationName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orgname/text()">
        <xsl:element name="{'com:OrganizationName/com:OrganizationStandardName/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="state">
        <xsl:element name="{'com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-2">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-5">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="county">
        <xsl:element name="{'com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-3">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pobox">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="room">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-floor">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="building">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="street">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-4">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address-1">
        <xsl:element name="{'com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/@lang">
        <xsl:element name="{'pat:PatentPublication/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/@file">
        <xsl:element name="{'pat:PatentPublication/@com:documentFileName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/@file-reference-id">
        <xsl:element name="{'pat:PatentPublication/@com:fileReferenceIdentifier': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/@country">
        <xsl:element name="{'pat:PatentPublication/@com:receivingOffice': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/@status">
        <xsl:element name="{'pat:PatentPublication/@pat:applicationBodyStatus': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/doc-page">
        <xsl:element name="{'pat:PatentPublication/pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description">
        <xsl:element name="{'pat:PatentPublication/pat:Description': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/@lang">
        <xsl:element name="{'pat:PatentPublication/pat:Description/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/doc-page">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/invention-title">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionTitle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/technical-field">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:TechnicalField': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/technical-field/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:TechnicalField/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/technical-field/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:TechnicalField/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/technical-field/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:TechnicalField/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/background-art">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BackgroundArt': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/background-art/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BackgroundArt/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/background-art/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BackgroundArt/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/background-art/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BackgroundArt/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-problem">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-problem/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-problem/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-problem/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-solution">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-solution/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-solution/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/tech-solution/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/advantageous-effects">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/advantageous-effects/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/advantageous-effects/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/advantageous-effects/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/disclosure/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:Disclosure/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-problem">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-problem/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-problem/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-problem/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-solution">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-solution/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-solution/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/tech-solution/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/advantageous-effects">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/advantageous-effects/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/advantageous-effects/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/advantageous-effects/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/summary-of-invention/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionSummary/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-drawings">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DrawingDescription': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-drawings/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DrawingDescription/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-drawings/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DrawingDescription/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-drawings/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DrawingDescription/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/embodiments-example">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/embodiments-example/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/embodiments-example/@ex-num">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@pat:exampleNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/embodiments-example/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/embodiments-example/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/description-of-embodiments/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:EmbodimentDescription/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/best-mode">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BestMode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/best-mode/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BestMode/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/best-mode/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BestMode/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/best-mode/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:BestMode/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/mode-for-invention">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionMode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/mode-for-invention/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionMode/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/mode-for-invention/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionMode/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/mode-for-invention/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:InventionMode/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/industrial-applicability">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:IndustrialApplicability': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/industrial-applicability/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:IndustrialApplicability/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/industrial-applicability/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:IndustrialApplicability/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/industrial-applicability/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:IndustrialApplicability/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-signs-list">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:ReferenceSignBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-signs-list/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:ReferenceSignBag/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-signs-list/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:ReferenceSignBag/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-signs-list/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:ReferenceSignBag/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-to-deposited-biological-material">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-to-deposited-biological-material/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-to-deposited-biological-material/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/reference-to-deposited-biological-material/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/sequence-list-text">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:SequenceListText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/sequence-list-text/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:SequenceListText/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/sequence-list-text/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:SequenceListText/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/sequence-list-text/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/pat:SequenceListText/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/patent-literature">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/patent-literature/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/patent-literature/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/non-patent-literature">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/non-patent-literature/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/non-patent-literature/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/citation-list/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:CitationBag/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/@level">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/b">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/b/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/i">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/i/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/u">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/u/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/o">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/o/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/sup">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/sup/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/sub">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/sub/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/smallcaps">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/heading/smallcaps/text()">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:Heading/com:Del/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/description/p">
        <xsl:element name="{'pat:PatentPublication/pat:Description/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/claims">
        <xsl:element name="{'pat:PatentPublication/pat:Claims/pat:Claim': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/claims/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Claims/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/abstract">
        <xsl:element name="{'pat:PatentPublication/pat:Abstract': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/abstract/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Abstract/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/abstract/@lang">
        <xsl:element name="{'pat:PatentPublication/pat:Abstract/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/abstract/doc-page">
        <xsl:element name="{'pat:PatentPublication/pat:Abstract/pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/abstract/p">
        <xsl:element name="{'pat:PatentPublication/pat:Abstract/com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/drawings">
        <xsl:element name="{'pat:PatentPublication/pat:Drawings': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/drawings/@id">
        <xsl:element name="{'pat:PatentPublication/pat:Drawings/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/drawings/doc-page">
        <xsl:element name="{'pat:PatentPublication/pat:Drawings/pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patent-document/drawings/figure">
        <xsl:element name="{'pat:PatentPublication/pat:Drawings/pat:Figure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b">
        <xsl:element name="{'com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/text()">
        <xsl:element name="{'com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i">
        <xsl:element name="{'com:B/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/text()">
        <xsl:element name="{'com:B/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/b">
        <xsl:element name="{'com:B/com:I/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/b/text()">
        <xsl:element name="{'com:B/com:I/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/u">
        <xsl:element name="{'com:B/com:I/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/u/text()">
        <xsl:element name="{'com:B/com:I/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/o">
        <xsl:element name="{'com:B/com:I/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/o/text()">
        <xsl:element name="{'com:B/com:I/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/sup">
        <xsl:element name="{'com:B/com:I/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/sup/text()">
        <xsl:element name="{'com:B/com:I/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/sub">
        <xsl:element name="{'com:B/com:I/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/i/sub/text()">
        <xsl:element name="{'com:B/com:I/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u">
        <xsl:element name="{'com:B/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/text()">
        <xsl:element name="{'com:B/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/b">
        <xsl:element name="{'com:B/com:U/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/b/text()">
        <xsl:element name="{'com:B/com:U/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/i">
        <xsl:element name="{'com:B/com:U/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/i/text()">
        <xsl:element name="{'com:B/com:U/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/sup">
        <xsl:element name="{'com:B/com:U/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/sup/text()">
        <xsl:element name="{'com:B/com:U/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/sub">
        <xsl:element name="{'com:B/com:U/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/u/sub/text()">
        <xsl:element name="{'com:B/com:U/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o">
        <xsl:element name="{'com:B/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/text()">
        <xsl:element name="{'com:B/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/b">
        <xsl:element name="{'com:B/com:O/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/b/text()">
        <xsl:element name="{'com:B/com:O/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/i">
        <xsl:element name="{'com:B/com:O/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/i/text()">
        <xsl:element name="{'com:B/com:O/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/sup">
        <xsl:element name="{'com:B/com:O/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/sup/text()">
        <xsl:element name="{'com:B/com:O/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/sub">
        <xsl:element name="{'com:B/com:O/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/o/sub/text()">
        <xsl:element name="{'com:B/com:O/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps">
        <xsl:element name="{'com:B/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/text()">
        <xsl:element name="{'com:B/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/b">
        <xsl:element name="{'com:B/com:SmallCapital/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/b/text()">
        <xsl:element name="{'com:B/com:SmallCapital/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/u">
        <xsl:element name="{'com:B/com:SmallCapital/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/u/text()">
        <xsl:element name="{'com:B/com:SmallCapital/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/i">
        <xsl:element name="{'com:B/com:SmallCapital/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/i/text()">
        <xsl:element name="{'com:B/com:SmallCapital/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/o">
        <xsl:element name="{'com:B/com:SmallCapital/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/smallcaps/o/text()">
        <xsl:element name="{'com:B/com:SmallCapital/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/b">
        <xsl:element name="{'com:B/com:Sup/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/b/text()">
        <xsl:element name="{'com:B/com:Sup/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/u">
        <xsl:element name="{'com:B/com:Sup/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/u/text()">
        <xsl:element name="{'com:B/com:Sup/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/i">
        <xsl:element name="{'com:B/com:Sup/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/i/text()">
        <xsl:element name="{'com:B/com:Sup/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/o">
        <xsl:element name="{'com:B/com:Sup/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/o/text()">
        <xsl:element name="{'com:B/com:Sup/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2">
        <xsl:element name="{'com:B/com:Sup/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/b">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/b/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/u">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/u/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/i">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/i/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/o">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sup2/o/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sup2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2">
        <xsl:element name="{'com:B/com:Sup/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/b">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/b/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/u">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/u/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/i">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/i/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/o">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sup/sub2/o/text()">
        <xsl:element name="{'com:B/com:Sup/com:Sub2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub">
        <xsl:element name="{'com:B/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/text()">
        <xsl:element name="{'com:B/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/b">
        <xsl:element name="{'com:B/com:Sub/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/b/text()">
        <xsl:element name="{'com:B/com:Sub/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/u">
        <xsl:element name="{'com:B/com:Sub/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/u/text()">
        <xsl:element name="{'com:B/com:Sub/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/i">
        <xsl:element name="{'com:B/com:Sub/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/i/text()">
        <xsl:element name="{'com:B/com:Sub/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/o">
        <xsl:element name="{'com:B/com:Sub/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/o/text()">
        <xsl:element name="{'com:B/com:Sub/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2">
        <xsl:element name="{'com:B/com:Sub/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/b">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/b/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/u">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/u/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/i">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/i/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/o">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sup2/o/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sup2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2">
        <xsl:element name="{'com:B/com:Sub/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/b">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/b/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/u">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/u/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/i">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/i/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/o">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="b/sub/sub2/o/text()">
        <xsl:element name="{'com:B/com:Sub/com:Sub2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i">
        <xsl:element name="{'com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/text()">
        <xsl:element name="{'com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/b">
        <xsl:element name="{'com:I/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/u">
        <xsl:element name="{'com:I/com:U/com:B/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/o">
        <xsl:element name="{'com:I/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/smallcaps">
        <xsl:element name="{'com:I/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/sup">
        <xsl:element name="{'com:I/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="i/sub">
        <xsl:element name="{'com:I/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li">
        <xsl:element name="{'com:LI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/@id">
        <xsl:element name="{'com:LI/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/@num">
        <xsl:element name="{'com:LI/@com:liNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/text()">
        <xsl:element name="{'com:LI/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b">
        <xsl:element name="{'com:LI/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/text()">
        <xsl:element name="{'com:LI/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/i">
        <xsl:element name="{'com:LI/com:B/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/i/text()">
        <xsl:element name="{'com:LI/com:B/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/u">
        <xsl:element name="{'com:LI/com:B/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/u/text()">
        <xsl:element name="{'com:LI/com:B/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/o">
        <xsl:element name="{'com:LI/com:B/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/o/text()">
        <xsl:element name="{'com:LI/com:B/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/sup">
        <xsl:element name="{'com:LI/com:B/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/sup/text()">
        <xsl:element name="{'com:LI/com:B/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/sub">
        <xsl:element name="{'com:LI/com:B/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/b/sub/text()">
        <xsl:element name="{'com:LI/com:B/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i">
        <xsl:element name="{'com:LI/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/text()">
        <xsl:element name="{'com:LI/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/b">
        <xsl:element name="{'com:LI/com:I/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/b/text()">
        <xsl:element name="{'com:LI/com:I/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/u">
        <xsl:element name="{'com:LI/com:I/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/u/text()">
        <xsl:element name="{'com:LI/com:I/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/o">
        <xsl:element name="{'com:LI/com:I/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/o/text()">
        <xsl:element name="{'com:LI/com:I/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/sup">
        <xsl:element name="{'com:LI/com:I/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/sup/text()">
        <xsl:element name="{'com:LI/com:I/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/sub">
        <xsl:element name="{'com:LI/com:I/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/i/sub/text()">
        <xsl:element name="{'com:LI/com:I/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u">
        <xsl:element name="{'com:LI/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/text()">
        <xsl:element name="{'com:LI/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/b">
        <xsl:element name="{'com:LI/com:U/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/b/text()">
        <xsl:element name="{'com:LI/com:U/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/i">
        <xsl:element name="{'com:LI/com:U/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/i/text()">
        <xsl:element name="{'com:LI/com:U/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/sup">
        <xsl:element name="{'com:LI/com:U/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/sup/text()">
        <xsl:element name="{'com:LI/com:U/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/sub">
        <xsl:element name="{'com:LI/com:U/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/u/sub/text()">
        <xsl:element name="{'com:LI/com:U/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o">
        <xsl:element name="{'com:LI/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/text()">
        <xsl:element name="{'com:LI/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/b">
        <xsl:element name="{'com:LI/com:O/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/b/text()">
        <xsl:element name="{'com:LI/com:O/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/i">
        <xsl:element name="{'com:LI/com:O/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/i/text()">
        <xsl:element name="{'com:LI/com:O/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/sup">
        <xsl:element name="{'com:LI/com:O/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/sup/text()">
        <xsl:element name="{'com:LI/com:O/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/sub">
        <xsl:element name="{'com:LI/com:O/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/o/sub/text()">
        <xsl:element name="{'com:LI/com:O/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup">
        <xsl:element name="{'com:LI/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/text()">
        <xsl:element name="{'com:LI/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/b">
        <xsl:element name="{'com:LI/com:Sup/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/b/text()">
        <xsl:element name="{'com:LI/com:Sup/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/u">
        <xsl:element name="{'com:LI/com:Sup/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/u/text()">
        <xsl:element name="{'com:LI/com:Sup/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/i">
        <xsl:element name="{'com:LI/com:Sup/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/i/text()">
        <xsl:element name="{'com:LI/com:Sup/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/o">
        <xsl:element name="{'com:LI/com:Sup/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/o/text()">
        <xsl:element name="{'com:LI/com:Sup/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/b">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/b/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/u">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/u/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/i">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/i/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/o">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sup2/o/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sup2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/b">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/b/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/u">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/u/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/i">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/i/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/o">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sup/sub2/o/text()">
        <xsl:element name="{'com:LI/com:Sup/com:Sub2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub">
        <xsl:element name="{'com:LI/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/text()">
        <xsl:element name="{'com:LI/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/b">
        <xsl:element name="{'com:LI/com:Sub/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/b/text()">
        <xsl:element name="{'com:LI/com:Sub/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/u">
        <xsl:element name="{'com:LI/com:Sub/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/u/text()">
        <xsl:element name="{'com:LI/com:Sub/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/i">
        <xsl:element name="{'com:LI/com:Sub/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/i/text()">
        <xsl:element name="{'com:LI/com:Sub/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/o">
        <xsl:element name="{'com:LI/com:Sub/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/o/text()">
        <xsl:element name="{'com:LI/com:Sub/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/b">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/b/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/u">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/u/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/i">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/i/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/o">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sup2/o/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sup2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/b">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/b/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/u">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/u/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/i">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/i/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/o">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/sub/sub2/o/text()">
        <xsl:element name="{'com:LI/com:Sub/com:Sub2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps">
        <xsl:element name="{'com:LI/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/text()">
        <xsl:element name="{'com:LI/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/b">
        <xsl:element name="{'com:LI/com:SmallCapital/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/b/text()">
        <xsl:element name="{'com:LI/com:SmallCapital/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/u">
        <xsl:element name="{'com:LI/com:SmallCapital/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/u/text()">
        <xsl:element name="{'com:LI/com:SmallCapital/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/i">
        <xsl:element name="{'com:LI/com:SmallCapital/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/i/text()">
        <xsl:element name="{'com:LI/com:SmallCapital/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/o">
        <xsl:element name="{'com:LI/com:SmallCapital/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/smallcaps/o/text()">
        <xsl:element name="{'com:LI/com:SmallCapital/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/br">
        <xsl:element name="{'com:LI/com:Br': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/pre">
        <xsl:element name="{'com:LI/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/pre/@id">
        <xsl:element name="{'com:LI/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/pre/@xml:space">
        <xsl:element name="{'com:LI/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/pre/@listing-type">
        <xsl:element name="{'com:LI/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/pre/text()">
        <xsl:element name="{'com:LI/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/patcit">
        <xsl:element name="{'com:LI/com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/nplcit">
        <xsl:element name="{'com:LI/com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/bio-deposit">
        <xsl:element name="{'com:LI/com:BioDeposit': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/@idref">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/b">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/b/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/i">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/i/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/u">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/u/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/o">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/o/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/sup">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/sup/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/sub">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/sub/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/smallcaps">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/crossref/smallcaps/text()">
        <xsl:element name="{'com:LI/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/@idref">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/@num">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/b">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/b/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/i">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/i/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/u">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/u/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/o">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/o/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/sup">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/sup/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/sub">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/sub/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/smallcaps">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/figref/smallcaps/text()">
        <xsl:element name="{'com:LI/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/img">
        <xsl:element name="{'com:LI/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/dl">
        <xsl:element name="{'com:LI/com:DL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/ul">
        <xsl:element name="{'com:LI/com:UL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/ol">
        <xsl:element name="{'com:LI/com:OL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/chemistry">
        <xsl:element name="{'com:LI/com:ChemicalFormulae': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li/maths">
        <xsl:element name="{'com:LI/com:Math': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o">
        <xsl:element name="{'com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/@style">
        <xsl:element name="{'com:O/@com:oStyle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/text()">
        <xsl:element name="{'com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/b">
        <xsl:element name="{'com:O/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/i">
        <xsl:element name="{'com:O/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/smallcaps">
        <xsl:element name="{'com:O/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/sup">
        <xsl:element name="{'com:O/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="o/sub">
        <xsl:element name="{'com:O/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps">
        <xsl:element name="{'com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps/text()">
        <xsl:element name="{'com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps/b">
        <xsl:element name="{'com:SmallCapital/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps/u">
        <xsl:element name="{'com:SmallCapital/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps/i">
        <xsl:element name="{'com:SmallCapital/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="smallcaps/o">
        <xsl:element name="{'com:SmallCapital/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2">
        <xsl:element name="{'com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2/text()">
        <xsl:element name="{'com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2/b">
        <xsl:element name="{'com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2/u">
        <xsl:element name="{'com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2/i">
        <xsl:element name="{'com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub2/o">
        <xsl:element name="{'com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub">
        <xsl:element name="{'com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/text()">
        <xsl:element name="{'com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/b">
        <xsl:element name="{'com:Sub/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/u">
        <xsl:element name="{'com:Sub/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/i">
        <xsl:element name="{'com:Sub/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/o">
        <xsl:element name="{'com:Sub/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/sup2">
        <xsl:element name="{'com:Sub/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sub/sub2">
        <xsl:element name="{'com:Sub/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2">
        <xsl:element name="{'com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2/text()">
        <xsl:element name="{'com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2/b">
        <xsl:element name="{'com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2/u">
        <xsl:element name="{'com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2/i">
        <xsl:element name="{'com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup2/o">
        <xsl:element name="{'com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup">
        <xsl:element name="{'com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/text()">
        <xsl:element name="{'com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/b">
        <xsl:element name="{'com:Sup/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/u">
        <xsl:element name="{'com:Sup/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/i">
        <xsl:element name="{'com:Sup/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/o">
        <xsl:element name="{'com:Sup/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/sup2">
        <xsl:element name="{'com:Sup/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sup/sub2">
        <xsl:element name="{'com:Sup/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u">
        <xsl:element name="{'com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/text()">
        <xsl:element name="{'com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/b">
        <xsl:element name="{'com:U/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/i">
        <xsl:element name="{'com:U/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/smallcaps">
        <xsl:element name="{'com:U/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/sup">
        <xsl:element name="{'com:U/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="u/sub">
        <xsl:element name="{'com:U/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pre">
        <xsl:element name="{'com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pre/@id">
        <xsl:element name="{'com:Pre/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pre/@listing-type">
        <xsl:element name="{'com:Pre/@com:listingCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dl">
        <xsl:element name="{'com:DL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dl/@id">
        <xsl:element name="{'com:DL/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dl/dt">
        <xsl:element name="{'com:DL/com:DT': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dl/dd">
        <xsl:element name="{'com:DL/com:DD': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd">
        <xsl:element name="{'com:DD': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/text()">
        <xsl:element name="{'com:DD/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/b">
        <xsl:element name="{'com:DD/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/i">
        <xsl:element name="{'com:DD/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/u">
        <xsl:element name="{'com:DD/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/o">
        <xsl:element name="{'com:DD/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/sup">
        <xsl:element name="{'com:DD/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/sub">
        <xsl:element name="{'com:DD/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/smallcaps">
        <xsl:element name="{'com:DD/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/br">
        <xsl:element name="{'com:DD/com:Br': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/pre">
        <xsl:element name="{'com:DD/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/patcit">
        <xsl:element name="{'com:DD/com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/nplcit">
        <xsl:element name="{'com:DD/com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dd/crossref">
        <xsl:element name="{'com:DD/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit">
        <xsl:element name="{'com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/@id">
        <xsl:element name="{'com:PatentCitation/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/@num">
        <xsl:element name="{'com:PatentCitation/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/text">
        <xsl:element name="{'com:PatentCitation/com:PatentCitationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/document-id">
        <xsl:element name="{'com:PatentCitation/com:CitedPatentDocumentIdentification': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/document-id/country">
        <xsl:element name="{'com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/document-id/doc-number">
        <xsl:element name="{'com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/document-id/kind">
        <xsl:element name="{'com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="patcit/document-id/date">
        <xsl:element name="{'com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit">
        <xsl:element name="{'com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/@id">
        <xsl:element name="{'com:NPLCitation/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/@num">
        <xsl:element name="{'com:NPLCitation/@com:sequenceNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/@lang">
        <xsl:element name="{'com:NPLCitation/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/@file">
        <xsl:element name="{'com:NPLCitation/com:FileName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/@url">
        <xsl:element name="{'com:NPLCitation/com:WebURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/text">
        <xsl:element name="{'com:NPLCitation/com:NPLCitationText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/author">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:AuthorName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/atl">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:SerialALTTitleText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/subname">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:Subordinate': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/subname/@subname-type">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:Subordinate/@com:subordinateCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/subname/name">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:Subordinate/com:Name': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/class">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:NPLClass': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/class/@class-type">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:NPLClass/@com:classificationSystem': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/article/cpyrt">
        <xsl:element name="{'com:NPLCitation/com:CitedJournalArticle/com:NPLCopyrightText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/book">
        <xsl:element name="{'com:NPLCitation/com:CitedBook': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="nplcit/othercit">
        <xsl:element name="{'com:NPLCitation/com:CitedOtherKindNPL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref">
        <xsl:element name="{'com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/@idref">
        <xsl:element name="{'com:CrossReference/@com:idrefs': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/text()">
        <xsl:element name="{'com:CrossReference/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/b">
        <xsl:element name="{'com:CrossReference/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/i">
        <xsl:element name="{'com:CrossReference/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/u">
        <xsl:element name="{'com:CrossReference/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/o">
        <xsl:element name="{'com:CrossReference/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/sup">
        <xsl:element name="{'com:CrossReference/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/sub">
        <xsl:element name="{'com:CrossReference/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="crossref/smallcaps">
        <xsl:element name="{'com:CrossReference/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ul">
        <xsl:element name="{'com:UL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ul/@id">
        <xsl:element name="{'com:UL/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ul/@list-style">
        <xsl:element name="{'com:UL/@com:ulStyle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ul/li">
        <xsl:element name="{'com:UL/com:LI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol">
        <xsl:element name="{'com:OL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol/@id">
        <xsl:element name="{'com:OL/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol/@ol-style">
        <xsl:element name="{'com:OL/@com:olStyle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ol/li">
        <xsl:element name="{'com:OL/com:LI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page">
        <xsl:element name="{'pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@id">
        <xsl:element name="{'pat:DocumentURI/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@he">
        <xsl:element name="{'pat:PageImage/com:HeightMeasure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@wi">
        <xsl:element name="{'pat:PageImage/com:WidthMeasure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@type">
        <xsl:element name="{'pat:DocumentURI/@pat:pageDocumentFormatCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@alt">
        <xsl:element name="{'pat:PageImage/com:Alt': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@ppf">
        <xsl:element name="{'pat:DocumentURI/@pat:firstPageNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@ppl">
        <xsl:element name="{'pat:DocumentURI/@pat:lastPageNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@file">
        <xsl:element name="{'pat:DocumentURI/@com:documentFileName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@ocr">
        <xsl:element name="{'pat:DocumentURI/@pat:ocrIndicator': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@color">
        <xsl:element name="{'pat:PageImage/com:ColourModeCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="doc-page/@orientation">
        <xsl:element name="{'pat:PageImage/@com:orientationCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims">
        <xsl:element name="{'pat:Claims': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/@id">
        <xsl:element name="{'pat:Claims/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/@lang">
        <xsl:element name="{'pat:Claims/@com:languageCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/doc-page">
        <xsl:element name="{'pat:Claims/pat:DocumentURI': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/claim">
        <xsl:element name="{'pat:Claims/pat:Claim': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/claim/@id">
        <xsl:element name="{'pat:Claims/pat:Claim/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/claim/@num">
        <xsl:element name="{'pat:Claims/pat:Claim/pat:ClaimNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claims/claim/claim-text">
        <xsl:element name="{'pat:Claims/pat:Claim/pat:ClaimText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text">
        <xsl:element name="{'pat:ClaimText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/text()">
        <xsl:element name="{'pat:ClaimText/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/claim-text">
        <xsl:element name="{'pat:ClaimText/pat:ClaimText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/claim-ref">
        <xsl:element name="{'pat:ClaimText/pat:ClaimReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/claim-ref/@idref">
        <xsl:element name="{'pat:ClaimText/pat:ClaimReference/@com:idrefs': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/claim-ref/text()">
        <xsl:element name="{'pat:ClaimText/pat:ClaimReference/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/b">
        <xsl:element name="{'pat:ClaimText/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/i">
        <xsl:element name="{'pat:ClaimText/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/u">
        <xsl:element name="{'pat:ClaimText/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/o">
        <xsl:element name="{'pat:ClaimText/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/sup">
        <xsl:element name="{'pat:ClaimText/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/sub">
        <xsl:element name="{'pat:ClaimText/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/smallcaps">
        <xsl:element name="{'pat:ClaimText/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/br">
        <xsl:element name="{'pat:ClaimText/com:Br': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/pre">
        <xsl:element name="{'pat:ClaimText/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/crossref">
        <xsl:element name="{'pat:ClaimText/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/figref">
        <xsl:element name="{'pat:ClaimText/com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/img">
        <xsl:element name="{'pat:ClaimText/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/chemistry">
        <xsl:element name="{'pat:ClaimText/com:ChemicalFormulae': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/maths">
        <xsl:element name="{'pat:ClaimText/com:Math': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="claim-text/tables">
        <xsl:element name="{'pat:ClaimText/com:Table': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref">
        <xsl:element name="{'com:FigureReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/@idref">
        <xsl:element name="{'com:FigureReference/@com:idrefs': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/@num">
        <xsl:element name="{'com:FigureReference/@com:referencedFigureNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/text()">
        <xsl:element name="{'com:FigureReference/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/b">
        <xsl:element name="{'com:FigureReference/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/i">
        <xsl:element name="{'com:FigureReference/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/u">
        <xsl:element name="{'com:FigureReference/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/o">
        <xsl:element name="{'com:FigureReference/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/sup">
        <xsl:element name="{'com:FigureReference/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/sub">
        <xsl:element name="{'com:FigureReference/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figref/smallcaps">
        <xsl:element name="{'com:FigureReference/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chemistry">
        <xsl:element name="{'com:ChemicalFormulae': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chemistry/@id">
        <xsl:element name="{'com:ChemicalFormulae/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chemistry/@num">
        <xsl:element name="{'com:ChemicalFormulae/@com:chemicalFormulaeNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chemistry/img">
        <xsl:element name="{'com:ChemicalFormulae/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="chemistry/chem">
        <xsl:element name="{'com:ChemicalFormulae/com:InlineFormula': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:element name="{'com:TableTitle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/text()">
        <xsl:element name="{'com:TableTitle/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/b">
        <xsl:element name="{'com:TableTitle/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/i">
        <xsl:element name="{'com:TableTitle/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/u">
        <xsl:element name="{'com:TableTitle/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/sup">
        <xsl:element name="{'com:TableTitle/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/sub">
        <xsl:element name="{'com:TableTitle/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="title/smallcaps">
        <xsl:element name="{'com:TableTitle/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure">
        <xsl:element name="{'pat:Figure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure/@id">
        <xsl:element name="{'pat:Figure/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure/@num">
        <xsl:element name="{'pat:Figure/pat:FigureNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure/img">
        <xsl:element name="{'pat:Figure/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt">
        <xsl:element name="{'com:DT': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/@id">
        <xsl:element name="{'com:DT/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/text()">
        <xsl:element name="{'com:DT/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/b">
        <xsl:element name="{'com:DT/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/i">
        <xsl:element name="{'com:DT/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/u">
        <xsl:element name="{'com:DT/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/o">
        <xsl:element name="{'com:DT/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/sup">
        <xsl:element name="{'com:DT/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/sub">
        <xsl:element name="{'com:DT/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dt/smallcaps">
        <xsl:element name="{'com:DT/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-1">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-1/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-2">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-2/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-3">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-3/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-4">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-4/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-5">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-5/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/mailcode">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/pobox">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/pobox/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/room">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/room/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-floor">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/address-floor/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/building">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/building/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/street">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/street/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/city">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/county">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/county/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/state">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/state/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/postcode">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/country">
        <xsl:element name="{'com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/text">
        <xsl:element name="{'com:BioDepositDepositary/com:ContactText': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="depositary/address/text/text()">
        <xsl:element name="{'com:BioDepositDepositary/com:ContactText/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img">
        <xsl:element name="{'com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@id">
        <xsl:element name="{'com:Image/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@he">
        <xsl:element name="{'com:Image/com:HeightMeasure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@wi">
        <xsl:element name="{'com:Image/com:WidthMeasure': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@file">
        <xsl:element name="{'com:Image/com:FileName': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@alt">
        <xsl:element name="{'com:Image/com:Alt': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@img-content">
        <xsl:element name="{'com:Image/@com:imageContentCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@img-format">
        <xsl:element name="{'com:Image/com:ImageFormatCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@orientation">
        <xsl:element name="{'com:Image/@com:orientationCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img/@inline">
        <xsl:element name="{'com:Image/@com:imageWrappingStyleCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables">
        <xsl:element name="{'com:Table': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/@id">
        <xsl:element name="{'com:Table/com:IPOASISTable/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/@num">
        <xsl:element name="{'com:Table/com:TableImage/@com:tableNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/img">
        <xsl:element name="{'com:Table/com:TableImage/com:ColourModeCategory': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table">
        <xsl:element name="{'com:Table/com:IPOASISTable': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/@frame">
        <xsl:element name="{'com:Table/com:IPOASISTable/@tbl:frame': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/@colsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/@tbl:colsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/@pgwide">
        <xsl:element name="{'com:Table/com:IPOASISTable/@com:pageWide': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/title">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableTitle': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/@cols">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/@tbl:cols': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/@colsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/@tbl:colsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/@align">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/@tbl:align': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@colnum">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colnum': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@colname">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colname': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@colwidth">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colwidth': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@colsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@align">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:align': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@char">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:char': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/colspec/@charoff">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:charoff': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/thead">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:thead': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/thead/@valign">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/@tbl:valign': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/thead/row">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/thead/row/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/thead/row/@valign">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:valign': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/@valign">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/@tbl:valign': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/@valign">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:valign': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@colname">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colname': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@namest">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:namest': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@nameend">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:nameend': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@morerows">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:morerows': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@colsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@rowsep">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:rowsep': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@align">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:align': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@char">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:char': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@charoff">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:charoff': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/@valign">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:valign': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/text()">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/b">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/i">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/u">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/sup">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/sub">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/smallcaps">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/br">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Br': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/patcit">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/nplcit">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/bio-deposit">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:BioDeposit': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/crossref">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/img">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/dl">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:DL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/ul">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:UL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/ol">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:OL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/chemistry">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:ChemicalFormulae': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tables/table/tgroup/tbody/row/entry/maths">
        <xsl:element name="{'com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Math': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:element name="{'com:P': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/@id">
        <xsl:element name="{'com:P/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/@num">
        <xsl:element name="{'com:P/@com:pNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/text()">
        <xsl:element name="{'com:P/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b">
        <xsl:element name="{'com:P/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/text()">
        <xsl:element name="{'com:P/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/i">
        <xsl:element name="{'com:P/com:B/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/i/text()">
        <xsl:element name="{'com:P/com:B/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/u">
        <xsl:element name="{'com:P/com:B/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/u/text()">
        <xsl:element name="{'com:P/com:B/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/o">
        <xsl:element name="{'com:P/com:B/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/o/text()">
        <xsl:element name="{'com:P/com:B/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/sup">
        <xsl:element name="{'com:P/com:B/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/sup/text()">
        <xsl:element name="{'com:P/com:B/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/sub">
        <xsl:element name="{'com:P/com:B/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/b/sub/text()">
        <xsl:element name="{'com:P/com:B/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i">
        <xsl:element name="{'com:P/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/text()">
        <xsl:element name="{'com:P/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/b">
        <xsl:element name="{'com:P/com:I/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/b/text()">
        <xsl:element name="{'com:P/com:I/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/u">
        <xsl:element name="{'com:P/com:I/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/u/text()">
        <xsl:element name="{'com:P/com:I/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/o">
        <xsl:element name="{'com:P/com:I/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/o/text()">
        <xsl:element name="{'com:P/com:I/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/sup">
        <xsl:element name="{'com:P/com:I/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/sup/text()">
        <xsl:element name="{'com:P/com:I/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/sub">
        <xsl:element name="{'com:P/com:I/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/i/sub/text()">
        <xsl:element name="{'com:P/com:I/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u">
        <xsl:element name="{'com:P/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/text()">
        <xsl:element name="{'com:P/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/b">
        <xsl:element name="{'com:P/com:U/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/b/text()">
        <xsl:element name="{'com:P/com:U/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/i">
        <xsl:element name="{'com:P/com:U/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/i/text()">
        <xsl:element name="{'com:P/com:U/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/sup">
        <xsl:element name="{'com:P/com:U/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/sup/text()">
        <xsl:element name="{'com:P/com:U/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/sub">
        <xsl:element name="{'com:P/com:U/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/u/sub/text()">
        <xsl:element name="{'com:P/com:U/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o">
        <xsl:element name="{'com:P/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/text()">
        <xsl:element name="{'com:P/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/b">
        <xsl:element name="{'com:P/com:O/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/b/text()">
        <xsl:element name="{'com:P/com:O/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/i">
        <xsl:element name="{'com:P/com:O/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/i/text()">
        <xsl:element name="{'com:P/com:O/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/sup">
        <xsl:element name="{'com:P/com:O/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/sup/text()">
        <xsl:element name="{'com:P/com:O/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/sub">
        <xsl:element name="{'com:P/com:O/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/o/sub/text()">
        <xsl:element name="{'com:P/com:O/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup">
        <xsl:element name="{'com:P/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/text()">
        <xsl:element name="{'com:P/com:Sup/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/b">
        <xsl:element name="{'com:P/com:Sup/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/b/text()">
        <xsl:element name="{'com:P/com:Sup/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/u">
        <xsl:element name="{'com:P/com:Sup/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/u/text()">
        <xsl:element name="{'com:P/com:Sup/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/i">
        <xsl:element name="{'com:P/com:Sup/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/i/text()">
        <xsl:element name="{'com:P/com:Sup/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/o">
        <xsl:element name="{'com:P/com:Sup/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/o/text()">
        <xsl:element name="{'com:P/com:Sup/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2">
        <xsl:element name="{'com:P/com:Sup/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/b">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/b/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/u">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/u/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/i">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/i/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/o">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sup2/o/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sup2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2">
        <xsl:element name="{'com:P/com:Sup/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/b">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/b/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/u">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/u/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/i">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/i/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/o">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sup/sub2/o/text()">
        <xsl:element name="{'com:P/com:Sup/com:Sub2/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub">
        <xsl:element name="{'com:P/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/text()">
        <xsl:element name="{'com:P/com:Sub/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/b">
        <xsl:element name="{'com:P/com:Sub/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/b/text()">
        <xsl:element name="{'com:P/com:Sub/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/u">
        <xsl:element name="{'com:P/com:Sub/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/u/text()">
        <xsl:element name="{'com:P/com:Sub/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/i">
        <xsl:element name="{'com:P/com:Sub/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/i/text()">
        <xsl:element name="{'com:P/com:Sub/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/o">
        <xsl:element name="{'com:P/com:Sub/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/o/text()">
        <xsl:element name="{'com:P/com:Sub/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/sup2">
        <xsl:element name="{'com:P/com:Sub/com:Sup2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/sup2/text()">
        <xsl:element name="{'com:P/com:Sub/com:Sup2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/sub2">
        <xsl:element name="{'com:P/com:Sub/com:Sub2': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/sub/sub2/text()">
        <xsl:element name="{'com:P/com:Sub/com:Sub2/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps">
        <xsl:element name="{'com:P/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/text()">
        <xsl:element name="{'com:P/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/b">
        <xsl:element name="{'com:P/com:SmallCapital/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/b/text()">
        <xsl:element name="{'com:P/com:SmallCapital/com:B/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/u">
        <xsl:element name="{'com:P/com:SmallCapital/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/u/text()">
        <xsl:element name="{'com:P/com:SmallCapital/com:U/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/i">
        <xsl:element name="{'com:P/com:SmallCapital/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/i/text()">
        <xsl:element name="{'com:P/com:SmallCapital/com:I/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/o">
        <xsl:element name="{'com:P/com:SmallCapital/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/smallcaps/o/text()">
        <xsl:element name="{'com:P/com:SmallCapital/com:O/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/br">
        <xsl:element name="{'com:P/com:Br': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/pre">
        <xsl:element name="{'com:P/com:Pre': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/dl">
        <xsl:element name="{'com:P/com:DL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/ul">
        <xsl:element name="{'com:P/com:UL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/ol">
        <xsl:element name="{'com:P/com:OL': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/@idref">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/b">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/b/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/i">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/i/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/u">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/u/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/o">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/o/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/sup">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/sup/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/sub">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/sub/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/smallcaps">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/crossref/smallcaps/text()">
        <xsl:element name="{'com:P/com:CrossReference': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/@idref">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/@num">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/b">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/b/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/i">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/i/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/u">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/u/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/o">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/o/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/sup">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/sup/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/sub">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/sub/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/smallcaps">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/figref/smallcaps/text()">
        <xsl:element name="{'com:P/com:FigureReference/com:SmallCapital/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/patcit">
        <xsl:element name="{'com:P/com:PatentCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/nplcit">
        <xsl:element name="{'com:P/com:NPLCitation': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/bio-deposit">
        <xsl:element name="{'com:P/com:BioDeposit': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/img">
        <xsl:element name="{'com:P/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/chemistry">
        <xsl:element name="{'com:P/com:ChemicalFormulae': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/maths">
        <xsl:element name="{'com:P/com:Math': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p/tables">
        <xsl:element name="{'com:P/com:Table': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading">
        <xsl:element name="{'com:Heading': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/@level">
        <xsl:element name="{'com:Heading/@com:headingLevelCode': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/@id">
        <xsl:element name="{'com:Heading/@com:id': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/text()">
        <xsl:element name="{'com:Heading/text()': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/b">
        <xsl:element name="{'com:Heading/com:B': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/i">
        <xsl:element name="{'com:Heading/com:I': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/u">
        <xsl:element name="{'com:Heading/com:U': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/o">
        <xsl:element name="{'com:Heading/com:O': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/sup">
        <xsl:element name="{'com:Heading/com:Sup': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/sub">
        <xsl:element name="{'com:Heading/com:Sub': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="heading/smallcaps">
        <xsl:element name="{'com:Heading/com:SmallCapital': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="maths">
        <xsl:element name="{'com:Math': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="maths/@num">
        <xsl:element name="{'com:Math/@com:mathNumber': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="maths/img">
        <xsl:element name="{'com:Math/com:Image': True}">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    

    
    <xsl:template match="kind[text() = 'national']">
        <xsl:element name="pat:ApplicationFilingCategory">
            <xsl:value-of select="'National'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'regional']">
        <xsl:element name="pat:ApplicationFilingCategory">
            <xsl:value-of select="'Regional'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'international']">
        <xsl:element name="pat:ApplicationFilingCategory">
            <xsl:value-of select="'PCT'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="subset[text() = 'yes']">
        <xsl:element name="pat:subsetIndicator">
            <xsl:value-of select="'true'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="subset[text() = 'no']">
        <xsl:element name="pat:subsetIndicator">
            <xsl:value-of select="'false'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="rep-type[text() = 'agent']">
        <xsl:element name="pat:RegisteredPractitionerCategory">
            <xsl:value-of select="'Agent'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="rep-type[text() = 'attorney']">
        <xsl:element name="pat:RegisteredPractitionerCategory">
            <xsl:value-of select="'Attorney'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="rep-type[text() = 'common-representative']">
        <xsl:element name="pat:RegisteredPractitionerCategory">
            <xsl:value-of select="'Common representative'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text()[text() = 'cited by applicant']">
        <xsl:element name="pat:citingPartyCategory">
            <xsl:value-of select="'Applicant'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text()[text() = 'cited by examiner']">
        <xsl:element name="pat:citingPartyCategory">
            <xsl:value-of select="'Examiner'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="appl-type[text() = 'utility']">
        <xsl:element name="pat:InventionSubjectMatterCategory">
            <xsl:value-of select="'Utility'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="email-purpose[text() = 'informal']">
        <xsl:element name="com:emailAddressPurposeCategory">
            <xsl:value-of select="'Informal'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="email-purpose[text() = 'general']">
        <xsl:element name="com:emailAddressPurposeCategory">
            <xsl:value-of select="'General'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="email-purpose[text() = 'advanced']">
        <xsl:element name="com:emailAddressPurposeCategory">
            <xsl:value-of select="'Advanced'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="email-purpose[text() = 'main']">
        <xsl:element name="com:emailAddressPurposeCategory">
            <xsl:value-of select="'Main'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="app-type[text() = 'applicant-inventor']">
        <xsl:element name="pat:ApplicantCategory">
            <xsl:value-of select="'Applicant_Inventor'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="app-type[text() = 'legal-representative']">
        <xsl:element name="pat:ApplicantCategory">
            <xsl:value-of select="''"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="app-type[text() = 'otherwise']">
        <xsl:element name="pat:ApplicantCategory">
            <xsl:value-of select="'Applicant'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'heir']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Heir'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'heiress']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Heiress'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'executor']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Executor'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'executrix']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Executrix'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'estate']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Estate'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'legal-representative']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Legal representative'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'administrator']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Administrator'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'administratrix']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Administratrix'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'legal-representatives']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Legal representatives'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'heirs']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Heirs'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'executors']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Executors'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="kind[text() = 'legal-heirs']">
        <xsl:element name="pat:SuccessorCategory">
            <xsl:value-of select="'Legal heirs'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation[text() = 'all']">
        <xsl:element name="pat:DesignationCategory">
            <xsl:value-of select="'All'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation[text() = 'all-except-us']">
        <xsl:element name="pat:DesignationCategory">
            <xsl:value-of select="'All except US'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation[text() = 'us-only']">
        <xsl:element name="pat:DesignationCategory">
            <xsl:value-of select="'US only'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="designation[text() = 'as-indicated']">
        <xsl:element name="pat:DesignationCategory">
            <xsl:value-of select="'As indicated'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="type[text() = 'jpg']">
        <xsl:element name="com:ImageFormatCategory">
            <xsl:value-of select="'JPEG'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="type[text() = 'tif']">
        <xsl:element name="com:ImageFormatCategory">
            <xsl:value-of select="'TIFF'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="type[text() = 'pdf']">
        <xsl:element name="com:ImageFormatCategory">
            <xsl:value-of select="'GIF'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="color[text() = 'bw']">
        <xsl:element name="com:ColourModeCategory">
            <xsl:value-of select="'Black and white'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="color[text() = 'color']">
        <xsl:element name="com:ColourModeCategory">
            <xsl:value-of select="'Colour'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orientation[text() = 'portrait']">
        <xsl:element name="com:orientationCategory">
            <xsl:value-of select="'Portrait'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orientation[text() = 'landscape']">
        <xsl:element name="com:orientationCategory">
            <xsl:value-of select="'Landscape'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'drawing']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Drawing'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'photograph']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Photograph'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'character']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Character'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'dna']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'DNA'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'chem']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Chemistry'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'math']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Math'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'table']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Table'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'program-listing']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Program listing'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'flowchart']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Flowchart'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-content[text() = 'graph']">
        <xsl:element name="com:imageContentCategory">
            <xsl:value-of select="'Graph'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-format[text() = 'jpg']">
        <xsl:element name="com:ImageFormatCategory">
            <xsl:value-of select="'JPEG'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img-format[text() = 'tif']">
        <xsl:element name="com:ImageFormatCategory">
            <xsl:value-of select="'TIFF'"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="inline[text() = 'yes']">
        <xsl:element name="com:imageWrappingStyleCategory">
            <xsl:value-of select="'Inline'"/>
        </xsl:element>
    </xsl:template>
    

</xsl:stylesheet>
