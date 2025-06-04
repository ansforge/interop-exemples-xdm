<?xml version="1.0" encoding="utf-8"?>
<!--
  Title : cda_asip_CANCER_PPS.xsl
  =======================================================================================================================================================
  This StyleSheet is based on the StyleSheet "Modular CDA XSL StyleSheet (cda_modular.xsl)" made by Alchuler Associates LCC.
  Below is the original declaration of Alschuler Associates LCC
  Title: Modular CDA XSL StyleSheet
  Version: 3.0
  Specification: ANSI/HL7 CDA, R2-2005  
  The current version and documentation are available at www.alschulerassociates.com/cda/?topic=cda-xsl. 
  We welcome feedback to tools@alschulerassociates.com
  The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 
  Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. 
  =======================================================================================================================================================
  Suivi des version de la feuille de style française (ANS) :
    - Version : 1.0 (06/01/2023)
  =======================================================================================================================================================
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n1="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:data="urn:asip-sante:ci-sis" xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
	xmlns:xad="http://uri.etsi.org/01903/v1.2.2#" exclude-result-prefixes="n1 xsi data ds xad">
	<xsl:output method="html" indent="yes" version="4.01" encoding="utf-8"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>

	<xsl:param name="vocFile" select="'../cda_l10n.xml'"/>
	<xsl:variable name="vocMessages" select="document($vocFile)"/>
	<xsl:param name="textlangDefault" select="'fr-fr'"/>

	<xd:doc>
		<xd:desc/>
		<xd:param name="data"/>
	</xd:doc>
	<xsl:template name="caseDown">
		<xsl:param name="data"/>
		<xsl:if test="$data">
			<xsl:value-of
				select="translate($data, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
			/>
		</xsl:if>
	</xsl:template>

	<xsl:param name="textLang">
		<xsl:choose>
			<xsl:when test="/n1:ClinicalDocument/n1:languageCode/@code">
				<xsl:value-of select="/n1:ClinicalDocument/n1:languageCode/@code"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$textlangDefault"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:variable name="textLangLowerCase">
		<xsl:call-template name="caseDown">
			<xsl:with-param name="data" select="$textLang"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="textLangDefaultLowerCase">
		<xsl:call-template name="caseDown">
			<xsl:with-param name="data" select="$textlangDefault"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="renderElement"
		select="self::n1:nonXMLBody/n1:text | self::n1:observationMedia/n1:value"/>

	<xsl:param name="limit-pdf" select="'no'"/>

	<xsl:variable name="textLangPartLowerCase" select="substring($textLangLowerCase, 1, 2)"/>

	<xsl:variable name="textLangDefaultPartLowerCase"
		select="substring($textLangDefaultLowerCase, 1, 2)"/>

	<xsl:attribute-set name="myBorder1">
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myMargin">
		<xsl:attribute name="margin-top">20px</xsl:attribute>
		<xsl:attribute name="margin-left">5px</xsl:attribute>
		<xsl:attribute name="margin-bottom">0</xsl:attribute>
		<xsl:attribute name="margin-right">5px</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border">solid 0.1mm #003366</xsl:attribute>
		<xsl:attribute name="width">99%</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock3">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="background-color">#DCF0FF</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock5">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
		<xsl:attribute name="margin-left">10px</xsl:attribute>
	</xsl:attribute-set>


	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock6">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="background-color">white</xsl:attribute>
		<xsl:attribute name="color">rgb(0,51,102)</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock7">
		<xsl:attribute name="font-size">6</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="background-color">white</xsl:attribute>
		<xsl:attribute name="color">rgb(0,51,102)</xsl:attribute>
		<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock13">
		<xsl:attribute name="padding">0px 5px 0px 5px</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="background-color">lightsteelblue</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="td_label">
		<xsl:attribute name="font-family">Verdana, Tahoma, sans-serif</xsl:attribute>
		<xsl:attribute name="font-size">10px</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="contact">
		<xsl:attribute name="background-color">silver</xsl:attribute>
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="td_label_1">
		<xsl:attribute name="font-family">Verdana, Tahoma, sans-serif</xsl:attribute>
		<xsl:attribute name="font-size">6px</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock14">
		<xsl:attribute name="font-size">7</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="myBlock15">
		<xsl:attribute name="font-size">7</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="data">
		<xsl:attribute name="font-size">6px</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="color">#003366</xsl:attribute>
		<xsl:attribute name="font-family">Verdana, Tahoma, sans-serif</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:attribute-set name="title">
		<xsl:attribute name="font-size">12px</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="width">80%</xsl:attribute>
		<xsl:attribute name="color">#003366</xsl:attribute>
	</xsl:attribute-set>

	<!-- Extension FR : PDF -->
	<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>

	<xd:doc>
		<xd:desc>
			<xd:p>Non XML Body</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:variable name="nonXML" select="//n1:ClinicalDocument/n1:component/n1:nonXMLBody"/>


	<!-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: -->
	<!--         Feuille de style XSLT de l'INCa pour PPS EN CANCEROLOGIE           -->


	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="/">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates select="n1:ClinicalDocument"/>
		</xsl:if>
		<!-- Extension FR : PDF -->
		<!-- Test si PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
				<fo:layout-master-set>
					<fo:simple-page-master margin-top="0.2in" margin-left="0.2in"
						margin-bottom="0.2in" margin-right="0.2in" master-name="first">
						<fo:region-body region-name="xsl-region-body"/>
						<fo:region-after extent="3mm" region-name="xsl-region-after"/>
					</fo:simple-page-master>
					<fo:simple-page-master margin-top="0.2in" margin-left="0.2in"
						margin-bottom="0.2in" margin-right="0.2in" master-name="rest">
						<fo:region-body margin-top="50pt" region-name="xsl-region-body"/>
						<fo:region-before extent="10mm" region-name="xsl-region-before"/>
						<fo:region-after extent="3mm" region-name="xsl-region-after"/>
					</fo:simple-page-master>
					<fo:page-sequence-master master-name="only">
						<fo:repeatable-page-master-alternatives>
							<fo:conditional-page-master-reference master-reference="first"
								page-position="first"/>
							<fo:conditional-page-master-reference master-reference="rest"
								page-position="any"/>
						</fo:repeatable-page-master-alternatives>
					</fo:page-sequence-master>
				</fo:layout-master-set>
				<fo:page-sequence master-reference="only">
					<fo:static-content flow-name="xsl-region-before">
						<fo:block text-align="start" font-size="6">
							<xsl:call-template name="show-title-header"/>
						</fo:block>
						<fo:block>
							<fo:leader leader-pattern="rule" leader-length="100%"
								rule-thickness="0.1pt"/>
						</fo:block>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after">
						<fo:block>
							<fo:leader leader-pattern="rule" leader-length="100%"
								rule-thickness="0.1pt"/>
						</fo:block>
						<fo:block text-align="end" font-size="6">
							<fo:page-number/> / <fo:page-number-citation ref-id="citation"/>
						</fo:block>
					</fo:static-content>
					<fo:flow flow-name="xsl-region-body">
						<xsl:apply-templates select="//n1:ClinicalDocument"/>
						<fo:block id="citation"/>
					</fo:flow>
				</fo:page-sequence>
				<xsl:if test="$nonXML">
					<xsl:call-template name="encodedPdf"/>
				</xsl:if>
				<xsl:for-each select="descendant::n1:observationMedia">
					<xsl:if test="n1:value[@mediaType = 'application/pdf']">
						<xsl:if
							test="not(preceding::n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
							<xsl:variable name="id" select="@ID"/>
							<xsl:variable name="value"
								select="translate(normalize-space(n1:value[@mediaType = 'application/pdf']/text()), ' ', '')"/>
							<fox:external-document content-type="pdf" id="{$id}">
								<xsl:attribute name="src">
									<xsl:value-of
										select="concat('data:', 'application/pdf', ';base64,', $value)"
									/>
								</xsl:attribute>
							</fox:external-document>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</fo:root>
		</xsl:if>
	</xsl:template>
	
	<xd:doc>
		<xd:desc/>
		<xd:param name="in"/>
		<xd:param name="part"/>
	</xd:doc>
	<xsl:template name="show-timestamp">
		<xsl:param name="in"/>
		<xsl:param name="part" select="'datetime'"/>
		
		<xsl:call-template name="formatDateTime">
			<xsl:with-param name="date" select="$in/@value"/>
			<xsl:with-param name="part" select="$part"/>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template name="show-title-header">
		<xsl:variable name="documentEffectiveTime">
			<xsl:call-template name="show-timestamp">
				<xsl:with-param name="in" select="//n1:ClinicalDocument/n1:effectiveTime"/>
			</xsl:call-template>
		</xsl:variable>
		<fo:block>
			<fo:table xsl:use-attribute-sets="myBorder1" margin-left="0.1">
				<fo:table-column column-number="1" column-width="80%"/>
				<fo:table-column column-number="2" column-width="20%"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:choose>
									<!-- CDAr2 DTr1 -->
									<xsl:when
										test="string-length(//n1:ClinicalDocument/n1:title) &gt; 0">
										<xsl:value-of select="//n1:ClinicalDocument/n1:title"/>

									</xsl:when>
									<!-- CDAr3 DTr2 -->
									<xsl:when
										test="string-length(//n1:ClinicalDocument/n1:title/@value) &gt; 0">
										<xsl:value-of select="//n1:ClinicalDocument/n1:title/@value"
										/>
									</xsl:when>
									<!-- CDAr2 DTr1 -->
									<xsl:when test="//n1:ClinicalDocument/n1:code/@displayName">
										<xsl:value-of
											select="//n1:ClinicalDocument/n1:code/@displayName"/>
									</xsl:when>
									<!-- CDAr3 DTr2 -->
									<xsl:when
										test="//n1:ClinicalDocument/n1:code/n1:displayName/@value">
										<xsl:value-of
											select="//n1:ClinicalDocument/n1:code/n1:displayName/@value"
										/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:value-of select="normalize-space($documentEffectiveTime)"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<!-- Extension FR : PDF -->
	<!-- Encoded nonXMLBody PDF -->
	<xd:doc>
		<xd:desc>
			<xd:p>Encoded PDF FILE</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:template name="encodedPdf">
		<xsl:variable name="nonXMLText"
			select="//n1:ClinicalDocument/n1:component/n1:nonXMLBody/n1:text"/>
		<xsl:variable name="value" select="normalize-space($nonXMLText/text())"/>
		<fox:external-document content-type="pdf" id="nonXmlId">
			<xsl:attribute name="src">
				<xsl:value-of select="concat('data:', $nonXMLText/@mediaType, ';base64,', $value)"/>
			</xsl:attribute>
		</fox:external-document>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:ClinicalDocument">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<html>
				<head>
					<script>
          window.onload = function() 
          {
            document.getElementById("progression-id").style.fontWeight="bold";
            document.getElementById("progression-id").style.color="black";
            var element = document.getElementById("diagnostic-table");
            element.classList.add("data");
            var phase = document.getElementById("phase-clinique");
            phase.classList.add("data");
            var cancer = document.getElementById("cancer-decouverte");
            cancer.classList.add("depistage");
            var programme = document.getElementById("programme-therapeutique");
            programme.classList.add("prog-terap");
            var programme1 = document.getElementById("proposition-therapeutique");
            programme1.classList.add("prog-terap");
            var prevention = document.getElementById("prevention-gestion");
            prevention.classList.add("prog-terap");
            var suivi = document.getElementById("suivi-phase-active");
            suivi.classList.add("prog-terap");
            var arret = document.getElementById("arret-traitements-id");
            arret.classList.add("table3col");
            var mesure = document.getElementById("mesure-associe");
            mesure.classList.add("table3col");
            var support = document.getElementById("synthese-soins");
            support.classList.add("support");
            var support1 = document.getElementById("soins-oncologiques");
            support1.classList.add("support");
            var accompagnement = document.getElementById("accompagnement");
            accompagnement.classList.add("support");
          }
        </script>
					<title>
						<xsl:value-of select="n1:title"/>
					</title>
					<style>
						body {
						    color: #003366;
						    font-family: Calibri, sans-serif;
						    font-size: 10px;
						}
						h1 {
						}
						h2 {
						    margin: 0px;
						}
						h3 {
						    color: black;
						}
						table {
						    table-layout: auto;
						    border-collapse: collapse;
						    width: 100%;
						}
						.depistage td:nth-child(1) {
						    width: 350px;
						}
						.depistage {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.synthese td:nth-child(1) {
						    width: 80px;
						}
						.synthese td:nth-child(2) {
						    width: 80px;
						}
						.synthese td:nth-child(3) {
						    width: 200px;
						}
						.synthese {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.prog-terap {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.prog-terap td:nth-child(1) {
						    width: 90px;
						}
						.prog-terap td:nth-child(2) {
						    width: 80px;
						}
						.prog-terap td:nth-child(3) {
						    width: 80px;
						}
						.prog-terap td:nth-child(4) {
						    width: 80px;
						}
						.prog-terap td:nth-child(5) {
						    width: 130px;
						}
						.prog-terap td:nth-child(6) {
						    width: 130px;
						}
						.prog-terap td:nth-child(7) {
						    width: 130px;
						}
						.prog-terap td:nth-child(8) {
						    width: 130px;
						}
						.prog-terap td:nth-child(9) {
						    width: 130px;
						}
						.prog-terap td:nth-child(10) {
						    width: 200px;
						}
						.table3col {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.support {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.table3col td:nth-child(1) {
						    width: 300px;
						}
						.table3col td:nth-child(2) {
						    width: 300px;
						}
						.support td:nth-child(1) {
						    width: 90px;
						}
						.support td:nth-child(2) {
						    width: 80px;
						}
						.support td:nth-child(3) {
						    width: 80px;
						}
						.support td:nth-child(4) {
						    width: 80px;
						}
						.support td:nth-child(5) {
						    width: 150px;
						}
						.support td:nth-child(6) {
						    width: 150px;
						}
						.support td:nth-child(7) {
						    width: 150px;
						}
						
						th {
						    padding: 0px 5px 0px 5px;
						    text-align: left;
						    background-color: lightsteelblue;
						    color: black;
						}
						tr {
						    font-weight: normal;
						}
						td {
						    padding: 0px 5px 0px 5px;
						}
						#header img,
						#header p,
						#header h2 {
						    margin: 0px 25px 0px 25px;
						}
						b {
						    color: black;
						    font-size: 10px;
						    font-weight: bold;
						    overflow: hidden;
						    display: block;
						    line-height: 11px;
						}
						.data {
						    color: #003366;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						    font-weight: normal;
						}
						.title {
						    font-size: 18pt;
						    font-weight: bold;
						    text-align: center;
						    width: 80%;
						}
						.header_table {
						    border: 1pt solid #00008b;
						    border-collapse: separate;
						}
						.td_label {
						    color: black;
						    font-family: Verdana, Tahoma, sans-serif;
						    font-size: 10px;
						}
						tbody:before {
						    content: "-";
						    display: block;
						    line-height: 1em;
						    color: transparent;
						}
						tbody:after {
						    content: "-";
						    display: block;
						    line-height: 1em;
						    color: transparent;
						}
						tr.border-bottom td {
						    border-bottom: 1px solid black;
						    font-weight: normal;
						    padding-top: 5px;
						    padding-bottom: 5px;
						}
						.contact {
						    background-color: silver;
						    font-size: 12pt;
						    font-weight: bold;
						    width: 100%;
						    color: black;
						}
						.watermark {
						    position: absolute; /* or fixed */
						    top: 0;
						    bottom: 0;
						    left: 0;
						    right: 0;
						    z-index: -1;
						    color: #0d745e;
						    font-size: 100px;
						    display: grid;
						    justify-content: center;
						    align-content: center;
						    opacity: 0.2;
						    transform: rotate(-45deg);
						}</style>
				</head>
				<body type="text/javascript">
					<!-- Nom du 3C / titre du document / Nom du RRC -->
					<!-- filigrane avec texte -->
					<div class="watermark">FILIGRANE</div>
					<table id="header" width="100%">
						<tr>
							<td width="15%">
								<p>
									<span class="data">
										<xsl:call-template name="show-name">
											<xsl:with-param name="name"
												select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-190']/n1:associatedEntity/n1:scopingOrganization/n1:name"
											/>
										</xsl:call-template>
										<br/>
									</span>
								</p>
								<br/>
							</td>
							<td width="70%">
								<h1 class="title">
									<xsl:value-of select="//n1:title"/>
								</h1>
							</td>
							<td width="15%">
								<!-- 
              <xsl:call-template name="printLogoInstitut"/>
              <br/> -->
								<p>
									<span class="data">
										<xsl:call-template name="show-name">
											<xsl:with-param name="name"
												select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-191']/n1:associatedEntity/n1:scopingOrganization/n1:name"
											/>
										</xsl:call-template>
										<br/>
									</span>
								</p>
							</td>
						</tr>
					</table>

					<!-- Entête : Patient et Document -->
					<div style="overflow: hidden;width:99%">
						<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
						<!-- Informations sur le patient -->
						<div style="width: 100%;">
							<span style="font-weight:bold;">Patient</span>
							<table class="header_table">
								<tbody>
									<!-- Nom du patient -->
									<xsl:call-template name="show-patient-name">
										<xsl:with-param name="name"
											select="n1:recordTarget//n1:patient/n1:name"/>
									</xsl:call-template>
									<!-- Date de naissance -->
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:choose>
													<xsl:when
														test="n1:recordTarget//n1:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']">
														<xsl:text>Date de naissance / de décès</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>Date de naissance</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
										<td width="80%">
											<xsl:choose>
												<xsl:when
													test="n1:recordTarget//n1:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']">
													<xsl:call-template name="show-time">
														<xsl:with-param name="datetime"
															select="n1:recordTarget//n1:patient/n1:birthTime"/>
													</xsl:call-template>
													<xsl:text> - &#8224; </xsl:text>
													<xsl:call-template name="show-time">
														<xsl:with-param name="datetime"
															select="n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']"
														/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="show-time">
														<xsl:with-param name="datetime"
															select="n1:recordTarget//n1:patient/n1:birthTime"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- Sexe -->
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:text>Sexe</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:for-each
												select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
												<xsl:call-template name="show-gender"/>
											</xsl:for-each>
										</td>
									</tr>
									<!-- Lieu de naissance -->
									<xsl:if
										test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
										<tr>
											<td width="20%">
												<span class="td_label">
												<xsl:text>Lieu de naissance</xsl:text>
												</span>
											</td>
											<td width="80%">
												<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name">
												<xsl:call-template name="show-name">
												<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name"
												/>
												</xsl:call-template>
												</xsl:if>
												<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-city">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
										<!-- Code INSEE du Lieu de naissance -->
										<tr>
											<td width="20%">
												<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr/n1:county">
												<span class="td_label">
												<xsl:text>Code INSEE</xsl:text>
												</span>
												</xsl:if>
											</td>
											<td width="80%">
												<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-county">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<!-- Médecin traitant -->
									<xsl:if test="n1:participant/@typeCode = 'INF'">
										<xsl:if test="n1:participant[n1:functionCode/@code = 'PCP']">
											<br/>
											<tr>
												<td width="20%">
												<xsl:if
												test="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name">
												<span class="td_label">
												<xsl:text>Médecin traitant</xsl:text>
												</span>
												</xsl:if>
												</td>
												<td width="80%">
												<xsl:if
												test="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name">
												<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name"
												/>
												</xsl:call-template>
												</xsl:if>
												</td>
											</tr>
										</xsl:if>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Informations sur le document -->
						<div style="width: 100%; padding-top: 10px">
							<span style="font-weight:bold;">Document</span>
							<table class="header_table">
								<tbody>
									<!-- Version du document -->
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:text>Version et statut du document</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:call-template name="show-version">
												<xsl:with-param name="version"
												select="n1:versionNumber"/>
											</xsl:call-template>
											<xsl:text>&#160;-&#160;&#160;</xsl:text>
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-statut-document">
												<xsl:with-param name="statut_document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-065']/n1:value/@displayName"
												/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<br/>
									<!-- Motif de mise à jour -->
									<tr>
										<td width="20%" style="vertical-align: top;">
											<span class="td_label">
												<xsl:text>Motif de mise à jour</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-motif-update">
												<xsl:with-param name="motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-037']/n1:value/@displayName"
												/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="show-commentaire-motif">
												<xsl:with-param name="commentaire-motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<br/>
									<!-- Date de remise au patient -->
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:text>Date de remise du document au patient</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-date-remise-document">
												<xsl:with-param name="remise"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:effectiveTime/@value"
												/>
												</xsl:call-template>
											</xsl:if>
											<span class="td_label">
												<xsl:text> par le </xsl:text>
											</span>
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"
												/>
												</xsl:call-template>
											</xsl:if>
											<span class="td_label">
												<xsl:text>&#160;(</xsl:text>
											</span>
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"
												/>
												</xsl:call-template>
											</xsl:if>
											<span class="td_label">
												<xsl:text>)</xsl:text>
											</span>
										</td>
									</tr>
									<br/>
									<!-- Commentaire sur le document -->
									<tr>
										<td width="20%" style="vertical-align: top;">
											<span class="td_label">
												<xsl:text>Commentaire sur le document</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:if
												test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
												<xsl:call-template name="show-commentaire-document">
												<xsl:with-param name="commentaire-document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- Corps du document -->
					<xsl:apply-templates select="n1:component/n1:structuredBody"/>

					<!-- Contacts utiles -->
					<div>
						<xsl:call-template name="participant"/>
					</div>

					<!-- Informations du patient -->
					<div style="width: 100%;">
						<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
						<p class="contact">
							<xsl:text>PATIENT</xsl:text>
						</p>
						<table>
							<tbody>
								<!-- Nom du patient -->
								<xsl:call-template name="show-patient-name">
									<xsl:with-param name="name"
										select="n1:recordTarget//n1:patient/n1:name"/>
								</xsl:call-template>
								<!-- Date de naissance -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:choose>
												<xsl:when
													test="n1:recordTarget//n1:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']">
													<xsl:text>Date de naissance / de décès</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Date de naissance</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td width="80%">
										<xsl:choose>
											<xsl:when
												test="n1:recordTarget//n1:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']">
												<xsl:call-template name="show-time">
													<xsl:with-param name="datetime"
														select="n1:recordTarget//n1:patient/n1:birthTime"/>
												</xsl:call-template>
												<xsl:text> - &#8224; </xsl:text>
												<xsl:call-template name="show-time">
													<xsl:with-param name="datetime"
														select="n1:recordTarget//n1:patient/*[local-name() = 'deceasedTime']"
													/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="show-time">
													<xsl:with-param name="datetime"
														select="n1:recordTarget//n1:patient/n1:birthTime"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<!-- Sexe -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Sexe</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
											<xsl:call-template name="show-gender"/>
										</xsl:for-each>
									</td>
								</tr>
								<!-- Lieu de naissance -->
								<xsl:if test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
									<tr>
										<td width="20%">
											<span class="td_label">
												<xsl:text>Lieu de naissance</xsl:text>
											</span>
										</td>
										<td width="80%">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name">
												<xsl:call-template name="show-name">
												<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name"
												/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-city">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
									<!-- Code INSEE du Lieu de naissance -->
									<tr>
										<td width="20%">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr/n1:county">
												<span class="td_label">
												<xsl:text>Code INSEE</xsl:text>
												</span>
											</xsl:if>
										</td>
										<td width="80%">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-county">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<!-- Adresse -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Adresse</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each
											select="n1:recordTarget/n1:patientRole/n1:addr">
											<xsl:call-template name="show-address-patient">
												<xsl:with-param name="address" select="."/>
											</xsl:call-template>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<br/>
								<!-- Telécom(s) -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Telécom</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each
											select="n1:recordTarget/n1:patientRole/n1:telecom">
											<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
											</xsl:call-template>
											<br/>
										</xsl:for-each>
									</td>
								</tr>

								<br/>
								<!-- INS -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>INS</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
											<xsl:choose>
												<xsl:when test="@root = '1.2.250.1.213.1.4.8'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[NIR]</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.9'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[NIA]</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.10'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[TEST]</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.11'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<span class="data">
												<xsl:text>[DEMO]</xsl:text>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</td>
								</tr>
								<!-- IPP -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>IPP</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
											<xsl:if test="
													(@root != '1.2.250.1.213.1.4.8') and (@root != '1.2.250.1.213.1.4.9')
													and (@root != '1.2.250.1.213.1.4.10') and (@root != '1.2.250.1.213.1.4.11')">
												<xsl:call-template name="show-id">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<br/>
								<!-- Représentant du patient (guardian) -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Représentant du patient</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if test="n1:recordTarget//n1:patient/n1:guardian">
											<xsl:for-each
												select="n1:recordTarget//n1:patient/n1:guardian">
												<xsl:call-template name="show-guardian">
												<xsl:with-param name="guardian" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<br/>
								<!-- Personne de confiance / Contact en cas d'urgence (informant) -->
								<xsl:for-each select="n1:informant">
									<xsl:if test="n1:relatedEntity">
										<tr>
											<td width="20%" style="vertical-align: top;">
												<span class="td_label">
												<xsl:call-template name="show-relatedEntityClass">
												<xsl:with-param name="clsCode"
												select="n1:relatedEntity/@classCode"/>
												</xsl:call-template>
												</span>
											</td>
											<td width="80%">
												<xsl:if test="n1:relatedEntity">
												<xsl:call-template name="show-relatedEntity">
												<xsl:with-param name="relatedEntity"
												select="n1:relatedEntity"/>
												</xsl:call-template>
												<xsl:if test="n1:relatedEntity/n1:addr">
												<xsl:for-each select="n1:relatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
												</xsl:if>
												<xsl:if test="n1:relatedEntity/n1:telecom">
												<br/>
												<xsl:for-each select="n1:relatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
												</xsl:if>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<br/>
								</xsl:for-each>
								<!-- Commentaire sur le patient -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Commentaire sur le patient</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-293'])">
											<xsl:call-template name="show-comm-patient">
												<xsl:with-param name="commentaire"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<br/>
								<!-- Pédiatrie -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Pédiatrie</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
											<xsl:call-template name="show-pediatrie">
												<xsl:with-param name="pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<br/>
								<!-- Commentaire sur pédiatrie -->
								<tr>
									<td width="20%" style="vertical-align: top;">
										<span class="td_label">
											<xsl:text>Commentaire sur pédiatrie</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
											<xsl:call-template name="show-commentaire-pediatrie">
												<xsl:with-param name="commentaire-pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<br/>
							</tbody>
						</table>
					</div>

					<!-- Section FR-Diagnostic-du-cancer : TUMEUR -->
					<xsl:for-each select="n1:component/n1:structuredBody/n1:component/n1:section">
						<xsl:if test="n1:templateId/@root = '2.16.840.1.113883.10.20.1.11'">
							<p
								style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
								<xsl:text>DIAGNOSTIC</xsl:text>
							</p>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>
						<!-- Section FR-Resultats-evenements : MODE DE DÉCOUVERTE DU CANCER -->
						<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7'">
							<br/>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>

						<!-- Section FR-Note-de-progression : PHASE ET PROGRESSION DU CANCER -->
						<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7'">
							<br/>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>
					</xsl:for-each>

					<!-- Informations sur le document -->
					<div style="width: 100%">
						<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
						<p class="contact">
							<xsl:text>DOCUMENT</xsl:text>
						</p>
						<!-- <table class="header_table"> -->
						<table>
							<tbody>
								<!-- Identifiant du document -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Identifiant</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id" select="n1:id"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Version du document -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Version</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:call-template name="show-version">
											<xsl:with-param name="version" select="n1:versionNumber"
											/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Lot de versions -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Lot de versions</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:call-template name="show-lot-version">
											<xsl:with-param name="lot" select="n1:setId"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Date du document -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Date du document</xsl:text>
										</span>
									</td>
									<td width="80%" id="date_document">
										<xsl:call-template name="show-creation">
											<xsl:with-param name="creation"
												select="n1:effectiveTime"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Date de la RCP -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Date de la RCP</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-rcp">
												<xsl:with-param name="date_rcp"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'ORG-189']/n1:effectiveTime/@value"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<!-- Date de la consultation d'annonce -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Date consultation d'annonce</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-consultation-annonce">
												<xsl:with-param name="consult"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:value/@value"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<!-- Documents référencés -->
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Autres documents référencés :</xsl:text>
										</span>
									</td>
								</tr>
								<!-- Référence FRCP -->
								<tr>
									<td width="20%" style="padding-left:40px">
										<span class="td_label">
											<xsl:text>FRCP n°</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55')">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.3.4.567.8.9.10']"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<!-- Référence CR-GM -->
								<tr>
									<td width="20%" style="padding-left:40px">
										<span class="td_label">
											<xsl:text>CR-GM n°</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.9']"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
								<!-- Référence PPS Précédent -->
								<tr>
									<td width="20%" style="padding-left:40px">
										<span class="td_label">
											<xsl:text>PPS Cancérologie n°</xsl:text>
										</span>
									</td>
									<td width="80%">
										<xsl:if
											test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.10']"
												/>
											</xsl:call-template>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Informations sur les données personnelles vous concernant -->
					<p class="contact">
						<xsl:text>INFORMATION SUR LES DONNÉES PERSONNELLES VOUS CONCERNANT</xsl:text>
					</p>
					<table width="100%">
						<tr>
							<td width="100%">
								<xsl:if
									test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-294'])">
									<xsl:for-each
										select="//n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16' and n1:code/n1:translation/@code = 'GEN-294']/n1:text/n1:table/n1:tbody/n1:tr/n1:td">
										<div class="data">
											<xsl:value-of select="current()"/>
										</div>
										<br/>
									</xsl:for-each>
								</xsl:if>
								<br/>
							</td>
						</tr>
					</table>
				</body>
			</html>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block xsl:use-attribute-sets="myMargin" keep-together.within-page="always">
				<fo:table>
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="70%"/>
					<fo:table-column column-number="2" column-width="15%"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="data">
									<xsl:call-template name="show-name">
										<xsl:with-param name="name"
											select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-190']/n1:associatedEntity/n1:scopingOrganization/n1:name"
										/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="title">
									<xsl:value-of select="n1:title"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="data">
									<xsl:call-template name="show-name">
										<xsl:with-param name="name"
											select="n1:participant[n1:functionCode/n1:translation/@code = 'ORG-191']/n1:associatedEntity/n1:scopingOrganization/n1:name"
										/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<!-- Entête : Patient et Document -->
			<fo:block font-style="overflow: hidden" width="100%" margin-left="5px">
				<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
				<fo:block font-weight="bold" font-size="6" color="#003366">Patient</fo:block>
				<fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="20%"/>
						<fo:table-column column-number="2" column-width="80%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:call-template name="show-patient-name">
											<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:name"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block margin-top="5px" font-size="6" color="#003366">
										<xsl:call-template name="show-patient-name-field">
											<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:name"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6">
										<xsl:text>Date de naissance</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366">
										<xsl:call-template name="show-time">
											<xsl:with-param name="datetime"
												select="n1:recordTarget//n1:patient/n1:birthTime"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6">
										<xsl:text>Sexe</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366">
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
											<xsl:call-template name="show-gender"/>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="n1:recordTarget//n1:patient/n1:birthplace/n1:place">
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="6">
											<xsl:text>Lieu de naissance</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="6" color="#003366">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name">
												<xsl:call-template name="show-name">
												<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name"
												/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-city">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
											</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="6">
											<xsl:text>Code INSEE</xsl:text>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="6" color="#003366">
											<xsl:if
												test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
												<xsl:call-template name="show-address-county">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
												</xsl:call-template>
											</xsl:if>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="n1:participant/@typeCode = 'INF'">
								<fo:table-row>
									<fo:table-cell>
										<fo:block line-height="0.3cm">&#160;</fo:block>
										<fo:block font-size="6">
											<xsl:text>Médecin traitant</xsl:text>
										</fo:block>
										<fo:block line-height="0.3cm">&#160;</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block line-height="0.3cm">&#160;</fo:block>
										<fo:block font-size="6" color="#003366">
											<xsl:if
												test="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name">
												<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:participant[n1:functionCode/@code = 'PCP']/n1:associatedEntity/n1:associatedPerson/n1:name"
												/>
												</xsl:call-template>
											</xsl:if>
										</fo:block>
										<fo:block line-height="0.3cm">&#160;</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
						</fo:table-body>
					</fo:table>
				</fo:block>
				<fo:block font-weight="bold" font-size="6" color="#003366" padding-top="10px"
					>Document</fo:block>
				<fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="20%"/>
						<fo:table-column column-number="2" column-width="80%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Version et statut du document</xsl:text>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="5px">
										<xsl:call-template name="show-version">
											<xsl:with-param name="version" select="n1:versionNumber"
											/>
										</xsl:call-template>
										<xsl:text>&#160;-&#160;&#160;</xsl:text>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-statut-document">
												<xsl:with-param name="statut_document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-065']/n1:value/@displayName"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6">
										<xsl:text>Motif de mise à jour</xsl:text>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-motif-update">
												<xsl:with-param name="motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-037']/n1:value/@displayName"
												/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="show-commentaire-motif">
												<xsl:with-param name="commentaire-motif"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6">
										<xsl:text>Date de remise du document au patient</xsl:text>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-remise-document">
												<xsl:with-param name="remise"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:effectiveTime/@value"
												/>
											</xsl:call-template>
										</xsl:if>
										<fo:inline>
											<xsl:text> par le </xsl:text>
										</fo:inline>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:assignedPerson/n1:name"
												/>
											</xsl:call-template>
										</xsl:if>
										<fo:inline>
											<xsl:text>&#160;(</xsl:text>
										</fo:inline>
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-name-not-bold">
												<xsl:with-param name="name"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:performer/n1:assignedEntity/n1:representedOrganization/n1:name"
												/>
											</xsl:call-template>
										</xsl:if>
										<fo:inline>
											<xsl:text>)</xsl:text>
										</fo:inline>
									</fo:block>
									<fo:block line-height="0.1cm">&#160;</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block line-height="0.3cm">&#160;</fo:block>
									<fo:block font-size="6">
										<xsl:text>Commentaire sur le document</xsl:text>
									</fo:block>
									<fo:block line-height="0.3cm">&#160;</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block line-height="0.3cm">&#160;</fo:block>
									<fo:block font-size="6" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-commentaire-document">
												<xsl:with-param name="commentaire-document"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
									<fo:block line-height="0.3cm">&#160;</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
				<!-- Corps du document -->
				<xsl:apply-templates select="n1:component/n1:structuredBody"/>

				<!-- Contacts utiles -->
				<fo:block>
					<xsl:call-template name="participant"/>
				</fo:block>
				<fo:block line-height="0.5cm">&#160;</fo:block>
				<fo:block>
					<fo:block xsl:use-attribute-sets="contact">
						<xsl:text>PATIENT</xsl:text>
					</fo:block>
					<fo:block line-height="0.5cm">&#160;</fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="20%"/>
						<fo:table-column column-number="2" column-width="80%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:call-template name="show-patient-name">
											<xsl:with-param name="name"
												select="n1:recordTarget/n1:patientRole/n1:patient/n1:name"
											/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:call-template name="show-patient-name-field">
											<xsl:with-param name="name"
												select="n1:recordTarget/n1:patientRole/n1:patient/n1:name"
											/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Date de naissance</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:call-template name="show-time">
											<xsl:with-param name="datetime"
												select="n1:recordTarget//n1:patient/n1:birthTime"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Sexe</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:for-each
											select="n1:recordTarget//n1:patient/n1:administrativeGenderCode">
											<xsl:call-template name="show-gender"/>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Lieu de naissance</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:if
											test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name">
											<xsl:call-template name="show-name">
												<xsl:with-param name="name"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:name"
												/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if
											test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
											<xsl:call-template name="show-address-city">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Code INSEE</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:if
											test="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr">
											<xsl:call-template name="show-address-county">
												<xsl:with-param name="address"
												select="n1:recordTarget//n1:patient/n1:birthplace/n1:place/n1:addr"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Adresse</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:for-each
											select="n1:recordTarget/n1:patientRole/n1:addr">
											<xsl:call-template name="show-address-patient">
												<xsl:with-param name="address" select="."/>
											</xsl:call-template>
											<fo:block line-height="0.1cm">&#160;</fo:block>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>Telécom</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:for-each
											select="n1:recordTarget/n1:patientRole/n1:telecom">
											<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
											</xsl:call-template>
											<fo:block line-height="0.1cm">&#160;</fo:block>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="2px">
										<xsl:text>INS</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="2px">
										<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
											<xsl:choose>
												<xsl:when test="@root = '1.2.250.1.213.1.4.8'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<fo:inline xsl:use-attribute-sets="data">
												<xsl:text>[NIR]</xsl:text>
												</fo:inline>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.9'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<fo:inline xsl:use-attribute-sets="data">
												<xsl:text>[NIA]</xsl:text>
												</fo:inline>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.10'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<fo:inline xsl:use-attribute-sets="data">
												<xsl:text>[TEST]</xsl:text>
												</fo:inline>
												</xsl:when>
												<xsl:when test="@root = '1.2.250.1.213.1.4.11'">
												<xsl:call-template name="show-identifiant">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
												<xsl:text>&#160;</xsl:text>
												<fo:inline xsl:use-attribute-sets="data">
												<xsl:text>[DEMO]</xsl:text>
												</fo:inline>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>&#160;</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="3px">
										<xsl:text>IPP</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="3px">
										<xsl:for-each select="n1:recordTarget/n1:patientRole/n1:id">
											<xsl:if test="
													(@root != '1.2.250.1.213.1.4.8') and (@root != '1.2.250.1.213.1.4.9')
													and (@root != '1.2.250.1.213.1.4.10') and (@root != '1.2.250.1.213.1.4.11')">
												<xsl:call-template name="show-id">
												<xsl:with-param name="id" select="."/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="3px">
										<xsl:text>Représentant du patient</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="3px">
										<xsl:if test="n1:recordTarget//n1:patient/n1:guardian">
											<xsl:for-each
												select="n1:recordTarget//n1:patient/n1:guardian">
												<xsl:call-template name="show-guardian">
												<xsl:with-param name="guardian" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
											</xsl:for-each>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="n1:informant">
								<xsl:if test="n1:relatedEntity">
									<fo:table-row>
										<fo:table-cell>
											<fo:block font-size="6" margin-top="3px">
												<xsl:call-template name="show-relatedEntityClass">
												<xsl:with-param name="clsCode"
												select="n1:relatedEntity/@classCode"/>
												</xsl:call-template>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block font-size="6" color="#003366" margin-top="3px">
												<xsl:if test="n1:relatedEntity">
												<xsl:call-template name="show-relatedEntity">
												<xsl:with-param name="relatedEntity"
												select="n1:relatedEntity"/>
												</xsl:call-template>
												<xsl:if test="n1:relatedEntity/n1:addr">
												<xsl:for-each select="n1:relatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
												<xsl:if test="n1:relatedEntity/n1:telecom">
												<fo:block line-height="0.1cm">&#160;</fo:block>
												<xsl:for-each select="n1:relatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
												</xsl:if>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
							</xsl:for-each>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="3px">
										<xsl:text>Commentaire sur le patient</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="3px">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-293'])">
											<xsl:call-template name="show-comm-patient">
												<xsl:with-param name="commentaire"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="3px">
										<xsl:text>Pédiatrie</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="3px">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
											<xsl:call-template name="show-pediatrie">
												<xsl:with-param name="pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="3px">
										<xsl:text>Commentaire sur pédiatrie</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" color="#003366" margin-top="3px">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1')">
											<xsl:call-template name="show-commentaire-pediatrie">
												<xsl:with-param name="commentaire-pediatrie"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.3.1']/n1:text"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
				<fo:block line-height="0.5cm">&#160;</fo:block>
				<fo:block>
					<!-- Section FR-Diagnostic-du-cancer : TUMEUR -->
					<xsl:for-each select="n1:component/n1:structuredBody/n1:component/n1:section">
						<xsl:if test="n1:templateId/@root = '2.16.840.1.113883.10.20.1.11'">
							<fo:block background-color="silver" font-size="10pt" font-weight="bold"
								width="100%" color="black">
								<xsl:text>DIAGNOSTIC</xsl:text>
							</fo:block>
							<fo:block line-height="0.5cm">&#160;</fo:block>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>
						<!-- Section FR-Resultats-evenements : MODE DE DÉCOUVERTE DU CANCER -->
						<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7'">
							<fo:block line-height="0.1cm">&#160;</fo:block>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>

						<!-- Section FR-Note-de-progression : PHASE ET PROGRESSION DU CANCER -->
						<xsl:if test="n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7'">
							<fo:block line-height="0.1cm">&#160;</fo:block>
							<xsl:call-template name="corpsSection"/>
						</xsl:if>
					</xsl:for-each>
				</fo:block>
				<fo:block line-height="0.5cm">&#160;</fo:block>
				<fo:block>
					<fo:block xsl:use-attribute-sets="contact">
						<xsl:text>DOCUMENT</xsl:text>
					</fo:block>
					<fo:block line-height="0.5cm">&#160;</fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="20%"/>
						<fo:table-column column-number="2" column-width="80%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Identifiant</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:call-template name="show-id">
											<xsl:with-param name="id" select="n1:id"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Version</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:call-template name="show-version">
											<xsl:with-param name="version" select="n1:versionNumber"
											/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Lot de versions</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:call-template name="show-lot-version">
											<xsl:with-param name="lot" select="n1:setId"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Date du document</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:call-template name="show-creation">
											<xsl:with-param name="creation"
												select="n1:effectiveTime"/>
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Date de la RCP</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-rcp">
												<xsl:with-param name="date_rcp"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'ORG-189']/n1:effectiveTime/@value"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Date consultation d'annonce</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.35')">
											<xsl:call-template name="show-date-consultation-annonce">
												<xsl:with-param name="consult"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.35']/n1:entry/n1:observation[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.13' and n1:code/@code = 'GEN-178']/n1:value/@value"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px">
										<xsl:text>Autres documents référencés :</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:text/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" padding-left="40px">
										<xsl:text>FRCP n°</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55')">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.3.4.567.8.9.10']"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" padding-left="40px">
										<xsl:text>CR-GM n°</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.9']"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" padding-left="40px">
										<xsl:text>PPS Cancérologie n°</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="n1:component/n1:structuredBody/n1:component/n1:section/n1:templateId/@root = '1.2.250.1.213.1.1.2.55'">
											<xsl:call-template name="show-id">
												<xsl:with-param name="id"
												select="n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.2.250.1.213.1.1.2.55']/n1:entry/n1:act[n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.4' and n1:code/@nullFlavor = 'NA']/n1:reference/n1:externalDocument/n1:id[@root = '1.2.250.1.213.1.1.10']"
												/>
											</xsl:call-template>
										</xsl:if>
									</fo:block>
									<fo:block line-height="0.3cm">&#160;</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
				<fo:block line-height="0.5cm">&#160;</fo:block>
				<fo:block>
					<fo:block xsl:use-attribute-sets="contact">
						<xsl:text>INFORMATION SUR LES DONNÉES PERSONNELLES VOUS CONCERNANT</xsl:text>
					</fo:block>
					<fo:block line-height="0.5cm">&#160;</fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="100%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block font-size="6" margin-top="5px" color="#003366">
										<xsl:if
											test="(n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16']/n1:code[n1:translation/@code = 'GEN-294'])">
											<xsl:for-each
												select="//n1:component/n1:structuredBody/n1:component/n1:section[n1:templateId/@root = '1.3.6.1.4.1.19376.1.4.1.2.16' and n1:code/n1:translation/@code = 'GEN-294']/n1:text/n1:table/n1:tbody/n1:tr/n1:td">
												<fo:block xsl:use-attribute-sets="data">
												<xsl:value-of select="current()"/>
												</fo:block>
												<br/>
											</xsl:for-each>
										</xsl:if>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</fo:block>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> Corps du document </xd:desc>
	</xd:doc>
	<xsl:template match="n1:component/n1:structuredBody">
		<xsl:for-each select="n1:component/n1:section">
			<xsl:choose>
				<!-- Sections FR-Plan-de-soins -->
				<xsl:when test="n1:templateId/@root = '2.16.840.1.113883.10.20.1.10'">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.5cm">&#160;</fo:block>
					</xsl:if>
					<!-- Section FR-Plan-de-soins : PROGRAMME THERAPEUTIQUE ET DE SUIVI (MED-566) -->
					<xsl:if test="n1:code/n1:translation/@code = 'MED-566'">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<p
								style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
								<xsl:text>PROGRAMME THÉRAPEUTIQUE ET DE SUIVI</xsl:text>
							</p>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:block background-color="silver" font-size="10pt" font-weight="bold"
								width="100%" color="black">
								<xsl:text>PROGRAMME THÉRAPEUTIQUE ET DE SUIVI</xsl:text>
							</fo:block>
						</xsl:if>
					</xsl:if>
					<!-- Section FR-Plan-de-soins : SOINS ONCOLOGIQUES DE SUPPORT, ACCOMPAGNEMENT SOCIAL ET SOCIOPROFESSIONNEL (MED-567) -->
					<xsl:if test="n1:code/n1:translation/@code = 'MED-567'">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<p
								style="background-color: silver;font-size: 12pt;font-weight: bold;width:100%;color: black;">
								<xsl:text>SOINS ONCOLOGIQUES DE SUPPORT, ACCOMPAGNEMENT SOCIAL ET SOCIOPROFESSIONNEL</xsl:text>
							</p>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:block background-color="silver" font-size="10pt" font-weight="bold"
								width="100%" color="black">
								<xsl:text>SOINS ONCOLOGIQUES DE SUPPORT, ACCOMPAGNEMENT SOCIAL ET SOCIOPROFESSIONNEL</xsl:text>
							</fo:block>
						</xsl:if>
					</xsl:if>
					<xsl:call-template name="corpsSection"/>
				</xsl:when>
				<xsl:otherwise> </xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc> Affichage du contenu d'une section </xd:desc>
	</xd:doc>
	<xsl:template name="corpsSection">
		<xsl:call-template name="section-text"/>
		<xsl:for-each select="n1:component/n1:section">
			<xsl:call-template name="nestedSection">
				<xsl:with-param name="margin" select="2"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc> Affichage du &lt;text&gt; d'une section </xd:desc>
	</xd:doc>
	<xsl:template name="section-text">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<div>
				<xsl:apply-templates select="n1:text"/>
			</div>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block font-weight="bold" font-size="8">
				<xsl:apply-templates select="n1:text"/>
			</fo:block>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> Affichage section imbriquée </xd:desc>
		<xd:param name="margin"/>
	</xd:doc>
	<xsl:template name="nestedSection">
		<xsl:param name="margin"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<h4 style="margin-left : {$margin}em;">
				<xsl:value-of select="n1:title"/>
			</h4>
			<div style="margin-left : {$margin}em;">
				<xsl:apply-templates select="n1:text"/>
			</div>
			<xsl:for-each select="n1:component/n1:section">
				<xsl:call-template name="nestedSection">
					<xsl:with-param name="margin" select="2 * $margin"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="not(n1:templateId[@root = '1.2.250.1.213.1.1.2.243'])">
				<fo:block margin-left="{$margin}em" font-weight="bold" font-size="8">
					<xsl:value-of select="n1:title"/>
				</fo:block>
				<fo:block line-height="0.3cm">&#160;</fo:block>
				<fo:block margin-left="{$margin}em" font-size="8">
					<xsl:apply-templates select="n1:text"/>
				</fo:block>
				<xsl:for-each select="n1:component/n1:section">
					<xsl:call-template name="nestedSection">
						<xsl:with-param name="margin" select="2 * $margin"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> paragraph </xd:desc>
	</xd:doc>
	<xsl:template match="n1:paragraph">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<p>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</p>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
			<fo:block line-height="0.1cm">&#160;</fo:block>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> pre format </xd:desc>
	</xd:doc>
	<xsl:template match="n1:pre">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<pre>
            <xsl:apply-templates/>
        </pre>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc> Content w/ deleted text is hidden </xd:desc>
	</xd:doc>
	<xsl:template match="n1:content[@revised = 'delete']"/>

	<xd:doc>
		<xd:desc> content </xd:desc>
	</xd:doc>
	<xsl:template match="n1:content">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span>
				<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
			</span>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline>
				<xsl:apply-templates/>
			</fo:inline>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc> line break </xd:desc>
	</xd:doc>
	<xsl:template match="n1:br">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:element name="br">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block line-height="0.2cm">&#160; <xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc> list </xd:desc>
	</xd:doc>
	<xsl:template match="n1:list">
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="n1:caption">
				<fo:list-block>
					<fo:list-item>
						<fo:list-item-label>
							<fo:block margin-left="0.3cm" font-weight="bold">*</fo:block>
						</fo:list-item-label>
						<fo:list-item-body>
							<fo:block xsl:use-attribute-sets="myBlock7">
								<xsl:apply-templates select="n1:caption"/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</xsl:if>
			<fo:list-block>
				<fo:list-item>
					<fo:list-item-label>
						<fo:block margin-left="0.3cm" font-weight="bold">*</fo:block>
					</fo:list-item-label>
					<fo:list-item-body>
						<xsl:for-each select="n1:item">
							<fo:block xsl:use-attribute-sets="myBlock6">
								<xsl:apply-templates/>
							</fo:block>
						</xsl:for-each>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<!-- caption -->
			<xsl:if test="n1:caption">
				<div style="font-weight:bold; ">
					<xsl:apply-templates select="n1:caption"/>
				</div>
			</xsl:if>
			<!-- item -->
			<xsl:choose>
				<xsl:when test="@listType = 'ordered'">
					<ol>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:for-each select="n1:item">
							<li>
								<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
								<!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
								<xsl:apply-templates/>
							</li>
						</xsl:for-each>
					</ol>
				</xsl:when>
				<xsl:otherwise>
					<!-- list is unordered -->
					<ul>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:for-each select="n1:item">
							<li>
								<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
								<xsl:apply-templates/>
							</li>
						</xsl:for-each>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> caption </xd:desc>
	</xd:doc>
	<xsl:template match="n1:caption">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="parent::n1:table">
					<caption>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</caption>
				</xsl:when>
				<xsl:otherwise>
					<div class="caption">
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="parent::n1:table">
					<caption>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</caption>
				</xsl:when>
				<xsl:otherwise>
					<fo:block>
						<xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
						<xsl:apply-templates/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc> Tables </xd:desc>
	</xd:doc>
	<xsl:template
		match="n1:table/@* | n1:thead/@* | n1:tfoot/@* | n1:tbody/@* | n1:colgroup/@* | n1:col/@* | n1:tr/@* | n1:th/@* | n1:td/@*">
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:copy>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</xsl:copy>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:copy>
				<xsl:apply-templates/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:table">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table width="95%" margin="0.3em 0" xsl:use-attribute-sets="myBorder"
				table-layout="auto">
				<xsl:apply-templates/>
			</fo:table>
			<fo:block line-height="0.2cm">&#160;</fo:block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<table>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</table>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:thead">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table-header>
				<xsl:apply-templates/>
			</fo:table-header>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<thead>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</thead>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:tfoot">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<tfoot>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tfoot>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:tbody">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:table-body line-stacking-strategy="max-height">
				<xsl:apply-templates/>
			</fo:table-body>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<tbody>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</tbody>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:colgroup">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<colgroup>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</colgroup>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:col">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:apply-templates/>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<col>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</col>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:tr">
		<xsl:if
			test="(../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.10' or ../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.11' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7')">
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<tr class="border-bottom">
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</tr>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:table-row border-bottom="1px solid black" font-weight="normal" padding-top="5px"
					padding-bottom="5px">
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</fo:table-row>
			</xsl:if>
		</xsl:if>
		<xsl:if
			test="not(../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.10' or ../../../../n1:templateId/@root = '2.16.840.1.113883.10.20.1.11' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.1.13.2.7' or ../../../../n1:templateId/@root = '1.3.6.1.4.1.19376.1.7.3.1.1.13.7')">
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<tr class="tr">
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</tr>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:table-row font-weight="normal">
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates/>
				</fo:table-row>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:th">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="@colspan">
					<xsl:variable name="nb_header" select="@colspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock13"
						number-columns-spanned="{$nb_header}">
						<fo:block font-weight="bold">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:when test="@rowspan">
					<xsl:variable name="nb_header" select="@rowspan"/>
					<fo:table-cell xsl:use-attribute-sets="myBlock13"
						number-rows-spanned="{$nb_header}">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-cell xsl:use-attribute-sets="myBlock13">
						<fo:block font-weight="bold">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<th class="th">
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</th>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:td">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="@colspan">
					<xsl:variable name="nb_header" select="@colspan"/>
					<xsl:if test="not(@styleCode = 'Bold')">
						<fo:table-cell xsl:use-attribute-sets="myBlock14"
							number-columns-spanned="{$nb_header}">
							<fo:block color="#003366">
								<xsl:apply-templates/>
								<fo:block line-height="0.2cm">&#160;</fo:block>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
					<xsl:if test="@styleCode = 'Bold'">
						<fo:table-cell xsl:use-attribute-sets="myBlock14"
							number-columns-spanned="{$nb_header}">
							<fo:block font-weight="bold">
								<xsl:apply-templates/>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
				</xsl:when>
				<xsl:when test="@rowspan">
					<xsl:variable name="nb_header" select="@rowspan"/>
					<xsl:if test="not(@styleCode = 'Bold')">
						<fo:table-cell xsl:use-attribute-sets="myBlock14"
							number-rows-spanned="{$nb_header}">
							<fo:block color="#003366">
								<xsl:apply-templates/>
								<fo:block line-height="0.2cm">&#160;</fo:block>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
					<xsl:if test="@styleCode = 'Bold'">
						<fo:table-cell xsl:use-attribute-sets="myBlock14"
							number-rows-spanned="{$nb_header}">
							<fo:block font-weight="bold">
								<xsl:apply-templates/>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not(@styleCode = 'Bold')">
						<fo:table-cell xsl:use-attribute-sets="myBlock14">
							<fo:block color="#003366">
								<xsl:apply-templates/>
								<fo:block line-height="0.2cm">&#160;</fo:block>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
					<xsl:if test="@styleCode = 'Bold'">
						<fo:table-cell xsl:use-attribute-sets="myBlock14">
							<fo:block font-weight="bold">
								<xsl:apply-templates/>
							</fo:block>
						</fo:table-cell>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<td>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates/>
			</td>
		</xsl:if>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
	</xd:doc>
	<xsl:template match="n1:table/n1:caption">
		<!-- Extension FR : PDF -->
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block font-weight="bold" xsl:use-attribute-sets="data">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span style="font-weight:bold;" class="data">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- ******* -->
	<!-- PATIENT -->
	<!-- ******* -->
	<xd:doc>
		<xd:desc> show-patient-name </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-patient-name">
		<xsl:param name="name"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:if test="$name/n1:prefix">
				<tr>
					<td width="20%">
						<span class="td_label">
							<xsl:text>Civilité</xsl:text>
						</span>
					</td>
					<td colspan="3">
						<xsl:for-each select="$name/n1:prefix">
							<span class="data">
								<xsl:value-of select="."/>
							</span>
							<br/>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="$name/n1:family">
				<xsl:choose>
					<xsl:when test="@qualifier">
						<xsl:choose>
							<xsl:when test="@qualifier = &apos;BR&apos;">
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Nom de naissance</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<span style="font-weight:bold;" class="data">
											<xsl:value-of select="."/>
										</span>
									</td>
								</tr>
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Prénom(s)</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<xsl:variable name="count" select="count($name/n1:given)"/>
										<xsl:for-each select="$name/n1:given">
											<xsl:choose>
												<xsl:when test="@qualifier = &apos;BR&apos;">
												<span style="font-weight:bold;" class="data">
												<xsl:value-of select="."/>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<span class="data">
												<xsl:value-of select="."/>
												</span>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="$count > 1">
												<xsl:if
												test="(position() != last()) and (position() > 1)">
												<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:if test="position() = 1">
												<xsl:text> [</xsl:text>
												</xsl:if>
												<xsl:if test="position() = last()">
												<xsl:text>]</xsl:text>
												</xsl:if>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;SP&apos;">
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Nom d'usage</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<span class="data">
											<xsl:value-of select="."/>
										</span>
									</td>
								</tr>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;CL&apos;">
								<tr>
									<td width="20%">
										<span class="td_label">
											<xsl:text>Nom et prénom utilisés</xsl:text>
										</span>
									</td>
									<td colspan="3">
										<span style="font-weight:bold; ">
											<xsl:value-of select="."/>
											<xsl:text>&#160;</xsl:text>
											<xsl:for-each select="$name/n1:given">
												<xsl:if test="@qualifier = &apos;CL&apos;">
												<span class="data">
												<xsl:value-of select="."/>
												</span>
												</xsl:if>
												<xsl:text>&#160;</xsl:text>
											</xsl:for-each>
										</span>
									</td>
								</tr>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td width="20%">
								<span class="td_label">
									<xsl:text>Nom</xsl:text>
								</span>
							</td>
							<td colspan="3">
								<span class="data">
									<xsl:value-of select="."/>
								</span>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="$name/n1:prefix">
				<xsl:text>Civilité</xsl:text>
				<xsl:for-each select="$name/n1:prefix">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="$name/n1:family">
				<xsl:choose>
					<xsl:when test="@qualifier">
						<xsl:choose>
							<xsl:when test="@qualifier = &apos;BR&apos;">
								<xsl:text>Nom de naissance </xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
								<xsl:text>Prénom(s) </xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;SP&apos;">
								<xsl:text>Nom d'usage </xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;CL&apos;">
								<xsl:text>Nom et prénom utilisés </xsl:text>
								<xsl:text>&#160;</xsl:text>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Nom </xsl:text>
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc/>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-patient-name-field">
		<xsl:param name="name"/>
		<xsl:if test="$name/n1:prefix">
			<xsl:for-each select="$name/n1:prefix">
				<xsl:value-of select="."/>
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="$name/n1:family">
			<xsl:choose>
				<xsl:when test="@qualifier">
					<xsl:choose>
						<xsl:when test="@qualifier = &apos;BR&apos;">
							<fo:block font-weight="bold">
								<xsl:value-of select="."/>
							</fo:block>
							<fo:block line-height="0.1cm">&#160;</fo:block>
							<xsl:variable name="count" select="count($name/n1:given)"/>
							<xsl:for-each select="$name/n1:given">
								<xsl:choose>
									<xsl:when test="@qualifier = &apos;BR&apos;">
										<xsl:value-of select="."/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="."/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="$count > 1">
									<xsl:if test="(position() != last()) and (position() > 1)">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="position() = 1">
										<xsl:text> [</xsl:text>
									</xsl:if>
									<xsl:if test="position() = last()">
										<xsl:text>]</xsl:text>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;SP&apos;">
							<xsl:value-of select="."/>
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
						<xsl:when test="@qualifier = &apos;CL&apos;">
							<fo:block font-weight="bold">
								<xsl:value-of select="."/>
								<xsl:text>&#160;</xsl:text>
								<xsl:for-each select="$name/n1:given">
									<xsl:if test="@qualifier = &apos;CL&apos;">
										<xsl:value-of select="."/>
									</xsl:if>
									<xsl:text>&#160;</xsl:text>
								</xsl:for-each>
							</fo:block>
							<fo:block line-height="0.1cm">&#160;</fo:block>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xd:doc>
		<xd:desc> show-gender </xd:desc>
	</xd:doc>
	<xsl:template name="show-gender">
		<xsl:choose>
			<xsl:when test="@code = &apos;M&apos;">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Masculin</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block xsl:use-attribute-sets="data">
						<xsl:text>Masculin</xsl:text>
					</fo:block>
				</xsl:if>
			</xsl:when>
			<xsl:when test="@code = &apos;F&apos;">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Féminin</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block xsl:use-attribute-sets="data">
						<xsl:text>Féminin</xsl:text>
					</fo:block>
				</xsl:if>
			</xsl:when>
			<xsl:when test="@code = &apos;U&apos;">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Inconnu</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block xsl:use-attribute-sets="data">
						<xsl:text>Inconnu</xsl:text>
					</fo:block>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-address-patient </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
	<xsl:template name="show-address-patient">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="$address/n1:streetAddressLine">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="."/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:value-of select="."/>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="$address/n1:streetName">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$address/n1:houseNumber"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetNameType"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetName"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:value-of select="$address/n1:houseNumber"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetNameType"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="$address/n1:streetName"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:postalCode) > 0">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$address/n1:postalCode"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:value-of select="$address/n1:postalCode"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>,&#160;</xsl:text>
							<xsl:value-of select="$address/n1:city"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:text>,&#160;</xsl:text>
						<xsl:value-of select="$address/n1:city"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:state) > 0">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>,&#160;</xsl:text>
							<xsl:value-of select="$address/n1:state"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:text>,&#160;</xsl:text>
						<xsl:value-of select="$address/n1:state"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:country) > 0">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>,&#160;</xsl:text>
							<xsl:value-of select="$address/n1:country"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<xsl:text>,&#160;</xsl:text>
						<xsl:value-of select="$address/n1:country"/>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>addresse non renseignée</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<xsl:text>addresse non renseignée</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-guardian </xd:desc>
		<xd:param name="guardian"/>
	</xd:doc>
	<xsl:template name="show-guardian">
		<xsl:param name="guardian"/>
		<br/>
		<xsl:for-each select="$guardian/n1:guardianPerson">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="$guardian/n1:guardianOrganization">
			<xsl:call-template name="show-name">
				<xsl:with-param name="name" select="."/>
			</xsl:call-template>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:addr">
				<xsl:call-template name="show-address-patient">
					<xsl:with-param name="address" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<br/>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block line-height="0.1cm">&#160;</fo:block>
			</xsl:if>
			<xsl:for-each select="$guardian/n1:telecom">
				<xsl:call-template name="show-telecom">
					<xsl:with-param name="telecom" select="."/>
				</xsl:call-template>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<br/>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block line-height="0.1cm">&#160;</fo:block>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>


	<xd:doc>
		<xd:desc> informant : show relatedEntity </xd:desc>
		<xd:param name="relatedEntity"/>
	</xd:doc>
	<xsl:template name="show-relatedEntity">
		<xsl:param name="relatedEntity"/>
		<xsl:if test="$relatedEntity/n1:code">
			<xsl:call-template name="translate-related-code">
				<xsl:with-param name="code" select="$relatedEntity/n1:code/@code"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$relatedEntity/n1:relatedPerson/n1:name">
			<xsl:call-template name="show-name-not-bold">
				<xsl:with-param name="name" select="$relatedEntity/n1:relatedPerson/n1:name"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> informant : Correspondance relatedEntity/code@code et libellé affiché </xd:desc>
		<xd:param name="code"/>
	</xd:doc>
	<xsl:template name="translate-related-code">
		<xsl:param name="code"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$code = 'FAMMEMB'">
					<span class="data">
						<xsl:text>(Membre de la famille) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'CHILD'">
					<span class="data">
						<xsl:text>(Enfant) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'DAU'">
					<span class="data">
						<xsl:text>(Fille) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'SON'">
					<span class="data">
						<xsl:text>(Fils) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'GRNDDAU'">
					<span class="data">
						<xsl:text>(Petite-fille) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'GRNDSON'">
					<span class="data">
						<xsl:text>(Petit-fils) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'FTH'">
					<span class="data">
						<xsl:text>(Père) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'MTH'">
					<span class="data">
						<xsl:text>(Mère) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'NFTH'">
					<span class="data">
						<xsl:text>(Père naturel) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'NMTH'">
					<span class="data">
						<xsl:text>(Mère naturelle) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'GRFTH'">
					<span class="data">
						<xsl:text>(Grand-père) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'GRMTH'">
					<span class="data">
						<xsl:text>(Grand-mère) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'BRO'">
					<span class="data">
						<xsl:text>(Frère) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'SIS'">
					<span class="data">
						<xsl:text>(Soeur) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'HUSB'">
					<span class="data">
						<xsl:text>(Mari) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'WIFE'">
					<span class="data">
						<xsl:text>(Epouse) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'DOMPART'">
					<span class="data">
						<xsl:text>(Partenaire PACS) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'ROOM'">
					<span class="data">
						<xsl:text>(Personne vivant sous le même toit) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'FRND'">
					<span class="data">
						<xsl:text>(Ami) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'NBOR'">
					<span class="data">
						<xsl:text>(Voisin) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'TUTEUR'">
					<span class="data">
						<xsl:text>(Relation de tuteur légal) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$code = 'SIGOTHR'">
					<span class="data">
						<xsl:text>(Autre relation) : </xsl:text>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="data">
						<xsl:text>{$code='</xsl:text>
						<xsl:value-of select="$code"/>
						<xsl:text>'?}</xsl:text>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$code = 'FAMMEMB'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Membre de la famille) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'CHILD'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Enfant) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'DAU'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Fille) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'SON'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Fils) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'GRNDDAU'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Petite-fille) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'GRNDSON'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Petit-fils) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'FTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Père) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'MTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Mère) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'NFTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Père naturel) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'NMTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Mère naturelle) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'GRFTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Grand-père) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'GRMTH'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Grand-mère) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'BRO'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Frère) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'SIS'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Soeur) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'HUSB'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Mari) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'WIFE'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Epouse) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'DOMPART'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Partenaire PACS) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'ROOM'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Personne vivant sous le même toit) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'FRND'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Ami) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'NBOR'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Voisin) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'TUTEUR'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Relation de tuteur légal) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$code = 'SIGOTHR'">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>(Autre relation) : </xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:otherwise>
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>{$code='</xsl:text>
						<xsl:value-of select="$code"/>
						<xsl:text>'?}</xsl:text>
					</fo:inline>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> informant : Correspondance relatedEntity/classCode et libellé affiché </xd:desc>
		<xd:param name="clsCode"/>
	</xd:doc>
	<xsl:template name="show-relatedEntityClass">
		<xsl:param name="clsCode"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$clsCode = 'ECON'">
					<span class="td_label">
						<xsl:text>Contact en cas d'urgence</xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$clsCode = 'NOK'">
					<span class="td_label">
						<xsl:text>Personne de confiance</xsl:text>
					</span>
				</xsl:when>
				<xsl:when test="$clsCode = 'CON'">
					<span class="td_label">
						<xsl:text>Informateur</xsl:text>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<span class="td_label">
						<xsl:value-of select="$clsCode"/>
						<xsl:text>  </xsl:text>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$clsCode = 'ECON'">
					<fo:inline font-size="6" margin-top="3px">
						<xsl:text>Contact en cas d'urgence</xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$clsCode = 'NOK'">
					<fo:inline font-size="6" margin-top="3px">
						<xsl:text>Personne de confiance</xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:when test="$clsCode = 'CON'">
					<fo:inline font-size="6" margin-top="3px">
						<xsl:text>Informateur</xsl:text>
					</fo:inline>
				</xsl:when>
				<xsl:otherwise>
					<fo:inline font-size="6" margin-top="3px">
						<xsl:value-of select="$clsCode"/>
						<xsl:text>  </xsl:text>
					</fo:inline>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-comm-patient </xd:desc>
		<xd:param name="commentaire"/>
	</xd:doc>
	<xsl:template name="show-comm-patient">
		<xsl:param name="commentaire"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span class="data">
				<xsl:value-of select="$commentaire"/>
			</span>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block xsl:use-attribute-sets="data">
				<xsl:value-of select="$commentaire"/>
			</fo:block>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-pédiatrie </xd:desc>
		<xd:param name="pediatrie"/>
	</xd:doc>
	<xsl:template name="show-pediatrie">
		<xsl:param name="pediatrie"/>
		<xsl:if test="$pediatrie/n1:paragraph/n1:content/@ID">
			<xsl:variable name="ped" select="$pediatrie/n1:paragraph/n1:content[@ID = 'pediatrie']"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$ped"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$ped"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-commentaire-pediatrie </xd:desc>
		<xd:param name="commentaire-pediatrie"/>
	</xd:doc>
	<xsl:template name="show-commentaire-pediatrie">
		<xsl:param name="commentaire-pediatrie"/>
		<xsl:if test="$commentaire-pediatrie/n1:paragraph/n1:content/@ID">
			<xsl:variable name="comm"
				select="$commentaire-pediatrie/n1:paragraph/n1:content[@ID = 'commentaire-pediatrie']"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$comm"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$comm"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<!-- ******** -->
	<!-- DOCUMENT -->
	<!-- ******** -->


	<xd:doc>
		<xd:desc> show-creation (du document) </xd:desc>
		<xd:param name="creation"/>
	</xd:doc>
	<xsl:template name="show-creation">
		<xsl:param name="creation"/>
		<xsl:choose>
			<xsl:when test="not($creation)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@value">
						<xsl:call-template name="formatDateTime">
							<xsl:with-param name="date" select="@value"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($creation/@nullFlavor)">
					<xsl:if test="$creation/@value">
						<xsl:call-template name="formatDateTime">
							<xsl:with-param name="date" select="$creation/@value"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-lot-version (du document) </xd:desc>
		<xd:param name="lot"/>
	</xd:doc>
	<xsl:template name="show-lot-version">
		<xsl:param name="lot"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($lot)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<span class="data">
								<xsl:value-of select="@extension"/>
							</span>
						</xsl:if>
						<xsl:if test="@root">
							<span class="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="@root"/>
								<xsl:text>]</xsl:text>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($lot/@nullFlavor)">
						<xsl:if test="$lot/@extension">
							<span class="data">
								<xsl:value-of select="$lot/@extension"/>
							</span>
						</xsl:if>
						<xsl:if test="$lot/@root">
							<span class="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="$lot/@root"/>
								<xsl:text>]</xsl:text>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($lot)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<fo:block xsl:use-attribute-sets="data">
								<xsl:value-of select="@extension"/>
							</fo:block>
						</xsl:if>
						<xsl:if test="@root">
							<fo:block xsl:use-attribute-sets="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="@root"/>
								<xsl:text>]</xsl:text>
							</fo:block>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($lot/@nullFlavor)">
						<xsl:if test="$lot/@extension">
							<fo:block xsl:use-attribute-sets="data">
								<xsl:value-of select="$lot/@extension"/>
							</fo:block>
						</xsl:if>
						<xsl:if test="$lot/@root">
							<fo:block xsl:use-attribute-sets="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="$lot/@root"/>
								<xsl:text>]</xsl:text>
							</fo:block>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-version (du document) </xd:desc>
		<xd:param name="version"/>
	</xd:doc>
	<xsl:template name="show-version">
		<xsl:param name="version"/>
		<xsl:choose>
			<xsl:when test="not($version)">
				<xsl:if test="not(@nullFlavor)">
					<xsl:if test="@value">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<span class="data">
								<xsl:value-of select="@value"/>
							</span>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="@value"/>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not($version/@nullFlavor)">
					<xsl:if test="$version/@value">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<span class="data">
								<xsl:value-of select="$version/@value"/>
							</span>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="$version/@value"/>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#160;&#160;</xsl:text>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-id (du document) </xd:desc>
		<xd:param name="id"/>
	</xd:doc>
	<xsl:template name="show-id">
		<xsl:param name="id"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($id)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<span class="data">
								<xsl:value-of select="@extension"/>
							</span>
						</xsl:if>
						<xsl:if test="@root">
							<span class="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="@root"/>
								<xsl:text>]</xsl:text>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($id/@nullFlavor)">
						<xsl:if test="$id/@extension">
							<span class="data">
								<xsl:value-of select="$id/@extension"/>
							</span>
						</xsl:if>
						<xsl:if test="$id/@root">
							<span class="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="$id/@root"/>
								<xsl:text>]</xsl:text>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($id)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="@extension"/>
							</fo:inline>
						</xsl:if>
						<xsl:if test="@root">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="@root"/>
								<xsl:text>]</xsl:text>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($id/@nullFlavor)">
						<xsl:if test="$id/@extension">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="$id/@extension"/>
							</fo:inline>
						</xsl:if>
						<xsl:if test="$id/@root">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:text> [</xsl:text>
								<xsl:value-of select="$id/@root"/>
								<xsl:text>]</xsl:text>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-commentaire-document </xd:desc>
		<xd:param name="commentaire-document"/>
	</xd:doc>
	<xsl:template name="show-commentaire-document">
		<xsl:param name="commentaire-document"/>
		<xsl:if
			test="$commentaire-document/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'commentaire-document']">
			<xsl:variable name="comm"
				select="$commentaire-document/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'commentaire-document']"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$comm"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$comm"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-commentaire-motif </xd:desc>
		<xd:param name="commentaire-motif"/>
	</xd:doc>
	<xsl:template name="show-commentaire-motif">
		<xsl:param name="commentaire-motif"/>
		<xsl:if
			test="$commentaire-motif/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']">
			<xsl:variable name="comm"
				select="$commentaire-motif/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$comm"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$comm"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-date-remise-document </xd:desc>
		<xd:param name="remise"/>
	</xd:doc>
	<xsl:template name="show-date-remise-document">
		<xsl:param name="remise"/>
		<xsl:if test="$remise">
			<xsl:variable name="ped" select="$remise"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:inline xsl:use-attribute-sets="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</fo:inline>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-date-consultation-annonce </xd:desc>
		<xd:param name="consult"/>
	</xd:doc>
	<xsl:template name="show-date-consultation-annonce">
		<xsl:param name="consult"/>
		<xsl:if test="$consult">
			<xsl:variable name="ped" select="$consult"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-motif-update </xd:desc>
		<xd:param name="motif"/>
	</xd:doc>
	<xsl:template name="show-motif-update">
		<xsl:param name="motif"/>
		<xsl:if test="$motif">
			<xsl:variable name="ped" select="$motif"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$ped"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$ped"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-motif-update-prec </xd:desc>
		<xd:param name="motif-prec"/>
	</xd:doc>
	<xsl:template name="show-motif-update-prec">
		<xsl:param name="motif-prec"/>
		<xsl:if
			test="$motif-prec/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']">
			<xsl:variable name="prec"
				select="$motif-prec/n1:table/n1:tbody/n1:tr/n1:td/n1:content[@ID = 'motif-maj-précision']"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$prec"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$prec"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-statut-document </xd:desc>
		<xd:param name="statut_document"/>
	</xd:doc>
	<xsl:template name="show-statut-document">
		<xsl:param name="statut_document"/>
		<xsl:if test="$statut_document">
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$statut_document"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:inline xsl:use-attribute-sets="data">
					<xsl:value-of select="$statut_document"/>
				</fo:inline>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-date-rcp </xd:desc>
		<xd:param name="date_rcp"/>
	</xd:doc>
	<xsl:template name="show-date-rcp">
		<xsl:param name="date_rcp"/>
		<xsl:if test="$date_rcp">
			<xsl:variable name="ped" select="$date_rcp"/>
			<xsl:variable name="year" select="substring($ped, 1, 4)"/>
			<xsl:variable name="month" select="substring($ped, 5, 2)"/>
			<xsl:variable name="day" select="substring($ped, 7, 2)"/>
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:block xsl:use-attribute-sets="data">
					<xsl:value-of select="$day"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$month"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$year"/>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<!-- *************** -->
	<!-- CONTACTS UTILES -->
	<!-- *************** -->


	<xd:doc>
		<xd:desc> participant : Correspondance code et libellé affiché </xd:desc>
	</xd:doc>
	<xsl:template name="participant">
		<xsl:variable name="vendor" select="system-property('xsl:vendor')"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:if test="n1:participant">
				<p class="contact">
					<xsl:text>Ccntacts Utiles</xsl:text>
				</p>
				<table border="0" width="100%" class="data">
					<tbody>
						<xsl:for-each select="n1:participant">
							<tr width="100%" class="border-bottom">
								<td width="20%">
									<xsl:variable name="participtRole">
										<xsl:call-template name="translateRoleAssoCode">
											<xsl:with-param name="code"
												select="n1:associatedEntity/@classCode"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$participtRole">
											<span class="td_label">
												<xsl:choose>
												<xsl:when test="@typeCode = 'RESP'">
												<xsl:if test="n1:functionCode">
												<xsl:if test="n1:functionCode/@nullFlavor = 'NA'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Établissements de référence</xsl:text>
												</span>
												</xsl:if>
												</xsl:if>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'REF'">
												<span style="font-weight:bold;">
												<xsl:text>Prescripteur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'REFB'">
												<span style="font-weight:bold;">
												<xsl:text>Praticien adresseur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'INF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'PCP'">
												<span style="font-weight:bold;">
												<xsl:text>Médecin traitant</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-180'">
												<span style="font-weight:bold;">
												<xsl:text>Organismes sociaux et de maintien dans l'emploi</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-181'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de soutien et d'information</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-188'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Informateur</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'PRF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'ATTPHYS'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de l'équipe de soins</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = '353'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Membre de l'équipe de soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<span style="font-weight:bold;">
												<xsl:text>Centre d'hébergement</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-178'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-190'">
												<span style="font-weight:bold;">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'PRELV'">
												<span style="font-weight:bold;">
												<xsl:text>Préleveur</xsl:text>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Exécutant</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'CON'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-179'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</span>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-191'">
												<span style="font-weight:bold;">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</span>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Consultant</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'VRF'">
												<span style="font-weight:bold;">
												<xsl:text>Vérificateur</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'ADM'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de l'admission</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'DIS'">
												<span style="font-weight:bold;">
												<xsl:text>Responsable de la sortie</xsl:text>
												</span>
												</xsl:when>
												<xsl:when test="@typeCode = 'AUTHEN'">
												<span style="font-weight:bold;">
												<xsl:text>Valideur des résultats</xsl:text>
												</span>
												</xsl:when>
												<xsl:otherwise>
												<span style="font-weight:bold;">
												<xsl:text>Participant</xsl:text>
												</span>
												</xsl:otherwise>
												</xsl:choose>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span style="font-weight:bold;">
												<xsl:text>Participant</xsl:text>
											</span>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td width="40%">
									<xsl:if test="n1:associatedEntity/n1:associatedPerson">
										<xsl:if test="n1:associatedEntity/n1:code">
											<xsl:call-template name="show-profession">
												<xsl:with-param name="code"
												select="n1:associatedEntity/n1:code"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<xsl:call-template name="show-contact-name">
											<xsl:with-param name="name"
												select="n1:associatedEntity/n1:associatedPerson/n1:name"
											/>
										</xsl:call-template>
										<br/>
										<xsl:if test="n1:associatedEntity/n1:addr">
											<xsl:for-each select="n1:associatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<br/>
											</xsl:for-each>
										</xsl:if>
										<br/>
										<xsl:if test="n1:associatedEntity/n1:telecom">
											<xsl:for-each select="n1:associatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
											</xsl:for-each>
										</xsl:if>
									</xsl:if>
									<br/>
									<xsl:if test="n1:associatedEntity/n1:scopingOrganization">
										<xsl:if
											test="n1:associatedEntity/n1:scopingOrganization/n1:name">
											<xsl:call-template name="show-contact-name">
												<xsl:with-param name="name"
												select="n1:associatedEntity/n1:scopingOrganization/n1:name"
												/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<xsl:choose>
											<xsl:when
												test="n1:associatedEntity/n1:scopingOrganization/n1:addr">
												<xsl:for-each
												select="n1:associatedEntity/n1:scopingOrganization/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:for-each select="n1:associatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
										<xsl:choose>
											<xsl:when
												test="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
												<xsl:for-each
												select="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:for-each
												select="n1:associatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<br/>
												</xsl:for-each>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
									</xsl:if>
								</td>
								<td width="40%">
									<xsl:value-of select="n1:functionCode/n1:originalText"/>
								</td>
							</tr>
							<tr/>
							<xsl:if test="$vendor = 'Transformiix'">
								<br/>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:if test="n1:participant">
				<fo:block line-height="0.3cm">&#160;</fo:block>
				<fo:block xsl:use-attribute-sets="contact">
					<xsl:text>Ccntacts Utiles</xsl:text>
				</fo:block>
				<fo:block>
					<fo:table xsl:use-attribute-sets="myBorder">
						<fo:table-column column-number="1" column-width="20%"/>
						<fo:table-column column-number="2" column-width="40%"/>
						<fo:table-column column-number="2" column-width="40%"/>
						<fo:table-body>
							<xsl:for-each select="n1:participant">
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="6" margin-top="5px" font-weight="bold">
											<xsl:variable name="participtRole">
												<xsl:call-template name="translateRoleAssoCode">
												<xsl:with-param name="code"
												select="n1:associatedEntity/@classCode"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="$participtRole">
												<fo:block>
												<xsl:choose>
												<xsl:when test="@typeCode = 'RESP'">
												<xsl:if test="n1:functionCode">
												<xsl:if test="n1:functionCode/@nullFlavor = 'NA'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<fo:block font-weight="bold">
												<xsl:text>Établissements de référence</xsl:text>
												</fo:block>
												</xsl:if>
												</xsl:if>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'REF'">
												<fo:block font-weight="bold">
												<xsl:text>Prescripteur</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="@typeCode = 'REFB'">
												<fo:block font-weight="bold">
												<xsl:text>Praticien adresseur</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="@typeCode = 'INF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'PCP'">
												<fo:block font-weight="bold">
												<xsl:text>Médecin traitant</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-180'">
												<fo:block font-weight="bold">
												<xsl:text>Organismes sociaux et de maintien dans l'emploi</xsl:text>
												</fo:block>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-181'">
												<fo:block font-weight="bold">
												<xsl:text>Structure de soutien et d'information</xsl:text>
												</fo:block>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-188'">
												<fo:block font-weight="bold">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</fo:block>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<fo:block font-weight="bold">
												<xsl:text>Informateur</xsl:text>
												</fo:block>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'PRF'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'ATTPHYS'">
												<fo:block font-weight="bold">
												<xsl:text>Responsable de l'équipe de soins</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = '353'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<fo:block font-weight="bold">
												<xsl:text>Membre de l'équipe de soins</xsl:text>
												</fo:block>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-177'">
												<fo:block font-weight="bold">
												<xsl:text>Centre d'hébergement</xsl:text>
												</fo:block>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-178'">
												<fo:block font-weight="bold">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</fo:block>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-190'">
												<fo:block font-weight="bold">
												<xsl:text>Structures et professionnels de proximité impliqués dans les soins</xsl:text>
												</fo:block>
												</xsl:if>
												</xsl:when>
												<xsl:when test="n1:functionCode/@code = 'PRELV'">
												<fo:block font-weight="bold">
												<xsl:text>Préleveur</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:otherwise>
												<fo:block font-weight="bold">
												<xsl:text>Exécutant</xsl:text>
												</fo:block>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'CON'">
												<xsl:if test="n1:functionCode">
												<xsl:choose>
												<xsl:when test="n1:functionCode/@code = 'CORRE'">
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-179'">
												<fo:block font-weight="bold">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</fo:block>
												</xsl:if>
												<xsl:if
												test="n1:functionCode/n1:translation/@code = 'ORG-191'">
												<fo:block font-weight="bold">
												<xsl:text>Structure de coordination ou d'interface ville-hôpital</xsl:text>
												</fo:block>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<fo:block font-weight="bold">
												<xsl:text>Consultant</xsl:text>
												</fo:block>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:if>
												</xsl:when>
												<xsl:when test="@typeCode = 'VRF'">
												<fo:block font-weight="bold">
												<xsl:text>Vérificateur</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="@typeCode = 'ADM'">
												<fo:block font-weight="bold">
												<xsl:text>Responsable de l'admission</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="@typeCode = 'DIS'">
												<fo:block font-weight="bold">
												<xsl:text>Responsable de la sortie</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:when test="@typeCode = 'AUTHEN'">
												<fo:block font-weight="bold">
												<xsl:text>Valideur des résultats</xsl:text>
												</fo:block>
												</xsl:when>
												<xsl:otherwise>
												<fo:block font-weight="bold">
												<xsl:text>Participant</xsl:text>
												</fo:block>
												</xsl:otherwise>
												</xsl:choose>
												</fo:block>
												</xsl:when>
												<xsl:otherwise>
												<fo:block font-weight="bold">
												<xsl:text>Participant</xsl:text>
												</fo:block>
												</xsl:otherwise>
											</xsl:choose>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="6" margin-top="5px">
											<xsl:if test="n1:associatedEntity/n1:associatedPerson">
												<xsl:if test="n1:associatedEntity/n1:code">
												<xsl:call-template name="show-profession">
												<xsl:with-param name="code"
												select="n1:associatedEntity/n1:code"/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:if>
												<xsl:call-template name="show-contact-name">
												<xsl:with-param name="name"
												select="n1:associatedEntity/n1:associatedPerson/n1:name"
												/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												<xsl:if test="n1:associatedEntity/n1:addr">
												<xsl:for-each select="n1:associatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												<xsl:if test="n1:associatedEntity/n1:telecom">
												<xsl:for-each
												select="n1:associatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
											</xsl:if>
											<fo:block line-height="0.1cm">&#160;</fo:block>
											<xsl:if
												test="n1:associatedEntity/n1:scopingOrganization">
												<xsl:if
												test="n1:associatedEntity/n1:scopingOrganization/n1:name">
												<xsl:call-template name="show-contact-name">
												<xsl:with-param name="name"
												select="n1:associatedEntity/n1:scopingOrganization/n1:name"
												/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:if>
												<xsl:choose>
												<xsl:when
												test="n1:associatedEntity/n1:scopingOrganization/n1:addr">
												<xsl:for-each
												select="n1:associatedEntity/n1:scopingOrganization/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:for-each select="n1:associatedEntity/n1:addr">
												<xsl:call-template name="show-address">
												<xsl:with-param name="address" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
												</xsl:otherwise>
												</xsl:choose>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												<xsl:choose>
												<xsl:when
												test="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
												<xsl:for-each
												select="n1:associatedEntity/n1:scopingOrganization/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:if
												test="not(n1:associatedEntity/n1:associatedPerson)">
												<xsl:for-each
												select="n1:associatedEntity/n1:telecom">
												<xsl:call-template name="show-telecom">
												<xsl:with-param name="telecom" select="."/>
												</xsl:call-template>
												<fo:block line-height="0.1cm">&#160;</fo:block>
												</xsl:for-each>
												</xsl:if>
												</xsl:otherwise>
												</xsl:choose>
												<fo:block line-height="0.1cm">&#160;</fo:block>
											</xsl:if>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="6" margin-top="5px" color="#003366">
											<xsl:value-of select="n1:functionCode/n1:originalText"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:block>

			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> participant : Correspondance associatedEntity/@classCode et libellé affiché </xd:desc>
		<xd:param name="code"/>
	</xd:doc>
	<xsl:template name="translateRoleAssoCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code = 'AGNT'">
				<xsl:text>non PS</xsl:text>
			</xsl:when>
			<xsl:when test="$code = 'PROV'">
				<xsl:text>PS</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>code='</xsl:text>
				<xsl:value-of select="$code"/>
				<xsl:text>'</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-contact-name </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-contact-name">
		<xsl:param name="name"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$name/n1:family">
					<xsl:choose>
						<xsl:when test="$name/n1:suffix">
							<xsl:for-each select="$name/n1:suffix">
								<span style="font-weight:bold; " class="data">
									<xsl:value-of select="."/>
								</span>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$name/n1:prefix">
								<span style="font-weight:bold; " class="data">
									<xsl:value-of select="."/>
								</span>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="$name/n1:given">
						<span style="font-weight:bold; " class="data">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</span>
					</xsl:for-each>
					<xsl:for-each select="$name/n1:family">
						<span style="font-weight:bold; " class="data">
							<xsl:value-of select="."/>
						</span>
						<xsl:if test="@qualifier">
							<xsl:choose>
								<xsl:when test="@qualifier = &apos;BR&apos;">
									<xsl:text> (Nom de famille) </xsl:text>
								</xsl:when>
								<xsl:when test="@qualifier = &apos;SP&apos;">
									<xsl:text> (Nom d'usage) </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<span class="data">
										<xsl:value-of select="@qualifier"/>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<span style="font-weight:bold;" class="data">
						<xsl:value-of select="$name"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$name/n1:family">
					<xsl:choose>
						<xsl:when test="$name/n1:suffix">
							<xsl:for-each select="$name/n1:suffix">
								<fo:inline font-weight="bold" xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:inline>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$name/n1:prefix">
								<fo:inline font-weight="bold" xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:inline>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="$name/n1:given">
						<fo:inline font-weight="bold" xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</fo:inline>
					</xsl:for-each>
					<xsl:for-each select="$name/n1:family">
						<fo:inline font-weight="bold" xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
						</fo:inline>
						<xsl:if test="@qualifier">
							<xsl:choose>
								<xsl:when test="@qualifier = &apos;BR&apos;">
									<xsl:text> (Nom de famille) </xsl:text>
								</xsl:when>
								<xsl:when test="@qualifier = &apos;SP&apos;">
									<xsl:text> (Nom d'usage) </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<fo:inline xsl:use-attribute-sets="data">
										<xsl:value-of select="@qualifier"/>
									</fo:inline>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<fo:inline font-weight="bold" xsl:use-attribute-sets="data">
						<xsl:value-of select="$name"/>
					</fo:inline>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show code (profession) </xd:desc>
		<xd:param name="code"/>
	</xd:doc>
	<xsl:template name="show-profession">
		<xsl:param name="code"/>
		<xsl:choose>
			<xsl:when test="$code/@displayName">
				<xsl:text> </xsl:text>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span style="font-weight:bold; ">
						<xsl:value-of select="$code/@displayName"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:block font-weight="bold" xsl:use-attribute-sets="data">
						<xsl:value-of select="$code/@displayName"/>
					</fo:block>
				</xsl:if>
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$code/n1:originalText">
				<xsl:text> </xsl:text>
				<xsl:value-of select="$code/n1:originalText"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- **************************************** -->
	<!-- INFORMATION SUR LES DONNEES PERSONNELLES -->
	<!-- **************************************** -->


	<xd:doc>
		<xd:desc> show-information-donnees </xd:desc>
		<xd:param name="commentaire"/>
	</xd:doc>
	<xsl:template name="show-information-donnees">
		<xsl:param name="commentaire"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span class="data">
				<xsl:value-of select="$commentaire"/>
			</span>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:block xsl:use-attribute-sets="data">
				<xsl:value-of select="$commentaire"/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<!-- ******* -->
	<!-- COMMUNS -->
	<!-- ******* -->


	<xd:doc>
		<xd:desc> show time </xd:desc>
		<xd:param name="datetime"/>
	</xd:doc>
	<xsl:template name="show-time">
		<xsl:param name="datetime"/>
		<xsl:choose>
			<xsl:when test="not($datetime)">
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="formatDateTime">
					<xsl:with-param name="date" select="$datetime/@value"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> formatDateTime </xd:desc>
		<xd:param name="date"/>
	</xd:doc>
	<xsl:template name="formatDateTime">
		<xsl:param name="date"/>
		<!-- day -->
		<xsl:choose>
			<xsl:when test="substring($date, 7, 1) = &quot;0&quot;">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($date, 8, 1)"/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="substring($date, 8, 1)"/>
						<xsl:text> </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($date, 7, 2)"/>
						<xsl:text> </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<xsl:value-of select="substring($date, 7, 2)"/>
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<!-- month -->
		<xsl:variable name="month" select="substring($date, 5, 2)"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Janvier </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Janvier </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '02'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Février </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Février </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '03'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Mars </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Mars </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '04'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Avril </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Avril </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '05'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Mai </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Mai </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '06'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Juin </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Juin </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '07'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Juillet </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Juillet </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '08'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Août </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Août </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '09'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Septembre </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Septembre </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '10'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Octobre </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Octobre </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '11'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Novembre </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Novembre </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$month = '12'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Décembre </xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Décembre </xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
		<!-- year -->
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<span class="data">
				<xsl:value-of select="substring($date, 1, 4)"/>
			</span>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:inline xsl:use-attribute-sets="data">
				<xsl:value-of select="substring($date, 1, 4)"/>
			</fo:inline>
		</xsl:if>
		<!-- time and US timezone -->
		<xsl:if test="string-length($date) > 8">
			<xsl:if test="not(contains($vendor, 'Saxonica'))">
				<span class="data">
					<xsl:text>, </xsl:text>
				</span>
			</xsl:if>
			<xsl:if test="(contains($vendor, 'Saxonica'))">
				<fo:inline xsl:use-attribute-sets="data">
					<xsl:text>, </xsl:text>
				</fo:inline>
			</xsl:if>
			<!-- time -->
			<xsl:variable name="time">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($date, 9, 6)"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="substring($date, 9, 6)"/>
					</fo:inline>
				</xsl:if>
			</xsl:variable>
			<xsl:variable name="hh">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($time, 1, 2)"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="substring($time, 1, 2)"/>
					</fo:inline>
				</xsl:if>
			</xsl:variable>
			<xsl:variable name="mm">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($time, 3, 2)"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="substring($time, 3, 2)"/>
					</fo:inline>
				</xsl:if>
			</xsl:variable>
			<xsl:variable name="ss">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="substring($time, 5, 2)"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="substring($time, 5, 2)"/>
					</fo:inline>
				</xsl:if>
			</xsl:variable>
			<xsl:if test="string-length($hh) &gt; 1">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="$hh"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="$hh"/>
					</fo:inline>
				</xsl:if>
				<xsl:if
					test="string-length($mm) &gt; 1 and not(contains($mm, '-')) and not(contains($mm, '+'))">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>:</xsl:text>
							<xsl:value-of select="$mm"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:text>:</xsl:text>
							<xsl:value-of select="$mm"/>
						</fo:inline>
					</xsl:if>
					<xsl:if
						test="string-length($ss) &gt; 1 and not(contains($ss, '-')) and not(contains($ss, '+'))">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<span class="data">
								<xsl:text>:</xsl:text>
								<xsl:value-of select="$ss"/>
							</span>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:text>:</xsl:text>
								<xsl:value-of select="$ss"/>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<!-- time zone -->
			<xsl:variable name="tzon">
				<xsl:choose>
					<xsl:when test="contains($date, '+')">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<span class="data">
								<xsl:text>+</xsl:text>
								<xsl:value-of select="substring-after($date, '+')"/>
							</span>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:text>+</xsl:text>
								<xsl:value-of select="substring-after($date, '+')"/>
							</fo:inline>
						</xsl:if>
					</xsl:when>
					<xsl:when test="contains($date, '-')">
						<xsl:if test="not(contains($vendor, 'Saxonica'))">
							<span class="data">
								<xsl:text>-</xsl:text>
								<xsl:value-of select="substring-after($date, '-')"/>
							</span>
						</xsl:if>
						<xsl:if test="(contains($vendor, 'Saxonica'))">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:text>-</xsl:text>
								<xsl:value-of select="substring-after($date, '-')"/>
							</fo:inline>
						</xsl:if>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- reference: http://www.timeanddate.com/library/abbreviations/timezones/na/ -->
				<xsl:when test="$tzon = '-0500'">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>, EST</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:text>, EST</xsl:text>
						</fo:inline>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$tzon = '-0600'">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>, CST</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:text>, CST</xsl:text>
						</fo:inline>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$tzon = '-0700'">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>, MST</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:text>, CST</xsl:text>
						</fo:inline>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$tzon = '-0800'">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>, PST</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:text>, PST</xsl:text>
						</fo:inline>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> </xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$tzon"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$tzon"/>
						</fo:inline>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-name (Nom en gras) </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-name">
		<xsl:param name="name"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$name/n1:family">
					<xsl:choose>
						<xsl:when test="$name/n1:suffix">
							<xsl:for-each select="$name/n1:suffix">
								<span style="font-weight:bold; " class="data">
									<xsl:value-of select="."/>
								</span>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$name/n1:prefix">
								<span style="font-weight:bold; " class="data">
									<xsl:value-of select="."/>
								</span>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="$name/n1:given">
						<span style="font-weight:bold; " class="data">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</span>
					</xsl:for-each>
					<xsl:for-each select="$name/n1:family">
						<span style="font-weight:bold; " class="data">
							<xsl:value-of select="."/>
						</span>
						<xsl:if test="@qualifier">
							<xsl:choose>
								<xsl:when test="@qualifier = &apos;BR&apos;">
									<xsl:text> (Nom de famille) </xsl:text>
								</xsl:when>
								<xsl:when test="@qualifier = &apos;SP&apos;">
									<xsl:text> (Nom d'usage) </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<span class="data">
										<xsl:value-of select="@qualifier"/>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<span style="font-weight:bold; " class="data">
						<xsl:value-of select="$name"/>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$name/n1:family">
					<xsl:choose>
						<xsl:when test="$name/n1:suffix">
							<xsl:for-each select="$name/n1:suffix">
								<fo:block font-weight="bold" xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:block>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="$name/n1:prefix">
								<fo:block font-weight="bold" xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:block>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="$name/n1:given">
						<fo:block font-weight="bold" xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</fo:block>
					</xsl:for-each>
					<xsl:for-each select="$name/n1:family">
						<fo:block font-weight="bold" xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
						</fo:block>
						<xsl:if test="@qualifier">
							<xsl:choose>
								<xsl:when test="@qualifier = &apos;BR&apos;">
									<xsl:text> (Nom de famille) </xsl:text>
								</xsl:when>
								<xsl:when test="@qualifier = &apos;SP&apos;">
									<xsl:text> (Nom d'usage) </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@qualifier"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<fo:block font-weight="bold" xsl:use-attribute-sets="data">
						<xsl:value-of select="$name"/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-name-not-bold (Nom pas en gras) </xd:desc>
		<xd:param name="name"/>
	</xd:doc>
	<xsl:template name="show-name-not-bold">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:choose>
					<xsl:when test="$name/n1:suffix">
						<xsl:for-each select="$name/n1:suffix">
							<xsl:if test="not(contains($vendor, 'Saxonica'))">
								<span class="data">
									<xsl:value-of select="."/>
								</span>
							</xsl:if>
							<xsl:if test="(contains($vendor, 'Saxonica'))">
								<fo:inline xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:inline>
							</xsl:if>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$name/n1:prefix">
							<xsl:if test="not(contains($vendor, 'Saxonica'))">
								<span class="data">
									<xsl:value-of select="."/>
								</span>
							</xsl:if>
							<xsl:if test="(contains($vendor, 'Saxonica'))">
								<fo:inline xsl:use-attribute-sets="data">
									<xsl:value-of select="."/>
								</fo:inline>
							</xsl:if>
							<xsl:text> </xsl:text>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$name/n1:given">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="."/>
							<xsl:text> </xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
						</fo:inline>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="$name/n1:family">
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="."/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="@qualifier">
						<xsl:choose>
							<xsl:when test="@qualifier = &apos;BR&apos;">
								<xsl:text> (Nom de famille) </xsl:text>
							</xsl:when>
							<xsl:when test="@qualifier = &apos;SP&apos;">
								<xsl:text> (Nom d'usage) </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not(contains($vendor, 'Saxonica'))">
									<span class="data">
										<xsl:value-of select="@qualifier"/>
									</span>
								</xsl:if>
								<xsl:if test="(contains($vendor, 'Saxonica'))">
									<fo:inline xsl:use-attribute-sets="data">
										<xsl:value-of select="@qualifier"/>
									</fo:inline>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:value-of select="$name"/>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:value-of select="$name"/>
					</fo:inline>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-address </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
	<xsl:template name="show-address">
		<xsl:param name="address"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$address">
					<xsl:if test="$address/@use">
						<xsl:text> </xsl:text>
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="$address/@use"/>
						</xsl:call-template>
						<xsl:text>:</xsl:text>
					</xsl:if>
					<xsl:for-each select="$address/n1:streetAddressLine">
						<span class="data">
							<xsl:value-of select="."/>
						</span>
					</xsl:for-each>
					<xsl:if test="$address/n1:streetName">
						<span class="data">
							<xsl:if test="$address/n1:additionalLocator">
								<xsl:value-of select="$address/n1:additionalLocator"/>
								<br/>
							</xsl:if>
							<xsl:value-of select="$address/n1:houseNumber"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetNameType"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetName"/>
						</span>
					</xsl:if>
					<xsl:if test="string-length($address/n1:postalCode) > 0">
						<br/>
						<span class="data">
							<xsl:value-of select="$address/n1:postalCode"/>
						</span>
					</xsl:if>
					<xsl:if test="string-length($address/n1:city) > 0">
						<xsl:text>,&#160;</xsl:text>
						<span class="data">
							<xsl:value-of select="$address/n1:city"/>
						</span>
					</xsl:if>
					<xsl:if test="string-length($address/n1:state) > 0">
						<xsl:text>,&#160;</xsl:text>
						<span class="data">
							<xsl:value-of select="$address/n1:state"/>
						</span>
					</xsl:if>
					<xsl:if test="string-length($address/n1:country) > 0">
						<xsl:text>,&#160;</xsl:text>
						<span class="data">
							<xsl:value-of select="$address/n1:country"/>
						</span>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<span class="data">
						<xsl:text>addresse non renseignée</xsl:text>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="$address">
					<xsl:if test="$address/@use">
						<xsl:text> </xsl:text>
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="$address/@use"/>
						</xsl:call-template>
						<xsl:text>:</xsl:text>
					</xsl:if>
					<xsl:for-each select="$address/n1:streetAddressLine">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="."/>
						</fo:inline>
					</xsl:for-each>
					<xsl:if test="$address/n1:streetName">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:if test="$address/n1:additionalLocator">
								<xsl:value-of select="$address/n1:additionalLocator"/>
								<fo:block line-height="0.1cm">&#160;</fo:block>
							</xsl:if>
							<xsl:value-of select="$address/n1:houseNumber"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetNameType"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="$address/n1:streetName"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="string-length($address/n1:postalCode) > 0">
						<fo:block line-height="0.1cm">&#160;</fo:block>
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:postalCode"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="string-length($address/n1:city) > 0">
						<xsl:text>,&#160;</xsl:text>
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:city"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="string-length($address/n1:state) > 0">
						<xsl:text>,&#160;</xsl:text>
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:state"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="string-length($address/n1:country) > 0">
						<xsl:text>,&#160;</xsl:text>
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:country"/>
						</fo:inline>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>addresse non renseignée</xsl:text>
					</fo:inline>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-telecom </xd:desc>
		<xd:param name="telecom"/>
	</xd:doc>
	<xsl:template name="show-telecom">
		<xsl:param name="telecom"/>
		<xsl:choose>
			<xsl:when test="$telecom">
				<xsl:variable name="type" select="substring-before($telecom/@value, ':')"/>
				<xsl:variable name="value" select="substring-after($telecom/@value, ':')"/>
				<xsl:if test="$type">
					<xsl:if test="not(@use) or ($type = 'mailto')">
						<xsl:call-template name="translateTelecomCode">
							<xsl:with-param name="code" select="$type"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="@use">
						<xsl:text> </xsl:text>
						<xsl:if test="($type != 'mailto')">
							<xsl:call-template name="translateTelecomCode">
								<xsl:with-param name="code" select="@use"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($type = 'mailto')">
							<xsl:text>(</xsl:text>
							<xsl:call-template name="translateTelecomCode">
								<xsl:with-param name="code" select="@use"/>
							</xsl:call-template>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:text>: </xsl:text>
					<xsl:text> </xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$value"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:inline xsl:use-attribute-sets="data">
							<xsl:value-of select="$value"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Coordonnées téléphoniques non renseignées</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xd:doc>
		<xd:desc/>
		<xd:param name="code"/>
	</xd:doc>
	<xsl:template name="translateTelecomCode">
		<xsl:param name="code"/>
		<xsl:choose>
			<!-- lookup table Telecom URI -->
			<xsl:when test="$code = 'tel'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Tel</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Tel</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'fax'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Fax</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Fax</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'http'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Page Web</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Page Web</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'mailto'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Adresse de messagerie</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Adresse de messagerie</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'H'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Domicile</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Domicile</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'TMP'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Adresse temporaire</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Adresse temporaire</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'HV'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Domicile de vacances</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Domicile de vacances</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'HP'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Domicile principal</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Domicile principal</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'WP'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Travail</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Travail</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'PUB'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Numéro Public</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Numéro Public</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'DIR'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Numéro direct</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Numéro direct</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'EC'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Urgence</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Urgence</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'MC'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Mobile</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Mobile</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$code = 'PG'">
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>Pager</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>Pager</xsl:text>
					</fo:inline>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(contains($vendor, 'Saxonica'))">
					<span class="data">
						<xsl:text>{$code='</xsl:text>
						<xsl:value-of select="$code"/>
						<xsl:text>'?}</xsl:text>
					</span>
				</xsl:if>
				<xsl:if test="(contains($vendor, 'Saxonica'))">
					<fo:inline xsl:use-attribute-sets="data">
						<xsl:text>{$code='</xsl:text>
						<xsl:value-of select="$code"/>
						<xsl:text>'?}</xsl:text>
					</fo:inline>
				</xsl:if>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<xd:doc>
		<xd:desc> show-address-city </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
	<xsl:template name="show-address-city">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:text>:</xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:city) > 0">
					<xsl:text> </xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$address/n1:city"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:city"/>
						</fo:block>
					</xsl:if>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-address-county </xd:desc>
		<xd:param name="address"/>
	</xd:doc>
	<xsl:template name="show-address-county">
		<xsl:param name="address"/>
		<xsl:choose>
			<xsl:when test="$address">
				<xsl:if test="$address/@use">
					<xsl:text> </xsl:text>
					<xsl:call-template name="translateTelecomCode">
						<xsl:with-param name="code" select="$address/@use"/>
					</xsl:call-template>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:text>:</xsl:text>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block xsl:use-attribute-sets="data">
							<xsl:text>:</xsl:text>
						</fo:block>
					</xsl:if>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<br/>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block line-height="0.1cm">&#160;</fo:block>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length($address/n1:county) > 0">
					<xsl:text> </xsl:text>
					<xsl:if test="not(contains($vendor, 'Saxonica'))">
						<span class="data">
							<xsl:value-of select="$address/n1:county"/>
						</span>
					</xsl:if>
					<xsl:if test="(contains($vendor, 'Saxonica'))">
						<fo:block xsl:use-attribute-sets="data">
							<xsl:value-of select="$address/n1:county"/>
						</fo:block>
					</xsl:if>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>


	<xd:doc>
		<xd:desc> show-identifiant </xd:desc>
		<xd:param name="id"/>
	</xd:doc>
	<xsl:template name="show-identifiant">
		<xsl:param name="id"/>
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($id)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<span class="data">
								<xsl:value-of select="@extension"/>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($id/@nullFlavor)">
						<xsl:if test="$id/@extension">
							<span class="data">
								<xsl:value-of select="$id/@extension"/>
							</span>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<xsl:choose>
				<xsl:when test="not($id)">
					<xsl:if test="not(@nullFlavor)">
						<xsl:if test="@extension">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="@extension"/>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="not($id/@nullFlavor)">
						<xsl:if test="$id/@extension">
							<fo:inline xsl:use-attribute-sets="data">
								<xsl:value-of select="$id/@extension"/>
							</fo:inline>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> Logo Gestionnaire RCP encodé en B64 </xd:desc>
	</xd:doc>
	<xsl:template name="printLogo">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<img
				src="data:image/png;base64,/9j/4AAQSkZJRgABAQEA3ADcAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/
      2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCABPAQ0DASIAAhEBAxEB/
      8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q
      0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/
      8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKj
      U2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/
      9oADAMBAAIRAxEAPwD9U6Q0zftzk8VmXnibSrKTy7jUra3cdVkmVT+RNUouWyMqlWnS1nKxrLQ1VLHVLXUIw9tcR3Cf3o3DD8xVljUu8dyozjNc0XdAzYX2rz7WPiFeapqU2keEbNdTvI8rPeSHbbW592/
      iPsKk8fX19rN9b+FtIuDbXF0vm3d0pOYYB1x6MegrwH9p79qLTP2Z9Ei8GeDbaCfxbLDvZpPmSzU9JZP7znqFP1PFVhac8dV9jQV2cOKrqkm5u0V1/wAj2TVvC9rZ2pvPHfjcxB/4DdLZW4HcAEjP8653w18Z/
      gZ4I1CePTvGujQXc2EkJvGfdg8cnIr8n/GXjrxB8RNWk1PxNrN5rd7J96S7lLAewHRQPQCsRbV2h8xbeQxEZDiI7fzxivuKXC8IxTq1LM+UecJS5qdP5s/drw74w0HxZCZdF1mx1WPGS1ncpLge+0nH41
      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
      "/>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:external-graphic content-height="scale-to-fit" content-width="50%"
				scaling="non-uniform"
				src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEA3ADcAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/
				2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCABPAQ0DASIAAhEBAxEB/
				8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q
				0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/
				8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKj
				U2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/
				9oADAMBAAIRAxEAPwD9U6Q0zftzk8VmXnibSrKTy7jUra3cdVkmVT+RNUouWyMqlWnS1nKxrLQ1VLHVLXUIw9tcR3Cf3o3DD8xVljUu8dyozjNc0XdAzYX2rz7WPiFeapqU2keEbNdTvI8rPeSHbbW592/
				iPsKk8fX19rN9b+FtIuDbXF0vm3d0pOYYB1x6MegrwH9p79qLTP2Z9Ei8GeDbaCfxbLDvZpPmSzU9JZP7znqFP1PFVhac8dV9jQV2cOKrqkm5u0V1/wAj2TVvC9rZ2pvPHfjcxB/4DdLZW4HcAEjP8653w18Z/
				gZ4I1CePTvGujQXc2EkJvGfdg8cnIr8n/GXjrxB8RNWk1PxNrN5rd7J96S7lLAewHRQPQCsRbV2h8xbeQxEZDiI7fzxivuKXC8IxTq1LM+UecJS5qdP5s/drw74w0HxZCZdF1mx1WPGS1ncpLge+0nH41
				srkV+DnhfxTq/gzVYNU0DVLrSL+E5juLOYxn9Ov41+kP7HP7aD/Fq4i8HeM5IoPFaofsl8qhEv1A5BHQSAc8cHH4V5eYZFVwcPa03zRX4Hs4LOKeJl7Oa5ZH2H2PFef/H7/kifjX/sFzf+g16Cv3RXn3x//
				wCSJ+Nf+wXN/wCg183D40e/U+FnV+Ev+RT0X/ryh/8ARa1sVj+Ev+RT0X/ryh/9FrWrvC9TxSZUdh9FM81fX6UCQc80ih9FM8wHGDQ0g9aAH0VHvz0NHmDHWgB9LUfmK3Q0jSbcZOPrQBLRTDIAOtIZB6+
				1K4ElFM8xe5xSbx60wJKKj3hRnPFL5goAdS1H5qscA0vmDsaAH0Uzf70eYAMk0APopnmD1pysGpAeAftUfGDUPh/o1npOjSeRqmpK5Nwv3oIlwCy++SBXyToHgbxN8Rrq6m0ywutbmi+aeaRg2CecFmPU+
				lfSH7TnwW8WeOfGNjrGiWqahZi1Fu0XmBHjIYnPPUHP6V337Nfw41f4d+Bbi112CO3vbi7afy433kLtCjJ9eK/QsHjsNlmWxqUeWVV73Pw3Mspx+f59OlieaFCK0fT+mz468H+NvEfwp8SedYy3NncW0my
				50+YkRvjqjqen1FfoX4M8UW3jHwtputWrf6PeQLMP9nIyQfoc/lXwZ+0C6N8YvE3lMuPtCjj12LmvrD9m9JIfgHpTOCCYJ2X6b3I/TFZ8Swp1MDSxyjaTX6XDgevXw2Z4jLeZypxvb5Oxk618RH8J6B4s8
				SwhbjVGS4uQZPu29tApAJ/Lgdya/JTxN4k1Dxh4i1LW9WuGu9SvpmuLiZzksxOfyHQfSv0o+MVibD9kH4h6orMLm7iWHd3EYmQbR7HJ/OvzDYERt/e2nmvI4Fo8uEniZ7tn3OfVJSnCmfdP7GP7JPhzVPB
				cfxN+IltFeWEymXTtPuP9Qsan/XSD+LJB2r0xg96+tbXxb4dkss23gWVtExxcLpsYi2f3guOlU/7JtbX4M+ANDgTytPmjsYDEhxlAgbHHbivX47VY4REqqsYXaFxwB2FeBjswrY3E1Fzar7vI+hwmEVGnG
				MOyvpuz4b/ay/Y98N+J/BV38QPhpYR2moW8bXN3ptkuIbuPq7Kn8Mi8nA64xXxR8G/Cfizxl8Q9Fh8F2l1d61b3UVwktqCPs4VxmR26Ko96/YCazv8A4f6rdS2VlJqPh67bzJLW3G6S2c/eKr3U+lVvC9/
				4b0W8eLwv4OkspbybddSWunLarycl3bAzj+tdeB4onh8PLDYhXlsjmxGT061aNWLt3seiWvmfZYhMQZQg3lem7HOPxrhfj9/yRPxr/wBgub/0GvQFGVGK8/8Aj9/yRPxr/wBgub/0GvOhrNM9yekGvI6vwl/
				yKei/9eUP/ota479obx1qPw1+CfjHxNpQj/tHTrFpbfzhlQ5IUE/TOfwrsfCX/Ip6L/15Q/8AotayfipY+GtS+Huv2vjCSOHwxNaOmoSTMVVYj1ORyMcfjWkLKom11Jkm6bt2PmrxTL8UPhX8LPFetv8AEW
				TXrWbwn/acL3xjW+s74lctEoX/AFO045zg1kSfFLxj4T/Z98QeIrfX/GE2t3T6fZQ3Hi3To7dbdpyoeW2wB5g+Y4J9q0vDHw6+DOu+BfGt9/wtG88V2aaJ/Y91ql5dhpdL04EMqKu0HGQPmIOa6HwN8PfA
				3xm8C6t4T034r6z45062lspWEkik2PktujVPkXAbbg9eBXsOdJK7XXXS2h5EY1G2lLp3uZ2j/wDCcDxN8S/hzP8AEfWp/wCxNNtdasteMcQvULKzPCTt2lCR6ZFcXc+NPHnh39kix+IE/wARNbutV1y5skZ
				3SMmxQzlJPKwuSWX1z0Fe1rq3wrsPjt4pgbxrbL4z8RWEWjXGktMMRhFIAU4wHOfuk59qwb7RPhE3hbQvgRP47RL/AEm8t2it/OAuWljk8xY2bG3cTxtzmpjUjdXhpo9ultSpU9NJa6rc8b1D48+Nh8FPEN
				3pvjHVdQt7XxrZ6Rp+t/ZlTUprRx+9Rotow+7IUEDPFfSnw51PV7H4G+I9Sm1fxRe6hFBeTwT+LLNLW9hKxfKAijG0EZB75NeefErwL8HW8UeIfCusfEFtC8R+JdetNfNvHcKslvdRIEiCnaVXOAcMck1
				20fizwL8ObW9+G/iv4pzatrWsbot2tXCm4jEybAm5FCpkcgN3NKrKnOK5I21vt008gpc9OTU5La2/U8N+HHxU+Ieh+HfBGo6j41vfEKeMvCV/qskd9FGGsrmGEurROqj5fY5r0r9jbxV4h8Z6eNV17XvGWq
				TXOnRyumvWCQ6fvLctbSAZc/0riLHwR8MfhH8R9I8GX3jdtRmttKm0NF1q/bztNjnULHFbQpHt3PuyXY8CvQ/gjffD74V+Lv8AhCLP4vXmvX1sn9mweHdTnTZbuhztTCD5h0xk1pXdOVOSitXrt0IoKaqJy
				lovPqYWq6t8SfiH8QviZd6B48Xwwvg7UbazsNLmCLYXClQ0huWKk/MCQMdKw/ip8QfiFea98WNa0vxlPoEHw/iszaaTZQo1tdyMqvKZ9wywOSBgjAroPH3gP4PeLvjNqOh3HxAudK1jX7iBtY8K2d2Fh1Ke
				LBjDnadr8DKhgT3FdBq3wB+H3xn17xHq2j+KNSgsLmVNN8R6XpNzttrx7fGI5QRlSuACVPI4rNVKas5LS3b0/M05Kkr2fXueWfET4r/EDUx8UvF+l+MLnQ4fAdnptzaaLaxI1reGaBJZBNkbiCWIGDwKxfjV
				+0F4v0L4o6/9g8Zalo09taaLNpOiw2yyWVxLcIhmSZivyLzkEkda9JvPh38GvjV8RNX0rQ/Hs4lvFiTXPDek3e2DUhbgKgYlckKFAOw9BWhfeF/g38VvGfj7w5YeNo5da8QWlnZXWnWkozbrZfd8kkYYj
				HOCelbRqUYtOUL/AC9P+CYclaSsp2+ZwfxR+JnxC0/xp8Xda0/xneaZF4Jg066ttEjjjezn8wL5iPkZwSTyCK3/ABH8dvF+h6f+0HqUGpb30K10ttJilUNHZvPbguVHf5ju59BTPHXgv4J319ceMdb
				+Jl9aeHfEcqWF3Yx3JS11GSzAQxvhCx2lRkZFelWfwL8EfFPwx441LSNaurnR/iBHamW4tmG2NLdPLTysjjIXnNZSqUYxV49unpf9TWMK0m4qWvqeP3nxa8efBq68b6NP4puvFxj8Fx+I7O81ZE821u
				WZVKjaACmX3YP90UnwL+J2uePvHl74FsfijqviC01bw0moPrLQotzpd8GXzFiygBXBxgggV7r4y/Zd8PeNdU1W+ur++hl1Dw8vhx1iZcLArKwcZH3sqPatzQ/gVo3h/wCIel+L7a4nF9p+iLoUcJ2iNolxh
				2wPvcVl7ehyNW1/W3+ZrHD1lJXeiPmPT/E3xA0f4L/FvxZN8R9b1C+0HULnR7KOdYti+XLGFnyFzvwSOuOav+PviF8Qte1b4i3+meNbvw/b+A9C0++t7K0iRkvppIhJIbjcCSD0wMV7xJ+zXocvw68Z
				+DzqF6LHxRqE2o3U2V8yKSRlYhOMYG0dayfGn7I/h3xlrU9+Na1nSE1Gyt9P1m10+4CRapBCAI1kyCVOBgleoqliKLk3Jfh6f8EX1eskkvz6nkvjT4kePPHviTxGNL8XXXhO28NeDLTxDFBpsSMLq6l
				Quwl3A5TjG0Yr6c+D3ii68b/C3wr4gvti3upabBdTBOF3sgJwPrXNy/s66A2ueLNRiubq3/4SHRItBlgjI2QQRqVUx8fewe/pXb+A/B9v4B8F6J4bs5ZJ7XSrSO0ikm5dlRcAnHfiuStUpzilBdvy1/
				E6cPSqQleZt7TtO4Aj0r4q+L37RXjbRfiJ4g0iy1RNPs7W4aCGJYU3BQBzlgeT1zX2sx/Kua1jwD4a166kutR0Wyu7hxtaaWBWY47E4rpy3FUMJUc8RT50eJxBluMzKhGng63s5J3fmfnHZsniTXo21X
				U2shdzbrnUrgGQruPLt61+jXhrSbDQ/ANrYaY6y2FvYiOGRTkMoTg5756/jXwx8f8AwjZeCvinq2m6dGkFg8UdwkKj5Y94OQB6ZB/OvqX9mXU5tQ+Bdqk0jSNbJPAu487VJ2j8AQPwr6vie2Ky+liqbt
				G2x+X8C/7Dm2JwNZXnr73oziP2g4hH+xH4mI/itUb87hK/KqT/AFb/AENfqx+0N/yZH4i/68o//ShK/Kh/9Wx61y8I6Zc7f1ofoGefx4eh+vi6xJqVj4Cs7c+Za6fDZ/aJB081kXC/UD+de9r0rxLQNBh0
				D4X+AYkO+aWazmmk7u5Qfy6fhXtatgCvzOhGccXXdR6t3PtKPwL0QrCjb7Vj+JPF+l+FLcTandLbIxwinJZz6Ko5J+lc9Y/GTw9dXKwzPc6fvbCPeW7RI/oQxGPzr0PdKlVhGXK3qd12rz74/wD/ACRPxr/
				2C5v/AEGu+jmWWNWUhlYZDKcg1wPx+/5In41/7Bc3/oNbU/jQ56wfodX4T/5FPRf+vKH/ANFrXnP7V1vNefs5/ECGGJ55m0uQLHGpZmOR0A616L4R/wCRU0X/AK8oP/Ra1evJobe3kkuHRIUBLtJjaB75r
				SMuWafZkTSdNpu2h+eXiO6tfHGgeM9X8MabdPptl8MotKvrlbB4Ve9EinyxlQXYAdQDjFfSf7JXiaLW/Dd1aDxiniq5tbe13RLog042Q8sDyyQB5vII3Hnj3r1jSfG/hXVtLu72w1fT7jT7UlbiWGVDHG
				f9rHA/GtN9Y0nTWlVrq1tfLh+0SDcq7YufnP8As8da9CviZVocnI0eXRp0oy9oppnxV4T1fwtoTa/4G8U+EL/XPGd18RJNQtdNigkjm8tpleK7EwABjVQW64PTvXE+JvDvjB/Cviq9jtdNfQf+FkCU/
				wChy/2p53noA6vjGzn+fNfohDeabcajEqS273skPmpgr5hjz94d9uSPzq29tCsbFkQJnd90Yz601jHB6R3/AK0K+qKor8239anwp8QNBN18P/2pZ20xprv/AISO3aCQ25aQ7VgwUOMnHPT3p+qa54Y8L6/
				8WtC8a+FL7xJqfiO80ybSdJit5BLqC+UgVo5gPlCNyTkYwa+yNJ8ZeGdeub2107VbC+mtT/pMcMiOUx3YfhV231nRtU+xTw3VpcG4VjayKysXUDJ2Hvj2oWKlGLjKD/q3+RkqVGVnGon939dT40XWf+EV/
				au8W/aPE7eD7e5k0kLZz6H9vF8ojUGISkHyyPu7ge+e1cTqfh/W4/Eup6pqFr9p8GR/FOP7RY29oyah5xkHlypNg/ugxXKjqAeea+99P8XeGtZ1q402z1LT7vU7fmWCORGlTHXI68U218ZeHL7W59Eg1Sx
				m1SH53s1kQyKR32+tafW5xvaHRL/gmfsaFl+9W7t/kfDXiby5JvFXgUaZdt48v/ibHqlnALNzI1r5sbeeJduAm1W5z/OvQvgJ8RtF8OyfFLwVez3Fn4o1nxLqX9n2rWso84up2EPt2jODyTX1HB4x8N3
				PiKTSItUsJNcjBDWyyKZgO4x1oj8WeHJvEh0VNTsW1wDc1oHTz+menXOKmWIco8soPv8A15aFwp04yUo1V2/4HqfDnwd8vX734I+G9H026g8TeGrfVU11DZvC1oWVwokcqB8zEEc89ai+Bd5cSeJPg/
				4Wg0eGfU9CvNROr2dxpk0V3p0haXdOZwwQq6lQAQc4zX6ELaxK7uiKrv8AeZVAJ9MnvQtpEsjSLGqyMPmcKAW+pqXjtGuXf/g/5nR9Rd78x+bKi70PwH8KLuS9n8Mpb+MNed9Tm0xrsWoJYBzCQdwPTn1z
				X358JdUh1r4e6FeQauNeR7cD+0ls/sguGBIL+SANmSOldS1jDIu1okZc5A2DAqWOFYwAqhVHQAYFc9fE+2io22v+J0YfDexk5XvclooorhO8KKKKACiiigD5y/aU+PWt/DPVbDR9ChjiubiE3L3d1GXXa
				DgKozyfX04pvgL9r/w7qGjqniffpWqxx5cpEzxTn1TGSM+h/OvVPid8JdB+KmkpaatAwmiybe6hbbJCSOoP9DxXztq37EutR3ROm+JLOS3P/P5CyuP++civr8FLKK+GVLFe5Nbvufk+bx4nwePniMv/
				AHlOWy7fkeP/ABg8eRfEbx5qWvwxNBZSRpDAsgw+xQRk+hOTxX2J+y/oFxo3wf0mO9gMUl0HuDG452uxK5+q4rhPh/8Asaafo+oQXviXU11gxEOLKKPZAWB43Z5Ye1fSdvax20aRxKqIq7VVRgAVpn
				WZYath4YLCaxj1I4S4fx+GxtXM8y0nPp6nkv7VPhJ9d/Zv8c6Vp0SxsunNPHFGuAfLIkKgD1Cn86/GggNEVP8AEOtfvffWcV/ZTW06CSGZDHIhGdykYI/Kvxt/ag+BN/8AAX4mX2mNbv8A8I/
				eSNPpN0QSrwk58vd/eTofwPetOGcRCHPh3o3sfVZ9Ql7laKvbQ/SL4WeJR8XP2cvB+t6SUm1C1t4GaFCDieEbZI/Y8H8xXoUPxY0CSx3yzSQ3gGGsWibzQ/8AdxjrX5Rfs8/tQ+Kf2d9TuP7LWPVNDvG
				DXek3LFUdgMb0YfcbHfvxmvriL/gpp4FksVnm8Gawmo7c+UDCw3f7+a+fzLh3HQxUquE1Uv6/A7sFm1CdJKpK0lufQ91qFh4Z0fVviH42KWUFrE00SXGMWsK9AM/xt/WvC/hz/wAFAPAHxW1+fw14r0Nv
				DVjdyFLO6v5FkglB4USHA8tj69Oeor5J/aO/a88T/tCeXp0kC6H4YhcSJpdu5YyuOjSt/ER2HQe9cX8BPgzqnxy+I+neHdPicWqus+oXgXKWtuD8zE+pxgDuTXs4Lh2nhcFKeMfvd+x51fNpVsQqeGV1103
				P1g0/7T8MfE+nadHPJeeF9UfyrdZG3NaS4yAG7oa0Pj82fgn40/7Bc3/oNUPEsUV94q8KeFdOG9NMKXk75z5UUa7UB9z71f8Aj7/yRPxp/wBgub/0Gvj6VlNJdz6WndRnHojq/CP/ACKui/8AXlB/6LWuT
				+PGk3uufCfxDZ6dBJc3ckGVhi++4DAso9cqDXWeEf8AkVdF/wCvKD/0WtaxiVuozWsZck1LszStR+sUZUm91Y+c/El5o/ir4T+L4/C3h25t7n+z4YZpl09ofPcZxGoIBcpznjv1qhqXgzxVJN4ptb6aTWbq
				58JCG2aO08oBtzfuuOC2fxr6aW3jUYCgCl8pR25rvjjnBWjH+tP8j5qfD/tXGU6mqVtFZdenzPCfhZqDeKviNYaha2N9DZafoC2U0l3bPEFmLqTGNwGSApzjjpXrvjBXbwnqyxqzyG1l2qnUnaenvWwkKR5
				2jH0p20GuWrX9pUU0tj2MJgHh8NKhKd3K+vqfKvgP4f694d1jwjdyr50cvh64RkhsPI8klUYJIw6nn+LnOaj+GfhDxH4b8SeC9Oe1uv7Ilsri/gklRv8ARJpICskLcfL853DPqRX1b5SjoMUeSnHFd39p
				T1vFar/M8CPC9KLi41GuV3/K/wCR8t/Ctb+38VeFNKtdHMF1ZQ3cWsNcaaUkgfLESCcjneSvAJyOavfBu1j0vxVLpms6fcXWsx3t3LF/xKtn2PLsTK1wfvhwRg5PXHavpXyEDEhQDR9nj5+Qc8HionjuZS
				XLua0uHvZOD9rflbe3T+up8l+FfBHiO21DwfrN7byS2z+IrhpLb7FsuYSXkCyySjkr654wVret2l8O/FpI9Ctby8nutaaS80/UdL5hR1w9xFc44XpjnvivpfyVxjHFJ5Cbs45+lOWYObfNHpYVPhyNGKVOo
				9Gncev3RS0lLXkn2YUUUUAFFFFABRRRQAUUUUAM2j60bRTsUUgGY9qd7YpaWmA0g9K474pfCjw18X/Cs2geKNOS+sZPmRs4khfs8bdVYe1dligjNVCTptSi7NESjGacZK6Z+Z3xQ/4JreM9Cu5J/
				BOp2viTTixKW124t7lBngZPyNgd8j6V5M37Ffxojuvs/wDwhFyz5x5izxGP/vrdiv2JVAKxPEcWtsIf7HltYjk+YblSfpjFfQ/6yYyhTvJKVvLX8D5+pkWGlLmjdH5tfDn/AIJvfELxFfI3iy6sfCunAjf
				5cgubhh32qvyj8T+dfangLwN4R/Z98OL4V8C6f9t1m45ldiJJpn/56TP2A9Og7Yrs28H+ItaP/E38RNHB3h02Pyt3sWOT+VdD4e8J6b4ZtzHYW6xE/fkPLufUseTXzuOzjMM192XuQ/rp/md+Fy+jhdYLXu
				9zL8C+DT4Zhurm8k+2axfv5t3ct1J7KP8AZFZXx+/5In40/wCwZN/KvQQuK5X4m+Gbnxp8P/EOgWckcNzqFnJbRyS/cVmGATjtUU/dav0O/kUYOMTT8I/8iro3/XlB/wCi1rZrO0KyfTdF0+0kIZ7e3jhZh
				0JVQCR+VaNW9y47BRRRSKCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/2Q=="/>
		</xsl:if>
	</xsl:template>


	<xd:doc>
		<xd:desc> Logo INCa encodé en B64 </xd:desc>
	</xd:doc>
	<xsl:template name="printLogoInstitut">
		<xsl:if test="not(contains($vendor, 'Saxonica'))">
			<img
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJkAAABKCAMAAACfKAYJAAADAFBMVEVMaXEkNXUkNXUkN
      XUkNXWEHV0kNXWEHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEH
      V0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXWEHV0kNX
      UkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2
      EHV0kNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2E
      HV0kNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNX
      UkNXUkNXWEHV0kNXWEHV0kNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWE
      HV0kNXUkNXWEHV2EHV2EHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV2EHV
      2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXWEHV2EH
      V2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXWEHV0kNXWEHV0kNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUk
      NXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2
      EHV2EHV2EHV2EHV0kNXUkNXUkNXWEHV21GfObAAAA/nRSTlMACiL+7QU1Qbnw/SYGx/vSDRVI9+oYomQZEfYB+fNRAxwB6A+VDsJ
      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
      "/>
		</xsl:if>
		<xsl:if test="(contains($vendor, 'Saxonica'))">
			<fo:external-graphic content-height="scale-to-fit" content-width="50%"
				scaling="non-uniform"
				src="data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAJkAAABKCAMAAACfKAYJAAADAFBMVEVMaXEkNXUkNXUkN
				XUkNXWEHV0kNXWEHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEH
				V0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXWEHV0kNX
				UkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2
				EHV0kNXUkNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXUkNXUkNXWEHV0kNXUkNXWEHV2EHV2EHV2EHV2E
				HV0kNXUkNXUkNXWEHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNX
				UkNXUkNXWEHV0kNXWEHV0kNXWEHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWE
				HV0kNXUkNXWEHV2EHV2EHV2EHV0kNXWEHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV2EHV2EHV
				2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXUkNXUkNXUkNXUkNXUkNXUkNXWEHV0kNXWEHV2EH
				V2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXWEHV0kNXWEHV0kNXUkNXUkNXUkNXWEHV0kNXUkNXUkNXUk
				NXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV2EHV0kNXUkNXWEHV2EHV2EHV2EHV2EHV2EHV2EHV2
				EHV2EHV2EHV2EHV0kNXUkNXUkNXWEHV21GfObAAAA/nRSTlMACiL+7QU1Qbnw/SYGx/vSDRVI9+oYomQZEfYB+fNRAxwB6A+VDsJ
				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
				"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
