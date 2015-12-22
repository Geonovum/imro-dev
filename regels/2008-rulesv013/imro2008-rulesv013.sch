<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: imro2008-rulesv012.sch
 *
 * (C) Logica, 2008
 *
 *
 * Info:
 * Schematron Validation Document for IMRO 2008
 *
 * History:
 * 25-06-2008   RB  Changed NSUrl of IMRO 2008
 * 02-07-2008   RD  Activate rule RPA5.
 *                  Changed rule RPA8: modified 'urn:ogc:def:crs:EPSG::28992' into '28992'
 *                  Corrected errors in descriptive OCL definitions
 *                  Removed rule BP22
 *                  Transformed rules GB32,GB33,GB34,GB35 into the same form as BP9
 * 07-07-2008   RD  Refactored RPA3,4,5,6,7,9 because of structural reasons
 *					Transformed rules SV22,SV23,SV24 into the same form as BP9
 *                  Added rule RPA10
 * 30-07-2008   PJA Changed rule SV26, Deleted rule SV27
 * 03-09-2008   RD  Added checks for "imro:begrenzing" references
 * 14-09-2008   PJA Added check for imro:Bouwvlak.naam (='bouwvlak')
 * 12-01-2009   PJA Bugfixes in rule BP17, BP18, BP19 and BP20.
 * 12-01-2009   RD  Restructured following order of rules because there 
 *                  was no need for clustering any more.
 * 02-04-2009   RD  Rule RPA11 added which relates overheidsCode to verantwoordelijkeOverheid.
 *                  Diagnostic information added. 
 *                  Bugfix in rule GB35P. Reference to Besluitsubvlak_P tested against Besluitvlak_P instead of Besluitsubvlak_P.
 * 19-04-2009	PJA Refrasing of error messages concerning associations (Associatie replaced by Verwijzing).
 * 28-05-2009   RD  Changed rule GB29 and GB30: removed check for status "geconsolideerde versie" + adapted comments.
 * 02-06-2009   RD  Applied previous change to rules GB29 and GB30 also to rule BP7.
 * 16-06-2009   RD  Use of diagnostics cause performance problems. Redefinitions and less usage of error location variables are necessary.
 * 10-09-2009   RD  Use of key function for indexing improves performance dramatically. 
 *                  Every rule that checks references has been updated.
 * 14-10-2009   RD  Replaced rule 13 and 14 by positive tests: tests for presence of wished data instead of absence of unwished data.
 *                  Rule 13: Field imro:aanduiding inside a Functieaanduiding object may only point to a Gebiedsaanduiding.
 *                  Rule 14: Field imro:aanduiding inside a Bouwaanduiding object may only point to a Gebiedsaanduiding or Bouwvlak.
 * 16-12-2009   RD  Replaced rule 15 and 16 by positive tests: tests for presence of wished data instead of absence of unwished data.
 *                  Rule 15: Field imro:aanduiding inside a Maatvoering object may only point to a Gebiedsaanduiding or Bouwvlak.
 *                  Rule 16: Field imro:aanduiding inside a Figuur object may only point to a Gebiedsaanduiding or Bouwvlak.
 *                  Rule 14: refactored because of common content between rules BP14,BP15 and BP16.
 * 15-02-2010   RD  Added new rule GB35APX: Checks that a Besluitsubvlak refers at least to
 *                  another Besluitsubvlak or to a (parent) Besluitvlak. 
 * 22-02-2010   RD  Rule SV25 adapted: Ensure that StructuurvisieComplex.planobject only refers to 
 *                  StructuurvisieGebied, StructuurvisieComplex or Structuurvisieverklaring objects. 
 *                  (See paragraph 3.4 of PRPSV2008, 4.4 of PRGSV2008 and PRRSV2008). This prevents references to Geometriestructuurvisieobject or Structuurvisieplangebied like objects.
 * 01-06-2010   RD  Rule GB42 added: Besluitgebied requires presence of Besluitvlak.
 *                  (See paragraph 3.2 of PRPV2008, 3.3 of PRAMvB2008 and PRGB2008).
 ******************************************************************************/

Opmerkingen / hints:

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xml:lang="en">  <!-- ISO Schematron 1.6 namespace -->
 <!-- <sch:schema xmlns:sch="http://www.ascc.net/xml/schematron"> Schematron namespace -->

	<!-- <iso:title>Schematron validaties voor IMRO2006</iso:title>-->
	<!-- Titel weggehaald om geen output te hebben als er geen fout is -->
	<!-- De validator concludeert daaruit dat er geen fout en dus een valide bestand is -->
	<!-- <iso:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/> -->
	<iso:ns prefix="gml" uri="http://www.opengis.net/gml"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2008/1"/>
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
	<iso:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>	

	<iso:let name="lowercaseChars" value="'abcdefghijklmnopqrstuvwxyz'"/>
	<iso:let name="uppercaseChars" value="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	
	<iso:let name="aantalBesluitvlak_A" value="count(//imro:Besluitvlak_A)"/>
	<iso:let name="aantalBesluitvlak_P" value="count(//imro:Besluitvlak_P)"/>
	<iso:let name="aantalBesluitvlak_X" value="count(//imro:Besluitvlak_X)"/>
	
	<!-- Indexering. -->
	<xsl:key name="GeometriePlangebied_index" match="//imro:GeometriePlangebied" use="@gml:id" />
	<xsl:key name="GeometriePlangebied_P_index" match="//imro:GeometriePlangebied_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_P_index" match="//imro:GeometrieStructuurvisieObject_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_index" match="//imro:GeometrieStructuurvisieObject" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_A_index" match="//imro:GeometrieBesluitobject_A" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P1_index" match="//imro:GeometrieBesluitobject_P1" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P3_index" match="//imro:GeometrieBesluitobject_P3" use="@gml:id" />
	
	<xsl:key name="Bestemmingsplangebied_index" match="//imro:Bestemmingsplangebied" use="@gml:id" />
	<xsl:key name="Enkelbestemming_index" match="//imro:Enkelbestemming" use="@gml:id" />
	<xsl:key name="Dubbelbestemming_index" match="//imro:Dubbelbestemming" use="@gml:id" />

	<xsl:key name="Gebiedsaanduiding_index" match="//imro:Gebiedsaanduiding" use="@gml:id"/>
	<xsl:key name="Bouwvlak_index" match="//imro:Bouwvlak" use="@gml:id"/>
	<xsl:key name="Functieaanduiding_index" match="//imro:Functieaanduiding" use="@gml:id"/>
	<xsl:key name="Bouwaanduiding_index" match="//imro:Bouwaanduiding" use="@gml:id"/>
	<xsl:key name="Maatvoering_index" match="//imro:Maatvoering" use="@gml:id"/>
	<xsl:key name="Figuur_index" match="//imro:Figuur" use="@gml:id"/>

	<xsl:key name="Structuurvisieplangebied_G_index" match="//imro:Structuurvisieplangebied_G" use="@gml:id"/>
	<xsl:key name="Structuurvisieplangebied_P_index" match="//imro:Structuurvisieplangebied_P" use="@gml:id"/>
	<xsl:key name="Structuurvisieplangebied_R_index" match="//imro:Structuurvisieplangebied_R" use="@gml:id"/>
	<xsl:key name="Besluitgebied_A_index" match="//imro:Besluitgebied_A" use="@gml:id"/>
	<xsl:key name="Besluitgebied_P_index" match="//imro:Besluitgebied_P" use="@gml:id"/>
	<xsl:key name="Besluitgebied_X_index" match="//imro:Besluitgebied_X" use="@gml:id"/>
	<xsl:key name="Besluitvlak_A_index" match="//imro:Besluitvlak_A" use="@gml:id"/>
	<xsl:key name="Besluitvlak_P_index" match="//imro:Besluitvlak_P" use="@gml:id"/>
	<xsl:key name="Besluitvlak_X_index" match="//imro:Besluitvlak_X" use="@gml:id"/>

	<xsl:key name="Besluitsubvlak_A_index" match="//imro:Besluitsubvlak_A" use="@gml:id"/>
	<xsl:key name="Besluitsubvlak_P_index" match="//imro:Besluitsubvlak_P" use="@gml:id"/>
	<xsl:key name="Besluitsubvlak_X_index" match="//imro:Besluitsubvlak_X" use="@gml:id"/>

	<xsl:key name="Structuurvisiegebied_P_index" match="//imro:Structuurvisiegebied_P" use="@gml:id"/>
	<xsl:key name="Structuurvisiecomplex_P_index" match="//imro:Structuurvisiecomplex_P" use="@gml:id"/>
	<xsl:key name="Structuurvisieverklaring_P_index" match="//imro:Structuurvisieverklaring_P" use="@gml:id"/>
	
	<xsl:key name="Structuurvisiecomplex_G_index" match="//imro:Structuurvisiecomplex_G" use="@gml:id"/>
	<xsl:key name="Structuurvisiegebied_G_index" match="//imro:Structuurvisiegebied_G" use="@gml:id"/>

	<xsl:key name="Structuurvisiegebied_R_index" match="//imro:Structuurvisiegebied_R" use="@gml:id"/>
	<xsl:key name="Structuurvisiecomplex_R_index" match="//imro:Structuurvisiecomplex_R" use="@gml:id"/>

	
	<iso:pattern name="Max1Plangebied">
		<!-- Ruimtelijk Plan Algemeen, Rule 1: Minimaal en maximaal 1 object plangebied per bestand
			context IMRO2008::Plangebied
			inv PlangebiedMax1: Plangebied::allInstances() -> size() = 1
		-->
		<iso:rule context="/*">
			<iso:let name="aantalPlangebieden" value="count(//*[imro:typePlan])"/>
			
			<iso:assert test="$aantalPlangebieden = 1">
