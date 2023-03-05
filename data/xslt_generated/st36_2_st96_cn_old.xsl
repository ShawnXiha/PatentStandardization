<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/patent-document">
    <pat:PatentPublication>
    <xsl:apply-templates select="cn-patent-document/cn-bibliographic-data"/>
    <xsl:apply-templates select="cn-bibliographic-data/@id"/>
    <xsl:apply-templates select="cn-bibliographic-data/@country"/>
    <xsl:apply-templates select="cn-bibliographic-data/plain-language-designation"/>
    <xsl:apply-templates select="cn-bibliographic-data/plain-language-designation/@lang"/>
    <xsl:apply-templates select="cn-bibliographic-data/cn-publication-reference"/>
    <xsl:apply-templates select="cn-bibliographic-data/classification-ipc"/>
    <xsl:apply-templates select="cn-bibliographic-data/classifications-ipcr"/>
    <xsl:apply-templates select="cn-bibliographic-data/classifications-ipcr/classification-ipcr"/>
    <xsl:apply-templates select="cn-bibliographic-data/classification-national"/>
    <xsl:apply-templates select="cn-bibliographic-data/classification-locarno"/>
    <xsl:apply-templates select="cn-bibliographic-data/application-reference"/>
    <xsl:apply-templates select="cn-bibliographic-data/language-of-filing"/>
    <xsl:apply-templates select="cn-bibliographic-data/language-of-publication"/>
    <xsl:apply-templates select="cn-bibliographic-data/priority-claims"/>
    <xsl:apply-templates select="cn-bibliographic-data/cn-parties"/>
    <xsl:apply-templates select="cn-bibliographic-data/designation-of-states"/>
    <xsl:apply-templates select="cn-bibliographic-data/invention-title"/>
    <xsl:apply-templates select="cn-bibliographic-data/assignees"/>
    <xsl:apply-templates select="cn-bibliographic-data/licensee-data"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-of-earliest-priority"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-complete-specification-filed"/>
    <xsl:apply-templates select="cn-bibliographic-data/dates-of-public-availability"/>
    <xsl:apply-templates select="cn-bibliographic-data/term-of-grant"/>
    <xsl:apply-templates select="cn-bibliographic-data/dates-rights-effective"/>
    <xsl:apply-templates select="cn-bibliographic-data/patent-family"/>
    <xsl:apply-templates select="cn-bibliographic-data/field-of-search"/>
    <xsl:apply-templates select="cn-bibliographic-data/figures"/>
    <xsl:apply-templates select="cn-bibliographic-data/references-cited"/>
    <xsl:apply-templates select="cn-bibliographic-data/examiners"/>
    <xsl:apply-templates select="cn-bibliographic-data/number-of-claims"/>
    <xsl:apply-templates select="cn-bibliographic-data/cn-related-documents"/>
    <xsl:apply-templates select="cn-bibliographic-data/st50-republication"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-exhibition-filed"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-pct-article-22-39-fulfilled/date"/>
    <xsl:apply-templates select="cn-bibliographic-data/bio-deposit"/>
    <xsl:apply-templates select="cn-bibliographic-data/pct-or-regional-filing-data"/>
    <xsl:apply-templates select="cn-bibliographic-data/pct-or-regional-publishing-data"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-rights-reestablished"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-application-withdrawn-by-cn-applicant"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-application-deemed-withdrawn"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-of-revocation"/>
    <xsl:apply-templates select="cn-bibliographic-data/date-application-partially-withdrawn/date"/>
    <xsl:apply-templates select="cn-bibliographic-data/opposition-data"/>
    <xsl:apply-templates select="plain-language-designation"/>
    <xsl:apply-templates select="plain-language-designation/@lang"/>
    <xsl:apply-templates select="cn-publication-reference"/>
    <xsl:apply-templates select="cn-publication-reference/@id"/>
    <xsl:apply-templates select="cn-publication-reference/document-id/country"/>
    <xsl:apply-templates select="cn-publication-reference/document-id/doc-number"/>
    <xsl:apply-templates select="cn-publication-reference/document-id/kind"/>
    <xsl:apply-templates select="cn-publication-reference/document-id/date"/>
    <xsl:apply-templates select="classification-ipc"/>
    <xsl:apply-templates select="classification-ipc/@id"/>
    <xsl:apply-templates select="classification-ipc/edition"/>
    <xsl:apply-templates select="classification-ipc/main-classification"/>
    <xsl:apply-templates select="classification-ipc/further-classification"/>
    <xsl:apply-templates select="classification-ipcr"/>
    <xsl:apply-templates select="classification-ipcr/@id"/>
    <xsl:apply-templates select="classification-ipcr/@sequence"/>
    <xsl:apply-templates select="classification-ipcr/ipc-version-indicator/date"/>
    <xsl:apply-templates select="classification-ipcr/classification-level"/>
    <xsl:apply-templates select="classification-ipcr/section"/>
    <xsl:apply-templates select="classification-ipcr/class"/>
    <xsl:apply-templates select="classification-ipcr/subclass"/>
    <xsl:apply-templates select="classification-ipcr/main-group"/>
    <xsl:apply-templates select="classification-ipcr/subgroup"/>
    <xsl:apply-templates select="classification-ipcr/symbol-position"/>
    <xsl:apply-templates select="classification-ipcr/classification-value"/>
    <xsl:apply-templates select="classification-ipcr/action-date/date"/>
    <xsl:apply-templates select="classification-ipcr/generating-office/country"/>
    <xsl:apply-templates select="classification-ipcr/classification-status"/>
    <xsl:apply-templates select="classification-ipcr/classification-data-source"/>
    <xsl:apply-templates select="classification-ipcr/text"/>
    <xsl:apply-templates select="classification-national"/>
    <xsl:apply-templates select="classification-national/@id"/>
    <xsl:apply-templates select="classification-national/country"/>
    <xsl:apply-templates select="classification-national/edition"/>
    <xsl:apply-templates select="classification-national/main-classification"/>
    <xsl:apply-templates select="classification-national/main-classification/text()"/>
    <xsl:apply-templates select="classification-national/further-classification"/>
    <xsl:apply-templates select="classification-national/further-classification/@id"/>
    <xsl:apply-templates select="classification-national/further-classification/text()"/>
    <xsl:apply-templates select="classification-locarno"/>
    <xsl:apply-templates select="classification-locarno/@id"/>
    <xsl:apply-templates select="classification-locarno/edition"/>
    <xsl:apply-templates select="classification-locarno/edition/text()"/>
    <xsl:apply-templates select="classification-locarno/main-classification"/>
    <xsl:apply-templates select="classification-locarno/text"/>
    <xsl:apply-templates select="priority-claims"/>
    <xsl:apply-templates select="priority-claims/priority-claim"/>
    <xsl:apply-templates select="priority-claims/priority-claim/@id"/>
    <xsl:apply-templates select="priority-claims/priority-claim/@sequence"/>
    <xsl:apply-templates select="priority-claims/priority-claim/@kind"/>
    <xsl:apply-templates select="priority-claims/priority-claim/country"/>
    <xsl:apply-templates select="priority-claims/priority-claim/doc-number"/>
    <xsl:apply-templates select="priority-claims/priority-claim/doc-number/text()"/>
    <xsl:apply-templates select="priority-claims/priority-claim/date"/>
    <xsl:apply-templates select="priority-claims/priority-claim/priority-doc-requested"/>
    <xsl:apply-templates select="priority-claims/priority-claim/priority-doc-attached"/>
    <xsl:apply-templates select="priority-claims/priority-claim/priority-doc-from-library"/>
    <xsl:apply-templates select="priority-claims/priority-claim/priority-doc-from-library/@library-identifier"/>
    <xsl:apply-templates select="priority-claims/priority-claim/priority-doc-from-library/@action-by"/>
    <xsl:apply-templates select="designation-of-states/designation-pct"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/regional"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/regional/region/country"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/regional/country"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national/country"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national/country/text()"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national/protection-request/@subset"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national/protection-request/kind-of-protection"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/national/protection-request/document-id"/>
    <xsl:apply-templates select="designation-of-states/designation-pct/new-designation-country"/>
    <xsl:apply-templates select="licensee-data"/>
    <xsl:apply-templates select="licensee-data/licensee"/>
    <xsl:apply-templates select="licensee-data/licensee/addressbook"/>
    <xsl:apply-templates select="licensee-data/attorney-or-cn-agent"/>
    <xsl:apply-templates select="licensee-data/attorney-or-cn-agent/@rep-type"/>
    <xsl:apply-templates select="licensee-data/attorney-or-cn-agent/addressbook"/>
    <xsl:apply-templates select="licensee-data/effective-in"/>
    <xsl:apply-templates select="licensee-data/effective-in/country"/>
    <xsl:apply-templates select="dates-of-public-availability"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference/@id"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference/@country"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference/gazette-num"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference/gazette-num/text()"/>
    <xsl:apply-templates select="dates-of-public-availability/gazette-reference/text"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-not-printed-without-grant"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-not-printed-without-grant/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-not-printed-without-grant/text"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-not-printed-without-grant"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-not-printed-without-grant/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-not-printed-without-grant/text"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-printed-without-grant"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-printed-without-grant/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/unexamined-printed-without-grant/text"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-printed-without-grant"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-printed-without-grant/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/examined-printed-without-grant/text"/>
    <xsl:apply-templates select="dates-of-public-availability/claims-only-available"/>
    <xsl:apply-templates select="dates-of-public-availability/claims-only-available/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/claims-only-available/text"/>
    <xsl:apply-templates select="dates-of-public-availability/not-printed-with-grant"/>
    <xsl:apply-templates select="dates-of-public-availability/not-printed-with-grant/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/invalidation-of-patent"/>
    <xsl:apply-templates select="dates-of-public-availability/invalidation-of-patent/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/printed-as-amended"/>
    <xsl:apply-templates select="dates-of-public-availability/printed-as-amended/document-id"/>
    <xsl:apply-templates select="dates-of-public-availability/printed-as-amended/text"/>
    <xsl:apply-templates select="term-of-grant"/>
    <xsl:apply-templates select="term-of-grant/disclaimer"/>
    <xsl:apply-templates select="term-of-grant/disclaimer/date"/>
    <xsl:apply-templates select="term-of-grant/disclaimer/text"/>
    <xsl:apply-templates select="term-of-grant/length-of-grant"/>
    <xsl:apply-templates select="term-of-grant/lapse-of-patent"/>
    <xsl:apply-templates select="dates-rights-effective"/>
    <xsl:apply-templates select="dates-rights-effective/request-for-examination/date"/>
    <xsl:apply-templates select="dates-rights-effective/first-examination-report-despatched/date"/>
    <xsl:apply-templates select="dates-rights-effective/patent-maintained-as-amended/date"/>
    <xsl:apply-templates select="dates-rights-effective/request-for-conversion-to-national-application"/>
    <xsl:apply-templates select="dates-rights-effective/request-for-conversion-to-national-application/date"/>
    <xsl:apply-templates select="dates-rights-effective/request-for-conversion-to-national-application/country"/>
    <xsl:apply-templates select="dates-rights-effective/proceedings-suspended/date"/>
    <xsl:apply-templates select="dates-rights-effective/proceedings-interrupted/date"/>
    <xsl:apply-templates select="dates-rights-effective/proceedings-resumed/date"/>
    <xsl:apply-templates select="dates-rights-effective/notification-of-rights-after-appeal/date"/>
    <xsl:apply-templates select="dates-rights-effective/date-entering-into-force/date"/>
    <xsl:apply-templates select="patent-family"/>
    <xsl:apply-templates select="patent-family/@id"/>
    <xsl:apply-templates select="patent-family/priority-application"/>
    <xsl:apply-templates select="patent-family/priority-application/document-id"/>
    <xsl:apply-templates select="patent-family/family-member"/>
    <xsl:apply-templates select="patent-family/family-member/document-id"/>
    <xsl:apply-templates select="patent-family/text"/>
    <xsl:apply-templates select="document-id"/>
    <xsl:apply-templates select="document-id/country"/>
    <xsl:apply-templates select="document-id/doc-number"/>
    <xsl:apply-templates select="document-id/kind"/>
    <xsl:apply-templates select="document-id/date"/>
    <xsl:apply-templates select="field-of-search"/>
    <xsl:apply-templates select="field-of-search/classification-ipc"/>
    <xsl:apply-templates select="field-of-search/classifications-ipcr"/>
    <xsl:apply-templates select="field-of-search/classifications-ipcr/@id"/>
    <xsl:apply-templates select="field-of-search/classification-national"/>
    <xsl:apply-templates select="figures"/>
    <xsl:apply-templates select="figures/number-of-drawing-sheets/text()"/>
    <xsl:apply-templates select="figures/number-of-figures/text()"/>
    <xsl:apply-templates select="figures/figure-to-publish"/>
    <xsl:apply-templates select="figures/figure-to-publish/fig-number/text()"/>
    <xsl:apply-templates select="references-cited"/>
    <xsl:apply-templates select="references-cited/citation"/>
    <xsl:apply-templates select="references-cited/citation/@id"/>
    <xsl:apply-templates select="references-cited/citation/patcit"/>
    <xsl:apply-templates select="references-cited/citation/patcit/@id"/>
    <xsl:apply-templates select="references-cited/citation/patcit/@num"/>
    <xsl:apply-templates select="references-cited/citation/patcit/text"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/@lang"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/country"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/doc-number"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/kind"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/name"/>
    <xsl:apply-templates select="references-cited/citation/patcit/document-id/date"/>
    <xsl:apply-templates select="references-cited/citation/nplcit"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/@id"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/@num"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/@lang"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/article"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/book"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/book/notes"/>
    <xsl:apply-templates select="references-cited/citation/nplcit/othercit"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/text"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/passage"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/passage/text()"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/category"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/rel-claims"/>
    <xsl:apply-templates select="references-cited/citation/rel-passage/rel-claims/text()"/>
    <xsl:apply-templates select="references-cited/citation/category/text()"/>
    <xsl:apply-templates select="references-cited/citation/classification-national"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/@id"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/country"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/edition"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/main-classification"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/main-classification/text()"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/further-classification"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/further-classification/@id"/>
    <xsl:apply-templates select="references-cited/citation/classification-national/further-classification/text()"/>
    <xsl:apply-templates select="st50-republication"/>
    <xsl:apply-templates select="st50-republication/republication-code"/>
    <xsl:apply-templates select="st50-republication/cancellation-date"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-bibliography"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-bibliography/inid-code"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-bibliography/inid-code/@sequence"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-part"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-part/@sequence"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-part/@lang"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-part/modified-part-name"/>
    <xsl:apply-templates select="st50-republication/modifications/modified-part/modified-item"/>
    <xsl:apply-templates select="st50-republication/republication-notes"/>
    <xsl:apply-templates select="st50-republication/republication-notes/republication-note"/>
    <xsl:apply-templates select="st50-republication/republication-notes/republication-note/@sequence"/>
    <xsl:apply-templates select="st50-republication/republication-notes/republication-note/@lang"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference/@id"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference/@country"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference/gazette-num"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference/date"/>
    <xsl:apply-templates select="st50-republication/correction-notice/gazette-reference/text"/>
    <xsl:apply-templates select="cn-related-documents"/>
    <xsl:apply-templates select="cn-related-documents/addition"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc/parent-status"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc/parent-grant-document/document-id"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc/parent-pct-document"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/parent-doc/parent-pct-document/document-id"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/child-doc"/>
    <xsl:apply-templates select="cn-related-documents/addition/relation/child-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/division"/>
    <xsl:apply-templates select="cn-related-documents/continuation"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/parent-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/parent-doc/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/parent-doc/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/child-doc"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/child-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/child-doc/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/continuation/relation/child-doc/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/date"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-status"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/kind"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/date"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/child-doc"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/child-doc/document-id"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/child-doc/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/continuation-in-part/relation/child-doc/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/continuing-reissue"/>
    <xsl:apply-templates select="cn-related-documents/reissue"/>
    <xsl:apply-templates select="cn-related-documents/reexamination"/>
    <xsl:apply-templates select="cn-related-documents/substitution"/>
    <xsl:apply-templates select="cn-related-documents/utility-model-basis"/>
    <xsl:apply-templates select="cn-related-documents/correction"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication/document-id"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication/document-id/country"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication/document-id/doc-number"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication/document-id/kind"/>
    <xsl:apply-templates select="cn-related-documents/cn-related-publication/document-id/date"/>
    <xsl:apply-templates select="pct-or-regional-filing-data"/>
    <xsl:apply-templates select="pct-or-regional-filing-data/document-id/country"/>
    <xsl:apply-templates select="pct-or-regional-filing-data/document-id/doc-number"/>
    <xsl:apply-templates select="pct-or-regional-filing-data/document-id/date"/>
    <xsl:apply-templates select="pct-or-regional-filing-data/us-371c124-date/date"/>
    <xsl:apply-templates select="pct-or-regional-filing-data/document-id/@lang"/>
    <xsl:apply-templates select="application-reference"/>
    <xsl:apply-templates select="application-reference/@id"/>
    <xsl:apply-templates select="application-reference/@appl-type"/>
    <xsl:apply-templates select="application-reference/document-id/country"/>
    <xsl:apply-templates select="application-reference/document-id/doc-number"/>
    <xsl:apply-templates select="application-reference/document-id/date"/>
    <xsl:apply-templates select="electronic-signature"/>
    <xsl:apply-templates select="electronic-signature/@date"/>
    <xsl:apply-templates select="electronic-signature/@place-signed"/>
    <xsl:apply-templates select="electronic-signature/basic-signature"/>
    <xsl:apply-templates select="electronic-signature/basic-signature/fax-image/@file"/>
    <xsl:apply-templates select="electronic-signature/basic-signature/text-string"/>
    <xsl:apply-templates select="electronic-signature/basic-signature/click-wrap"/>
    <xsl:apply-templates select="electronic-signature/enhanced-signature"/>
    <xsl:apply-templates select="electronic-signature/enhanced-signature/pkcs7"/>
    <xsl:apply-templates select="addressbook"/>
    <xsl:apply-templates select="addressbook/@lang"/>
    <xsl:apply-templates select="addressbook/name"/>
    <xsl:apply-templates select="addressbook/prefix"/>
    <xsl:apply-templates select="addressbook/last-name"/>
    <xsl:apply-templates select="addressbook/orgname"/>
    <xsl:apply-templates select="addressbook/orgname/text()"/>
    <xsl:apply-templates select="addressbook/first-name"/>
    <xsl:apply-templates select="addressbook/middle-name"/>
    <xsl:apply-templates select="addressbook/first-last-name"/>
    <xsl:apply-templates select="addressbook/second-last-name"/>
    <xsl:apply-templates select="addressbook/suffix"/>
    <xsl:apply-templates select="addressbook/role"/>
    <xsl:apply-templates select="addressbook/address"/>
    <xsl:apply-templates select="addressbook/address/address-1"/>
    <xsl:apply-templates select="addressbook/address/address-1/text()"/>
    <xsl:apply-templates select="addressbook/address/address-2"/>
    <xsl:apply-templates select="addressbook/address/address-2/text()"/>
    <xsl:apply-templates select="addressbook/address/address-3"/>
    <xsl:apply-templates select="addressbook/address/address-3/text()"/>
    <xsl:apply-templates select="addressbook/address/address-4"/>
    <xsl:apply-templates select="addressbook/address/address-4/text()"/>
    <xsl:apply-templates select="addressbook/address/address-5"/>
    <xsl:apply-templates select="addressbook/address/address-5/text()"/>
    <xsl:apply-templates select="addressbook/address/mailcode"/>
    <xsl:apply-templates select="addressbook/address/pobox"/>
    <xsl:apply-templates select="addressbook/address/pobox/text()"/>
    <xsl:apply-templates select="addressbook/address/room"/>
    <xsl:apply-templates select="addressbook/address/room/text()"/>
    <xsl:apply-templates select="addressbook/address/address-floor"/>
    <xsl:apply-templates select="addressbook/address/address-floor/text()"/>
    <xsl:apply-templates select="addressbook/address/building"/>
    <xsl:apply-templates select="addressbook/address/building/text()"/>
    <xsl:apply-templates select="addressbook/address/street"/>
    <xsl:apply-templates select="addressbook/address/street/text()"/>
    <xsl:apply-templates select="addressbook/address/city"/>
    <xsl:apply-templates select="addressbook/address/county"/>
    <xsl:apply-templates select="addressbook/address/county/text()"/>
    <xsl:apply-templates select="addressbook/address/state"/>
    <xsl:apply-templates select="addressbook/address/state/text()"/>
    <xsl:apply-templates select="addressbook/address/postcode"/>
    <xsl:apply-templates select="addressbook/address/country"/>
    <xsl:apply-templates select="addressbook/address/text"/>
    <xsl:apply-templates select="addressbook/phone"/>
    <xsl:apply-templates select="addressbook/fax"/>
    <xsl:apply-templates select="addressbook/email"/>
    <xsl:apply-templates select="addressbook/email/@email-purpose"/>
    <xsl:apply-templates select="addressbook/url"/>
    <xsl:apply-templates select="addressbook/ead"/>
    <xsl:apply-templates select="cn-parties"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/@sequence"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/@app-type"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/@designation"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/addressbook"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/nationality/country"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/residence/country"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/us-rights"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/us-rights/@kind"/>
    <xsl:apply-templates select="cn-parties/cn-cn-applicants/cn-applicant/us-rights/text()"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/@sequence"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/@designation"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/addressbook"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/designated-states"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/designated-states/country"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/designated-states/region"/>
    <xsl:apply-templates select="cn-parties/cn-cn-inventors/cn-inventor/designated-states/region/country"/>
    <xsl:apply-templates select="cn-parties/correspondence-address"/>
    <xsl:apply-templates select="cn-parties/correspondence-address/customer-number"/>
    <xsl:apply-templates select="cn-parties/correspondence-address/addressbook"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents/customer-number"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents/cn-agent"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents/cn-agent/@sequence"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents/cn-agent/@rep-type"/>
    <xsl:apply-templates select="cn-parties/cn-cn-agents/cn-agent/addressbook"/>
    <xsl:apply-templates select="assignees"/>
    <xsl:apply-templates select="assignees/assignee"/>
    <xsl:apply-templates select="assignees/assignee/addressbook"/>
    <xsl:apply-templates select="examiners"/>
    <xsl:apply-templates select="examiners/primary-examiner"/>
    <xsl:apply-templates select="examiners/primary-examiner/name"/>
    <xsl:apply-templates select="examiners/primary-examiner/prefix"/>
    <xsl:apply-templates select="examiners/primary-examiner/last-name"/>
    <xsl:apply-templates select="examiners/primary-examiner/orgname"/>
    <xsl:apply-templates select="examiners/primary-examiner/orgname/text()"/>
    <xsl:apply-templates select="examiners/primary-examiner/first-name"/>
    <xsl:apply-templates select="examiners/primary-examiner/middle-name"/>
    <xsl:apply-templates select="examiners/primary-examiner/first-last-name"/>
    <xsl:apply-templates select="examiners/primary-examiner/second-last-name"/>
    <xsl:apply-templates select="examiners/primary-examiner/suffix"/>
    <xsl:apply-templates select="examiners/primary-examiner/role"/>
    <xsl:apply-templates select="examiners/primary-examiner/synonym"/>
    <xsl:apply-templates select="examiners/primary-examiner/electronic-signature"/>
    <xsl:apply-templates select="examiners/assistant-examiner"/>
    <xsl:apply-templates select="examiners/assistant-examiner/name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/prefix"/>
    <xsl:apply-templates select="examiners/assistant-examiner/last-name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/orgname"/>
    <xsl:apply-templates select="examiners/assistant-examiner/orgname/text()"/>
    <xsl:apply-templates select="examiners/assistant-examiner/first-name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/middle-name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/first-last-name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/second-last-name"/>
    <xsl:apply-templates select="examiners/assistant-examiner/suffix"/>
    <xsl:apply-templates select="examiners/assistant-examiner/role"/>
    <xsl:apply-templates select="examiners/assistant-examiner/synonym"/>
    <xsl:apply-templates select="examiners/assistant-examiner/electronic-signature"/>
    <xsl:apply-templates select="examiners/authorized-officer"/>
    <xsl:apply-templates select="examiners/authorized-officer/name"/>
    <xsl:apply-templates select="examiners/authorized-officer/prefix"/>
    <xsl:apply-templates select="examiners/authorized-officer/last-name"/>
    <xsl:apply-templates select="examiners/authorized-officer/orgname"/>
    <xsl:apply-templates select="examiners/authorized-officer/orgname/text()"/>
    <xsl:apply-templates select="examiners/authorized-officer/first-name"/>
    <xsl:apply-templates select="examiners/authorized-officer/middle-name"/>
    <xsl:apply-templates select="examiners/authorized-officer/first-last-name"/>
    <xsl:apply-templates select="examiners/authorized-officer/second-last-name"/>
    <xsl:apply-templates select="examiners/authorized-officer/suffix"/>
    <xsl:apply-templates select="examiners/authorized-officer/role"/>
    <xsl:apply-templates select="examiners/authorized-officer/synonym"/>
    <xsl:apply-templates select="examiners/authorized-officer/phone"/>
    <xsl:apply-templates select="examiners/authorized-officer/fax"/>
    <xsl:apply-templates select="examiners/authorized-officer/email"/>
    <xsl:apply-templates select="examiners/authorized-officer/electronic-signature"/>
    <xsl:apply-templates select="invention-title"/>
    <xsl:apply-templates select="invention-title/@id"/>
    <xsl:apply-templates select="invention-title/@lang"/>
    <xsl:apply-templates select="invention-title/text()"/>
    <xsl:apply-templates select="invention-title/b"/>
    <xsl:apply-templates select="invention-title/b/text()"/>
    <xsl:apply-templates select="invention-title/b/i"/>
    <xsl:apply-templates select="invention-title/b/i/text()"/>
    <xsl:apply-templates select="invention-title/b/u"/>
    <xsl:apply-templates select="invention-title/b/u/text()"/>
    <xsl:apply-templates select="invention-title/b/o"/>
    <xsl:apply-templates select="invention-title/b/o/text()"/>
    <xsl:apply-templates select="invention-title/b/smallcaps"/>
    <xsl:apply-templates select="invention-title/b/smallcaps/text()"/>
    <xsl:apply-templates select="invention-title/b/sup"/>
    <xsl:apply-templates select="invention-title/b/sup/text()"/>
    <xsl:apply-templates select="invention-title/b/sub"/>
    <xsl:apply-templates select="invention-title/b/sub/text()"/>
    <xsl:apply-templates select="invention-title/i"/>
    <xsl:apply-templates select="invention-title/i/text()"/>
    <xsl:apply-templates select="invention-title/u"/>
    <xsl:apply-templates select="invention-title/u/text()"/>
    <xsl:apply-templates select="invention-title/o"/>
    <xsl:apply-templates select="invention-title/o/text()"/>
    <xsl:apply-templates select="invention-title/sup"/>
    <xsl:apply-templates select="invention-title/sup/text()"/>
    <xsl:apply-templates select="invention-title/sub"/>
    <xsl:apply-templates select="invention-title/sub/text()"/>
    <xsl:apply-templates select="bio-deposit"/>
    <xsl:apply-templates select="bio-deposit/@id"/>
    <xsl:apply-templates select="bio-deposit/@num"/>
    <xsl:apply-templates select="bio-deposit/@url"/>
    <xsl:apply-templates select="bio-deposit/depositary"/>
    <xsl:apply-templates select="bio-deposit/depositary/address"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-1"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-1/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-2"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-2/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-3"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-3/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-4"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-4/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-5"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-5/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/mailcode"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/pobox"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/pobox/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/room"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/room/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-floor"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/address-floor/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/building"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/building/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/street"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/street/text()"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/city"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/county"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/postcode"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/country"/>
    <xsl:apply-templates select="bio-deposit/depositary/address/text"/>
    <xsl:apply-templates select="bio-deposit/bio-accno"/>
    <xsl:apply-templates select="bio-deposit/date"/>
    <xsl:apply-templates select="bio-deposit/term"/>
    <xsl:apply-templates select="bio-deposit/dtext"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/document-id"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference/@id"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference/@country"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference/gazette-num"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference/date"/>
    <xsl:apply-templates select="pct-or-regional-publishing-data/gazette-reference/text"/>
    <xsl:apply-templates select="name"/>
    <xsl:apply-templates select="name/@name-type"/>
    <xsl:apply-templates select="name/text()"/>
    <xsl:apply-templates select="orgname"/>
    <xsl:apply-templates select="orgname/text()"/>
    <xsl:apply-templates select="state"/>
    <xsl:apply-templates select="address-2"/>
    <xsl:apply-templates select="address-5"/>
    <xsl:apply-templates select="county"/>
    <xsl:apply-templates select="address-3"/>
    <xsl:apply-templates select="pobox"/>
    <xsl:apply-templates select="room"/>
    <xsl:apply-templates select="address-floor"/>
    <xsl:apply-templates select="building"/>
    <xsl:apply-templates select="street"/>
    <xsl:apply-templates select="address-4"/>
    <xsl:apply-templates select="address-1"/>
    <xsl:apply-templates select="cn-patent-document/@lang"/>
    <xsl:apply-templates select="cn-patent-document/@file"/>
    <xsl:apply-templates select="cn-patent-document/@file-reference-id"/>
    <xsl:apply-templates select="cn-patent-document/@country"/>
    <xsl:apply-templates select="cn-patent-document/@status"/>
    <xsl:apply-templates select="cn-patent-document/doc-page"/>
    <xsl:apply-templates select="cn-patent-document/description"/>
    <xsl:apply-templates select="cn-patent-document/description/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/@lang"/>
    <xsl:apply-templates select="cn-patent-document/description/doc-page"/>
    <xsl:apply-templates select="cn-patent-document/description/invention-title"/>
    <xsl:apply-templates select="cn-patent-document/description/technical-field"/>
    <xsl:apply-templates select="cn-patent-document/description/technical-field/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/technical-field/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/technical-field/p"/>
    <xsl:apply-templates select="cn-patent-document/description/background-art"/>
    <xsl:apply-templates select="cn-patent-document/description/background-art/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/background-art/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/background-art/p"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-problem"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-problem/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-problem/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-problem/p"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-solution"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-solution/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-solution/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/tech-solution/p"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/advantageous-effects"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/advantageous-effects/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/advantageous-effects/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/advantageous-effects/p"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/disclosure/p"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-problem"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-problem/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-problem/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-problem/p"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-solution"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-solution/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-solution/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/tech-solution/p"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/advantageous-effects"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/advantageous-effects/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/advantageous-effects/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/advantageous-effects/p"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/summary-of-invention/p"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-drawings"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-drawings/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-drawings/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-drawings/p"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/embodiments-example"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/embodiments-example/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/embodiments-example/@ex-num"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/embodiments-example/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/embodiments-example/p"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/description-of-embodiments/p"/>
    <xsl:apply-templates select="cn-patent-document/description/best-mode"/>
    <xsl:apply-templates select="cn-patent-document/description/best-mode/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/best-mode/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/best-mode/p"/>
    <xsl:apply-templates select="cn-patent-document/description/mode-for-invention"/>
    <xsl:apply-templates select="cn-patent-document/description/mode-for-invention/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/mode-for-invention/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/mode-for-invention/p"/>
    <xsl:apply-templates select="cn-patent-document/description/industrial-applicability"/>
    <xsl:apply-templates select="cn-patent-document/description/industrial-applicability/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/industrial-applicability/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/industrial-applicability/p"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-signs-list"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-signs-list/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-signs-list/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-signs-list/p"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-to-deposited-biological-material"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-to-deposited-biological-material/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-to-deposited-biological-material/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/reference-to-deposited-biological-material/p"/>
    <xsl:apply-templates select="cn-patent-document/description/sequence-list-text"/>
    <xsl:apply-templates select="cn-patent-document/description/sequence-list-text/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/sequence-list-text/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/sequence-list-text/p"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/patent-literature"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/patent-literature/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/patent-literature/p"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/non-patent-literature"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/non-patent-literature/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/non-patent-literature/p"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/citation-list/p"/>
    <xsl:apply-templates select="cn-patent-document/description/heading"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/@level"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/@id"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/b"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/b/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/i"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/i/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/u"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/u/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/o"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/o/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/sup"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/sup/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/sub"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/sub/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/smallcaps"/>
    <xsl:apply-templates select="cn-patent-document/description/heading/smallcaps/text()"/>
    <xsl:apply-templates select="cn-patent-document/description/p"/>
    <xsl:apply-templates select="cn-patent-document/claims"/>
    <xsl:apply-templates select="cn-patent-document/claims/@id"/>
    <xsl:apply-templates select="cn-patent-document/abstract"/>
    <xsl:apply-templates select="cn-patent-document/abstract/@id"/>
    <xsl:apply-templates select="cn-patent-document/abstract/@lang"/>
    <xsl:apply-templates select="cn-patent-document/abstract/doc-page"/>
    <xsl:apply-templates select="cn-patent-document/abstract/p"/>
    <xsl:apply-templates select="cn-patent-document/drawings"/>
    <xsl:apply-templates select="cn-patent-document/drawings/@id"/>
    <xsl:apply-templates select="cn-patent-document/drawings/doc-page"/>
    <xsl:apply-templates select="cn-patent-document/drawings/figure"/>
    <xsl:apply-templates select="b"/>
    <xsl:apply-templates select="b/text()"/>
    <xsl:apply-templates select="b/i"/>
    <xsl:apply-templates select="b/i/text()"/>
    <xsl:apply-templates select="b/i/b"/>
    <xsl:apply-templates select="b/i/b/text()"/>
    <xsl:apply-templates select="b/i/u"/>
    <xsl:apply-templates select="b/i/u/text()"/>
    <xsl:apply-templates select="b/i/o"/>
    <xsl:apply-templates select="b/i/o/text()"/>
    <xsl:apply-templates select="b/i/sup"/>
    <xsl:apply-templates select="b/i/sup/text()"/>
    <xsl:apply-templates select="b/i/sub"/>
    <xsl:apply-templates select="b/i/sub/text()"/>
    <xsl:apply-templates select="b/u"/>
    <xsl:apply-templates select="b/u/text()"/>
    <xsl:apply-templates select="b/u/b"/>
    <xsl:apply-templates select="b/u/b/text()"/>
    <xsl:apply-templates select="b/u/i"/>
    <xsl:apply-templates select="b/u/i/text()"/>
    <xsl:apply-templates select="b/u/sup"/>
    <xsl:apply-templates select="b/u/sup/text()"/>
    <xsl:apply-templates select="b/u/sub"/>
    <xsl:apply-templates select="b/u/sub/text()"/>
    <xsl:apply-templates select="b/o"/>
    <xsl:apply-templates select="b/o/text()"/>
    <xsl:apply-templates select="b/o/b"/>
    <xsl:apply-templates select="b/o/b/text()"/>
    <xsl:apply-templates select="b/o/i"/>
    <xsl:apply-templates select="b/o/i/text()"/>
    <xsl:apply-templates select="b/o/sup"/>
    <xsl:apply-templates select="b/o/sup/text()"/>
    <xsl:apply-templates select="b/o/sub"/>
    <xsl:apply-templates select="b/o/sub/text()"/>
    <xsl:apply-templates select="b/smallcaps"/>
    <xsl:apply-templates select="b/smallcaps/text()"/>
    <xsl:apply-templates select="b/smallcaps/b"/>
    <xsl:apply-templates select="b/smallcaps/b/text()"/>
    <xsl:apply-templates select="b/smallcaps/u"/>
    <xsl:apply-templates select="b/smallcaps/u/text()"/>
    <xsl:apply-templates select="b/smallcaps/i"/>
    <xsl:apply-templates select="b/smallcaps/i/text()"/>
    <xsl:apply-templates select="b/smallcaps/o"/>
    <xsl:apply-templates select="b/smallcaps/o/text()"/>
    <xsl:apply-templates select="b/sup/b"/>
    <xsl:apply-templates select="b/sup/b/text()"/>
    <xsl:apply-templates select="b/sup/u"/>
    <xsl:apply-templates select="b/sup/u/text()"/>
    <xsl:apply-templates select="b/sup/i"/>
    <xsl:apply-templates select="b/sup/i/text()"/>
    <xsl:apply-templates select="b/sup/o"/>
    <xsl:apply-templates select="b/sup/o/text()"/>
    <xsl:apply-templates select="b/sup/sup2"/>
    <xsl:apply-templates select="b/sup/sup2/text()"/>
    <xsl:apply-templates select="b/sup/sup2/b"/>
    <xsl:apply-templates select="b/sup/sup2/b/text()"/>
    <xsl:apply-templates select="b/sup/sup2/u"/>
    <xsl:apply-templates select="b/sup/sup2/u/text()"/>
    <xsl:apply-templates select="b/sup/sup2/i"/>
    <xsl:apply-templates select="b/sup/sup2/i/text()"/>
    <xsl:apply-templates select="b/sup/sup2/o"/>
    <xsl:apply-templates select="b/sup/sup2/o/text()"/>
    <xsl:apply-templates select="b/sup/sub2"/>
    <xsl:apply-templates select="b/sup/sub2/text()"/>
    <xsl:apply-templates select="b/sup/sub2/b"/>
    <xsl:apply-templates select="b/sup/sub2/b/text()"/>
    <xsl:apply-templates select="b/sup/sub2/u"/>
    <xsl:apply-templates select="b/sup/sub2/u/text()"/>
    <xsl:apply-templates select="b/sup/sub2/i"/>
    <xsl:apply-templates select="b/sup/sub2/i/text()"/>
    <xsl:apply-templates select="b/sup/sub2/o"/>
    <xsl:apply-templates select="b/sup/sub2/o/text()"/>
    <xsl:apply-templates select="b/sub"/>
    <xsl:apply-templates select="b/sub/text()"/>
    <xsl:apply-templates select="b/sub/b"/>
    <xsl:apply-templates select="b/sub/b/text()"/>
    <xsl:apply-templates select="b/sub/u"/>
    <xsl:apply-templates select="b/sub/u/text()"/>
    <xsl:apply-templates select="b/sub/i"/>
    <xsl:apply-templates select="b/sub/i/text()"/>
    <xsl:apply-templates select="b/sub/o"/>
    <xsl:apply-templates select="b/sub/o/text()"/>
    <xsl:apply-templates select="b/sub/sup2"/>
    <xsl:apply-templates select="b/sub/sup2/text()"/>
    <xsl:apply-templates select="b/sub/sup2/b"/>
    <xsl:apply-templates select="b/sub/sup2/b/text()"/>
    <xsl:apply-templates select="b/sub/sup2/u"/>
    <xsl:apply-templates select="b/sub/sup2/u/text()"/>
    <xsl:apply-templates select="b/sub/sup2/i"/>
    <xsl:apply-templates select="b/sub/sup2/i/text()"/>
    <xsl:apply-templates select="b/sub/sup2/o"/>
    <xsl:apply-templates select="b/sub/sup2/o/text()"/>
    <xsl:apply-templates select="b/sub/sub2"/>
    <xsl:apply-templates select="b/sub/sub2/text()"/>
    <xsl:apply-templates select="b/sub/sub2/b"/>
    <xsl:apply-templates select="b/sub/sub2/b/text()"/>
    <xsl:apply-templates select="b/sub/sub2/u"/>
    <xsl:apply-templates select="b/sub/sub2/u/text()"/>
    <xsl:apply-templates select="b/sub/sub2/i"/>
    <xsl:apply-templates select="b/sub/sub2/i/text()"/>
    <xsl:apply-templates select="b/sub/sub2/o"/>
    <xsl:apply-templates select="b/sub/sub2/o/text()"/>
    <xsl:apply-templates select="i"/>
    <xsl:apply-templates select="i/text()"/>
    <xsl:apply-templates select="i/b"/>
    <xsl:apply-templates select="i/u"/>
    <xsl:apply-templates select="i/o"/>
    <xsl:apply-templates select="i/smallcaps"/>
    <xsl:apply-templates select="i/sup"/>
    <xsl:apply-templates select="i/sub"/>
    <xsl:apply-templates select="li"/>
    <xsl:apply-templates select="li/@id"/>
    <xsl:apply-templates select="li/@num"/>
    <xsl:apply-templates select="li/text()"/>
    <xsl:apply-templates select="li/b"/>
    <xsl:apply-templates select="li/b/text()"/>
    <xsl:apply-templates select="li/b/i"/>
    <xsl:apply-templates select="li/b/i/text()"/>
    <xsl:apply-templates select="li/b/u"/>
    <xsl:apply-templates select="li/b/u/text()"/>
    <xsl:apply-templates select="li/b/o"/>
    <xsl:apply-templates select="li/b/o/text()"/>
    <xsl:apply-templates select="li/b/sup"/>
    <xsl:apply-templates select="li/b/sup/text()"/>
    <xsl:apply-templates select="li/b/sub"/>
    <xsl:apply-templates select="li/b/sub/text()"/>
    <xsl:apply-templates select="li/i"/>
    <xsl:apply-templates select="li/i/text()"/>
    <xsl:apply-templates select="li/i/b"/>
    <xsl:apply-templates select="li/i/b/text()"/>
    <xsl:apply-templates select="li/i/u"/>
    <xsl:apply-templates select="li/i/u/text()"/>
    <xsl:apply-templates select="li/i/o"/>
    <xsl:apply-templates select="li/i/o/text()"/>
    <xsl:apply-templates select="li/i/sup"/>
    <xsl:apply-templates select="li/i/sup/text()"/>
    <xsl:apply-templates select="li/i/sub"/>
    <xsl:apply-templates select="li/i/sub/text()"/>
    <xsl:apply-templates select="li/u"/>
    <xsl:apply-templates select="li/u/text()"/>
    <xsl:apply-templates select="li/u/b"/>
    <xsl:apply-templates select="li/u/b/text()"/>
    <xsl:apply-templates select="li/u/i"/>
    <xsl:apply-templates select="li/u/i/text()"/>
    <xsl:apply-templates select="li/u/sup"/>
    <xsl:apply-templates select="li/u/sup/text()"/>
    <xsl:apply-templates select="li/u/sub"/>
    <xsl:apply-templates select="li/u/sub/text()"/>
    <xsl:apply-templates select="li/o"/>
    <xsl:apply-templates select="li/o/text()"/>
    <xsl:apply-templates select="li/o/b"/>
    <xsl:apply-templates select="li/o/b/text()"/>
    <xsl:apply-templates select="li/o/i"/>
    <xsl:apply-templates select="li/o/i/text()"/>
    <xsl:apply-templates select="li/o/sup"/>
    <xsl:apply-templates select="li/o/sup/text()"/>
    <xsl:apply-templates select="li/o/sub"/>
    <xsl:apply-templates select="li/o/sub/text()"/>
    <xsl:apply-templates select="li/sup"/>
    <xsl:apply-templates select="li/sup/text()"/>
    <xsl:apply-templates select="li/sup/b"/>
    <xsl:apply-templates select="li/sup/b/text()"/>
    <xsl:apply-templates select="li/sup/u"/>
    <xsl:apply-templates select="li/sup/u/text()"/>
    <xsl:apply-templates select="li/sup/i"/>
    <xsl:apply-templates select="li/sup/i/text()"/>
    <xsl:apply-templates select="li/sup/o"/>
    <xsl:apply-templates select="li/sup/o/text()"/>
    <xsl:apply-templates select="li/sup/sup2"/>
    <xsl:apply-templates select="li/sup/sup2/text()"/>
    <xsl:apply-templates select="li/sup/sup2/b"/>
    <xsl:apply-templates select="li/sup/sup2/b/text()"/>
    <xsl:apply-templates select="li/sup/sup2/u"/>
    <xsl:apply-templates select="li/sup/sup2/u/text()"/>
    <xsl:apply-templates select="li/sup/sup2/i"/>
    <xsl:apply-templates select="li/sup/sup2/i/text()"/>
    <xsl:apply-templates select="li/sup/sup2/o"/>
    <xsl:apply-templates select="li/sup/sup2/o/text()"/>
    <xsl:apply-templates select="li/sup/sub2"/>
    <xsl:apply-templates select="li/sup/sub2/text()"/>
    <xsl:apply-templates select="li/sup/sub2/b"/>
    <xsl:apply-templates select="li/sup/sub2/b/text()"/>
    <xsl:apply-templates select="li/sup/sub2/u"/>
    <xsl:apply-templates select="li/sup/sub2/u/text()"/>
    <xsl:apply-templates select="li/sup/sub2/i"/>
    <xsl:apply-templates select="li/sup/sub2/i/text()"/>
    <xsl:apply-templates select="li/sup/sub2/o"/>
    <xsl:apply-templates select="li/sup/sub2/o/text()"/>
    <xsl:apply-templates select="li/sub"/>
    <xsl:apply-templates select="li/sub/text()"/>
    <xsl:apply-templates select="li/sub/b"/>
    <xsl:apply-templates select="li/sub/b/text()"/>
    <xsl:apply-templates select="li/sub/u"/>
    <xsl:apply-templates select="li/sub/u/text()"/>
    <xsl:apply-templates select="li/sub/i"/>
    <xsl:apply-templates select="li/sub/i/text()"/>
    <xsl:apply-templates select="li/sub/o"/>
    <xsl:apply-templates select="li/sub/o/text()"/>
    <xsl:apply-templates select="li/sub/sup2"/>
    <xsl:apply-templates select="li/sub/sup2/text()"/>
    <xsl:apply-templates select="li/sub/sup2/b"/>
    <xsl:apply-templates select="li/sub/sup2/b/text()"/>
    <xsl:apply-templates select="li/sub/sup2/u"/>
    <xsl:apply-templates select="li/sub/sup2/u/text()"/>
    <xsl:apply-templates select="li/sub/sup2/i"/>
    <xsl:apply-templates select="li/sub/sup2/i/text()"/>
    <xsl:apply-templates select="li/sub/sup2/o"/>
    <xsl:apply-templates select="li/sub/sup2/o/text()"/>
    <xsl:apply-templates select="li/sub/sub2"/>
    <xsl:apply-templates select="li/sub/sub2/text()"/>
    <xsl:apply-templates select="li/sub/sub2/b"/>
    <xsl:apply-templates select="li/sub/sub2/b/text()"/>
    <xsl:apply-templates select="li/sub/sub2/u"/>
    <xsl:apply-templates select="li/sub/sub2/u/text()"/>
    <xsl:apply-templates select="li/sub/sub2/i"/>
    <xsl:apply-templates select="li/sub/sub2/i/text()"/>
    <xsl:apply-templates select="li/sub/sub2/o"/>
    <xsl:apply-templates select="li/sub/sub2/o/text()"/>
    <xsl:apply-templates select="li/smallcaps"/>
    <xsl:apply-templates select="li/smallcaps/text()"/>
    <xsl:apply-templates select="li/smallcaps/b"/>
    <xsl:apply-templates select="li/smallcaps/b/text()"/>
    <xsl:apply-templates select="li/smallcaps/u"/>
    <xsl:apply-templates select="li/smallcaps/u/text()"/>
    <xsl:apply-templates select="li/smallcaps/i"/>
    <xsl:apply-templates select="li/smallcaps/i/text()"/>
    <xsl:apply-templates select="li/smallcaps/o"/>
    <xsl:apply-templates select="li/smallcaps/o/text()"/>
    <xsl:apply-templates select="li/br"/>
    <xsl:apply-templates select="li/pre"/>
    <xsl:apply-templates select="li/pre/@id"/>
    <xsl:apply-templates select="li/pre/@xml:space"/>
    <xsl:apply-templates select="li/pre/@listing-type"/>
    <xsl:apply-templates select="li/pre/text()"/>
    <xsl:apply-templates select="li/patcit"/>
    <xsl:apply-templates select="li/nplcit"/>
    <xsl:apply-templates select="li/bio-deposit"/>
    <xsl:apply-templates select="li/crossref"/>
    <xsl:apply-templates select="li/crossref/@idref"/>
    <xsl:apply-templates select="li/crossref/text()"/>
    <xsl:apply-templates select="li/crossref/b"/>
    <xsl:apply-templates select="li/crossref/b/text()"/>
    <xsl:apply-templates select="li/crossref/i"/>
    <xsl:apply-templates select="li/crossref/i/text()"/>
    <xsl:apply-templates select="li/crossref/u"/>
    <xsl:apply-templates select="li/crossref/u/text()"/>
    <xsl:apply-templates select="li/crossref/o"/>
    <xsl:apply-templates select="li/crossref/o/text()"/>
    <xsl:apply-templates select="li/crossref/sup"/>
    <xsl:apply-templates select="li/crossref/sup/text()"/>
    <xsl:apply-templates select="li/crossref/sub"/>
    <xsl:apply-templates select="li/crossref/sub/text()"/>
    <xsl:apply-templates select="li/crossref/smallcaps"/>
    <xsl:apply-templates select="li/crossref/smallcaps/text()"/>
    <xsl:apply-templates select="li/figref"/>
    <xsl:apply-templates select="li/figref/@idref"/>
    <xsl:apply-templates select="li/figref/@num"/>
    <xsl:apply-templates select="li/figref/text()"/>
    <xsl:apply-templates select="li/figref/b"/>
    <xsl:apply-templates select="li/figref/b/text()"/>
    <xsl:apply-templates select="li/figref/i"/>
    <xsl:apply-templates select="li/figref/i/text()"/>
    <xsl:apply-templates select="li/figref/u"/>
    <xsl:apply-templates select="li/figref/u/text()"/>
    <xsl:apply-templates select="li/figref/o"/>
    <xsl:apply-templates select="li/figref/o/text()"/>
    <xsl:apply-templates select="li/figref/sup"/>
    <xsl:apply-templates select="li/figref/sup/text()"/>
    <xsl:apply-templates select="li/figref/sub"/>
    <xsl:apply-templates select="li/figref/sub/text()"/>
    <xsl:apply-templates select="li/figref/smallcaps"/>
    <xsl:apply-templates select="li/figref/smallcaps/text()"/>
    <xsl:apply-templates select="li/img"/>
    <xsl:apply-templates select="li/dl"/>
    <xsl:apply-templates select="li/ul"/>
    <xsl:apply-templates select="li/ol"/>
    <xsl:apply-templates select="li/chemistry"/>
    <xsl:apply-templates select="li/maths"/>
    <xsl:apply-templates select="o"/>
    <xsl:apply-templates select="o/@style"/>
    <xsl:apply-templates select="o/text()"/>
    <xsl:apply-templates select="o/b"/>
    <xsl:apply-templates select="o/i"/>
    <xsl:apply-templates select="o/smallcaps"/>
    <xsl:apply-templates select="o/sup"/>
    <xsl:apply-templates select="o/sub"/>
    <xsl:apply-templates select="smallcaps"/>
    <xsl:apply-templates select="smallcaps/text()"/>
    <xsl:apply-templates select="smallcaps/b"/>
    <xsl:apply-templates select="smallcaps/u"/>
    <xsl:apply-templates select="smallcaps/i"/>
    <xsl:apply-templates select="smallcaps/o"/>
    <xsl:apply-templates select="sub2"/>
    <xsl:apply-templates select="sub2/text()"/>
    <xsl:apply-templates select="sub2/b"/>
    <xsl:apply-templates select="sub2/u"/>
    <xsl:apply-templates select="sub2/i"/>
    <xsl:apply-templates select="sub2/o"/>
    <xsl:apply-templates select="sub"/>
    <xsl:apply-templates select="sub/text()"/>
    <xsl:apply-templates select="sub/b"/>
    <xsl:apply-templates select="sub/u"/>
    <xsl:apply-templates select="sub/i"/>
    <xsl:apply-templates select="sub/o"/>
    <xsl:apply-templates select="sub/sup2"/>
    <xsl:apply-templates select="sub/sub2"/>
    <xsl:apply-templates select="sup2"/>
    <xsl:apply-templates select="sup2/text()"/>
    <xsl:apply-templates select="sup2/b"/>
    <xsl:apply-templates select="sup2/u"/>
    <xsl:apply-templates select="sup2/i"/>
    <xsl:apply-templates select="sup2/o"/>
    <xsl:apply-templates select="sup"/>
    <xsl:apply-templates select="sup/text()"/>
    <xsl:apply-templates select="sup/b"/>
    <xsl:apply-templates select="sup/u"/>
    <xsl:apply-templates select="sup/i"/>
    <xsl:apply-templates select="sup/o"/>
    <xsl:apply-templates select="sup/sup2"/>
    <xsl:apply-templates select="sup/sub2"/>
    <xsl:apply-templates select="u"/>
    <xsl:apply-templates select="u/text()"/>
    <xsl:apply-templates select="u/b"/>
    <xsl:apply-templates select="u/i"/>
    <xsl:apply-templates select="u/smallcaps"/>
    <xsl:apply-templates select="u/sup"/>
    <xsl:apply-templates select="u/sub"/>
    <xsl:apply-templates select="pre"/>
    <xsl:apply-templates select="pre/@id"/>
    <xsl:apply-templates select="pre/@listing-type"/>
    <xsl:apply-templates select="dl"/>
    <xsl:apply-templates select="dl/@id"/>
    <xsl:apply-templates select="dl/dt"/>
    <xsl:apply-templates select="dl/dd"/>
    <xsl:apply-templates select="dd"/>
    <xsl:apply-templates select="dd/text()"/>
    <xsl:apply-templates select="dd/b"/>
    <xsl:apply-templates select="dd/i"/>
    <xsl:apply-templates select="dd/u"/>
    <xsl:apply-templates select="dd/o"/>
    <xsl:apply-templates select="dd/sup"/>
    <xsl:apply-templates select="dd/sub"/>
    <xsl:apply-templates select="dd/smallcaps"/>
    <xsl:apply-templates select="dd/br"/>
    <xsl:apply-templates select="dd/pre"/>
    <xsl:apply-templates select="dd/patcit"/>
    <xsl:apply-templates select="dd/nplcit"/>
    <xsl:apply-templates select="dd/crossref"/>
    <xsl:apply-templates select="patcit"/>
    <xsl:apply-templates select="patcit/@id"/>
    <xsl:apply-templates select="patcit/@num"/>
    <xsl:apply-templates select="patcit/text"/>
    <xsl:apply-templates select="patcit/document-id"/>
    <xsl:apply-templates select="patcit/document-id/country"/>
    <xsl:apply-templates select="patcit/document-id/doc-number"/>
    <xsl:apply-templates select="patcit/document-id/kind"/>
    <xsl:apply-templates select="patcit/document-id/date"/>
    <xsl:apply-templates select="nplcit"/>
    <xsl:apply-templates select="nplcit/@id"/>
    <xsl:apply-templates select="nplcit/@num"/>
    <xsl:apply-templates select="nplcit/@lang"/>
    <xsl:apply-templates select="nplcit/@file"/>
    <xsl:apply-templates select="nplcit/@url"/>
    <xsl:apply-templates select="nplcit/text"/>
    <xsl:apply-templates select="nplcit/article"/>
    <xsl:apply-templates select="nplcit/article/author"/>
    <xsl:apply-templates select="nplcit/article/atl"/>
    <xsl:apply-templates select="nplcit/article/subname"/>
    <xsl:apply-templates select="nplcit/article/subname/@subname-type"/>
    <xsl:apply-templates select="nplcit/article/subname/name"/>
    <xsl:apply-templates select="nplcit/article/class"/>
    <xsl:apply-templates select="nplcit/article/class/@class-type"/>
    <xsl:apply-templates select="nplcit/article/cpyrt"/>
    <xsl:apply-templates select="nplcit/book"/>
    <xsl:apply-templates select="nplcit/othercit"/>
    <xsl:apply-templates select="bio-deposit"/>
    <xsl:apply-templates select="bio-deposit/@id"/>
    <xsl:apply-templates select="bio-deposit/@num"/>
    <xsl:apply-templates select="bio-deposit/@url"/>
    <xsl:apply-templates select="bio-deposit/depositary"/>
    <xsl:apply-templates select="bio-deposit/bio-accno"/>
    <xsl:apply-templates select="bio-deposit/date"/>
    <xsl:apply-templates select="bio-deposit/term"/>
    <xsl:apply-templates select="bio-deposit/dtext"/>
    <xsl:apply-templates select="crossref"/>
    <xsl:apply-templates select="crossref/@idref"/>
    <xsl:apply-templates select="crossref/text()"/>
    <xsl:apply-templates select="crossref/b"/>
    <xsl:apply-templates select="crossref/i"/>
    <xsl:apply-templates select="crossref/u"/>
    <xsl:apply-templates select="crossref/o"/>
    <xsl:apply-templates select="crossref/sup"/>
    <xsl:apply-templates select="crossref/sub"/>
    <xsl:apply-templates select="crossref/smallcaps"/>
    <xsl:apply-templates select="ul"/>
    <xsl:apply-templates select="ul/@id"/>
    <xsl:apply-templates select="ul/@list-style"/>
    <xsl:apply-templates select="ul/li"/>
    <xsl:apply-templates select="ol"/>
    <xsl:apply-templates select="ol/@id"/>
    <xsl:apply-templates select="ol/@ol-style"/>
    <xsl:apply-templates select="ol/li"/>
    <xsl:apply-templates select="doc-page"/>
    <xsl:apply-templates select="doc-page/@id"/>
    <xsl:apply-templates select="doc-page/@he"/>
    <xsl:apply-templates select="doc-page/@wi"/>
    <xsl:apply-templates select="doc-page/@type"/>
    <xsl:apply-templates select="doc-page/@alt"/>
    <xsl:apply-templates select="doc-page/@ppf"/>
    <xsl:apply-templates select="doc-page/@ppl"/>
    <xsl:apply-templates select="doc-page/@file"/>
    <xsl:apply-templates select="doc-page/@ocr"/>
    <xsl:apply-templates select="doc-page/@color"/>
    <xsl:apply-templates select="doc-page/@orientation"/>
    <xsl:apply-templates select="invention-title"/>
    <xsl:apply-templates select="invention-title/@id"/>
    <xsl:apply-templates select="invention-title/@lang"/>
    <xsl:apply-templates select="invention-title/text()"/>
    <xsl:apply-templates select="invention-title/b"/>
    <xsl:apply-templates select="invention-title/i"/>
    <xsl:apply-templates select="invention-title/u"/>
    <xsl:apply-templates select="invention-title/o"/>
    <xsl:apply-templates select="invention-title/sup"/>
    <xsl:apply-templates select="invention-title/sub"/>
    <xsl:apply-templates select="claims"/>
    <xsl:apply-templates select="claims/@id"/>
    <xsl:apply-templates select="claims/@lang"/>
    <xsl:apply-templates select="claims/doc-page"/>
    <xsl:apply-templates select="claims/claim"/>
    <xsl:apply-templates select="claims/claim/@id"/>
    <xsl:apply-templates select="claims/claim/@num"/>
    <xsl:apply-templates select="claims/claim/claim-text"/>
    <xsl:apply-templates select="claim-text"/>
    <xsl:apply-templates select="claim-text/text()"/>
    <xsl:apply-templates select="claim-text/claim-text"/>
    <xsl:apply-templates select="claim-text/claim-ref"/>
    <xsl:apply-templates select="claim-text/claim-ref/@idref"/>
    <xsl:apply-templates select="claim-text/claim-ref/text()"/>
    <xsl:apply-templates select="claim-text/b"/>
    <xsl:apply-templates select="claim-text/i"/>
    <xsl:apply-templates select="claim-text/u"/>
    <xsl:apply-templates select="claim-text/o"/>
    <xsl:apply-templates select="claim-text/sup"/>
    <xsl:apply-templates select="claim-text/sub"/>
    <xsl:apply-templates select="claim-text/smallcaps"/>
    <xsl:apply-templates select="claim-text/br"/>
    <xsl:apply-templates select="claim-text/pre"/>
    <xsl:apply-templates select="claim-text/crossref"/>
    <xsl:apply-templates select="claim-text/figref"/>
    <xsl:apply-templates select="claim-text/img"/>
    <xsl:apply-templates select="claim-text/chemistry"/>
    <xsl:apply-templates select="claim-text/maths"/>
    <xsl:apply-templates select="claim-text/tables"/>
    <xsl:apply-templates select="figref"/>
    <xsl:apply-templates select="figref/@idref"/>
    <xsl:apply-templates select="figref/@num"/>
    <xsl:apply-templates select="figref/text()"/>
    <xsl:apply-templates select="figref/b"/>
    <xsl:apply-templates select="figref/i"/>
    <xsl:apply-templates select="figref/u"/>
    <xsl:apply-templates select="figref/o"/>
    <xsl:apply-templates select="figref/sup"/>
    <xsl:apply-templates select="figref/sub"/>
    <xsl:apply-templates select="figref/smallcaps"/>
    <xsl:apply-templates select="chemistry"/>
    <xsl:apply-templates select="chemistry/@id"/>
    <xsl:apply-templates select="chemistry/@num"/>
    <xsl:apply-templates select="chemistry/img"/>
    <xsl:apply-templates select="chemistry/chem"/>
    <xsl:apply-templates select="title"/>
    <xsl:apply-templates select="title/text()"/>
    <xsl:apply-templates select="title/b"/>
    <xsl:apply-templates select="title/i"/>
    <xsl:apply-templates select="title/u"/>
    <xsl:apply-templates select="title/sup"/>
    <xsl:apply-templates select="title/sub"/>
    <xsl:apply-templates select="title/smallcaps"/>
    <xsl:apply-templates select="figure"/>
    <xsl:apply-templates select="figure/@id"/>
    <xsl:apply-templates select="figure/@num"/>
    <xsl:apply-templates select="figure/img"/>
    <xsl:apply-templates select="dt"/>
    <xsl:apply-templates select="dt/@id"/>
    <xsl:apply-templates select="dt/text()"/>
    <xsl:apply-templates select="dt/b"/>
    <xsl:apply-templates select="dt/i"/>
    <xsl:apply-templates select="dt/u"/>
    <xsl:apply-templates select="dt/o"/>
    <xsl:apply-templates select="dt/sup"/>
    <xsl:apply-templates select="dt/sub"/>
    <xsl:apply-templates select="dt/smallcaps"/>
    <xsl:apply-templates select="depositary/address/address-1"/>
    <xsl:apply-templates select="depositary/address/address-1/text()"/>
    <xsl:apply-templates select="depositary/address/address-2"/>
    <xsl:apply-templates select="depositary/address/address-2/text()"/>
    <xsl:apply-templates select="depositary/address/address-3"/>
    <xsl:apply-templates select="depositary/address/address-3/text()"/>
    <xsl:apply-templates select="depositary/address/address-4"/>
    <xsl:apply-templates select="depositary/address/address-4/text()"/>
    <xsl:apply-templates select="depositary/address/address-5"/>
    <xsl:apply-templates select="depositary/address/address-5/text()"/>
    <xsl:apply-templates select="depositary/address/mailcode"/>
    <xsl:apply-templates select="depositary/address/pobox"/>
    <xsl:apply-templates select="depositary/address/pobox/text()"/>
    <xsl:apply-templates select="depositary/address/room"/>
    <xsl:apply-templates select="depositary/address/room/text()"/>
    <xsl:apply-templates select="depositary/address/address-floor"/>
    <xsl:apply-templates select="depositary/address/address-floor/text()"/>
    <xsl:apply-templates select="depositary/address/building"/>
    <xsl:apply-templates select="depositary/address/building/text()"/>
    <xsl:apply-templates select="depositary/address/street"/>
    <xsl:apply-templates select="depositary/address/street/text()"/>
    <xsl:apply-templates select="depositary/address/city"/>
    <xsl:apply-templates select="depositary/address/county"/>
    <xsl:apply-templates select="depositary/address/county/text()"/>
    <xsl:apply-templates select="depositary/address/state"/>
    <xsl:apply-templates select="depositary/address/state/text()"/>
    <xsl:apply-templates select="depositary/address/postcode"/>
    <xsl:apply-templates select="depositary/address/country"/>
    <xsl:apply-templates select="depositary/address/text"/>
    <xsl:apply-templates select="depositary/address/text/text()"/>
    <xsl:apply-templates select="img"/>
    <xsl:apply-templates select="img/@id"/>
    <xsl:apply-templates select="img/@he"/>
    <xsl:apply-templates select="img/@wi"/>
    <xsl:apply-templates select="img/@file"/>
    <xsl:apply-templates select="img/@alt"/>
    <xsl:apply-templates select="img/@img-content"/>
    <xsl:apply-templates select="img/@img-format"/>
    <xsl:apply-templates select="img/@orientation"/>
    <xsl:apply-templates select="img/@inline"/>
    <xsl:apply-templates select="tables"/>
    <xsl:apply-templates select="tables/@id"/>
    <xsl:apply-templates select="tables/@num"/>
    <xsl:apply-templates select="tables/img"/>
    <xsl:apply-templates select="tables/table"/>
    <xsl:apply-templates select="tables/table/@frame"/>
    <xsl:apply-templates select="tables/table/@colsep"/>
    <xsl:apply-templates select="tables/table/@rowsep"/>
    <xsl:apply-templates select="tables/table/@pgwide"/>
    <xsl:apply-templates select="tables/table/title"/>
    <xsl:apply-templates select="tables/table/tgroup"/>
    <xsl:apply-templates select="tables/table/tgroup/@cols"/>
    <xsl:apply-templates select="tables/table/tgroup/@colsep"/>
    <xsl:apply-templates select="tables/table/tgroup/@rowsep"/>
    <xsl:apply-templates select="tables/table/tgroup/@align"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@colnum"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@colname"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@colwidth"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@colsep"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@rowsep"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@align"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@char"/>
    <xsl:apply-templates select="tables/table/tgroup/colspec/@charoff"/>
    <xsl:apply-templates select="tables/table/tgroup/thead"/>
    <xsl:apply-templates select="tables/table/tgroup/thead/@valign"/>
    <xsl:apply-templates select="tables/table/tgroup/thead/row"/>
    <xsl:apply-templates select="tables/table/tgroup/thead/row/@rowsep"/>
    <xsl:apply-templates select="tables/table/tgroup/thead/row/@valign"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/@valign"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/@rowsep"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/@valign"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@colname"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@namest"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@nameend"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@morerows"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@colsep"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@rowsep"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@align"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@char"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@charoff"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/@valign"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/text()"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/b"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/i"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/u"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/sup"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/sub"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/smallcaps"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/br"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/patcit"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/nplcit"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/bio-deposit"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/crossref"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/img"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/dl"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/ul"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/ol"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/chemistry"/>
    <xsl:apply-templates select="tables/table/tgroup/tbody/row/entry/maths"/>
    <xsl:apply-templates select="p"/>
    <xsl:apply-templates select="p/@id"/>
    <xsl:apply-templates select="p/@num"/>
    <xsl:apply-templates select="p/text()"/>
    <xsl:apply-templates select="p/b"/>
    <xsl:apply-templates select="p/b/text()"/>
    <xsl:apply-templates select="p/b/i"/>
    <xsl:apply-templates select="p/b/i/text()"/>
    <xsl:apply-templates select="p/b/u"/>
    <xsl:apply-templates select="p/b/u/text()"/>
    <xsl:apply-templates select="p/b/o"/>
    <xsl:apply-templates select="p/b/o/text()"/>
    <xsl:apply-templates select="p/b/sup"/>
    <xsl:apply-templates select="p/b/sup/text()"/>
    <xsl:apply-templates select="p/b/sub"/>
    <xsl:apply-templates select="p/b/sub/text()"/>
    <xsl:apply-templates select="p/i"/>
    <xsl:apply-templates select="p/i/text()"/>
    <xsl:apply-templates select="p/i/b"/>
    <xsl:apply-templates select="p/i/b/text()"/>
    <xsl:apply-templates select="p/i/u"/>
    <xsl:apply-templates select="p/i/u/text()"/>
    <xsl:apply-templates select="p/i/o"/>
    <xsl:apply-templates select="p/i/o/text()"/>
    <xsl:apply-templates select="p/i/sup"/>
    <xsl:apply-templates select="p/i/sup/text()"/>
    <xsl:apply-templates select="p/i/sub"/>
    <xsl:apply-templates select="p/i/sub/text()"/>
    <xsl:apply-templates select="p/u"/>
    <xsl:apply-templates select="p/u/text()"/>
    <xsl:apply-templates select="p/u/b"/>
    <xsl:apply-templates select="p/u/b/text()"/>
    <xsl:apply-templates select="p/u/i"/>
    <xsl:apply-templates select="p/u/i/text()"/>
    <xsl:apply-templates select="p/u/sup"/>
    <xsl:apply-templates select="p/u/sup/text()"/>
    <xsl:apply-templates select="p/u/sub"/>
    <xsl:apply-templates select="p/u/sub/text()"/>
    <xsl:apply-templates select="p/o"/>
    <xsl:apply-templates select="p/o/text()"/>
    <xsl:apply-templates select="p/o/b"/>
    <xsl:apply-templates select="p/o/b/text()"/>
    <xsl:apply-templates select="p/o/i"/>
    <xsl:apply-templates select="p/o/i/text()"/>
    <xsl:apply-templates select="p/o/sup"/>
    <xsl:apply-templates select="p/o/sup/text()"/>
    <xsl:apply-templates select="p/o/sub"/>
    <xsl:apply-templates select="p/o/sub/text()"/>
    <xsl:apply-templates select="p/sup"/>
    <xsl:apply-templates select="p/sup/text()"/>
    <xsl:apply-templates select="p/sup/b"/>
    <xsl:apply-templates select="p/sup/b/text()"/>
    <xsl:apply-templates select="p/sup/u"/>
    <xsl:apply-templates select="p/sup/u/text()"/>
    <xsl:apply-templates select="p/sup/i"/>
    <xsl:apply-templates select="p/sup/i/text()"/>
    <xsl:apply-templates select="p/sup/o"/>
    <xsl:apply-templates select="p/sup/o/text()"/>
    <xsl:apply-templates select="p/sup/sup2"/>
    <xsl:apply-templates select="p/sup/sup2/text()"/>
    <xsl:apply-templates select="p/sup/sup2/b"/>
    <xsl:apply-templates select="p/sup/sup2/b/text()"/>
    <xsl:apply-templates select="p/sup/sup2/u"/>
    <xsl:apply-templates select="p/sup/sup2/u/text()"/>
    <xsl:apply-templates select="p/sup/sup2/i"/>
    <xsl:apply-templates select="p/sup/sup2/i/text()"/>
    <xsl:apply-templates select="p/sup/sup2/o"/>
    <xsl:apply-templates select="p/sup/sup2/o/text()"/>
    <xsl:apply-templates select="p/sup/sub2"/>
    <xsl:apply-templates select="p/sup/sub2/text()"/>
    <xsl:apply-templates select="p/sup/sub2/b"/>
    <xsl:apply-templates select="p/sup/sub2/b/text()"/>
    <xsl:apply-templates select="p/sup/sub2/u"/>
    <xsl:apply-templates select="p/sup/sub2/u/text()"/>
    <xsl:apply-templates select="p/sup/sub2/i"/>
    <xsl:apply-templates select="p/sup/sub2/i/text()"/>
    <xsl:apply-templates select="p/sup/sub2/o"/>
    <xsl:apply-templates select="p/sup/sub2/o/text()"/>
    <xsl:apply-templates select="p/sub"/>
    <xsl:apply-templates select="p/sub/text()"/>
    <xsl:apply-templates select="p/sub/b"/>
    <xsl:apply-templates select="p/sub/b/text()"/>
    <xsl:apply-templates select="p/sub/u"/>
    <xsl:apply-templates select="p/sub/u/text()"/>
    <xsl:apply-templates select="p/sub/i"/>
    <xsl:apply-templates select="p/sub/i/text()"/>
    <xsl:apply-templates select="p/sub/o"/>
    <xsl:apply-templates select="p/sub/o/text()"/>
    <xsl:apply-templates select="p/sub/sup2"/>
    <xsl:apply-templates select="p/sub/sup2/text()"/>
    <xsl:apply-templates select="p/sub/sub2"/>
    <xsl:apply-templates select="p/sub/sub2/text()"/>
    <xsl:apply-templates select="p/smallcaps"/>
    <xsl:apply-templates select="p/smallcaps/text()"/>
    <xsl:apply-templates select="p/smallcaps/b"/>
    <xsl:apply-templates select="p/smallcaps/b/text()"/>
    <xsl:apply-templates select="p/smallcaps/u"/>
    <xsl:apply-templates select="p/smallcaps/u/text()"/>
    <xsl:apply-templates select="p/smallcaps/i"/>
    <xsl:apply-templates select="p/smallcaps/i/text()"/>
    <xsl:apply-templates select="p/smallcaps/o"/>
    <xsl:apply-templates select="p/smallcaps/o/text()"/>
    <xsl:apply-templates select="p/br"/>
    <xsl:apply-templates select="p/pre"/>
    <xsl:apply-templates select="p/dl"/>
    <xsl:apply-templates select="p/ul"/>
    <xsl:apply-templates select="p/ol"/>
    <xsl:apply-templates select="p/crossref"/>
    <xsl:apply-templates select="p/crossref/@idref"/>
    <xsl:apply-templates select="p/crossref/text()"/>
    <xsl:apply-templates select="p/crossref/b"/>
    <xsl:apply-templates select="p/crossref/b/text()"/>
    <xsl:apply-templates select="p/crossref/i"/>
    <xsl:apply-templates select="p/crossref/i/text()"/>
    <xsl:apply-templates select="p/crossref/u"/>
    <xsl:apply-templates select="p/crossref/u/text()"/>
    <xsl:apply-templates select="p/crossref/o"/>
    <xsl:apply-templates select="p/crossref/o/text()"/>
    <xsl:apply-templates select="p/crossref/sup"/>
    <xsl:apply-templates select="p/crossref/sup/text()"/>
    <xsl:apply-templates select="p/crossref/sub"/>
    <xsl:apply-templates select="p/crossref/sub/text()"/>
    <xsl:apply-templates select="p/crossref/smallcaps"/>
    <xsl:apply-templates select="p/crossref/smallcaps/text()"/>
    <xsl:apply-templates select="p/figref"/>
    <xsl:apply-templates select="p/figref/@idref"/>
    <xsl:apply-templates select="p/figref/@num"/>
    <xsl:apply-templates select="p/figref/text()"/>
    <xsl:apply-templates select="p/figref/b"/>
    <xsl:apply-templates select="p/figref/b/text()"/>
    <xsl:apply-templates select="p/figref/i"/>
    <xsl:apply-templates select="p/figref/i/text()"/>
    <xsl:apply-templates select="p/figref/u"/>
    <xsl:apply-templates select="p/figref/u/text()"/>
    <xsl:apply-templates select="p/figref/o"/>
    <xsl:apply-templates select="p/figref/o/text()"/>
    <xsl:apply-templates select="p/figref/sup"/>
    <xsl:apply-templates select="p/figref/sup/text()"/>
    <xsl:apply-templates select="p/figref/sub"/>
    <xsl:apply-templates select="p/figref/sub/text()"/>
    <xsl:apply-templates select="p/figref/smallcaps"/>
    <xsl:apply-templates select="p/figref/smallcaps/text()"/>
    <xsl:apply-templates select="p/patcit"/>
    <xsl:apply-templates select="p/nplcit"/>
    <xsl:apply-templates select="p/bio-deposit"/>
    <xsl:apply-templates select="p/img"/>
    <xsl:apply-templates select="p/chemistry"/>
    <xsl:apply-templates select="p/maths"/>
    <xsl:apply-templates select="p/tables"/>
    <xsl:apply-templates select="heading"/>
    <xsl:apply-templates select="heading/@level"/>
    <xsl:apply-templates select="heading/@id"/>
    <xsl:apply-templates select="heading/text()"/>
    <xsl:apply-templates select="heading/b"/>
    <xsl:apply-templates select="heading/i"/>
    <xsl:apply-templates select="heading/u"/>
    <xsl:apply-templates select="heading/o"/>
    <xsl:apply-templates select="heading/sup"/>
    <xsl:apply-templates select="heading/sub"/>
    <xsl:apply-templates select="heading/smallcaps"/>
    <xsl:apply-templates select="maths"/>
    <xsl:apply-templates select="maths/@num"/>
    <xsl:apply-templates select="maths/img"/>
    <xsl:apply-templates select="address-1"/>
    <xsl:apply-templates select="address-3"/>
    <xsl:apply-templates select="address-4"/>
    <xsl:apply-templates select="address-5"/>
    <xsl:apply-templates select="address-floor"/>
    <xsl:apply-templates select="building"/>
    <xsl:apply-templates select="street"/>
    <xsl:apply-templates select="state"/>
    <xsl:apply-templates select="pobox"/>
    <xsl:apply-templates select="room"/>
    <xsl:apply-templates select="county"/>
    <xsl:apply-templates select="address-2"/>
    </pat:BibliographicData>
    <pat:Description/>
    <pat:Claims/>
  </pat:PatentPublication>
  </xsl:template>

  <xsl:template match="cn-patent-document/cn-bibliographic-data">
    <xsl:element name="pat:PatentPublication/pat:BibliographicData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/@id">
    <xsl:element name="pat:BibliographicData/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/@country">
    <xsl:element name="pat:BibliographicData/@com:officeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/plain-language-designation">
    <xsl:element name="pat:BibliographicData/pat:PlainLanguageDesignationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/plain-language-designation/@lang">
    <xsl:element name="pat:BibliographicData/pat:PlainLanguageDesignationText/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/cn-publication-reference">
    <xsl:element name="pat:BibliographicData/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/classification-ipc">
    <xsl:element name="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/classifications-ipcr">
    <xsl:element name="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/classifications-ipcr/classification-ipcr">
    <xsl:element name="pat:BibliographicData/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/classification-national">
    <xsl:element name="pat:BibliographicData/pat:PatentClassificationBag/pat:NationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/classification-locarno">
    <xsl:element name="pat:BibliographicData/pat:PatentClassificationBag/com:LocarnoClassificationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/application-reference">
    <xsl:element name="pat:BibliographicData/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/language-of-filing">
    <xsl:element name="pat:BibliographicData/com:FilingLanguageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/language-of-publication">
    <xsl:element name="pat:BibliographicData/com:PublicationLanguageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/priority-claims">
    <xsl:element name="pat:BibliographicData/pat:PriorityClaimBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/cn-parties">
    <xsl:element name="pat:BibliographicData/pat:PartyBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/designation-of-states">
    <xsl:element name="pat:BibliographicData/pat:StateDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/invention-title">
    <xsl:element name="pat:BibliographicData/pat:InventionTitleBag/pat:InventionTitle/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/assignees">
    <xsl:element name="pat:BibliographicData/pat:PartyBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/licensee-data">
    <xsl:element name="pat:BibliographicData/pat:LicenceBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-of-earliest-priority">
    <xsl:element name="pat:BibliographicData/pat:EarliestPriorityApplication/pat:FilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-complete-specification-filed">
    <xsl:element name="pat:BibliographicData/pat:CompleteSpecificationFilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/dates-of-public-availability">
    <xsl:element name="pat:BibliographicData/pat:PublicAvailabilityDataBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/term-of-grant">
    <xsl:element name="pat:BibliographicData/pat:GrantTerm" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/dates-rights-effective">
    <xsl:element name="pat:BibliographicData/pat:RightsEffectiveDateBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/patent-family">
    <xsl:element name="pat:BibliographicData/pat:PatentFamily" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/field-of-search">
    <xsl:element name="pat:BibliographicData/pat:SearchField" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/figures">
    <xsl:element name="pat:BibliographicData/pat:FigureBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/references-cited">
    <xsl:element name="pat:BibliographicData/pat:ReferenceCitationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/examiners">
    <xsl:element name="pat:BibliographicData/pat:PartyBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/number-of-claims">
    <xsl:element name="pat:BibliographicData/pat:ClaimTotalQuantity" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/cn-related-documents">
    <xsl:element name="pat:BibliographicData/pat:RelatedDocumentBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/st50-republication">
    <xsl:element name="pat:BibliographicData/pat:PatentDocumentRepublication" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-exhibition-filed">
    <xsl:element name="pat:BibliographicData/pat:ExhibitionFilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-pct-article-22-39-fulfilled/date">
    <xsl:element name="pat:BibliographicData/pat:PCTNationalPhaseEntryDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/bio-deposit">
    <xsl:element name="pat:BibliographicData/com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/pct-or-regional-filing-data">
    <xsl:element name="pat:BibliographicData/pat:InternationalFilingData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/pct-or-regional-publishing-data">
    <xsl:element name="pat:BibliographicData/pat:InternationalPublishingData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-rights-reestablished">
    <xsl:element name="pat:BibliographicData/pat:RightsReestablishedDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-application-withdrawn-by-cn-applicant">
    <xsl:element name="pat:BibliographicData/pat:ApplicationWithdrawnDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-application-deemed-withdrawn">
    <xsl:element name="pat:BibliographicData/pat:ApplicationDeemedWithdrawnDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-of-revocation">
    <xsl:element name="pat:BibliographicData/pat:PatentRevocationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/date-application-partially-withdrawn/date">
    <xsl:element name="pat:BibliographicData/pat:ApplicationPartiallyWithdrawnDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-bibliographic-data/opposition-data">
    <xsl:element name="pat:BibliographicData/pat:OppositionData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="plain-language-designation">
    <xsl:element name="pat:PlainLanguageDesignationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="plain-language-designation/@lang">
    <xsl:element name="pat:PlainLanguageDesignationText/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference">
    <xsl:element name="pat:PatentGrantIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference/@id">
    <xsl:element name="pat:PatentGrantIdentification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference/document-id/country">
    <xsl:element name="pat:PatentGrantIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference/document-id/doc-number">
    <xsl:element name="pat:PatentGrantIdentification/pat:PatentNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference/document-id/kind">
    <xsl:element name="pat:PatentGrantIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-publication-reference/document-id/date">
    <xsl:element name="pat:PatentGrantIdentification/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}IssueDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipc">
    <xsl:element name="pat:IPCClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipc/@id">
    <xsl:element name="pat:IPCClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipc/edition">
    <xsl:element name="pat:IPCClassification/com:Edition" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipc/main-classification">
    <xsl:element name="pat:IPCClassification/pat:MainClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipc/further-classification">
    <xsl:element name="pat:IPCClassification/pat:FurtherClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr">
    <xsl:element name="pat:IPCRClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/@id">
    <xsl:element name="pat:IPCRClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/@sequence">
    <xsl:element name="pat:IPCRClassification/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/ipc-version-indicator/date">
    <xsl:element name="pat:IPCRClassification/pat:ClassificationVersionDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/classification-level">
    <xsl:element name="pat:IPCRClassification/pat:PatentClassificationLevelCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/section">
    <xsl:element name="pat:IPCRClassification/pat:Section" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/class">
    <xsl:element name="pat:IPCRClassification/pat:Class" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/subclass">
    <xsl:element name="pat:IPCRClassification/pat:Subclass" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/main-group">
    <xsl:element name="pat:IPCRClassification/pat:MainGroup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/subgroup">
    <xsl:element name="pat:IPCRClassification/pat:Subgroup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/symbol-position">
    <xsl:element name="pat:IPCRClassification/com:SymbolPositionCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/classification-value">
    <xsl:element name="pat:IPCRClassification/pat:IPCClassificationValueCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/action-date/date">
    <xsl:element name="pat:IPCRClassification/pat:ActionDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/generating-office/country">
    <xsl:element name="pat:IPCRClassification/pat:GeneratingOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/classification-status">
    <xsl:element name="pat:IPCRClassification/pat:IPCClassificationStatusCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/classification-data-source">
    <xsl:element name="pat:IPCRClassification/pat:PatentClassificationDataSourceCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-ipcr/text">
    <xsl:element name="pat:IPCRClassification/pat:PatentClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national">
    <xsl:element name="pat:NationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/@id">
    <xsl:element name="pat:NationalClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/country">
    <xsl:element name="pat:NationalClassification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/edition">
    <xsl:element name="pat:NationalClassification/com:Edition" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/main-classification">
    <xsl:element name="pat:NationalClassification/pat:MainNationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/main-classification/text()">
    <xsl:element name="pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/further-classification">
    <xsl:element name="pat:NationalClassification/pat:FurtherNationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/further-classification/@id">
    <xsl:element name="pat:NationalClassification/pat:FurtherNationalClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-national/further-classification/text()">
    <xsl:element name="pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno">
    <xsl:element name="com:LocarnoClassificationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno/@id">
    <xsl:element name="com:LocarnoClassificationBag/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno/edition">
    <xsl:element name="com:LocarnoClassificationBag/com:LocarnoClassificationEdition" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno/edition/text()">
    <xsl:element name="com:LocarnoClassificationBag/com:LocarnoClassificationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno/main-classification">
    <xsl:element name="com:LocarnoClassificationBag/com:LocarnoClassification/com:LocarnoClass" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="classification-locarno/text">
    <xsl:element name="com:LocarnoClassificationBag/com:LocarnoClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims">
    <xsl:element name="pat:PriorityClaimBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/@id">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/@sequence">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/@kind">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:ApplicationFilingCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/country">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/doc-number">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/doc-number/text()">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/date">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:FilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/priority-doc-requested">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:RequestedPriorityDocumentIndicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/priority-doc-attached">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:AttachedPriorityDocumentIndicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/priority-doc-from-library">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/priority-doc-from-library/@library-identifier">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@pat:libraryIdentifier" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="priority-claims/priority-claim/priority-doc-from-library/@action-by">
    <xsl:element name="pat:PriorityClaimBag/pat:PriorityClaim/pat:OnlineAvailablePriorityDocumentIndicator/@com:officeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct">
    <xsl:element name="pat:StateDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/regional">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/regional/region/country">
    <xsl:element name="pat:StateDesignation/pat:RegionalDesignation/pat:RegionalOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/regional/country">
    <xsl:element name="pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national">
    <xsl:element name="pat:StateDesignation/pat:RegionalDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national/country">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national/country/text()">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national/protection-request/@subset">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/@pat:subsetIndicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national/protection-request/kind-of-protection">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:ProtectionCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/national/protection-request/document-id">
    <xsl:element name="pat:StateDesignation/pat:NationalDesignation/pat:ProtectionRequest/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="designation-of-states/designation-pct/new-designation-country">
    <xsl:element name="pat:StateDesignation/pat:NewDesignationCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:LicenseeBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/licensee">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/licensee/addressbook">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:LicenseeBag/pat:Licensee/com:Contact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/attorney-or-cn-agent">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/attorney-or-cn-agent/@rep-type">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/attorney-or-cn-agent/addressbook">
    <xsl:element name="pat:LicenceBag/pat:Licence/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:Contact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/effective-in">
    <xsl:element name="pat:LicenceBag/pat:Licence/com:EffectiveCountryBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="licensee-data/effective-in/country">
    <xsl:element name="pat:LicenceBag/pat:Licence/com:EffectiveCountryBag/com:CountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability">
    <xsl:element name="pat:PublicAvailabilityDataBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference/@id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference/@country">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference/gazette-num">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference/gazette-num/text()">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference/com:PublicationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/gazette-reference/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:GazetteReference/pat:GazetteReferenceText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-not-printed-without-grant/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantNotPrintedPatentDocument/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-not-printed-without-grant/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantNotPrintedPatentDocument/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/unexamined-printed-without-grant/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:UnexaminedNoGrantPrintedPatentDocument/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-printed-without-grant">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-printed-without-grant/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/examined-printed-without-grant/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:ExaminedNoGrantPrintedPatentDocument/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/claims-only-available">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/claims-only-available/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/claims-only-available/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:OnlyAvailableClaims/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/not-printed-with-grant">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/not-printed-with-grant/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:NotPrintedPatentGrant/pat:PatentDocumentIdentification/pat:PatentGrantIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/invalidation-of-patent">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:PatentInvalidation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/invalidation-of-patent/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:PatentInvalidation/pat:PatentDocumentIdentification/pat:PatentGrantIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/printed-as-amended">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/printed-as-amended/document-id">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-of-public-availability/printed-as-amended/text">
    <xsl:element name="pat:PublicAvailabilityDataBag/pat:PrintedAsAmendedDocument/com:CommentText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant">
    <xsl:element name="pat:GrantTerm" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant/disclaimer">
    <xsl:element name="pat:GrantTerm/pat:TerminalDisclaimer" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant/disclaimer/date">
    <xsl:element name="pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant/disclaimer/text">
    <xsl:element name="pat:GrantTerm/pat:TerminalDisclaimer/pat:DisclaimerText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant/length-of-grant">
    <xsl:element name="pat:GrantTerm/pat:GrantLengthQuantity" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="term-of-grant/lapse-of-patent">
    <xsl:element name="pat:GrantTerm/pat:PatentTermLapseQuantity" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective">
    <xsl:element name="pat:RightsEffectiveDateBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/request-for-examination/date">
    <xsl:element name="pat:RightsEffectiveDateBag/com:ExaminationRequestDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/first-examination-report-despatched/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:FirstDespatchedExaminationReportDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/patent-maintained-as-amended/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:PatentMaintainedAsAmendedDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/pat:NationalApplicationConversionRequestDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/request-for-conversion-to-national-application/country">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:NationalApplicationConversionRequest/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/proceedings-suspended/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:ProceedingsSuspensionDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/proceedings-interrupted/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:ProceedingsInterruptionDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/proceedings-resumed/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:ProceedingsResumptionDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/notification-of-rights-after-appeal/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:AfterAppealRightsNotificationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dates-rights-effective/date-entering-into-force/date">
    <xsl:element name="pat:RightsEffectiveDateBag/pat:EnteredIntoForceDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family">
    <xsl:element name="pat:PatentFamily" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/@id">
    <xsl:element name="pat:PatentFamily/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/priority-application">
    <xsl:element name="pat:PatentFamily/pat:PriorityApplication" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/priority-application/document-id">
    <xsl:element name="pat:PatentFamily/pat:PriorityApplication/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/family-member">
    <xsl:element name="pat:PatentFamily/pat:PatentFamilyMember" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/family-member/document-id">
    <xsl:element name="pat:PatentFamily/pat:PatentFamilyMember/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patent-family/text">
    <xsl:element name="pat:PatentFamily/pat:PatentFamilyText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="document-id">
    <xsl:element name="pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="document-id/country">
    <xsl:element name="pat:PatentGrantIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="document-id/doc-number">
    <xsl:element name="pat:PatentGrantIdentification/pat:PatentNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="document-id/kind">
    <xsl:element name="pat:PatentGrantIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="document-id/date">
    <xsl:element name="pat:PatentGrantIdentification/pat:GrantDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="field-of-search">
    <xsl:element name="pat:SearchField" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="field-of-search/classification-ipc">
    <xsl:element name="pat:SearchField/pat:PatentClassificationBag/pat:IPCClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="field-of-search/classifications-ipcr">
    <xsl:element name="pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="field-of-search/classifications-ipcr/@id">
    <xsl:element name="pat:SearchField/pat:PatentClassificationBag/pat:IPCRClassificationBag/pat:IPCRClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="field-of-search/classification-national">
    <xsl:element name="pat:SearchField/pat:PatentClassificationBag/pat:NationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figures">
    <xsl:element name="pat:FigureBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figures/number-of-drawing-sheets/text()">
    <xsl:element name="pat:FigureBag/pat:DrawingSheetTotalQuantity" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figures/number-of-figures/text()">
    <xsl:element name="pat:FigureBag/pat:FigureTotalQuantity" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figures/figure-to-publish">
    <xsl:element name="pat:FigureBag/pat:PublishFigure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figures/figure-to-publish/fig-number/text()">
    <xsl:element name="pat:FigureBag/pat:PublishFigure/pat:FigureNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited">
    <xsl:element name="pat:ReferenceCitationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/@id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/@id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/@num">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/text">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:PatentCitationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/@lang">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/country">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/doc-number">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/kind">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/name">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:EntityName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/patcit/document-id/date">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/@id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/@num">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/@lang">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/article">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedJournalArticle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/book">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/book/notes">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:CitedBook/com:Notes" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/nplcit/othercit">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/com:NPLCitation/com:NPLCitationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/text">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRangeText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/passage">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeStart" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/passage/text()">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRangeBag/pat:PassageRange/pat:PassageRangeEnd" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/category">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:CitationCategoryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/rel-claims">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/rel-passage/rel-claims/text()">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:CitedPassageBag/pat:CitedPassage/pat:PassageRelevanceBag/pat:PassageRelevance/pat:RelatedClaimBag/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimRange/{http://www.wipo.int/standards/XMLSchema/ST96/Patent}PatentClaimEndNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/category/text()">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/@pat:citingPartyCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/@id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/country">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/edition">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/com:Edition" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/main-classification">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/main-classification/text()">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:PatentClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/further-classification">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/further-classification/@id">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="references-cited/citation/classification-national/further-classification/text()">
    <xsl:element name="pat:ReferenceCitationBag/pat:ReferenceCitation/pat:PatentClassificationBag/pat:NationalClassification/pat:FurtherNationalClassification/pat:PatentClassificationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication">
    <xsl:element name="pat:PatentDocumentRepublication" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/republication-code">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/cancellation-date">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationCancellationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-bibliography">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-bibliography/inid-code">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/pat:PatentINIDCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-bibliography/inid-code/@sequence">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedBibliography/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-part">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-part/@sequence">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-part/@lang">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-part/modified-part-name">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedPartCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/modifications/modified-part/modified-item">
    <xsl:element name="pat:PatentDocumentRepublication/pat:ModificationPartIdentification/pat:ModifiedPartInformation/pat:ModifiedItemText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/republication-notes">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/republication-notes/republication-note">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/republication-notes/republication-note/@sequence">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/republication-notes/republication-note/@lang">
    <xsl:element name="pat:PatentDocumentRepublication/pat:RepublicationNoteTextBag/pat:RepublicationNoteText/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference/@id">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference/@country">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference/gazette-num">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference/date">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference/com:PublicationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="st50-republication/correction-notice/gazette-reference/text">
    <xsl:element name="pat:PatentDocumentRepublication/pat:GazetteReference/pat:GazetteReferenceText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents">
    <xsl:element name="pat:RelatedDocumentBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc/parent-status">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:ParentDocumentStatusCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc/parent-grant-document/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc/parent-pct-document">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/parent-doc/parent-pct-document/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ParentDocument/pat:PCTDocumentParent/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/child-doc">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/addition/relation/child-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Addition/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/division">
    <xsl:element name="pat:RelatedDocumentBag/pat:Division" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/parent-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/parent-doc/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/parent-doc/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/child-doc">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/child-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/child-doc/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation/relation/child-doc/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:Continuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/document-id/date">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/pat:FilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-status">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:ParentDocumentStatusCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:PatentNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/kind">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/parent-doc/parent-grant-document/document-id/date">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ParentDocument/pat:PatentDocumentIdentification/pat:PatentGrantIdentification/pat:GrantDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/child-doc">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/child-doc/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/child-doc/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuation-in-part/relation/child-doc/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:PartialContinuation/pat:ChildDocument/pat:PatentDocumentIdentification/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/continuing-reissue">
    <xsl:element name="pat:RelatedDocumentBag/pat:ContinuingReissue" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/reissue">
    <xsl:element name="pat:RelatedDocumentBag/pat:Reissue" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/reexamination">
    <xsl:element name="pat:RelatedDocumentBag/pat:Reexamination" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/substitution">
    <xsl:element name="pat:RelatedDocumentBag/pat:Substitution" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/utility-model-basis">
    <xsl:element name="pat:RelatedDocumentBag/pat:UtilityModelBasis" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/correction">
    <xsl:element name="pat:RelatedDocumentBag/pat:Correction" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication/document-id">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication/document-id/country">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication/document-id/doc-number">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/pat:PublicationNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication/document-id/kind">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-related-documents/cn-related-publication/document-id/date">
    <xsl:element name="pat:RelatedDocumentBag/pat:RelatedPublication/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification/com:PublicationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data">
    <xsl:element name="pat:InternationalFilingData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data/document-id/country">
    <xsl:element name="pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data/document-id/doc-number">
    <xsl:element name="pat:InternationalFilingData/pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data/document-id/date">
    <xsl:element name="pat:InternationalFilingData/pat:ApplicationIdentification/pat:FilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data/us-371c124-date/date">
    <xsl:element name="pat:InternationalFilingData/pat:NationalStageFilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-filing-data/document-id/@lang">
    <xsl:element name="pat:InternationalFilingData/pat:ApplicationIdentification/com:FilingLanguageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference">
    <xsl:element name="pat:ApplicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference/@id">
    <xsl:element name="pat:ApplicationIdentification/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference/@appl-type">
    <xsl:element name="pat:ApplicationIdentification/pat:InventionSubjectMatterCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference/document-id/country">
    <xsl:element name="pat:ApplicationIdentification/com:ApplicationNumber/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference/document-id/doc-number">
    <xsl:element name="pat:ApplicationIdentification/com:ApplicationNumber/com:ApplicationNumberText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="application-reference/document-id/date">
    <xsl:element name="pat:ApplicationIdentification/pat:FilingDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature">
    <xsl:element name="com:ElectronicSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/@date">
    <xsl:element name="com:ElectronicSignature/com:ElectronicSignatureDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/@place-signed">
    <xsl:element name="com:ElectronicSignature/com:ElectronicSignaturePlace" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/basic-signature">
    <xsl:element name="com:ElectronicSignature/com:ElectronicBasicSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/basic-signature/fax-image/@file">
    <xsl:element name="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureImageURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/basic-signature/text-string">
    <xsl:element name="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/basic-signature/click-wrap">
    <xsl:element name="com:ElectronicSignature/com:ElectronicBasicSignature/com:ElectronicBasicSignatureClickWrap" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/enhanced-signature">
    <xsl:element name="com:ElectronicSignature/com:ElectronicEnhancedSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="electronic-signature/enhanced-signature/pkcs7">
    <xsl:element name="com:ElectronicSignature/com:ElectronicEnhancedSignature/@com:pkcs7Indicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook">
    <xsl:element name="com:PublicationContact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/@lang">
    <xsl:element name="com:Contact/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/name">
    <xsl:element name="com:PublicationContact/com:Name/com:EntityName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/prefix">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/last-name">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/orgname">
    <xsl:element name="com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/orgname/text()">
    <xsl:element name="com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/first-name">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/middle-name">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/first-last-name">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/second-last-name">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/suffix">
    <xsl:element name="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/role">
    <xsl:element name="com:Contact/com:Name/com:EntityName/@com:entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-1">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-1/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-2">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-2/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-3">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-3/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-4">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-4/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-5">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-5/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/mailcode">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/pobox">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/pobox/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/room">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/room/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-floor">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/address-floor/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/building">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/building/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/street">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/street/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/city">
    <xsl:element name="com:PublicationContact/com:CityName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/county">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/county/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/state">
    <xsl:element name="com:PublicationContact/com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/state/text()">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/postcode">
    <xsl:element name="com:PublicationContact/com:PostalCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/country">
    <xsl:element name="com:PublicationContact/com:CountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/address/text">
    <xsl:element name="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/phone">
    <xsl:element name="com:Contact/com:PhoneNumberBag/com:PhoneNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/fax">
    <xsl:element name="com:Contact/com:FaxNumberBag/com:FaxNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/email">
    <xsl:element name="com:Contact/com:EmailAddressBag/com:EmailAddressText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/email/@email-purpose">
    <xsl:element name="com:Contact/com:EmailAddressBag/com:EmailAddressText/@com:emailAddressPurposeCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/url">
    <xsl:element name="com:Contact/com:WebAddressBag/com:WebAddressURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="addressbook/ead">
    <xsl:element name="com:Contact/com:OtherElectronicAddressBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties">
    <xsl:element name="pat:PartyBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/@sequence">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/@pat:cn-applicantSequenceNumberReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/@app-type">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:ApplicantCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/@designation">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:DesignationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/addressbook">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:PublicationContact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/nationality/country">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:NationalityCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/residence/country">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/com:ResidenceCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/us-rights">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/us-rights/@kind">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-applicants/cn-applicant/us-rights/text()">
    <xsl:element name="pat:PartyBag/pat:ApplicantBag/pat:Applicant/pat:SuccessorRights/pat:SuccessorRightsText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors">
    <xsl:element name="pat:PartyBag/pat:InventorBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/@sequence">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/@designation">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NewDesignationCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/addressbook">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/com:PublicationContact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/designated-states">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/designated-states/country">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:NationalDesignation/com:DesignatedCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/designated-states/region">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-inventors/cn-inventor/designated-states/region/country">
    <xsl:element name="pat:PartyBag/pat:InventorBag/pat:Inventor/pat:StateDesignation/pat:RegionalDesignation/com:DesignatedCountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/correspondence-address">
    <xsl:element name="pat:PartyBag/com:CorrespondenceAddress" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/correspondence-address/customer-number">
    <xsl:element name="pat:PartyBag/com:CorrespondenceAddress/com:PartyIdentifier" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/correspondence-address/addressbook">
    <xsl:element name="pat:PartyBag/com:CorrespondenceAddress/com:Contact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents/customer-number">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerRegistrationNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents/cn-agent">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents/cn-agent/@sequence">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents/cn-agent/@rep-type">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/pat:RegisteredPractitionerCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-parties/cn-cn-agents/cn-agent/addressbook">
    <xsl:element name="pat:PartyBag/pat:RegisteredPractitionerBag/pat:RegisteredPractitioner/com:PublicationContact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assignees">
    <xsl:element name="pat:PartyBag/pat:AssigneeBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assignees/assignee">
    <xsl:element name="pat:PartyBag/pat:AssigneeBag/pat:Assignee" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="assignees/assignee/addressbook">
    <xsl:element name="pat:PartyBag/pat:AssigneeBag/pat:Assignee/com:PublicationContact" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationStandardName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/prefix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/orgname">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/orgname/text()">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/first-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/middle-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/first-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/second-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/suffix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/role">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:EntityName/@com:entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/synonym">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/primary-examiner/electronic-signature">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:ElectronicSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonFullName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/prefix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/orgname">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/orgname/text()">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/first-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/middle-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/first-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/second-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/suffix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/role">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:EntityName/@com:entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/synonym">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/assistant-examiner/electronic-signature">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AssistantExaminer/com:ElectronicSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonFullName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/prefix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NamePrefix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:LastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/orgname">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/orgname/text()">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:OrganizationName/com:OrganizationOtherName/@com:organizationNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/first-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/middle-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/first-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:FirstLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/second-last-name">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:SecondLastName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/suffix">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:NameSuffix" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/role">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:EntityName/@com:entityNameCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/synonym">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:Name/com:PersonName/com:PersonStructuredName/com:PersonOtherName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/phone">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:PhoneNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/fax">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:FaxNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/email">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:EmailAddressText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="examiners/authorized-officer/electronic-signature">
    <xsl:element name="pat:PartyBag/pat:ExaminerBag/pat:AuthorizedOfficer/com:ElectronicSignature" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title">
    <xsl:element name="pat:InventionTitle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/@id">
    <xsl:element name="pat:InventionTitle/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/@lang">
    <xsl:element name="pat:InventionTitle/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/text()">
    <xsl:element name="pat:InventionTitle/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b">
    <xsl:element name="pat:InventionTitle/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/text()">
    <xsl:element name="pat:InventionTitle/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/i">
    <xsl:element name="pat:InventionTitle/com:B/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/i/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/u">
    <xsl:element name="pat:InventionTitle/com:B/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/u/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/o">
    <xsl:element name="pat:InventionTitle/com:B/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/o/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/smallcaps">
    <xsl:element name="pat:InventionTitle/com:B/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/smallcaps/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/sup">
    <xsl:element name="pat:InventionTitle/com:B/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/sup/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/sub">
    <xsl:element name="pat:InventionTitle/com:B/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b/sub/text()">
    <xsl:element name="pat:InventionTitle/com:B/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/i">
    <xsl:element name="pat:InventionTitle/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/i/text()">
    <xsl:element name="pat:InventionTitle/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/u">
    <xsl:element name="pat:InventionTitle/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/u/text()">
    <xsl:element name="pat:InventionTitle/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/o">
    <xsl:element name="pat:InventionTitle/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/o/text()">
    <xsl:element name="pat:InventionTitle/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sup">
    <xsl:element name="pat:InventionTitle/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sup/text()">
    <xsl:element name="pat:InventionTitle/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sub">
    <xsl:element name="pat:InventionTitle/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sub/text()">
    <xsl:element name="pat:InventionTitle/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit">
    <xsl:element name="com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@id">
    <xsl:element name="com:BioDeposit/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@num">
    <xsl:element name="com:BioDeposit/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@url">
    <xsl:element name="com:BioDeposit/@com:sourceURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-1">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-1/text()">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-2">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-2/text()">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-3">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-3/text()">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-4">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-4/text()">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-5">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-5/text()">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/mailcode">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/pobox">
    <xsl:element name="WIPO.poboxToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/pobox/text()">
    <xsl:element name="WIPO.poboxToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/room">
    <xsl:element name="WIPO.roomToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/room/text()">
    <xsl:element name="WIPO.roomToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-floor">
    <xsl:element name="WIPO.address-floorToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/address-floor/text()">
    <xsl:element name="WIPO.address-floorToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/building">
    <xsl:element name="WIPO.buildingToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/building/text()">
    <xsl:element name="WIPO.buildingToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/street">
    <xsl:element name="WIPO.streetToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/street/text()">
    <xsl:element name="WIPO.streetToAddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/city">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/county">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/postcode">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/country">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary/address/text">
    <xsl:element name="com:BioDeposit/com:BioDepositTermText/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/bio-accno">
    <xsl:element name="com:BioDeposit/com:BiologicalAccessionNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/date">
    <xsl:element name="com:BioDeposit/com:BioDepositDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/term">
    <xsl:element name="com:BioDeposit/com:BioDepositTermText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/dtext">
    <xsl:element name="com:BioDeposit/com:BioDepositText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data">
    <xsl:element name="pat:InternationalPublishingData" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/document-id">
    <xsl:element name="pat:InternationalPublishingData/pat:PatentDocumentIdentification/pat:PatentPublicationIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference/@id">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference/@country">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference/gazette-num">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference/date">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference/com:PublicationDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pct-or-regional-publishing-data/gazette-reference/text">
    <xsl:element name="pat:InternationalPublishingData/pat:GazetteReference/pat:GazetteReferenceText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="name">
    <xsl:element name="com:OrganizationStandardName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="name/@name-type">
    <xsl:element name="com:OrganizationStandardName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="name/text()">
    <xsl:element name="com:OrganizationStandardName/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="orgname">
    <xsl:element name="com:OrganizationName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="orgname/text()">
    <xsl:element name="com:OrganizationName/com:OrganizationStandardName/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="state">
    <xsl:element name="com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-2">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-5">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="county">
    <xsl:element name="com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-3">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pobox">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="room">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-floor">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="building">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="street">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-4">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-1">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/@lang">
    <xsl:element name="pat:PatentPublication/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/@file">
    <xsl:element name="pat:PatentPublication/@com:documentFileName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/@file-reference-id">
    <xsl:element name="pat:PatentPublication/@com:fileReferenceIdentifier" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/@country">
    <xsl:element name="pat:PatentPublication/@com:receivingOffice" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/@status">
    <xsl:element name="pat:PatentPublication/@pat:applicationBodyStatus" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/doc-page">
    <xsl:element name="pat:PatentPublication/pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description">
    <xsl:element name="pat:PatentPublication/pat:Description" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/@lang">
    <xsl:element name="pat:PatentPublication/pat:Description/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/doc-page">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/invention-title">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionTitle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/technical-field">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:TechnicalField" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/technical-field/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:TechnicalField/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/technical-field/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:TechnicalField/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/technical-field/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:TechnicalField/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/background-art">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BackgroundArt" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/background-art/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BackgroundArt/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/background-art/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BackgroundArt/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/background-art/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BackgroundArt/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-problem">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-problem/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-problem/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-problem/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-solution">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-solution/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-solution/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/tech-solution/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/advantageous-effects">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/advantageous-effects/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/advantageous-effects/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/advantageous-effects/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/disclosure/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:Disclosure/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-problem">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-problem/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-problem/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-problem/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-solution">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-solution/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-solution/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/tech-solution/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/advantageous-effects">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/advantageous-effects/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/advantageous-effects/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/advantageous-effects/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/summary-of-invention/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionSummary/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-drawings">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DrawingDescription" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-drawings/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DrawingDescription/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-drawings/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DrawingDescription/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-drawings/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DrawingDescription/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/embodiments-example">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/embodiments-example/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/embodiments-example/@ex-num">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@pat:exampleNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/embodiments-example/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/embodiments-example/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/description-of-embodiments/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:EmbodimentDescription/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/best-mode">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BestMode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/best-mode/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BestMode/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/best-mode/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BestMode/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/best-mode/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:BestMode/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/mode-for-invention">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionMode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/mode-for-invention/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionMode/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/mode-for-invention/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionMode/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/mode-for-invention/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:InventionMode/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/industrial-applicability">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:IndustrialApplicability" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/industrial-applicability/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:IndustrialApplicability/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/industrial-applicability/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:IndustrialApplicability/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/industrial-applicability/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:IndustrialApplicability/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-signs-list">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:ReferenceSignBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-signs-list/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:ReferenceSignBag/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-signs-list/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:ReferenceSignBag/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-signs-list/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:ReferenceSignBag/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-to-deposited-biological-material">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-to-deposited-biological-material/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-to-deposited-biological-material/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/reference-to-deposited-biological-material/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:DepositedBiologicalMaterialReference/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/sequence-list-text">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:SequenceListText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/sequence-list-text/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:SequenceListText/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/sequence-list-text/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:SequenceListText/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/sequence-list-text/p">
    <xsl:element name="pat:PatentPublication/pat:Description/pat:SequenceListText/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/patent-literature">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/patent-literature/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/patent-literature/p">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:PatentCitationBag/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/non-patent-literature">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/non-patent-literature/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/non-patent-literature/p">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:NPLCitationBag/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/citation-list/p">
    <xsl:element name="pat:PatentPublication/pat:Description/com:CitationBag/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/@level">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/@id">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/b">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/b/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/i">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/i/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/u">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/u/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/o">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/o/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/sup">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/sup/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/sub">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/sub/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/smallcaps">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/heading/smallcaps/text()">
    <xsl:element name="pat:PatentPublication/pat:Description/com:Heading/com:Del/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/description/p">
    <xsl:element name="pat:PatentPublication/pat:Description/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/claims">
    <xsl:element name="pat:PatentPublication/pat:Claims/pat:Claim" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/claims/@id">
    <xsl:element name="pat:PatentPublication/pat:Claims/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/abstract">
    <xsl:element name="pat:PatentPublication/pat:Abstract" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/abstract/@id">
    <xsl:element name="pat:PatentPublication/pat:Abstract/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/abstract/@lang">
    <xsl:element name="pat:PatentPublication/pat:Abstract/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/abstract/doc-page">
    <xsl:element name="pat:PatentPublication/pat:Abstract/pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/abstract/p">
    <xsl:element name="pat:PatentPublication/pat:Abstract/com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/drawings">
    <xsl:element name="pat:PatentPublication/pat:Drawings" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/drawings/@id">
    <xsl:element name="pat:PatentPublication/pat:Drawings/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/drawings/doc-page">
    <xsl:element name="pat:PatentPublication/pat:Drawings/pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cn-patent-document/drawings/figure">
    <xsl:element name="pat:PatentPublication/pat:Drawings/pat:Figure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b">
    <xsl:element name="com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/text()">
    <xsl:element name="com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i">
    <xsl:element name="com:B/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/text()">
    <xsl:element name="com:B/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/b">
    <xsl:element name="com:B/com:I/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/b/text()">
    <xsl:element name="com:B/com:I/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/u">
    <xsl:element name="com:B/com:I/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/u/text()">
    <xsl:element name="com:B/com:I/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/o">
    <xsl:element name="com:B/com:I/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/o/text()">
    <xsl:element name="com:B/com:I/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/sup">
    <xsl:element name="com:B/com:I/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/sup/text()">
    <xsl:element name="com:B/com:I/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/sub">
    <xsl:element name="com:B/com:I/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/i/sub/text()">
    <xsl:element name="com:B/com:I/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u">
    <xsl:element name="com:B/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/text()">
    <xsl:element name="com:B/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/b">
    <xsl:element name="com:B/com:U/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/b/text()">
    <xsl:element name="com:B/com:U/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/i">
    <xsl:element name="com:B/com:U/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/i/text()">
    <xsl:element name="com:B/com:U/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/sup">
    <xsl:element name="com:B/com:U/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/sup/text()">
    <xsl:element name="com:B/com:U/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/sub">
    <xsl:element name="com:B/com:U/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/u/sub/text()">
    <xsl:element name="com:B/com:U/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o">
    <xsl:element name="com:B/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/text()">
    <xsl:element name="com:B/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/b">
    <xsl:element name="com:B/com:O/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/b/text()">
    <xsl:element name="com:B/com:O/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/i">
    <xsl:element name="com:B/com:O/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/i/text()">
    <xsl:element name="com:B/com:O/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/sup">
    <xsl:element name="com:B/com:O/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/sup/text()">
    <xsl:element name="com:B/com:O/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/sub">
    <xsl:element name="com:B/com:O/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/o/sub/text()">
    <xsl:element name="com:B/com:O/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps">
    <xsl:element name="com:B/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/text()">
    <xsl:element name="com:B/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/b">
    <xsl:element name="com:B/com:SmallCapital/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/b/text()">
    <xsl:element name="com:B/com:SmallCapital/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/u">
    <xsl:element name="com:B/com:SmallCapital/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/u/text()">
    <xsl:element name="com:B/com:SmallCapital/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/i">
    <xsl:element name="com:B/com:SmallCapital/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/i/text()">
    <xsl:element name="com:B/com:SmallCapital/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/o">
    <xsl:element name="com:B/com:SmallCapital/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/smallcaps/o/text()">
    <xsl:element name="com:B/com:SmallCapital/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/b">
    <xsl:element name="com:B/com:Sup/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/b/text()">
    <xsl:element name="com:B/com:Sup/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/u">
    <xsl:element name="com:B/com:Sup/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/u/text()">
    <xsl:element name="com:B/com:Sup/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/i">
    <xsl:element name="com:B/com:Sup/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/i/text()">
    <xsl:element name="com:B/com:Sup/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/o">
    <xsl:element name="com:B/com:Sup/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/o/text()">
    <xsl:element name="com:B/com:Sup/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2">
    <xsl:element name="com:B/com:Sup/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/text()">
    <xsl:element name="com:B/com:Sup/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/b">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/b/text()">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/u">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/u/text()">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/i">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/i/text()">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/o">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sup2/o/text()">
    <xsl:element name="com:B/com:Sup/com:Sup2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2">
    <xsl:element name="com:B/com:Sup/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/text()">
    <xsl:element name="com:B/com:Sup/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/b">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/b/text()">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/u">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/u/text()">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/i">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/i/text()">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/o">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sup/sub2/o/text()">
    <xsl:element name="com:B/com:Sup/com:Sub2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub">
    <xsl:element name="com:B/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/text()">
    <xsl:element name="com:B/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/b">
    <xsl:element name="com:B/com:Sub/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/b/text()">
    <xsl:element name="com:B/com:Sub/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/u">
    <xsl:element name="com:B/com:Sub/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/u/text()">
    <xsl:element name="com:B/com:Sub/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/i">
    <xsl:element name="com:B/com:Sub/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/i/text()">
    <xsl:element name="com:B/com:Sub/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/o">
    <xsl:element name="com:B/com:Sub/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/o/text()">
    <xsl:element name="com:B/com:Sub/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2">
    <xsl:element name="com:B/com:Sub/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/text()">
    <xsl:element name="com:B/com:Sub/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/b">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/b/text()">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/u">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/u/text()">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/i">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/i/text()">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/o">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sup2/o/text()">
    <xsl:element name="com:B/com:Sub/com:Sup2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2">
    <xsl:element name="com:B/com:Sub/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/text()">
    <xsl:element name="com:B/com:Sub/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/b">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/b/text()">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/u">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/u/text()">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/i">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/i/text()">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/o">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="b/sub/sub2/o/text()">
    <xsl:element name="com:B/com:Sub/com:Sub2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i">
    <xsl:element name="com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/text()">
    <xsl:element name="com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/b">
    <xsl:element name="com:I/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/u">
    <xsl:element name="com:I/com:U/com:B/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/o">
    <xsl:element name="com:I/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/smallcaps">
    <xsl:element name="com:I/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/sup">
    <xsl:element name="com:I/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="i/sub">
    <xsl:element name="com:I/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li">
    <xsl:element name="com:LI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/@id">
    <xsl:element name="com:LI/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/@num">
    <xsl:element name="com:LI/@com:liNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/text()">
    <xsl:element name="com:LI/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b">
    <xsl:element name="com:LI/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/text()">
    <xsl:element name="com:LI/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/i">
    <xsl:element name="com:LI/com:B/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/i/text()">
    <xsl:element name="com:LI/com:B/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/u">
    <xsl:element name="com:LI/com:B/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/u/text()">
    <xsl:element name="com:LI/com:B/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/o">
    <xsl:element name="com:LI/com:B/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/o/text()">
    <xsl:element name="com:LI/com:B/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/sup">
    <xsl:element name="com:LI/com:B/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/sup/text()">
    <xsl:element name="com:LI/com:B/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/sub">
    <xsl:element name="com:LI/com:B/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/b/sub/text()">
    <xsl:element name="com:LI/com:B/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i">
    <xsl:element name="com:LI/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/text()">
    <xsl:element name="com:LI/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/b">
    <xsl:element name="com:LI/com:I/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/b/text()">
    <xsl:element name="com:LI/com:I/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/u">
    <xsl:element name="com:LI/com:I/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/u/text()">
    <xsl:element name="com:LI/com:I/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/o">
    <xsl:element name="com:LI/com:I/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/o/text()">
    <xsl:element name="com:LI/com:I/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/sup">
    <xsl:element name="com:LI/com:I/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/sup/text()">
    <xsl:element name="com:LI/com:I/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/sub">
    <xsl:element name="com:LI/com:I/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/i/sub/text()">
    <xsl:element name="com:LI/com:I/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u">
    <xsl:element name="com:LI/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/text()">
    <xsl:element name="com:LI/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/b">
    <xsl:element name="com:LI/com:U/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/b/text()">
    <xsl:element name="com:LI/com:U/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/i">
    <xsl:element name="com:LI/com:U/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/i/text()">
    <xsl:element name="com:LI/com:U/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/sup">
    <xsl:element name="com:LI/com:U/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/sup/text()">
    <xsl:element name="com:LI/com:U/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/sub">
    <xsl:element name="com:LI/com:U/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/u/sub/text()">
    <xsl:element name="com:LI/com:U/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o">
    <xsl:element name="com:LI/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/text()">
    <xsl:element name="com:LI/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/b">
    <xsl:element name="com:LI/com:O/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/b/text()">
    <xsl:element name="com:LI/com:O/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/i">
    <xsl:element name="com:LI/com:O/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/i/text()">
    <xsl:element name="com:LI/com:O/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/sup">
    <xsl:element name="com:LI/com:O/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/sup/text()">
    <xsl:element name="com:LI/com:O/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/sub">
    <xsl:element name="com:LI/com:O/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/o/sub/text()">
    <xsl:element name="com:LI/com:O/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup">
    <xsl:element name="com:LI/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/text()">
    <xsl:element name="com:LI/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/b">
    <xsl:element name="com:LI/com:Sup/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/b/text()">
    <xsl:element name="com:LI/com:Sup/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/u">
    <xsl:element name="com:LI/com:Sup/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/u/text()">
    <xsl:element name="com:LI/com:Sup/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/i">
    <xsl:element name="com:LI/com:Sup/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/i/text()">
    <xsl:element name="com:LI/com:Sup/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/o">
    <xsl:element name="com:LI/com:Sup/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/o/text()">
    <xsl:element name="com:LI/com:Sup/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2">
    <xsl:element name="com:LI/com:Sup/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/text()">
    <xsl:element name="com:LI/com:Sup/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/b">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/b/text()">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/u">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/u/text()">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/i">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/i/text()">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/o">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sup2/o/text()">
    <xsl:element name="com:LI/com:Sup/com:Sup2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2">
    <xsl:element name="com:LI/com:Sup/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/text()">
    <xsl:element name="com:LI/com:Sup/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/b">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/b/text()">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/u">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/u/text()">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/i">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/i/text()">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/o">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sup/sub2/o/text()">
    <xsl:element name="com:LI/com:Sup/com:Sub2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub">
    <xsl:element name="com:LI/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/text()">
    <xsl:element name="com:LI/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/b">
    <xsl:element name="com:LI/com:Sub/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/b/text()">
    <xsl:element name="com:LI/com:Sub/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/u">
    <xsl:element name="com:LI/com:Sub/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/u/text()">
    <xsl:element name="com:LI/com:Sub/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/i">
    <xsl:element name="com:LI/com:Sub/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/i/text()">
    <xsl:element name="com:LI/com:Sub/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/o">
    <xsl:element name="com:LI/com:Sub/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/o/text()">
    <xsl:element name="com:LI/com:Sub/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2">
    <xsl:element name="com:LI/com:Sub/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/text()">
    <xsl:element name="com:LI/com:Sub/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/b">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/b/text()">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/u">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/u/text()">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/i">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/i/text()">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/o">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sup2/o/text()">
    <xsl:element name="com:LI/com:Sub/com:Sup2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2">
    <xsl:element name="com:LI/com:Sub/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/text()">
    <xsl:element name="com:LI/com:Sub/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/b">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/b/text()">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/u">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/u/text()">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/i">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/i/text()">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/o">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/sub/sub2/o/text()">
    <xsl:element name="com:LI/com:Sub/com:Sub2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps">
    <xsl:element name="com:LI/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/text()">
    <xsl:element name="com:LI/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/b">
    <xsl:element name="com:LI/com:SmallCapital/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/b/text()">
    <xsl:element name="com:LI/com:SmallCapital/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/u">
    <xsl:element name="com:LI/com:SmallCapital/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/u/text()">
    <xsl:element name="com:LI/com:SmallCapital/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/i">
    <xsl:element name="com:LI/com:SmallCapital/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/i/text()">
    <xsl:element name="com:LI/com:SmallCapital/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/o">
    <xsl:element name="com:LI/com:SmallCapital/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/smallcaps/o/text()">
    <xsl:element name="com:LI/com:SmallCapital/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/br">
    <xsl:element name="com:LI/com:Br" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/pre">
    <xsl:element name="com:LI/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/pre/@id">
    <xsl:element name="com:LI/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/pre/@xml:space">
    <xsl:element name="com:LI/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/pre/@listing-type">
    <xsl:element name="com:LI/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/pre/text()">
    <xsl:element name="com:LI/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/patcit">
    <xsl:element name="com:LI/com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/nplcit">
    <xsl:element name="com:LI/com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/bio-deposit">
    <xsl:element name="com:LI/com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/@idref">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/b">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/b/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/i">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/i/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/u">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/u/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/o">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/o/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/sup">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/sup/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/sub">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/sub/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/smallcaps">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/crossref/smallcaps/text()">
    <xsl:element name="com:LI/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/@idref">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/@num">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/b">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/b/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/i">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/i/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/u">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/u/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/o">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/o/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/sup">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/sup/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/sub">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/sub/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/smallcaps">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/figref/smallcaps/text()">
    <xsl:element name="com:LI/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/img">
    <xsl:element name="com:LI/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/dl">
    <xsl:element name="com:LI/com:DL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/ul">
    <xsl:element name="com:LI/com:UL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/ol">
    <xsl:element name="com:LI/com:OL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/chemistry">
    <xsl:element name="com:LI/com:ChemicalFormulae" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="li/maths">
    <xsl:element name="com:LI/com:Math" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o">
    <xsl:element name="com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/@style">
    <xsl:element name="com:O/@com:oStyle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/text()">
    <xsl:element name="com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/b">
    <xsl:element name="com:O/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/i">
    <xsl:element name="com:O/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/smallcaps">
    <xsl:element name="com:O/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/sup">
    <xsl:element name="com:O/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="o/sub">
    <xsl:element name="com:O/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps">
    <xsl:element name="com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps/text()">
    <xsl:element name="com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps/b">
    <xsl:element name="com:SmallCapital/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps/u">
    <xsl:element name="com:SmallCapital/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps/i">
    <xsl:element name="com:SmallCapital/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="smallcaps/o">
    <xsl:element name="com:SmallCapital/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2">
    <xsl:element name="com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2/text()">
    <xsl:element name="com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2/b">
    <xsl:element name="com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2/u">
    <xsl:element name="com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2/i">
    <xsl:element name="com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub2/o">
    <xsl:element name="com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub">
    <xsl:element name="com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/text()">
    <xsl:element name="com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/b">
    <xsl:element name="com:Sub/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/u">
    <xsl:element name="com:Sub/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/i">
    <xsl:element name="com:Sub/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/o">
    <xsl:element name="com:Sub/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/sup2">
    <xsl:element name="com:Sub/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sub/sub2">
    <xsl:element name="com:Sub/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2">
    <xsl:element name="com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2/text()">
    <xsl:element name="com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2/b">
    <xsl:element name="com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2/u">
    <xsl:element name="com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2/i">
    <xsl:element name="com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup2/o">
    <xsl:element name="com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup">
    <xsl:element name="com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/text()">
    <xsl:element name="com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/b">
    <xsl:element name="com:Sup/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/u">
    <xsl:element name="com:Sup/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/i">
    <xsl:element name="com:Sup/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/o">
    <xsl:element name="com:Sup/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/sup2">
    <xsl:element name="com:Sup/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sup/sub2">
    <xsl:element name="com:Sup/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u">
    <xsl:element name="com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/text()">
    <xsl:element name="com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/b">
    <xsl:element name="com:U/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/i">
    <xsl:element name="com:U/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/smallcaps">
    <xsl:element name="com:U/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/sup">
    <xsl:element name="com:U/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="u/sub">
    <xsl:element name="com:U/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pre">
    <xsl:element name="com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pre/@id">
    <xsl:element name="com:Pre/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pre/@listing-type">
    <xsl:element name="com:Pre/@com:listingCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dl">
    <xsl:element name="com:DL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dl/@id">
    <xsl:element name="com:DL/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dl/dt">
    <xsl:element name="com:DL/com:DT" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dl/dd">
    <xsl:element name="com:DL/com:DD" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd">
    <xsl:element name="com:DD" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/text()">
    <xsl:element name="com:DD/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/b">
    <xsl:element name="com:DD/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/i">
    <xsl:element name="com:DD/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/u">
    <xsl:element name="com:DD/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/o">
    <xsl:element name="com:DD/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/sup">
    <xsl:element name="com:DD/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/sub">
    <xsl:element name="com:DD/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/smallcaps">
    <xsl:element name="com:DD/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/br">
    <xsl:element name="com:DD/com:Br" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/pre">
    <xsl:element name="com:DD/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/patcit">
    <xsl:element name="com:DD/com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/nplcit">
    <xsl:element name="com:DD/com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dd/crossref">
    <xsl:element name="com:DD/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit">
    <xsl:element name="com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/@id">
    <xsl:element name="com:PatentCitation/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/@num">
    <xsl:element name="com:PatentCitation/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/text">
    <xsl:element name="com:PatentCitation/com:PatentCitationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/document-id">
    <xsl:element name="com:PatentCitation/com:CitedPatentDocumentIdentification" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/document-id/country">
    <xsl:element name="com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/document-id/doc-number">
    <xsl:element name="com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/document-id/kind">
    <xsl:element name="com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="patcit/document-id/date">
    <xsl:element name="com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit">
    <xsl:element name="com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/@id">
    <xsl:element name="com:NPLCitation/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/@num">
    <xsl:element name="com:NPLCitation/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/@lang">
    <xsl:element name="com:NPLCitation/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/@file">
    <xsl:element name="com:NPLCitation/com:FileName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/@url">
    <xsl:element name="com:NPLCitation/com:WebURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/text">
    <xsl:element name="com:NPLCitation/com:NPLCitationText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/author">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:AuthorName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/atl">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:SerialALTTitleText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/subname">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:Subordinate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/subname/@subname-type">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:Subordinate/@com:subordinateCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/subname/name">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:Subordinate/com:Name" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/class">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:NPLClass" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/class/@class-type">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:NPLClass/@com:classificationSystem" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/article/cpyrt">
    <xsl:element name="com:NPLCitation/com:CitedJournalArticle/com:NPLCopyrightText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/book">
    <xsl:element name="com:NPLCitation/com:CitedBook" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="nplcit/othercit">
    <xsl:element name="com:NPLCitation/com:CitedOtherKindNPL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit">
    <xsl:element name="com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@id">
    <xsl:element name="com:BioDeposit/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@num">
    <xsl:element name="com:BioDeposit/@com:sequenceNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/@url">
    <xsl:element name="com:BioDeposit/@com:sourceURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/depositary">
    <xsl:element name="com:BioDeposit/com:BioDepositDepositary" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/bio-accno">
    <xsl:element name="com:BioDeposit/com:BiologicalAccessionNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/date">
    <xsl:element name="com:BioDeposit/com:BioDepositDate" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/term">
    <xsl:element name="com:BioDeposit/com:BioDepositTermText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="bio-deposit/dtext">
    <xsl:element name="com:BioDeposit/com:BioDepositText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref">
    <xsl:element name="com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/@idref">
    <xsl:element name="com:CrossReference/@com:idrefs" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/text()">
    <xsl:element name="com:CrossReference/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/b">
    <xsl:element name="com:CrossReference/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/i">
    <xsl:element name="com:CrossReference/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/u">
    <xsl:element name="com:CrossReference/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/o">
    <xsl:element name="com:CrossReference/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/sup">
    <xsl:element name="com:CrossReference/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/sub">
    <xsl:element name="com:CrossReference/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="crossref/smallcaps">
    <xsl:element name="com:CrossReference/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ul">
    <xsl:element name="com:UL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ul/@id">
    <xsl:element name="com:UL/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ul/@list-style">
    <xsl:element name="com:UL/@com:ulStyle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ul/li">
    <xsl:element name="com:UL/com:LI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ol">
    <xsl:element name="com:OL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ol/@id">
    <xsl:element name="com:OL/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ol/@ol-style">
    <xsl:element name="com:OL/@com:olStyle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ol/li">
    <xsl:element name="com:OL/com:LI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page">
    <xsl:element name="pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@id">
    <xsl:element name="pat:DocumentURI/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@he">
    <xsl:element name="pat:PageImage/com:HeightMeasure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@wi">
    <xsl:element name="pat:PageImage/com:WidthMeasure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@type">
    <xsl:element name="pat:DocumentURI/@pat:pageDocumentFormatCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@alt">
    <xsl:element name="pat:PageImage/com:Alt" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@ppf">
    <xsl:element name="pat:DocumentURI/@pat:firstPageNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@ppl">
    <xsl:element name="pat:DocumentURI/@pat:lastPageNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@file">
    <xsl:element name="pat:DocumentURI/@com:documentFileName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@ocr">
    <xsl:element name="pat:DocumentURI/@pat:ocrIndicator" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@color">
    <xsl:element name="pat:PageImage/com:ColourModeCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="doc-page/@orientation">
    <xsl:element name="pat:PageImage/@com:orientationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title">
    <xsl:element name="pat:InventionTitle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/@id">
    <xsl:element name="pat:InventionTitle/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/@lang">
    <xsl:element name="pat:InventionTitle/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/text()">
    <xsl:element name="pat:InventionTitle/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/b">
    <xsl:element name="pat:InventionTitle/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/i">
    <xsl:element name="pat:InventionTitle/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/u">
    <xsl:element name="pat:InventionTitle/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/o">
    <xsl:element name="pat:InventionTitle/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sup">
    <xsl:element name="pat:InventionTitle/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="invention-title/sub">
    <xsl:element name="pat:InventionTitle/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims">
    <xsl:element name="pat:Claims" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/@id">
    <xsl:element name="pat:Claims/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/@lang">
    <xsl:element name="pat:Claims/@com:languageCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/doc-page">
    <xsl:element name="pat:Claims/pat:DocumentURI" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/claim">
    <xsl:element name="pat:Claims/pat:Claim" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/claim/@id">
    <xsl:element name="pat:Claims/pat:Claim/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/claim/@num">
    <xsl:element name="pat:Claims/pat:Claim/pat:ClaimNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claims/claim/claim-text">
    <xsl:element name="pat:Claims/pat:Claim/pat:ClaimText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text">
    <xsl:element name="pat:ClaimText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/text()">
    <xsl:element name="pat:ClaimText/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/claim-text">
    <xsl:element name="pat:ClaimText/pat:ClaimText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/claim-ref">
    <xsl:element name="pat:ClaimText/pat:ClaimReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/claim-ref/@idref">
    <xsl:element name="pat:ClaimText/pat:ClaimReference/@com:idrefs" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/claim-ref/text()">
    <xsl:element name="pat:ClaimText/pat:ClaimReference/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/b">
    <xsl:element name="pat:ClaimText/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/i">
    <xsl:element name="pat:ClaimText/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/u">
    <xsl:element name="pat:ClaimText/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/o">
    <xsl:element name="pat:ClaimText/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/sup">
    <xsl:element name="pat:ClaimText/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/sub">
    <xsl:element name="pat:ClaimText/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/smallcaps">
    <xsl:element name="pat:ClaimText/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/br">
    <xsl:element name="pat:ClaimText/com:Br" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/pre">
    <xsl:element name="pat:ClaimText/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/crossref">
    <xsl:element name="pat:ClaimText/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/figref">
    <xsl:element name="pat:ClaimText/com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/img">
    <xsl:element name="pat:ClaimText/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/chemistry">
    <xsl:element name="pat:ClaimText/com:ChemicalFormulae" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/maths">
    <xsl:element name="pat:ClaimText/com:Math" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="claim-text/tables">
    <xsl:element name="pat:ClaimText/com:Table" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref">
    <xsl:element name="com:FigureReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/@idref">
    <xsl:element name="com:FigureReference/@com:idrefs" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/@num">
    <xsl:element name="com:FigureReference/@com:referencedFigureNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/text()">
    <xsl:element name="com:FigureReference/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/b">
    <xsl:element name="com:FigureReference/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/i">
    <xsl:element name="com:FigureReference/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/u">
    <xsl:element name="com:FigureReference/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/o">
    <xsl:element name="com:FigureReference/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/sup">
    <xsl:element name="com:FigureReference/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/sub">
    <xsl:element name="com:FigureReference/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figref/smallcaps">
    <xsl:element name="com:FigureReference/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chemistry">
    <xsl:element name="com:ChemicalFormulae" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chemistry/@id">
    <xsl:element name="com:ChemicalFormulae/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chemistry/@num">
    <xsl:element name="com:ChemicalFormulae/@com:chemicalFormulaeNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chemistry/img">
    <xsl:element name="com:ChemicalFormulae/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="chemistry/chem">
    <xsl:element name="com:ChemicalFormulae/com:InlineFormula" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title">
    <xsl:element name="com:TableTitle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/text()">
    <xsl:element name="com:TableTitle/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/b">
    <xsl:element name="com:TableTitle/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/i">
    <xsl:element name="com:TableTitle/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/u">
    <xsl:element name="com:TableTitle/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/sup">
    <xsl:element name="com:TableTitle/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/sub">
    <xsl:element name="com:TableTitle/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="title/smallcaps">
    <xsl:element name="com:TableTitle/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure">
    <xsl:element name="pat:Figure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure/@id">
    <xsl:element name="pat:Figure/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure/@num">
    <xsl:element name="pat:Figure/pat:FigureNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure/img">
    <xsl:element name="pat:Figure/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt">
    <xsl:element name="com:DT" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/@id">
    <xsl:element name="com:DT/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/text()">
    <xsl:element name="com:DT/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/b">
    <xsl:element name="com:DT/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/i">
    <xsl:element name="com:DT/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/u">
    <xsl:element name="com:DT/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/o">
    <xsl:element name="com:DT/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/sup">
    <xsl:element name="com:DT/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/sub">
    <xsl:element name="com:DT/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dt/smallcaps">
    <xsl:element name="com:DT/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-1">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-1/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-2">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-2/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-3">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-3/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-4">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-4/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-5">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-5/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/mailcode">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/pobox">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/pobox/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/room">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/room/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-floor">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/address-floor/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/building">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/building/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/street">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/street/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/city">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/county">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/county/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/state">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/state/text()">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/postcode">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/country">
    <xsl:element name="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/text">
    <xsl:element name="com:BioDepositDepositary/com:ContactText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="depositary/address/text/text()">
    <xsl:element name="com:BioDepositDepositary/com:ContactText/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img">
    <xsl:element name="com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@id">
    <xsl:element name="com:Image/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@he">
    <xsl:element name="com:Image/com:HeightMeasure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@wi">
    <xsl:element name="com:Image/com:WidthMeasure" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@file">
    <xsl:element name="com:Image/com:FileName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@alt">
    <xsl:element name="com:Image/com:Alt" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@img-content">
    <xsl:element name="com:Image/@com:imageContentCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@img-format">
    <xsl:element name="com:Image/com:ImageFormatCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@orientation">
    <xsl:element name="com:Image/@com:orientationCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="img/@inline">
    <xsl:element name="com:Image/@com:imageWrappingStyleCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables">
    <xsl:element name="com:Table" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/@id">
    <xsl:element name="com:Table/com:IPOASISTable/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/@num">
    <xsl:element name="com:Table/com:TableImage/@com:tableNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/img">
    <xsl:element name="com:Table/com:TableImage/com:ColourModeCategory" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table">
    <xsl:element name="com:Table/com:IPOASISTable" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/@frame">
    <xsl:element name="com:Table/com:IPOASISTable/@tbl:frame" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/@colsep">
    <xsl:element name="com:Table/com:IPOASISTable/@tbl:colsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/@pgwide">
    <xsl:element name="com:Table/com:IPOASISTable/@com:pageWide" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/title">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableTitle" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/@cols">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:cols" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/@colsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:colsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/@align">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:align" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@colnum">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colnum" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@colname">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colname" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@colwidth">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colwidth" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@colsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@align">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:align" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@char">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:char" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/colspec/@charoff">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:charoff" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/thead">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/thead/@valign">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/@tbl:valign" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/thead/row">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/thead/row/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/thead/row/@valign">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:valign" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/@valign">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/@tbl:valign" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/@valign">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:valign" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@colname">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colname" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@namest">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:namest" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@nameend">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:nameend" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@morerows">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:morerows" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@colsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@rowsep">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:rowsep" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@align">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:align" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@char">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:char" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@charoff">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:charoff" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/@valign">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:valign" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/text()">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/b">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/i">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/u">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/sup">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/sub">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/smallcaps">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/br">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Br" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/patcit">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/nplcit">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/bio-deposit">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/crossref">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/img">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/dl">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:DL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/ul">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:UL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/ol">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:OL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/chemistry">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:ChemicalFormulae" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tables/table/tgroup/tbody/row/entry/maths">
    <xsl:element name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Math" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p">
    <xsl:element name="com:P" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/@id">
    <xsl:element name="com:P/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/@num">
    <xsl:element name="com:P/@com:pNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/text()">
    <xsl:element name="com:P/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b">
    <xsl:element name="com:P/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/text()">
    <xsl:element name="com:P/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/i">
    <xsl:element name="com:P/com:B/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/i/text()">
    <xsl:element name="com:P/com:B/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/u">
    <xsl:element name="com:P/com:B/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/u/text()">
    <xsl:element name="com:P/com:B/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/o">
    <xsl:element name="com:P/com:B/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/o/text()">
    <xsl:element name="com:P/com:B/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/sup">
    <xsl:element name="com:P/com:B/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/sup/text()">
    <xsl:element name="com:P/com:B/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/sub">
    <xsl:element name="com:P/com:B/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/b/sub/text()">
    <xsl:element name="com:P/com:B/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i">
    <xsl:element name="com:P/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/text()">
    <xsl:element name="com:P/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/b">
    <xsl:element name="com:P/com:I/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/b/text()">
    <xsl:element name="com:P/com:I/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/u">
    <xsl:element name="com:P/com:I/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/u/text()">
    <xsl:element name="com:P/com:I/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/o">
    <xsl:element name="com:P/com:I/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/o/text()">
    <xsl:element name="com:P/com:I/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/sup">
    <xsl:element name="com:P/com:I/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/sup/text()">
    <xsl:element name="com:P/com:I/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/sub">
    <xsl:element name="com:P/com:I/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/i/sub/text()">
    <xsl:element name="com:P/com:I/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u">
    <xsl:element name="com:P/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/text()">
    <xsl:element name="com:P/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/b">
    <xsl:element name="com:P/com:U/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/b/text()">
    <xsl:element name="com:P/com:U/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/i">
    <xsl:element name="com:P/com:U/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/i/text()">
    <xsl:element name="com:P/com:U/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/sup">
    <xsl:element name="com:P/com:U/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/sup/text()">
    <xsl:element name="com:P/com:U/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/sub">
    <xsl:element name="com:P/com:U/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/u/sub/text()">
    <xsl:element name="com:P/com:U/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o">
    <xsl:element name="com:P/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/text()">
    <xsl:element name="com:P/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/b">
    <xsl:element name="com:P/com:O/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/b/text()">
    <xsl:element name="com:P/com:O/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/i">
    <xsl:element name="com:P/com:O/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/i/text()">
    <xsl:element name="com:P/com:O/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/sup">
    <xsl:element name="com:P/com:O/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/sup/text()">
    <xsl:element name="com:P/com:O/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/sub">
    <xsl:element name="com:P/com:O/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/o/sub/text()">
    <xsl:element name="com:P/com:O/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup">
    <xsl:element name="com:P/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/text()">
    <xsl:element name="com:P/com:Sup/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/b">
    <xsl:element name="com:P/com:Sup/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/b/text()">
    <xsl:element name="com:P/com:Sup/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/u">
    <xsl:element name="com:P/com:Sup/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/u/text()">
    <xsl:element name="com:P/com:Sup/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/i">
    <xsl:element name="com:P/com:Sup/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/i/text()">
    <xsl:element name="com:P/com:Sup/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/o">
    <xsl:element name="com:P/com:Sup/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/o/text()">
    <xsl:element name="com:P/com:Sup/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2">
    <xsl:element name="com:P/com:Sup/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/text()">
    <xsl:element name="com:P/com:Sup/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/b">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/b/text()">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/u">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/u/text()">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/i">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/i/text()">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/o">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sup2/o/text()">
    <xsl:element name="com:P/com:Sup/com:Sup2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2">
    <xsl:element name="com:P/com:Sup/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/text()">
    <xsl:element name="com:P/com:Sup/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/b">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/b/text()">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/u">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/u/text()">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/i">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/i/text()">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/o">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sup/sub2/o/text()">
    <xsl:element name="com:P/com:Sup/com:Sub2/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub">
    <xsl:element name="com:P/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/text()">
    <xsl:element name="com:P/com:Sub/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/b">
    <xsl:element name="com:P/com:Sub/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/b/text()">
    <xsl:element name="com:P/com:Sub/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/u">
    <xsl:element name="com:P/com:Sub/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/u/text()">
    <xsl:element name="com:P/com:Sub/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/i">
    <xsl:element name="com:P/com:Sub/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/i/text()">
    <xsl:element name="com:P/com:Sub/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/o">
    <xsl:element name="com:P/com:Sub/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/o/text()">
    <xsl:element name="com:P/com:Sub/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/sup2">
    <xsl:element name="com:P/com:Sub/com:Sup2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/sup2/text()">
    <xsl:element name="com:P/com:Sub/com:Sup2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/sub2">
    <xsl:element name="com:P/com:Sub/com:Sub2" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/sub/sub2/text()">
    <xsl:element name="com:P/com:Sub/com:Sub2/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps">
    <xsl:element name="com:P/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/text()">
    <xsl:element name="com:P/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/b">
    <xsl:element name="com:P/com:SmallCapital/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/b/text()">
    <xsl:element name="com:P/com:SmallCapital/com:B/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/u">
    <xsl:element name="com:P/com:SmallCapital/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/u/text()">
    <xsl:element name="com:P/com:SmallCapital/com:U/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/i">
    <xsl:element name="com:P/com:SmallCapital/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/i/text()">
    <xsl:element name="com:P/com:SmallCapital/com:I/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/o">
    <xsl:element name="com:P/com:SmallCapital/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/smallcaps/o/text()">
    <xsl:element name="com:P/com:SmallCapital/com:O/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/br">
    <xsl:element name="com:P/com:Br" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/pre">
    <xsl:element name="com:P/com:Pre" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/dl">
    <xsl:element name="com:P/com:DL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/ul">
    <xsl:element name="com:P/com:UL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/ol">
    <xsl:element name="com:P/com:OL" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/@idref">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/b">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/b/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/i">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/i/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/u">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/u/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/o">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/o/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/sup">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/sup/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/sub">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/sub/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/smallcaps">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/crossref/smallcaps/text()">
    <xsl:element name="com:P/com:CrossReference" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/@idref">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/@num">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/b">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/b/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/i">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/i/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/u">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/u/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/o">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/o/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/sup">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/sup/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/sub">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/sub/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/smallcaps">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/figref/smallcaps/text()">
    <xsl:element name="com:P/com:FigureReference/com:SmallCapital/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/patcit">
    <xsl:element name="com:P/com:PatentCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/nplcit">
    <xsl:element name="com:P/com:NPLCitation" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/bio-deposit">
    <xsl:element name="com:P/com:BioDeposit" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/img">
    <xsl:element name="com:P/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/chemistry">
    <xsl:element name="com:P/com:ChemicalFormulae" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/maths">
    <xsl:element name="com:P/com:Math" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p/tables">
    <xsl:element name="com:P/com:Table" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading">
    <xsl:element name="com:Heading" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/@level">
    <xsl:element name="com:Heading/@com:headingLevelCode" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/@id">
    <xsl:element name="com:Heading/@com:id" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/text()">
    <xsl:element name="com:Heading/text()" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/b">
    <xsl:element name="com:Heading/com:B" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/i">
    <xsl:element name="com:Heading/com:I" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/u">
    <xsl:element name="com:Heading/com:U" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/o">
    <xsl:element name="com:Heading/com:O" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/sup">
    <xsl:element name="com:Heading/com:Sup" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/sub">
    <xsl:element name="com:Heading/com:Sub" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="heading/smallcaps">
    <xsl:element name="com:Heading/com:SmallCapital" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maths">
    <xsl:element name="com:Math" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maths/@num">
    <xsl:element name="com:Math/@com:mathNumber" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="maths/img">
    <xsl:element name="com:Math/com:Image" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-1">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-3">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-4">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-5">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-floor">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="building">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="street">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="state">
    <xsl:element name="com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pobox">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="room">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="county">
    <xsl:element name="com:GeographicRegionName" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address-2">
    <xsl:element name="com:AddressLineText" namespace="http://www.wipo.int/standards/XMLSchema/ST96/Patent">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

 </xsl:stylesheet>