<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:fo="http://www.w3.org/1999/XSL/Format"
				xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf">
	<xsl:template name="vmf:vmf_a_1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('landscape', 'Landscape')">
				<xsl:copy-of select="'Landscape'"/>
			</xsl:when>
			<xsl:when test="$input=('portrait', 'Portrait')">
				<xsl:copy-of select="'Portrait'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('jpg','JPEG')">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input=('tif', 'TIFF')">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
			<xsl:when test="$input=('pdf', 'PDF', 'GIF')">
				<xsl:copy-of select="'GIF'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('bw','Black and white')">
				<xsl:copy-of select="'Black and white'"/>
			</xsl:when>
			<xsl:when test="$input=('color','Colour')">
				<xsl:copy-of select="'Colour'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_4_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('drawing', 'Drawing')">
				<xsl:copy-of select="'Drawing'"/>
			</xsl:when>
			<xsl:when test="$input=('photograph','Photograph' )">
				<xsl:copy-of select="'Photograph'"/>
			</xsl:when>
			<xsl:when test="$input='character'">
				<xsl:copy-of select="'Character'"/>
			</xsl:when>
			<xsl:when test="$input=('dna', 'DNA')">
				<xsl:copy-of select="'DNA'"/>
			</xsl:when>
			<xsl:when test="$input=('chem', 'Chemistry')">
				<xsl:copy-of select="'Chemistry'"/>
			</xsl:when>
			<xsl:when test="$input=('math', 'Math')">
				<xsl:copy-of select="'Math'"/>
			</xsl:when>
			<xsl:when test="$input=('table','Table')">
				<xsl:copy-of select="'Table'"/>
			</xsl:when>
			<xsl:when test="$input='program-listing'">
				<xsl:copy-of select="'Program listing'"/>
			</xsl:when>
			<xsl:when test="$input=('flowchart', 'Flowchart')">
				<xsl:copy-of select="'Flowchart'"/>
			</xsl:when>
			<xsl:when test="$input=('graph', 'Graph')">
				<xsl:copy-of select="'Graph'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_5_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('portrait', 'Portrait')">
				<xsl:copy-of select="'Portrait'"/>
			</xsl:when>
			<xsl:when test="$input=('landscape', 'Landscape')">
				<xsl:copy-of select="'Landscape'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_6_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='yes'">
				<xsl:copy-of select="'Inline'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf_a_7_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input=('jpg','JPEG' )">
				<xsl:copy-of select="'JPEG'"/>
			</xsl:when>
			<xsl:when test="$input=('tif', 'TIFF')">
				<xsl:copy-of select="'TIFF'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>