Foutcode RPA1: Er moet exact 1 plangebied aanwezig zijn (aantal = <iso:value-of select="$aantalPlangebieden"/>)
			</iso:assert>

		</iso:rule>
	</iso:pattern>

	<iso:pattern name="Max1MetadataIMRObestand">
		<!-- Ruimtelijk Plan Algemeen, Rule 2: Minimaal en maximaal 1 object MetadataIMRObestand
			context IMRO2008:: MetadataIMRObestand
			inv MetadataMax1: MetadataIMRObestand::allInstances() -> size() = 1
		-->
		<iso:rule context="/*">
			<iso:let name="aantalMetadataIMRObestanden" value="count(//imro:MetadataIMRObestand)"/>
			
			<iso:assert test="$aantalMetadataIMRObestanden = 1">
Foutcode RPA2: Er moet exact 1 MetadataIMRObestand aanwezig zijn (aantal = <iso:value-of select="$aantalMetadataIMRObestanden"/>)
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="StartPlangebiedNLIMRO">
		<!-- Ruimtelijk Plan Algemeen, Rule 3: De idn van een plan begint met NL.IMRO.
			context IMRO2008::Plangebied
			inv PlangebiedIdnFormat: self.identificatie.substring(1, 8) = ‘NL.IMRO.’
		-->
		<iso:rule context="//*[imro:typePlan]">
			<iso:let name="identificatie" value="imro:identificatie"/>

			<iso:assert test="substring($identificatie,1,8)='NL.IMRO.'" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA3: Plangebied-identificatie dient met 'NL.IMRO.' te beginnen
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="PlangebiedIdnMax36">
		<!-- Ruimtelijk Plan Algemeen, Rule 4: Maximale lengte van de idn van een plangebied is 36 tekens.
			context IMRO2008::Plangebied
			inv PlangebiedIdnMaxChar: self.identificatie.size() < 37
		-->
		<iso:rule context="//*[imro:typePlan]">
			<iso:let name="identificatie" value="imro:identificatie"/>
			
			<iso:assert test="string-length($identificatie) &lt; 37" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA4: Plangebied-identificatie mag niet langer zijn dan 36 karakters (huidige lengte = <iso:value-of select="string-length($identificatie)"/>) 
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="StartPlanobjectNLIMRO">
		<!-- Ruimtelijk Plan Algemeen, Rule 5: De idn van een planobject begint met NL.IMRO
			context IMRO2008::Planobject
			inv PlanobjectIdnFormat: self.identificatie.substring(1, 8) = ‘NL.IMRO.’
		-->
		<iso:rule context="//*[imro:typePlanobject]">
			<iso:let name="identificatie" value="imro:identificatie"/>

			<iso:assert test="substring($identificatie,1,8)='NL.IMRO.'" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA5: Planobject-identificatie dient met 'NL.IMRO.' te beginnen
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="PlanobjectIdnMax32">
		<!-- Ruimtelijk Plan Algemeen, Rule 6: Maximale lengte van de idn van een planobject is 32 tekens
			context IMRO2008::Planobject
			inv PlanobjectIdnMaxChar: self.identificatie.size() < 33
		 -->
		<iso:rule context="//*[imro:typePlanobject]">
			<iso:let name="identificatie" value="imro:identificatie"/>
			
			<iso:assert test="string-length($identificatie) &lt; 33" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA6: Planobject-identificatie mag niet langer zijn dan 32 karakters (huidige lengte = <iso:value-of select="string-length($identificatie)"/>) 
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="CBSinIdn">
		<!-- Ruimtelijk Plan Algemeen, Rule 7: CBS-code bronhouder verwerkt in identificatiecode. 
			context IMRO2008::Plangebied
			inv PlangebiedIdnCBSCode: self.indentificatie.substring(9, 12) = self.overheidsCode
		 -->
		<iso:rule context="//*[imro:typePlan]">
			<iso:let name="identificatie" value="imro:identificatie"/>
			<iso:let name="overheidscode" value="imro:overheidsCode"/>
			
			<iso:assert test="substring($identificatie,9,4)=$overheidscode" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA7: CBS-code in planidentificatie is niet gelijk aan overheidsCode (<iso:value-of select="$overheidscode"/>).
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="CoordSys28992">
		<!-- Ruimtelijk Plan Algemeen, Rule 8: Coordinaatreferentiesysteem is verplicht Rijksdriehoeksstelsel
			context IMRO2008::MetadataIMROBestand
			inv EPSGCode: self.codeReferentiesysteem = ‘28992’
		 -->
		<iso:rule context="//imro:MetadataIMRObestand">
			<iso:let name="coordsystem" value="imro:codeReferentiesysteem"/>
			
			<iso:assert test="$coordsystem = '28992'">
Foutcode RPA8: Coordinaatreferentiesysteem (huidige waarde: <iso:value-of select="$coordsystem"/>) is verplicht Rijksdriehoeksstelsel (28992)
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="PlanobjectIdEqualGmlId">
		<!-- Ruimtelijk Plan Algemeen, Rule 9: De identificatie van een planobject is gelijk aan 
			de gml:id van hetzelfde object
			context IMRO2008::Planobject
		 -->
		<iso:rule context="//*[imro:typePlanobject]">
			<iso:let name="identificatie" value="imro:identificatie"/>
			<iso:let name="gmlId" value="@gml:id"/>
			
			<iso:assert test="$identificatie = $gmlId" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode RPA9: Planobject-identificatie is niet gelijk aan de gml:id attribuut van hetzelfde object (huidige waarde = <iso:value-of select="$gmlId"/>) 
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="typePlanobjectChecks">
		<!-- Ruimtelijk Plan Algemeen, Rule 10: typePlanobject moet gelijk zijn aan object type
			context IMRO2008::Planobject
			inv PlanobjectIdnFormat: lowercase(self.typePlanobject) = lowercase(self.element-name)
		-->
		<iso:rule context="//*[imro:typePlanobject]">
			<iso:let name="objectnameFirstChar" value="substring(local-name(),1,1)"/>
			<iso:let name="objectnameRemainder" value="substring(local-name(),2)"/>
			<iso:let name="determinedObjectname" value="concat(translate($objectnameFirstChar,$uppercaseChars,$lowercaseChars),$objectnameRemainder)"/>

			<iso:assert test="imro:typePlanobject=$determinedObjectname" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode RPA10: typePlanobject (huidige waarde <iso:value-of select="imro:typePlanobject"/>) moet gelijk zijn aan object type (huidige waarde <iso:value-of select="$determinedObjectname"/>)
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>

	<iso:pattern name="overheidsCodeChecks">
		<!--
			als beleidsmatigVerantwoordelijkeOverheid='provinciale overheid' dan moet overheidscode met 99 beginnen.
			Indien niet, dan mag overheidcode ook niet met 99 beginnen. 
			als beleidsmatigVerantwoordelijkeOverheid='nationale overheid' dan moet overheidscode gelijk zijn aan 0000.
			Indien niet, dan mag overheidcode ook niet 0000 zijn. 
		 -->
		<iso:rule context="//*[imro:overheidsCode]">

			<iso:let name="overheidsCode" value="imro:overheidsCode"/>
		
			<iso:let name="overheidsCodeBegintMet99" value="starts-with($overheidsCode,'99')"/>
			<iso:let name="isProvincialeOverheid" value="imro:beleidsmatigVerantwoordelijkeOverheid='provinciale overheid'"/>

			<iso:assert test="($overheidsCodeBegintMet99 and $isProvincialeOverheid) 
							or (not($overheidsCodeBegintMet99) and not($isProvincialeOverheid))"  diagnostics="identificatieLookup"> 
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode RPA11A: Het format van imro:overheidscode (huidige waarde: <iso:value-of select="$overheidsCode"/>) is niet conform imro:beleidsmatigVerantwoordelijkeOverheid (huidige waarde: <iso:value-of select="imro:beleidsmatigVerantwoordelijkeOverheid"/>).
Voor nationale overheid geldt: '0000' (altijd 4 nullen);
Voor provinciale overheid geldt: '99xx' (altijd twee voorloopnegens).
			</iso:assert>
			
			<iso:let name="overheidsCodeIs0000" value="$overheidsCode='0000'"/>
			<iso:let name="isNationaleOverheid" value="imro:beleidsmatigVerantwoordelijkeOverheid='nationale overheid'"/>

			<iso:assert test="($overheidsCodeIs0000 and $isNationaleOverheid)
							or (not($overheidsCodeIs0000) and not($isNationaleOverheid))"  diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode RPA11B: Het format van imro:overheidscode (huidige waarde: <iso:value-of select="$overheidsCode"/>) is niet conform
