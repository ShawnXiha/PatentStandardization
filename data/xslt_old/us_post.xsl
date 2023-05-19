<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all">

    <xsl:key name="descByFlagAndPath" match="pat:Description//*"
        use="concat(local-name(), '|', ancestor-or-self::*/local-name())"/>

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="*:Description">
        <xsl:copy>
            <xsl:for-each-group select=".//*:P|.//*:Heading" group-by="mapFlag(., .)">
                <xsl:element name="{my:getPath($current-grouping-key)}">
                    <xsl:copy-of select="current-group()"/>
                </xsl:element>
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>

    <xsl:function name="mapFlag">
        <xsl:param name="node" as="element()"/>
        <xsl:param name="namespaces" as="map(xs:string, xs:string)"/>

        <xsl:variable name="flagText" select="$node/string()"/>
        <xsl:variable name="descTag" select="local-name($node)"/>

        <xsl:variable name="flag">
            <xsl:choose>
                <xsl:when test="$descTag = 'Heading'">
                    <xsl:choose>
                        <xsl:when test="contains($flagText, 'field')">
                            <xsl:text>technical_fields</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'background') or contains($flagText, 'art')">
                            <xsl:text>backgrounds</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'drawing')">
                            <xsl:text>drawings</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'summar')">
                            <xsl:text>summaries</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'solution') or contains($flagText, 'mean')">
                            <xsl:text>solutions</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'problem')">
                            <xsl:text>problems</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'industr') and (contains($flagText, 'applica') or contains($flagText, 'utili'))">
                            <xsl:text>industrial_applicability</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'effect') or contains($flagText, 'advantage')">
                            <xsl:text>advantageous</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains($flagText, 'non-patent') or contains($flagText, 'bibliography') or contains($flagText, 'paper') or contains($flagText, '
