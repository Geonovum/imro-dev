<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: additional-validator-rulesv1.12.sch
 * (C) Logica, 2008
 *
 * Info:
 * Extra Schematron Validation Document for IMRO 2006
 *
 * History:
 * 11-03-2008   RB	Initial version
 * 26-05-2008	RD	Reporting of object identities changed because it 
 *					reported the highest object instead of the nearest one.
 * 07-07-2008   RD  Added '|' character in search context of srsName check.
 *                  Removed remark about 'URL' and 'geleideformulier' in file name conventions checks
 * 08-09-2008   RD  Added check for plan ID according to STRI2006 v1.1
 *                  Extended file name convention checks according to STRI2006 v1.1
 * 09-10-2008   RD  Adapted check for PlanID convention according to STRI2006 v1.2
 *                  Adapted and simplified file name convention checks according to STRI2006 v1.2
 * 10-11-2008   RD  Removed space from regular expression of planId.
 *                  Resized end piece of regular expression of planId back to 32 characters,
 *                  and at the same time conserve the regular expression for filename conventions
 *                  according to STRI2006 v1.2
 * 08-12-2008   RD  Added check for number of patches in plangebied geometry
 *                  Extended date check. No more wrong input possible.
 *                  Extended file name conventions check: planId must follow prefix immediately.
 *                  Removed prefix p_ (plankaart).
 *                  Refactoring to make schematron rules reusable for PCP2008 validation.
 *                  Removed queryBinding attribute and redundant namespace definitions.
 *                  Added STRI2006 checks.
 * 19-02-2009   RD  Bugfix: Newest XSLT processor does not allow reuse of variables in the same scope. 
 * 04-05-2009   RD  Diagnostic location information added. Removed unnecessary whitespace.
 *                  Check AD11 prevents heterogeneous multi geometries.
 * 16-06-2009   RD  Use of diagnostics cause performance problems. Redefinitions and less usage of error location variables are necessary.
 *                  Additional error code information added in error messages.
 * 02-06-2009   RD  Check AD11 fixed. Should prevent all heterogeneous multi geometries. Generates error instead of warning.
 * 09-06-2009   RD  Check AD12A, AD12B, AD12C added: checks for plan date combined with plan type and plan status.
 * 11-08-2009   RD  Check AD12C adapted: for date >= 1/1/2010 plan type should be bestemmingsplan (not a mother plan) 
 *					and plan status should be ontwerp,vastgesteld,vigerend. 
 * 13-08-2009   RD  Check AD0 added to block multiple occurrences of the same imro:identificatie value definition.
 * 10-09-2009   RD  Check AD3 adapted. validates all Surfaces instead of only Surfaces inside
 *                  a "plangebied". Error message adapted.
 * 16-12-2009   RD  Added check for presence of geometrical elements when required: AD13
 *                  Added check for coordinates to have correct format and not being empty: AD14
 * 25-01-2010   RD  Added check for presence of child elements in gml:featureMember elements: AD15
 ******************************************************************************/

Opmerkingen / hints:
toevoegen ID in rapportage (als context = geldig planobject): <iso:value-of select="nen3610:identificatie"/>

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron"
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
			xml:lang="en">  <!-- ISO Schematron 1.6 namespace -->