imro:beleidsmatigVerantwoordelijkeOverheid (huidige waarde: <iso:value-of select="imro:beleidsmatigVerantwoordelijkeOverheid"/>).
Voor nationale overheid geldt: '0000' (altijd 4 nullen);
Voor provinciale overheid geldt: '99xx' (altijd twee voorloopnegens).
			</iso:assert>
			
		</iso:rule>

	</iso:pattern>




<!-- 
OCL Aanname:	isEmpty() betekent dat een veld afwezig is, of dat het aanwezig is maar zonder inhoud.
				notEmpty() betekent dat een veld aanwezig en gevuld is (lengte > 0).
 -->			 

	<iso:pattern name="BPBesluitnrVerwijzingPlanstatusAfh">

		<iso:rule context="//imro:Bestemmingsplangebied">
			<!-- Bestemmingsplan (Bestemmingsplangebied), Rule 7: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht vanaf planstatus = vastgesteld  
				Context: IMRO2008::Bestemmingsplangebied
				Inv BesluitnummerVerplichtBP:
				if self.planstatusInfo.planstatus = Planstatus_BP::vastgesteld
				or self.planstatusInfo.planstatus = Planstatus_BP::onherroepelijk
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
			 -->
			 <iso:let name="planstatus" value="imro:planstatusInfo/imro:PlanstatusEnDatum_BP/imro:planstatus"/>
			 <iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld' or $planstatus = 'onherroepelijk'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			 <iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			 <iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			 <iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP7: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht vanaf planstatus = vastgesteld of onherroepelijk
			 </iso:assert>
		
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="Enkel/DubbelBestemmingHoofdgroepAfh">
		<!-- Bestemmingsplan (Bestemmingsvlak), Rule 8: Een Enkelbestemming kent andere hoofdgroepen dan een Dubbelbestemming
			context IMRO2008::Enkelbestemming
			inv EnkelHoofdgroep: self.bestemmingshoofdgroep <> Bestemminghoofdgroep_ED::leiding and
			self.bestemmingshoofdgroep <> Bestemminghoofdgroep_ED::waarde and
			self.bestemmingshoofdgroep <> Bestemminghoofdgroep_ED::waterstaat
			
			context IMRO2008::Dubbelbestemming
			inv DubbelHoofdgroep: self.bestemmingshoofdgroep = Bestemminghoofdgroep_ED::leiding or
			self.bestemmingshoofdgroep = Bestemminghoofdgroep_ED::waarde or
			self.bestemmingshoofdgroep = Bestemminghoofdgroep_ED::waterstaat
		 -->
		 <iso:rule context="//imro:Enkelbestemming">
			<!-- Rule 08A -->
		 	<iso:let name="hoofdgroep" value="imro:bestemmingshoofdgroep"/>
		 	
		 	<iso:assert test="$hoofdgroep != 'leiding' and $hoofdgroep != 'waarde' and $hoofdgroep != 'waterstaat'" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP08A: Hoofdgroep van Enkelbestemming mag niet gelijk zijn aan leiding, waarde of waterstaat
		 	</iso:assert>
		 </iso:rule>

		 <iso:rule context="//imro:Dubbelbestemming">
			<!-- Rule 08B -->
			<iso:let name="hoofdgroep" value="imro:bestemmingshoofdgroep"/>
		 	
		 	<iso:assert test="$hoofdgroep = 'leiding' or $hoofdgroep = 'waarde' or $hoofdgroep = 'waterstaat'" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP08B: Hoofdgroep van Dubbelbestemming moet gelijk zijn aan leiding, waarde of waterstaat
		 	</iso:assert>
		 </iso:rule>
	</iso:pattern>

	<iso:pattern name="BestemmingsplanRelatieIDN">
	
		<iso:rule context="imro:Enkelbestemming/imro:plangebied | imro:Dubbelbestemming/imro:plangebied">
			<!-- Bestemmingsplan, Rule 9: Bestemmingsvlak verwijst naar een bestaand plangebied id
				 De aanwezigheid van plangebied binnen een bestemmingsvlak wordt door het schema al afgedwongen. 
			 -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Bestemmingsplangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP9: De verwijzing van dit Bestemmingsvlak naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Bouwaanduiding/imro:plangebied | imro:Figuur/imro:plangebied | imro:Bouwvlak/imro:plangebied | imro:Functieaanduiding/imro:plangebied | imro:Maatvoering/imro:plangebied | imro:Gebiedsaanduiding/imro:plangebied">
			<!-- Bestemmingsplan, Rule 10: Aanduiding verwijst naar een bestaand plangebied id
			 -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Bestemmingsplangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP10: De verwijzing van deze Aanduiding naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Bouwaanduiding/imro:bestemmingsvlak | imro:Figuur/imro:bestemmingsvlak | imro:Bouwvlak/imro:bestemmingsvlak | imro:Functieaanduiding/imro:bestemmingsvlak | imro:Maatvoering/imro:bestemmingsvlak | imro:Gebiedsaanduiding/imro:bestemmingsvlak">
			<!-- Bestemmingsplan, Rule 11: Aanduiding verwijst naar een bestaand bestemmingsvlak id 
			 -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Enkelbestemming_index',$vlak_idn) or key('Dubbelbestemming_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP11: Een aanduiding verwijst naar een ongeldig bestemmingsvlak-id (verwijs-id = <iso:value-of select ="$vlak_idn"/>)
			</iso:assert>

		</iso:rule>

		<iso:rule context="imro:Bouwvlak">
			<!-- Bestemmingsplan, Rule 12: Bouwvlak verwijst altijd naar een bestemmingsvlak
			 -->
			<iso:assert test="imro:bestemmingsvlak" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP12: Bestemmingsvlak niet aangetroffen bij bouwvlak
			</iso:assert>
		</iso:rule>

	</iso:pattern>


	<iso:pattern name="AanduidingRelaties">


		<iso:rule context="//imro:Functieaanduiding/imro:aanduiding">
			<!-- Bestemmingsplan, Rule 13: Functieaanduiding kan niet verwijzen naar aanduiding van het type bouwvlak, functieaanduiding, bouwaanduiding, maatvoering, figuur.
				context IMRO2008::Functieaanduiding
				inv AssociatieFunctieaanduidingNiet:
				not(self.aanduiding.oclIsTypeOf(Bouwvlak))
				and
				not(self.aanduiding.oclIsTypeOf(Functieaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Bouwaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Maatvoering))
				and
				not(self.aanduiding.oclIsTypeOf(Figuur)
				
				Gebiedsaanduidingen zijn dus de enige aanduidingen waarnaar verwezen mag worden.
				Dit kan dus geconverteerd worden naar een positieve test:
				
				inv AssociatieBouwaanduiding:
				self.aanduiding.isEmpty()
				or 
				self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)
			 -->

			<iso:let name="aanduiding_idn" value="substring(@xlink:href, 2)"/>

			<iso:let name="mogelijkeGebiedsaanduidingen" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>

