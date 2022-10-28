<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: additional-validator-rules-2008v1.18-b-RC.sch
 * (C) CGI, 2013
 * 2022: Geonovum, Arnoud de Boer (AdB), Gijs Koedam (GRK)
 *
 * Info:
 * Extra Schematron Validation Document for IMRO 2008
 *
 * History:
 * 11-03-2008   RD  Initial version
 * 25-06-2008   RB  Changed NSUrl of IMRO 2008
 * 07-07-2008   RD  Added check for coordinates format
 *                  Removed reporting of gml:id because it is equal to 'imro:identificatie'
 *                  Removed search contexts //gml:coord and //gml:coordinates from srsName check because these don't exist in IRMO2008
 *                  Added prefix to error codes
 *                  Refactored AD5
 * 10-07-2008   RD  File name conventions refined
 * 20-08-2008   RD  Added coordinate checks
 * 02-09-2008   RD  Coordinate checks weakened. 
 *                  Extended error messages for file name conventions.
 *                  Check for illustrations adapted.
 * 17-10-2008   RD  Minus signs permitted for coordinate checks + size limits removed.
 *                  Removed checks AD5A0, AD5AB, AD5AD, AD5AR, AD5AT
 * 08-12-2008   RD  Cosmetic changes: Error message AD6A adapted (more than 6 digits allowed before decimal point for plans in North-Sea).
 *                  Error message AD2A adapted (No coordinates information is available here).
 *					Element identification of error element adapted of checks for geometric problems (AD2A, AD2B, AD6A, AD6B)
 *					because of elementen with geometrie without imro:identificatie.
 *                  Added check AD7 for number of patches in plangebied geometry
 *                  Merged rules for //imro:creatieDatum and //imro:datum into AD3A (old AD3B and AD3A merged).
 *                  Rule AD3B is now an extended date check. No more wrong date input possible.
 *                  Extended file name conventions checks: planId must follow prefix immediately.
 *                  Removed queryBinding attribute and redundant namespace definitions.
 *                  Added STRI2008 checks.
 * 18-02-2009   RD  Dependency check for planstatus and presence of besluitnummer and verwijzingNaarVaststellingsbesluit.
 *                  Incorrect regexp bugfix in rule AD5D fixed.
 *                  Bugfix: Newest XSLT processor does not allow reuse of variables in the same scope. 
 *                  New checks for IMRO2008 version 1.1.
 * 04-05-2009   RD  Diagnostic information added.
 *                  Removed checks AD8A, AD8B, AD9A, AD9B. These are redundant because of schematron checks: BP7, SV21, GB28, GB29 and GB30.
 *                  Check AD11 prevents heterogeneous multi geometries.
 * 16-06-2009   RD  Use of diagnostics cause performance problems. Redefinitions and less usage of error location variables are necessary.
 * 02-07-2009   RD  Check AD11 fixed. Should prevent all heterogeneous multi geometries. Generates error instead of warning.
 * 09-07-2009   RD  Check AD12 added: checks for plan date.
 * 10-09-2009   RD  Check AD7 adapted. validates all Surfaces instead of only Surfaces inside
 *                  a "plangebied". Error message adapted.
 * 05-01-2010   RD  Added check for presence of geometrical elements when required: AD13
 * 02-03-2010   RD  Check AD5A made less strict for plan type "Structuurvisie": document with prefix d_ may contain extra info after the planId.
 *                  Check AD6B adapted cosmetically. replaced custom function TokenCount by an XPath-2.0 syntax expression.
 *                  Added check for "Vorm Vrije Plannen": AD20: imro:thema should match a special regular expression when starting with "#" or "other: #".
 *                  Added check for "Vorm Vrije Plannen": AD21: Map number 1 must be present in one of the imro:thema fields and must be the minimum number (0 may not appear).
 *                  Added check for "Vorm Vrije Plannen": AD22: Symbol code inside an imro:thema element should have valid prefix characters.
 *                  Added check for "Vorm Vrije Plannen": AD23: Map number - map name combination should be unique
 *                  Added check for "Vorm Vrije Plannen": AD25: every type of geometry of a plan object (represented by imro:begrenzing) should be 
 *                  present somewhere in the imro:thema fields (if imro:thema encoded as VVP thema).
 * 22-06-2010   RD  Rule AD6B cosmetic adaption rolled back. This because of excessive memory usage in case of large numbers of coordinates.
 * 09-06-2011   RD  Rule AD5F added. In imro:verwijzingNaarTekstInfo the imro:typeTekst field need to correspond to the prefix of the filename
 *                  mentioned in the imro:verwijzingNaarTekst field. This only within the type imro:Bestemmingsplangebied.
 *                  Rule AD14 added. Name of imro:Enkelbestemming or imro:Dubbelbestemming needs to start with the content of imro:hoofdgroep 
 *					and eventually additional content: <empty space><dash (-)><empty space><text>. 
 *					These restrictions do not apply when imro:hoofdgroep has the value 'overig'.
 * 04-06-2013   MO  Added validation for 'geldende imro norm voor plan' RO standaarden 2012 per 1-7-2013
 * 12-10-2022	AdB IMRO2008 TAM-uitgebreid validaties scenario B opgenomen (zie einde document)
 * 28-10-2022	GRK Datum inwerkingtreding Ow aangepast n.a.v. uitstel: 01-01-2023 ==> 01-07-2023 
 ******************************************************************************/

