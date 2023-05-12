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

let $title := {"field", "background","summar","solution","problem","industr","effect","advantage","non-patent","bibliography","paper","patent literature","patent document","patent ref","example","detail","embodiment","symbol","sign","sequence list"};
let $doc := doc("data/examples_xslt_result/us_example1.xml);
let $title_tag_map = map{"field":  “pat:TechnicalField", "effect":"pat:AdvantageousEffects",    "advantage":"pat:AdvantageousEffects", "non-patent":"pat:NonPatentReferences", "bibliography":"pat:NonPatentReferences", "paper":"pat:NonPatentReferences", "patent literature":"pat:PatentReferences", "patent document":"pat:PatentReferences", "patent ref":"pat:PatentReferences", "example":"pat:EmbodimentDescription", "detail":"pat:EmbodimentDescription", "embodiment":"pat:EmbodimentDescription", "symbol":"pat:Symbols", "sign":"pat:Symbols", "sequence list":"pat:SequenceListText"};


let $description := $doc//pat:Description[1];
(: 找到pat:Description节点
   用一个窗口划过所有的.//com:Heading|.//com:P节点
   如果是com:Heading节点 如果它的文本符合包含某些文本比如 包含background 则这个窗口的节点元素用pat:BackgroundArt包裹直到下一个com:Heading 满足另一个条件的时候再用对于的父元素包裹 :)

:)
let $p_or_heading:= $description/(.//com:Heading|.//com:P)
for tumbling window $w in $p_or_heading
start $s when $s instance of com:Heading and some $t in $title satisfies contains(lower-case($s/text()), $t)
let lowcase := lower-case($s/text())
let

for $e in $elements
let $text := lower-case($e/text())
where some $key in map:keys($title_tag_map) satisfies contains($text, $key)
let $tag_name := map:get($title_tag_map, (for $key in map:keys($title_tag_map) where contains($text, $key) return $key)[1])
return element { QName(resolve-uri(substring-after($tag_name, ":"), namespace-uri-for-prefix(substring-before($tag_name, ":"), $e)), substring-after($tag_name, ":")) } { $e }