<!-- De oude test is vervangen door een test op aanwezigheid van gewenste aanduidingen i.p.v. afwezigheid van ongewenste aanduidingen. 
			<iso:let name="mogelijkeBouwvlakken" value="key('Bouwvlak_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeFunctieaanduidingen" value="key('Functieaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeBouwaanduidingen" value="key('Bouwaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeMaatvoeringen" value="key('Maatvoering_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeFiguren" value="key('Figuur_index',$aanduiding_idn)"/>
			
			<iso:let name="ongewensteAanduidingen" value="$mogelijkeBouwvlakken | $mogelijkeFunctieaanduidingen | $mogelijkeBouwaanduidingen | $mogelijkeMaatvoeringen | $mogelijkeFiguren"/>

  			<iso:assert test="count($ongewensteAanduidingen)=0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP13: Functieaanduiding kan niet verwijzen naar aanduiding van het type bouwvlak, functieaanduiding, bouwaanduiding, maatvoering, figuur (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>) 
  			</iso:assert>
-->

  			<iso:assert test="count($mogelijkeGebiedsaanduidingen)=1" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP13: Functieaanduiding mag alleen naar een aanduiding van het type gebiedsaanduiding verwijzen (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>).
  			</iso:assert>

		</iso:rule>

		<iso:rule abstract="true" id="check_aanduiding_verwijzing_naar_gebiedsaanduiding_of_bouwvlak">
			<!-- Diverse planobjecten zoals Bouwaanduiding, Maatvoering of Figuur mogen middels hun imro:aanduiding element alleen verwijzen 
				naar een imro:Bouwvlak of een imro:Gebiedsaanduiding.
				
				inv AssociatieXXXXaanduiding:
				self.aanduiding.isEmpty()
				or 
				self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)
				or 
				self.aanduiding.oclIsTypeOf(Bouwvlak)

				Via de context die op /imro:aanduiding bevat wordt gegarandeerd dat alleen planobjecten waar een imro:aanduiding element 
				aanwezig is hier aankomen. Dit betekent dat de regel met de gegeven context niet wordt uitgevoerd in het geval self.aanduiding.isEmpty().
				
				Het is de bedoeling dat deze abstracte regel gebruikt wordt met een gedefinieerde variabel met de naam foutcode en de variabel bouwvlakToegestaan.
			 -->
			<iso:let name="aanduiding_idn" value="substring(@xlink:href, 2)"/>

			<iso:let name="mogelijkeGebiedsaanduidingen" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeBouwvlakken" value="key('Bouwvlak_index',$aanduiding_idn)"/>

			<iso:let name="gewensteAanduidingen" value="$mogelijkeGebiedsaanduidingen | $mogelijkeBouwvlakken"/>
			
  			<iso:assert test="count($gewensteAanduidingen)=1" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode <iso:value-of select="$foutcode"/>: <iso:value-of select="local-name(parent::*)"/> mag alleen naar een aanduiding van het type gebiedsaanduiding of bouwvlak verwijzen (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>).
  			</iso:assert>

		</iso:rule>

		<iso:rule context="//imro:Bouwaanduiding/imro:aanduiding">
			<!-- Bestemmingsplan, Rule 14: Bouwaanduiding kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur 
				context IMRO2008::Bouwaanduiding
				inv AssociatieBouwaanduidingNiet:
				not(self.aanduiding.oclIsTypeOf(Functieaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Bouwaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Maatvoering))
				and
				not(self.aanduiding.oclIsTypeOf(Figuur)

				Gebiedsaanduidingen en Bouwvlak zijn dus de enige aanduidingen waarnaar verwezen mag worden.
				Dit kan dus geconverteerd worden naar een positieve test:
				
				inv AssociatieBouwaanduiding:
				self.aanduiding.isEmpty()
				or 
				self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)
				or 
				self.aanduiding.oclIsTypeOf(Bouwvlak)
			 -->
			 
<!-- De oude test is vervangen door een test op aanwezigheid van gewenste aanduidingen i.p.v. afwezigheid van ongewenste aanduidingen.

			<iso:let name="mogelijkeFunctieaanduidingen" value="key('Functieaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeBouwaanduidingen" value="key('Bouwaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeMaatvoeringen" value="key('Maatvoering_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeFiguren" value="key('Figuur_index',$aanduiding_idn)"/>
			
			<iso:let name="ongewensteAanduidingen" value="$mogelijkeFunctieaanduidingen | $mogelijkeBouwaanduidingen | $mogelijkeMaatvoeringen | $mogelijkeFiguren"/>

  			<iso:assert test="count($ongewensteAanduidingen)=0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP14: Bouwaanduiding kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>)
  			</iso:assert>
-->

			<iso:let name="foutcode" value="'BP14'"/>
			<iso:extends rule="check_aanduiding_verwijzing_naar_gebiedsaanduiding_of_bouwvlak" />
			
		</iso:rule>
		



		<iso:rule context="//imro:Maatvoering/imro:aanduiding">
			<!-- Bestemmingsplan, Rule 15: Maatvoering kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
				context IMRO2008::Maatvoering
				inv AssociatieMaatvoeringNiet:
				not(self.aanduiding.oclIsTypeOf(Functieaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Bouwaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Maatvoering))
				and
				not(self.aanduiding.oclIsTypeOf(Figuur)

				Gebiedsaanduidingen en Bouwvlak zijn dus de enige aanduidingen waarnaar verwezen mag worden.
				Dit kan dus geconverteerd worden naar een positieve test:
				
				inv AssociatieMaatvoering:
				self.aanduiding.isEmpty()
				or 
				self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)
				or 
				self.aanduiding.oclIsTypeOf(Bouwvlak)
			 -->
			 
<!-- De oude test is vervangen door een test op aanwezigheid van gewenste aanduidingen i.p.v. afwezigheid van ongewenste aanduidingen. 
			<iso:let name="aanduiding_idn" value="substring(@xlink:href, 2)"/>

			<iso:let name="mogelijkeFunctieaanduidingen" value="key('Functieaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeBouwaanduidingen" value="key('Bouwaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeMaatvoeringen" value="key('Maatvoering_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeFiguren" value="key('Figuur_index',$aanduiding_idn)"/>

  			<iso:let name="ongewensteAanduidingen" value="$mogelijkeFunctieaanduidingen | $mogelijkeBouwaanduidingen | $mogelijkeMaatvoeringen | $mogelijkeFiguren"/>

  			<iso:assert test="count($ongewensteAanduidingen)=0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP15: Maatvoering kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>)
  			</iso:assert>
-->

			<iso:let name="foutcode" value="'BP15'"/>
			<iso:extends rule="check_aanduiding_verwijzing_naar_gebiedsaanduiding_of_bouwvlak" />

		</iso:rule>

		<!-- Check het ieder figuur voor iedere aanduiding (van de mogelijke vele aanduidingen) -->
		<iso:rule context="//imro:Figuur/imro:aanduiding">
			<!-- Bestemmingsplan, Rule 16: Figuur kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
				context IMRO2008::Figuur
				inv AssociatieFiguurNiet:
				not(self.aanduiding.oclIsTypeOf(Functieaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Bouwaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Maatvoering))
				and
				not(self.aanduiding.oclIsTypeOf(Figuur)


				Gebiedsaanduidingen en Bouwvlak zijn dus de enige aanduidingen waarnaar verwezen mag worden.
				Dit kan dus geconverteerd worden naar een positieve test:
				
				inv AssociatieFiguur:
				self.aanduiding.isEmpty()
				or 
				self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)
				or 
				self.aanduiding.oclIsTypeOf(Bouwvlak)
			 -->

<!-- De oude test is vervangen door een test op aanwezigheid van gewenste aanduidingen i.p.v. afwezigheid van ongewenste aanduidingen. 
			<iso:let name="aanduiding_idn" value="substring(@xlink:href, 2)"/>

			<iso:let name="mogelijkeFunctieaanduidingen" value="key('Functieaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeBouwaanduidingen" value="key('Bouwaanduiding_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeMaatvoeringen" value="key('Maatvoering_index',$aanduiding_idn)"/>
			<iso:let name="mogelijkeFiguren" value="key('Figuur_index',$aanduiding_idn)"/>

  			<iso:let name="ongewensteAanduidingen" value="$mogelijkeFunctieaanduidingen | $mogelijkeBouwaanduidingen | $mogelijkeMaatvoeringen | $mogelijkeFiguren"/>

  			<iso:assert test="count($ongewensteAanduidingen)=0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode BP16: Figuur kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>)
  			</iso:assert>
