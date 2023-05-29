(:declare xquery 3.1 version:)
xquery version "3.1";
(:declare namespace:)
declare namespace xsd = "http://www.w3.org/2001/XMLSchema";
declare namespace xsi = "http://www.w3.org/2001/XMLSchema-instance";
declare namespace xdmp = "http://marklogic.com/xdmp";
declare namespace com = "http://www.wipo.int/standards/XMLSchema/ST96/Common";
declare namespace pat = "http://www.wipo.int/standards/XMLSchema/ST96/Patent";

(:        for desc_p in self.description_node.xpath(".//com:P|.//com:Heading", namespaces=self.namespaces)::)

(:            desc_tag = desc_p.tag:)
(:            flag_text = desc_p.text:)
(:            if not flag_text::)
(:                continue:)
(:            if desc_tag == "{http://www.wipo.int/standards/XMLSchema/ST96/Common}Heading"::)
(:                flag_text = flag_text.strip().lower():)
(:                if 'field' in flag_text::)
(:                    flag = 'technical_fields':)
(:                elif 'background' in flag_text or 'art' in flag_text::)
(:                    flag = 'backgrounds':)
(:                elif 'drawing' in flag_text::)
(:                    flag = 'drawings':)
(:                elif 'summar' in flag_text::)
(:                    flag = 'summaries':)
(:                elif 'solution' in flag_text or 'mean' in flag_text::)
(:                    flag = 'solutions':)
(:                elif "problem" in flag_text::)
(:                    flag = 'problems':)
(:                elif "industr" in flag_text and ('applica' in flag_text or 'utili' in flag_text)::)
(:                    flag = "industrial_applicability":)
(:                elif 'effect' in flag_text or 'advantage' in flag_text::)
(:                    flag = 'advantageous':)
(:                elif 'non-patent' in flag_text or 'bibliography' in flag_text or 'paper' in flag_text or "non patent" in flag_text::)
(:                    flag = 'non_patent_refrences':)
(:                elif 'patent literature' in flag_text or 'patent document' in flag_text or "patent ref" in flag_text::)
(:                    flag = 'patent_refrences':)

(:                elif 'example' in flag_text or 'detail' in flag_text or 'embodiment' in flag_text::)
(:                    flag = 'details':)
(:                elif 'symbol' in flag_text or "sign" in flag_text::)
(:                    flag = 'symbols':)
(:                elif 'sequence list' in flag_text::)
(:                    flag = 'sequence_list':)
(:            if flag != ''::)
(:                text_part[flag].append(desc_p):)
(:            else::)
(:                text_part['others'].append(desc_p):)

(:	<xsd:complexType name="DescriptionType">:)
(:		<xsd:choice>:)
(:			<xsd:element ref="pat:PageImage" maxOccurs="unbounded"/>:)
(:			<xsd:element ref="pat:DocumentURI" maxOccurs="unbounded"/>:)
(:			<xsd:sequence>:)
(:				<xsd:element ref="pat:InventionTitle" minOccurs="0"/>:)
(:				<xsd:choice maxOccurs="unbounded">:)
(:					<xsd:element ref="pat:TechnicalField"/>:)
(:					<xsd:element ref="pat:BackgroundArt"/>:)
(:					<xsd:element ref="pat:Disclosure"/>:)
(:					<xsd:element ref="pat:InventionSummary"/>:)
(:					<xsd:element ref="pat:DrawingDescription"/>:)
(:					<xsd:element ref="pat:EmbodimentDescription"/>:)
(:					<xsd:element ref="pat:BestMode"/>:)
(:					<xsd:element ref="pat:InventionMode"/>:)
(:					<xsd:element ref="pat:IndustrialApplicability"/>:)
(:					<xsd:element ref="pat:ReferenceSignBag"/>:)
(:					<xsd:element ref="pat:DepositedBiologicalMaterialReference"/>:)
(:					<xsd:element ref="pat:SequenceListText"/>:)
(:					<xsd:element ref="com:CitationBag"/>:)
(:					<xsd:element ref="com:Heading"/>:)
(:					<xsd:element ref="com:P"/>:)
(:				</xsd:choice>:)
(:			</xsd:sequence>:)
(:		</xsd:choice>:)
(:		<xsd:attribute ref="com:id"/>:)
(:		<xsd:attribute ref="com:languageCode"/>:)
(:	</xsd:complexType>:)
(:<xsd:complexType name="DisclosureType">:)
(:		<xsd:choice maxOccurs="unbounded">:)
(:<xsd:element ref="pat:TechnicalProblem"/>:)
(:<xsd:element ref="pat:TechnicalSolution"/>:)
(:<xsd:element ref="pat:AdvantageousEffects"/>:)
(:<xsd:element ref="com:Heading"/>:)
(:<xsd:element ref="com:P"/>:)
(:		</xsd:choice>:)
(:		<xsd:attribute ref="com:id"/>:)
(:	</xsd:complexType>:)

