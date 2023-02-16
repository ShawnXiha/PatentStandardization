<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:dgn="http://www.wipo.int/standards/XMLSchema/ST96/Design" exclude-result-prefixes="vmf xs fn com dgn">
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Design eFiling'">
				<xsl:copy-of select="'Design e-filing'"/>
			</xsl:when>
			<xsl:when test="$input='Design B2B filing'">
				<xsl:copy-of select="'Design B2B-filing'"/>
			</xsl:when>
			<xsl:when test="$input='Design information'">
				<xsl:copy-of select="'Design information'"/>
			</xsl:when>
			<xsl:when test="$input='Design identifier list'">
				<xsl:copy-of select="'Design identifier list'"/>
			</xsl:when>
			<xsl:when test="$input='Design List'">
				<xsl:copy-of select="'Design list'"/>
			</xsl:when>
			<xsl:when test="$input='Design opposition eFiling'">
				<xsl:copy-of select="'Design opposition e-filing'"/>
			</xsl:when>
			<xsl:when test="$input='Design opposition information'">
				<xsl:copy-of select="'Design opposition information'"/>
			</xsl:when>
			<xsl:when test="$input='Design opposition identifier list'">
				<xsl:copy-of select="'Design opposition identifier list'"/>
			</xsl:when>
			<xsl:when test="$input='Representative appointment'">
				<xsl:copy-of select="'Representative appointment'"/>
			</xsl:when>
			<xsl:when test="$input='Amendment registered design'">
				<xsl:copy-of select="'Amendment registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Amendment application'">
				<xsl:copy-of select="'Amendment application'"/>
			</xsl:when>
			<xsl:when test="$input='Convention application'">
				<xsl:copy-of select="'Convention application'"/>
			</xsl:when>
			<xsl:when test="$input='Additional application'">
				<xsl:copy-of select="'Additional application'"/>
			</xsl:when>
			<xsl:when test="$input='Subsequent application'">
				<xsl:copy-of select="'Subsequent application'"/>
			</xsl:when>
			<xsl:when test="$input='Divisional application'">
				<xsl:copy-of select="'Divisional application'"/>
			</xsl:when>
			<xsl:when test="$input='Assignment application'">
				<xsl:copy-of select="'Assignment application'"/>
			</xsl:when>
			<xsl:when test="$input='Assignment registered design'">
				<xsl:copy-of select="'Assignment registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Request certified copies'">
				<xsl:copy-of select="'Request certified copies'"/>
			</xsl:when>
			<xsl:when test="$input='Request extension time'">
				<xsl:copy-of select="'Request extension time'"/>
			</xsl:when>
			<xsl:when test="$input='Request hearing'">
				<xsl:copy-of select="'Request hearing'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition first extension'">
				<xsl:copy-of select="'Opposition first extension'"/>
			</xsl:when>
			<xsl:when test="$input='Opposition various renewal or extension of registration restoration'">
				<xsl:copy-of select="'Opposition various renewal or extension of registration restoration'"/>
			</xsl:when>
			<xsl:when test="$input='Withdrawal'">
				<xsl:copy-of select="'Withdrawal'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw application'">
				<xsl:copy-of select="'Withdraw application'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw design'">
				<xsl:copy-of select="'Withdraw design'"/>
			</xsl:when>
			<xsl:when test="$input='Response examination report'">
				<xsl:copy-of select="'Response examination report'"/>
			</xsl:when>
			<xsl:when test="$input='Statement support'">
				<xsl:copy-of select="'Statement support'"/>
			</xsl:when>
			<xsl:when test="$input='Withdraw service request'">
				<xsl:copy-of select="'Withdraw service request'"/>
			</xsl:when>
			<xsl:when test="$input='Request publication'">
				<xsl:copy-of select="'Request publication'"/>
			</xsl:when>
			<xsl:when test="$input='Request registration'">
				<xsl:copy-of select="'Request registration'"/>
			</xsl:when>
			<xsl:when test="$input='Offer surrender'">
				<xsl:copy-of select="'Offer surrender'"/>
			</xsl:when>
			<xsl:when test="$input='Request exclusion'">
				<xsl:copy-of select="'Request exclusion'"/>
			</xsl:when>
			<xsl:when test="$input='Request conversion'">
				<xsl:copy-of select="'Request conversion'"/>
			</xsl:when>
			<xsl:when test="$input='Duplicate certificate'">
				<xsl:copy-of select="'Duplicate certificate'"/>
			</xsl:when>
			<xsl:when test="$input='Request supply documents'">
				<xsl:copy-of select="'Request supply documents'"/>
			</xsl:when>
			<xsl:when test="$input='Request delayed registration'">
				<xsl:copy-of select="'Request delayed registration'"/>
			</xsl:when>
			<xsl:when test="$input='Request accelerated examination'">
				<xsl:copy-of select="'Request accelerated examination'"/>
			</xsl:when>
			<xsl:when test="$input='Expiry notice'">
				<xsl:copy-of select="'Expiry notice'"/>
			</xsl:when>
			<xsl:when test="$input='Refusal withdrawal notification'">
				<xsl:copy-of select="'Refusal withdrawal notification'"/>
			</xsl:when>
			<xsl:when test="$input='Division international registration notification'">
				<xsl:copy-of select="'Division international registration notification'"/>
			</xsl:when>
			<xsl:when test="$input='Refusal notification'">
				<xsl:copy-of select="'Refusal notification'"/>
			</xsl:when>
			<xsl:when test="$input='Providing certificate to holder'">
				<xsl:copy-of select="'Providing certificate to holder'"/>
			</xsl:when>
			<xsl:when test="$input='Transmittal application to IB'">
				<xsl:copy-of select="'Transmittal application to IB'"/>
			</xsl:when>
			<xsl:when test="$input='Irregularities'">
				<xsl:copy-of select="'Irregularities'"/>
			</xsl:when>
			<xsl:when test="$input='Invalidation notification'">
				<xsl:copy-of select="'Invalidation notification'"/>
			</xsl:when>
			<xsl:when test="$input='Cancellation representative appointment'">
				<xsl:copy-of select="'Cancellation representative appointment'"/>
			</xsl:when>
			<xsl:when test="$input='Application receipt'">
				<xsl:copy-of select="'Application receipt'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document by design formality examination'">
				<xsl:copy-of select="'Notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document by design substantial examination'">
				<xsl:copy-of select="'Notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document by design registration'">
				<xsl:copy-of select="'Notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document by trial examination_invitation'">
				<xsl:copy-of select="'Notice document by trial examination - invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document by trial examination'">
				<xsl:copy-of select="'Notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Notice Document by trial examination_decision'">
				<xsl:copy-of select="'Notice document by trial examination - decision'"/>
			</xsl:when>
			<xsl:when test="$input='Memo by design formality examination'">
				<xsl:copy-of select="'Memo by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo by design substantial examination'">
				<xsl:copy-of select="'Memo by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo by trial examination'">
				<xsl:copy-of select="'Memo by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Memo by trial notice'">
				<xsl:copy-of select="'Memo by trial notice'"/>
			</xsl:when>
			<xsl:when test="$input='Memo by trial examination_correction'">
				<xsl:copy-of select="'Memo by trial examination - correction'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design application document'">
				<xsl:copy-of select="'Accept design application document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design applicant document'">
				<xsl:copy-of select="'Accept design applicant document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design attorney document'">
				<xsl:copy-of select="'Accept design attorney document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design withdrawal and abandonment document'">
				<xsl:copy-of select="'Accept design withdrawal and abandonment document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design response document'">
				<xsl:copy-of select="'Accept design response document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design submission document'">
				<xsl:copy-of select="'Accept design submission document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design amendment document'">
				<xsl:copy-of select="'Accept design amendment document'"/>
			</xsl:when>
			<xsl:when test="$input='Accept design request for inspection'">
				<xsl:copy-of select="'Accept design request for inspection'"/>
			</xsl:when>
			<xsl:when test="$input='Accept demand for a trial'">
				<xsl:copy-of select="'Accept demand for a trial'"/>
			</xsl:when>
			<xsl:when test="$input='Accept trial intermediate document'">
				<xsl:copy-of select="'Accept trial intermediate document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design application document'">
				<xsl:copy-of select="'Inspection accept design application document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design applicant document'">
				<xsl:copy-of select="'Inspection accept design applicant document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design attorney document'">
				<xsl:copy-of select="'Inspection accept design attorney document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design withdrawal and abandonment document'">
				<xsl:copy-of select="'Inspection accept design withdrawal and abandonment document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design response document'">
				<xsl:copy-of select="'Inspection accept design response document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design submission document'">
				<xsl:copy-of select="'Inspection accept design submission document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design amendment document'">
				<xsl:copy-of select="'Inspection accept design amendment document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept design request for inspection'">
				<xsl:copy-of select="'Inspection accept design request for inspection'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept demand for a trial'">
				<xsl:copy-of select="'Inspection accept demand for a trial'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection accept trial intermediate document'">
				<xsl:copy-of select="'Inspection accept trial intermediate document'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by design formality examination'">
				<xsl:copy-of select="'Inspection notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by design substantial examination'">
				<xsl:copy-of select="'Inspection notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by design Registration'">
				<xsl:copy-of select="'Inspection notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by trial examination_invitation'">
				<xsl:copy-of select="'Inspection notice document by trial examination - invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by trial examination'">
				<xsl:copy-of select="'Inspection notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection notice document by trial examination _decision'">
				<xsl:copy-of select="'Inspection notice document by trial examination - decision'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection memo by design formality examination'">
				<xsl:copy-of select="'Inspection memo by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection memo by design substantial examination'">
				<xsl:copy-of select="'Inspection memo by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection memo by trial examination'">
				<xsl:copy-of select="'Inspection memo by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Inspection memo by trial notice'">
				<xsl:copy-of select="'Inspection memo by trial notice'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by design formality examination'">
				<xsl:copy-of select="'Certified copy notice document by design formality examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by design substantial examination'">
				<xsl:copy-of select="'Certified copy Notice document by design substantial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by design registration'">
				<xsl:copy-of select="'Certified copy notice document by design registration'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by trial examination_invitation'">
				<xsl:copy-of select="'Certified copy notice document by trial examination - invitation'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by trial examination'">
				<xsl:copy-of select="'Certified copy notice document by trial examination'"/>
			</xsl:when>
			<xsl:when test="$input='Certified copy notice document by trial examination_decision'">
				<xsl:copy-of select="'Certified Copy Notice Document By Trial Examination - Decision'"/>
			</xsl:when>
			<xsl:when test="$input='Application information'">
				<xsl:copy-of select="'Application Information'"/>
			</xsl:when>
			<xsl:when test="$input='Accept document list'">
				<xsl:copy-of select="'Accept Document List'"/>
			</xsl:when>
			<xsl:when test="$input='Notice document list'">
				<xsl:copy-of select="'Notice Document List'"/>
			</xsl:when>
			<xsl:when test="$input='Balance sheet reference'">
				<xsl:copy-of select="'Balance Sheet Reference'"/>
			</xsl:when>
			<xsl:when test="$input='Division number list'">
				<xsl:copy-of select="'Division Number List'"/>
			</xsl:when>
			<xsl:when test="$input='Record licence'">
				<xsl:copy-of select="'Record Licence'"/>
			</xsl:when>
			<xsl:when test="$input='Record mortgagee'">
				<xsl:copy-of select="'Record Mortgagee'"/>
			</xsl:when>
			<xsl:when test="$input='Terminate licence'">
				<xsl:copy-of select="'Terminate Licence'"/>
			</xsl:when>
			<xsl:when test="$input='Discharge mortgagee'">
				<xsl:copy-of select="'Discharge Mortgagee'"/>
			</xsl:when>
			<xsl:when test="$input='Change of name'">
				<xsl:copy-of select="'Change of Name'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Accelerated registration'">
				<xsl:copy-of select="'Accelerated Registration'"/>
			</xsl:when>
			<xsl:when test="$input='Normal'">
				<xsl:copy-of select="'Normal'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='In year'">
				<xsl:copy-of select="'InYear'"/>
			</xsl:when>
			<xsl:when test="$input='In month'">
				<xsl:copy-of select="'InMonth'"/>
			</xsl:when>
			<xsl:when test="$input='In week'">
				<xsl:copy-of select="'InWeek'"/>
			</xsl:when>
			<xsl:when test="$input='In day'">
				<xsl:copy-of select="'InDay'"/>
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
	<xsl:template name="vmf:vmf6_inputtoresult">
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
			<xsl:when test="$input='SVG'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf7_inputtoresult">
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
			<xsl:when test="$input='Partially refused'">
				<xsl:copy-of select="'Partially Refused'"/>
			</xsl:when>
			<xsl:when test="$input='Refused'">
				<xsl:copy-of select="'Refused'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf8_inputtoresult">
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
			<xsl:when test="$input='MS Word'">
				<xsl:copy-of select="' '"/>
			</xsl:when>
			<xsl:when test="$input='MS Excel'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='XML'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='Text'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='EPS'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='PDF'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='SVG'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='HTML'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='CDX'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='MOL'">
				<xsl:copy-of select="''"/>
			</xsl:when>
			<xsl:when test="$input='NB'">
				<xsl:copy-of select="''"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf9_inputtoresult">
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
	<xsl:template name="vmf:vmf10_inputtoresult">
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
	<xsl:template name="vmf:vmf11_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Division'">
				<xsl:copy-of select="'Division'"/>
			</xsl:when>
			<xsl:when test="$input='Related design'">
				<xsl:copy-of select="'Related Design'"/>
			</xsl:when>
			<xsl:when test="$input='Design application based on patent or utility model'">
				<xsl:copy-of select="'Design Application Based on Patent or Utility Model'"/>
			</xsl:when>
			<xsl:when test="$input='New application for amended design'">
				<xsl:copy-of select="'New Application for Amended Design'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf12_inputtoresult">
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
	<xsl:template name="vmf:vmf13_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='Business fixed'">
				<xsl:copy-of select="'Fixed'"/>
			</xsl:when>
			<xsl:when test="$input='Business mobile'">
				<xsl:copy-of select="'Mobile Phone'"/>
			</xsl:when>
			<xsl:when test="$input='Private fixed'">
				<xsl:copy-of select="'Fixed'"/>
			</xsl:when>
			<xsl:when test="$input='Private mobile'">
				<xsl:copy-of select="'Mobile Phone'"/>
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
			<xsl:when test="$input='Professional representative'">
				<xsl:copy-of select="'Professional Rpresentative'"/>
			</xsl:when>
			<xsl:when test="$input='Undefined'">
				<xsl:copy-of select="'Undefined'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf15_inputtoresult">
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
	<xsl:template name="vmf:vmf16_inputtoresult">
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
	<xsl:template name="vmf:vmf17_inputtoresult">
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
			<xsl:when test="$input='Trademark'">
				<xsl:copy-of select="'Trade mark'"/>
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
			<xsl:when test="$input='Registered design'">
				<xsl:copy-of select="'Registered design'"/>
			</xsl:when>
			<xsl:when test="$input='Unregistered design'">
				<xsl:copy-of select="'Unregistered design'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf20_inputtoresult">
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
		<Transaction xmlns="http://www.wipo.int/standards/XMLSchema/designs">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.wipo.int/standards/XMLSchema/designs ../../Schemas/ST86Schema/st86model-V1-0.xsd'"/>
			<xsl:for-each select="dgn:DesignTransaction">
				<xsl:for-each select="com:TransactionHeader">
					<TransactionHeader>
						<xsl:variable name="var1_SenderBag" as="node()" select="com:SenderBag"/>
						<SenderDetails>
							<xsl:for-each select="$var1_SenderBag/com:RequestIdentifier">
								<RequestIdentifier>
									<xsl:sequence select="fn:string(.)"/>
								</RequestIdentifier>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestLanguageCode">
								<RequestLanguageCode>
									<xsl:sequence select="fn:string(.)"/>
								</RequestLanguageCode>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestXSDVersion">
								<RequestXSDVersion>
									<xsl:sequence select="fn:string(.)"/>
								</RequestXSDVersion>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:FileName">
								<RequestFilename>
									<xsl:sequence select="fn:string(.)"/>
								</RequestFilename>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestStatusCategory">
								<RequestStatus>
									<xsl:sequence select="fn:string(.)"/>
								</RequestStatus>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestProducer">
								<RequestProducer>
									<xsl:sequence select="fn:string(.)"/>
								</RequestProducer>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestDate">
								<RequestProducerDate>
									<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
								</RequestProducerDate>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestDateTime">
								<RequestProducerDateTime>
									<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
								</RequestProducerDateTime>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:RequestReceivingOfficeCode">
								<RequestReceivingOfficeCode>
									<xsl:sequence select="fn:string(.)"/>
								</RequestReceivingOfficeCode>
							</xsl:for-each>
							<xsl:for-each select="$var1_SenderBag/com:LoginInformation">
								<LoginInformation>
									<Login>
										<xsl:sequence select="fn:string(com:Login)"/>
									</Login>
									<xsl:for-each select="com:LoginEmail">
										<LoginEmail>
											<xsl:sequence select="fn:string(.)"/>
										</LoginEmail>
									</xsl:for-each>
									<xsl:for-each select="com:Password">
										<Password>
											<xsl:sequence select="fn:string(.)"/>
										</Password>
									</xsl:for-each>
								</LoginInformation>
							</xsl:for-each>
						</SenderDetails>
						<xsl:for-each select="com:ReceiverBag">
							<ReceiverDetails>
								<ReceiverDateTime>
									<xsl:sequence select="xs:string(xs:dateTime(fn:string(com:ReceiverDateTime)))"/>
								</ReceiverDateTime>
								<xsl:for-each select="com:CommentText">
									<Comment>
										<xsl:for-each select="@com:languageCode">
											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
										</xsl:for-each>
										<xsl:sequence select="fn:string(.)"/>
									</Comment>
								</xsl:for-each>
							</ReceiverDetails>
						</xsl:for-each>
					</TransactionHeader>
				</xsl:for-each>
				<xsl:for-each select="dgn:DesignTransactionBody">
					<DesignTransactionBody>
						<xsl:for-each select="com:TransactionErrorBag">
							<TransactionErrorDetails>
								<xsl:for-each select="com:TransactionError">
									<TransactionError>
										<xsl:for-each select="com:TransactionErrorCode">
											<TransactionErrorCode>
												<xsl:sequence select="fn:string(.)"/>
											</TransactionErrorCode>
										</xsl:for-each>
										<xsl:for-each select="com:TransactionErrorText">
											<TransactionErrorText>
												<xsl:for-each select="@com:languageCode">
													<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
												</xsl:for-each>
												<xsl:sequence select="fn:string(.)"/>
											</TransactionErrorText>
										</xsl:for-each>
									</TransactionError>
								</xsl:for-each>
							</TransactionErrorDetails>
						</xsl:for-each>
						<xsl:variable name="var117_TransactionContentBag" as="node()" select="dgn:TransactionContentBag"/>
						<TransactionContentDetails>
							<TransactionIdentifier>
								<xsl:sequence select="fn:string($var117_TransactionContentBag/com:TransactionIdentifier)"/>
							</TransactionIdentifier>
							<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf1_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var117_TransactionContentBag/com:TransactionCategory)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
								<TransactionCode>
									<xsl:sequence select="."/>
								</TransactionCode>
							</xsl:for-each>
							<xsl:variable name="var3_resultof_vmf__inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf2_inputtoresult">
									<xsl:with-param name="input" select="fn:string($var117_TransactionContentBag/com:TransactionSubCode)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var3_resultof_vmf__inputtoresult">
								<TransactionSubCode>
									<xsl:sequence select="."/>
								</TransactionSubCode>
							</xsl:for-each>
							<TransactionData>
								<xsl:for-each select="$var117_TransactionContentBag/dgn:TransactionData/dgn:DesignBag">
									<DesignDetails>
										<xsl:for-each select="dgn:Design">
											<Design>
												<xsl:for-each select="dgn:DesignIdentifier">
													<DesignIdentifier>
														<xsl:sequence select="fn:string(.)"/>
													</DesignIdentifier>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignReference">
													<DesignReference>
														<xsl:sequence select="fn:string(.)"/>
													</DesignReference>
												</xsl:for-each>
												<xsl:for-each select="com:RegistrationNumber">
													<RegistrationNumber>
														<xsl:sequence select="fn:string(.)"/>
													</RegistrationNumber>
												</xsl:for-each>
												<xsl:for-each select="com:RegistrationDate">
													<RegistrationDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</RegistrationDate>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignTitleText">
													<DesignTitle>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</DesignTitle>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignDescriptionText">
													<DesignDescription>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:for-each select="@com:sequenceNumber">
															<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</DesignDescription>
												</xsl:for-each>
												<xsl:for-each select="dgn:PublicationKindDescription">
													<PublicationKindDescription>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</PublicationKindDescription>
												</xsl:for-each>
												<xsl:for-each select="dgn:NoveltyStatementText">
													<NoveltyStatement>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</NoveltyStatement>
												</xsl:for-each>
												<xsl:for-each select="dgn:PartialDesignIndicator">
													<PartialDesignIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</PartialDesignIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:PartialDisclaimerText">
													<PartialDisclaimer>
														<xsl:for-each select="@com:languageCode">
															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
														</xsl:for-each>
														<xsl:sequence select="fn:string(.)"/>
													</PartialDisclaimer>
												</xsl:for-each>
												<xsl:for-each select="dgn:PublicationDefermentIndicator">
													<PublicationDefermentIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</PublicationDefermentIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:DefermentPeriod">
													<DefermentPeriod>
														<xsl:for-each select="@com:periodCategory">
															<xsl:variable name="var4_resultof_vmf__inputtoresult" as="xs:string?">
																<xsl:call-template name="vmf:vmf3_inputtoresult">
																	<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																</xsl:call-template>
															</xsl:variable>
															<xsl:for-each select="$var4_resultof_vmf__inputtoresult">
																<xsl:attribute name="periodCode" namespace="" select="."/>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</DefermentPeriod>
												</xsl:for-each>
												<xsl:for-each select="com:ColourIndicator">
													<ColourIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</ColourIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignerWaiverIndicator">
													<DesignerWaiverIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</DesignerWaiverIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:PublicationInColourIndicator">
													<PublicationInColourIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</PublicationInColourIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:ImmediatePublicationIndicator">
													<ImmediatePublicationIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</ImmediatePublicationIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:DescriptionPublicationIndicator">
													<DescriptionPublicationIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</DescriptionPublicationIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignOpenToLicensingIndicator">
													<DesignOpenToLicensingIndicator>
														<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
													</DesignOpenToLicensingIndicator>
												</xsl:for-each>
												<xsl:for-each select="dgn:SpecimenTotalQuantity">
													<TotalSpecimen>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</TotalSpecimen>
												</xsl:for-each>
												<xsl:for-each select="dgn:RepresentationSheetTotalQuantity">
													<TotalRepresentationSheet>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</TotalRepresentationSheet>
												</xsl:for-each>
												<xsl:for-each select="dgn:ColourViewTotalQuantity">
													<TotalColourView>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</TotalColourView>
												</xsl:for-each>
												<xsl:for-each select="dgn:BlackWhiteViewTotalQuantity">
													<TotalBWView>
														<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
													</TotalBWView>
												</xsl:for-each>
												<xsl:for-each select="com:ExpiryDate">
													<ExpiryDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</ExpiryDate>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignCurrentStatusCategory">
													<xsl:variable name="var5_resultof_vmf__inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf4_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var5_resultof_vmf__inputtoresult">
														<DesignCurrentStatusCode>
															<xsl:sequence select="."/>
														</DesignCurrentStatusCode>
													</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignCurrentStatusDate">
													<DesignCurrentStatusDate>
														<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
													</DesignCurrentStatusDate>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignSpecimenBag">
													<DesignSpecimenDetails>
														<xsl:for-each select="dgn:DesignSpecimen">
															<DesignSpecimen>
																<SpecimenIdentifier>
																	<xsl:sequence select="fn:string(dgn:SpecimenIdentifier)"/>
																</SpecimenIdentifier>
																<xsl:for-each select="dgn:DesignSpecimenCategory">
																	<xsl:variable name="var6_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf5_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var6_resultof_vmf__inputtoresult">
																		<SpecimenKind>
																			<xsl:sequence select="."/>
																		</SpecimenKind>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="dgn:SpecimenDescriptionText">
																	<SpecimenDescription>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</SpecimenDescription>
																</xsl:for-each>
																<xsl:for-each select="com:FileName">
																	<SpecimenFilename>
																		<xsl:sequence select="fn:string(.)"/>
																	</SpecimenFilename>
																</xsl:for-each>
																<xsl:for-each select="com:ImageFormatCategory">
																	<xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf6_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var7_resultof_vmf__inputtoresult">
																		<SpecimenFileFormat>
																			<xsl:sequence select="."/>
																		</SpecimenFileFormat>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:ColourIndicator">
																	<SpecimenColourIndicator>
																		<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																	</SpecimenColourIndicator>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</DesignSpecimen>
														</xsl:for-each>
													</DesignSpecimenDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:PriorityBag">
													<PriorityDetails>
														<xsl:for-each select="dgn:Priority">
															<Priority>
																<PriorityCountryCode>
																	<xsl:sequence select="fn:string(com:PriorityCountryCode)"/>
																</PriorityCountryCode>
																<xsl:for-each select="com:ApplicationNumber/com:ApplicationNumberText">
																	<PriorityNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</PriorityNumber>
																</xsl:for-each>
																<PriorityDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(com:PriorityApplicationFilingDate)))"/>
																</PriorityDate>
																<xsl:for-each select="com:PriorityHolderName">
																	<PriorityHolderName>
																		<xsl:sequence select="fn:string(.)"/>
																	</PriorityHolderName>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityStatusCategory">
																	<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf7_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
																		<PriorityStatusCode>
																			<xsl:sequence select="."/>
																		</PriorityStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityStatusDate">
																	<PriorityStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PriorityStatusDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:PriorityDocument">
																	<PriorityDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var9_resultof_vmf__inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf8_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var9_resultof_vmf__inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var10_resultof_vmf__inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf9_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var10_resultof_vmf__inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="@com:sequenceNumber">
																					<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</PriorityDocument>
																</xsl:for-each>
															</Priority>
														</xsl:for-each>
													</PriorityDetails>
												</xsl:for-each>
												<xsl:for-each select="com:ExhibitionPriorityBag">
													<ExhibitionPriorityDetails>
														<xsl:for-each select="com:ExhibitionPriority">
															<ExhibitionPriority>
																<xsl:for-each select="com:ExhibitionCountryCode">
																	<ExhibitionCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionCountryCode>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionCityName">
																	<ExhibitionCityName>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionCityName>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionName">
																	<ExhibitionName>
																		<xsl:sequence select="fn:string(.)"/>
																	</ExhibitionName>
																</xsl:for-each>
																<ExhibitionDate>
																	<xsl:sequence select="xs:string(xs:date(fn:string(com:ExhibitionDate)))"/>
																</ExhibitionDate>
																<xsl:for-each select="com:ExhibitionFirstDisplayDate">
																	<ExhibitionFirstDisplayDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</ExhibitionFirstDisplayDate>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionStatusCategory">
																	<xsl:variable name="var11_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf10_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var11_resultof_vmf___inputtoresult">
																		<ExhibitionStatusCode>
																			<xsl:sequence select="."/>
																		</ExhibitionStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionStatusDate">
																	<ExhibitionStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</ExhibitionStatusDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:ExhibitionDocument">
																	<ExhibitionDocument>
																		<DocumentName>
																			<xsl:sequence select="fn:string(com:DocumentName)"/>
																		</DocumentName>
																		<xsl:for-each select="com:FileName">
																			<DocumentFilename>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentFilename>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentFormatCategory">
																			<xsl:variable name="var12_resultof_vmf__inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf8_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var12_resultof_vmf__inputtoresult">
																				<DocumentFileFormat>
																					<xsl:sequence select="."/>
																				</DocumentFileFormat>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentDate">
																			<DocumentDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</DocumentDate>
																		</xsl:for-each>
																		<xsl:for-each select="@com:languageCode">
																			<DocumentLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentLanguageCode>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentMediaCategory">
																			<xsl:variable name="var13_resultof_vmf__inputtoresult" as="xs:string?">
																				<xsl:call-template name="vmf:vmf9_inputtoresult">
																					<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																				</xsl:call-template>
																			</xsl:variable>
																			<xsl:for-each select="$var13_resultof_vmf__inputtoresult">
																				<DocumentMedia>
																					<xsl:sequence select="."/>
																				</DocumentMedia>
																			</xsl:for-each>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentLocationURI">
																			<DocumentLocation>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</DocumentLocation>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentVersion">
																			<DocumentVersion>
																				<xsl:sequence select="fn:string(.)"/>
																			</DocumentVersion>
																		</xsl:for-each>
																		<xsl:for-each select="com:DocumentSizeQuantity">
																			<DocumentSizeInByte>
																				<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																			</DocumentSizeInByte>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:for-each select="@com:sequenceNumber">
																					<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</ExhibitionDocument>
																</xsl:for-each>
															</ExhibitionPriority>
														</xsl:for-each>
													</ExhibitionPriorityDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:RelatedApplicationBag">
													<RelatedApplicationDetails>
														<xsl:for-each select="dgn:RelatedApplication">
															<RelatedApplication>
																<xsl:for-each select="dgn:RelatedApplicationNumber">
																	<RelatedApplicationNumber>
																		<xsl:sequence select="()"/>
																	</RelatedApplicationNumber>
																</xsl:for-each>
																<xsl:for-each select="dgn:RelatedApplicationDate">
																	<RelatedApplicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</RelatedApplicationDate>
																</xsl:for-each>
																<xsl:for-each select="dgn:RelatedApplicationReference">
																	<RelatedApplicationReference>
																		<xsl:sequence select="fn:string(.)"/>
																	</RelatedApplicationReference>
																</xsl:for-each>
																<xsl:for-each select="dgn:RelatedApplicationRegistrationNumber">
																	<RelatedApplicationRegistrationNumber>
																		<xsl:sequence select="fn:string(.)"/>
																	</RelatedApplicationRegistrationNumber>
																</xsl:for-each>
																<xsl:variable name="var14_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf11_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(dgn:RelatedApplicationCategory)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var14_resultof_vmf___inputtoresult">
																	<RelatedApplicationKind>
																		<xsl:sequence select="."/>
																	</RelatedApplicationKind>
																</xsl:for-each>
															</RelatedApplication>
														</xsl:for-each>
													</RelatedApplicationDetails>
												</xsl:for-each>
												<xsl:for-each select="com:StaffBag">
													<StaffDetails>
														<xsl:for-each select="com:Staff">
															<Staff>
																<xsl:for-each select="com:PartyIdentifier">
																	<StaffIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</StaffIdentifier>
																</xsl:for-each>
																<xsl:for-each select="com:StaffName">
																	<StaffName>
																		<xsl:sequence select="fn:string(.)"/>
																	</StaffName>
																</xsl:for-each>
																<xsl:for-each select="com:OfficialTitleText">
																	<OfficialTitle>
																		<xsl:sequence select="fn:string(.)"/>
																	</OfficialTitle>
																</xsl:for-each>
															</Staff>
														</xsl:for-each>
													</StaffDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:PublicationBag">
													<PublicationDetails>
														<xsl:for-each select="dgn:Publication">
															<Publication>
																<PublicationIdentifier>
																	<xsl:sequence select="fn:string(com:PublicationIdentifier)"/>
																</PublicationIdentifier>
																<xsl:for-each select="dgn:PublicationSectionCategory">
																	<xsl:variable name="var15_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf12_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var15_resultof_vmf___inputtoresult">
																		<PublicationSection>
																			<xsl:sequence select="."/>
																		</PublicationSection>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationSubsection">
																	<PublicationSubsection>
																		<xsl:sequence select="fn:string(.)"/>
																	</PublicationSubsection>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationDate">
																	<PublicationDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</PublicationDate>
																</xsl:for-each>
																<xsl:for-each select="com:PublicationPage">
																	<PublicationPage>
																		<xsl:sequence select="fn:string(.)"/>
																	</PublicationPage>
																</xsl:for-each>
															</Publication>
														</xsl:for-each>
													</PublicationDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:PatentIdentificationBag">
													<CitationReferenceDetails>
														<xsl:for-each select="com:CitedPatentDocumentIdentification">
															<CitationReference>
																<CitationIdentifier>
																	<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(com:IPOfficeCode)"/>
																	<xsl:sequence select="fn:string(com:DocumentNumber)"/>
																</CitationIdentifier>
																<xsl:for-each select="com:PatentDocumentKindCode">
																	<CitationKind>
																		<xsl:sequence select="fn:string(.)"/>
																	</CitationKind>
																</xsl:for-each>
																<CitationDocument>
																	<xsl:for-each select="com:PatentDocumentDate">
																		<DocumentDate>
																			<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																		</DocumentDate>
																	</xsl:for-each>
																	<xsl:for-each select="@com:sourceURI">
																		<DocumentLocation>
																			<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																		</DocumentLocation>
																	</xsl:for-each>
																</CitationDocument>
															</CitationReference>
														</xsl:for-each>
													</CitationReferenceDetails>
												</xsl:for-each>
												<xsl:variable name="var52_ApplicantBag" as="node()" select="dgn:ApplicantBag"/>
												<ApplicantDetails>
													<xsl:for-each select="$var52_ApplicantBag/com:PartyIdentifierBag">
														<ApplicantKey>
															<xsl:for-each select="com:PartyIdentifier">
																<Identifier>
																	<xsl:for-each select="@com:officeCode">
																		<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</Identifier>
															</xsl:for-each>
														</ApplicantKey>
													</xsl:for-each>
													<xsl:for-each select="$var52_ApplicantBag/dgn:Applicant">
														<Applicant>
															<xsl:for-each select="@com:operationCategory">
																<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
															</xsl:for-each>
															<xsl:for-each select="com:PartyIdentifier">
																<ApplicantIdentifier>
																	<xsl:for-each select="@com:officeCode">
																		<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantIdentifier>
															</xsl:for-each>
															<xsl:for-each select="@com:sequenceNumber">
																<ApplicantSequenceNumber>
																	<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																</ApplicantSequenceNumber>
															</xsl:for-each>
															<xsl:for-each select="com:NationalityCode">
																<ApplicantNationalityCode>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantNationalityCode>
															</xsl:for-each>
															<xsl:for-each select="com:LegalEntityName">
																<ApplicantLegalEntity>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantLegalEntity>
															</xsl:for-each>
															<xsl:for-each select="com:IncorporationCountryCode">
																<ApplicantIncorporationCountryCode>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantIncorporationCountryCode>
															</xsl:for-each>
															<xsl:for-each select="com:IncorporationState">
																<ApplicantIncorporationState>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantIncorporationState>
															</xsl:for-each>
															<xsl:for-each select="com:CommentText">
																<Comment>
																	<xsl:for-each select="@com:languageCode">
																		<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																	</xsl:for-each>
																	<xsl:sequence select="fn:string(.)"/>
																</Comment>
															</xsl:for-each>
															<xsl:for-each select="com:Contact">
																<xsl:variable name="var24_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																<ApplicantAddressBook>
																	<xsl:for-each select="@com:languageCode">
																		<AddressLanguageCode>
																			<xsl:sequence select="fn:string(.)"/>
																		</AddressLanguageCode>
																	</xsl:for-each>
																	<FormattedNameAddress>
																		<xsl:for-each select="com:Name">
																			<xsl:variable name="var20_cur" as="node()" select="."/>
																			<xsl:variable name="var19_PersonName" as="node()*" select="com:PersonName"/>
																			<Name>
																				<FreeFormatName>
																					<FreeFormatNameDetails>
																						<xsl:for-each select="$var19_PersonName">
																							<xsl:variable name="var16_cur" as="node()" select="."/>
																							<xsl:for-each select="com:PersonFullName">
																								<FreeFormatNameLine>
																									<xsl:for-each select="$var16_cur/@com:languageCode">
																										<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</FreeFormatNameLine>
																							</xsl:for-each>
																						</xsl:for-each>
																					</FreeFormatNameDetails>
																				</FreeFormatName>
																				<xsl:for-each select="$var19_PersonName">
																					<xsl:variable name="var18_cur" as="node()" select="."/>
																					<xsl:for-each select="com:PersonStructuredName">
																						<xsl:variable name="var17_OrganizationName" as="node()*" select="$var20_cur/com:OrganizationName"/>
																						<FormattedName>
																							<xsl:for-each select="com:NamePrefix">
																								<NamePrefix>
																									<xsl:sequence select="fn:string(.)"/>
																								</NamePrefix>
																							</xsl:for-each>
																							<xsl:for-each select="com:FirstName">
																								<FirstName>
																									<xsl:sequence select="fn:string(.)"/>
																								</FirstName>
																							</xsl:for-each>
																							<xsl:for-each select="com:MiddleName">
																								<MiddleName>
																									<xsl:sequence select="fn:string(.)"/>
																								</MiddleName>
																							</xsl:for-each>
																							<LastName>
																								<xsl:sequence select="fn:string(com:LastName)"/>
																							</LastName>
																							<xsl:for-each select="com:SecondLastName">
																								<SecondLastName>
																									<xsl:sequence select="fn:string(.)"/>
																								</SecondLastName>
																							</xsl:for-each>
																							<xsl:for-each select="com:NameSuffix">
																								<NameSuffix>
																									<xsl:sequence select="fn:string(.)"/>
																								</NameSuffix>
																							</xsl:for-each>
																							<xsl:for-each select="$var17_OrganizationName">
																								<OrganizationName>
																									<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																								</OrganizationName>
																							</xsl:for-each>
																							<xsl:for-each select="($var17_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																								<OrganizationDepartment>
																									<xsl:sequence select="fn:string(.)"/>
																								</OrganizationDepartment>
																							</xsl:for-each>
																							<xsl:for-each select="$var18_cur/com:PreferredName">
																								<NameSynonym>
																									<xsl:sequence select="fn:string(.)"/>
																								</NameSynonym>
																							</xsl:for-each>
																						</FormattedName>
																					</xsl:for-each>
																				</xsl:for-each>
																			</Name>
																		</xsl:for-each>
																		<Address>
																			<FreeFormatAddress>
																				<xsl:for-each select="$var24_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																					<FreeFormatAddressLine>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</FreeFormatAddressLine>
																				</xsl:for-each>
																			</FreeFormatAddress>
																			<xsl:for-each select="$var24_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																				<xsl:variable name="var21_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																				<xsl:variable name="var22_AddressLineText" as="node()+" select="com:AddressLineText"/>
																				<FormattedAddress>
																					<xsl:for-each select="($var22_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																						<AddressLine>
																							<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																								<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																							</xsl:if>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressLine>
																					</xsl:for-each>
																					<xsl:for-each select="com:PostalCode">
																						<AddressMailCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressMailCode>
																					</xsl:for-each>
																					<xsl:for-each select="($var22_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																						<AddressPostOfficeBox>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressPostOfficeBox>
																					</xsl:for-each>
																					<xsl:for-each select="($var22_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																						<AddressRoom>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressRoom>
																					</xsl:for-each>
																					<xsl:for-each select="($var22_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																						<AddressFloor>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressFloor>
																					</xsl:for-each>
																					<xsl:for-each select="($var22_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																						<AddressBuilding>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressBuilding>
																					</xsl:for-each>
																					<xsl:for-each select="($var22_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																						<AddressStreet>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressStreet>
																					</xsl:for-each>
																					<xsl:for-each select="com:CityName">
																						<AddressCity>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressCity>
																					</xsl:for-each>
																					<xsl:for-each select="($var21_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																						<AddressCounty>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressCounty>
																					</xsl:for-each>
																					<xsl:for-each select="($var21_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																						<AddressState>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressState>
																					</xsl:for-each>
																					<FormattedAddressCountryCode>
																						<xsl:sequence select="fn:string(com:CountryCode)"/>
																					</FormattedAddressCountryCode>
																				</FormattedAddress>
																			</xsl:for-each>
																		</Address>
																	</FormattedNameAddress>
																	<ContactInformationDetails>
																		<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																			<Phone>
																				<xsl:for-each select="@com:phoneNumberCategory">
																					<xsl:variable name="var23_resultof_vmf___inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf13_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var23_resultof_vmf___inputtoresult">
																						<xsl:attribute name="phoneKind" namespace="" select="."/>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Phone>
																		</xsl:for-each>
																		<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																			<Fax>
																				<xsl:sequence select="fn:string(.)"/>
																			</Fax>
																		</xsl:for-each>
																		<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																			<Email>
																				<xsl:sequence select="fn:string(.)"/>
																			</Email>
																		</xsl:for-each>
																		<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																			<URL>
																				<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																			</URL>
																		</xsl:for-each>
																		<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																			<OtherElectronicAddress>
																				<xsl:sequence select="fn:string(.)"/>
																			</OtherElectronicAddress>
																		</xsl:for-each>
																	</ContactInformationDetails>
																</ApplicantAddressBook>
															</xsl:for-each>
															<xsl:for-each select="dgn:Entitlement">
																<ApplicantEntitlement>
																	<xsl:for-each select="com:EntitlementNationalityCode">
																		<EntitlementNationalityCode>
																			<xsl:sequence select="fn:string(.)"/>
																		</EntitlementNationalityCode>
																	</xsl:for-each>
																	<xsl:for-each select="dgn:HabitualResidence">
																		<HabitualResidence>
																			<xsl:for-each select="dgn:HabitualResidenceCode">
																				<HabitualResidenceCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</HabitualResidenceCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:Contact">
																				<xsl:variable name="var33_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																				<HabitualResidenceAddressBook>
																					<xsl:for-each select="@com:languageCode">
																						<AddressLanguageCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressLanguageCode>
																					</xsl:for-each>
																					<FormattedNameAddress>
																						<xsl:for-each select="com:Name">
																							<xsl:variable name="var29_cur" as="node()" select="."/>
																							<xsl:variable name="var28_PersonName" as="node()*" select="com:PersonName"/>
																							<Name>
																								<FreeFormatName>
																									<FreeFormatNameDetails>
																										<xsl:for-each select="$var28_PersonName">
																											<xsl:variable name="var25_cur" as="node()" select="."/>
																											<xsl:for-each select="com:PersonFullName">
																												<FreeFormatNameLine>
																													<xsl:for-each select="$var25_cur/@com:languageCode">
																														<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</FreeFormatNameLine>
																											</xsl:for-each>
																										</xsl:for-each>
																									</FreeFormatNameDetails>
																								</FreeFormatName>
																								<xsl:for-each select="$var28_PersonName">
																									<xsl:variable name="var27_cur" as="node()" select="."/>
																									<xsl:for-each select="com:PersonStructuredName">
																										<xsl:variable name="var26_OrganizationName" as="node()*" select="$var29_cur/com:OrganizationName"/>
																										<FormattedName>
																											<xsl:for-each select="com:NamePrefix">
																												<NamePrefix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NamePrefix>
																											</xsl:for-each>
																											<xsl:for-each select="com:FirstName">
																												<FirstName>
																													<xsl:sequence select="fn:string(.)"/>
																												</FirstName>
																											</xsl:for-each>
																											<xsl:for-each select="com:MiddleName">
																												<MiddleName>
																													<xsl:sequence select="fn:string(.)"/>
																												</MiddleName>
																											</xsl:for-each>
																											<LastName>
																												<xsl:sequence select="fn:string(com:LastName)"/>
																											</LastName>
																											<xsl:for-each select="com:SecondLastName">
																												<SecondLastName>
																													<xsl:sequence select="fn:string(.)"/>
																												</SecondLastName>
																											</xsl:for-each>
																											<xsl:for-each select="com:NameSuffix">
																												<NameSuffix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSuffix>
																											</xsl:for-each>
																											<xsl:for-each select="$var26_OrganizationName">
																												<OrganizationName>
																													<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																												</OrganizationName>
																											</xsl:for-each>
																											<xsl:for-each select="($var26_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																												<OrganizationDepartment>
																													<xsl:sequence select="fn:string(.)"/>
																												</OrganizationDepartment>
																											</xsl:for-each>
																											<xsl:for-each select="$var27_cur/com:PreferredName">
																												<NameSynonym>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSynonym>
																											</xsl:for-each>
																										</FormattedName>
																									</xsl:for-each>
																								</xsl:for-each>
																							</Name>
																						</xsl:for-each>
																						<Address>
																							<FreeFormatAddress>
																								<xsl:for-each select="$var33_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																									<FreeFormatAddressLine>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</FreeFormatAddressLine>
																								</xsl:for-each>
																							</FreeFormatAddress>
																							<xsl:for-each select="$var33_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																								<xsl:variable name="var30_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																								<xsl:variable name="var31_AddressLineText" as="node()+" select="com:AddressLineText"/>
																								<FormattedAddress>
																									<xsl:for-each select="($var31_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																										<AddressLine>
																											<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																												<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																											</xsl:if>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressLine>
																									</xsl:for-each>
																									<xsl:for-each select="com:PostalCode">
																										<AddressMailCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressMailCode>
																									</xsl:for-each>
																									<xsl:for-each select="($var31_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																										<AddressPostOfficeBox>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressPostOfficeBox>
																									</xsl:for-each>
																									<xsl:for-each select="($var31_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																										<AddressRoom>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressRoom>
																									</xsl:for-each>
																									<xsl:for-each select="($var31_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																										<AddressFloor>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressFloor>
																									</xsl:for-each>
																									<xsl:for-each select="($var31_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																										<AddressBuilding>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressBuilding>
																									</xsl:for-each>
																									<xsl:for-each select="($var31_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																										<AddressStreet>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressStreet>
																									</xsl:for-each>
																									<xsl:for-each select="com:CityName">
																										<AddressCity>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCity>
																									</xsl:for-each>
																									<xsl:for-each select="($var30_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																										<AddressCounty>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCounty>
																									</xsl:for-each>
																									<xsl:for-each select="($var30_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																										<AddressState>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressState>
																									</xsl:for-each>
																									<FormattedAddressCountryCode>
																										<xsl:sequence select="fn:string(com:CountryCode)"/>
																									</FormattedAddressCountryCode>
																								</FormattedAddress>
																							</xsl:for-each>
																						</Address>
																					</FormattedNameAddress>
																					<ContactInformationDetails>
																						<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																							<Phone>
																								<xsl:for-each select="@com:phoneNumberCategory">
																									<xsl:variable name="var32_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf13_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var32_resultof_vmf___inputtoresult">
																										<xsl:attribute name="phoneKind" namespace="" select="."/>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Phone>
																						</xsl:for-each>
																						<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																							<Fax>
																								<xsl:sequence select="fn:string(.)"/>
																							</Fax>
																						</xsl:for-each>
																						<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																							<Email>
																								<xsl:sequence select="fn:string(.)"/>
																							</Email>
																						</xsl:for-each>
																						<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																							<URL>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</URL>
																						</xsl:for-each>
																						<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																							<OtherElectronicAddress>
																								<xsl:sequence select="fn:string(.)"/>
																							</OtherElectronicAddress>
																						</xsl:for-each>
																					</ContactInformationDetails>
																				</HabitualResidenceAddressBook>
																			</xsl:for-each>
																		</HabitualResidence>
																	</xsl:for-each>
																	<xsl:for-each select="com:EntitlementEstablishment">
																		<EntitlementEstablishment>
																			<EntitlementEstablishmentCode>
																				<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																			</EntitlementEstablishmentCode>
																			<xsl:for-each select="com:Contact">
																				<xsl:variable name="var42_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																				<EntitlementEstablishmentAddressBook>
																					<xsl:for-each select="@com:languageCode">
																						<AddressLanguageCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressLanguageCode>
																					</xsl:for-each>
																					<FormattedNameAddress>
																						<xsl:for-each select="com:Name">
																							<xsl:variable name="var38_cur" as="node()" select="."/>
																							<xsl:variable name="var37_PersonName" as="node()*" select="com:PersonName"/>
																							<Name>
																								<FreeFormatName>
																									<FreeFormatNameDetails>
																										<xsl:for-each select="$var37_PersonName">
																											<xsl:variable name="var34_cur" as="node()" select="."/>
																											<xsl:for-each select="com:PersonFullName">
																												<FreeFormatNameLine>
																													<xsl:for-each select="$var34_cur/@com:languageCode">
																														<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</FreeFormatNameLine>
																											</xsl:for-each>
																										</xsl:for-each>
																									</FreeFormatNameDetails>
																								</FreeFormatName>
																								<xsl:for-each select="$var37_PersonName">
																									<xsl:variable name="var36_cur" as="node()" select="."/>
																									<xsl:for-each select="com:PersonStructuredName">
																										<xsl:variable name="var35_OrganizationName" as="node()*" select="$var38_cur/com:OrganizationName"/>
																										<FormattedName>
																											<xsl:for-each select="com:NamePrefix">
																												<NamePrefix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NamePrefix>
																											</xsl:for-each>
																											<xsl:for-each select="com:FirstName">
																												<FirstName>
																													<xsl:sequence select="fn:string(.)"/>
																												</FirstName>
																											</xsl:for-each>
																											<xsl:for-each select="com:MiddleName">
																												<MiddleName>
																													<xsl:sequence select="fn:string(.)"/>
																												</MiddleName>
																											</xsl:for-each>
																											<LastName>
																												<xsl:sequence select="fn:string(com:LastName)"/>
																											</LastName>
																											<xsl:for-each select="com:SecondLastName">
																												<SecondLastName>
																													<xsl:sequence select="fn:string(.)"/>
																												</SecondLastName>
																											</xsl:for-each>
																											<xsl:for-each select="com:NameSuffix">
																												<NameSuffix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSuffix>
																											</xsl:for-each>
																											<xsl:for-each select="$var35_OrganizationName">
																												<OrganizationName>
																													<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																												</OrganizationName>
																											</xsl:for-each>
																											<xsl:for-each select="($var35_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																												<OrganizationDepartment>
																													<xsl:sequence select="fn:string(.)"/>
																												</OrganizationDepartment>
																											</xsl:for-each>
																											<xsl:for-each select="$var36_cur/com:PreferredName">
																												<NameSynonym>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSynonym>
																											</xsl:for-each>
																										</FormattedName>
																									</xsl:for-each>
																								</xsl:for-each>
																							</Name>
																						</xsl:for-each>
																						<Address>
																							<FreeFormatAddress>
																								<xsl:for-each select="$var42_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																									<FreeFormatAddressLine>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</FreeFormatAddressLine>
																								</xsl:for-each>
																							</FreeFormatAddress>
																							<xsl:for-each select="$var42_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																								<xsl:variable name="var39_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																								<xsl:variable name="var40_AddressLineText" as="node()+" select="com:AddressLineText"/>
																								<FormattedAddress>
																									<xsl:for-each select="($var40_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																										<AddressLine>
																											<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																												<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																											</xsl:if>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressLine>
																									</xsl:for-each>
																									<xsl:for-each select="com:PostalCode">
																										<AddressMailCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressMailCode>
																									</xsl:for-each>
																									<xsl:for-each select="($var40_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																										<AddressPostOfficeBox>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressPostOfficeBox>
																									</xsl:for-each>
																									<xsl:for-each select="($var40_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																										<AddressRoom>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressRoom>
																									</xsl:for-each>
																									<xsl:for-each select="($var40_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																										<AddressFloor>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressFloor>
																									</xsl:for-each>
																									<xsl:for-each select="($var40_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																										<AddressBuilding>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressBuilding>
																									</xsl:for-each>
																									<xsl:for-each select="($var40_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																										<AddressStreet>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressStreet>
																									</xsl:for-each>
																									<xsl:for-each select="com:CityName">
																										<AddressCity>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCity>
																									</xsl:for-each>
																									<xsl:for-each select="($var39_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																										<AddressCounty>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCounty>
																									</xsl:for-each>
																									<xsl:for-each select="($var39_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																										<AddressState>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressState>
																									</xsl:for-each>
																									<FormattedAddressCountryCode>
																										<xsl:sequence select="fn:string(com:CountryCode)"/>
																									</FormattedAddressCountryCode>
																								</FormattedAddress>
																							</xsl:for-each>
																						</Address>
																					</FormattedNameAddress>
																					<ContactInformationDetails>
																						<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																							<Phone>
																								<xsl:for-each select="@com:phoneNumberCategory">
																									<xsl:variable name="var41_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf13_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var41_resultof_vmf___inputtoresult">
																										<xsl:attribute name="phoneKind" namespace="" select="."/>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Phone>
																						</xsl:for-each>
																						<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																							<Fax>
																								<xsl:sequence select="fn:string(.)"/>
																							</Fax>
																						</xsl:for-each>
																						<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																							<Email>
																								<xsl:sequence select="fn:string(.)"/>
																							</Email>
																						</xsl:for-each>
																						<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																							<URL>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</URL>
																						</xsl:for-each>
																						<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																							<OtherElectronicAddress>
																								<xsl:sequence select="fn:string(.)"/>
																							</OtherElectronicAddress>
																						</xsl:for-each>
																					</ContactInformationDetails>
																				</EntitlementEstablishmentAddressBook>
																			</xsl:for-each>
																		</EntitlementEstablishment>
																	</xsl:for-each>
																	<xsl:for-each select="com:EntitlementDomiciled">
																		<EntitlementDomiciled>
																			<xsl:for-each select="com:EntitlementDomiciledCode">
																				<EntitlementDomiciledCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</EntitlementDomiciledCode>
																			</xsl:for-each>
																			<xsl:for-each select="com:Contact">
																				<xsl:variable name="var51_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																				<EntitlementDomiciledAddressBook>
																					<xsl:for-each select="@com:languageCode">
																						<AddressLanguageCode>
																							<xsl:sequence select="fn:string(.)"/>
																						</AddressLanguageCode>
																					</xsl:for-each>
																					<FormattedNameAddress>
																						<xsl:for-each select="com:Name">
																							<xsl:variable name="var47_cur" as="node()" select="."/>
																							<xsl:variable name="var46_PersonName" as="node()*" select="com:PersonName"/>
																							<Name>
																								<FreeFormatName>
																									<FreeFormatNameDetails>
																										<xsl:for-each select="$var46_PersonName">
																											<xsl:variable name="var43_cur" as="node()" select="."/>
																											<xsl:for-each select="com:PersonFullName">
																												<FreeFormatNameLine>
																													<xsl:for-each select="$var43_cur/@com:languageCode">
																														<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</FreeFormatNameLine>
																											</xsl:for-each>
																										</xsl:for-each>
																									</FreeFormatNameDetails>
																								</FreeFormatName>
																								<xsl:for-each select="$var46_PersonName">
																									<xsl:variable name="var45_cur" as="node()" select="."/>
																									<xsl:for-each select="com:PersonStructuredName">
																										<xsl:variable name="var44_OrganizationName" as="node()*" select="$var47_cur/com:OrganizationName"/>
																										<FormattedName>
																											<xsl:for-each select="com:NamePrefix">
																												<NamePrefix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NamePrefix>
																											</xsl:for-each>
																											<xsl:for-each select="com:FirstName">
																												<FirstName>
																													<xsl:sequence select="fn:string(.)"/>
																												</FirstName>
																											</xsl:for-each>
																											<xsl:for-each select="com:MiddleName">
																												<MiddleName>
																													<xsl:sequence select="fn:string(.)"/>
																												</MiddleName>
																											</xsl:for-each>
																											<LastName>
																												<xsl:sequence select="fn:string(com:LastName)"/>
																											</LastName>
																											<xsl:for-each select="com:SecondLastName">
																												<SecondLastName>
																													<xsl:sequence select="fn:string(.)"/>
																												</SecondLastName>
																											</xsl:for-each>
																											<xsl:for-each select="com:NameSuffix">
																												<NameSuffix>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSuffix>
																											</xsl:for-each>
																											<xsl:for-each select="$var44_OrganizationName">
																												<OrganizationName>
																													<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																												</OrganizationName>
																											</xsl:for-each>
																											<xsl:for-each select="($var44_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																												<OrganizationDepartment>
																													<xsl:sequence select="fn:string(.)"/>
																												</OrganizationDepartment>
																											</xsl:for-each>
																											<xsl:for-each select="$var45_cur/com:PreferredName">
																												<NameSynonym>
																													<xsl:sequence select="fn:string(.)"/>
																												</NameSynonym>
																											</xsl:for-each>
																										</FormattedName>
																									</xsl:for-each>
																								</xsl:for-each>
																							</Name>
																						</xsl:for-each>
																						<Address>
																							<FreeFormatAddress>
																								<xsl:for-each select="$var51_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																									<FreeFormatAddressLine>
																										<xsl:for-each select="@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:for-each select="@com:sequenceNumber">
																											<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</FreeFormatAddressLine>
																								</xsl:for-each>
																							</FreeFormatAddress>
																							<xsl:for-each select="$var51_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																								<xsl:variable name="var48_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																								<xsl:variable name="var49_AddressLineText" as="node()+" select="com:AddressLineText"/>
																								<FormattedAddress>
																									<xsl:for-each select="($var49_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																										<AddressLine>
																											<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																												<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																											</xsl:if>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressLine>
																									</xsl:for-each>
																									<xsl:for-each select="com:PostalCode">
																										<AddressMailCode>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressMailCode>
																									</xsl:for-each>
																									<xsl:for-each select="($var49_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																										<AddressPostOfficeBox>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressPostOfficeBox>
																									</xsl:for-each>
																									<xsl:for-each select="($var49_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																										<AddressRoom>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressRoom>
																									</xsl:for-each>
																									<xsl:for-each select="($var49_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																										<AddressFloor>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressFloor>
																									</xsl:for-each>
																									<xsl:for-each select="($var49_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																										<AddressBuilding>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressBuilding>
																									</xsl:for-each>
																									<xsl:for-each select="($var49_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																										<AddressStreet>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressStreet>
																									</xsl:for-each>
																									<xsl:for-each select="com:CityName">
																										<AddressCity>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCity>
																									</xsl:for-each>
																									<xsl:for-each select="($var48_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																										<AddressCounty>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressCounty>
																									</xsl:for-each>
																									<xsl:for-each select="($var48_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																										<AddressState>
																											<xsl:sequence select="fn:string(.)"/>
																										</AddressState>
																									</xsl:for-each>
																									<FormattedAddressCountryCode>
																										<xsl:sequence select="fn:string(com:CountryCode)"/>
																									</FormattedAddressCountryCode>
																								</FormattedAddress>
																							</xsl:for-each>
																						</Address>
																					</FormattedNameAddress>
																					<ContactInformationDetails>
																						<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																							<Phone>
																								<xsl:for-each select="@com:phoneNumberCategory">
																									<xsl:variable name="var50_resultof_vmf___inputtoresult" as="xs:string?">
																										<xsl:call-template name="vmf:vmf13_inputtoresult">
																											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																										</xsl:call-template>
																									</xsl:variable>
																									<xsl:for-each select="$var50_resultof_vmf___inputtoresult">
																										<xsl:attribute name="phoneKind" namespace="" select="."/>
																									</xsl:for-each>
																								</xsl:for-each>
																								<xsl:sequence select="fn:string(.)"/>
																							</Phone>
																						</xsl:for-each>
																						<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																							<Fax>
																								<xsl:sequence select="fn:string(.)"/>
																							</Fax>
																						</xsl:for-each>
																						<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																							<Email>
																								<xsl:sequence select="fn:string(.)"/>
																							</Email>
																						</xsl:for-each>
																						<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																							<URL>
																								<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																							</URL>
																						</xsl:for-each>
																						<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																							<OtherElectronicAddress>
																								<xsl:sequence select="fn:string(.)"/>
																							</OtherElectronicAddress>
																						</xsl:for-each>
																					</ContactInformationDetails>
																				</EntitlementDomiciledAddressBook>
																			</xsl:for-each>
																		</EntitlementDomiciled>
																	</xsl:for-each>
																</ApplicantEntitlement>
															</xsl:for-each>
															<xsl:for-each select="dgn:ApplicantContractingParty">
																<ApplicantContractingParty>
																	<xsl:sequence select="fn:string(.)"/>
																</ApplicantContractingParty>
															</xsl:for-each>
															<xsl:for-each select="com:Version">
																<ApplicantVersion>
																	<xsl:for-each select="com:VersionNumber">
																		<VersionNumber>
																			<xsl:sequence select="fn:string(.)"/>
																		</VersionNumber>
																	</xsl:for-each>
																	<xsl:for-each select="com:VersionDate">
																		<VersionDate>
																			<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																		</VersionDate>
																	</xsl:for-each>
																	<xsl:for-each select="com:VersionDateTime">
																		<VersionDateTime>
																			<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																		</VersionDateTime>
																	</xsl:for-each>
																	<xsl:for-each select="com:CommentText">
																		<Comment>
																			<xsl:for-each select="@com:languageCode">
																				<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																			</xsl:for-each>
																			<xsl:sequence select="fn:string(.)"/>
																		</Comment>
																	</xsl:for-each>
																</ApplicantVersion>
															</xsl:for-each>
														</Applicant>
													</xsl:for-each>
												</ApplicantDetails>
												<xsl:for-each select="com:RepresentativeBag">
													<RepresentativeDetails>
														<xsl:for-each select="com:Representative">
															<Representative>
																<xsl:for-each select="@com:operationCategory">
																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="com:PartyIdentifier">
																	<RepresentativeIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIdentifier>
																</xsl:for-each>
																<xsl:for-each select="@com:sequenceNumber">
																	<RepresentativeSequenceNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</RepresentativeSequenceNumber>
																</xsl:for-each>
																<xsl:for-each select="com:RepresentativeCategory">
																	<xsl:variable name="var53_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf14_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var53_resultof_vmf___inputtoresult">
																		<RepresentativeKindCode>
																			<xsl:sequence select="."/>
																		</RepresentativeKindCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:NationalityCode">
																	<RepresentativeNationalityCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeNationalityCode>
																</xsl:for-each>
																<xsl:for-each select="com:LegalEntityName">
																	<RepresentativeLegalEntity>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeLegalEntity>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationCountryCode">
																	<RepresentativeIncorporationCountryCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIncorporationCountryCode>
																</xsl:for-each>
																<xsl:for-each select="com:IncorporationState">
																	<RepresentativeIncorporationState>
																		<xsl:sequence select="fn:string(.)"/>
																	</RepresentativeIncorporationState>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var62_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																	<RepresentativeAddressBook>
																		<xsl:for-each select="@com:languageCode">
																			<AddressLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</AddressLanguageCode>
																		</xsl:for-each>
																		<FormattedNameAddress>
																			<xsl:for-each select="com:Name">
																				<xsl:variable name="var58_cur" as="node()" select="."/>
																				<xsl:variable name="var57_PersonName" as="node()*" select="com:PersonName"/>
																				<Name>
																					<FreeFormatName>
																						<FreeFormatNameDetails>
																							<xsl:for-each select="$var57_PersonName">
																								<xsl:variable name="var54_cur" as="node()" select="."/>
																								<xsl:for-each select="com:PersonFullName">
																									<FreeFormatNameLine>
																										<xsl:for-each select="$var54_cur/@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</FreeFormatNameLine>
																								</xsl:for-each>
																							</xsl:for-each>
																						</FreeFormatNameDetails>
																					</FreeFormatName>
																					<xsl:for-each select="$var57_PersonName">
																						<xsl:variable name="var56_cur" as="node()" select="."/>
																						<xsl:for-each select="com:PersonStructuredName">
																							<xsl:variable name="var55_OrganizationName" as="node()*" select="$var58_cur/com:OrganizationName"/>
																							<FormattedName>
																								<xsl:for-each select="com:NamePrefix">
																									<NamePrefix>
																										<xsl:sequence select="fn:string(.)"/>
																									</NamePrefix>
																								</xsl:for-each>
																								<xsl:for-each select="com:FirstName">
																									<FirstName>
																										<xsl:sequence select="fn:string(.)"/>
																									</FirstName>
																								</xsl:for-each>
																								<xsl:for-each select="com:MiddleName">
																									<MiddleName>
																										<xsl:sequence select="fn:string(.)"/>
																									</MiddleName>
																								</xsl:for-each>
																								<LastName>
																									<xsl:sequence select="fn:string(com:LastName)"/>
																								</LastName>
																								<xsl:for-each select="com:SecondLastName">
																									<SecondLastName>
																										<xsl:sequence select="fn:string(.)"/>
																									</SecondLastName>
																								</xsl:for-each>
																								<xsl:for-each select="com:NameSuffix">
																									<NameSuffix>
																										<xsl:sequence select="fn:string(.)"/>
																									</NameSuffix>
																								</xsl:for-each>
																								<xsl:for-each select="$var55_OrganizationName">
																									<OrganizationName>
																										<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																									</OrganizationName>
																								</xsl:for-each>
																								<xsl:for-each select="($var55_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																									<OrganizationDepartment>
																										<xsl:sequence select="fn:string(.)"/>
																									</OrganizationDepartment>
																								</xsl:for-each>
																								<xsl:for-each select="$var56_cur/com:PreferredName">
																									<NameSynonym>
																										<xsl:sequence select="fn:string(.)"/>
																									</NameSynonym>
																								</xsl:for-each>
																							</FormattedName>
																						</xsl:for-each>
																					</xsl:for-each>
																				</Name>
																			</xsl:for-each>
																			<Address>
																				<FreeFormatAddress>
																					<xsl:for-each select="$var62_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																						<FreeFormatAddressLine>
																							<xsl:for-each select="@com:languageCode">
																								<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:for-each select="@com:sequenceNumber">
																								<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</FreeFormatAddressLine>
																					</xsl:for-each>
																				</FreeFormatAddress>
																				<xsl:for-each select="$var62_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																					<xsl:variable name="var59_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																					<xsl:variable name="var60_AddressLineText" as="node()+" select="com:AddressLineText"/>
																					<FormattedAddress>
																						<xsl:for-each select="($var60_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																							<AddressLine>
																								<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																								</xsl:if>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressLine>
																						</xsl:for-each>
																						<xsl:for-each select="com:PostalCode">
																							<AddressMailCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressMailCode>
																						</xsl:for-each>
																						<xsl:for-each select="($var60_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																							<AddressPostOfficeBox>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressPostOfficeBox>
																						</xsl:for-each>
																						<xsl:for-each select="($var60_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																							<AddressRoom>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressRoom>
																						</xsl:for-each>
																						<xsl:for-each select="($var60_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																							<AddressFloor>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressFloor>
																						</xsl:for-each>
																						<xsl:for-each select="($var60_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																							<AddressBuilding>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressBuilding>
																						</xsl:for-each>
																						<xsl:for-each select="($var60_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																							<AddressStreet>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressStreet>
																						</xsl:for-each>
																						<xsl:for-each select="com:CityName">
																							<AddressCity>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressCity>
																						</xsl:for-each>
																						<xsl:for-each select="($var59_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																							<AddressCounty>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressCounty>
																						</xsl:for-each>
																						<xsl:for-each select="($var59_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																							<AddressState>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressState>
																						</xsl:for-each>
																						<FormattedAddressCountryCode>
																							<xsl:sequence select="fn:string(com:CountryCode)"/>
																						</FormattedAddressCountryCode>
																					</FormattedAddress>
																				</xsl:for-each>
																			</Address>
																		</FormattedNameAddress>
																		<ContactInformationDetails>
																			<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																				<Phone>
																					<xsl:for-each select="@com:phoneNumberCategory">
																						<xsl:variable name="var61_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf13_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var61_resultof_vmf___inputtoresult">
																							<xsl:attribute name="phoneKind" namespace="" select="."/>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</Phone>
																			</xsl:for-each>
																			<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																				<Fax>
																					<xsl:sequence select="fn:string(.)"/>
																				</Fax>
																			</xsl:for-each>
																			<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																				<Email>
																					<xsl:sequence select="fn:string(.)"/>
																				</Email>
																			</xsl:for-each>
																			<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																				<URL>
																					<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																				</URL>
																			</xsl:for-each>
																			<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																				<OtherElectronicAddress>
																					<xsl:sequence select="fn:string(.)"/>
																				</OtherElectronicAddress>
																			</xsl:for-each>
																		</ContactInformationDetails>
																	</RepresentativeAddressBook>
																</xsl:for-each>
																<xsl:for-each select="com:Version">
																	<RepresentativeVersion>
																		<xsl:for-each select="com:VersionNumber">
																			<VersionNumber>
																				<xsl:sequence select="fn:string(.)"/>
																			</VersionNumber>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDate">
																			<VersionDate>
																				<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																			</VersionDate>
																		</xsl:for-each>
																		<xsl:for-each select="com:VersionDateTime">
																			<VersionDateTime>
																				<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																			</VersionDateTime>
																		</xsl:for-each>
																		<xsl:for-each select="com:CommentText">
																			<Comment>
																				<xsl:for-each select="@com:languageCode">
																					<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																				</xsl:for-each>
																				<xsl:sequence select="fn:string(.)"/>
																			</Comment>
																		</xsl:for-each>
																	</RepresentativeVersion>
																</xsl:for-each>
															</Representative>
														</xsl:for-each>
													</RepresentativeDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignerBag">
													<DesignerDetails>
														<xsl:for-each select="com:PartyIdentifierBag">
															<DesignerKey>
																<xsl:for-each select="com:PartyIdentifier">
																	<Identifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Identifier>
																</xsl:for-each>
															</DesignerKey>
														</xsl:for-each>
														<xsl:for-each select="dgn:Designer">
															<Designer>
																<xsl:for-each select="@com:operationCategory">
																	<xsl:attribute name="operationCode" namespace="" select="fn:string(.)"/>
																</xsl:for-each>
																<xsl:for-each select="com:PartyIdentifier">
																	<DesignerIdentifier>
																		<xsl:for-each select="@com:officeCode">
																			<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</DesignerIdentifier>
																</xsl:for-each>
																<xsl:for-each select="@com:sequenceNumber">
																	<DesignerSequenceNumber>
																		<xsl:sequence select="xs:string(xs:integer(fn:string(.)))"/>
																	</DesignerSequenceNumber>
																</xsl:for-each>
																<xsl:for-each select="com:NationalityCode">
																	<DesignerNationalityCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</DesignerNationalityCode>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
																<xsl:for-each select="com:Contact">
																	<xsl:variable name="var71_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																	<DesignerAddressBook>
																		<xsl:for-each select="@com:languageCode">
																			<AddressLanguageCode>
																				<xsl:sequence select="fn:string(.)"/>
																			</AddressLanguageCode>
																		</xsl:for-each>
																		<FormattedNameAddress>
																			<xsl:for-each select="com:Name">
																				<xsl:variable name="var67_cur" as="node()" select="."/>
																				<xsl:variable name="var66_PersonName" as="node()*" select="com:PersonName"/>
																				<Name>
																					<FreeFormatName>
																						<FreeFormatNameDetails>
																							<xsl:for-each select="$var66_PersonName">
																								<xsl:variable name="var63_cur" as="node()" select="."/>
																								<xsl:for-each select="com:PersonFullName">
																									<FreeFormatNameLine>
																										<xsl:for-each select="$var63_cur/@com:languageCode">
																											<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																										</xsl:for-each>
																										<xsl:sequence select="fn:string(.)"/>
																									</FreeFormatNameLine>
																								</xsl:for-each>
																							</xsl:for-each>
																						</FreeFormatNameDetails>
																					</FreeFormatName>
																					<xsl:for-each select="$var66_PersonName">
																						<xsl:variable name="var65_cur" as="node()" select="."/>
																						<xsl:for-each select="com:PersonStructuredName">
																							<xsl:variable name="var64_OrganizationName" as="node()*" select="$var67_cur/com:OrganizationName"/>
																							<FormattedName>
																								<xsl:for-each select="com:NamePrefix">
																									<NamePrefix>
																										<xsl:sequence select="fn:string(.)"/>
																									</NamePrefix>
																								</xsl:for-each>
																								<xsl:for-each select="com:FirstName">
																									<FirstName>
																										<xsl:sequence select="fn:string(.)"/>
																									</FirstName>
																								</xsl:for-each>
																								<xsl:for-each select="com:MiddleName">
																									<MiddleName>
																										<xsl:sequence select="fn:string(.)"/>
																									</MiddleName>
																								</xsl:for-each>
																								<LastName>
																									<xsl:sequence select="fn:string(com:LastName)"/>
																								</LastName>
																								<xsl:for-each select="com:SecondLastName">
																									<SecondLastName>
																										<xsl:sequence select="fn:string(.)"/>
																									</SecondLastName>
																								</xsl:for-each>
																								<xsl:for-each select="com:NameSuffix">
																									<NameSuffix>
																										<xsl:sequence select="fn:string(.)"/>
																									</NameSuffix>
																								</xsl:for-each>
																								<xsl:for-each select="$var64_OrganizationName">
																									<OrganizationName>
																										<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																									</OrganizationName>
																								</xsl:for-each>
																								<xsl:for-each select="($var64_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																									<OrganizationDepartment>
																										<xsl:sequence select="fn:string(.)"/>
																									</OrganizationDepartment>
																								</xsl:for-each>
																								<xsl:for-each select="$var65_cur/com:PreferredName">
																									<NameSynonym>
																										<xsl:sequence select="fn:string(.)"/>
																									</NameSynonym>
																								</xsl:for-each>
																							</FormattedName>
																						</xsl:for-each>
																					</xsl:for-each>
																				</Name>
																			</xsl:for-each>
																			<Address>
																				<FreeFormatAddress>
																					<xsl:for-each select="$var71_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																						<FreeFormatAddressLine>
																							<xsl:for-each select="@com:languageCode">
																								<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																							</xsl:for-each>
																							<xsl:for-each select="@com:sequenceNumber">
																								<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																							</xsl:for-each>
																							<xsl:sequence select="fn:string(.)"/>
																						</FreeFormatAddressLine>
																					</xsl:for-each>
																				</FreeFormatAddress>
																				<xsl:for-each select="$var71_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																					<xsl:variable name="var68_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																					<xsl:variable name="var69_AddressLineText" as="node()+" select="com:AddressLineText"/>
																					<FormattedAddress>
																						<xsl:for-each select="($var69_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																							<AddressLine>
																								<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																									<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																								</xsl:if>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressLine>
																						</xsl:for-each>
																						<xsl:for-each select="com:PostalCode">
																							<AddressMailCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressMailCode>
																						</xsl:for-each>
																						<xsl:for-each select="($var69_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																							<AddressPostOfficeBox>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressPostOfficeBox>
																						</xsl:for-each>
																						<xsl:for-each select="($var69_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																							<AddressRoom>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressRoom>
																						</xsl:for-each>
																						<xsl:for-each select="($var69_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																							<AddressFloor>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressFloor>
																						</xsl:for-each>
																						<xsl:for-each select="($var69_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																							<AddressBuilding>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressBuilding>
																						</xsl:for-each>
																						<xsl:for-each select="($var69_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																							<AddressStreet>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressStreet>
																						</xsl:for-each>
																						<xsl:for-each select="com:CityName">
																							<AddressCity>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressCity>
																						</xsl:for-each>
																						<xsl:for-each select="($var68_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																							<AddressCounty>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressCounty>
																						</xsl:for-each>
																						<xsl:for-each select="($var68_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																							<AddressState>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressState>
																						</xsl:for-each>
																						<FormattedAddressCountryCode>
																							<xsl:sequence select="fn:string(com:CountryCode)"/>
																						</FormattedAddressCountryCode>
																					</FormattedAddress>
																				</xsl:for-each>
																			</Address>
																		</FormattedNameAddress>
																		<ContactInformationDetails>
																			<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																				<Phone>
																					<xsl:for-each select="@com:phoneNumberCategory">
																						<xsl:variable name="var70_resultof_vmf___inputtoresult" as="xs:string?">
																							<xsl:call-template name="vmf:vmf13_inputtoresult">
																								<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																							</xsl:call-template>
																						</xsl:variable>
																						<xsl:for-each select="$var70_resultof_vmf___inputtoresult">
																							<xsl:attribute name="phoneKind" namespace="" select="."/>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:sequence select="fn:string(.)"/>
																				</Phone>
																			</xsl:for-each>
																			<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																				<Fax>
																					<xsl:sequence select="fn:string(.)"/>
																				</Fax>
																			</xsl:for-each>
																			<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																				<Email>
																					<xsl:sequence select="fn:string(.)"/>
																				</Email>
																			</xsl:for-each>
																			<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																				<URL>
																					<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																				</URL>
																			</xsl:for-each>
																			<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																				<OtherElectronicAddress>
																					<xsl:sequence select="fn:string(.)"/>
																				</OtherElectronicAddress>
																			</xsl:for-each>
																		</ContactInformationDetails>
																	</DesignerAddressBook>
																</xsl:for-each>
															</Designer>
														</xsl:for-each>
													</DesignerDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:DesignEventBag">
													<DesignEventDetails>
														<xsl:for-each select="dgn:DesignEvent">
															<DesignEvent>
																<xsl:for-each select="dgn:DesignEventDate">
																	<DesignEventDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</DesignEventDate>
																</xsl:for-each>
																<xsl:for-each select="dgn:DesignEventDateTime">
																	<DesignEventDateTime>
																		<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																	</DesignEventDateTime>
																</xsl:for-each>
																<xsl:variable name="var72_resultof_vmf___inputtoresult" as="xs:string?">
																	<xsl:call-template name="vmf:vmf15_inputtoresult">
																		<xsl:with-param name="input" select="fn:string(dgn:DesignEventCategory)" as="xs:string"/>
																	</xsl:call-template>
																</xsl:variable>
																<xsl:for-each select="$var72_resultof_vmf___inputtoresult">
																	<DesignEventCode>
																		<xsl:sequence select="."/>
																	</DesignEventCode>
																</xsl:for-each>
																<xsl:for-each select="dgn:DesignEventResponseDate">
																	<DesignEventResponseDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</DesignEventResponseDate>
																</xsl:for-each>
																<xsl:for-each select="com:CommentText">
																	<Comment>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</Comment>
																</xsl:for-each>
															</DesignEvent>
														</xsl:for-each>
													</DesignEventDetails>
												</xsl:for-each>
												<xsl:for-each select="dgn:OppositionBag">
													<OppositionDetails>
														<xsl:for-each select="dgn:Opposition">
															<Opposition>
																<xsl:for-each select="com:OppositionIdentifier">
																	<OppositionIdentifier>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionIdentifier>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionDate">
																	<OppositionDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</OppositionDate>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionReference">
																	<OppositionReference>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionReference>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionLanguageCode">
																	<OppositionLanguageCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionLanguageCode>
																</xsl:for-each>
																<xsl:for-each select="com:ProceedingLanguageCode">
																	<ProceedingLanguageCode>
																		<xsl:sequence select="fn:string(.)"/>
																	</ProceedingLanguageCode>
																</xsl:for-each>
																<xsl:for-each select="com:EarlierRightDate">
																	<EarlierRightDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</EarlierRightDate>
																</xsl:for-each>
																<xsl:for-each select="com:EarlierRightCategory">
																	<xsl:variable name="var73_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf16_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var73_resultof_vmf___inputtoresult">
																		<EarlierRightKind>
																			<xsl:sequence select="."/>
																		</EarlierRightKind>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="dgn:OppositionBasisCategory">
																	<xsl:variable name="var74_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf17_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var74_resultof_vmf___inputtoresult">
																		<OppositionBasisCode>
																			<xsl:sequence select="."/>
																		</OppositionBasisCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionGroundsText">
																	<OppositionGroundText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionGroundText>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionExtentText">
																	<OppositionExtentText>
																		<xsl:for-each select="@com:languageCode">
																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																		</xsl:for-each>
																		<xsl:sequence select="fn:string(.)"/>
																	</OppositionExtentText>
																</xsl:for-each>
																<xsl:for-each select="dgn:OppositionCurrentStatusCategory">
																	<xsl:variable name="var75_resultof_vmf___inputtoresult" as="xs:string?">
																		<xsl:call-template name="vmf:vmf18_inputtoresult">
																			<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<xsl:for-each select="$var75_resultof_vmf___inputtoresult">
																		<OppositionCurrentStatusCode>
																			<xsl:sequence select="."/>
																		</OppositionCurrentStatusCode>
																	</xsl:for-each>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionCurrentStatusDate">
																	<OppositionCurrentStatusDate>
																		<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																	</OppositionCurrentStatusDate>
																</xsl:for-each>
																<EarlierDesignDetails>
																	<xsl:for-each select="dgn:EarlierDesignBag/dgn:EarlierDesign">
																		<EarlierDesign>
																			<xsl:for-each select="dgn:EarlierDesignCountryCode">
																				<EarlierDesignCountryCode>
																					<xsl:sequence select="fn:string(.)"/>
																				</EarlierDesignCountryCode>
																			</xsl:for-each>
																			<xsl:for-each select="dgn:EarlierDesignCategory">
																				<xsl:variable name="var76_resultof_vmf___inputtoresult" as="xs:string?">
																					<xsl:call-template name="vmf:vmf19_inputtoresult">
																						<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var76_resultof_vmf___inputtoresult">
																					<EarlierDesignKind>
																						<xsl:sequence select="."/>
																					</EarlierDesignKind>
																				</xsl:for-each>
																			</xsl:for-each>
																			<xsl:for-each select="dgn:DesignApplicationIdentifier">
																				<DesignApplicationIdentifier>
																					<xsl:sequence select="fn:string(.)"/>
																				</DesignApplicationIdentifier>
																			</xsl:for-each>
																			<xsl:for-each select="com:ApplicationDate">
																				<DesignApplicationDate>
																					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																				</DesignApplicationDate>
																			</xsl:for-each>
																			<xsl:for-each select="dgn:DesignRegistrationIdentifier">
																				<DesignRegistrationIdentifier>
																					<xsl:sequence select="fn:string(.)"/>
																				</DesignRegistrationIdentifier>
																			</xsl:for-each>
																			<xsl:for-each select="dgn:DesignRegistrationDate">
																				<DesignRegistrationDate>
																					<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																				</DesignRegistrationDate>
																			</xsl:for-each>
																			<DesignRepresentationSheetDetails>
																				<xsl:for-each select="dgn:DesignRepresentationBag/dgn:DesignRepresentation">
																					<xsl:variable name="var77_cur" as="node()" select="."/>
																					<xsl:for-each select="dgn:DesignRepresentationSheetBag/dgn:DesignRepresentationSheet">
																						<DesignRepresentationSheet>
																							<RepresentationSheetFilename>
																								<xsl:sequence select="fn:string(com:FileName)"/>
																							</RepresentationSheetFilename>
																							<xsl:for-each select="com:ImageFormatCategory">
																								<RepresentationSheetFileFormat>
																									<xsl:sequence select="fn:string(.)"/>
																								</RepresentationSheetFileFormat>
																							</xsl:for-each>
																							<xsl:for-each select="com:ColourIndicator">
																								<RepresentationSheetColourIndicator>
																									<xsl:sequence select="xs:string(xs:boolean(fn:string(.)))"/>
																								</RepresentationSheetColourIndicator>
																							</xsl:for-each>
																							<xsl:for-each select="$var77_cur/dgn:ViewBag">
																								<ViewDetails>
																									<xsl:for-each select="dgn:View">
																										<View>
																											<xsl:sequence select="()"/>
																										</View>
																									</xsl:for-each>
																								</ViewDetails>
																							</xsl:for-each>
																						</DesignRepresentationSheet>
																					</xsl:for-each>
																				</xsl:for-each>
																			</DesignRepresentationSheetDetails>
																		</EarlierDesign>
																	</xsl:for-each>
																</EarlierDesignDetails>
																<xsl:for-each select="dgn:OpponentBag">
																	<OpponentDetails>
																		<xsl:for-each select="dgn:Opponent">
																			<Opponent>
																				<xsl:for-each select="com:PartyIdentifier">
																					<OpponentIdentifier>
																						<xsl:for-each select="@com:officeCode">
																							<xsl:attribute name="identifierKindCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</OpponentIdentifier>
																				</xsl:for-each>
																				<xsl:for-each select="com:NationalityCode">
																					<OpponentNationalityCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</OpponentNationalityCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:LegalEntityName">
																					<OpponentLegalEntity>
																						<xsl:sequence select="fn:string(.)"/>
																					</OpponentLegalEntity>
																				</xsl:for-each>
																				<xsl:for-each select="com:IncorporationCountryCode">
																					<OpponentIncorporationCountryCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</OpponentIncorporationCountryCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:IncorporationState">
																					<OpponentIncorporationState>
																						<xsl:sequence select="fn:string(.)"/>
																					</OpponentIncorporationState>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																				<xsl:for-each select="com:Contact">
																					<xsl:variable name="var86_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																					<OpponentAddressBook>
																						<xsl:for-each select="@com:languageCode">
																							<AddressLanguageCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</AddressLanguageCode>
																						</xsl:for-each>
																						<FormattedNameAddress>
																							<xsl:for-each select="com:Name">
																								<xsl:variable name="var82_cur" as="node()" select="."/>
																								<xsl:variable name="var81_PersonName" as="node()*" select="com:PersonName"/>
																								<Name>
																									<FreeFormatName>
																										<FreeFormatNameDetails>
																											<xsl:for-each select="$var81_PersonName">
																												<xsl:variable name="var78_cur" as="node()" select="."/>
																												<xsl:for-each select="com:PersonFullName">
																													<FreeFormatNameLine>
																														<xsl:for-each select="$var78_cur/@com:languageCode">
																															<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																														</xsl:for-each>
																														<xsl:sequence select="fn:string(.)"/>
																													</FreeFormatNameLine>
																												</xsl:for-each>
																											</xsl:for-each>
																										</FreeFormatNameDetails>
																									</FreeFormatName>
																									<xsl:for-each select="$var81_PersonName">
																										<xsl:variable name="var80_cur" as="node()" select="."/>
																										<xsl:for-each select="com:PersonStructuredName">
																											<xsl:variable name="var79_OrganizationName" as="node()*" select="$var82_cur/com:OrganizationName"/>
																											<FormattedName>
																												<xsl:for-each select="com:NamePrefix">
																													<NamePrefix>
																														<xsl:sequence select="fn:string(.)"/>
																													</NamePrefix>
																												</xsl:for-each>
																												<xsl:for-each select="com:FirstName">
																													<FirstName>
																														<xsl:sequence select="fn:string(.)"/>
																													</FirstName>
																												</xsl:for-each>
																												<xsl:for-each select="com:MiddleName">
																													<MiddleName>
																														<xsl:sequence select="fn:string(.)"/>
																													</MiddleName>
																												</xsl:for-each>
																												<LastName>
																													<xsl:sequence select="fn:string(com:LastName)"/>
																												</LastName>
																												<xsl:for-each select="com:SecondLastName">
																													<SecondLastName>
																														<xsl:sequence select="fn:string(.)"/>
																													</SecondLastName>
																												</xsl:for-each>
																												<xsl:for-each select="com:NameSuffix">
																													<NameSuffix>
																														<xsl:sequence select="fn:string(.)"/>
																													</NameSuffix>
																												</xsl:for-each>
																												<xsl:for-each select="$var79_OrganizationName">
																													<OrganizationName>
																														<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																													</OrganizationName>
																												</xsl:for-each>
																												<xsl:for-each select="($var79_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																													<OrganizationDepartment>
																														<xsl:sequence select="fn:string(.)"/>
																													</OrganizationDepartment>
																												</xsl:for-each>
																												<xsl:for-each select="$var80_cur/com:PreferredName">
																													<NameSynonym>
																														<xsl:sequence select="fn:string(.)"/>
																													</NameSynonym>
																												</xsl:for-each>
																											</FormattedName>
																										</xsl:for-each>
																									</xsl:for-each>
																								</Name>
																							</xsl:for-each>
																							<Address>
																								<FreeFormatAddress>
																									<xsl:for-each select="$var86_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																										<FreeFormatAddressLine>
																											<xsl:for-each select="@com:languageCode">
																												<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																											</xsl:for-each>
																											<xsl:for-each select="@com:sequenceNumber">
																												<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																											</xsl:for-each>
																											<xsl:sequence select="fn:string(.)"/>
																										</FreeFormatAddressLine>
																									</xsl:for-each>
																								</FreeFormatAddress>
																								<xsl:for-each select="$var86_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																									<xsl:variable name="var83_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																									<xsl:variable name="var84_AddressLineText" as="node()+" select="com:AddressLineText"/>
																									<FormattedAddress>
																										<xsl:for-each select="($var84_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																											<AddressLine>
																												<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																													<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																												</xsl:if>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressLine>
																										</xsl:for-each>
																										<xsl:for-each select="com:PostalCode">
																											<AddressMailCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressMailCode>
																										</xsl:for-each>
																										<xsl:for-each select="($var84_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																											<AddressPostOfficeBox>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressPostOfficeBox>
																										</xsl:for-each>
																										<xsl:for-each select="($var84_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																											<AddressRoom>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressRoom>
																										</xsl:for-each>
																										<xsl:for-each select="($var84_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																											<AddressFloor>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressFloor>
																										</xsl:for-each>
																										<xsl:for-each select="($var84_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																											<AddressBuilding>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressBuilding>
																										</xsl:for-each>
																										<xsl:for-each select="($var84_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																											<AddressStreet>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressStreet>
																										</xsl:for-each>
																										<xsl:for-each select="com:CityName">
																											<AddressCity>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressCity>
																										</xsl:for-each>
																										<xsl:for-each select="($var83_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																											<AddressCounty>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressCounty>
																										</xsl:for-each>
																										<xsl:for-each select="($var83_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																											<AddressState>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressState>
																										</xsl:for-each>
																										<FormattedAddressCountryCode>
																											<xsl:sequence select="fn:string(com:CountryCode)"/>
																										</FormattedAddressCountryCode>
																									</FormattedAddress>
																								</xsl:for-each>
																							</Address>
																						</FormattedNameAddress>
																						<ContactInformationDetails>
																							<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																								<Phone>
																									<xsl:for-each select="@com:phoneNumberCategory">
																										<xsl:variable name="var85_resultof_vmf___inputtoresult" as="xs:string?">
																											<xsl:call-template name="vmf:vmf13_inputtoresult">
																												<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																											</xsl:call-template>
																										</xsl:variable>
																										<xsl:for-each select="$var85_resultof_vmf___inputtoresult">
																											<xsl:attribute name="phoneKind" namespace="" select="."/>
																										</xsl:for-each>
																									</xsl:for-each>
																									<xsl:sequence select="fn:string(.)"/>
																								</Phone>
																							</xsl:for-each>
																							<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																								<Fax>
																									<xsl:sequence select="fn:string(.)"/>
																								</Fax>
																							</xsl:for-each>
																							<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																								<Email>
																									<xsl:sequence select="fn:string(.)"/>
																								</Email>
																							</xsl:for-each>
																							<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																								<URL>
																									<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																								</URL>
																							</xsl:for-each>
																							<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																								<OtherElectronicAddress>
																									<xsl:sequence select="fn:string(.)"/>
																								</OtherElectronicAddress>
																							</xsl:for-each>
																						</ContactInformationDetails>
																					</OpponentAddressBook>
																				</xsl:for-each>
																				<xsl:for-each select="dgn:Entitlement">
																					<OpponentEntitlement>
																						<xsl:for-each select="com:EntitlementNationalityCode">
																							<EntitlementNationalityCode>
																								<xsl:sequence select="fn:string(.)"/>
																							</EntitlementNationalityCode>
																						</xsl:for-each>
																						<xsl:for-each select="dgn:HabitualResidence">
																							<HabitualResidence>
																								<xsl:for-each select="dgn:HabitualResidenceCode">
																									<HabitualResidenceCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</HabitualResidenceCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var95_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																									<HabitualResidenceAddressBook>
																										<xsl:for-each select="@com:languageCode">
																											<AddressLanguageCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressLanguageCode>
																										</xsl:for-each>
																										<FormattedNameAddress>
																											<xsl:for-each select="com:Name">
																												<xsl:variable name="var91_cur" as="node()" select="."/>
																												<xsl:variable name="var90_PersonName" as="node()*" select="com:PersonName"/>
																												<Name>
																													<FreeFormatName>
																														<FreeFormatNameDetails>
																															<xsl:for-each select="$var90_PersonName">
																																<xsl:variable name="var87_cur" as="node()" select="."/>
																																<xsl:for-each select="com:PersonFullName">
																																	<FreeFormatNameLine>
																																		<xsl:for-each select="$var87_cur/@com:languageCode">
																																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FreeFormatNameLine>
																																</xsl:for-each>
																															</xsl:for-each>
																														</FreeFormatNameDetails>
																													</FreeFormatName>
																													<xsl:for-each select="$var90_PersonName">
																														<xsl:variable name="var89_cur" as="node()" select="."/>
																														<xsl:for-each select="com:PersonStructuredName">
																															<xsl:variable name="var88_OrganizationName" as="node()*" select="$var91_cur/com:OrganizationName"/>
																															<FormattedName>
																																<xsl:for-each select="com:NamePrefix">
																																	<NamePrefix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NamePrefix>
																																</xsl:for-each>
																																<xsl:for-each select="com:FirstName">
																																	<FirstName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FirstName>
																																</xsl:for-each>
																																<xsl:for-each select="com:MiddleName">
																																	<MiddleName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</MiddleName>
																																</xsl:for-each>
																																<LastName>
																																	<xsl:sequence select="fn:string(com:LastName)"/>
																																</LastName>
																																<xsl:for-each select="com:SecondLastName">
																																	<SecondLastName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</SecondLastName>
																																</xsl:for-each>
																																<xsl:for-each select="com:NameSuffix">
																																	<NameSuffix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSuffix>
																																</xsl:for-each>
																																<xsl:for-each select="$var88_OrganizationName">
																																	<OrganizationName>
																																		<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																																	</OrganizationName>
																																</xsl:for-each>
																																<xsl:for-each select="($var88_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																																	<OrganizationDepartment>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</OrganizationDepartment>
																																</xsl:for-each>
																																<xsl:for-each select="$var89_cur/com:PreferredName">
																																	<NameSynonym>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSynonym>
																																</xsl:for-each>
																															</FormattedName>
																														</xsl:for-each>
																													</xsl:for-each>
																												</Name>
																											</xsl:for-each>
																											<Address>
																												<FreeFormatAddress>
																													<xsl:for-each select="$var95_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																														<FreeFormatAddressLine>
																															<xsl:for-each select="@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:for-each select="@com:sequenceNumber">
																																<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string(.)"/>
																														</FreeFormatAddressLine>
																													</xsl:for-each>
																												</FreeFormatAddress>
																												<xsl:for-each select="$var95_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																													<xsl:variable name="var92_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																													<xsl:variable name="var93_AddressLineText" as="node()+" select="com:AddressLineText"/>
																													<FormattedAddress>
																														<xsl:for-each select="($var93_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																															<AddressLine>
																																<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																																	<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																																</xsl:if>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressLine>
																														</xsl:for-each>
																														<xsl:for-each select="com:PostalCode">
																															<AddressMailCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressMailCode>
																														</xsl:for-each>
																														<xsl:for-each select="($var93_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																															<AddressPostOfficeBox>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressPostOfficeBox>
																														</xsl:for-each>
																														<xsl:for-each select="($var93_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																															<AddressRoom>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressRoom>
																														</xsl:for-each>
																														<xsl:for-each select="($var93_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																															<AddressFloor>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressFloor>
																														</xsl:for-each>
																														<xsl:for-each select="($var93_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																															<AddressBuilding>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressBuilding>
																														</xsl:for-each>
																														<xsl:for-each select="($var93_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																															<AddressStreet>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressStreet>
																														</xsl:for-each>
																														<xsl:for-each select="com:CityName">
																															<AddressCity>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCity>
																														</xsl:for-each>
																														<xsl:for-each select="($var92_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																															<AddressCounty>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCounty>
																														</xsl:for-each>
																														<xsl:for-each select="($var92_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																															<AddressState>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressState>
																														</xsl:for-each>
																														<FormattedAddressCountryCode>
																															<xsl:sequence select="fn:string(com:CountryCode)"/>
																														</FormattedAddressCountryCode>
																													</FormattedAddress>
																												</xsl:for-each>
																											</Address>
																										</FormattedNameAddress>
																										<ContactInformationDetails>
																											<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																												<Phone>
																													<xsl:for-each select="@com:phoneNumberCategory">
																														<xsl:variable name="var94_resultof_vmf___inputtoresult" as="xs:string?">
																															<xsl:call-template name="vmf:vmf13_inputtoresult">
																																<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																															</xsl:call-template>
																														</xsl:variable>
																														<xsl:for-each select="$var94_resultof_vmf___inputtoresult">
																															<xsl:attribute name="phoneKind" namespace="" select="."/>
																														</xsl:for-each>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</Phone>
																											</xsl:for-each>
																											<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																												<Fax>
																													<xsl:sequence select="fn:string(.)"/>
																												</Fax>
																											</xsl:for-each>
																											<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																												<Email>
																													<xsl:sequence select="fn:string(.)"/>
																												</Email>
																											</xsl:for-each>
																											<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																												<URL>
																													<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																												</URL>
																											</xsl:for-each>
																											<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																												<OtherElectronicAddress>
																													<xsl:sequence select="fn:string(.)"/>
																												</OtherElectronicAddress>
																											</xsl:for-each>
																										</ContactInformationDetails>
																									</HabitualResidenceAddressBook>
																								</xsl:for-each>
																							</HabitualResidence>
																						</xsl:for-each>
																						<xsl:for-each select="com:EntitlementEstablishment">
																							<EntitlementEstablishment>
																								<EntitlementEstablishmentCode>
																									<xsl:sequence select="fn:string(com:EntitlementEstablishmentCode)"/>
																								</EntitlementEstablishmentCode>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var104_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																									<EntitlementEstablishmentAddressBook>
																										<xsl:for-each select="@com:languageCode">
																											<AddressLanguageCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressLanguageCode>
																										</xsl:for-each>
																										<FormattedNameAddress>
																											<xsl:for-each select="com:Name">
																												<xsl:variable name="var100_cur" as="node()" select="."/>
																												<xsl:variable name="var99_PersonName" as="node()*" select="com:PersonName"/>
																												<Name>
																													<FreeFormatName>
																														<FreeFormatNameDetails>
																															<xsl:for-each select="$var99_PersonName">
																																<xsl:variable name="var96_cur" as="node()" select="."/>
																																<xsl:for-each select="com:PersonFullName">
																																	<FreeFormatNameLine>
																																		<xsl:for-each select="$var96_cur/@com:languageCode">
																																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FreeFormatNameLine>
																																</xsl:for-each>
																															</xsl:for-each>
																														</FreeFormatNameDetails>
																													</FreeFormatName>
																													<xsl:for-each select="$var99_PersonName">
																														<xsl:variable name="var98_cur" as="node()" select="."/>
																														<xsl:for-each select="com:PersonStructuredName">
																															<xsl:variable name="var97_OrganizationName" as="node()*" select="$var100_cur/com:OrganizationName"/>
																															<FormattedName>
																																<xsl:for-each select="com:NamePrefix">
																																	<NamePrefix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NamePrefix>
																																</xsl:for-each>
																																<xsl:for-each select="com:FirstName">
																																	<FirstName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FirstName>
																																</xsl:for-each>
																																<xsl:for-each select="com:MiddleName">
																																	<MiddleName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</MiddleName>
																																</xsl:for-each>
																																<LastName>
																																	<xsl:sequence select="fn:string(com:LastName)"/>
																																</LastName>
																																<xsl:for-each select="com:SecondLastName">
																																	<SecondLastName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</SecondLastName>
																																</xsl:for-each>
																																<xsl:for-each select="com:NameSuffix">
																																	<NameSuffix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSuffix>
																																</xsl:for-each>
																																<xsl:for-each select="$var97_OrganizationName">
																																	<OrganizationName>
																																		<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																																	</OrganizationName>
																																</xsl:for-each>
																																<xsl:for-each select="($var97_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																																	<OrganizationDepartment>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</OrganizationDepartment>
																																</xsl:for-each>
																																<xsl:for-each select="$var98_cur/com:PreferredName">
																																	<NameSynonym>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSynonym>
																																</xsl:for-each>
																															</FormattedName>
																														</xsl:for-each>
																													</xsl:for-each>
																												</Name>
																											</xsl:for-each>
																											<Address>
																												<FreeFormatAddress>
																													<xsl:for-each select="$var104_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																														<FreeFormatAddressLine>
																															<xsl:for-each select="@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:for-each select="@com:sequenceNumber">
																																<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string(.)"/>
																														</FreeFormatAddressLine>
																													</xsl:for-each>
																												</FreeFormatAddress>
																												<xsl:for-each select="$var104_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																													<xsl:variable name="var101_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																													<xsl:variable name="var102_AddressLineText" as="node()+" select="com:AddressLineText"/>
																													<FormattedAddress>
																														<xsl:for-each select="($var102_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																															<AddressLine>
																																<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																																	<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																																</xsl:if>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressLine>
																														</xsl:for-each>
																														<xsl:for-each select="com:PostalCode">
																															<AddressMailCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressMailCode>
																														</xsl:for-each>
																														<xsl:for-each select="($var102_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																															<AddressPostOfficeBox>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressPostOfficeBox>
																														</xsl:for-each>
																														<xsl:for-each select="($var102_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																															<AddressRoom>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressRoom>
																														</xsl:for-each>
																														<xsl:for-each select="($var102_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																															<AddressFloor>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressFloor>
																														</xsl:for-each>
																														<xsl:for-each select="($var102_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																															<AddressBuilding>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressBuilding>
																														</xsl:for-each>
																														<xsl:for-each select="($var102_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																															<AddressStreet>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressStreet>
																														</xsl:for-each>
																														<xsl:for-each select="com:CityName">
																															<AddressCity>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCity>
																														</xsl:for-each>
																														<xsl:for-each select="($var101_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																															<AddressCounty>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCounty>
																														</xsl:for-each>
																														<xsl:for-each select="($var101_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																															<AddressState>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressState>
																														</xsl:for-each>
																														<FormattedAddressCountryCode>
																															<xsl:sequence select="fn:string(com:CountryCode)"/>
																														</FormattedAddressCountryCode>
																													</FormattedAddress>
																												</xsl:for-each>
																											</Address>
																										</FormattedNameAddress>
																										<ContactInformationDetails>
																											<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																												<Phone>
																													<xsl:for-each select="@com:phoneNumberCategory">
																														<xsl:variable name="var103_resultof_vmf___inputtoresult" as="xs:string?">
																															<xsl:call-template name="vmf:vmf13_inputtoresult">
																																<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																															</xsl:call-template>
																														</xsl:variable>
																														<xsl:for-each select="$var103_resultof_vmf___inputtoresult">
																															<xsl:attribute name="phoneKind" namespace="" select="."/>
																														</xsl:for-each>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</Phone>
																											</xsl:for-each>
																											<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																												<Fax>
																													<xsl:sequence select="fn:string(.)"/>
																												</Fax>
																											</xsl:for-each>
																											<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																												<Email>
																													<xsl:sequence select="fn:string(.)"/>
																												</Email>
																											</xsl:for-each>
																											<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																												<URL>
																													<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																												</URL>
																											</xsl:for-each>
																											<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																												<OtherElectronicAddress>
																													<xsl:sequence select="fn:string(.)"/>
																												</OtherElectronicAddress>
																											</xsl:for-each>
																										</ContactInformationDetails>
																									</EntitlementEstablishmentAddressBook>
																								</xsl:for-each>
																							</EntitlementEstablishment>
																						</xsl:for-each>
																						<xsl:for-each select="com:EntitlementDomiciled">
																							<EntitlementDomiciled>
																								<xsl:for-each select="com:EntitlementDomiciledCode">
																									<EntitlementDomiciledCode>
																										<xsl:sequence select="fn:string(.)"/>
																									</EntitlementDomiciledCode>
																								</xsl:for-each>
																								<xsl:for-each select="com:Contact">
																									<xsl:variable name="var113_PostalAddressBag" as="node()?" select="com:PostalAddressBag"/>
																									<EntitlementDomiciledAddressBook>
																										<xsl:for-each select="@com:languageCode">
																											<AddressLanguageCode>
																												<xsl:sequence select="fn:string(.)"/>
																											</AddressLanguageCode>
																										</xsl:for-each>
																										<FormattedNameAddress>
																											<xsl:for-each select="com:Name">
																												<xsl:variable name="var109_cur" as="node()" select="."/>
																												<xsl:variable name="var108_PersonName" as="node()*" select="com:PersonName"/>
																												<Name>
																													<FreeFormatName>
																														<FreeFormatNameDetails>
																															<xsl:for-each select="$var108_PersonName">
																																<xsl:variable name="var105_cur" as="node()" select="."/>
																																<xsl:for-each select="com:PersonFullName">
																																	<FreeFormatNameLine>
																																		<xsl:for-each select="$var105_cur/@com:languageCode">
																																			<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																																		</xsl:for-each>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FreeFormatNameLine>
																																</xsl:for-each>
																															</xsl:for-each>
																														</FreeFormatNameDetails>
																													</FreeFormatName>
																													<xsl:for-each select="$var108_PersonName">
																														<xsl:variable name="var107_cur" as="node()" select="."/>
																														<xsl:for-each select="com:PersonStructuredName">
																															<xsl:variable name="var106_OrganizationName" as="node()*" select="$var109_cur/com:OrganizationName"/>
																															<FormattedName>
																																<xsl:for-each select="com:NamePrefix">
																																	<NamePrefix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NamePrefix>
																																</xsl:for-each>
																																<xsl:for-each select="com:FirstName">
																																	<FirstName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</FirstName>
																																</xsl:for-each>
																																<xsl:for-each select="com:MiddleName">
																																	<MiddleName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</MiddleName>
																																</xsl:for-each>
																																<LastName>
																																	<xsl:sequence select="fn:string(com:LastName)"/>
																																</LastName>
																																<xsl:for-each select="com:SecondLastName">
																																	<SecondLastName>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</SecondLastName>
																																</xsl:for-each>
																																<xsl:for-each select="com:NameSuffix">
																																	<NameSuffix>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSuffix>
																																</xsl:for-each>
																																<xsl:for-each select="$var106_OrganizationName">
																																	<OrganizationName>
																																		<xsl:sequence select="fn:string(com:OrganizationStandardName)"/>
																																	</OrganizationName>
																																</xsl:for-each>
																																<xsl:for-each select="($var106_OrganizationName/com:OrganizationOtherName)[fn:exists((./@com:organizationNameCategory)[(fn:string(.) = 'Department')])]">
																																	<OrganizationDepartment>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</OrganizationDepartment>
																																</xsl:for-each>
																																<xsl:for-each select="$var107_cur/com:PreferredName">
																																	<NameSynonym>
																																		<xsl:sequence select="fn:string(.)"/>
																																	</NameSynonym>
																																</xsl:for-each>
																															</FormattedName>
																														</xsl:for-each>
																													</xsl:for-each>
																												</Name>
																											</xsl:for-each>
																											<Address>
																												<FreeFormatAddress>
																													<xsl:for-each select="$var113_PostalAddressBag/com:PostalAddress/com:PostalAddressText">
																														<FreeFormatAddressLine>
																															<xsl:for-each select="@com:languageCode">
																																<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																															</xsl:for-each>
																															<xsl:for-each select="@com:sequenceNumber">
																																<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																															</xsl:for-each>
																															<xsl:sequence select="fn:string(.)"/>
																														</FreeFormatAddressLine>
																													</xsl:for-each>
																												</FreeFormatAddress>
																												<xsl:for-each select="$var113_PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
																													<xsl:variable name="var110_GeographicRegionName" as="node()*" select="com:GeographicRegionName"/>
																													<xsl:variable name="var111_AddressLineText" as="node()+" select="com:AddressLineText"/>
																													<FormattedAddress>
																														<xsl:for-each select="($var111_AddressLineText)[fn:not(fn:exists(@com:addressLineCategory))]">
																															<AddressLine>
																																<xsl:if test="fn:not(fn:exists(@com:addressLineCategory))">
																																	<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(@com:sequenceNumber)))"/>
																																</xsl:if>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressLine>
																														</xsl:for-each>
																														<xsl:for-each select="com:PostalCode">
																															<AddressMailCode>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressMailCode>
																														</xsl:for-each>
																														<xsl:for-each select="($var111_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Post office box')])]">
																															<AddressPostOfficeBox>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressPostOfficeBox>
																														</xsl:for-each>
																														<xsl:for-each select="($var111_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Room')])]">
																															<AddressRoom>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressRoom>
																														</xsl:for-each>
																														<xsl:for-each select="($var111_AddressLineText/@com:addressLineCategory)[(fn:string(.) = 'Floor')]">
																															<AddressFloor>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressFloor>
																														</xsl:for-each>
																														<xsl:for-each select="($var111_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Building')])]">
																															<AddressBuilding>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressBuilding>
																														</xsl:for-each>
																														<xsl:for-each select="($var111_AddressLineText)[fn:exists((./@com:addressLineCategory)[(fn:string(.) = 'Street')])]">
																															<AddressStreet>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressStreet>
																														</xsl:for-each>
																														<xsl:for-each select="com:CityName">
																															<AddressCity>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCity>
																														</xsl:for-each>
																														<xsl:for-each select="($var110_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'County')])]">
																															<AddressCounty>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressCounty>
																														</xsl:for-each>
																														<xsl:for-each select="($var110_GeographicRegionName)[fn:exists((./@com:geographicRegionCategory)[(fn:string(.) = 'State')])]">
																															<AddressState>
																																<xsl:sequence select="fn:string(.)"/>
																															</AddressState>
																														</xsl:for-each>
																														<FormattedAddressCountryCode>
																															<xsl:sequence select="fn:string(com:CountryCode)"/>
																														</FormattedAddressCountryCode>
																													</FormattedAddress>
																												</xsl:for-each>
																											</Address>
																										</FormattedNameAddress>
																										<ContactInformationDetails>
																											<xsl:for-each select="com:PhoneNumberBag/com:PhoneNumber">
																												<Phone>
																													<xsl:for-each select="@com:phoneNumberCategory">
																														<xsl:variable name="var112_resultof_vmf___inputtoresult" as="xs:string?">
																															<xsl:call-template name="vmf:vmf13_inputtoresult">
																																<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																															</xsl:call-template>
																														</xsl:variable>
																														<xsl:for-each select="$var112_resultof_vmf___inputtoresult">
																															<xsl:attribute name="phoneKind" namespace="" select="."/>
																														</xsl:for-each>
																													</xsl:for-each>
																													<xsl:sequence select="fn:string(.)"/>
																												</Phone>
																											</xsl:for-each>
																											<xsl:for-each select="com:FaxNumberBag/com:FaxNumber">
																												<Fax>
																													<xsl:sequence select="fn:string(.)"/>
																												</Fax>
																											</xsl:for-each>
																											<xsl:for-each select="com:EmailAddressBag/com:EmailAddressText">
																												<Email>
																													<xsl:sequence select="fn:string(.)"/>
																												</Email>
																											</xsl:for-each>
																											<xsl:for-each select="com:WebAddressBag/com:WebAddressURI">
																												<URL>
																													<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																												</URL>
																											</xsl:for-each>
																											<xsl:for-each select="com:OtherElectronicAddressBag/com:OtherElectronicAddressText">
																												<OtherElectronicAddress>
																													<xsl:sequence select="fn:string(.)"/>
																												</OtherElectronicAddress>
																											</xsl:for-each>
																										</ContactInformationDetails>
																									</EntitlementDomiciledAddressBook>
																								</xsl:for-each>
																							</EntitlementDomiciled>
																						</xsl:for-each>
																					</OpponentEntitlement>
																				</xsl:for-each>
																			</Opponent>
																		</xsl:for-each>
																	</OpponentDetails>
																</xsl:for-each>
																<xsl:for-each select="dgn:OppositionEventBag">
																	<OppositionEventDetails>
																		<xsl:for-each select="dgn:OppositionEvent">
																			<OppositionEvent>
																				<xsl:for-each select="com:OppositionEventDate">
																					<OppositionEventDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</OppositionEventDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:OppositionEventDateTime">
																					<OppositionEventDateTime>
																						<xsl:sequence select="xs:string(xs:dateTime(fn:string(.)))"/>
																					</OppositionEventDateTime>
																				</xsl:for-each>
																				<xsl:variable name="var114_resultof_vmf___inputtoresult" as="xs:string?">
																					<xsl:call-template name="vmf:vmf20_inputtoresult">
																						<xsl:with-param name="input" select="fn:string(dgn:OppositionEventCategory)" as="xs:string"/>
																					</xsl:call-template>
																				</xsl:variable>
																				<xsl:for-each select="$var114_resultof_vmf___inputtoresult">
																					<OppositionEventCode>
																						<xsl:sequence select="."/>
																					</OppositionEventCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:OppositionEventResponseDate">
																					<OppositionEventResponseDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</OppositionEventResponseDate>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</OppositionEvent>
																		</xsl:for-each>
																	</OppositionEventDetails>
																</xsl:for-each>
																<xsl:for-each select="com:OppositionDocumentBag">
																	<OppositionDocumentDetails>
																		<xsl:for-each select="com:OppositionDocument">
																			<OppositionDocument>
																				<DocumentName>
																					<xsl:sequence select="fn:string(com:DocumentName)"/>
																				</DocumentName>
																				<xsl:for-each select="com:FileName">
																					<DocumentFilename>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentFilename>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentFormatCategory">
																					<xsl:variable name="var115_resultof_vmf__inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf8_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var115_resultof_vmf__inputtoresult">
																						<DocumentFileFormat>
																							<xsl:sequence select="."/>
																						</DocumentFileFormat>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentDate">
																					<DocumentDate>
																						<xsl:sequence select="xs:string(xs:date(fn:string(.)))"/>
																					</DocumentDate>
																				</xsl:for-each>
																				<xsl:for-each select="@com:languageCode">
																					<DocumentLanguageCode>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentLanguageCode>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentMediaCategory">
																					<xsl:variable name="var116_resultof_vmf__inputtoresult" as="xs:string?">
																						<xsl:call-template name="vmf:vmf9_inputtoresult">
																							<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
																						</xsl:call-template>
																					</xsl:variable>
																					<xsl:for-each select="$var116_resultof_vmf__inputtoresult">
																						<DocumentMedia>
																							<xsl:sequence select="."/>
																						</DocumentMedia>
																					</xsl:for-each>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentLocationURI">
																					<DocumentLocation>
																						<xsl:sequence select="xs:string(xs:anyURI(fn:string(.)))"/>
																					</DocumentLocation>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentVersion">
																					<DocumentVersion>
																						<xsl:sequence select="fn:string(.)"/>
																					</DocumentVersion>
																				</xsl:for-each>
																				<xsl:for-each select="com:DocumentSizeQuantity">
																					<DocumentSizeInByte>
																						<xsl:sequence select="xs:string(xs:integer(xs:decimal(fn:string(.))))"/>
																					</DocumentSizeInByte>
																				</xsl:for-each>
																				<xsl:for-each select="com:CommentText">
																					<Comment>
																						<xsl:for-each select="@com:languageCode">
																							<xsl:attribute name="languageCode" namespace="" select="fn:string(.)"/>
																						</xsl:for-each>
																						<xsl:for-each select="@com:sequenceNumber">
																							<xsl:attribute name="sequenceNumber" namespace="" select="xs:string(xs:integer(fn:string(.)))"/>
																						</xsl:for-each>
																						<xsl:sequence select="fn:string(.)"/>
																					</Comment>
																				</xsl:for-each>
																			</OppositionDocument>
																		</xsl:for-each>
																	</OppositionDocumentDetails>
																</xsl:for-each>
															</Opposition>
														</xsl:for-each>
													</OppositionDetails>
												</xsl:for-each>
											</Design>
										</xsl:for-each>
									</DesignDetails>
								</xsl:for-each>
							</TransactionData>
						</TransactionContentDetails>
					</DesignTransactionBody>
				</xsl:for-each>
			</xsl:for-each>
		</Transaction>
	</xsl:template>
</xsl:stylesheet>