<!-- xmlns:fn="http://www.w3.org/2004/07/xpath-functions" -->

 <!-- <sch:schema xmlns:sch="http://www.ascc.net/xml/schematron"> Schematron namespace -->

	<!-- <iso:title>Schematron validaties voor IMRO2006</iso:title> -->
	<!-- Titel weggehaald om geen output te hebben als er geen fout is -->
	<!-- De validator concludeert daaruit dat er geen fout en dus een valide bestand is -->
	<!-- <iso:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/> -->

	<!-- Onderstaande ingreep (regexp) is nodig omdat XSLT-1 geen reguliere expressies ondersteunt. Hiervoor is
	een hulpfunctie gecreeerd. Indien een stylesheet processor wordt gebruikt die wel XSLT-2
	compliant is, dan kan de prefix "regexp:" verwijderd worden uit deze schematronfile. -->
	<iso:ns prefix="regexp" uri="nl.vrom.roo.util.Regexp"/>
	
	<iso:ns prefix="gml" uri="http://www.opengis.net/gml"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.ravi.nl/imro2006"/>
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

	<!-- Definieer reguliere expressies om PlanIdn en bestandsnamen te valideren -->
			<!-- BesluitDocument prefix bd_ alleen geldig voor Besluitgebied en Onthoudingsgebied -->
	<iso:let name="bestandsprefixenRegexp" value="'(b|v|db|d|vb|tb|t)_'"/>
	
	<iso:let name="ankerRegexp" value="'(#.*)?'"/>
	
	<iso:let name="idnCheckRegexp" value="'NL\.IMRO\.[0-9]{8}[A-Za-z0-9_\-\.]{1,15}-([A-Za-z0-9_\-\.]{1,32})?'"/>

	<iso:let name="stri2006CheckRegexp" value="'NL\.IMRO\.[0-9]{8}[ A-Za-z0-9_\-\.]{1,15}-([A-Za-z0-9_\-\.]{1,62})?\.(html|htm|xhtml|xml|gml|pdf|png|jpg|jpeg|tif)'"/>
	
	<iso:let name="bestandsnaamRegexp" value="concat($bestandsprefixenRegexp,$stri2006CheckRegexp,$ankerRegexp)"/>

	<iso:let name="coordinaatFormat" value="'-?[0-9]{1,6}(\.[0-9]{0,3})?'"/>
	<iso:let name="space" value="'\s+'"/>

	<!-- detectedPlanId is nodig voor extra bestandsnaamvalidatie: planId moet in bestandsnaam voorkomen. -->
	<iso:let name="detectedPlanId" value="//*[imro:typePlan]/imro:identificatie"/>
	<iso:let name="detectedPlanType" value="//imro:typePlan"/>

	<!-- STRI2006: 
		Bestemmingsplannen plantype:
			gemeentelijk plan; bestemmingsplan artikel 10,
			gemeentelijk plan; structuurplan,						Not permitted
			gemeentelijk plan; structuurschets,						Not permitted
			gemeentelijk plan; structuurvisie,						Not permitted
			gemeentelijk plan; uitwerkingsplan artikel 11,
			gemeentelijk plan; wijzigingsplan artikel 11,
			gemeentelijk plan; artikel 19 plan						Not permitted
	 -->
	<iso:let name="isBestemmingsplan" 
			value="not($detectedPlanType='gemeentelijk plan') and 
					contains('gemeentelijk plan; bestemmingsplan artikel 10,
							gemeentelijk plan; uitwerkingsplan artikel 11,
							gemeentelijk plan; wijzigingsplan artikel 11'
						, $detectedPlanType)"/>

	<!-- STRI2006:
		Beleidsplannen plantype:
			gemeentelijk plan,										Structuurvisie
			Euregionaal plan,										Not permitted
			Europees plan,											Not permitted
			nationaal plan,
			nationaal plan; nota,									
			nationaal plan; PKB,
			nationaal plan; structuurschema/schets,					
			nationaal plan; uitwerking nationaal plan,				
			provinciaal plan,
			provinciaal plan; omgevingsplan,						
			provinciaal plan; sectorplan,							
			provinciaal plan; streekplan,							
			provinciaal plan; uitwerking provinciaal plan,			
			regionaal plan,											Not permitted
			regionaal plan; omgevingsplan,							Not permitted
			regionaal plan; sectorplan,								Not permitted
			regionaal plan; structuurplan/schets/visie,				Not permitted
			regionaal plan; uitwerking regionaal plan,				Not permitted
	 -->
	<iso:let name="isBeleidsplan" 
			value="contains('gemeentelijk plan,
							nationaal plan,
							nationaal plan; nota,
							nationaal plan; PKB,
							nationaal plan; structuurschema/schets,
							nationaal plan; uitwerking nationaal plan,
							provinciaal plan,
							provinciaal plan; omgevingsplan,
							provinciaal plan; sectorplan,
							provinciaal plan; streekplan,
							provinciaal plan; uitwerking provinciaal plan'
						, $detectedPlanType)"/>


	<xsl:key name="uniqueIdentificatie" match="//imro:*[imro:identificatie]" use="imro:identificatie"/>


	<iso:pattern name="uniekheidsChecks">
	
		<!-- 
			De definitie van de waarde van een imro:identificatie dient uniek te zijn binnen een plan. 
		 -->
		<iso:rule context="//imro:*[imro:identificatie]">
		
			<iso:let name="identificatie" value="imro:identificatie"/>
			
			<!-- Achterhaal de node van de identificatie uit de lookup table 'uniqueIdentificatie'.
				Deze node is in elk geval 1x opgeslagen hierin. In het geval van een dubbele 
				imro:identificatie zal de node uit de lookup table niet hetzelfde zijn als de node
				die het imro:identificatie element bevat. De laatste keer dat de waarde uit de key
				als imro:identificatie wordt gevonden zal deze signalering niet werken, echter de 
				eerste keer wel (wegens dat de key waarde overschreven is door de laatste waarde) 
				en dat is meteen voldoende.  
				De gml:id van deze elementen moet uniek zijn volgens de schemadefinitie. Daarom kan 
				in het geval van een duplicaat imro:identificatie de gml:id van de elementen niet 
				gelijk zijn.
			-->
			<iso:let name="currentGmlId" value="string(@gml:id)"/>
 
			<iso:let name="lookedUpGmlId" value="string(key('uniqueIdentificatie',$identificatie)/@gml:id)"/>
			
			<iso:assert test="($currentGmlId = $lookedUpGmlId)" diagnostics="identificatie gmlId warning">