-->

			<iso:let name="foutcode" value="'BP16'"/>
			<iso:extends rule="check_aanduiding_verwijzing_naar_gebiedsaanduiding_of_bouwvlak" />
  	</iso:rule>


<!-- pja. aangepast: validatie op ontbreken van verwijzing werkte niet. -->
			<!-- Bestemmingsplan, Rule 17: Functieaanduiding verwijst altijd naar een bestemmingsvlak of een gebiedsaanduiding
				context IMRO2008::Functieaanduiding
				inv FunctieaanduidingVoorBestOfAanduiding:
				not (self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) and self.bestemmingsvlak.notEmpty())
				and
				not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())

				Waarschijnlijk ontbreekt nog het volgende:
				and
				not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty())
				
				Op dit moment is het bij deze rule 17 toegestaan dat bestemmingsvlak gevuld is en 
				tegelijk aanduiding gevuld is met de id van een type bouwvlak (hoewel dit laatste zondigt tegen Rule 13 
				en dus daar gesignaleerd wordt).
				
				Rule 19 sluit dit uit.
			 -->
		<iso:rule context="//imro:Functieaanduiding">
			<iso:let name="bestemmingsvlak_idn" value="substring(imro:bestemmingsvlak/@xlink:href, 2)"/>
			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
  			<iso:let name="bestemmingsvlakLeeg" value="not($bestemmingsvlak_idn)"/>
  			<iso:let name="aanduidingLeeg" value="not($aanduiding_idn)"/>
  			
  			<iso:let name="aantalGebiedsaanduidingen" value="count(key('Gebiedsaanduiding_index',$aanduiding_idn))"/>

  			<iso:assert test="not($aantalGebiedsaanduidingen!=0 and ($bestemmingsvlak_idn)) and not($bestemmingsvlakLeeg and $aanduidingLeeg)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP17: Functieaanduiding verwijst altijd naar een bestemmingsvlak of een gebiedsaanduiding (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>, bestemmingsvlak: <iso:value-of select ="$bestemmingsvlak_idn"/>, gebiedsaanduidingen: <iso:value-of select ="$aantalGebiedsaanduidingen"/>)
  			</iso:assert>

		</iso:rule>

<!-- pja. aangepast: validatie op ontbreken van verwijzing werkte niet. -->

			<!-- Bestemmingsplan, Rule 18: Bouwaanduiding verwijst altijd naar een bestemmingsvlak,  bouwvlak of een Gebiedsaanduiding. 
				context IMRO2008::Bouwaanduiding
				inv BouwaanduidingVoorBestOfAanduiding:
				not ((self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)) and self.bestemmingsvlak.notEmpty()))
				and
				not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())
				
				Waarschijnlijk ontbreekt nog het volgende:
				and
				not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty())
				
				Op dit moment is het bij deze rule 18 toegestaan dat bestemmingsvlak gevuld is en 
				tegelijk aanduiding gevuld is met de id van een type bouwvlak (hoewel dit laatste zondigt tegen Rule 14 
				en dus daar gesignaleerd wordt).

				Rule 19 sluit dit uit.
			 -->
		<iso:rule context="//imro:Bouwaanduiding">
			<iso:let name="bestemmingsvlak_idn" value="substring(imro:bestemmingsvlak/@xlink:href, 2)"/>
			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
  			<iso:let name="bestemmingsvlakLeeg" value="not($bestemmingsvlak_idn)"/>
  			<iso:let name="aanduidingLeeg" value="not($aanduiding_idn)"/>
  			
  			<iso:let name="mogelijkeGebiedsaanduidingen" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>
  			<iso:let name="mogelijkeBouwvlakken" value="key('Bouwvlak_index',$aanduiding_idn)"/>
  			<iso:let name="gewensteAanduidingen" value="$mogelijkeGebiedsaanduidingen | $mogelijkeBouwvlakken"/>
  			
  			<iso:assert test="not(count($gewensteAanduidingen)!=0 and ($bestemmingsvlak_idn)) and not($aanduidingLeeg and $bestemmingsvlakLeeg)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP18: Bouwaanduiding verwijst altijd naar een bestemmingsvlak,  bouwvlak of een gebiedsaanduiding (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>, bestemmingsvlak: <iso:value-of select ="$bestemmingsvlak_idn"/>, gebiedsaanduidingen: <iso:value-of select ="count($mogelijkeGebiedsaanduidingen)"/>, bouwvlakken: <iso:value-of select="count($mogelijkeBouwvlakken)"/>)
  			</iso:assert>
			
		</iso:rule>
 