(:<xsd:complexType name="CitationBagType">:)
(:		<xsd:choice maxOccurs="unbounded">:)
(:<xsd:element ref="com:Heading"/>:)
(:<xsd:element ref="com:P"/>:)
(:<xsd:element ref="com:PatentCitationBag"/>:)
(:<xsd:element ref="com:NPLCitationBag"/>:)
(:		</xsd:choice>:)
(:		<xsd:attribute ref="com:id"/>:)
(:	</xsd:complexType>:)
(:	:)




declare variable $doc := doc("../../data/examples_xslt_result/us_example1.xml") ;

declare variable  $title_tag_map := map {"field":"pat:TechnicalField",
                                        "effect":"pat:AdvantageousEffects",
                                        "advantage":"pat:AdvantageousEffects",
                                        "background":"pat:BackgroundArt",
                                        "summar":"pat:InventionSummary",
                                        "disclosure":"pat:InventionSummary",
                                        "solution":"pat:TechnicalSolution",
                                        "problem":"pat:TechnicalProblem",
                                        "industr":"pat:IndustrialApplicability",
                                        "non-patent":"com:NPLCitationBag",
                                        "bibliography":"com:NPLCitationBag",
                                        "paper":"com:NPLCitationBag",
                                        "patent literature":"com:PatentCitationBag",
                                        "patent document":"com:PatentCitationBag",
                                        "patent ref":"com:PatentCitationBag",
                                        "example":"pat:EmbodimentDescription",
                                        "detail":"pat:EmbodimentDescription",
                                        "embodiment":"pat:EmbodimentDescription",
                                        "best mode":"pat:EmbodimentDescription",
                                        "invention mode":"pat:EmbodimentDescription",
                                        "symbol":"pat:ReferenceSignBag",
                                        "sign":"pat:ReferenceSignBag",
                                        "cross-reference":"com:NPLCitationBag",
                                        "cross reference":"com:NPLCitationBag",
                                        "drawing":"pat:DrawingDescription",
                                        "sequence list":"pat:SequenceListText"};


(:提取$title_tag_map的keys为title:)
declare variable $title := map:keys($title_tag_map);
(:citation tags include com:PatentCitationBag and com:NPLCitationBag:)
declare variable $citation_tags := ("com:PatentCitationBag","com:NPLCitationBag");
(:summary tags include pat:TechnicalSolution, pat:TechnicalProblem, pat:AdvantageousEffects:)
declare variable $summary_tags := ("pat:TechnicalSolution", "pat:TechnicalProblem", "pat:AdvantageousEffects");


declare variable $description := $doc//pat:Description[1];
(: 找到pat:Description节点
   用一个窗口划过所有的.//com:Heading|.//com:P节点
   如果是com:Heading节点 如果它的文本符合包含某些文本比如 包含background 则这个窗口的节点元素用pat:BackgroundArt包裹直到下一个com:Heading 满足另一个条件的时候再用对于的父元素包裹 :
   最后的结果整合为一个新的pat:Description节点 :)

declare function local:modify_description($p_or_heading as element()*) as element() {


     <pat:Description>
     {
    for tumbling window $w in $p_or_heading
    start   $s when $s instance of com:Heading and (some $t in $title satisfies contains(lower-case($s/text()), $t))
        let $tag := map:get($title_tag_map, $t)
        (: if tag in citation_tags return <com:CitationBag> element $tag{$w} </com:CitationBag>
           else if tag in summary_tags return <pat:InventionSummary> element $tag{$w}   </pat:InventionSummary>
           else return element $tag{$w} :)
        return
        if  ($tag = $citation_tags) then
            <com:CitationBag> element {$tag}{$w} </com:CitationBag>
        else if ($tag = $summary_tags) then
            <pat:InventionSummary> element {$tag} {$w}   </pat:InventionSummary>
        else
            element {$tag}{$w}
        }
        </pat:Description>
};

(: replace the $description of the xml with local:modify_description result and return the new xml:)
declare function local:replace_description($xml as element()) as element() {
    let $new_description := local:modify_description($description//com:Heading|.//com:P)
    return
        replace node $description with $new_description
};

(:save result to a new xml file:)
let $new_xml := local:replace_description($doc)
return
    xdmp:save("/data/examples_xslt_result/us_example1_post.xml", $new_xml)