Foutcode AD0: imro:identificatie (huidige waarde "<iso:value-of select="$identificatie"/>") is meerdere malen in het plan gedefinieerd. 
Deze identificatie dient uniek te zijn. 
			</iso:assert>
		</iso:rule>
	
	</iso:pattern>
	
	<iso:pattern name="Idn_Check">
	
		<iso:rule context="//*[imro:typePlan]/imro:identificatie">

			<iso:let name="identificatie" value="text()"/>

			<iso:assert test="regexp:matches($identificatie,$idnCheckRegexp)" id="AD1" diagnostics="gmlIdLookup identificatie">
Foutcode AD1: imro:identificatie (huidige waarde "<iso:value-of select="$identificatie"/>") binnen het 
object <iso:value-of select="name(parent::*)"/> voldoet niet aan de conventies van STRI2006 voor plan 
identificatie (PlanIdn regexp: '<iso:value-of select="$idnCheckRegexp"/>')
			</iso:assert>

		</iso:rule>
		
	</iso:pattern>

	<iso:pattern name="typePlan_Check">
		<iso:rule context="//imro:typePlan">

			<iso:assert test="not(name(parent::*)='imro:Bestemmingsplangebied') or not(text()='gemeentelijk plan')" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD2A: typePlan (huidige waarde '<iso:value-of select="text()"/>') binnen element imro:Bestemmingsplangebied is te algemeen gespecificeerd. 
Element typePlan dient nader gespecificeerd te worden door een van de mogelijkheden met extra informatie na de tekst 'gemeentelijk plan' te gebruiken
			</iso:assert>
			
			<iso:assert test="$isBeleidsplan or $isBestemmingsplan" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD2B: typePlan (huidige waarde '<iso:value-of select="text()"/>') binnen element <iso:value-of select="name(..)"/> 
heeft een waarde die niet is toegestaan wegens besluit van VROM.
			</iso:assert>
			
		</iso:rule>
		
	</iso:pattern>


	<iso:pattern name="Surface_num_patches_eq_1_Check">
		<iso:rule context="//imro:geometrie//gml:Surface">

			<iso:let name="numOfPatches" value="count(gml:patches)"/>

			<iso:assert test="$numOfPatches = 1"  diagnostics="gmlIdLookup">
Foutcode AD3A: Binnen een gml:Surface element (gml:id="<iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/>") is slechts 1 gml:patches element toegestaan (huidig aantal=<iso:value-of select="$numOfPatches"/>)
			</iso:assert>

			<iso:let name="numOfPolygonPatches" value="count(gml:patches/gml:PolygonPatch)"/>
  			<!-- 
  				First logic expression tests whether problem reported by iso:assert above.
  				Second logic expression performs the real check for the number of PolygonPatch elements. 
  			 -->
			<iso:assert test="($numOfPatches != 1) or ($numOfPolygonPatches = 1)" diagnostics="gmlIdLookup">
