<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common"
            xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" version="3.0">
  <template match="@* | node()">
    <copy>
      <apply-templates select="@* | node()"/>
    </copy>
  </template>
  <template match="application-body/@lang">
    <apply-templates select="pat:ApplicationBody/@com:languageCode"/>
  </template>
  <template match="application-body/@file">
    <apply-templates select="pat:ApplicationBody/@com:documentFileName"/>
  </template>
  <template match="application-body/@file-reference-id">
    <apply-templates select="pat:ApplicationBody/@com:fileReferenceIdentifier"/>
  </template>
  <template match="application-body/@country">
    <apply-templates select="pat:ApplicationBody/@com:receivingOffice"/>
  </template>
  <template match="application-body/@status">
    <apply-templates select="pat:ApplicationBody/@pat:applicationBodyStatus"/>
  </template>
  <template match="application-body/doc-page">
    <apply-templates select="pat:ApplicationBody/pat:DocumentURI"/>
  </template>
  <template match="application-body/description">
    <apply-templates select="pat:ApplicationBody/pat:Description"/>
  </template>
  <template match="application-body/description/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/@com:id"/>
  </template>
  <template match="application-body/description/@lang">
    <apply-templates select="pat:ApplicationBody/pat:Description/@com:languageCode"/>
  </template>
  <template match="application-body/description/doc-page">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DocumentURI"/>
  </template>
  <template match="application-body/description/invention-title">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionTitle"/>
  </template>
  <template match="application-body/description/technical-field">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:TechnicalField"/>
  </template>
  <template match="application-body/description/technical-field/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:TechnicalField/@com:id"/>
  </template>
  <template match="application-body/description/technical-field/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:TechnicalField/com:Heading"/>
  </template>
  <template match="application-body/description/technical-field/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:TechnicalField/com:P"/>
  </template>
  <template match="application-body/description/background-art">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BackgroundArt"/>
  </template>
  <template match="application-body/description/background-art/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BackgroundArt/@com:id"/>
  </template>
  <template match="application-body/description/background-art/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BackgroundArt/com:Heading"/>
  </template>
  <template match="application-body/description/background-art/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BackgroundArt/com:P"/>
  </template>
  <template match="application-body/description/disclosure">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure"/>
  </template>
  <template match="application-body/description/disclosure/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/@com:id"/>
  </template>
  <template match="application-body/description/disclosure/tech-problem">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalProblem"/>
  </template>
  <template match="application-body/description/disclosure/tech-problem/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalProblem/@com:id"/>
  </template>
  <template match="application-body/description/disclosure/tech-problem/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:Heading"/>
  </template>
  <template match="application-body/description/disclosure/tech-problem/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalProblem/com:P"/>
  </template>
  <template match="application-body/description/disclosure/tech-solution">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalSolution"/>
  </template>
  <template match="application-body/description/disclosure/tech-solution/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalSolution/@com:id"/>
  </template>
  <template match="application-body/description/disclosure/tech-solution/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:Heading"/>
  </template>
  <template match="application-body/description/disclosure/tech-solution/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalSolution/com:P"/>
  </template>
  <template match="application-body/description/disclosure/advantageous-effects">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:AdvantageousEffects"/>
  </template>
  <template match="application-body/description/disclosure/advantageous-effects/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:AdvantageousEffects/@com:id"/>
  </template>
  <template match="application-body/description/disclosure/advantageous-effects/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:Heading"/>
  </template>
  <template match="application-body/description/disclosure/advantageous-effects/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:AdvantageousEffects/com:P"/>
  </template>
  <template match="application-body/description/disclosure/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/com:Heading"/>
  </template>
  <template match="application-body/description/disclosure/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:Disclosure/com:P"/>
  </template>
  <template match="application-body/description/summary-of-invention">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary"/>
  </template>
  <template match="application-body/description/summary-of-invention/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/@com:id"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-problem">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalProblem"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-problem/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalProblem/@com:id"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-problem/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:Heading"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-problem/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalProblem/com:P"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-solution">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalSolution"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-solution/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalSolution/@com:id"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-solution/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:Heading"/>
  </template>
  <template match="application-body/description/summary-of-invention/tech-solution/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalSolution/com:P"/>
  </template>
  <template match="application-body/description/summary-of-invention/advantageous-effects">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:AdvantageousEffects"/>
  </template>
  <template match="application-body/description/summary-of-invention/advantageous-effects/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/@com:id"/>
  </template>
  <template match="application-body/description/summary-of-invention/advantageous-effects/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:Heading"/>
  </template>
  <template match="application-body/description/summary-of-invention/advantageous-effects/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/com:P"/>
  </template>
  <template match="application-body/description/summary-of-invention/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/com:Heading"/>
  </template>
  <template match="application-body/description/summary-of-invention/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionSummary/com:P"/>
  </template>
  <template match="application-body/description/description-of-drawings">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DrawingDescription"/>
  </template>
  <template match="application-body/description/description-of-drawings/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DrawingDescription/@com:id"/>
  </template>
  <template match="application-body/description/description-of-drawings/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DrawingDescription/com:Heading"/>
  </template>
  <template match="application-body/description/description-of-drawings/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DrawingDescription/com:P"/>
  </template>
  <template match="application-body/description/description-of-embodiments">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription"/>
  </template>
  <template match="application-body/description/description-of-embodiments/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/@com:id"/>
  </template>
  <template match="application-body/description/description-of-embodiments/embodiments-example">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample"/>
  </template>
  <template match="application-body/description/description-of-embodiments/embodiments-example/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@com:id"/>
  </template>
  <template match="application-body/description/description-of-embodiments/embodiments-example/@ex-num">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@pat:exampleNumber"/>
  </template>
  <template match="application-body/description/description-of-embodiments/embodiments-example/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:Heading"/>
  </template>
  <template match="application-body/description/description-of-embodiments/embodiments-example/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/com:P"/>
  </template>
  <template match="application-body/description/description-of-embodiments/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/com:Heading"/>
  </template>
  <template match="application-body/description/description-of-embodiments/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/com:P"/>
  </template>
  <template match="application-body/description/best-mode">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BestMode"/>
  </template>
  <template match="application-body/description/best-mode/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BestMode/@com:id"/>
  </template>
  <template match="application-body/description/best-mode/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BestMode/com:Heading"/>
  </template>
  <template match="application-body/description/best-mode/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:BestMode/com:P"/>
  </template>
  <template match="application-body/description/mode-for-invention">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionMode"/>
  </template>
  <template match="application-body/description/mode-for-invention/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionMode/@com:id"/>
  </template>
  <template match="application-body/description/mode-for-invention/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionMode/com:Heading"/>
  </template>
  <template match="application-body/description/mode-for-invention/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:InventionMode/com:P"/>
  </template>
  <template match="application-body/description/industrial-applicability">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:IndustrialApplicability"/>
  </template>
  <template match="application-body/description/industrial-applicability/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:IndustrialApplicability/@com:id"/>
  </template>
  <template match="application-body/description/industrial-applicability/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:IndustrialApplicability/com:Heading"/>
  </template>
  <template match="application-body/description/industrial-applicability/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:IndustrialApplicability/com:P"/>
  </template>
  <template match="application-body/description/reference-signs-list">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:ReferenceSignBag"/>
  </template>
  <template match="application-body/description/reference-signs-list/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:ReferenceSignBag/@com:id"/>
  </template>
  <template match="application-body/description/reference-signs-list/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:ReferenceSignBag/com:Heading"/>
  </template>
  <template match="application-body/description/reference-signs-list/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:ReferenceSignBag/com:P"/>
  </template>
  <template match="application-body/description/reference-to-deposited-biological-material">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DepositedBiologicalMaterialReference"/>
  </template>
  <template match="application-body/description/reference-to-deposited-biological-material/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DepositedBiologicalMaterialReference/@com:id"/>
  </template>
  <template match="application-body/description/reference-to-deposited-biological-material/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DepositedBiologicalMaterialReference/com:Heading"/>
  </template>
  <template match="application-body/description/reference-to-deposited-biological-material/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:DepositedBiologicalMaterialReference/com:P"/>
  </template>
  <template match="application-body/description/sequence-list-text">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:SequenceListText"/>
  </template>
  <template match="application-body/description/sequence-list-text/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:SequenceListText/@com:id"/>
  </template>
  <template match="application-body/description/sequence-list-text/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:SequenceListText/com:Heading"/>
  </template>
  <template match="application-body/description/sequence-list-text/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/pat:SequenceListText/com:P"/>
  </template>
  <template match="application-body/description/citation-list">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag"/>
  </template>
  <template match="application-body/description/citation-list/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/@com:id"/>
  </template>
  <template match="application-body/description/citation-list/patent-literature">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:PatentCitationBag"/>
  </template>
  <template match="application-body/description/citation-list/patent-literature/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:PatentCitationBag/com:Heading"/>
  </template>
  <template match="application-body/description/citation-list/patent-literature/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:PatentCitationBag/com:P"/>
  </template>
  <template match="application-body/description/citation-list/non-patent-literature">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:NPLCitationBag"/>
  </template>
  <template match="application-body/description/citation-list/non-patent-literature/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:NPLCitationBag/com:Heading"/>
  </template>
  <template match="application-body/description/citation-list/non-patent-literature/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:NPLCitationBag/com:P"/>
  </template>
  <template match="application-body/description/citation-list/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:Heading"/>
  </template>
  <template match="application-body/description/citation-list/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:CitationBag/com:P"/>
  </template>
  <template match="application-body/description/heading">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/@level">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/@id">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/b">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/b/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/i">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/i/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/u">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/u/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/o">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/o/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/sup">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/sup/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/sub">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/sub/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/smallcaps">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/heading/smallcaps/text()">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()"/>
  </template>
  <template match="application-body/description/p">
    <apply-templates select="pat:ApplicationBody/pat:Description/com:P"/>
  </template>
  <template match="application-body/claims">
    <apply-templates select="pat:ApplicationBody/pat:Claims/pat:Claim"/>
  </template>
  <template match="application-body/claims/@id">
    <apply-templates select="pat:ApplicationBody/pat:Claims/@com:id"/>
  </template>
  <template match="application-body/abstract">
    <apply-templates select="pat:ApplicationBody/pat:Abstract"/>
  </template>
  <template match="application-body/abstract/@id">
    <apply-templates select="pat:ApplicationBody/pat:Abstract/@com:id"/>
  </template>
  <template match="application-body/abstract/@lang">
    <apply-templates select="pat:ApplicationBody/pat:Abstract/@com:languageCode"/>
  </template>
  <template match="application-body/abstract/doc-page">
    <apply-templates select="pat:ApplicationBody/pat:Abstract/pat:DocumentURI"/>
  </template>
  <template match="application-body/abstract/p">
    <apply-templates select="pat:ApplicationBody/pat:Abstract/com:P"/>
  </template>
  <template match="application-body/drawings">
    <apply-templates select="pat:ApplicationBody/pat:Drawings"/>
  </template>
  <template match="application-body/drawings/@id">
    <apply-templates select="pat:ApplicationBody/pat:Drawings/@com:id"/>
  </template>
  <template match="application-body/drawings/doc-page">
    <apply-templates select="pat:ApplicationBody/pat:Drawings/pat:DocumentURI"/>
  </template>
  <template match="application-body/drawings/figure">
    <apply-templates select="pat:ApplicationBody/pat:Drawings/pat:Figure"/>
  </template>
  <template match="b">
    <apply-templates select="com:B"/>
  </template>
  <template match="b/text()">
    <apply-templates select="com:B/text()"/>
  </template>
  <template match="b/i">
    <apply-templates select="com:B/com:I"/>
  </template>
  <template match="b/i/text()">
    <apply-templates select="com:B/com:I/text()"/>
  </template>
  <template match="b/i/b">
    <apply-templates select="com:B/com:I/com:B"/>
  </template>
  <template match="b/i/b/text()">
    <apply-templates select="com:B/com:I/com:B/text()"/>
  </template>
  <template match="b/i/u">
    <apply-templates select="com:B/com:I/com:U"/>
  </template>
  <template match="b/i/u/text()">
    <apply-templates select="com:B/com:I/com:U/text()"/>
  </template>
  <template match="b/i/o">
    <apply-templates select="com:B/com:I/com:O"/>
  </template>
  <template match="b/i/o/text()">
    <apply-templates select="com:B/com:I/com:O/text()"/>
  </template>
  <template match="b/i/sup">
    <apply-templates select="com:B/com:I/com:Sup"/>
  </template>
  <template match="b/i/sup/text()">
    <apply-templates select="com:B/com:I/com:Sup/text()"/>
  </template>
  <template match="b/i/sub">
    <apply-templates select="com:B/com:I/com:Sub"/>
  </template>
  <template match="b/i/sub/text()">
    <apply-templates select="com:B/com:I/com:Sub/text()"/>
  </template>
  <template match="b/u">
    <apply-templates select="com:B/com:U"/>
  </template>
  <template match="b/u/text()">
    <apply-templates select="com:B/com:U/text()"/>
  </template>
  <template match="b/u/b">
    <apply-templates select="com:B/com:U/com:B"/>
  </template>
  <template match="b/u/b/text()">
    <apply-templates select="com:B/com:U/com:B/text()"/>
  </template>
  <template match="b/u/i">
    <apply-templates select="com:B/com:U/com:I"/>
  </template>
  <template match="b/u/i/text()">
    <apply-templates select="com:B/com:U/com:I/text()"/>
  </template>
  <template match="b/u/sup">
    <apply-templates select="com:B/com:U/com:Sup"/>
  </template>
  <template match="b/u/sup/text()">
    <apply-templates select="com:B/com:U/com:Sup/text()"/>
  </template>
  <template match="b/u/sub">
    <apply-templates select="com:B/com:U/com:Sub"/>
  </template>
  <template match="b/u/sub/text()">
    <apply-templates select="com:B/com:U/com:Sub/text()"/>
  </template>
  <template match="b/o">
    <apply-templates select="com:B/com:O"/>
  </template>
  <template match="b/o/text()">
    <apply-templates select="com:B/com:O/text()"/>
  </template>
  <template match="b/o/b">
    <apply-templates select="com:B/com:O/com:B"/>
  </template>
  <template match="b/o/b/text()">
    <apply-templates select="com:B/com:O/com:B/text()"/>
  </template>
  <template match="b/o/i">
    <apply-templates select="com:B/com:O/com:I"/>
  </template>
  <template match="b/o/i/text()">
    <apply-templates select="com:B/com:O/com:I/text()"/>
  </template>
  <template match="b/o/sup">
    <apply-templates select="com:B/com:O/com:Sup"/>
  </template>
  <template match="b/o/sup/text()">
    <apply-templates select="com:B/com:O/com:Sup/text()"/>
  </template>
  <template match="b/o/sub">
    <apply-templates select="com:B/com:O/com:Sub"/>
  </template>
  <template match="b/o/sub/text()">
    <apply-templates select="com:B/com:O/com:Sub/text()"/>
  </template>
  <template match="b/smallcaps">
    <apply-templates select="com:B/com:SmallCapital"/>
  </template>
  <template match="b/smallcaps/text()">
    <apply-templates select="com:B/com:SmallCapital/text()"/>
  </template>
  <template match="b/smallcaps/b">
    <apply-templates select="com:B/com:SmallCapital/com:B"/>
  </template>
  <template match="b/smallcaps/b/text()">
    <apply-templates select="com:B/com:SmallCapital/com:B/text()"/>
  </template>
  <template match="b/smallcaps/u">
    <apply-templates select="com:B/com:SmallCapital/com:U"/>
  </template>
  <template match="b/smallcaps/u/text()">
    <apply-templates select="com:B/com:SmallCapital/com:U/text()"/>
  </template>
  <template match="b/smallcaps/i">
    <apply-templates select="com:B/com:SmallCapital/com:I"/>
  </template>
  <template match="b/smallcaps/i/text()">
    <apply-templates select="com:B/com:SmallCapital/com:I/text()"/>
  </template>
  <template match="b/smallcaps/o">
    <apply-templates select="com:B/com:SmallCapital/com:O"/>
  </template>
  <template match="b/smallcaps/o/text()">
    <apply-templates select="com:B/com:SmallCapital/com:O/text()"/>
  </template>
  <template match="b/sup/b">
    <apply-templates select="com:B/com:Sup/com:B"/>
  </template>
  <template match="b/sup/b/text()">
    <apply-templates select="com:B/com:Sup/com:B/text()"/>
  </template>
  <template match="b/sup/u">
    <apply-templates select="com:B/com:Sup/com:U"/>
  </template>
  <template match="b/sup/u/text()">
    <apply-templates select="com:B/com:Sup/com:U/text()"/>
  </template>
  <template match="b/sup/i">
    <apply-templates select="com:B/com:Sup/com:I"/>
  </template>
  <template match="b/sup/i/text()">
    <apply-templates select="com:B/com:Sup/com:I/text()"/>
  </template>
  <template match="b/sup/o">
    <apply-templates select="com:B/com:Sup/com:O"/>
  </template>
  <template match="b/sup/o/text()">
    <apply-templates select="com:B/com:Sup/com:O/text()"/>
  </template>
  <template match="b/sup/sup2">
    <apply-templates select="com:B/com:Sup/com:Sup2"/>
  </template>
  <template match="b/sup/sup2/text()">
    <apply-templates select="com:B/com:Sup/com:Sup2/text()"/>
  </template>
  <template match="b/sup/sup2/b">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:B"/>
  </template>
  <template match="b/sup/sup2/b/text()">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:B/text()"/>
  </template>
  <template match="b/sup/sup2/u">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:U"/>
  </template>
  <template match="b/sup/sup2/u/text()">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:U/text()"/>
  </template>
  <template match="b/sup/sup2/i">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:I"/>
  </template>
  <template match="b/sup/sup2/i/text()">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:I/text()"/>
  </template>
  <template match="b/sup/sup2/o">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:O"/>
  </template>
  <template match="b/sup/sup2/o/text()">
    <apply-templates select="com:B/com:Sup/com:Sup2/com:O/text()"/>
  </template>
  <template match="b/sup/sub2">
    <apply-templates select="com:B/com:Sup/com:Sub2"/>
  </template>
  <template match="b/sup/sub2/text()">
    <apply-templates select="com:B/com:Sup/com:Sub2/text()"/>
  </template>
  <template match="b/sup/sub2/b">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:B"/>
  </template>
  <template match="b/sup/sub2/b/text()">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:B/text()"/>
  </template>
  <template match="b/sup/sub2/u">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:U"/>
  </template>
  <template match="b/sup/sub2/u/text()">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:U/text()"/>
  </template>
  <template match="b/sup/sub2/i">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:I"/>
  </template>
  <template match="b/sup/sub2/i/text()">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:I/text()"/>
  </template>
  <template match="b/sup/sub2/o">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:O"/>
  </template>
  <template match="b/sup/sub2/o/text()">
    <apply-templates select="com:B/com:Sup/com:Sub2/com:O/text()"/>
  </template>
  <template match="b/sub">
    <apply-templates select="com:B/com:Sup"/>
  </template>
  <template match="b/sub/text()">
    <apply-templates select="com:B/com:Sup/text()"/>
  </template>
  <template match="b/sub/b">
    <apply-templates select="com:B/com:Sub/com:B"/>
  </template>
  <template match="b/sub/b/text()">
    <apply-templates select="com:B/com:Sub/com:B/text()"/>
  </template>
  <template match="b/sub/u">
    <apply-templates select="com:B/com:Sub/com:U"/>
  </template>
  <template match="b/sub/u/text()">
    <apply-templates select="com:B/com:Sub/com:U/text()"/>
  </template>
  <template match="b/sub/i">
    <apply-templates select="com:B/com:Sub/com:I"/>
  </template>
  <template match="b/sub/i/text()">
    <apply-templates select="com:B/com:Sub/com:I/text()"/>
  </template>
  <template match="b/sub/o">
    <apply-templates select="com:B/com:Sub/com:O"/>
  </template>
  <template match="b/sub/o/text()">
    <apply-templates select="com:B/com:Sub/com:O/text()"/>
  </template>
  <template match="b/sub/sup2">
    <apply-templates select="com:B/com:Sub/com:Sup2"/>
  </template>
  <template match="b/sub/sup2/text()">
    <apply-templates select="com:B/com:Sub/com:Sup2/text()"/>
  </template>
  <template match="b/sub/sup2/b">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:B"/>
  </template>
  <template match="b/sub/sup2/b/text()">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:B/text()"/>
  </template>
  <template match="b/sub/sup2/u">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:U"/>
  </template>
  <template match="b/sub/sup2/u/text()">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:U/text()"/>
  </template>
  <template match="b/sub/sup2/i">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:I"/>
  </template>
  <template match="b/sub/sup2/i/text()">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:I/text()"/>
  </template>
  <template match="b/sub/sup2/o">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:O"/>
  </template>
  <template match="b/sub/sup2/o/text()">
    <apply-templates select="com:B/com:Sub/com:Sup2/com:O/text()"/>
  </template>
  <template match="b/sub/sub2">
    <apply-templates select="com:B/com:Sub/com:Sub2"/>
  </template>
  <template match="b/sub/sub2/text()">
    <apply-templates select="com:B/com:Sub/com:Sub2/text()"/>
  </template>
  <template match="b/sub/sub2/b">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:B"/>
  </template>
  <template match="b/sub/sub2/b/text()">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:B/text()"/>
  </template>
  <template match="b/sub/sub2/u">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:U"/>
  </template>
  <template match="b/sub/sub2/u/text()">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:U/text()"/>
  </template>
  <template match="b/sub/sub2/i">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:I"/>
  </template>
  <template match="b/sub/sub2/i/text()">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:I/text()"/>
  </template>
  <template match="b/sub/sub2/o">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:O"/>
  </template>
  <template match="b/sub/sub2/o/text()">
    <apply-templates select="com:B/com:Sub/com:Sub2/com:O/text()"/>
  </template>
  <template match="i">
    <apply-templates select="com:I"/>
  </template>
  <template match="i/text()">
    <apply-templates select="com:I/text()"/>
  </template>
  <template match="i/b">
    <apply-templates select="com:I/com:B"/>
  </template>
  <template match="i/u">
    <apply-templates select="com:I/com:U/com:B/com:U"/>
  </template>
  <template match="i/o">
    <apply-templates select="com:I/com:O"/>
  </template>
  <template match="i/smallcaps">
    <apply-templates select="com:I/com:SmallCapital"/>
  </template>
  <template match="i/sup">
    <apply-templates select="com:I/com:Sup"/>
  </template>
  <template match="i/sub">
    <apply-templates select="com:I/com:Sub"/>
  </template>
  <template match="li">
    <apply-templates select="com:LI"/>
  </template>
  <template match="li/@id">
    <apply-templates select="com:LI/@com:id"/>
  </template>
  <template match="li/@num">
    <apply-templates select="com:LI/@com:liNumber"/>
  </template>
  <template match="li/text()">
    <apply-templates select="com:LI/text()"/>
  </template>
  <template match="li/b">
    <apply-templates select="com:LI/com:B"/>
  </template>
  <template match="li/b/text()">
    <apply-templates select="com:LI/com:B/text()"/>
  </template>
  <template match="li/b/i">
    <apply-templates select="com:LI/com:B/com:I"/>
  </template>
  <template match="li/b/i/text()">
    <apply-templates select="com:LI/com:B/com:I/text()"/>
  </template>
  <template match="li/b/u">
    <apply-templates select="com:LI/com:B/com:U"/>
  </template>
  <template match="li/b/u/text()">
    <apply-templates select="com:LI/com:B/com:U/text()"/>
  </template>
  <template match="li/b/o">
    <apply-templates select="com:LI/com:B/com:O"/>
  </template>
  <template match="li/b/o/text()">
    <apply-templates select="com:LI/com:B/com:O/text()"/>
  </template>
  <template match="li/b/sup">
    <apply-templates select="com:LI/com:B/com:Sup"/>
  </template>
  <template match="li/b/sup/text()">
    <apply-templates select="com:LI/com:B/com:Sup/text()"/>
  </template>
  <template match="li/b/sub">
    <apply-templates select="com:LI/com:B/com:Sub"/>
  </template>
  <template match="li/b/sub/text()">
    <apply-templates select="com:LI/com:B/com:Sub/text()"/>
  </template>
  <template match="li/i">
    <apply-templates select="com:LI/com:I"/>
  </template>
  <template match="li/i/text()">
    <apply-templates select="com:LI/com:I/text()"/>
  </template>
  <template match="li/i/b">
    <apply-templates select="com:LI/com:I/com:B"/>
  </template>
  <template match="li/i/b/text()">
    <apply-templates select="com:LI/com:I/com:B/text()"/>
  </template>
  <template match="li/i/u">
    <apply-templates select="com:LI/com:I/com:U"/>
  </template>
  <template match="li/i/u/text()">
    <apply-templates select="com:LI/com:I/com:U/text()"/>
  </template>
  <template match="li/i/o">
    <apply-templates select="com:LI/com:I/com:O"/>
  </template>
  <template match="li/i/o/text()">
    <apply-templates select="com:LI/com:I/com:O/text()"/>
  </template>
  <template match="li/i/sup">
    <apply-templates select="com:LI/com:I/com:Sup"/>
  </template>
  <template match="li/i/sup/text()">
    <apply-templates select="com:LI/com:I/com:Sup/text()"/>
  </template>
  <template match="li/i/sub">
    <apply-templates select="com:LI/com:I/com:Sub"/>
  </template>
  <template match="li/i/sub/text()">
    <apply-templates select="com:LI/com:I/com:Sub/text()"/>
  </template>
  <template match="li/u">
    <apply-templates select="com:LI/com:U"/>
  </template>
  <template match="li/u/text()">
    <apply-templates select="com:LI/com:U/text()"/>
  </template>
  <template match="li/u/b">
    <apply-templates select="com:LI/com:U/com:B"/>
  </template>
  <template match="li/u/b/text()">
    <apply-templates select="com:LI/com:U/com:B/text()"/>
  </template>
  <template match="li/u/i">
    <apply-templates select="com:LI/com:U/com:I"/>
  </template>
  <template match="li/u/i/text()">
    <apply-templates select="com:LI/com:U/com:I/text()"/>
  </template>
  <template match="li/u/sup">
    <apply-templates select="com:LI/com:U/com:Sup"/>
  </template>
  <template match="li/u/sup/text()">
    <apply-templates select="com:LI/com:U/com:Sup/text()"/>
  </template>
  <template match="li/u/sub">
    <apply-templates select="com:LI/com:U/com:Sub"/>
  </template>
  <template match="li/u/sub/text()">
    <apply-templates select="com:LI/com:U/com:Sub/text()"/>
  </template>
  <template match="li/o">
    <apply-templates select="com:LI/com:O"/>
  </template>
  <template match="li/o/text()">
    <apply-templates select="com:LI/com:O/text()"/>
  </template>
  <template match="li/o/b">
    <apply-templates select="com:LI/com:O/com:B"/>
  </template>
  <template match="li/o/b/text()">
    <apply-templates select="com:LI/com:O/com:B/text()"/>
  </template>
  <template match="li/o/i">
    <apply-templates select="com:LI/com:O/com:I"/>
  </template>
  <template match="li/o/i/text()">
    <apply-templates select="com:LI/com:O/com:I/text()"/>
  </template>
  <template match="li/o/sup">
    <apply-templates select="com:LI/com:O/com:Sup"/>
  </template>
  <template match="li/o/sup/text()">
    <apply-templates select="com:LI/com:O/com:Sup/text()"/>
  </template>
  <template match="li/o/sub">
    <apply-templates select="com:LI/com:O/com:Sub"/>
  </template>
  <template match="li/o/sub/text()">
    <apply-templates select="com:LI/com:O/com:Sub/text()"/>
  </template>
  <template match="li/sup">
    <apply-templates select="com:LI/com:Sup"/>
  </template>
  <template match="li/sup/text()">
    <apply-templates select="com:LI/com:Sup/text()"/>
  </template>
  <template match="li/sup/b">
    <apply-templates select="com:LI/com:Sup/com:B"/>
  </template>
  <template match="li/sup/b/text()">
    <apply-templates select="com:LI/com:Sup/com:B/text()"/>
  </template>
  <template match="li/sup/u">
    <apply-templates select="com:LI/com:Sup/com:U"/>
  </template>
  <template match="li/sup/u/text()">
    <apply-templates select="com:LI/com:Sup/com:U/text()"/>
  </template>
  <template match="li/sup/i">
    <apply-templates select="com:LI/com:Sup/com:I"/>
  </template>
  <template match="li/sup/i/text()">
    <apply-templates select="com:LI/com:Sup/com:I/text()"/>
  </template>
  <template match="li/sup/o">
    <apply-templates select="com:LI/com:Sup/com:O"/>
  </template>
  <template match="li/sup/o/text()">
    <apply-templates select="com:LI/com:Sup/com:O/text()"/>
  </template>
  <template match="li/sup/sup2">
    <apply-templates select="com:LI/com:Sup/com:Sup2"/>
  </template>
  <template match="li/sup/sup2/text()">
    <apply-templates select="com:LI/com:Sup/com:Sup2/text()"/>
  </template>
  <template match="li/sup/sup2/b">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:B"/>
  </template>
  <template match="li/sup/sup2/b/text()">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:B/text()"/>
  </template>
  <template match="li/sup/sup2/u">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:U"/>
  </template>
  <template match="li/sup/sup2/u/text()">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:U/text()"/>
  </template>
  <template match="li/sup/sup2/i">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:I"/>
  </template>
  <template match="li/sup/sup2/i/text()">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:I/text()"/>
  </template>
  <template match="li/sup/sup2/o">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:O"/>
  </template>
  <template match="li/sup/sup2/o/text()">
    <apply-templates select="com:LI/com:Sup/com:Sup2/com:O/text()"/>
  </template>
  <template match="li/sup/sub2">
    <apply-templates select="com:LI/com:Sup/com:Sub2"/>
  </template>
  <template match="li/sup/sub2/text()">
    <apply-templates select="com:LI/com:Sup/com:Sub2/text()"/>
  </template>
  <template match="li/sup/sub2/b">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:B"/>
  </template>
  <template match="li/sup/sub2/b/text()">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:B/text()"/>
  </template>
  <template match="li/sup/sub2/u">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:U"/>
  </template>
  <template match="li/sup/sub2/u/text()">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:U/text()"/>
  </template>
  <template match="li/sup/sub2/i">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:I"/>
  </template>
  <template match="li/sup/sub2/i/text()">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:I/text()"/>
  </template>
  <template match="li/sup/sub2/o">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:O"/>
  </template>
  <template match="li/sup/sub2/o/text()">
    <apply-templates select="com:LI/com:Sup/com:Sub2/com:O/text()"/>
  </template>
  <template match="li/sub">
    <apply-templates select="com:LI/com:Sub"/>
  </template>
  <template match="li/sub/text()">
    <apply-templates select="com:LI/com:Sub/text()"/>
  </template>
  <template match="li/sub/b">
    <apply-templates select="com:LI/com:Sub/com:B"/>
  </template>
  <template match="li/sub/b/text()">
    <apply-templates select="com:LI/com:Sub/com:B/text()"/>
  </template>
  <template match="li/sub/u">
    <apply-templates select="com:LI/com:Sub/com:U"/>
  </template>
  <template match="li/sub/u/text()">
    <apply-templates select="com:LI/com:Sub/com:U/text()"/>
  </template>
  <template match="li/sub/i">
    <apply-templates select="com:LI/com:Sub/com:I"/>
  </template>
  <template match="li/sub/i/text()">
    <apply-templates select="com:LI/com:Sub/com:I/text()"/>
  </template>
  <template match="li/sub/o">
    <apply-templates select="com:LI/com:Sub/com:O"/>
  </template>
  <template match="li/sub/o/text()">
    <apply-templates select="com:LI/com:Sub/com:O/text()"/>
  </template>
  <template match="li/sub/sup2">
    <apply-templates select="com:LI/com:Sub/com:Sup2"/>
  </template>
  <template match="li/sub/sup2/text()">
    <apply-templates select="com:LI/com:Sub/com:Sup2/text()"/>
  </template>
  <template match="li/sub/sup2/b">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:B"/>
  </template>
  <template match="li/sub/sup2/b/text()">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:B/text()"/>
  </template>
  <template match="li/sub/sup2/u">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:U"/>
  </template>
  <template match="li/sub/sup2/u/text()">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:U/text()"/>
  </template>
  <template match="li/sub/sup2/i">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:I"/>
  </template>
  <template match="li/sub/sup2/i/text()">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:I/text()"/>
  </template>
  <template match="li/sub/sup2/o">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:O"/>
  </template>
  <template match="li/sub/sup2/o/text()">
    <apply-templates select="com:LI/com:Sub/com:Sup2/com:O/text()"/>
  </template>
  <template match="li/sub/sub2">
    <apply-templates select="com:LI/com:Sub/com:Sub2"/>
  </template>
  <template match="li/sub/sub2/text()">
    <apply-templates select="com:LI/com:Sub/com:Sub2/text()"/>
  </template>
  <template match="li/sub/sub2/b">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:B"/>
  </template>
  <template match="li/sub/sub2/b/text()">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:B/text()"/>
  </template>
  <template match="li/sub/sub2/u">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:U"/>
  </template>
  <template match="li/sub/sub2/u/text()">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:U/text()"/>
  </template>
  <template match="li/sub/sub2/i">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:I"/>
  </template>
  <template match="li/sub/sub2/i/text()">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:I/text()"/>
  </template>
  <template match="li/sub/sub2/o">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:O"/>
  </template>
  <template match="li/sub/sub2/o/text()">
    <apply-templates select="com:LI/com:Sub/com:Sub2/com:O/text()"/>
  </template>
  <template match="li/smallcaps">
    <apply-templates select="com:LI/com:SmallCapital"/>
  </template>
  <template match="li/smallcaps/text()">
    <apply-templates select="com:LI/com:SmallCapital/text()"/>
  </template>
  <template match="li/smallcaps/b">
    <apply-templates select="com:LI/com:SmallCapital/com:B"/>
  </template>
  <template match="li/smallcaps/b/text()">
    <apply-templates select="com:LI/com:SmallCapital/com:B/text()"/>
  </template>
  <template match="li/smallcaps/u">
    <apply-templates select="com:LI/com:SmallCapital/com:U"/>
  </template>
  <template match="li/smallcaps/u/text()">
    <apply-templates select="com:LI/com:SmallCapital/com:U/text()"/>
  </template>
  <template match="li/smallcaps/i">
    <apply-templates select="com:LI/com:SmallCapital/com:I"/>
  </template>
  <template match="li/smallcaps/i/text()">
    <apply-templates select="com:LI/com:SmallCapital/com:I/text()"/>
  </template>
  <template match="li/smallcaps/o">
    <apply-templates select="com:LI/com:SmallCapital/com:O"/>
  </template>
  <template match="li/smallcaps/o/text()">
    <apply-templates select="com:LI/com:SmallCapital/com:O/text()"/>
  </template>
  <template match="li/br">
    <apply-templates select="com:LI/com:Br"/>
  </template>
  <template match="li/pre">
    <apply-templates select="com:LI/com:Pre"/>
  </template>
  <template match="li/pre/@id">
    <apply-templates select="com:LI/com:Pre"/>
  </template>
  <template match="li/pre/@xml:space">
    <apply-templates select="com:LI/com:Pre"/>
  </template>
  <template match="li/pre/@listing-type">
    <apply-templates select="com:LI/com:Pre"/>
  </template>
  <template match="li/pre/text()">
    <apply-templates select="com:LI/com:Pre"/>
  </template>
  <template match="li/patcit">
    <apply-templates select="com:LI/com:PatentCitation"/>
  </template>
  <template match="li/nplcit">
    <apply-templates select="com:LI/com:NPLCitation"/>
  </template>
  <template match="li/bio-deposit">
    <apply-templates select="com:LI/com:BioDeposit"/>
  </template>
  <template match="li/crossref">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/@idref">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/b">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/b/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/i">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/i/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/u">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/u/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/o">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/o/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/sup">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/sup/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/sub">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/sub/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/smallcaps">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/crossref/smallcaps/text()">
    <apply-templates select="com:LI/com:CrossReference"/>
  </template>
  <template match="li/figref">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/@idref">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/@num">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/b">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/b/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/i">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/i/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/u">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/u/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/o">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/o/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/sup">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/sup/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/sub">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/sub/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/smallcaps">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/figref/smallcaps/text()">
    <apply-templates select="com:LI/com:FigureReference"/>
  </template>
  <template match="li/img">
    <apply-templates select="com:LI/com:Image"/>
  </template>
  <template match="li/dl">
    <apply-templates select="com:LI/com:DL"/>
  </template>
  <template match="li/ul">
    <apply-templates select="com:LI/com:UL"/>
  </template>
  <template match="li/ol">
    <apply-templates select="com:LI/com:OL"/>
  </template>
  <template match="li/chemistry">
    <apply-templates select="com:LI/com:ChemicalFormulae"/>
  </template>
  <template match="li/maths">
    <apply-templates select="com:LI/com:Math"/>
  </template>
  <template match="o">
    <apply-templates select="com:O"/>
  </template>
  <template match="o/@style">
    <apply-templates select="com:O/@com:oStyle"/>
  </template>
  <template match="o/text()">
    <apply-templates select="com:O/text()"/>
  </template>
  <template match="o/b">
    <apply-templates select="com:O/com:B"/>
  </template>
  <template match="o/i">
    <apply-templates select="com:O/com:I"/>
  </template>
  <template match="o/smallcaps">
    <apply-templates select="com:O/com:SmallCapital"/>
  </template>
  <template match="o/sup">
    <apply-templates select="com:O/com:Sup"/>
  </template>
  <template match="o/sub">
    <apply-templates select="com:O/com:Sub"/>
  </template>
  <template match="smallcaps">
    <apply-templates select="com:SmallCapital"/>
  </template>
  <template match="smallcaps/text()">
    <apply-templates select="com:SmallCapital/text()"/>
  </template>
  <template match="smallcaps/b">
    <apply-templates select="com:SmallCapital/com:B"/>
  </template>
  <template match="smallcaps/u">
    <apply-templates select="com:SmallCapital/com:U"/>
  </template>
  <template match="smallcaps/i">
    <apply-templates select="com:SmallCapital/com:I"/>
  </template>
  <template match="smallcaps/o">
    <apply-templates select="com:SmallCapital/com:O"/>
  </template>
  <template match="sub2">
    <apply-templates select="com:Sub2"/>
  </template>
  <template match="sub2/text()">
    <apply-templates select="com:Sub2/text()"/>
  </template>
  <template match="sub2/b">
    <apply-templates select="com:Sub2/com:B"/>
  </template>
  <template match="sub2/u">
    <apply-templates select="com:Sub2/com:U"/>
  </template>
  <template match="sub2/i">
    <apply-templates select="com:Sub2/com:I"/>
  </template>
  <template match="sub2/o">
    <apply-templates select="com:Sub2/com:O"/>
  </template>
  <template match="sub">
    <apply-templates select="com:Sub"/>
  </template>
  <template match="sub/text()">
    <apply-templates select="com:Sub/text()"/>
  </template>
  <template match="sub/b">
    <apply-templates select="com:Sub/com:B"/>
  </template>
  <template match="sub/u">
    <apply-templates select="com:Sub/com:U"/>
  </template>
  <template match="sub/i">
    <apply-templates select="com:Sub/com:I"/>
  </template>
  <template match="sub/o">
    <apply-templates select="com:Sub/com:O"/>
  </template>
  <template match="sub/sup2">
    <apply-templates select="com:Sub/com:Sup2"/>
  </template>
  <template match="sub/sub2">
    <apply-templates select="com:Sub/com:Sub2"/>
  </template>
  <template match="sup2">
    <apply-templates select="com:Sup2"/>
  </template>
  <template match="sup2/text()">
    <apply-templates select="com:Sup2/text()"/>
  </template>
  <template match="sup2/b">
    <apply-templates select="com:Sup2/com:B"/>
  </template>
  <template match="sup2/u">
    <apply-templates select="com:Sup2/com:U"/>
  </template>
  <template match="sup2/i">
    <apply-templates select="com:Sup2/com:I"/>
  </template>
  <template match="sup2/o">
    <apply-templates select="com:Sup2/com:O"/>
  </template>
  <template match="sup">
    <apply-templates select="com:Sup"/>
  </template>
  <template match="sup/text()">
    <apply-templates select="com:Sup/text()"/>
  </template>
  <template match="sup/b">
    <apply-templates select="com:Sup/com:B"/>
  </template>
  <template match="sup/u">
    <apply-templates select="com:Sup/com:U"/>
  </template>
  <template match="sup/i">
    <apply-templates select="com:Sup/com:I"/>
  </template>
  <template match="sup/o">
    <apply-templates select="com:Sup/com:O"/>
  </template>
  <template match="sup/sup2">
    <apply-templates select="com:Sup/com:Sup2"/>
  </template>
  <template match="sup/sub2">
    <apply-templates select="com:Sup/com:Sub2"/>
  </template>
  <template match="u">
    <apply-templates select="com:U"/>
  </template>
  <template match="u/text()">
    <apply-templates select="com:U/text()"/>
  </template>
  <template match="u/b">
    <apply-templates select="com:U/com:B"/>
  </template>
  <template match="u/i">
    <apply-templates select="com:U/com:I"/>
  </template>
  <template match="u/smallcaps">
    <apply-templates select="com:U/com:SmallCapital"/>
  </template>
  <template match="u/sup">
    <apply-templates select="com:U/com:Sup"/>
  </template>
  <template match="u/sub">
    <apply-templates select="com:U/com:Sub"/>
  </template>
  <template match="pre">
    <apply-templates select="com:Pre"/>
  </template>
  <template match="pre/@id">
    <apply-templates select="com:Pre/@com:id"/>
  </template>
  <template match="pre/@listing-type">
    <apply-templates select="com:Pre/@com:listingCategory"/>
  </template>
  <template match="dl">
    <apply-templates select="com:DL"/>
  </template>
  <template match="dl/@id">
    <apply-templates select="com:DL/@com:id"/>
  </template>
  <template match="dl/dt">
    <apply-templates select="com:DL/com:DT"/>
  </template>
  <template match="dl/dd">
    <apply-templates select="com:DL/com:DD"/>
  </template>
  <template match="dd">
    <apply-templates select="com:DD"/>
  </template>
  <template match="dd/text()">
    <apply-templates select="com:DD/text()"/>
  </template>
  <template match="dd/b">
    <apply-templates select="com:DD/com:B"/>
  </template>
  <template match="dd/i">
    <apply-templates select="com:DD/com:I"/>
  </template>
  <template match="dd/u">
    <apply-templates select="com:DD/com:U"/>
  </template>
  <template match="dd/o">
    <apply-templates select="com:DD/com:O"/>
  </template>
  <template match="dd/sup">
    <apply-templates select="com:DD/com:Sup"/>
  </template>
  <template match="dd/sub">
    <apply-templates select="com:DD/com:Sub"/>
  </template>
  <template match="dd/smallcaps">
    <apply-templates select="com:DD/com:SmallCapital"/>
  </template>
  <template match="dd/br">
    <apply-templates select="com:DD/com:Br"/>
  </template>
  <template match="dd/pre">
    <apply-templates select="com:DD/com:Pre"/>
  </template>
  <template match="dd/patcit">
    <apply-templates select="com:DD/com:PatentCitation"/>
  </template>
  <template match="dd/nplcit">
    <apply-templates select="com:DD/com:NPLCitation"/>
  </template>
  <template match="dd/crossref">
    <apply-templates select="com:DD/com:CrossReference"/>
  </template>
  <template match="patcit">
    <apply-templates select="com:PatentCitation"/>
  </template>
  <template match="patcit/@id">
    <apply-templates select="com:PatentCitation/@com:id"/>
  </template>
  <template match="patcit/@num">
    <apply-templates select="com:PatentCitation/@com:sequenceNumber"/>
  </template>
  <template match="patcit/text">
    <apply-templates select="com:PatentCitation/com:PatentCitationText"/>
  </template>
  <template match="patcit/document-id">
    <apply-templates select="com:PatentCitation/com:CitedPatentDocumentIdentification"/>
  </template>
  <template match="patcit/document-id/country">
    <apply-templates select="com:PatentCitation/com:CitedPatentDocumentIdentification/com:IPOfficeCode"/>
  </template>
  <template match="patcit/document-id/doc-number">
    <apply-templates select="com:PatentCitation/com:CitedPatentDocumentIdentification/com:DocumentNumber"/>
  </template>
  <template match="patcit/document-id/kind">
    <apply-templates select="com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentKindCode"/>
  </template>
  <template match="patcit/document-id/date">
    <apply-templates select="com:PatentCitation/com:CitedPatentDocumentIdentification/com:PatentDocumentDate"/>
  </template>
  <template match="nplcit">
    <apply-templates select="com:NPLCitation"/>
  </template>
  <template match="nplcit/@id">
    <apply-templates select="com:NPLCitation/@com:id"/>
  </template>
  <template match="nplcit/@num">
    <apply-templates select="com:NPLCitation/@com:sequenceNumber"/>
  </template>
  <template match="nplcit/@lang">
    <apply-templates select="com:NPLCitation/@com:languageCode"/>
  </template>
  <template match="nplcit/@file">
    <apply-templates select="com:NPLCitation/com:FileName"/>
  </template>
  <template match="nplcit/@url">
    <apply-templates select="com:NPLCitation/com:WebURI"/>
  </template>
  <template match="nplcit/text">
    <apply-templates select="com:NPLCitation/com:NPLCitationText"/>
  </template>
  <template match="nplcit/article">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle"/>
  </template>
  <template match="nplcit/article/author">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:AuthorName"/>
  </template>
  <template match="nplcit/article/atl">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:SerialALTTitleText"/>
  </template>
  <template match="nplcit/article/subname">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:Subordinate"/>
  </template>
  <template match="nplcit/article/subname/@subname-type">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:Subordinate/@com:subordinateCategory"/>
  </template>
  <template match="nplcit/article/subname/name">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:Subordinate/com:Name"/>
  </template>
  <template match="nplcit/article/class">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:NPLClass"/>
  </template>
  <template match="nplcit/article/class/@class-type">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:NPLClass/@com:classificationSystem"/>
  </template>
  <template match="nplcit/article/cpyrt">
    <apply-templates select="com:NPLCitation/com:CitedJournalArticle/com:NPLCopyrightText"/>
  </template>
  <template match="nplcit/book">
    <apply-templates select="com:NPLCitation/com:CitedBook"/>
  </template>
  <template match="nplcit/othercit">
    <apply-templates select="com:NPLCitation/com:CitedOtherKindNPL"/>
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
  <template match="crossref">
    <apply-templates select="com:CrossReference"/>
  </template>
  <template match="crossref/@idref">
    <apply-templates select="com:CrossReference/@com:idrefs"/>
  </template>
  <template match="crossref/text()">
    <apply-templates select="com:CrossReference/text()"/>
  </template>
  <template match="crossref/b">
    <apply-templates select="com:CrossReference/com:B"/>
  </template>
  <template match="crossref/i">
    <apply-templates select="com:CrossReference/com:I"/>
  </template>
  <template match="crossref/u">
    <apply-templates select="com:CrossReference/com:U"/>
  </template>
  <template match="crossref/o">
    <apply-templates select="com:CrossReference/com:O"/>
  </template>
  <template match="crossref/sup">
    <apply-templates select="com:CrossReference/com:Sup"/>
  </template>
  <template match="crossref/sub">
    <apply-templates select="com:CrossReference/com:Sub"/>
  </template>
  <template match="crossref/smallcaps">
    <apply-templates select="com:CrossReference/com:SmallCapital"/>
  </template>
  <template match="ul">
    <apply-templates select="com:UL"/>
  </template>
  <template match="ul/@id">
    <apply-templates select="com:UL/@com:id"/>
  </template>
  <template match="ul/@list-style">
    <apply-templates select="com:UL/@com:ulStyle"/>
  </template>
  <template match="ul/li">
    <apply-templates select="com:UL/com:LI"/>
  </template>
  <template match="ol">
    <apply-templates select="com:OL"/>
  </template>
  <template match="ol/@id">
    <apply-templates select="com:OL/@com:id"/>
  </template>
  <template match="ol/@ol-style">
    <apply-templates select="com:OL/@com:olStyle"/>
  </template>
  <template match="ol/li">
    <apply-templates select="com:OL/com:LI"/>
  </template>
  <template match="doc-page">
    <apply-templates select="pat:DocumentURI"/>
  </template>
  <template match="doc-page/@id">
    <apply-templates select="pat:DocumentURI/@com:id"/>
  </template>
  <template match="doc-page/@he">
    <apply-templates select="pat:PageImage/com:HeightMeasure"/>
  </template>
  <template match="doc-page/@wi">
    <apply-templates select="pat:PageImage/com:WidthMeasure"/>
  </template>
  <template match="doc-page/@type">
    <apply-templates select="pat:DocumentURI/@pat:pageDocumentFormatCategory"/>
  </template>
  <template match="doc-page/@alt">
    <apply-templates select="pat:PageImage/com:Alt"/>
  </template>
  <template match="doc-page/@ppf">
    <apply-templates select="pat:DocumentURI/@pat:firstPageNumber"/>
  </template>
  <template match="doc-page/@ppl">
    <apply-templates select="pat:DocumentURI/@pat:lastPageNumber"/>
  </template>
  <template match="doc-page/@file">
    <apply-templates select="pat:DocumentURI/@com:documentFileName"/>
  </template>
  <template match="doc-page/@ocr">
    <apply-templates select="pat:DocumentURI/@pat:ocrIndicator"/>
  </template>
  <template match="doc-page/@color">
    <apply-templates select="pat:PageImage/com:ColourModeCategory"/>
  </template>
  <template match="doc-page/@orientation">
    <apply-templates select="pat:PageImage/@com:orientationCategory"/>
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
  <template match="invention-title/i">
    <apply-templates select="pat:InventionTitle/com:I"/>
  </template>
  <template match="invention-title/u">
    <apply-templates select="pat:InventionTitle/com:U"/>
  </template>
  <template match="invention-title/o">
    <apply-templates select="pat:InventionTitle/com:O"/>
  </template>
  <template match="invention-title/sup">
    <apply-templates select="pat:InventionTitle/com:Sup"/>
  </template>
  <template match="invention-title/sub">
    <apply-templates select="pat:InventionTitle/com:Sub"/>
  </template>
  <template match="claims">
    <apply-templates select="pat:Claims"/>
  </template>
  <template match="claims/@id">
    <apply-templates select="pat:Claims/@com:id"/>
  </template>
  <template match="claims/@lang">
    <apply-templates select="pat:Claims/@com:languageCode"/>
  </template>
  <template match="claims/doc-page">
    <apply-templates select="pat:Claims/pat:DocumentURI"/>
  </template>
  <template match="claims/claim">
    <apply-templates select="pat:Claims/pat:Claim"/>
  </template>
  <template match="claims/claim/@id">
    <apply-templates select="pat:Claims/pat:Claim/@com:id"/>
  </template>
  <template match="claims/claim/@num">
    <apply-templates select="pat:Claims/pat:Claim/pat:ClaimNumber"/>
  </template>
  <template match="claims/claim/claim-text">
    <apply-templates select="pat:Claims/pat:Claim/pat:ClaimText"/>
  </template>
  <template match="claim-text">
    <apply-templates select="pat:ClaimText"/>
  </template>
  <template match="claim-text/text()">
    <apply-templates select="pat:ClaimText/text()"/>
  </template>
  <template match="claim-text/claim-text">
    <apply-templates select="pat:ClaimText/pat:ClaimText"/>
  </template>
  <template match="claim-text/claim-ref">
    <apply-templates select="pat:ClaimText/pat:ClaimReference"/>
  </template>
  <template match="claim-text/claim-ref/@idref">
    <apply-templates select="pat:ClaimText/pat:ClaimReference/@com:idrefs"/>
  </template>
  <template match="claim-text/claim-ref/text()">
    <apply-templates select="pat:ClaimText/pat:ClaimReference/text()"/>
  </template>
  <template match="claim-text/b">
    <apply-templates select="pat:ClaimText/com:B"/>
  </template>
  <template match="claim-text/i">
    <apply-templates select="pat:ClaimText/com:I"/>
  </template>
  <template match="claim-text/u">
    <apply-templates select="pat:ClaimText/com:U"/>
  </template>
  <template match="claim-text/o">
    <apply-templates select="pat:ClaimText/com:O"/>
  </template>
  <template match="claim-text/sup">
    <apply-templates select="pat:ClaimText/com:Sup"/>
  </template>
  <template match="claim-text/sub">
    <apply-templates select="pat:ClaimText/com:Sub"/>
  </template>
  <template match="claim-text/smallcaps">
    <apply-templates select="pat:ClaimText/com:SmallCapital"/>
  </template>
  <template match="claim-text/br">
    <apply-templates select="pat:ClaimText/com:Br"/>
  </template>
  <template match="claim-text/pre">
    <apply-templates select="pat:ClaimText/com:Pre"/>
  </template>
  <template match="claim-text/crossref">
    <apply-templates select="pat:ClaimText/com:CrossReference"/>
  </template>
  <template match="claim-text/figref">
    <apply-templates select="pat:ClaimText/com:FigureReference"/>
  </template>
  <template match="claim-text/img">
    <apply-templates select="pat:ClaimText/com:Image"/>
  </template>
  <template match="claim-text/chemistry">
    <apply-templates select="pat:ClaimText/com:ChemicalFormulae"/>
  </template>
  <template match="claim-text/maths">
    <apply-templates select="pat:ClaimText/com:Math"/>
  </template>
  <template match="claim-text/tables">
    <apply-templates select="pat:ClaimText/com:Table"/>
  </template>
  <template match="figref">
    <apply-templates select="com:FigureReference"/>
  </template>
  <template match="figref/@idref">
    <apply-templates select="com:FigureReference/@com:idrefs"/>
  </template>
  <template match="figref/@num">
    <apply-templates select="com:FigureReference/@com:referencedFigureNumber"/>
  </template>
  <template match="figref/text()">
    <apply-templates select="com:FigureReference/text()"/>
  </template>
  <template match="figref/b">
    <apply-templates select="com:FigureReference/com:B"/>
  </template>
  <template match="figref/i">
    <apply-templates select="com:FigureReference/com:I"/>
  </template>
  <template match="figref/u">
    <apply-templates select="com:FigureReference/com:U"/>
  </template>
  <template match="figref/o">
    <apply-templates select="com:FigureReference/com:O"/>
  </template>
  <template match="figref/sup">
    <apply-templates select="com:FigureReference/com:Sup"/>
  </template>
  <template match="figref/sub">
    <apply-templates select="com:FigureReference/com:Sub"/>
  </template>
  <template match="figref/smallcaps">
    <apply-templates select="com:FigureReference/com:SmallCapital"/>
  </template>
  <template match="chemistry">
    <apply-templates select="com:ChemicalFormulae"/>
  </template>
  <template match="chemistry/@id">
    <apply-templates select="com:ChemicalFormulae/@com:id"/>
  </template>
  <template match="chemistry/@num">
    <apply-templates select="com:ChemicalFormulae/@com:chemicalFormulaeNumber"/>
  </template>
  <template match="chemistry/img">
    <apply-templates select="com:ChemicalFormulae/com:Image"/>
  </template>
  <template match="chemistry/chem">
    <apply-templates select="com:ChemicalFormulae/com:InlineFormula"/>
  </template>
  <template match="title">
    <apply-templates select="com:TableTitle"/>
  </template>
  <template match="title/text()">
    <apply-templates select="com:TableTitle/text()"/>
  </template>
  <template match="title/b">
    <apply-templates select="com:TableTitle/com:B"/>
  </template>
  <template match="title/i">
    <apply-templates select="com:TableTitle/com:I"/>
  </template>
  <template match="title/u">
    <apply-templates select="com:TableTitle/com:U"/>
  </template>
  <template match="title/sup">
    <apply-templates select="com:TableTitle/com:Sup"/>
  </template>
  <template match="title/sub">
    <apply-templates select="com:TableTitle/com:Sub"/>
  </template>
  <template match="title/smallcaps">
    <apply-templates select="com:TableTitle/com:SmallCapital"/>
  </template>
  <template match="figure">
    <apply-templates select="pat:Figure"/>
  </template>
  <template match="figure/@id">
    <apply-templates select="pat:Figure/@com:id"/>
  </template>
  <template match="figure/@num">
    <apply-templates select="pat:Figure/pat:FigureNumber"/>
  </template>
  <template match="figure/img">
    <apply-templates select="pat:Figure/com:Image"/>
  </template>
  <template match="dt">
    <apply-templates select="com:DT"/>
  </template>
  <template match="dt/@id">
    <apply-templates select="com:DT/@com:id"/>
  </template>
  <template match="dt/text()">
    <apply-templates select="com:DT/text()"/>
  </template>
  <template match="dt/b">
    <apply-templates select="com:DT/com:B"/>
  </template>
  <template match="dt/i">
    <apply-templates select="com:DT/com:I"/>
  </template>
  <template match="dt/u">
    <apply-templates select="com:DT/com:U"/>
  </template>
  <template match="dt/o">
    <apply-templates select="com:DT/com:O"/>
  </template>
  <template match="dt/sup">
    <apply-templates select="com:DT/com:Sub"/>
  </template>
  <template match="dt/sub">
    <apply-templates select="com:DT/com:Sup"/>
  </template>
  <template match="dt/smallcaps">
    <apply-templates select="com:DT/com:SmallCapital"/>
  </template>
  <template match="depositary/address/address-1">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="depositary/address/address-1/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText"/>
  </template>
  <template match="depositary/address/address-2">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="depositary/address/address-2/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (2)"/>
  </template>
  <template match="depositary/address/address-3">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="depositary/address/address-3/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (3)"/>
  </template>
  <template match="depositary/address/address-4">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="depositary/address/address-4/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (4)"/>
  </template>
  <template match="depositary/address/address-5">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="depositary/address/address-5/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (5)"/>
  </template>
  <template match="depositary/address/mailcode">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode (2)"/>
  </template>
  <template match="depositary/address/pobox">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)"/>
  </template>
  <template match="depositary/address/pobox/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (7)"/>
  </template>
  <template match="depositary/address/room">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)"/>
  </template>
  <template match="depositary/address/room/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (9)"/>
  </template>
  <template match="depositary/address/address-floor">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)"/>
  </template>
  <template match="depositary/address/address-floor/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (6)"/>
  </template>
  <template match="depositary/address/building">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)"/>
  </template>
  <template match="depositary/address/building/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (8)"/>
  </template>
  <template match="depositary/address/street">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)"/>
  </template>
  <template match="depositary/address/street/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:AddressLineText (10)"/>
  </template>
  <template match="depositary/address/city">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CityName"/>
  </template>
  <template match="depositary/address/county">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName"/>
  </template>
  <template match="depositary/address/county/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName"/>
  </template>
  <template match="depositary/address/state">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)"/>
  </template>
  <template match="depositary/address/state/text()">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:GeographicRegionName (2)"/>
  </template>
  <template match="depositary/address/postcode">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:PostalCode"/>
  </template>
  <template match="depositary/address/country">
    <apply-templates select="com:BioDepositDepositary/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress/com:CountryCode"/>
  </template>
  <template match="depositary/address/text">
    <apply-templates select="com:BioDepositDepositary/com:ContactText"/>
  </template>
  <template match="depositary/address/text/text()">
    <apply-templates select="com:BioDepositDepositary/com:ContactText/text()"/>
  </template>
  <template match="img">
    <apply-templates select="com:Image"/>
  </template>
  <template match="img/@id">
    <apply-templates select="com:Image/@com:id"/>
  </template>
  <template match="img/@he">
    <apply-templates select="com:Image/com:HeightMeasure"/>
  </template>
  <template match="img/@wi">
    <apply-templates select="com:Image/com:WidthMeasure"/>
  </template>
  <template match="img/@file">
    <apply-templates select="com:Image/com:FileName"/>
  </template>
  <template match="img/@alt">
    <apply-templates select="com:Image/com:Alt"/>
  </template>
  <template match="img/@img-content">
    <apply-templates select="com:Image/@com:imageContentCategory"/>
  </template>
  <template match="img/@img-format">
    <apply-templates select="com:Image/com:ImageFormatCategory"/>
  </template>
  <template match="img/@orientation">
    <apply-templates select="com:Image/@com:orientationCategory"/>
  </template>
  <template match="img/@inline">
    <apply-templates select="com:Image/@com:imageWrappingStyleCategory"/>
  </template>
  <template match="tables">
    <apply-templates select="com:Table"/>
  </template>
  <template match="tables/@id">
    <apply-templates select="com:Table/com:IPOASISTable/@com:id"/>
  </template>
  <template match="tables/@num">
    <apply-templates select="com:Table/com:TableImage/@com:tableNumber"/>
  </template>
  <template match="tables/img">
    <apply-templates select="com:Table/com:TableImage/com:ColourModeCategory"/>
  </template>
  <template match="tables/table">
    <apply-templates select="com:Table/com:IPOASISTable"/>
  </template>
  <template match="tables/table/@frame">
    <apply-templates select="com:Table/com:IPOASISTable/@tbl:frame"/>
  </template>
  <template match="tables/table/@colsep">
    <apply-templates select="com:Table/com:IPOASISTable/@tbl:colsep"/>
  </template>
  <template match="tables/table/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/@tbl:rowsep"/>
  </template>
  <template match="tables/table/@pgwide">
    <apply-templates select="com:Table/com:IPOASISTable/@com:pageWide"/>
  </template>
  <template match="tables/table/title">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableTitle"/>
  </template>
  <template match="tables/table/tgroup">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup"/>
  </template>
  <template match="tables/table/tgroup/@cols">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/@tbl:cols"/>
  </template>
  <template match="tables/table/tgroup/@colsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/@tbl:colsep"/>
  </template>
  <template match="tables/table/tgroup/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/@tbl:rowsep"/>
  </template>
  <template match="tables/table/tgroup/@align">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/@tbl:align"/>
  </template>
  <template match="tables/table/tgroup/colspec">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec"/>
  </template>
  <template match="tables/table/tgroup/colspec/@colnum">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colnum"/>
  </template>
  <template match="tables/table/tgroup/colspec/@colname">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colname"/>
  </template>
  <template match="tables/table/tgroup/colspec/@colwidth">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colwidth"/>
  </template>
  <template match="tables/table/tgroup/colspec/@colsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colsep"/>
  </template>
  <template match="tables/table/tgroup/colspec/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:rowsep"/>
  </template>
  <template match="tables/table/tgroup/colspec/@align">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:align"/>
  </template>
  <template match="tables/table/tgroup/colspec/@char">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:char"/>
  </template>
  <template match="tables/table/tgroup/colspec/@charoff">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:charoff"/>
  </template>
  <template match="tables/table/tgroup/thead">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead"/>
  </template>
  <template match="tables/table/tgroup/thead/@valign">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/@tbl:valign"/>
  </template>
  <template match="tables/table/tgroup/thead/row">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row"/>
  </template>
  <template match="tables/table/tgroup/thead/row/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:rowsep"/>
  </template>
  <template match="tables/table/tgroup/thead/row/@valign">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:valign"/>
  </template>
  <template match="tables/table/tgroup/tbody">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody"/>
  </template>
  <template match="tables/table/tgroup/tbody/@valign">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/@tbl:valign"/>
  </template>
  <template match="tables/table/tgroup/tbody/row">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:rowsep"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/@valign">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:valign"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@colname">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colname"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@namest">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:namest"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@nameend">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:nameend"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@morerows">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:morerows"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@colsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colsep"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@rowsep">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:rowsep"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@align">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:align"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@char">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:char"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@charoff">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:charoff"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/@valign">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:valign"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/text()">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/text()"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/b">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:B"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/i">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:I"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/u">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:U"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/sup">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sup"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/sub">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Sub"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/smallcaps">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:SmallCapital"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/br">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Br"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/patcit">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:PatentCitation"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/nplcit">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:NPLCitation"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/bio-deposit">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:BioDeposit"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/crossref">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:CrossReference"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/img">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Image"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/dl">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:DL"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/ul">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:UL"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/ol">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:OL"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/chemistry">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:ChemicalFormulae"/>
  </template>
  <template match="tables/table/tgroup/tbody/row/entry/maths">
    <apply-templates select="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/com:Math"/>
  </template>
  <template match="p">
    <apply-templates select="com:P"/>
  </template>
  <template match="p/@id">
    <apply-templates select="com:P/@com:id"/>
  </template>
  <template match="p/@num">
    <apply-templates select="com:P/@com:pNumber"/>
  </template>
  <template match="p/text()">
    <apply-templates select="com:P/text()"/>
  </template>
  <template match="p/b">
    <apply-templates select="com:P/com:B"/>
  </template>
  <template match="p/b/text()">
    <apply-templates select="com:P/com:B/text()"/>
  </template>
  <template match="p/b/i">
    <apply-templates select="com:P/com:B/com:I"/>
  </template>
  <template match="p/b/i/text()">
    <apply-templates select="com:P/com:B/com:I/text()"/>
  </template>
  <template match="p/b/u">
    <apply-templates select="com:P/com:B/com:U"/>
  </template>
  <template match="p/b/u/text()">
    <apply-templates select="com:P/com:B/com:U/text()"/>
  </template>
  <template match="p/b/o">
    <apply-templates select="com:P/com:B/com:O"/>
  </template>
  <template match="p/b/o/text()">
    <apply-templates select="com:P/com:B/com:O/text()"/>
  </template>
  <template match="p/b/sup">
    <apply-templates select="com:P/com:B/com:Sup"/>
  </template>
  <template match="p/b/sup/text()">
    <apply-templates select="com:P/com:B/com:Sup/text()"/>
  </template>
  <template match="p/b/sub">
    <apply-templates select="com:P/com:B/com:Sub"/>
  </template>
  <template match="p/b/sub/text()">
    <apply-templates select="com:P/com:B/com:Sub/text()"/>
  </template>
  <template match="p/i">
    <apply-templates select="com:P/com:I"/>
  </template>
  <template match="p/i/text()">
    <apply-templates select="com:P/com:I/text()"/>
  </template>
  <template match="p/i/b">
    <apply-templates select="com:P/com:I/com:B"/>
  </template>
  <template match="p/i/b/text()">
    <apply-templates select="com:P/com:I/com:B/text()"/>
  </template>
  <template match="p/i/u">
    <apply-templates select="com:P/com:I/com:U"/>
  </template>
  <template match="p/i/u/text()">
    <apply-templates select="com:P/com:I/com:U/text()"/>
  </template>
  <template match="p/i/o">
    <apply-templates select="com:P/com:I/com:O"/>
  </template>
  <template match="p/i/o/text()">
    <apply-templates select="com:P/com:I/com:O/text()"/>
  </template>
  <template match="p/i/sup">
    <apply-templates select="com:P/com:I/com:Sup"/>
  </template>
  <template match="p/i/sup/text()">
    <apply-templates select="com:P/com:I/com:Sup/text()"/>
  </template>
  <template match="p/i/sub">
    <apply-templates select="com:P/com:I/com:Sub"/>
  </template>
  <template match="p/i/sub/text()">
    <apply-templates select="com:P/com:I/com:Sub/text()"/>
  </template>
  <template match="p/u">
    <apply-templates select="com:P/com:U"/>
  </template>
  <template match="p/u/text()">
    <apply-templates select="com:P/com:U/text()"/>
  </template>
  <template match="p/u/b">
    <apply-templates select="com:P/com:U/com:B"/>
  </template>
  <template match="p/u/b/text()">
    <apply-templates select="com:P/com:U/com:B/text()"/>
  </template>
  <template match="p/u/i">
    <apply-templates select="com:P/com:U/com:I"/>
  </template>
  <template match="p/u/i/text()">
    <apply-templates select="com:P/com:U/com:I/text()"/>
  </template>
  <template match="p/u/sup">
    <apply-templates select="com:P/com:U/com:Sup"/>
  </template>
  <template match="p/u/sup/text()">
    <apply-templates select="com:P/com:U/com:Sup/text()"/>
  </template>
  <template match="p/u/sub">
    <apply-templates select="com:P/com:U/com:Sub"/>
  </template>
  <template match="p/u/sub/text()">
    <apply-templates select="com:P/com:U/com:Sub/text()"/>
  </template>
  <template match="p/o">
    <apply-templates select="com:P/com:O"/>
  </template>
  <template match="p/o/text()">
    <apply-templates select="com:P/com:O/text()"/>
  </template>
  <template match="p/o/b">
    <apply-templates select="com:P/com:O/com:B"/>
  </template>
  <template match="p/o/b/text()">
    <apply-templates select="com:P/com:O/com:B/text()"/>
  </template>
  <template match="p/o/i">
    <apply-templates select="com:P/com:O/com:I"/>
  </template>
  <template match="p/o/i/text()">
    <apply-templates select="com:P/com:O/com:I/text()"/>
  </template>
  <template match="p/o/sup">
    <apply-templates select="com:P/com:O/com:Sup"/>
  </template>
  <template match="p/o/sup/text()">
    <apply-templates select="com:P/com:O/com:Sup/text()"/>
  </template>
  <template match="p/o/sub">
    <apply-templates select="com:P/com:O/com:Sub"/>
  </template>
  <template match="p/o/sub/text()">
    <apply-templates select="com:P/com:O/com:Sub/text()"/>
  </template>
  <template match="p/sup">
    <apply-templates select="com:P/com:Sup"/>
  </template>
  <template match="p/sup/text()">
    <apply-templates select="com:P/com:Sup/text()"/>
  </template>
  <template match="p/sup/b">
    <apply-templates select="com:P/com:Sup/com:B"/>
  </template>
  <template match="p/sup/b/text()">
    <apply-templates select="com:P/com:Sup/com:B/text()"/>
  </template>
  <template match="p/sup/u">
    <apply-templates select="com:P/com:Sup/com:U"/>
  </template>
  <template match="p/sup/u/text()">
    <apply-templates select="com:P/com:Sup/com:U/text()"/>
  </template>
  <template match="p/sup/i">
    <apply-templates select="com:P/com:Sup/com:I"/>
  </template>
  <template match="p/sup/i/text()">
    <apply-templates select="com:P/com:Sup/com:I/text()"/>
  </template>
  <template match="p/sup/o">
    <apply-templates select="com:P/com:Sup/com:O"/>
  </template>
  <template match="p/sup/o/text()">
    <apply-templates select="com:P/com:Sup/com:O/text()"/>
  </template>
  <template match="p/sup/sup2">
    <apply-templates select="com:P/com:Sup/com:Sup2"/>
  </template>
  <template match="p/sup/sup2/text()">
    <apply-templates select="com:P/com:Sup/com:Sup2/text()"/>
  </template>
  <template match="p/sup/sup2/b">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:B"/>
  </template>
  <template match="p/sup/sup2/b/text()">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:B/text()"/>
  </template>
  <template match="p/sup/sup2/u">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:U"/>
  </template>
  <template match="p/sup/sup2/u/text()">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:U/text()"/>
  </template>
  <template match="p/sup/sup2/i">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:I"/>
  </template>
  <template match="p/sup/sup2/i/text()">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:I/text()"/>
  </template>
  <template match="p/sup/sup2/o">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:O"/>
  </template>
  <template match="p/sup/sup2/o/text()">
    <apply-templates select="com:P/com:Sup/com:Sup2/com:O/text()"/>
  </template>
  <template match="p/sup/sub2">
    <apply-templates select="com:P/com:Sup/com:Sub2"/>
  </template>
  <template match="p/sup/sub2/text()">
    <apply-templates select="com:P/com:Sup/com:Sub2/text()"/>
  </template>
  <template match="p/sup/sub2/b">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:B"/>
  </template>
  <template match="p/sup/sub2/b/text()">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:B/text()"/>
  </template>
  <template match="p/sup/sub2/u">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:U"/>
  </template>
  <template match="p/sup/sub2/u/text()">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:U/text()"/>
  </template>
  <template match="p/sup/sub2/i">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:I"/>
  </template>
  <template match="p/sup/sub2/i/text()">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:I/text()"/>
  </template>
  <template match="p/sup/sub2/o">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:O"/>
  </template>
  <template match="p/sup/sub2/o/text()">
    <apply-templates select="com:P/com:Sup/com:Sub2/com:O/text()"/>
  </template>
  <template match="p/sub">
    <apply-templates select="com:P/com:Sub"/>
  </template>
  <template match="p/sub/text()">
    <apply-templates select="com:P/com:Sub/text()"/>
  </template>
  <template match="p/sub/b">
    <apply-templates select="com:P/com:Sub/com:B"/>
  </template>
  <template match="p/sub/b/text()">
    <apply-templates select="com:P/com:Sub/com:B/text()"/>
  </template>
  <template match="p/sub/u">
    <apply-templates select="com:P/com:Sub/com:U"/>
  </template>
  <template match="p/sub/u/text()">
    <apply-templates select="com:P/com:Sub/com:U/text()"/>
  </template>
  <template match="p/sub/i">
    <apply-templates select="com:P/com:Sub/com:I"/>
  </template>
  <template match="p/sub/i/text()">
    <apply-templates select="com:P/com:Sub/com:I/text()"/>
  </template>
  <template match="p/sub/o">
    <apply-templates select="com:P/com:Sub/com:O"/>
  </template>
  <template match="p/sub/o/text()">
    <apply-templates select="com:P/com:Sub/com:O/text()"/>
  </template>
  <template match="p/sub/sup2">
    <apply-templates select="com:P/com:Sub/com:Sup2"/>
  </template>
  <template match="p/sub/sup2/text()">
    <apply-templates select="com:P/com:Sub/com:Sup2/text()"/>
  </template>
  <template match="p/sub/sub2">
    <apply-templates select="com:P/com:Sub/com:Sub2"/>
  </template>
  <template match="p/sub/sub2/text()">
    <apply-templates select="com:P/com:Sub/com:Sub2/text()"/>
  </template>
  <template match="p/smallcaps">
    <apply-templates select="com:P/com:SmallCapital"/>
  </template>
  <template match="p/smallcaps/text()">
    <apply-templates select="com:P/com:SmallCapital/text()"/>
  </template>
  <template match="p/smallcaps/b">
    <apply-templates select="com:P/com:SmallCapital/com:B"/>
  </template>
  <template match="p/smallcaps/b/text()">
    <apply-templates select="com:P/com:SmallCapital/com:B/text()"/>
  </template>
  <template match="p/smallcaps/u">
    <apply-templates select="com:P/com:SmallCapital/com:U"/>
  </template>
  <template match="p/smallcaps/u/text()">
    <apply-templates select="com:P/com:SmallCapital/com:U/text()"/>
  </template>
  <template match="p/smallcaps/i">
    <apply-templates select="com:P/com:SmallCapital/com:I"/>
  </template>
  <template match="p/smallcaps/i/text()">
    <apply-templates select="com:P/com:SmallCapital/com:I/text()"/>
  </template>
  <template match="p/smallcaps/o">
    <apply-templates select="com:P/com:SmallCapital/com:O"/>
  </template>
  <template match="p/smallcaps/o/text()">
    <apply-templates select="com:P/com:SmallCapital/com:O/text()"/>
  </template>
  <template match="p/br">
    <apply-templates select="com:P/com:Br"/>
  </template>
  <template match="p/pre">
    <apply-templates select="com:P/com:Pre"/>
  </template>
  <template match="p/dl">
    <apply-templates select="com:P/com:DL"/>
  </template>
  <template match="p/ul">
    <apply-templates select="com:P/com:UL"/>
  </template>
  <template match="p/ol">
    <apply-templates select="com:P/com:OL"/>
  </template>
  <template match="p/crossref">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/@idref">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/b">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/b/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/i">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/i/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/u">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/u/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/o">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/o/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/sup">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/sup/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/sub">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/sub/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/smallcaps">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/crossref/smallcaps/text()">
    <apply-templates select="com:P/com:CrossReference"/>
  </template>
  <template match="p/figref">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/@idref">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/@num">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/b">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/b/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/i">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/i/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/u">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/u/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/o">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/o/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/sup">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/sup/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/sub">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/sub/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/smallcaps">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/figref/smallcaps/text()">
    <apply-templates select="com:P/com:FigureReference/com:SmallCapital/text()"/>
  </template>
  <template match="p/patcit">
    <apply-templates select="com:P/com:PatentCitation"/>
  </template>
  <template match="p/nplcit">
    <apply-templates select="com:P/com:NPLCitation"/>
  </template>
  <template match="p/bio-deposit">
    <apply-templates select="com:P/com:BioDeposit"/>
  </template>
  <template match="p/img">
    <apply-templates select="com:P/com:Image"/>
  </template>
  <template match="p/chemistry">
    <apply-templates select="com:P/com:ChemicalFormulae"/>
  </template>
  <template match="p/maths">
    <apply-templates select="com:P/com:Math"/>
  </template>
  <template match="p/tables">
    <apply-templates select="com:P/com:Table"/>
  </template>
  <template match="heading">
    <apply-templates select="com:Heading"/>
  </template>
  <template match="heading/@level">
    <apply-templates select="com:Heading/@com:headingLevelCode"/>
  </template>
  <template match="heading/@id">
    <apply-templates select="com:Heading/@com:id"/>
  </template>
  <template match="heading/text()">
    <apply-templates select="com:Heading/text()"/>
  </template>
  <template match="heading/b">
    <apply-templates select="com:Heading/com:B"/>
  </template>
  <template match="heading/i">
    <apply-templates select="com:Heading/com:I"/>
  </template>
  <template match="heading/u">
    <apply-templates select="com:Heading/com:U"/>
  </template>
  <template match="heading/o">
    <apply-templates select="com:Heading/com:O"/>
  </template>
  <template match="heading/sup">
    <apply-templates select="com:Heading/com:Sup"/>
  </template>
  <template match="heading/sub">
    <apply-templates select="com:Heading/com:Sub"/>
  </template>
  <template match="heading/smallcaps">
    <apply-templates select="com:Heading/com:SmallCapital"/>
  </template>
  <template match="maths">
    <apply-templates select="com:Math"/>
  </template>
  <template match="maths/@num">
    <apply-templates select="com:Math/@com:mathNumber"/>
  </template>
  <template match="maths/img">
    <apply-templates select="com:Math/com:Image"/>
  </template>
  <template match="address-1">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-3">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-4">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="address-5">
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
  <template match="state">
    <apply-templates select="com:GeographicRegionName"/>
  </template>
  <template match="pobox">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="room">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="county">
    <apply-templates select="com:GeographicRegionName"/>
  </template>
  <template match="address-2">
    <apply-templates select="com:AddressLineText"/>
  </template>
  <template match="*[@application-body/@lang]">
    <attribute name="pat:ApplicationBody/@com:languageCode" select="@application-body/@lang"/>
  </template>
  <template match="*[@application-body/@file]">
    <attribute name="pat:ApplicationBody/@com:documentFileName" select="@application-body/@file"/>
  </template>
  <template match="*[@application-body/@file-reference-id]">
    <attribute name="pat:ApplicationBody/@com:fileReferenceIdentifier" select="@application-body/@file-reference-id"/>
  </template>
  <template match="*[@application-body/@country]">
    <attribute name="pat:ApplicationBody/@com:receivingOffice" select="@application-body/@country"/>
  </template>
  <template match="*[@application-body/@status]">
    <attribute name="pat:ApplicationBody/@pat:applicationBodyStatus" select="@application-body/@status"/>
  </template>
  <template match="*[@application-body/description/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/@com:id" select="@application-body/description/@id"/>
  </template>
  <template match="*[@application-body/description/@lang]">
    <attribute name="pat:ApplicationBody/pat:Description/@com:languageCode" select="@application-body/description/@lang"/>
  </template>
  <template match="*[@application-body/description/technical-field/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:TechnicalField/@com:id" select="@application-body/description/technical-field/@id"/>
  </template>
  <template match="*[@application-body/description/background-art/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:BackgroundArt/@com:id" select="@application-body/description/background-art/@id"/>
  </template>
  <template match="*[@application-body/description/disclosure/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:Disclosure/@com:id" select="@application-body/description/disclosure/@id"/>
  </template>
  <template match="*[@application-body/description/disclosure/tech-problem/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalProblem/@com:id" select="@application-body/description/disclosure/tech-problem/@id"/>
  </template>
  <template match="*[@application-body/description/disclosure/tech-solution/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:TechnicalSolution/@com:id" select="@application-body/description/disclosure/tech-solution/@id"/>
  </template>
  <template match="*[@application-body/description/disclosure/advantageous-effects/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:Disclosure/pat:AdvantageousEffects/@com:id" select="@application-body/description/disclosure/advantageous-effects/@id"/>
  </template>
  <template match="*[@application-body/description/summary-of-invention/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:InventionSummary/@com:id" select="@application-body/description/summary-of-invention/@id"/>
  </template>
  <template match="*[@application-body/description/summary-of-invention/tech-problem/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalProblem/@com:id" select="@application-body/description/summary-of-invention/tech-problem/@id"/>
  </template>
  <template match="*[@application-body/description/summary-of-invention/tech-solution/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:TechnicalSolution/@com:id" select="@application-body/description/summary-of-invention/tech-solution/@id"/>
  </template>
  <template match="*[@application-body/description/summary-of-invention/advantageous-effects/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:InventionSummary/pat:AdvantageousEffects/@com:id" select="@application-body/description/summary-of-invention/advantageous-effects/@id"/>
  </template>
  <template match="*[@application-body/description/description-of-drawings/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:DrawingDescription/@com:id" select="@application-body/description/description-of-drawings/@id"/>
  </template>
  <template match="*[@application-body/description/description-of-embodiments/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/@com:id" select="@application-body/description/description-of-embodiments/@id"/>
  </template>
  <template match="*[@application-body/description/description-of-embodiments/embodiments-example/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@com:id" select="@application-body/description/description-of-embodiments/embodiments-example/@id"/>
  </template>
  <template match="*[@application-body/description/description-of-embodiments/embodiments-example/@ex-num]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:EmbodimentDescription/pat:EmbodimentExample/@pat:exampleNumber" select="@application-body/description/description-of-embodiments/embodiments-example/@ex-num"/>
  </template>
  <template match="*[@application-body/description/best-mode/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:BestMode/@com:id" select="@application-body/description/best-mode/@id"/>
  </template>
  <template match="*[@application-body/description/mode-for-invention/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:InventionMode/@com:id" select="@application-body/description/mode-for-invention/@id"/>
  </template>
  <template match="*[@application-body/description/industrial-applicability/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:IndustrialApplicability/@com:id" select="@application-body/description/industrial-applicability/@id"/>
  </template>
  <template match="*[@application-body/description/reference-signs-list/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:ReferenceSignBag/@com:id" select="@application-body/description/reference-signs-list/@id"/>
  </template>
  <template match="*[@application-body/description/reference-to-deposited-biological-material/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:DepositedBiologicalMaterialReference/@com:id" select="@application-body/description/reference-to-deposited-biological-material/@id"/>
  </template>
  <template match="*[@application-body/description/sequence-list-text/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/pat:SequenceListText/@com:id" select="@application-body/description/sequence-list-text/@id"/>
  </template>
  <template match="*[@application-body/description/citation-list/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/com:CitationBag/@com:id" select="@application-body/description/citation-list/@id"/>
  </template>
  <template match="*[@application-body/description/heading/@level]">
    <attribute name="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()" select="@application-body/description/heading/@level"/>
  </template>
  <template match="*[@application-body/description/heading/@id]">
    <attribute name="pat:ApplicationBody/pat:Description/com:Heading/com:Del/text()" select="@application-body/description/heading/@id"/>
  </template>
  <template match="*[@application-body/claims/@id]">
    <attribute name="pat:ApplicationBody/pat:Claims/@com:id" select="@application-body/claims/@id"/>
  </template>
  <template match="*[@application-body/abstract/@id]">
    <attribute name="pat:ApplicationBody/pat:Abstract/@com:id" select="@application-body/abstract/@id"/>
  </template>
  <template match="*[@application-body/abstract/@lang]">
    <attribute name="pat:ApplicationBody/pat:Abstract/@com:languageCode" select="@application-body/abstract/@lang"/>
  </template>
  <template match="*[@application-body/drawings/@id]">
    <attribute name="pat:ApplicationBody/pat:Drawings/@com:id" select="@application-body/drawings/@id"/>
  </template>
  <template match="*[@li/@id]">
    <attribute name="com:LI/@com:id" select="@li/@id"/>
  </template>
  <template match="*[@li/@num]">
    <attribute name="com:LI/@com:liNumber" select="@li/@num"/>
  </template>
  <template match="*[@li/pre/@id]">
    <attribute name="com:LI/com:Pre" select="@li/pre/@id"/>
  </template>
  <template match="*[@li/pre/@xml:space]">
    <attribute name="com:LI/com:Pre" select="@li/pre/@xml:space"/>
  </template>
  <template match="*[@li/pre/@listing-type]">
    <attribute name="com:LI/com:Pre" select="@li/pre/@listing-type"/>
  </template>
  <template match="*[@li/crossref/@idref]">
    <attribute name="com:LI/com:CrossReference" select="@li/crossref/@idref"/>
  </template>
  <template match="*[@li/figref/@idref]">
    <attribute name="com:LI/com:FigureReference" select="@li/figref/@idref"/>
  </template>
  <template match="*[@li/figref/@num]">
    <attribute name="com:LI/com:FigureReference" select="@li/figref/@num"/>
  </template>
  <template match="*[@o/@style]">
    <attribute name="com:O/@com:oStyle" select="@o/@style"/>
  </template>
  <template match="*[@pre/@id]">
    <attribute name="com:Pre/@com:id" select="@pre/@id"/>
  </template>
  <template match="*[@pre/@listing-type]">
    <attribute name="com:Pre/@com:listingCategory" select="@pre/@listing-type"/>
  </template>
  <template match="*[@dl/@id]">
    <attribute name="com:DL/@com:id" select="@dl/@id"/>
  </template>
  <template match="*[@patcit/@id]">
    <attribute name="com:PatentCitation/@com:id" select="@patcit/@id"/>
  </template>
  <template match="*[@patcit/@num]">
    <attribute name="com:PatentCitation/@com:sequenceNumber" select="@patcit/@num"/>
  </template>
  <template match="*[@nplcit/@id]">
    <attribute name="com:NPLCitation/@com:id" select="@nplcit/@id"/>
  </template>
  <template match="*[@nplcit/@num]">
    <attribute name="com:NPLCitation/@com:sequenceNumber" select="@nplcit/@num"/>
  </template>
  <template match="*[@nplcit/@lang]">
    <attribute name="com:NPLCitation/@com:languageCode" select="@nplcit/@lang"/>
  </template>
  <template match="*[@nplcit/@file]">
    <attribute name="com:NPLCitation/com:FileName" select="@nplcit/@file"/>
  </template>
  <template match="*[@nplcit/@url]">
    <attribute name="com:NPLCitation/com:WebURI" select="@nplcit/@url"/>
  </template>
  <template match="*[@nplcit/article/subname/@subname-type]">
    <attribute name="com:NPLCitation/com:CitedJournalArticle/com:Subordinate/@com:subordinateCategory" select="@nplcit/article/subname/@subname-type"/>
  </template>
  <template match="*[@nplcit/article/class/@class-type]">
    <attribute name="com:NPLCitation/com:CitedJournalArticle/com:NPLClass/@com:classificationSystem" select="@nplcit/article/class/@class-type"/>
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
  <template match="*[@crossref/@idref]">
    <attribute name="com:CrossReference/@com:idrefs" select="@crossref/@idref"/>
  </template>
  <template match="*[@ul/@id]">
    <attribute name="com:UL/@com:id" select="@ul/@id"/>
  </template>
  <template match="*[@ul/@list-style]">
    <attribute name="com:UL/@com:ulStyle" select="@ul/@list-style"/>
  </template>
  <template match="*[@ol/@id]">
    <attribute name="com:OL/@com:id" select="@ol/@id"/>
  </template>
  <template match="*[@ol/@ol-style]">
    <attribute name="com:OL/@com:olStyle" select="@ol/@ol-style"/>
  </template>
  <template match="*[@doc-page/@id]">
    <attribute name="pat:DocumentURI/@com:id" select="@doc-page/@id"/>
  </template>
  <template match="*[@doc-page/@he]">
    <attribute name="pat:PageImage/com:HeightMeasure" select="@doc-page/@he"/>
  </template>
  <template match="*[@doc-page/@wi]">
    <attribute name="pat:PageImage/com:WidthMeasure" select="@doc-page/@wi"/>
  </template>
  <template match="*[@doc-page/@type]">
    <attribute name="pat:DocumentURI/@pat:pageDocumentFormatCategory" select="@doc-page/@type"/>
  </template>
  <template match="*[@doc-page/@alt]">
    <attribute name="pat:PageImage/com:Alt" select="@doc-page/@alt"/>
  </template>
  <template match="*[@doc-page/@ppf]">
    <attribute name="pat:DocumentURI/@pat:firstPageNumber" select="@doc-page/@ppf"/>
  </template>
  <template match="*[@doc-page/@ppl]">
    <attribute name="pat:DocumentURI/@pat:lastPageNumber" select="@doc-page/@ppl"/>
  </template>
  <template match="*[@doc-page/@file]">
    <attribute name="pat:DocumentURI/@com:documentFileName" select="@doc-page/@file"/>
  </template>
  <template match="*[@doc-page/@ocr]">
    <attribute name="pat:DocumentURI/@pat:ocrIndicator" select="@doc-page/@ocr"/>
  </template>
  <template match="*[@doc-page/@color]">
    <attribute name="pat:PageImage/com:ColourModeCategory" select="@doc-page/@color"/>
  </template>
  <template match="*[@doc-page/@orientation]">
    <attribute name="pat:PageImage/@com:orientationCategory" select="@doc-page/@orientation"/>
  </template>
  <template match="*[@invention-title/@id]">
    <attribute name="pat:InventionTitle/@com:id" select="@invention-title/@id"/>
  </template>
  <template match="*[@invention-title/@lang]">
    <attribute name="pat:InventionTitle/@com:languageCode" select="@invention-title/@lang"/>
  </template>
  <template match="*[@claims/@id]">
    <attribute name="pat:Claims/@com:id" select="@claims/@id"/>
  </template>
  <template match="*[@claims/@lang]">
    <attribute name="pat:Claims/@com:languageCode" select="@claims/@lang"/>
  </template>
  <template match="*[@claims/claim/@id]">
    <attribute name="pat:Claims/pat:Claim/@com:id" select="@claims/claim/@id"/>
  </template>
  <template match="*[@claims/claim/@num]">
    <attribute name="pat:Claims/pat:Claim/pat:ClaimNumber" select="@claims/claim/@num"/>
  </template>
  <template match="*[@claim-text/claim-ref/@idref]">
    <attribute name="pat:ClaimText/pat:ClaimReference/@com:idrefs" select="@claim-text/claim-ref/@idref"/>
  </template>
  <template match="*[@figref/@idref]">
    <attribute name="com:FigureReference/@com:idrefs" select="@figref/@idref"/>
  </template>
  <template match="*[@figref/@num]">
    <attribute name="com:FigureReference/@com:referencedFigureNumber" select="@figref/@num"/>
  </template>
  <template match="*[@chemistry/@id]">
    <attribute name="com:ChemicalFormulae/@com:id" select="@chemistry/@id"/>
  </template>
  <template match="*[@chemistry/@num]">
    <attribute name="com:ChemicalFormulae/@com:chemicalFormulaeNumber" select="@chemistry/@num"/>
  </template>
  <template match="*[@figure/@id]">
    <attribute name="pat:Figure/@com:id" select="@figure/@id"/>
  </template>
  <template match="*[@figure/@num]">
    <attribute name="pat:Figure/pat:FigureNumber" select="@figure/@num"/>
  </template>
  <template match="*[@dt/@id]">
    <attribute name="com:DT/@com:id" select="@dt/@id"/>
  </template>
  <template match="*[@img/@id]">
    <attribute name="com:Image/@com:id" select="@img/@id"/>
  </template>
  <template match="*[@img/@he]">
    <attribute name="com:Image/com:HeightMeasure" select="@img/@he"/>
  </template>
  <template match="*[@img/@wi]">
    <attribute name="com:Image/com:WidthMeasure" select="@img/@wi"/>
  </template>
  <template match="*[@img/@file]">
    <attribute name="com:Image/com:FileName" select="@img/@file"/>
  </template>
  <template match="*[@img/@alt]">
    <attribute name="com:Image/com:Alt" select="@img/@alt"/>
  </template>
  <template match="*[@img/@img-content]">
    <attribute name="com:Image/@com:imageContentCategory" select="@img/@img-content"/>
  </template>
  <template match="*[@img/@img-format]">
    <attribute name="com:Image/com:ImageFormatCategory" select="@img/@img-format"/>
  </template>
  <template match="*[@img/@orientation]">
    <attribute name="com:Image/@com:orientationCategory" select="@img/@orientation"/>
  </template>
  <template match="*[@img/@inline]">
    <attribute name="com:Image/@com:imageWrappingStyleCategory" select="@img/@inline"/>
  </template>
  <template match="*[@tables/@id]">
    <attribute name="com:Table/com:IPOASISTable/@com:id" select="@tables/@id"/>
  </template>
  <template match="*[@tables/@num]">
    <attribute name="com:Table/com:TableImage/@com:tableNumber" select="@tables/@num"/>
  </template>
  <template match="*[@tables/table/@frame]">
    <attribute name="com:Table/com:IPOASISTable/@tbl:frame" select="@tables/table/@frame"/>
  </template>
  <template match="*[@tables/table/@colsep]">
    <attribute name="com:Table/com:IPOASISTable/@tbl:colsep" select="@tables/table/@colsep"/>
  </template>
  <template match="*[@tables/table/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/@tbl:rowsep" select="@tables/table/@rowsep"/>
  </template>
  <template match="*[@tables/table/@pgwide]">
    <attribute name="com:Table/com:IPOASISTable/@com:pageWide" select="@tables/table/@pgwide"/>
  </template>
  <template match="*[@tables/table/tgroup/@cols]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:cols" select="@tables/table/tgroup/@cols"/>
  </template>
  <template match="*[@tables/table/tgroup/@colsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:colsep" select="@tables/table/tgroup/@colsep"/>
  </template>
  <template match="*[@tables/table/tgroup/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:rowsep" select="@tables/table/tgroup/@rowsep"/>
  </template>
  <template match="*[@tables/table/tgroup/@align]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/@tbl:align" select="@tables/table/tgroup/@align"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@colnum]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colnum" select="@tables/table/tgroup/colspec/@colnum"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@colname]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colname" select="@tables/table/tgroup/colspec/@colname"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@colwidth]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colwidth" select="@tables/table/tgroup/colspec/@colwidth"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@colsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:colsep" select="@tables/table/tgroup/colspec/@colsep"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:rowsep" select="@tables/table/tgroup/colspec/@rowsep"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@align]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:align" select="@tables/table/tgroup/colspec/@align"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@char]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:char" select="@tables/table/tgroup/colspec/@char"/>
  </template>
  <template match="*[@tables/table/tgroup/colspec/@charoff]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:colspec/@tbl:charoff" select="@tables/table/tgroup/colspec/@charoff"/>
  </template>
  <template match="*[@tables/table/tgroup/thead/@valign]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/@tbl:valign" select="@tables/table/tgroup/thead/@valign"/>
  </template>
  <template match="*[@tables/table/tgroup/thead/row/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:rowsep" select="@tables/table/tgroup/thead/row/@rowsep"/>
  </template>
  <template match="*[@tables/table/tgroup/thead/row/@valign]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/tbl:thead/tbl:row/@tbl:valign" select="@tables/table/tgroup/thead/row/@valign"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/@valign]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/@tbl:valign" select="@tables/table/tgroup/tbody/@valign"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:rowsep" select="@tables/table/tgroup/tbody/row/@rowsep"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/@valign]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/@tbl:valign" select="@tables/table/tgroup/tbody/row/@valign"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@colname]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colname" select="@tables/table/tgroup/tbody/row/entry/@colname"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@namest]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:namest" select="@tables/table/tgroup/tbody/row/entry/@namest"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@nameend]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:nameend" select="@tables/table/tgroup/tbody/row/entry/@nameend"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@morerows]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:morerows" select="@tables/table/tgroup/tbody/row/entry/@morerows"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@colsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:colsep" select="@tables/table/tgroup/tbody/row/entry/@colsep"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@rowsep]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:rowsep" select="@tables/table/tgroup/tbody/row/entry/@rowsep"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@align]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:align" select="@tables/table/tgroup/tbody/row/entry/@align"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@char]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:char" select="@tables/table/tgroup/tbody/row/entry/@char"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@charoff]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:charoff" select="@tables/table/tgroup/tbody/row/entry/@charoff"/>
  </template>
  <template match="*[@tables/table/tgroup/tbody/row/entry/@valign]">
    <attribute name="com:Table/com:IPOASISTable/com:TableGroup/com:TableBody/com:Row/com:Entry/@tbl:valign" select="@tables/table/tgroup/tbody/row/entry/@valign"/>
  </template>
  <template match="*[@p/@id]">
    <attribute name="com:P/@com:id" select="@p/@id"/>
  </template>
  <template match="*[@p/@num]">
    <attribute name="com:P/@com:pNumber" select="@p/@num"/>
  </template>
  <template match="*[@p/crossref/@idref]">
    <attribute name="com:P/com:CrossReference" select="@p/crossref/@idref"/>
  </template>
  <template match="*[@p/figref/@idref]">
    <attribute name="com:P/com:FigureReference/com:SmallCapital/text()" select="@p/figref/@idref"/>
  </template>
  <template match="*[@p/figref/@num]">
    <attribute name="com:P/com:FigureReference/com:SmallCapital/text()" select="@p/figref/@num"/>
  </template>
  <template match="*[@heading/@level]">
    <attribute name="com:Heading/@com:headingLevelCode" select="@heading/@level"/>
  </template>
  <template match="*[@heading/@id]">
    <attribute name="com:Heading/@com:id" select="@heading/@id"/>
  </template>
  <template match="*[@maths/@num]">
    <attribute name="com:Math/@com:mathNumber" select="@maths/@num"/>
  </template>
  <template match="*[text()=&quot;jpg&quot;]">
    <element name="JPEG">JPEG</element>
  </template>
  <template match="*[text()=&quot;tif&quot;]">
    <element name="TIFF">TIFF</element>
  </template>
  <template match="*[text()=&quot;pdf&quot;]">
    <element name="GIF">GIF</element>
  </template>
  <template match="*[text()=&quot;bw&quot;]">
    <element name="Black and white">Black and white</element>
  </template>
  <template match="*[text()=&quot;color&quot;]">
    <element name="Colour">Colour</element>
  </template>
  <template match="*[text()=&quot;portrait&quot;]">
    <element name="Portrait">Portrait</element>
  </template>
  <template match="*[text()=&quot;landscape&quot;]">
    <element name="Landscape">Landscape</element>
  </template>
  <template match="*[text()=&quot;drawing&quot;]">
    <element name="Drawing">Drawing</element>
  </template>
  <template match="*[text()=&quot;photograph&quot;]">
    <element name="Photograph">Photograph</element>
  </template>
  <template match="*[text()=&quot;character&quot;]">
    <element name="Character">Character</element>
  </template>
  <template match="*[text()=&quot;dna&quot;]">
    <element name="DNA">DNA</element>
  </template>
  <template match="*[text()=&quot;chem&quot;]">
    <element name="Chemistry">Chemistry</element>
  </template>
  <template match="*[text()=&quot;math&quot;]">
    <element name="Math">Math</element>
  </template>
  <template match="*[text()=&quot;table&quot;]">
    <element name="Table">Table</element>
  </template>
  <template match="*[text()=&quot;program-listing&quot;]">
    <element name="Program listing">Program listing</element>
  </template>
  <template match="*[text()=&quot;flowchart&quot;]">
    <element name="Flowchart">Flowchart</element>
  </template>
  <template match="*[text()=&quot;graph&quot;]">
    <element name="Graph">Graph</element>
  </template>
  <template match="*[text()=&quot;yes&quot;]">
    <element name="Inline">Inline</element>
  </template>
</stylesheet>