Opmerkingen / hints:

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			xmlns:str="http://exslt.org/strings"
			xmlns:func="http://exslt.org/functions"
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
	<iso:ns prefix="regexp" uri="nl.overheid.roo.util.Regexp"/>
	
	<iso:ns prefix="gml" uri="http://www.opengis.net/gml"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2008/1"/>
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

	<iso:let name="upperCase" value="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<iso:let name="lowerCase" value="'abcdefghijklmnopqrstuvwxyz'"/>

	<!-- 
	Check voor identificatie: NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}
	Bestandsnaamconventie: ([a-z]{1,2}_)?NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}(_[A-Za-z0-9\.]{1,20})?\.(html|htm|xhtml|xml|gml|pdf|png|jpg|jpeg)
	Toegestande prefixes: (r|rb|t|tb|i|vb|pt|g|d|db|b|bb)_
	 -->
	<iso:let name="idncheck" value="'NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}'"/>
	<iso:let name="naamverlenging" value="'(_[A-Za-z0-9\.]{1,20})?'"/>

	<iso:let name="suffix" value="'(#.*)?'"/>
	
	<iso:let name="coordinaatFormat" value="'-?[0-9]{1,6}(\.[0-9]{0,3})?'"/>
	<iso:let name="space" value="'[ \t\r\n\v\f]+'"/>


	<iso:let name="VVPSpecialThemaTriggerRegexp" value="'(other:\s)?#.*'"/>
	<iso:let name="VVPSpecialThemaRegexp" value="'(other:\s)?#\d+\|.+\|([a-zA-Z]{1,2}\d+)?'"/>
	<iso:let name="VVPSymboolcodePrefixes" value="'S,ES,AS,L,P'"/>

	<!-- detectedPlanId is nodig voor extra bestandsnaamvalidatie: planId moet in bestandsnaam voorkomen. -->
	<iso:let name="detectedPlanId" value="//*[imro:typePlan]/imro:identificatie"/>
	<iso:let name="detectedPlanType" value="//imro:typePlan"/>


	<!-- STRI2008 declarations: -->
	<iso:let name="isBestemmingsplan" 
			value="contains('bestemmingsplan,
						inpassingsplan,
						rijksbestemmingsplan,
						wijzigingsplan,
						uitwerkingsplan'
						, $detectedPlanType)"/>
	
	<iso:let name="isGebiedsgerichtBesluit"
			value="contains('aanwijzingsbesluit,
							beheersverordening,
							buiten toepassing verklaring beheersverordening,
							projectbesluit,
							reactieve aanwijzing,
							voorbereidingsbesluit,
							tijdelijke ontheffing buitenplans,
							amvb'
							,$detectedPlanType)"/>

	<iso:let name="isStructuurvisie" value="$detectedPlanType='structuurvisie'"/>
	
	<iso:let name="isProvincialeVerordening" value="$detectedPlanType='provinciale verordening'"/>
	<!-- End STRI2008 declarations -->

	<iso:let name="isAmvb" value="$detectedPlanType='amvb'"/>
	
	<iso:let name="isGemeentelijkeStructuurvisie" value="boolean(//imro:Structuurvisieplangebied_G)"/>

	<!-- 
		Vormvrije plannen detectie. 
		Een vormvrij plan is een AMVB, een structuurvisie of een provinciale verordening.
		Een gemeentelijke structuurvisie is echter geen vormvrij plan dus mag ook niet 
		als VVP gevalideerd worden.
	-->
	<iso:let name="isVVP" value="boolean($isAmvb or 
								($isStructuurvisie and not($isGemeentelijkeStructuurvisie)) or 
								$isProvincialeVerordening)"/>

	<!-- Creëer een verzameling van alle aanwezige VVP thema's. -->

	<xsl:key name="VVPSpecialeThemasPrefixedKey" 
				match="imro:thema[regexp:matches(text(),'(other:\s)?#.*')]" 
				use="."/>

	<xsl:key name="VVPSpecialeThemasKey" 
				match="imro:thema[regexp:matches(text(),'(other:\s)?#\d+\|.+\|[a-zA-Z]{1,2}\d+')]" 
				use="."/>

	<xsl:key name="VVPSpecialeThemasMetValideSymboolCodeKey" 
				match="imro:thema[regexp:matches(text(),'(other:\s)?#\d+\|.+\|[a-zA-Z]{1,2}\d+') and
								substring-after(substring-after(text(),'|'),'|') != ''  and
								contains('S,ES,AS,L,P',regexp:tokenize(substring-after(substring-after(text(),'|'),'|'),'\d+'))]"
				use="."/>

	<xsl:key name="VVPThemasPerGeometrieTypeSurfaceByGmlId" 
				match="imro:thema[translate(regexp:tokenize(substring-after(substring-after(text(),'|'),'|'),'\d+'),'SLPAE','SLP')='S']"
				use="parent::imro:*/@gml:id"/>

	<xsl:key name="VVPThemasPerGeometrieTypeLineByGmlId" 
				match="imro:thema[translate(regexp:tokenize(substring-after(substring-after(text(),'|'),'|'),'\d+'),'SLPAE','SLP')='L']"
				use="parent::imro:*/@gml:id"/>

	<xsl:key name="VVPThemasPerGeometrieTypePointByGmlId" 
				match="imro:thema[translate(regexp:tokenize(substring-after(substring-after(text(),'|'),'|'),'\d+'),'SLPAE','SLP')='P']"
				use="parent::imro:*/@gml:id"/>

	<xsl:key name="VVPKaartNummersKey" match="imro:thema[key('VVPSpecialeThemasKey',.)]" 
								use="number(substring-before(substring-after(text(),'#'),'|'))"/>

	<xsl:key name="VVPThemaMetValideSymboolCodeByGmlIdKey" match="imro:thema[key('VVPSpecialeThemasMetValideSymboolCodeKey',.)]" 
								use="parent::imro:*/@gml:id"/>

	<!-- Bepaal alle vlakgeometrieën. Deze kunnen in multigeometrieën verborgen zijn waar ze dan bijvoorbeeld als Polygon in staan. -->
	<xsl:key name="surface_index" match="//imro:geometrie[descendant::gml:Surface or 
															descendant::gml:Polygon]"
								use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="Niet_surface_key" match="//imro:geometrie[not(descendant::gml:Surface or 
															descendant::gml:Polygon)]"
								use="."/>
								
	<!-- Bepaal alle lijngeometrieën, maar wees er zeker van dat deze lijnen geen onderdeel van Surfaces zijn. -->
	<xsl:key name="line_index" match="//imro:geometrie[key('Niet_surface_key',.) and 
														(descendant::gml:Curve or
														descendant::gml:LineString or
														descendant::gml:Ring or
														descendant::gml:LinearRing)]" 
								use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<!-- Bepaal alle puntgeometrieën. -->
	<xsl:key name="point_index" match="//imro:geometrie[descendant::gml:Point]" 
								use="ancestor::imro:*[@gml:id]/@gml:id"/>
	
<!-- 
	<xsl:key name="VVPKaartNamenKey" match="imro:thema[key('VVPSpecialeThemasKey',.)]" 
								use="substring-before(substring-after(text(),'|'),'|')"/>

	<xsl:key name="VVPSymboolcodeKey" match="imro:thema[key('VVPSpecialeThemasKey',.)]" 
								use="substring-after(substring-after(text(),'|'),'|')"/>
-->

	<xsl:key name="vvpBegrenzingPerGeometrieTypeSurface" match="imro:begrenzing[@xlink:href and key('surface_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>
	<xsl:key name="vvpBegrenzingPerGeometrieTypeLine" match="imro:begrenzing[@xlink:href and key('line_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>
	<xsl:key name="vvpBegrenzingPerGeometrieTypePoint" match="imro:begrenzing[@xlink:href and key('point_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>

	<iso:pattern name="IdentificatieCheck">
	
		<iso:rule context="//*[imro:typePlan]">

			<iso:let name="identificatie" value="imro:identificatie"/>
		
			<iso:assert test="regexp:matches($identificatie,$idncheck)" diagnostics="identificatie">