Foutcode AD3B: Binnen een gml:Surface (gml:id="<iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/>") is 1 gml:patches element toegestaan en
daarin 1 gml:PolygonPatch element toegestaan (huidig aantal=<iso:value-of select="$numOfPolygonPatches"/>)
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>



	<iso:pattern name="SRSName_Check">
		<iso:rule context="//*[@srsName]">
		
			<iso:assert test="@srsName = 'urn:ogc:def:crs:EPSG::28992'" id="AD4" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD4: srsName (huidige waarde "<iso:value-of select="@srsName"/>") moet gelijk zijn aan urn:ogc:def:crs:EPSG::28992.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>). 
			</iso:assert>
		</iso:rule>

		<iso:rule context="//gml:posList | //gml:pos | //gml:coord | //gml:coordinates | //gml:lowerCorner | //gml:upperCorner">

			<iso:assert test="ancestor::*[@srsName]" diagnostics="gmlIdLookup identificatieLookup coords">
Foutcode AD5: Geen srsName aanwezig voor geometrisch element <iso:value-of select="name()"/> binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
Eerste coordinaten zijn: <iso:value-of select="substring(text(),0,66)"/>
			</iso:assert>
			
		</iso:rule>
	</iso:pattern>

	<!--
	- PRBP2006.pdf paragraaf 3.2: plandatum heeft formaat jjjj-mm-dd
	- PRBP2006.pdf paragraaf 3.3: einddatumVoorlopig en begindatumDefinitief hebben formaat jjjj-mm-dd
	- PRBP2006.pdf bijlage A : creatiedatum heeft formaat jjjj-mm-dd
	-->
	<iso:pattern name="DatumCheck">
	
		<iso:rule context="//imro:datum | //imro:begindatumDefinitief | //imro:einddatumVoorlopig | //imro:creatiedatum">

			<iso:let name="matchesDateFormat" value="regexp:matches(.,'[0-9]{4}-[0-9]{2}-[0-9]{2}')"/>
		
			 <iso:assert test="$matchesDateFormat" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD6A: De datum <iso:value-of select="name()"/>  (huidige waarde "<iso:value-of select="text()"/>") moet formaat jjjj-mm-dd hebben.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>

			<iso:let name="century" value="substring(text(),1,2)"/>
			<iso:let name="year" value="substring(text(),1,4)"/>
			<iso:let name="month" value="substring(text(),6,2)"/>
			<iso:let name="day" value="substring(text(),9,2)"/>
			
			<!--
				Datum regels:
					Eeuw = 19 of 20.
					1 <= Maand <=12.
					1 <= dag.
					Maanden met 31 dagen: 01,03,05,07,08,10 of 12.
					Maanden met 30 dagen: 04,06,09 of 11.
					Februari: dag <=28, of als schrikkeljaar (jaar modulo 4 = 0) dan dag <= 29.
												
					Hierbij is gebruik gemaakt van de booleaanse algebraregel: 
					!A + AB =!A + B   ofwel:  Not(A) or (A and B) = Not(A) or B
					
					Als er niet aan het datumformaat voldaan is dan wordt de volgende constructie als geldig 
					beschouwd. In dat geval is de fout namelijk al boven gerapporteerd en hoeft er niet in
					detail te worden gekeken. 
			 -->
			
			<iso:assert test="not($matchesDateFormat) or 
								(
									($century=19 or $century=20) and 
									(($month &lt;=12) and ($month &gt;= 1)) and
									($day &gt;= 1) and 
									( not(contains('01,03,05,07,08,10,12',$month)) or ($day &lt;=31) ) and
									( not(contains('04,06,09,11',$month)) or ($day &lt;= 30) ) and 
									( not($month=2) or ($day &lt;=28) or (($day &lt;= 29 ) and ($year mod 4 = 0)) )
								)" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD6B: De datum <iso:value-of select="name()"/>  (huidige waarde "<iso:value-of select="text()"/>") is geen geldige datum.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>
			
		</iso:rule>
	</iso:pattern>
	
	<!--
	- PRBP2006.pdf: gemeenteCode heeft 4 cijfers
	-->
	<iso:pattern name="CBSGemeenteCode">
		<iso:rule context="//imro:gemeenteCode">
		
			<iso:assert test="regexp:matches(.,'[0-9]{4}')" id="AD7" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD7: gemeenteCode (huidige waarde "<iso:value-of select="text()"/>") moet uit 4 cijfers bestaan. 