<!-- pja. aangepast: validatie op ontbreken van verwijzing werkte niet. Nu wel -->
			<!-- Bestemmingsplan, Rule 19: Maatvoering verwijst altijd naar een bestemmingsvlak , een bouwvlak of een gebiedsaanduiding
				context IMRO2008::Maatvoering
				inv MaatvoeringVoorBestOfAanduiding:
				(not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())
				and
				not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty())
				and
				(self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) or self.aanduiding.isEmpty())
				
				Voordeel van deze regel is dat hier geen uitzonderingen worden toegestaan.
				Nadeel is dat er overlap is met regel 15. De laatste regel 15 is hierdoor overbodig.
			 -->
		<iso:rule context="//imro:Maatvoering">
			<iso:let name="bestemmingsvlak_idn" value="substring(imro:bestemmingsvlak/@xlink:href, 2)"/>
			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
  			<iso:let name="bestemmingsvlakLeeg" value="not($bestemmingsvlak_idn)"/>
  			<iso:let name="aanduidingLeeg" value="not($aanduiding_idn)"/>
  			
  			<iso:let name="mogelijkeGebiedsaanduidingen" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>
  			<iso:let name="mogelijkeBouwvlakken" value="key('Bouwvlak_index',$aanduiding_idn)"/>
  			<iso:let name="gewensteAanduidingen" value="$mogelijkeGebiedsaanduidingen | $mogelijkeBouwvlakken"/>

  			
  			<iso:assert test="not($aanduidingLeeg and $bestemmingsvlakLeeg) and not(($aanduiding_idn) and ($bestemmingsvlak_idn)) and (count($gewensteAanduidingen)!=0 or $aanduidingLeeg)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP19: Maatvoering verwijst altijd naar een bestemmingsvlak, een bouwvlak of een gebiedsaanduiding (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>, bestemmingsvlak: <iso:value-of select ="$bestemmingsvlak_idn"/>, gebiedsaanduidingen: <iso:value-of select ="count($mogelijkeGebiedsaanduidingen)"/>, bouwvlakken: <iso:value-of select="count($mogelijkeBouwvlakken)"/>)
  			</iso:assert>
			
		</iso:rule>
		
		
			<!-- aanpassing nav IMRO2008 versie 1.1.0: -->
			
			<!-- WAS: Bestemmingsplan, Rule 20: Figuur verwijst optioneel naar een bestemmingsvlak of een bouwvlak of een gebiedsaanduiding

				context IMRO2008::Figuur
				inv FiguurVoorBestOfAanduiding:
				(not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty()))
				and
				(self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) or self.aanduiding.isEmpty())
				
				Deze regel maakt Rule 16 overbodig. Het is tenslotte alleen toegestaan om naar bouwvlak of gebiedsaanduiding te 
				verwijzen met het aanduiding veld.
			 -->
			<!-- WORDT: Figuur verwijst altijd naar een bestemmingsvlak of een bouwvlak of een gebiedsaanduiding

				context IMRO2008::Figuur
				inv FiguurVoorBestOfAanduiding:
				(not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty()))
				and
				(not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty()))
				and
				(self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) or self.aanduiding.isEmpty())
			-->
		<iso:rule context="//imro:Figuur">
			<iso:let name="bestemmingsvlak_idn" value="substring(imro:bestemmingsvlak/@xlink:href, 2)"/>
			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
  			<iso:let name="bestemmingsvlakLeeg" value="not($bestemmingsvlak_idn)"/>
  			<iso:let name="aanduidingLeeg" value="not($aanduiding_idn)"/>
  			
  			<iso:let name="mogelijkeGebiedsaanduidingen" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>
  			<iso:let name="mogelijkeBouwvlakken" value="key('Bouwvlak_index',$aanduiding_idn)"/>
  			<iso:let name="gewensteAanduidingen" value="$mogelijkeGebiedsaanduidingen | $mogelijkeBouwvlakken"/>
  			
  			<iso:assert test="not($aanduiding_idn and $bestemmingsvlak_idn) and not ($bestemmingsvlakLeeg and $aanduidingLeeg) and ((count($gewensteAanduidingen)!=0 or $aanduidingLeeg))" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP20: Figuur verwijst altijd naar een bestemmingsvlak of een bouwvlak of een gebiedsaanduiding (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>, bestemmingsvlak: <iso:value-of select ="$bestemmingsvlak_idn"/>, gebiedsaanduidingen: <iso:value-of select ="count($mogelijkeGebiedsaanduidingen)"/>, bouwvlakken: <iso:value-of select="count($mogelijkeBouwvlakken)"/>)
  			</iso:assert>
		</iso:rule>
			
		<iso:rule context="imro:Bouwaanduiding | imro:Bouwvlak | imro:Functieaanduiding | imro:Maatvoering | imro:Gebiedsaanduiding">
			<!-- Bestemmingsplan, Rule 21: Alle aanduidingen, behalve het object Figuur, kunnen maximaal naar 1 bestemmingsvlak verwijzen.
				context IMRO2008::Aanduiding
				inv verwijzingNaarBestemming:
				not(self.oclIsTypeOf(Figuur)) implies
				self.bestemmingsvlak->size()< 2
			 -->
			<iso:let name="aantalBestemmingsvlakken" value="count(imro:bestemmingsvlak)"/>
			 
			<iso:assert test="$aantalBestemmingsvlakken &lt; 2" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP21: Alle aanduidingen, behalve het object Figuur, kunnen maximaal naar 1 bestemmingsvlak verwijzen (huidig aantal = <iso:value-of select="$aantalBestemmingsvlakken"/>)
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>


	<iso:pattern name="naam bouwvlak = bouwvlak">
		<iso:rule context="imro:Bouwvlak">
			<!-- Bestemmingsplan, Rule BP22: Naam van een object Bouwvlak is altijd 'bouwvlak'
				context IMRO2008::'Bouwvlak
				inv naamBouwvlak:
				self.naam = 'bouwvlak'
			 -->
			 <iso:assert test="imro:naam = 'bouwvlak'" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode BP22: De naam van een bouwvlak is altijd 'bouwvlak' (huidige waarde: <iso:value-of select="imro:naam"/>)
			 </iso:assert>
		</iso:rule>

	</iso:pattern>	
	
	
	
			

	<iso:pattern name="SVBesluitnrVerwijzingPlanstatusAfh">

		<iso:rule context="//imro:Structuurvisieplangebied_G | //imro:Structuurvisieplangebied_P | //imro:Structuurvisieplangebied_R">
			<!-- Structuurvisie (Structuurvisieplangebied), Rule 21: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld
				Context: IMRO2008::Structuurvisieplangebied_G
				Inv BesluitnummerVerplichtGSV:
				if self.PlanstatusEnDatum_SV.planstatus = Planstatus_SV::vastgesteld
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
				
				Context: IMRO2008::Structuurvisieplangebied_P
				Inv BesluitnummerVerplichtPSV:
				if self.planstatusInfo.planstatus = Planstatus_SV::vastgesteld
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
				
				Context: IMRO2008::Structuurvisieplangebied_R
				Inv BesluitnummerVerplichtRSV:
				if self.planstatusInfo.planstatus = Planstatus_SV::vastgesteld
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
			 -->
			<iso:let name="planstatus" value="imro:planstatusInfo/imro:PlanstatusEnDatum_SV/imro:planstatus"/>
			<iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			<iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			<iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			<iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode SV21: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld
			</iso:assert>

		</iso:rule>
	</iso:pattern>

		

	<iso:pattern name="StructuurvisiegebiedRelatieIDN">
		<!-- Structuurvisie (Algemene test regels voor verwijzingen), Rule 22: Structuurvisiegebied verwijst naar een bestaand plangebied id
			Aanwezigheid van imro:plangebied wordt door het schema afgedwongen.
		 -->

		<iso:rule context="imro:Structuurvisiegebied_G/imro:plangebied">
			<!-- Rule 22G -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisieplangebied_G_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV22G: Verwijzing van dit Structuurvisiegebied_G naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Structuurvisiegebied_P/imro:plangebied">
			<!-- Rule 22P -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Structuurvisieplangebied_P_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV22P: Verwijzing van dit Structuurvisiegebied_P naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id.  (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Structuurvisiegebied_R/imro:plangebied">
			<!-- Rule 22R -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Structuurvisieplangebied_R_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV22R: Verwijzing van dit Structuurvisiegebied_R naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id.  (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

	</iso:pattern>

	<iso:pattern name="StructuurvisiecomplexRelatieIDN">
		<!-- Structuurvisie (Algemene test regels voor verwijzingen), Rule 23: Structuurvisiecomplex verwijst naar een bestaand plangebied id
 		-->

		<iso:rule context="imro:Structuurvisiecomplex_G/imro:plangebied">
			<!-- 23G -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisieplangebied_G_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV23G: Verwijzing van dit Structuurvisiecomplex_G naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

	
		<iso:rule context="imro:Structuurvisiecomplex_P/imro:plangebied">
			<!-- 23P -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisieplangebied_P_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV23P: Verwijzing van dit Structuurvisiecomplex_P naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id.(verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Structuurvisiecomplex_R/imro:plangebied">
			<!-- 23R -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisieplangebied_R_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV23R: Verwijzing van dit Structuurvisiecomplex_R naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

	</iso:pattern>


	<iso:pattern name="StructuurvisieverklaringRelatieIDN">

		<iso:rule context="imro:Structuurvisieverklaring_P/imro:plangebied">
			<!-- Structuurvisie (Algemene test regels voor verwijzingen), Rule 24: Structuurvisieverklaring verwijst naar een bestaand plangebied id
			Structuurvisieverklaringen bestaan alleen in de P-variant (Structuurvisieverklaring_P).
			 -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisieplangebied_P_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV24: Verwijzing van dit Structuurvisieverklaring_P naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="StructuurvisiecomplexRelatieIDN">
		<!-- Structuurvisie (Algemene test regels voor verwijzingen), Rule 25: Structuurvisiecomplex verwijst naar een bestaand planobject id
		 -->
		<iso:rule context="imro:Structuurvisiecomplex_G/imro:planobject">
			<!-- Rule 25G -->
			<iso:let name="object_id" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Structuurvisiecomplex_G_index',$object_id) or
								key('Structuurvisiegebied_G_index',$object_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV25G: Verwijzing van dit Structuurvisiecomplex_G naar een planobject is ongeldig (verwijs-id = <iso:value-of select="$object_id"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Structuurvisiecomplex_P/imro:planobject">
			<!-- Rule 25P -->
			<iso:let name="object_id" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Structuurvisiecomplex_P_index',$object_id) or
								key('Structuurvisiegebied_P_index',$object_id) or
								key('Structuurvisieverklaring_P_index',$object_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV25P: Verwijzing van dit Structuurvisiecomplex_P naar een planobject is ongeldig (verwijs-id = <iso:value-of select="$object_id"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Structuurvisiecomplex_R/imro:planobject">
			<!-- Rule 25R -->
			<iso:let name="object_id" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Structuurvisiecomplex_R_index',$object_id) or
								key('Structuurvisiegebied_R_index',$object_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV25R: Verwijzing van dit Structuurvisiecomplex_R naar een planobject is ongeldig (verwijs-id = <iso:value-of select="$object_id"/>)
			</iso:assert>
		</iso:rule>
		 
	</iso:pattern>

	<iso:pattern name="SVGeometrieVerplichtBijIllustratie">
	
	<!-- (pja) Opmerking: Schematron syntax aangepast. Validatie resultaat was niet zoals bedoeld. Tekst van foutmelding ook aangepast.
			 Schematronregel valideert niet of de href daadwerkelijk ingevuld is. Maar dat hoeft ook niet in deze rule omdat daar nog een aparte validatie rule voor geschreven wordt: Controle of objecten met het attribuut imro:begrenzing naar valide GeometrieStructuurvisieObjecten verwijzen-->
		<iso:rule context="//imro:Structuurvisiegebied_R/imro:verwijzingNaarIllustratieInfo">
			<!-- Structuurvisie (Structuurvisiegebied_R), Rule 26: Het object heeft verplicht een geometrie indien het object naar een kaart illustratie verwijst.
				Context: IMRO2008::Structuurvisiegebied_R
				Inv GeometrieVerplichtGebiedRSV:
				self.typeIllustratie = Illustratie::kaart implies
				self.begrenzing.notEmpty()
			 -->
		 	<iso:let name="typeIllustratie" value="imro:IllustratieReferentie/imro:typeIllustratie"/>			
			<!-- <iso:let name="begrenzing_href" value="../imro:begrenzing/@xlink:href"/> -->
			<iso:let name="begrenzing_href" value="not(../imro:begrenzing/@xlink:href)"/>
			
	
			<!-- <iso:assert test="$typeIllustratie!='kaart' or ($begrenzing_href/text())"> -->
			<iso:assert test="(($typeIllustratie = ('kaart') and not($begrenzing_href)) or ($typeIllustratie != 'kaart'))" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV26: Structuurvisiegebied_R mist een verwijzing naar een geometrie: attribuut begrenzing is verplicht indien het object naar een kaartillustratie verwijst.
			</iso:assert>
		 	
		 </iso:rule>
		 
	</iso:pattern>
	
	<!-- (pja) opmerking: rule SV27 verwijderd. Was hetzelfde als rule SV26 (staan ook dubbel in IMRO2008 doc)-->


	<iso:pattern name="SVBegrenzingVerwijzingenBestaan">

		<iso:rule context="//imro:Structuurvisieplangebied_G/imro:begrenzing | 
							//imro:Structuurvisieplangebied_R/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisieplangebied), Rule 28: Structuurvisieplangebied heeft begrenzing die 
				verwijst naar GeometriePlangebied van bijpassend type.
				
				Structuurvisieplangebied_G     begrenzing verwijst naar GeometriePlangebied
				Structuurvisieplangebied_R      begrenzing verwijst naar GeometriePlangebied
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length(@xlink:href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV28A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometriePlangebied_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV28B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometriePlangebied
			</iso:assert>

		 </iso:rule>
	
		<iso:rule context="//imro:Structuurvisieplangebied_P/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisieplangebied), Rule 29: Structuurvisieplangebied_P heeft begrenzing die 
				verwijst naar GeometriePlangebied_P.
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length(@xlink:href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV29A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometriePlangebied_P_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV29B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometriePlangebied_P
			</iso:assert>

		 </iso:rule>
	
		<iso:rule context="//imro:Structuurvisieverklaring_P/imro:begrenzing |
							//imro:Structuurvisiecomplex_P/imro:begrenzing |
							//imro:Structuurvisiegebied_P/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisie verklaring,complex, gebied), Rule 30: 
				Structuurvisie-verklaring_P,-complex_P,-gebied_P heeft begrenzing die verwijst naar GeometrieStructuurvisieObject_P
		
				Structuurvisieverklaring_P        begrenzing verwijst naar GeometrieStructuurvisieObject_P
				Structuurvisiecomplex_P           begrenzing verwijst naar GeometrieStructuurvisieObject_P
				Structuurvisiegebied_P            begrenzing verwijst naar GeometrieStructuurvisieObject_P
			 -->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length(@xlink:href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV30A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometrieStructuurvisieObject_P_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV30B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometrieStructuurvisieObject_P
			</iso:assert>

		 </iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_G/imro:begrenzing | 
							//imro:Structuurvisiecomplex_R/imro:begrenzing | 
							//imro:Structuurvisiegebied_G/imro:begrenzing | 
							//imro:Structuurvisiegebied_R/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisie verklaring,complex, gebied), Rule 31: 
				Structuurvisie-complex,-gebied heeft begrenzing die verwijst naar GeometrieStructuurvisieObject
		
				Structuurvisiecomplex_G           begrenzing verwijst naar GeometrieStructuurvisieObject 
				Structuurvisiecomplex_R           begrenzing verwijst naar GeometrieStructuurvisieObject
				Structuurvisiegebied_G            begrenzing verwijst naar GeometrieStructuurvisieObject
				Structuurvisiegebied_R            begrenzing verwijst naar GeometrieStructuurvisieObject
			 -->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length(@xlink:href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV31A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometrieStructuurvisieObject_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode SV31B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometrieStructuurvisieObject
			</iso:assert>

		 </iso:rule>

	</iso:pattern>		


	<iso:pattern name="GBBesluitnrVerwijzingPlanstatusAfh">

		<iso:rule context="//imro:Besluitgebied_P">
			<!-- Gebiedsgerichte besluiten (Provinciale Verordening), Rule 28: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld
				Context: IMRO2008::Besluitgebied_P
				Inv BesluitnummerVerplichtPV:
				if self.planstatusInfo.planstatus = Planstatus_PV::vastgesteld
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
			 -->
			<iso:let name="planstatus" value="imro:planstatusInfo/imro:PlanstatusEnDatum_PV/imro:planstatus"/>
			<iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			<iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			<iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			<iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB28: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld
			</iso:assert>

			<!--
				 Rule GB42P: PRPV2008.pdf paragraaf 3.2: Besluitvlak_P (1..n)
			 -->
			<iso:assert test="$aantalBesluitvlak_P &gt; 0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB42P: Bij een Besluitgebied_P dient minstens 1 Besluitvlak_P aanwezig te zijn (zie PRPV2008.pdf paragraaf 3.2). Dit besluitvlak is niet aangetroffen.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//imro:Besluitgebied_A">
			<!-- Gebiedsgerichte besluiten (AMvB), Rule 29: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht vanaf planstatus = vastgesteld
				Context: IMRO2008::Besluitgebied_A
				Inv BesluitnummerVerplichtAMB:
				if self.planstatusInfo.planstatus = Planstatus_AMB::vastgesteld or
				self.planstatusInfo.planstatus = Planstatus_AMB::onherroepelijk or
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
			 -->
			<iso:let name="planstatus" value="imro:planstatusInfo/imro:PlanstatusEnDatum_AMB/imro:planstatus"/>
			<iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld' or $planstatus = 'onherroepelijk'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			<iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			<iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			<iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB29: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld of onherroepelijk
			</iso:assert>

			<!--
				 Rule GB42A: PRAMvB2008.pdf paragraaf 3.3: Besluitvlak_A (1..n)
			 -->
			<iso:assert test="$aantalBesluitvlak_A &gt; 0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB42A: Bij een Besluitgebied_A dient minstens 1 Besluitvlak_A aanwezig te zijn (zie PRAMvB2008.pdf paragraaf 3.3). Dit besluitvlak is niet aangetroffen.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//imro:Besluitgebied_X">
			<!-- Gebiedsgerichte besluiten (Overige gebiedsgerichte besluiten), Rule 30: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht vanaf planstatus = vastgesteld
				Context: IMRO2008::Besluitgebied_X
				Inv BesluitnummerVerplichtXGB:
				if self.planstatusInfo.planstatus = Planstatus_XGB::vastgesteld or
				self. planstatusInfo.planstatus = Planstatus_XGB::onherroepelijk
				  then self.besluitnummer.notEmpty()and self.verwijzingNaarVaststellingsbesluit.notEmpty()
				  else self.besluitnummer.isEmpty()and self.verwijzingNaarVaststellingsbesluit.isEmpty()
				endif
			 -->
			<iso:let name="planstatus" value="imro:planstatusInfo/imro:PlanstatusEnDatum_XGB/imro:planstatus"/>
			<iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld' or $planstatus = 'onherroepelijk'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			<iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			<iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			<iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB30: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht indien planstatus = vastgesteld of onherroepelijk
			</iso:assert>
			 
			<!--
				 Rule GB42X: PRGB2008.pdf paragraaf 3.3: Besluitvlak_X (1..n)
			 -->
			<iso:assert test="$aantalBesluitvlak_X &gt; 0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode GB42X: Bij een Besluitgebied_X dient minstens 1 Besluitvlak_X aanwezig te zijn (PRGB2008.pdf paragraaf 3.3). Dit besluitvlak is niet aangetroffen.
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>


	<iso:pattern name="GebiedsgerichteBesluitenRelatieIDN">

		<!-- Gebiedsgerichte besluiten (Algemene test regels voor verwijzingen), Rule 32: Besluitvlak verwijst naar een bestaand plangebied id
		 -->
		<iso:rule context="imro:Besluitvlak_A/imro:besluitgebied">
			<!-- Rule 32A -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Besluitgebied_A_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB32A: Verwijzing van dit Besluitvlak_A naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Besluitvlak_P/imro:besluitgebied">
			<!-- Rule 32P -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			
			<iso:assert test="key('Besluitgebied_P_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB32P: Verwijzing van dit Besluitvlak_P naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>

		</iso:rule>

		<iso:rule context="imro:Besluitvlak_X/imro:besluitgebied">
			<!-- Rule 32X -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:let name="alleBesluitgebieden" value="//imro:Besluitgebied_X"/>
			<iso:let name="juisteBesluitgebieden" value="//imro:Besluitgebied_X[@gml:id=$plan_idn]"/>

			<iso:assert test="key('Besluitgebied_X_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB32X: Verwijzing van dit Besluitvlak_X naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
		</iso:rule>


		<!-- Gebiedsgerichte besluiten (Algemene test regels voor verwijzingen), Rule 33: Besluitsubvlak verwijst naar een bestaand plangebied id
		 -->
		<iso:rule context="imro:Besluitsubvlak_A/imro:besluitgebied">
			<!-- Rule 33A -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitgebied_A_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB33A: Verwijzing van dit Besluitsubvlak_A naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>
			
			<!-- Onderstaande regel wordt altijd gecheckt omdat imro:besluitgebied een verplicht veld is --> 
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>
		</iso:rule>

		<iso:rule context="imro:Besluitsubvlak_P/imro:besluitgebied">
			<!-- Rule 33P -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitgebied_P_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB33P: Verwijzing van dit Besluitsubvlak_P naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id  (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>

			<!-- Onderstaande regel wordt altijd gecheckt omdat imro:besluitgebied een verplicht veld is --> 
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>
		</iso:rule>

		<iso:rule context="imro:Besluitsubvlak_X/imro:besluitgebied">
			<!-- Rule 33X -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitgebied_X_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB33X: Verwijzing van dit Besluitsubvlak_X naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id  (verwijs-id = <iso:value-of select="$plan_idn"/>)
			</iso:assert>

			<!-- Onderstaande regel wordt altijd gecheckt omdat imro:besluitgebied een verplicht veld is --> 
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>
		</iso:rule>



		<!-- Gebiedsgerichte besluiten (Algemene test regels voor verwijzingen), Rule 34: Besluitsubvlak verwijst naar een bestaand Besluitvlak id
		 -->
		<iso:rule context="imro:Besluitsubvlak_A/imro:besluitvlak">
			<!-- Rule 34A -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitvlak_A_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB34A: Verwijzing van dit Besluitsubvlak_A naar Besluitvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Besluitsubvlak_P/imro:besluitvlak">
			<!-- Rule 34P -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>
 
			<iso:assert test="key('Besluitvlak_P_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB34P: Verwijzing van dit Besluitsubvlak_P naar Besluitvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Besluitsubvlak_X/imro:besluitvlak">
			<!-- Rule 34X -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitvlak_X_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB34X: Verwijzing van dit Besluitsubvlak_X naar Besluitvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>


		<!-- Gebiedsgerichte besluiten (Algemene test regels voor verwijzingen), Rule 35: Besluitsubvlak verwijst naar een bestaand Besluitsubvlak id
		 -->
		<iso:rule context="imro:Besluitsubvlak_A/imro:besluitsubvlak">
			<!-- Rule 35A -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitsubvlak_A_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB35A: Verwijzing van dit Besluitsubvlak_A naar Besluitsubvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitsubvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>

		<iso:rule context="imro:Besluitsubvlak_P/imro:besluitsubvlak">
			<!-- Rule 35P -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitsubvlak_P_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB35P: Verwijzing van dit Besluitsubvlak_P naar Besluitsubvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitsubvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>
		 
		<iso:rule context="imro:Besluitsubvlak_X/imro:besluitsubvlak">
			<!-- Rule 35X -->
			<iso:let name="vlak_idn" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key('Besluitsubvlak_X_index',$vlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB35X: Verwijzing van dit Besluitsubvlak_X naar Besluitsubvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitsubvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			</iso:assert>
		</iso:rule>

		<!--
			Rule 35APX
			Uitbreiding van Rule 35. 
			Valideer dat een besluitsubvlak altijd verwijst naar een besluitvlak of anders 
			een ander besluitsubvlak. Dit om los hangende besluitsubvlakken te voorkomen.
		 -->
		<iso:rule abstract="true" id="check_besluitsubvlak_of_besluitvlak_aanwezig">
		
			<iso:assert test="(../imro:besluitsubvlak) or (../imro:besluitvlak)">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB35APX: <iso:value-of select="name(parent::imro:*)"/> dient naar minimaal 1 Besluitvlak of minimaal 1 Besluitsubvlak te verwijzen.
			</iso:assert>
		</iso:rule>



	</iso:pattern>



	<iso:pattern name="GBBegrenzingVerwijzingenBestaan">

		<iso:rule context="//imro:Besluitsubvlak_A/imro:begrenzing | 
							//imro:Besluitvlak_A/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 36: Besluit(sub)vlak_A verwijst met begrenzing naar GeometrieBesluitobject_A
				Besluitsubvlak_A     begrenzing  verwijst naar GeometrieBesluitobject_A
				Besluitvlak_A        begrenzing  verwijst naar GeometrieBesluitobject_A
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length($begrenzing_href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB36A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>

			<iso:assert test="key('GeometrieBesluitobject_A_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB36B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometrieBesluitobject_A
			</iso:assert>
		 </iso:rule>

		<iso:rule context="//imro:Besluitgebied_A/imro:begrenzing | 
							//imro:Besluitgebied_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 37: Besluitgebied_A,_P verwijst met begrenzing naar GeometriePlangebied
				Besluitgebied_A      begrenzing verwijst naar GeometriePlangebied
				Besluitgebied_P      begrenzing verwijst naar GeometriePlangebied
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length($begrenzing_href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB37A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometriePlangebied_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB37B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometriePlangebied
			</iso:assert>
		 </iso:rule>

		<iso:rule context="//imro:Besluitvlak_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 38: Besluitvlak_P verwijst met begrenzing naar GeometriePlangebied_P1 
				Besluitvlak_P        begrenzing verwijst naar GeometrieBesluitobject_P1
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length($begrenzing_href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB38A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometrieBesluitobject_P1_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB38B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometrieBesluitobject_P1
			</iso:assert>
		</iso:rule>

		<iso:rule context="//imro:Besluitsubvlak_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 39: Besluitsubvlak_P verwijst met begrenzing naar GeometriePlangebied_P3 
				Besluitsubvlak_P     begrenzing verwijst naar GeometrieBesluitobject_P3
			-->
			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:assert test="string-length($begrenzing_href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB39A: <iso:value-of select="name(parent::*)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>
			
			<iso:assert test="key('GeometrieBesluitobject_P3_index',$begrenzing_id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB39B: <iso:value-of select="name(parent::*)"/> bevat begrenzing zonder valide 
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar GeometrieBesluitobject_P3
			</iso:assert>
		 </iso:rule>
	</iso:pattern>	



	<iso:pattern name="GBPlangebiedInfoVerwijzingenBestaat">
	
		<iso:rule context="//imro:GeometriePlangebied/imro:plangebiedInfo_AMB">
			<!-- Gebiedsgerichte besluiten (GeometriePlangebied), Rule 40: plangebiedInfo_AMB verwijst 
				naar Besluitgebied_A
			-->
			<iso:let name="href" value="@xlink:href"/>

			<iso:assert test="string-length($href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB40A: imro:GeometriePlangebied/<iso:value-of select="name()"/> dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="id" value="substring($href,2)"/>
			
			<iso:assert test="key('Besluitgebied_A_index',$id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB40B: <iso:value-of select="name()"/> is geen valide 
verwijzing (huidige waarde : <iso:value-of select="$href"/>) naar Besluitgebied_A
			</iso:assert>
		 </iso:rule>

		<iso:rule context="//imro:GeometriePlangebied/imro:plangebiedInfo_PRV">
			<!-- Gebiedsgerichte besluiten (GeometriePlangebied), Rule 41: plangebiedInfo_PRV verwijst 
				naar Besluitgebied_P
			-->
			<iso:let name="href" value="@xlink:href"/>

			<iso:assert test="string-length($href) &gt; 0" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB41A: imro:GeometriePlangebied/<iso:value-of select="name()"/> dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="id" value="substring($href,2)"/>
			
			<iso:assert test="key('Besluitgebied_P_index',$id)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode GB41B: <iso:value-of select="name()"/> is geen valide 
verwijzing (huidige waarde : <iso:value-of select="$href"/>) naar Besluitgebied_P
			</iso:assert>
		 </iso:rule>

	</iso:pattern>
	

	<iso:diagnostics>
		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup"><iso:value-of select="imro:identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup1"><iso:value-of select="../imro:identificatie"/></iso:diagnostic>
	</iso:diagnostics>

</iso:schema>