Foutcode AD1: imro:identificatie (huidige waarde "<iso:value-of select="$identificatie"/>") binnen het 
object <iso:value-of select="name()"/> voldoet niet aan de conventies van STRI2008.
			</iso:assert>
		</iso:rule>
	</iso:pattern>


	<iso:pattern name="SRSCheck">
		<iso:rule context="//*[@srsName]">
		
			<iso:assert test="@srsName = 'urn:ogc:def:crs:EPSG::28992'" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD2A: srsName (huidige waarde "<iso:value-of select="@srsName"/>") moet gelijk zijn aan urn:ogc:def:crs:EPSG::28992.
Binnen het element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//gml:posList | //gml:pos | //gml:lowerCorner | //gml:upperCorner">
		
			<iso:assert test="ancestor::*[@srsName]" diagnostics="gmlIdLookup identificatieLookup coordsLookup">
Foutcode AD2B: Geen srsName aanwezig voor geometrisch element <iso:value-of select="name()"/> 
binnen het element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="substring(text(),0,66)"/>
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<!-- 
		Check datums in het formaat jjjj-mm-dd: imro:creatiedatum, imro:datum
	 -->
	<iso:pattern name="DatumCheck">
		<iso:rule context="//imro:creatiedatum | //imro:datum">
		
			<iso:let name="matchesDateFormat" value="regexp:matches(.,'[0-9]{4}-[0-9]{2}-[0-9]{2}')"/>
			
			<iso:assert test="$matchesDateFormat" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD3A: De datum <iso:value-of select="name()"/>  (huidige waarde "<iso:value-of select="text()"/>") moet formaat jjjj-mm-dd hebben.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
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
									(($century=19) or ($century=20)) and 
									(($month &lt;=12) and ($month &gt;= 1)) and
									($day &gt;= 1) and 
									( not(contains('01,03,05,07,08,10,12',$month)) or ($day &lt;=31) ) and
									( not(contains('04,06,09,11',$month)) or ($day &lt;= 30) ) and 
									( not($month=2) or ($day &lt;=28) or (($day &lt;= 29 ) and ($year mod 4 = 0)) )
								)" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD3B: De datum <iso:value-of select="name()"/>  (huidige waarde "<iso:value-of select="text()"/>") is geen geldige datum.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

		</iso:rule>
	</iso:pattern>

		
	<iso:pattern name="OverheidsCode4DigitsCheck">
		<iso:rule context="//imro:overheidsCode">
		
			<iso:assert test="regexp:matches(.,'[0-9]{4}')" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD4: overheidsCode (huidige waarde "<iso:value-of select="text()"/>") moet uit 4 cijfers bestaan. 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	
	<!--
		STRI2008 paragraaf 5.6, bestandsnaamconventies
		
		Naamverlenging betekent dat de planIdn die na de prefix en voor de extensie 
		in de filenaam zit verlengd mag worden met "_xxxxx" waarbij xxxxx 
		willekeurige alfanumerieke karakters (punten en mintekens ook toegestaan) zijn. 
	 -->
	<iso:pattern name="Bestandsnaamconventies">

		<!-- 
			Abstracte regel bedoeld om te gebruiken als subroutine vanuit andere regels.
			Te definiëren variabelen met een iso:let instructie: 
			-	foutcode
			-	bestandsnaamMatchesRegexp
			-	identificatie
			-	gmlId
			
			Reden voor deze constructie is dat een aparte rule niet werkt wegens dat dezelfde
			context gebruikt wordt. Het alternatief is vier maal dezelfde code te dupliceren.
		 -->
		<iso:rule abstract="true" id="bestandsnaamBevatPlanId">
			
			<iso:let name="bestandsnaamNaPrefix" value="substring-after(.,'_')"/>
			<iso:let name="bestandsnaamNaPrefixBegintMetPlanId" value="starts-with($bestandsnaamNaPrefix, $detectedPlanId)"/>
			
			<!-- 
				Als er meerdere plangebieden zijn (ofwel: meer dan 1 gedetecteerde planId)
				dan kan er geen test worden uitgevoerd die de aanwezigheid van de planId
				in de bestandsnaam detecteert. In dat geval wordt deze test overgeslagen. 
				Ook als de bestandsnaam niet aan de reguliere expressie voor bestandsnamen 
				voldoet wordt deze test overgeslagen. 
				
				Gebruik wordt gemaakt van booleanse expressie: !A + AB = !A + B
			 -->
			<iso:assert test="not(count($detectedPlanId)=1 and $bestandsnaamMatchesRegexp) 
													or $bestandsnaamNaPrefixBegintMetPlanId" diagnostics="gmlIdLookup identificatieLookup">
Foutcode <iso:value-of select="$foutcode"/>: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet voldoet aan de bestandsnaamconventies van IMRO2008 en STRI2008. 
De planId (<iso:value-of select="$detectedPlanId"/>) volgt niet onmiddelijk na de prefix. 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

		</iso:rule>


		<iso:rule context="//imro:verwijzingNaarTekst">
			<!-- Toegestane extensies voor verwijzingNaarTekst: html,xhtml,htm,pdf
				Toegestane prefixen:
					Bestemmingsplan:
							t_		toelichting
							tb_		bijlage bij toelichting
							r_		regels
							rb_		bijlage bij regels
					
					Structuurvisie:
							d_		beleidsdocument
							db_		beleidsdocument bijlage 
							b_		beleidtekst 
							t_		toelichting
							
					Gebiedsbesluit:
							d_		besluitdocument
							db_		bijlage bij besluitdocument
							r_		regels
							rb_		bijlage bij regels
							t_		toelichting
							tb_		bijlage bij toelichting
							b_		beleidstekst
							bb_		bijlage bij beleidstekst
					
				Verlenging toegestaan:	ja, behalve bij besluitdocument
					
			 -->
			<iso:let name="bestandsprefixen0" value="'(r|rb|t|tb|db|b|bb|d)_'"/>	<!-- Toepasbaar voor Structuurvisies -->
			<iso:let name="bestandsprefixen1" value="'(r|rb|t|tb|db|b|bb)_'"/>		<!-- Toepasbaar voor alle andere plannen -->
			<iso:let name="bestandsprefixen2" value="'(d)_'"/>						<!-- Toepasbaar voor alle andere plannen -->
			<iso:let name="bestandsextensies" value="'\.(html|htm|xhtml|pdf)'"/>

			<iso:let name="bestandsnaamconventies0" value="concat($bestandsprefixen0,$idncheck,$naamverlenging,$bestandsextensies,$suffix)"/>

			<!-- bestandsnamen voor structuurvisies moeten aan reguliere expressie van bestandsnamenconventie voldoen. 
				Voor structuurvisies mag een besluitdocument een naamverlenging hebben.
			 -->
			<iso:let name="bestandsnaamMatchesRegexp0" value="regexp:matches(text(),$bestandsnaamconventies0)"/>

			<iso:let name="bestandsnaamconventies1" value="concat($bestandsprefixen1,$idncheck,$naamverlenging,$bestandsextensies,$suffix)"/>
			<iso:let name="bestandsnaamconventies2" value="concat($bestandsprefixen2,$idncheck,$bestandsextensies,$suffix)"/>
			<iso:let name="bestandsnaamconventies" value="concat('(',$bestandsnaamconventies1,'|',$bestandsnaamconventies2,')')"/>
		
			<!-- bestandsnamen voor overige plannen moeten aan reguliere expressie van bestandsnamenconventie voldoen.
				Voor besluitdocumenten mag een besluitdocument geen naamverlenging hebben. 
			 -->
			<iso:let name="bestandsnaamMatchesRegexp" value="regexp:matches(text(),$bestandsnaamconventies)"/>
	
			<!-- Test bestandsnaamconventies voor alle plantypen behalve structuurvisies -->			 
			<iso:assert test="$bestandsnaamMatchesRegexp or $isStructuurvisie" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5A: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2008 voldoet 