Vul eventueel aan met voorloopnullen. 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<!--
	- Besluit VROM 31-03-2008 : provincieCode heeft 2 cijfers
	-->
	<iso:pattern name="CBSProvincieCode">
		<iso:rule context="//imro:provincieCode">

			<iso:assert test="regexp:matches(.,'[0-9]{2}')" id="AD8" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD8: provincieCode (huidige waarde "<iso:value-of select="text()"/>") moet uit 2 cijfers bestaan.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>
		</iso:rule>
	</iso:pattern>



	<!-- 
	- PRBP2006.pdf paragraaf 3.2: verwijzingNaarTekst is verplicht & moet voldoen aan bestandsnaamconventies.
	- PRBP2006.pdf paragraaf 3.3 en 3.4: bestandsnaam volgens bestandsnaamconventies (zonder directorystructuren erin).
	-->
	<iso:pattern name="verwijzingNaarTekst">
		<iso:rule context="//imro:verwijzingNaarTekst">

			<iso:let name="bestandsnaamMatchesRegexp" value="regexp:matches(.,$bestandsnaamRegexp)"/>
		
			<iso:assert test="$bestandsnaamMatchesRegexp" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD9A: verwijzingNaarTekst (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet voldoet aan de bestandsnaamconventies van IMRO2006 en STRI2006 
(Reguliere expressie: <iso:value-of select="$bestandsnaamRegexp"/>)
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>
			
			<iso:let name="bestandsnaamNaPrefix" value="substring-after(.,'_')"/>
			<iso:let name="bestandsnaamNaPrefixBegintMetPlanId" value="starts-with($bestandsnaamNaPrefix, $detectedPlanId)"/>
			
			<iso:let name="bestandsNaamEenduidigVolgensSTRI2006Regexp" 
					value="count($detectedPlanId)=1 and $bestandsnaamMatchesRegexp"/>
			
			<!-- 
				Als er meerdere plangebieden zijn (ofwel: meer dan 1 gedetecteerde planId)
				dan kan er geen test worden uitgevoerd die de aanwezigheid van de planId
				in de bestandsnaam detecteert. In dat geval wordt deze test overgeslagen. 
				Ook als de bestandsnaam niet aan de reguliere expressie voor bestandsnamen 
				voldoet wordt deze test overgeslagen. 
				
				Gebruik wordt gemaakt van booleanse expressie: !A + AB = !A + B
			 -->
			<iso:assert test="not($bestandsNaamEenduidigVolgensSTRI2006Regexp) 
													or $bestandsnaamNaPrefixBegintMetPlanId" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD9B: verwijzingNaarTekst (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet voldoet aan de bestandsnaamconventies van IMRO2006 en STRI2006. 
De planId (<iso:value-of select="$detectedPlanId"/>) volgt niet onmiddelijk na de prefix. 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>

			<!-- Checks volgens STRI2006. -->
			<iso:let name="bestandsnaamMatchesRegexp_1" 
				value="regexp:matches(text(),concat('(v_.*(\.htm|\.html|\.xhtml)|(vb_|t_|tb).*\.pdf)',$ankerRegexp))"/>
			
 			<iso:assert test="not($bestandsNaamEenduidigVolgensSTRI2006Regexp 
 									and $isBestemmingsplan) 
 								or $bestandsnaamMatchesRegexp_1" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD9C: verwijzingNaarTekst bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2006 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2006. 
Raadpleeg STRI2006 voor de juiste prefixen en extensies bij het genoemde plantype.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>

			<iso:let name="bestandsnaamMatchesRegexp_2" 
				value="regexp:matches(text(),concat('((d_|db_).*\.pdf|(b_|bd_).*(\.htm|\.html|\.xhtml|\.pdf))',$ankerRegexp))"/>

 			<iso:assert test="not($bestandsNaamEenduidigVolgensSTRI2006Regexp
									and $isBeleidsplan) 
 								or $bestandsnaamMatchesRegexp_2" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD9D: verwijzingNaarTekst bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2006 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2006. 
Raadpleeg STRI2006 voor de juiste prefixen en extensies bij het genoemde plantype.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>

		</iso:rule>
		
	</iso:pattern>
	
	<!--
	-	gml:featureMembers is deprecated in toekomstige versies (>3.1) van GML o.a. omdat dit om 
	-	technische en performance redenen niet voordelig.
	--> 
	<iso:pattern name="featureMembers">
		<iso:rule context="//gml:featureMembers">
			<iso:assert test="false">
Foutcode AD10: Het gebruik van gml:featureMembers (met een 's' op het einde) wordt niet ondersteund.
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>
	
	<!-- Heterogene Multigeometrieën worden uitgesloten omdat deze niet ondersteund worden. -->
	<iso:pattern name="MultiGeometry">
	
		<iso:rule context="//imro:geometrie//imro:geometrieCombi/gml:MultiGeometry">
			<!-- Verzamel alle geometrie onderdelen: Verwijder nesting elementen door de structuur plat te slaan. -->
			<iso:let name="allMembers" value=".//gml:geometryMember | .//gml:geometryMembers"/>
			
			<iso:let name="containsPoints"		value="count($allMembers[gml:Point] |
														$allMembers[gml:MultiPoint]) &gt; 0"/>

			<iso:let name="containsCurves"		value="count($allMembers[gml:Curve] | 
														$allMembers[gml:MultiCurve] |
														$allMembers[gml:LineString]) &gt; 0"/>
														
			<iso:let name="containsSurfaces"	value="count($allMembers[gml:Surface] | 
														$allMembers[gml:MultiSurface] | 
														$allMembers[gml:Polygon]) &gt; 0"/>
							
			<iso:assert test="(not($containsCurves) and not($containsSurfaces)) or
								(not($containsPoints) and not($containsSurfaces)) or
								(not($containsPoints) and not($containsCurves))"
								diagnostics="gmlIdLookup1 identificatieLookup">
Foutcode AD11: Heterogeen gebruik van gml:MultiGeometry (Punten aanwezig: <iso:value-of select="$containsPoints"/>, 
Curves aanwezig: <iso:value-of select="$containsCurves"/>, Surfaces aanwezig: <iso:value-of select="$containsSurfaces"/>) wordt niet ondersteund. 
Slechts een van de typen Points, Curves of Surface of varianten hiervan mag aanwezig zijn.  
Binnen element met gml:id=<iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/>
			</iso:assert>
			
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="GeldigheidPlannenInCombinatieMetDatumCheck">
	
		<iso:rule context="//*[imro:typePlan]/imro:planstatusInfo">
		
			<iso:let name="datum" value=".//imro:datum/text()"/>

			<iso:let name="year" value="substring($datum,1,4)"/>
			<iso:let name="month" value="substring($datum,6,2)"/>
			
			<iso:let name="planStatus" value=".//imro:planstatus/text()"/>
			<iso:let name="planType" value="../imro:typePlan/text()"/>
			
			<iso:let name="isVoor2010" value="$year &lt; 2010"/>
													
			<iso:let name="isPlanStatusConceptVoorontwerpOntwerp" 
						value="$planStatus='concept' or 
								$planStatus='voorontwerp' or 
								$planStatus='ontwerp'"/>

			<iso:let name="isMoederplan" 
						value="$planType='gemeentelijk plan; bestemmingsplan artikel 10'"/>

			<iso:let name="isAfgeleidPlan" 
						value="$planType='gemeentelijk plan; uitwerkingsplan artikel 11' or
								$planType='gemeentelijk plan; wijzigingsplan artikel 11' or
								$planType='gemeentelijk plan; artikel 19 plan'"/>

			<iso:let name="isBestemmingsplan" value="$isMoederplan or $isAfgeleidPlan"/>

			<!--
			1.	Een IMRO2006-gecodeerd moederplan met de combinatie van 
				de planstatus concept/voorontwerp/ontwerp en een 
				planstatusdatum na 1/1/2010 is onmogelijk. 
				
				- Als geen bestemmingsplan dan doorlaten.
				Bestemmingsplan:
				- Als geen moederplan dan doorlaten, wordt later behandeld.
				Bestemmingsplan & moederplan:
				- Als voor 2010 dan doorlaten.
				Bestemmingsplan & moederplan & datum>=2010:
				- Status niet gelijk aan concept, voorontwerp, ontwerp doorlaten. 

				Huidige situatie doorgelaten door test1:
				Geen bestemmingsplan / 
				bestemmingsplan & geen moederplan / 
				bestemmingsplan & wel moederplan & datum < 2010 / 
				bestemmingsplan & wel moederplan & datum >= 2010 & status vastgesteld, vigerend.
			 -->
			<iso:let name="test1" value="not($isBestemmingsplan) or
											not($isMoederplan) or 
											$isVoor2010 or 
											not($isPlanStatusConceptVoorontwerpOntwerp)"/>

			<iso:assert test="$test1" diagnostics="warning">