(aan de reguliere expressie hiervoor. Prefixen: d_ / r_ / rb_ / t_ / tb_ / db_ / b_ / bb_ , valide PlanId, 
eventueel underscore en naamverlenging, extensie: .html / .htm / .xhtml / .pdf . 
Bij een besluitdocumenten (d_) mag er geen underscore met verlenging achter de planId voorkomen). 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

			<!-- Test bestandsnaamconventies voor alleen structuurvisies -->			 
			<iso:assert test="not($isStructuurvisie) or $bestandsnaamMatchesRegexp0" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5A: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2008 voldoet 
(aan de reguliere expressie hiervoor. Prefixen: d_ / r_ / rb_ / t_ / tb_ / db_ / b_ / bb_ , valide PlanId, 
eventueel underscore en naamverlenging, extensie: .html / .htm / .xhtml / .pdf .  
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>


			<!-- Roep regel subroutine aan met foutcode AD5A -->
			<iso:let name="foutcode" value="'AD5A'"/>
			<iso:extends rule="bestandsnaamBevatPlanId"/>
			
			<!--
				Toegestane prefix:		Waardes van typeTekst:
				
				b_						beleid gemandateerd aan GS
										beleid
										beleidstekst
										document

				d_						besluitdocument
										besluittekst
										
				r_						regel met voorbereidingsbescherming
										regel zonder voorbereidingsbescherming
										regels
										voorschrift/regel
										voorschriften/regels
				 
				t_						toelichting

				bb_						bijlage
										bijlage bij beleidstekst
				
				db_						bijlage bij besluitdocument
										bijlage bij besluittekst
										
				rb_						bijlage bij regel met voorbereidingsbescherming
										bijlage bij regel zonder voorbereidingsbescherming
										bijlage bij regels
										bijlage bij voorschriften/regels
				
				tb_						bijlage bij toelichting
				
			 -->

 			<iso:assert test="not($bestandsnaamMatchesRegexp and $isBestemmingsplan) 
 								or 
 								regexp:matches(text(),concat(
 									'(r_.*(\.htm|\.html|\.xhtml)|(rb_|t_|tb_).*(\.pdf|\.htm|\.html|\.xhtml))',
 									$suffix))" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5E: <iso:value-of select="name()"/> bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2008 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2008. 
Raadpleeg STRI2008 voor de juiste prefixen en extensies bij het genoemde plantype.
			</iso:assert>

 			<iso:assert test="not($bestandsnaamMatchesRegexp and $isGebiedsgerichtBesluit) 
 								or 
 								regexp:matches(text(),concat(
 									'(r_.*(\.htm|\.html|\.xhtml)|(d_|db_|b_|bb_|rb_|t_|tb_).*(\.pdf|\.htm|\.html|\.xhtml))',
 									$suffix))" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5E: <iso:value-of select="name()"/> bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2008 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2008. 
Raadpleeg STRI2008 voor de juiste prefixen en extensies bij het genoemde plantype.
			</iso:assert>

 			<iso:assert test="not($bestandsnaamMatchesRegexp and $isStructuurvisie) 
 								or 
 								regexp:matches(text(),concat(
 									'(d_|db_|b_).*(\.pdf|\.htm|\.html|\.xhtml)',
 									$suffix))" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5E: <iso:value-of select="name()"/> bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2008 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2008. 
Raadpleeg STRI2008 voor de juiste prefixen en extensies bij het genoemde plantype.
			</iso:assert>

 			<iso:assert test="not($bestandsnaamMatchesRegexp and $isProvincialeVerordening) 
 								or 
 								regexp:matches(text(),concat(
 									'(r_.*(\.htm|\.html|\.xhtml)|(d_|db_|rb_|t_|tb_).*(\.pdf|\.htm|\.html|\.xhtml))',
 									$suffix))" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5E: <iso:value-of select="name()"/> bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
die niet voldoet aan de bestandsnaamconventies van STRI2008 wegens dat de prefix of extensie niet past
bij het plantype (huidige waarde "<iso:value-of select="$detectedPlanType"/>") volgens STRI2008. 
Raadpleeg STRI2008 voor de juiste prefixen en extensies bij het genoemde plantype.
			</iso:assert>

			<!-- Toegestane extensies voor verwijzingNaarTekst: html,xhtml,htm,pdf
				Toegestane prefixen:
					Bestemmingsplan:	typeTekst:
							t_		toelichting
							tb_		bijlage bij toelichting
							r_		regels
							rb_		bijlage bij regels
			-->
			
			<iso:let name="bestemmingsplangebied" value="ancestor::imro:Bestemmingsplangebied"/>
			<iso:let name="identificatie" value="$bestemmingsplangebied/imro:identificatie"/>
			<iso:let name="typeTekst" value="../imro:typeTekst"/>

			<iso:let name="PrefixIsT_" value="starts-with(text(),'t_')"/>
			<iso:let name="PrefixIsTB_" value="starts-with(text(),'tb_')"/>
			<iso:let name="PrefixIsR_" value="starts-with(text(),'r_')"/>
			<iso:let name="PrefixIsRB_" value="starts-with(text(),'rb_')"/>
			
			<iso:let name="tekstIsToelichting" value="$typeTekst='toelichting'"/>
			<iso:let name="tekstIsToelichtingBijlage" value="$typeTekst='bijlage bij toelichting'"/>
			<iso:let name="tekstIsRegels" value="$typeTekst='regels'"/>
			<iso:let name="tekstIsRegelsBijlage" value="$typeTekst='bijlage bij regels'"/>
			
			<iso:assert test="not($bestemmingsplangebied) or 
						not($PrefixIsT_ or $PrefixIsTB_ or $PrefixIsR_ or $PrefixIsT_ or
							$tekstIsToelichting or $tekstIsToelichtingBijlage or 
							$tekstIsRegels or tekstIsRegelsBijlage) or
							($PrefixIsT_ and $tekstIsToelichting) or
							($PrefixIsTB_ and $tekstIsToelichtingBijlage) or
							($PrefixIsR_ and $tekstIsRegels) or
							($PrefixIsRB_ and $tekstIsRegelsBijlage)" diagnostics="identificatie warning">

Foutcode AD5F: <iso:value-of select="name()"/> bevat een bestandsnaam (huidige waarde "<iso:value-of select="text()"/>") 
waarvan de prefix niet overeenkomt met de bijbehorende typeTekst (huidige waarde: <iso:value-of select="$typeTekst"/>). 
Voor een bestemmingsplangebied (huidige identificatie: <iso:value-of select="$identificatie"/>) geldt dat de prefixen 
en typeTekst de volgende beperkingen kennen:
(typeTekst, prefix): 
(toelichting, t_), 
(bijlage bij toelichting, tb_), 
(regels, r_), 
(bijlage bij regels, rb_)
			</iso:assert>


		</iso:rule>

		
		<iso:rule context="//imro:verwijzingNaarIllustratie">
			<!-- Toegestane extensies voor verwijzingNaarIllustratie: jpeg,jpg,png,pdf
				Toegestane prefixen:
					Bestemmingsplan,Structuurvisie,Gebiedsbesluit:
						i_		illustratie

				Naamverlenging toegestaan:	ja
			 -->
			<iso:let name="bestandsprefixen" value="'i_'"/>
			<iso:let name="bestandsextensies" value="'\.(png|jpg|jpeg|pdf)'"/>
			<iso:let name="bestandsnaamconventies" value="concat($bestandsprefixen,$idncheck,$naamverlenging,$bestandsextensies)"/>
		
			<!-- bestandsnamen moeten aan reguliere expressie van bestandsnamenconventie voldoen.
			 -->
			<iso:let name="bestandsnaamMatchesRegexp" value="regexp:matches(text(),$bestandsnaamconventies)"/>
			 
			<iso:assert test="$bestandsnaamMatchesRegexp" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5B: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet aan de reguliere expressie van de bestandsnaamconventies voor illustraties van STRI2008 voldoet (prefix: i_ , valide PlanId, eventueel underscore en naamverlenging, extensies: .png, .jpg, .jpeg, .pdf). 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

			<!-- Roep regel subroutine aan met foutcode AD5B -->
			<iso:let name="foutcode" value="'AD5B'"/>
			<iso:extends rule="bestandsnaamBevatPlanId"/>

		</iso:rule>

		<iso:rule context="//imro:verwijzingNaarVaststellingsbesluit">
			<!-- Toegestane extensies voor verwijzingNaarVaststellingsbesluit: jpeg,png,pdf
				Toegestane prefixen:
					Bestemmingsplan,Structuurvisie,Gebiedsbesluit:
						vb_		vaststellingsbesluit

				Naamverlenging toegestaan:	nee
			 -->
			<iso:let name="bestandsprefixen" value="'vb_'"/>
			<iso:let name="bestandsextensies" value="'\.(html|xhtml|htm|pdf)'"/>
			<iso:let name="bestandsnaamconventies" value="concat($bestandsprefixen,$idncheck,$bestandsextensies,$suffix)"/>
		
			<!-- bestandsnamen moeten aan reguliere expressie van bestandsnamenconventie voldoen.
			 -->
			<iso:let name="bestandsnaamMatchesRegexp" value="regexp:matches(text(),$bestandsnaamconventies)"/>
			 
			<iso:assert test="$bestandsnaamMatchesRegexp" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5C: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet aan de de reguliere expressie van de bestandsnaamconventies voor vaststellingsbesluiten van STRI2008 voldoet (prefix: vb_ , valide PlanId, extensies: .html, .xhtml, .htm, .pdf). 
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

			<!-- Roep regel subroutine aan met foutcode AD5C -->
			<iso:let name="foutcode" value="'AD5C'"/>
			<iso:extends rule="bestandsnaamBevatPlanId"/>

		</iso:rule>

		<iso:rule context="//imro:verwijzingNaarObjectgerichteTekst">
			<!-- Toegestane extensies voor verwijzingNaarObjectgerichteTekst: xml
				Toegestane prefixen:
					Bestemmingsplan,Structuurvisie,Gebiedsbesluit:
						pt_		plantekst
						
				Naamverlenging toegestaan:	nee
			 -->
			<iso:let name="bestandsprefixen" value="'pt_'"/>
			<iso:let name="bestandsextensies" value="'\.xml'"/>
			<iso:let name="bestandsnaamconventies" value="concat($bestandsprefixen,$idncheck,$bestandsextensies,$suffix)"/>
		
			<!-- bestandsnamen moeten aan reguliere expressie van bestandsnamenconventie voldoen.
			 -->
			<iso:let name="bestandsnaamMatchesRegexp" value="regexp:matches(text(),$bestandsnaamconventies)"/>
			 
			<iso:assert test="$bestandsnaamMatchesRegexp" diagnostics="gmlIdLookup identificatieLookup">
Foutcode AD5D: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam 
die niet aan de de reguliere expressie van de bestandsnaamconventies voor planteksten van STRI2008 voldoet (prefix: pt_ , valide PlanId, extensie: .xml, optionele locatie: #locatie-aanduiding ).
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>.
			</iso:assert>

			<!-- Roep regel subroutine aan met foutcode AD5D -->
			<iso:let name="foutcode" value="'AD5D'"/>
			<iso:extends rule="bestandsnaamBevatPlanId"/>
		</iso:rule>
		
	</iso:pattern>

	<iso:pattern name="checkCoordinatenFormat">
		<!-- Coordinaten mogen maximaal 3 decimalen bevatten.
			Tevens moeten coördinaten in even aantal voorkomen 
		-->


		<iso:rule context="//gml:posList | //gml:pos | //gml:lowerCorner | //gml:upperCorner">
			<!-- Convert all white space characters into single space characters -->
			
			<iso:let name="coordinates" value="normalize-space(text())"/>
			<iso:let name="coords" value="substring($coordinates,0,66)"/>
			<iso:let name="identificatie" value="ancestor::*[imro:identificatie][1]/imro:identificatie"/>
			
			<!-- Try to tokenize the coordinates string and match every coordinate to an expression -->
  			<iso:assert test="regexp:matchesAfterTokenize($coordinates,$coordinaatFormat,$space)" diagnostics="coords gmlIdLookup identificatieLookup">
Foutcode AD6A: Coördinaten binnen <iso:value-of select="name()"/> moeten getallen zijn van maximaal 3 decimalen na de decimale komma, waarbij
meerdere exemplaren gescheiden zijn door lege ruimten. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>

			<iso:let name="aantal" value="regexp:tokenCount($coordinates,$space)"/>
			
			<iso:assert test="(2 * floor($aantal div 2) = $aantal) and ($aantal > 0)" diagnostics="coords gmlIdLookup identificatieLookup">
Foutcode AD6B: Coördinaten binnen <iso:value-of select="name()"/> komen niet in het juiste aantal voor. 
Verwacht wordt dat dit een even aantal coördinaten ( &gt; 0 ) is, geconstateerd aantal is <iso:value-of select="$aantal"/>. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>

		</iso:rule>
	</iso:pattern>
	
	<!-- 1 patch is toegestaan volgens het schema. Hierbinnen moet 1 polygonPatch afgedwongen worden. -->
	<iso:pattern name="Surface_num_patches_eq_1_Check">
		<iso:rule context="//imro:geometrie//gml:Surface">
			
			<iso:let name="numOfPolygonPatches" value="count(gml:patches/gml:PolygonPatch)"/>

			<iso:assert test="$numOfPolygonPatches = 1" diagnostics="gmlIdLookup2 identificatieLookup">
Foutcode AD7: Binnen een gml:surface element (gml:id="<iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/>") is 1 gml:patches element toegestaan en
daarin 1 gml:PolygonPatch element toegestaan (huidig aantal=<iso:value-of select="$numOfPolygonPatches"/>)
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>
	
	
	<!--
	Waarschuwing: Gebruik NOOIT de namen AD8 en AD9 voor nieuwe validaties. 
	Deze zijn in het verleden verwijderd en zorgen voor verwarring indien ze weer terugkomen. 
	 -->
	
	
	
	<!-- Validatieregel controle naam bestemming (Mantis melding 3933) -->
	<iso:pattern name="Naam_bestemmingsvlak_bevat_hoofdgroep_check">
	
		<iso:rule context="//imro:Enkelbestemming | //imro:Dubbelbestemming">
			
			<iso:let name="hoofdgroep" value="imro:bestemmingshoofdgroep"/>
			<iso:let name="hoofdgroepIsOverig" value="$hoofdgroep = 'overig'"/>
			<iso:let name="naam" value="imro:naam"/>
			<iso:let name="identificatie" value="imro:identificatie"/>
			
			<iso:let name="naamLowercase" value="translate($naam,$upperCase,$lowerCase)"/>
			<iso:let name="naamAfterHoofdgroep" value="substring($naam, string-length($hoofdgroep)+1)"/>
			
			<iso:let name="naamEndRegexp" value="'\s*-\s*.*'"/>
			
			<iso:assert test="$hoofdgroepIsOverig or 
							($naamLowercase = $hoofdgroep) or
							(starts-with($naamLowercase, $hoofdgroep) and regexp:matches($naamAfterHoofdgroep,$naamEndRegexp) )" diagnostics="identificatie warning">
Foutcode AD14: De naam van de <iso:value-of select="name()"/> '<iso:value-of select="$identificatie"/>' (huidige waarde: '<iso:value-of select="$naam"/>') voldoet niet aan SVBP2008 paragraaf 2.2 
waarin staat dat deze begint met de hoofdgroep (huidige waarde ongelijk aan 'overige': '<iso:value-of select="$hoofdgroep"/>') 
eventueel gevolgd door een koppelteken ('-') met daarachter de rest van de naam.
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	
	
	<!-- De onderstaande check is voor IMRO2008 versie 1.1 van toepassing -->
	<iso:pattern name="CheckGebiedsaanduidinggroepNaamMatch">
		
		<iso:rule context="//imro:Gebiedsaanduiding">
		
			<iso:let name="gebiedsaanduidinggroep" value="imro:gebiedsaanduidinggroep" />
			<iso:let name="gebiedsaanduidingnaam" value="imro:naam" />
			
			<iso:assert test="(starts-with($gebiedsaanduidingnaam,'other:') and ($gebiedsaanduidinggroep='overig'))
								or
								(starts-with($gebiedsaanduidingnaam,$gebiedsaanduidinggroep))" diagnostics="gmlId identificatieLookup">
Foutcode AD10: In gebiedsaanduiding '<iso:value-of select="@gml:id"/>' komt categorie imro:gebiedsaanduidinggroep (huidige waarde='<iso:value-of select="$gebiedsaanduidinggroep"/>') 
niet overeen met imro:naam (huidige waarde='<iso:value-of select="$gebiedsaanduidingnaam"/>') volgens SVBP2008 van IMRO2008 versie 1.1
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<!-- Heterogene Multigeometrieën worden uitgesloten omdat deze niet ondersteund worden. -->
	<iso:pattern name="MultiGeometry">
	
		<iso:rule context="//imro:geometrie/gml:MultiGeometry">
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
								diagnostics="gmlIdLookup2 identificatieLookup">
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
			
			<iso:let name="isVanaf2008_7_1" value="($year &gt; 2008) or
													(($year = 2008) and ($month &gt;= 7))"/>

			<!--
			5.	Een IMRO2008-gecodeerd plan van voor 1/7/2008 (met welke status dan ook) is bizar.
				Let wel: het gaat niet om de creatiedatum. 
			 -->
			<iso:assert test="$isVanaf2008_7_1" diagnostics="warning">
Foutcode AD12: Dit plan is gecodeerd met RO Standaarden 2008 (IMRO2008)voor een plan voor de nieuwe Wro. 
Het gebruik van RO Standaarden 2008 is dan foutief. Gebruik IMRO2006 of Plancontour en PDF.
			</iso:assert>
		</iso:rule>
	</iso:pattern>	
	
	
	
	<iso:pattern name="check_for_geometrical_elements_present_when_required">
		<!--
			Het is de bedoeling dat er geen lege geometrische elementen zullen zijn.
			Het is ook de bedoeling dat geometrische elementen coördinaten bevatten.
			Het XML schema van gml4nl staat helaas bij sommige typen toe dat er helemaal niets 
			in zo'n element zit. De elementen waar dit het geval is zijn: 
			gml:MultiPoint, gml:MultiCurve, gml:MultiSurface, gml:MultiGeometry,
			gml:geometryMembers, gml:segments, gml:polygonPatch.
			
			gml:patches wordt getest door check AD7. Zou hier slechts een extra foutmelding geven.
		 -->
		<iso:rule context="gml:MultiPoint |
							gml:MultiCurve |
							gml:MultiSurface |
							gml:MultiGeometry |
							gml:geometryMembers |
							gml:segments |
							gml:PolygonPatch">

			<!-- Geometrical child elements need to be present here. -->
			<iso:assert test="(.//gml:*)" diagnostics="gmlIdLookup2 identificatieLookup">
Foutcode AD13: <iso:name/> dient een geometrische inhoud te hebben.
Binnen het element <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> (local gmlId: <iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/>).
			</iso:assert>
		</iso:rule>

	</iso:pattern>


	
	
	<iso:pattern name="VVP_Checks">
	
		<iso:rule context="imro:thema[$isVVP and key('VVPSpecialeThemasKey',.)][last()]">

			<iso:let name="aantalKaartnummer1" value="count(key('VVPKaartNummersKey','1'))"/>

			<!--
				Controleer dat kaartnummer 1 minstens 1x gebruikt wordt indien 
				dit een vormvrij plan is en er speciale thema's gebruikt worden.
				
				Doe de checks voor valide themas voor check AD20. De context is hier namelijk 
				krapper gedefinieerd waardoor anders AD20 alles zou wegvangen.
			-->
			<iso:assert test="$aantalKaartnummer1 &gt;= 1">
Foutcode AD21A: Thema in vormvrij plan met kaartnummer 1 komt niet voor. Kaartnummer 1 moet minstens 1x voorkomen.
			</iso:assert>

			<iso:let name="aantalKaartnummer0" value="count(key('VVPKaartNummersKey','0'))"/>

			<!--
				Controle dat nummer 1 het minimale nummer is. 
			 -->
			<iso:assert test="$aantalKaartnummer0 = 0">
Foutcode AD21B: Thema in vormvrij plan met kaartnummer 0 mag niet voorkomen. Het minimale kaartnummer is 1.
			</iso:assert>
		
			<iso:extends rule="ChecksVoorVVPthemas"/>
		</iso:rule>

		<iso:rule context="imro:thema[$isVVP and key('VVPSpecialeThemasKey',.)]">
			<iso:extends rule="ChecksVoorVVPthemas"/>
		</iso:rule>


		<!--
				Controleer bij vormvrije plannen alle thema's.
				Als een thema begint met '#' of met 'other: #' dan is het een speciale VVP versie
				die een kaartbeeld aanduidt: #kaartnummer|kaartnaam|symboolcode
			 -->
		<iso:rule context="imro:thema[$isVVP and key('VVPSpecialeThemasPrefixedKey',.)]">

			<iso:let name="isValideThema" value="regexp:matches(text(),$VVPSpecialThemaRegexp)"/>
		
			<iso:assert test="$isValideThema" diagnostics="identificatieLookup">
Foutcode AD20: Thema (huidige waarde: "<iso:value-of select="text()"/>")in element met identificatie <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/> dient de speciale opmaak te hebben
volgens reguliere expressie: "<iso:value-of select="$VVPSpecialThemaRegexp"/>"
Geconstateerd is dat het thema met "#" of met "other: #" begint, dus wordt een speciale codering verwacht.
			</iso:assert>
		</iso:rule>


		<iso:rule abstract="true" id="ChecksVoorVVPthemas">
			
			<iso:let name="symboolCode" value="substring-after(substring-after(text(),'|'),'|')"/>
			<iso:let name="symboolCodeLetters" value="regexp:tokenize($symboolCode,'\d+')"/>
			<iso:let name="geometrieType" value="translate($symboolCodeLetters,'SLPAE','SLP')"/>

			<iso:assert test="not($symboolCode) or 
							contains($VVPSymboolcodePrefixes,$symboolCodeLetters)" diagnostics="identificatieLookup warning">
Foutcode AD22: Thema (huidige waarde: "<iso:value-of select="text()"/>") in element met identificatie <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>
bevat een symboolcode <iso:value-of select="$symboolCode"/> die geen valide letterprefix heeft.
Toegestaan zijn de prefixes: "<iso:value-of select="$VVPSymboolcodePrefixes"/>"
			</iso:assert>

			<iso:let name="kaartnummer" value="number(substring-before(substring-after(text(),'#'),'|'))"/>
			<iso:let name="kaartnaam" value="substring-before(substring-after(text(),'|'),'|')"/>
			
			<iso:let name="themasMetAndereKaartnaamBijNummer" value="key('VVPKaartNummersKey',$kaartnummer)[not(substring-before(substring-after(text(),'|'),'|') = $kaartnaam)]"/>

			<!--
				XPath-2.0 expressie string-join(..) is kunstmatig gerealiseerd net als matches(..)
				wegens dat deze expressie niet bestaat in XSLT-1.0.
				De naam moest hiervoor iets gewijzigd worden: stringjoin in plaats van string-join.
			 -->
			<iso:assert test="count($themasMetAndereKaartnaamBijNummer)=0" diagnostics="identificatieLookup">
Foutcode AD23: Thema (huidige waarde: "<iso:value-of select="text()"/>") in element met identificatie <iso:value-of select="ancestor::*[imro:identificatie][1]/imro:identificatie"/>
bevat een kaartnummer-kaartnaam combinatie die niet uniek is wegens dat er reeds andere combinaties voorkomen (<iso:value-of select="regexp:string-join($themasMetAndereKaartnaamBijNummer,' , ')"/>) bestaan.
Bij een kaartnummer hoort slechts 1 kaartnaam.
			</iso:assert>

		</iso:rule>
 
 		<!-- Check de geometrie van de begrenzingen met de thema's 
 			waarin symboolcodes voor deze geometrieën kunnen zitten.
 			De bedoeling is dat voor ieder geometrietype van een begrenzing er een 
 			thema is waar een bijpassende symboolcode in zit. 
 			In het geval van meerdere kaarten zijn er ook meerdere thema's 
 			voor deze symboolcode.
 		-->
		<iso:rule context="imro:begrenzing[$isVVP and key('VVPSpecialeThemasMetValideSymboolCodeKey',../imro:thema) and @xlink:href]">

			<iso:let name="gmlId" value="parent::imro:*/@gml:id"/>
			<iso:let name="objectId" value="substring-after(@xlink:href,'#')"/>

			<iso:let name="begrenzingIsSurface" value="boolean(key('vvpBegrenzingPerGeometrieTypeSurface',$objectId))"/>
			<iso:let name="begrenzingIsLine" value="boolean(key('vvpBegrenzingPerGeometrieTypeLine',$objectId))"/>
			<iso:let name="begrenzingIsPoint" value="boolean(key('vvpBegrenzingPerGeometrieTypePoint',$objectId))"/>
			
			
			<iso:let name="themasVoorGeometrieSurface" 
					value="key('VVPThemasPerGeometrieTypeSurfaceByGmlId',$gmlId)"/>

			<iso:let name="themasVoorGeometrieLine" 
					value="key('VVPThemasPerGeometrieTypeLineByGmlId',$gmlId)"/>

			<iso:let name="themasVoorGeometriePoint" 
					value="key('VVPThemasPerGeometrieTypePointByGmlId',$gmlId)"/>

			<iso:let name="geometrieKomtOvereenMetThema" 
					value="($begrenzingIsSurface and $themasVoorGeometrieSurface) or
							($begrenzingIsLine and $themasVoorGeometrieLine) or
							($begrenzingIsPoint and $themasVoorGeometriePoint)" />

			<!-- Test geometrie. Er dient minstens 1 thema te zijn met de bijbehorende symboolcode -->
			<iso:assert test="$geometrieKomtOvereenMetThema" diagnostics="identificatieLookup gmlIdLookup">
Foutcode AD25: Element <iso:value-of select="name(parent::imro:*)"/> (gml:id <iso:value-of select="$gmlId"/>)
bevat een begrenzing (xlink:href="<iso:value-of select="$objectId"/>") die naar een object met een geometrie verwijst die niet 
voorkomt in de symboolcodes van de aanwezige themas (huidige waarde: "<iso:value-of select="regexp:string-join(../imro:thema[key('VVPSpecialeThemasMetValideSymboolCodeKey',.)],' , ')"/>").
Geometrie waarnaar verwezen wordt bevat: Surfaces: <iso:value-of select="$begrenzingIsSurface"/>, Lines: <iso:value-of select="$begrenzingIsLine"/>, Points: <iso:value-of select="$begrenzingIsPoint"/>.
			</iso:assert>
			
		</iso:rule>
		
			
	</iso:pattern>
	
	<iso:pattern name="Imro2008NietJuridischPlanMoetVanVoor1Juli2013Zijn">
		<iso:rule context="//*[imro:typePlan]/imro:planstatusInfo">

			<iso:let name="planstatus" value=".//*[starts-with(name(), 'imro:PlanstatusEnDatum_')]/imro:planstatus/text()"/>
			<iso:let name="datum" value=".//*[starts-with(name(), 'imro:PlanstatusEnDatum_')]/imro:datum/text()"/>

			<iso:let name="year" value="substring($datum,1,4)"/>
			<iso:let name="month" value="substring($datum,6,2)"/>

			<iso:let name="isAfter2013" value="$year &gt; 2012"/>
			<iso:let name="isAfterJuly" value="$month &gt; 6"/>
			<iso:let name="isAfter2014" value="$year &gt; 2013"/>

			<!-- Eigenlijk is dit niet nodig aangezien dit validatie-schema enkel uitgevoerd kan worden op IMRO2008 -->
			<iso:let name="verwijzingNorm" value="../imro:verwijzingNorm"/>
			<iso:let name="isVerwijzingNormEqualIMRO2008" value="$verwijzingNorm = 'IMRO2008'"/>

			<iso:let name="isAfterJuly2013" value="(($isAfter2013 and $isAfterJuly) or $isAfter2014)"/>

			<iso:let name="isRelevantPlanstatus"
				value="$planstatus = 'concept'
				or $planstatus = 'ontwerp'
				or  $planstatus = 'voorontwerp'
				or $planstatus = 'geconsolideerde versie'
			"/>

			<iso:assert test="not($isAfterJuly2013 and $isRelevantPlanstatus and $isVerwijzingNormEqualIMRO2008)" diagnostics="Error">
			Foutcode AD26A: Het plan is gecodeerd conform IMRO2008, maar dit is voor de in het plan opgenomen status en datum niet meer de geldende norm.
			</iso:assert>

        </iso:rule>
	</iso:pattern>
	
	
	<!--
		  _                _             ____        _______       __  __       _ _             _              _     _  
		 | |              (_)           / __ \      |__   __|/\   |  \/  |     (_) |           | |            (_)   | | 
		 | |__   ___  __ _ _ _ __      | |  | |_      _| |  /  \  | \  / |_   _ _| |_ __ _  ___| |__  _ __ ___ _  __| | 
		 | '_ \ / _ \/ _` | | '_ \     | |  | \ \ /\ / / | / /\ \ | |\/| | | | | | __/ _` |/ _ \ '_ \| '__/ _ \ |/ _` | 
		 | |_) |  __/ (_| | | | | |    | |__| |\ V  V /| |/ ____ \| |  | | |_| | | || (_| |  __/ |_) | | |  __/ | (_| | 
		 |_.__/ \___|\__, |_|_| |_|     \____/  \_/\_/ |_/_/    \_\_|  |_|\__,_|_|\__\__, |\___|_.__/|_|  \___|_|\__,_| 
		              __/ |                                                           __/ |                             
		             |___/                                                           |___/                              
	-->
	
	<!-- BEGIN Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
	<iso:let name="identificatie" value="@gml:id"/>
	<iso:pattern id="OwTAMuitgebreid">       
		
		<!-- Blokkeren PROJECTBESLUIT en TIJDELIJK ONTHEFFING BUITENPLANS-->
		<!-- Na 2023-07-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'-->
		<iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'projectbesluit' or //imro:typePlan = 'tijdelijke ontheffing buitenplans']">
			<iso:assert
				test="               
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum_XGB/imro:datum, '-', '')) &lt; 20230701
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'projectbesluit' of 'tijdelijke ontheffing buitenplans' en datum is groter dan of gelijk aan 2023-07-01, 
				dan mag typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'.
			</iso:assert>
		</iso:rule>        
		
	</iso:pattern>
	
	<!-- 
		       _           _            ____        _______       __  __       _ _             _              _     _  
		      (_)         | |          / __ \      |__   __|/\   |  \/  |     (_) |           | |            (_)   | | 
		   ___ _ _ __   __| | ___     | |  | |_      _| |  /  \  | \  / |_   _ _| |_ __ _  ___| |__  _ __ ___ _  __| | 
		  / _ \ | '_ \ / _` |/ _ \    | |  | \ \ /\ / / | / /\ \ | |\/| | | | | | __/ _` |/ _ \ '_ \| '__/ _ \ |/ _` | 
		 |  __/ | | | | (_| |  __/    | |__| |\ V  V /| |/ ____ \| |  | | |_| | | || (_| |  __/ |_) | | |  __/ | (_| | 
		  \___|_|_| |_|\__,_|\___|     \____/  \_/\_/ |_/_/    \_\_|  |_|\__,_|_|\__\__, |\___|_.__/|_|  \___|_|\__,_| 
		                                                                             __/ |                             
		                                                                            |___/                                                    
	-->
	
	

	
	<iso:diagnostics>
		<iso:diagnostic id="gmlId"><iso:value-of select="@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdLookup"><iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/></iso:diagnostic>
		<iso:diagnostic id="gmlIdLookup2"><iso:value-of select="ancestor-or-self::*[@gml:id][1]/@gml:id"/></iso:diagnostic>
		
		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup"><iso:value-of select="ancestor-or-self::*[imro:identificatie][1]/imro:identificatie"/></iso:diagnostic>

		<iso:diagnostic id="coords"><iso:value-of select="$coords"/></iso:diagnostic>
		<iso:diagnostic id="coordsLookup"><iso:value-of select="substring(normalize-space(text()),0,66)"/></iso:diagnostic>
		
		<iso:diagnostic id="warning"></iso:diagnostic>
	</iso:diagnostics>
	
	
</iso:schema>