Foutcode AD12A: Dit concept/voorontwerp/ontwerp plan is gecodeerd met DURP Standaarden 2006 (IMRO2006). 
Dat is niet meer toegestaan vanaf 1/1/2010.
			</iso:assert>

			<!--
			2.	Een IMRO2006-gecodeerd plan en een planstatusdatum na 1/1/2010 is mogelijk, 
				maar alleen in het geval dat het moederplan in ontwerp reeds is vastgesteld 
				door de raad (dat is dus niet gelijk aan de status vastgesteld!) onder de 
				oude WRO, d.w.z. voor 1/7/2008.
				
				De situaties die in test1 worden afgevangen worden niet meegenomen.
				
				Huidige situatie doorgelaten door test1:
				Geen bestemmingsplan / 
				bestemmingsplan & geen moederplan / 
				bestemmingsplan & wel moederplan & datum < 2010 / 
				bestemmingsplan & wel moederplan & datum >= 2010 & status vastgesteld, vigerend.
				 
				- Als geen bestemmingsplan dan doorlaten.
				Bestemmingsplan: geen moederplan / wel moederplan & datum < 2010 / wel moederplan & datum>=2010 & status vastgesteld,vigerend:
				- Als datum voor 2010 dan doorlaten.
				Bestemmingsplan & datum>=2010: geen moederplan / wel moederplan & status vastgesteld,vigerend:
				- Als moederplan & status = vastgesteld, vigerend dan doorlaten.
				Bestemmingsplan & datum>=2010 & geen moederplan.
				- Als geen moederplan & status = ontwerp, vastgesteld, vigerend dan doorlaten.
				
				Doorgelaten door test2: 
				Geen bestemmingsplan / 
				bestemmingsplan & datum < 2010 / 
				bestemmingsplan & datum >= 2010 & status=vastgesteld,vigerend / 
				bestemmingsplan & datum >= 2010 & geen moederplan & status=ontwerp,vastgesteld,vigerend
			 -->
			<iso:let name="isPlanStatusVastgesteldVigerend" 
						value="$planStatus='vastgesteld' or 
								$planStatus='vigerend'"/>

			<iso:let name="isPlanStatusOntwerpVastgesteldVigerend" 
						value="$planStatus='ontwerp' or 
								$planStatus='vastgesteld' or 
								$planStatus='vigerend'"/>

			<iso:let name="test2" value="not($test1) or 
											not($isBestemmingsplan) or
											$isVoor2010 or 
											($isMoederplan and $isPlanStatusVastgesteldVigerend) or 
											(not($isMoederplan) and $isPlanStatusOntwerpVastgesteldVigerend)"/>

			<iso:assert test="$test2" diagnostics="warning">
Foutcode AD12B: Dit plan is gecodeerd met DURP Standaarden 2006 (IMRO2006). 
Dat is slechts mogelijk indien het plan reeds onder de oude WRO (d.w.z. voor 1/7/2008) 
met ontwerpstadium of vastgesteld-stadium is vastgesteld door de raad. In andere gevallen 
moeten de RO Standaarden 2008 (IMRO2008) gebruikt worden. 
			</iso:assert>

		</iso:rule>
		
	</iso:pattern>
	
	
	<iso:pattern name="Content_present_check">
		<!--
			Het is de bedoeling dat alle elementen van het type gml:XXXXXPropertyType
			een geometrisch element bevatten.
			Het is ook de bedoeling dat geometrische elementen coördinaten bevatten.
			Helaas staat GML ook Xlink verwijzingen toe. Dit is echter ongewenst in het gebruik.
			Het XML schema van GML staat zelfs toe dat er helemaal niets in zo'n element zit, 
			geen XLink en geen geometriecomponent. In tekst staat echter uitgelegd dat er minstens
			één van deze componenten in zou moeten zitten.
			In de GML definities behorend bij IMRO2008 is deze ruimte ingeperkt, zijn er geen XLinks 
			meer in toegestaan, enkel nog geometrische componenten.
			
			gml:patches wordt getest door check AD3. Zou hier slechts een extra foutmelding geven.
		 -->
		<iso:rule context="imro:aanpijlingspunt |
						imro:plaatsingspunt |
						imro:geometriePunt |
						imro:geometrieLijn |
						imro:geometrieVlak |
						imro:geometrieCombi |
						imro:geometrieMultiLijn |
						imro:geometrieMultiPunt |
						imro:geometrieMultiVlak |
						gml:MultiSurface |
						gml:MultiCurve |
						gml:MultiPoint |
						gml:MultiGeometry |
						gml:pointMember |
						gml:pointMembers |
						gml:curveMember |
						gml:curveMembers |
						gml:surfaceMember |
						gml:surfaceMembers |
						gml:geometryMember |
						gml:geometryMembers |
						gml:segments |
						gml:baseCurve |
						gml:PolygonPatch">

						
			<!-- Geometrical child elements need to be present here. -->
			<iso:assert test="(.//gml:*)" diagnostics="gmlIdLookup1 identificatieLookup">
Foutcode AD13: <iso:name/> dient een geometrische inhoud te hebben.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>

		</iso:rule>

	</iso:pattern>
	
	<iso:pattern name="checkCoordinatenFormat">
		<!-- Coordinaten mogen maximaal 3 decimalen bevatten.
			Tevens moeten coördinaten in even aantal voorkomen.
			Lege coordinaten zijn niet toegestaan 
		-->
		
		<iso:rule context="//gml:posList | //gml:pos | //gml:lowerCorner | //gml:upperCorner">
			<!-- Convert all white space characters into single space characters -->
			
			<iso:let name="coordinates" value="normalize-space(text())"/>
			<iso:let name="coords" value="substring($coordinates,0,66)"/>
			<iso:let name="identificatie" value="ancestor::*[imro:identificatie][1]/imro:identificatie"/>
			
			<!-- Try to tokenize the coordinates string and match every coordinate to an expression -->
  			<iso:assert test="regexp:matchesAfterTokenize($coordinates,$coordinaatFormat,$space)" diagnostics="coords gmlIdLookup identificatieLookup">
Foutcode AD14A: Coördinaten binnen <iso:value-of select="name()"/> moeten getallen zijn van maximaal 3 decimalen na de decimale komma, waarbij
meerdere exemplaren gescheiden zijn door lege ruimten. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>


			<iso:let name="aantal" value="regexp:tokenCount($coordinates,$space)"/>
			
			<iso:assert test="(2 * floor($aantal div 2) = $aantal) and ($aantal > 0)" diagnostics="coords gmlIdLookup identificatieLookup">
Foutcode AD14B: Coördinaten binnen <iso:value-of select="name()"/> komen niet in het juiste aantal voor. 
Verwacht wordt dat dit een even aantal coördinaten ( &gt; 0 ) is, geconstateerd aantal is <iso:value-of select="$aantal"/>. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>

		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="featureMemberContentCheck">

		<iso:rule context="gml:featureMember">

			<iso:assert test="(.//imro:*)" diagnostics="gmlIdPrecedingLookup gmlIdFollowingLookup">
Foutcode AD15: <iso:name/> dient een inhoud te hebben.
Tussen element met gml:id="<iso:value-of select="preceding-sibling::gml:featureMember[position()=1]/imro:*[@gml:id]/@gml:id"/>" en gml:id="<iso:value-of select="following-sibling::gml:featureMember[position()=1]/imro:*[@gml:id]/@gml:id"/>".
			</iso:assert>
		</iso:rule>

	</iso:pattern>
	
	
	
	<iso:diagnostics>
		<iso:diagnostic id="gmlId"><iso:value-of select="@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdLookup"><iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdLookup1"><iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdPrecedingLookup"><iso:value-of select="preceding-sibling::gml:featureMember[position()=1]/imro:*[@gml:id]/@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdFollowingLookup"><iso:value-of select="following-sibling::gml:featureMember[position()=1]/imro:*[@gml:id]/@gml:id"/></iso:diagnostic>

		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup"><iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/></iso:diagnostic>

		<iso:diagnostic id="coords"><iso:value-of select="substring(text(),0,66)"/></iso:diagnostic>
		<iso:diagnostic id="warning"></iso:diagnostic>
	</iso:diagnostics>
</iso:schema>
