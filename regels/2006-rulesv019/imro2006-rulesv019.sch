<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: IMRO2006-rulesv019.sch
 *
 * (C) Bentley Systems Netherlands BV, 2005-2006
 * aangepast door Geonovum (Paul Janssen)
 *
 *
 * Info:
 * Schematron Validation Document for IMRO 2006
 * See http://www.ravi.nl/ for more information
 *
 * History:
 * 12-12-2005  RvS    Initial version
 * 05-01-2006  FS     Adjustments (incorporation rule 05 and cleanup)
 * 29-06-2006  PJA    NEN3610 namespace changed to imro namspace. Content of
 *                    File S05_RelatieIDN incorporated.
 *                    let: name for declearing variables omitted because is not
 *                    a valid statement yet.
 * 03-07-2006  FS     Added namespace prefix declaration for xlink
 * 06-11-2006  PJA    objectidentificatie bij fout melding toegevoegd
 * 19-12-2006         Remark Xlinks validations are not correct. Syntax always validates negative.
 * 05-02-2006         Update to ISO-Schematron. Let name is valid now. Xlink rules are valid now.
 * 05-03-2006         sch: vervangen door iso: ; voorloop spaties weggehaald bij rapportage teksten.
 *                    Bij de xslt rapportage is het dan beter uitgelijnd.
 * 24-10-2007         Spelfout bij relatePlanobject (opmerking Paul)
 * 18-12-2007         Rule 43, 46 en 50 zijn uitgeschakeld (verkorte codering provinciaal plan)
 * 20-03-2008         Rule 61 toegevoegd. Speciaal voor geometrie aanpassing voor Nota Ruimte
 * 14-05-2008 Logica  Rule 27a en 27b aangepast: symboolInfo i.p.v. SymboolInfo volgens IMRO2006 schema
 * 14-08-2008 PJA     Rule 18b aangepast. Verwijzing mag alleen naar aanduiding van type Bouwvlak of  
 *                    Gebiedsaanduiding (PRBP2006). Rule 23: Fout rapportage aangepast (Foutcode 23a 
 *                    en Foutcode 23b)
 * 05-09-2008 PJA     Rule A43 toegevoegd om te controleren of bij provinciale plannen de functieInfo ingevuld is indien 
 *                    de niet verkorte codering toegepast is.
 * 06-04-2009 RD      Diagnostics toegevoegd t.b.v. localisatie fouten voor SOAP validator.
 * 08-04-2009 PJA 	  Rule 18b aangepast. Er was een fout in de schematron syntax. Context Figuur was afwezig.
 *                    Hierdoor was er geen controle op de aanduiding verwijzingen van object Figuur.
 * 16-06-2009 RD      Diagnostics veroorzaken performance problemen. Herdefinities noodzakelijk en minder gebruik locatievariabelen.
 * 10-09-2009 RD      Gebruik van de key functie voor indexing verbetert de performance dramatisch. 
 *                    Iedere regel die referenties checkt is aangepast.
 ******************************************************************************/

Opmerkingen / hints:
toevoegen ID in rapportage (als context = geldig planobject): <iso:value-of select="nen3610:identificatie"/>

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xml:lang="en">  <!-- ISO Schematron 1.6 namespace -->
 <!-- <sch:schema xmlns:sch="http://www.ascc.net/xml/schematron"> Schematron namespace -->

	<!-- <iso:title>Schematron validaties voor IMRO2006</iso:title>-->
	<!-- Titel weggehaald om geen output te hebben als er geen fout is -->
	<!-- De validator concludeert daaruit dat er geen fout en dus een valide bestand is -->
	<!-- <iso:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/> -->
	<iso:ns prefix="gml" uri="http://www.opengis.net/gml"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.ravi.nl/imro2006"/>
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

	<!-- Indexering -->
	<xsl:key name="Planobject_index" match="//imro:Planobject" use="@gml:id"/>
	<xsl:key name="ProvinciaalComplex_index" match="//imro:ProvinciaalComplex" use="@gml:id"/>
	<xsl:key name="Bestemmingsplangebied_index" match="//imro:Bestemmingsplangebied" use="@gml:id"/>
	<xsl:key name="Enkelbestemming_index" match="//imro:Enkelbestemming" use="@gml:id"/>
	<xsl:key name="Dubbelbestemming_index" match="//imro:Dubbelbestemming" use="@gml:id"/>
	<xsl:key name="Bouwvlak_index" match="//imro:Bouwvlak" use="@gml:id"/>
	<xsl:key name="Gebiedsaanduiding_index" match="//imro:Gebiedsaanduiding" use="@gml:id"/>
	<xsl:key name="Besluitgebied_index" match="//imro:Besluitgebied" use="@gml:id"/>
	<xsl:key name="StructuurvisieGebied_index" match="//imro:StructuurvisieGebied" use="@gml:id"/>
	<xsl:key name="GemeentelijkGebied_index" match="//imro:GemeentelijkGebied" use="@gml:id"/>
	<xsl:key name="GemeentelijkVerbinding_index" match="//imro:GemeentelijkVerbinding" use="@gml:id"/>
	<xsl:key name="GemeentelijkComplex_index" match="//imro:GemeentelijkComplex" use="@gml:id"/>
	<xsl:key name="ProvinciaalPlangebied_index" match="//imro:ProvinciaalPlangebied" use="@gml:id"/>
	<xsl:key name="ProvinciaalComplex_index" match="//imro:ProvinciaalComplex" use="@gml:id"/>
	
	<xsl:key name="NationaalGebied_index" match="//imro:NationaalGebied" use="@gml:id"/>
	<xsl:key name="NationaalPlangebied_index" match="//imro:NationaalPlangebied" use="@gml:id"/>
	<xsl:key name="NationaalVerbinding_index" match="//imro:NationaalVerbinding" use="@gml:id"/>
	<xsl:key name="NationaalComplex_index" match="//imro:NationaalComplex" use="@gml:id"/>
	<xsl:key name="ProvinciaalGebied_index" match="//imro:ProvinciaalGebied" use="@gml:id"/>
	<xsl:key name="ProvinciaalVerbinding_index" match="//imro:ProvinciaalVerbinding" use="@gml:id"/>




	<iso:pattern name="Max1Plangebied">
		<!-- Rule 01, 29: (Context IMRO2006::Plangebied)
			inv PlangebiedMax1:
			Plangebied::allInstances() -> size() = 1
		-->
		<iso:rule context="/*">
			<iso:assert test="count(.//*[imro:typePlan]) = 1">
Foutcode 1: Er is slechts 1 plangebied toegestaan (aantal = <iso:value-of select="count(.//*[imro:typePlan])"/>)
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="StartNLIMRO">
		<!-- Rule 02, 12a, 31a, 38, 51: (Context IMRO2006::Plangebied)
			inv PlangebiedIdnFormat:
			self.identificatie.substring(1, 8) = 'NL.IMRO.'
		-->
		<iso:rule context="imro:Bestemmingsplangebied|imro:StructuurvisieGebied|imro:ProvinciaalPlangebied|imro:NationaalPlangebied">
		
			<iso:let name="identificatie" value="imro:identificatie"/>
		
			<iso:assert test="substring($identificatie,1,8)='NL.IMRO.'" diagnostics="identificatie">
(Planobject id = <iso:value-of select="$identificatie"/>)
Foutcode 2: Plangebied-identificatie dient met 'NL.IMRO.' te beginnen
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="PlanIdnMax32">
		<!-- Rule 03: (Context IMRO2006::Plangebied)
			inv PlangebiedIdnMaxChar:
			self.identificatie.size() < 33
		-->
		<iso:rule context="imro:StructuurvisieGebied|imro:ProvinciaalPlangebied|imro:NationaalPlangebied">

			<iso:let name="identificatie" value="imro:identificatie"/>

			<iso:assert test="string-length($identificatie) &lt; 33" diagnostics="identificatie">
Foutcode 3: De planidentificatie bevat teveel karakters (maximum is 32, bevat <iso:value-of select="string-length($identificatie)"/>)
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="PlanIdnMax64">
		<!-- Rule 03b: (Context IMRO2006::Bestemmingsplangebied)
			inv PlangebiedIdnMaxChar:
			self.identificatie.size() < 65
		-->
		<iso:rule context="imro:Bestemmingsplangebied">

			<iso:let name="identificatie" value="imro:identificatie"/>
		
			<iso:assert test="string-length($identificatie) &lt; 65" diagnostics="identificatie">
Foutcode 3b: De planidentificatie bevat teveel karakters (maximum is 64, bevat <iso:value-of select="string-length($identificatie)"/>)
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="GeogNauwk">
		<!-- Rule 11, 40, 54 -->
		<iso:rule context="imro:GeografischeNauwkeurigheid">

			<iso:report test="imro:hardheidBegrenzing/text()='exact' and count(imro:geometrischeNauwkeurigheid)=0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="../../imro:identificatie"/>)
Foutcode 11: Geometrische nauwkeurigheid niet aanwezig terwijl hardheid begrenzing wel exact is.
			</iso:report>
			<iso:report test="imro:hardheidBegrenzing/text()!='exact' and count(imro:geometrischeNauwkeurigheid) &gt; 0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="../../imro:identificatie"/>)
Geometrische nauwkeurigheid aanwezig terwijl hardheid begrenzing niet exact is.
			</iso:report>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="CBSinIdn">
		<!-- Rule 12b, 31b: (Context IMRO2006::Bestemmingsplangebied)
			inv bestemmingsplangebiedIdnCBSCode:
			self.indentificatie.substring(9, 12) =
			self.gemeenteCode
		-->
		<iso:rule context="imro:Bestemmingsplangebied | imro:StructuurvisieGebied">

			<iso:assert test="substring(imro:identificatie,9,4)=imro:gemeenteCode" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 12b: CBS-code in planidentificatie is niet gelijk aan gemeentecode.
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="DatumsVoorlDef">
		<!-- Rule 14: (Context IMRO2006::Bestemmingsvlak)
			inv bestemmingsvlakTemp:
			not(self.begindatumDefinitief.notEmpty() and
			self.einddatumVoorlopig.notEmpty())
		-->
		<iso:rule context="imro:Enkelbestemming | imro:Dubbelbestemming">

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			<iso:assert test="not(imro:einddatumVoorlopig/text() and imro:begindatumDefinitief/text())" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 14: EinddatumVoorlopig en BegindatumDefinitief kunnen niet beide gevuld zijn.
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="NoPlanobjectAssoc">
		<!-- Rule 15: (Context IMRO2006::Bestemmingsvlak)
			inv bestemmingsvlakRelatieNiet: self.relatiePlanobject->isEmpty()
		-->
		<!-- Rule 16: (Context IMRO2006::Aanduiding)
			inv aanduidingRelatieNiet: self.relatiePlanobject->isEmpty()
		controleer iso:name-->
		<iso:rule context="imro:Enkelbestemming | imro:Dubbelbestemming | imro:Bouwvlak | imro:Lettertekenaanduiding | imro:Maatvoering | imro:Figuur | imro:Gebiedsaanduiding">

			<iso:assert test="count(imro:relatiePlanobject)=0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 16: relatiePlanobject kan niet ingevuld zijn.
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<!-- Rule 19 (Context IMRO2006::Lettertekenaanduiding): vervallen -->

	<iso:pattern name="Aanduiding_EqualGeometry">
		<!-- Rule 20: (Context IMRO2006::Bouwvlak)
			inv bouwvlakGeometrie:
			if self.eigenGeometrie->isEmpty()
				then self.geometrie=self.bestemmingsvlak.geometrie
				else self.geometrie=self.eigengeometrie
			endif
			and self.geometrie->size() = 1
		-->
		<!-- NOTE: Pas uit te werken als geometrie-vergelijkingen uitgevoerd kunnen worden met
			Schematron -->
		<!-- Rule 22: (Context IMRO2006::Lettertekenaanduiding)
			inv lettertekenaanduidingGeometrie:
			if self.eigenGeometrie->isEmpty()
				then if self.bestemmingsvlak->notEmpty()
					then self.geometrie=self.bestemmingsvlak.geometrie
					else self.geometrie=self.aanduiding.geometrie
				else self.geometrie=self.eigenGeometrie
			endif
			and self.geometrie->size() = 1
		-->
		<!-- NOTE: Pas uit te werken als geometrie-vergelijkingen uitgevoerd kunnen worden met
			Schematron -->
		<!-- Rule 24: (Context IMRO2006::Maatvoering)
			inv maatvoeringGeometrie:
			if self.eigenGeometrie->isEmpty()
				then if self.bestemmingsvlak->notEmpty()
					then self.geometrie=self.bestemmingsvlak.geometrie
					else self.geometrie=self.aanduiding.geometrie
				else self.geometrie=self.eigenGeometrie
			endif
			and self.geometrie->size() = 1
		-->
		<!-- NOTE: Pas uit te werken als geometrie-vergelijkingen uitgevoerd kunnen worden met
			Schematron -->
	</iso:pattern>

	<iso:pattern name="Relaties">
		<!-- Rule 23, 25: (Context IMRO2006::Lettertekenaaduiding | IMRO2006::Maatvoering)
			inv (lettertekenaanduidingHoortBij | maatvoeringHoortBij):
			self.bestemmingsvlak->isEmpty() or
			self.aanduiding->isEmpty
		-->
		<iso:rule context="imro:Lettertekenaanduiding | imro:Maatvoering">

			<iso:assert test="imro:bestemmingsvlak or imro:aanduiding" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 23a: Dit planobject dient een relatie te hebben met een bestemmingsvlak of aanduiding.
			</iso:assert>
			<iso:report test="imro:bestemmingsvlak and imro:aanduiding" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 23b: Dit planobject mag maar 1 relatie hebben met een bestemmingsvlak of aanduiding.
			</iso:report>
		</iso:rule>
	</iso:pattern>

<!-- <iso:pattern name="OmvangWaarde"> -->
		<!-- Rule 26, 41: enkele voorbeelden OmvangWaarde constraints -->
		<!-- Percentage is gewoon range [0, 100]: text() &gt;= 0 and text() &lt;= 100 -->

		<!-- Range [10, 20>, incl. 10, excl. 20 -->
		<!--
		<iso:rule context="imro:OmvangWaardeBP[imro:waardeType/text()='maximum bouwhoogte (m)']/imro:waarde">
			<iso:assert test="text() &gt;= 10 and text() &lt; 20">
				(Planobject id = <iso:value-of select="imro:identificatie"/>)
				Bouwhoogte moet minimaal 10 meter zijn en maximaal kleiner dan 20 meter zijn, is nu <iso:value-of select="text()"/>
			</iso:assert>
		</iso:rule>
-->
		<!-- Range <6, 15], excl. 6, incl. 15 -->
		<!--
		<iso:rule context="imro:OmvangWaardeBP[imro:waardeType/text()='maximum goothoogte (m)']/imro:waarde">
			<iso:assert test="text() &gt; 6 and text() &lt;= 15">
				(Planobject id = <iso:value-of select="imro:identificatie"/>)
				Goothoogte moet minimaal groter dan 6 meter zijn en maximaal 15 meter zijn, is nu <iso:value-of select="text()"/>
			</iso:assert>
		</iso:rule>
	</iso:pattern>
-->

	<iso:pattern name="SymboolCode of Geometrie">
		<!-- Rule 27 -->
		<iso:rule context="imro:Figuur">

			<iso:assert test="imro:symboolInfo or imro:geometrie" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 27a: Bij Figuur dient ofwel symboolcode ofwel geometrie gevuld te zijn.
			</iso:assert>
			<iso:report test="imro:symboolInfo and imro:geometrie" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 27b: Bij Figuur dient ofwel symboolcode ofwel geometrie gevuld te zijn.
			</iso:report>
		</iso:rule>
	</iso:pattern>
<!--
	<iso:pattern name="GebiedsaanduidingGeom"> -->
		<!-- Rule 28 
		<iso:rule context="imro:Gebiedsaanduiding">
			<iso:assert test="count(imro:geometrie)=1">
				(Planobject id = <iso:value-of select="imro:identificatie"/>)
				Bij Gebiedsaanduiding dient altijd 1 geometrie opgenomen te worden
			</iso:assert>
		</iso:rule>
	</iso:pattern>
-->
	<iso:pattern name="BestuurlijkeDoorwerking">
		<!-- Rule 39, 45, 48, 53 (Context IMRO2006::StatusEnBestuurlijkeDoorwerking)
			inv statusEnBeestuurlijkeDoorwerking:
			if self.status = Status::'planvorming; nader uit te werken'
				then self.bestuurlijkeDoorwerking.notEmpty()
				else self.bestuurlijkeDoorwerking.isEmpty()
			endif
		-->
		<iso:rule context="imro:StatusEnBestuurlijkeDoorwerking">

			<iso:report test="normalize-space(imro:status)='planvorming; nader uit te werken' and (normalize-space(imro:bestuurlijkeDoorwerking)='' or not(imro:bestuurlijkeDoorwerking))" diagnostics="identificatieLookup2">
(Planobject id = <iso:value-of select="../../imro:identificatie"/>)
Foutcode 39a: BestuurlijkeDoorwerking ontbreekt bij Status.
			</iso:report>
			<iso:report test="not(normalize-space(imro:status)='planvorming; nader uit te werken') and imro:bestuurlijkeDoorwerking" diagnostics="identificatieLookup2">
(Planobject id = <iso:value-of select="../../imro:identificatie"/>)
Foutcode 39b: BestuurlijkeDoorwerking onterecht opgenomen.
			</iso:report>
		</iso:rule>
	</iso:pattern>
	
	
	<!-- Rule 43, 46 en 50 zijn uitgeschakeld
omdat de verkorte codering in de praktijkrichtlijn niet duidelijk omschreven is.
Dit gaf problemen in de validatie.
Door hier niet op te valideren is dit  verkorte codering wel nog steeds mogelijk.
Het niet valideren wordt niet als een probleem gezien  -->

<!--
	<iso:pattern name="Controle Attributen bij VerwijzingNaarExternPlan"> -->
		<!-- Rule 43, 46, 50 (Context IMRO2006::ProvinciaalGebied | IMRO2006:ProvinciaalVerbinding | IMRO2006:ProvinciaalComplex)
			inv (provinciaalGebiedVerkort | provinciaalVerbindingVerkort | provinciaalComplexVerkort):
				self.verwijzingNaarExternPlan.notEmpty() implies
					(aantal objecten moeten leeg zijn) -->
		
	<!--	
		
		<iso:rule context="imro:ProvinciaalGebied | imro:ProvinciaalVerbinding | imro:ProvinciaalComplex">
			<iso:report test="imro:verwijzingNaarExternPlan and imro:sBICodeBedrijvigheid">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43a: sBICodeBedrijvigheid onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:beleidssector">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43b: beleidssector onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:beschikbaarheidInfo">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43c: beschikbaarheidInfo onterecht gebruikt een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:classificatie">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43d: classificatie onterecht gebruikt een bij planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:functieInfo">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43e: functieInfo onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:gebruikteOndergrond">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43f: gebruikteOndergrond onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:omvangWaarde">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43g: omvangWaarde onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:product">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43h: product-attribuut onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:reikwijdte">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43i: reikwijdte onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:rechtenOpObject"> -->
				<!-- NOTE: rechtenOpObject wordt overgeerfd vanuit nen3610:RegistratiefGebied -->

<!--
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43j: rechtenOpObject onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
			<iso:report test="imro:verwijzingNaarExternPlan and imro:relatePlanobject">	
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 43k: relatePlanobject onterecht gebruikt bij een planobject dat verwijst naar Extern Plan.
			</iso:report>
		</iso:rule>
	</iso:pattern>
-->

<!-- Rule A43 Controle op verplicht gebruik functieInfo als er niet verkort gecodeerd is  -->
	<iso:pattern name="Controle op verplicht gebruik functieInfo">
		<iso:rule context="imro:ProvinciaalGebied | imro:ProvinciaalVerbinding | imro:ProvinciaalComplex">

		<iso:let name="aantalVerwijzingExtern" value="count(imro:verwijzingNaarExternPlan)"/>
		<iso:let name="aantalFunctieInfo" value="count(imro:functieInfo)"/>
		
		<iso:report test="$aantalVerwijzingExtern = 0 and $aantalFunctieInfo = 0" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode A43: Functie-informatie is verplicht indien voor de niet verkorte codering is gekozen.
			</iso:report>		
		</iso:rule>
	</iso:pattern>		
		
		
		
	<!-- Rule 52 is hyperlink, N/A -->
	<!-- From this point on the content of the second file S05_RelatieIDFN.sch is inserted -->

<iso:pattern name="RelatieIDN">
		<!-- NOTE: Aanname bij associaties: associaties zijn altijd "by reference", m.a.w. de
			AssociationAttributeGroup (xlink) wordt gebruikt (UML: aggregation) -->
		<!-- NOTE: Beware, the first char of the links is stripped. Normally, this should be the
			hash sign -->

		<!-- Rule 05: (Associatie) Planobject.relatiePlanobject = Planobject.id -->
		<!-- TODO: toepassen voor alle afgeleide klassen -->
		<!-- TODO: testdata nodig -->
		<iso:rule context="imro:GemeentelijkGebied/imro:relatiePlanobject | 
							imro:GemeentelijkVerbinding/imro:relatiePlanobject | 
							imro:GemeentelijkComplex/imro:relatiePlanobject | 
							imro:ProvinciaalGebied/imro:relatiePlanobject | 
							imro:ProvinciaalVerbinding/imro:relatiePlanobject | 
							imro:ProvinciaalComplex/imro:relatiePlanobject | 
							imro:NationaalGebied/imro:relatiePlanobject | 
							imro:NationaalVerbinding/imro:relatiePlanobject | 
							imro:NationaalComplex/imro:relatiePlanobject">

			<!-- Test associatie -->
			<iso:let name="planobject_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('GemeentelijkGebied_index',$planobject_idn) or 
							key('GemeentelijkVerbinding_index',$planobject_idn) or 
							key('GemeentelijkComplex_index',$planobject_idn) or 
							key('ProvinciaalGebied_index',$planobject_idn) or 
							key('ProvinciaalVerbinding_index',$planobject_idn) or 
							key('NationaalGebied_index',$planobject_idn) or 
							key('NationaalVerbinding_index',$planobject_idn) or 
							key('NationaalComplex_index',$planobject_idn)" 
							diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 5a: Associatie Planobject.relatiePlanobject ongeldig (verwijzing naar planobject met id = <iso:value-of select="substring(@xlink:href, 2)"/>)
				<!-- TODO: melding uitbreiden met local-name en id van betreffend object -->
				<!-- TODO: onderstaand opzetje uitwerken -->
				<!-- Idee: ernst van fout toevoegen. Gradaties:
					Kritieke fout
					Ernstige fout
					Fout
					Waarschuwing
					Aandachtspunt
				-->
				<!--
				<val:associationError ruleId="05">
					<val:assocFrom>Planobject.relatiePlanobject</val:assocFrom>
					<val:assocTo>Planobject.id</val:assocTo>
					<val:localObject>
						<!- - TODO: link opnemen - ->
						<val:id><iso:value-of select="../@gml:id"/></val:id>
						<val:name><iso:name/></val:name>
					</val:localObject>
					<val:remoteObject>
						<val:id><iso:value-of select="$planobject_idn"/></val:id>
					</val:remoteObject>
				</val:associationError>
				-->
			</iso:assert>
		<!--	<iso:report test="//imro:Planobject[@gml:id=$planobject_idn]"> -->
				<!-- Test -->
			<!--	(Planobject id = <iso:value-of select="../imro:identificatie"/>)
				Foutcode 5b: Associatie Planobject.relatiePlanobject mag niet bij een bestemmingsplan. (verwijzing naar planobject met id = <iso:value-of select="substring(@xlink:href, 2)"/>) -->
			<!-- </iso:report> -->
		</iso:rule>
		<!-- Inheritance-schema voor Planobject
			Planobject
				Bestemmingsvlak
					Enkelbestemming
					Dubbelbestemming
				Aanduiding
					Bouwvlak
					Lettertekenaanduiding
					Maatvoering
					Figuur
					Gebiedsaanduiding
				Gebied
					GemeentelijkGebied
					ProvinciaalGebied
					NationaalGebied
				Verbinding
					GemeentelijkVerbinding
					ProvinciaalVerbinding
					NationaalVerbinding
				Complex
					GemeentelijkComplex
					ProvinciaalComplex
					NationaalComplex
		-->

		<!-- Rule 06: (Associatie) Planobject.complex = Complex.id -->
		<!-- is nu  toegepast voor alle afgeleide klassen -->
		<!-- TODO: testdata nodig -->
		<iso:rule context="imro:ProvinciaalVerbinding/imro:complex | imro:ProvinciaalGebied/imro:complex | imro:ProvinciaalComplex/imro:complex | imro:NationaalVerbinding/imro:complex | imro:NationaalGebied/imro:complex | imro:NationaalComplex/imro:complex | imro:GemeentelijkVerbinding/imro:complex | imro:GemeentelijkGebied/imro:complex | imro:GemeentelijkComplex/imro:complex">

			<!-- Test associatie -->
			<iso:let name="complex_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('ProvinciaalComplex_index',$complex_idn) or 
							key('NationaalComplex_index',$complex_idn) or 
							key('GemeentelijkComplex_index',$complex_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 6a: Associatie Planobject.complex ongeldig (verwijzing naar planobject met id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 07: Duplicate of rule 05 -->
		<!-- Rule 08: Duplicate of rule 05 -->
		<!-- Rule 09: Duplicate of rule 05 -->

		<!-- Rule 10: (Associatie) Complex.planobject = Planobject.id -->
		<!-- Deze op hoofdklasse gedefinieerde constraints worden niet gevalideerd. Gebeurt wel in bijvoorbeeld constraint 60 -->
		<iso:rule context="imro:Complex/imro:planobject">

			<!-- Test associatie -->
			<iso:let name="planobj_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('Planobject_index',$planobj_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 10: Een Complex verwijst naar een ongeldig planobject-id (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 13: (Associatie) Bestemmingsvlak.plangebied = Bestemmingsplangebied.id -->
		<!-- NOTE: opmerking test aanwezigheid: zie rule 21 -->
		<!-- opmerking: deze superklasse context werkt niet. Context van Enkel en dubbelbestemming apart opnemen. Is gebeurd -->
		<iso:rule context="imro:Enkelbestemming | imro:Dubbelbestemming">

			<!-- Test aanwezigheid. 
			RD: Deze test slaagt altijd omdat het XML schema dit veld verplicht stelt. -->
			<iso:assert test="imro:plangebied" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 13a: Plangebied niet aangetroffen bij bestemmingsvlak
			</iso:assert>
		</iso:rule>
		<iso:rule context="imro:Enkelbestemming/imro:plangebied | imro:Dubbelbestemming/imro:plangebied">

			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
				<iso:assert test="key('Bestemmingsplangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id <iso:value-of select="../imro:identificatie"/>)
Foutcode 13b: Associatie Bestemmingsvlak.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>


		<!-- Rule 17: (Associatie) Aanduiding.plangebied = Bestemmingsplangebied.id -->
		<!-- Rule identiek aan rule 13, op melding na -->
		<iso:rule context="imro:Bouwvlak/imro:plangebied | imro:Lettertekenaanduiding/imro:plangebied | imro:Maatvoering/imro:plangebied | imro:Gebiedsaanduiding/imro:plangebied | imro:Figuur/imro:plangebied">

			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('Bestemmingsplangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 17: Associatie Aanduiding.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 18: (Associatie) Aanduiding.bestemmingsvlak = Bestemmingsvlak.id -->
		<!-- ok -->
		<iso:rule context="imro:Bouwvlak/imro:bestemmingsvlak | imro:Lettertekenaanduiding/imro:bestemmingsvlak | imro:Maatvoering/imro:bestemmingsvlak">

			<!-- Test associatie -->
		<iso:let name="bvlak_idn" value="substring(@xlink:href, 2)"/>
		<iso:assert test="key('Enkelbestemming_index',$bvlak_idn) or 
							key('Dubbelbestemming_index',$bvlak_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 18a: Een aanduiding verwijst naar een ongeldig bestemmingsvlak-id (verwijs-id = <iso:value-of select ="$bvlak_idn"/>)
			</iso:assert>
		</iso:rule>
		
		
						<!-- Rule 18b: (Associatie) maatvoering.aanduiding, figuur.aanduiding, lettertekenaanduiding.aanduiding = bouwvlak.id of gebiedsaanduiding.id -->
		<!-- ok -->
		<iso:rule context="imro:Maatvoering/imro:aanduiding | imro:Lettertekenaanduiding/imro:aanduiding | imro:Figuur/imro:aanduiding">

			<!-- Test associatie -->
		<iso:let name="aanduiding_idn" value="substring(@xlink:href, 2)"/>
		<iso:assert test="key('Bouwvlak_index',$aanduiding_idn) or 
						key('Gebiedsaanduiding_index',$aanduiding_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 18b: Een maatvoering, lettertekenaanduiding of figuur verwijst naar een ongeldig aanduiding-id. Een aaduiding van dit type verwijst optioneel naar een aanduiding van het type bouwvlak of gebiedsaanduiding  (verwijs-id = <iso:value-of select ="$aanduiding_idn"/>)
			</iso:assert>
		</iso:rule>	

		<!-- Rule 21: (Associatie) -->
		<!-- ok -->
		<!-- NOTE: is implementatie van 18, behalve dat bestemmingsvlak aanwezig moet zijn.
			Dit is verder niet gespecificeerd, nader overleg nodig
			Test aanwezigheid: context node is degene die bepaald child moet hebben
			Test associatie: context node is child node bij aanwezigheidstest
			-->
		<iso:rule context="imro:Bouwvlak">

			<!-- Test aanwezigheid -->
			<iso:assert test="imro:bestemmingsvlak" diagnostics="identificatieLookup">
(Planobject id = <iso:value-of select="imro:identificatie"/>)
Foutcode 21: Bestemmingsvlak niet aangetroffen bij bouwvlak
			</iso:assert>
		</iso:rule>
		
	

		<!-- Rule 30: (Associatie) Onthoudingsgebied.besluitgebied = Besluitgebied.id -->
		<iso:rule context="imro:Onthoudingsgebied/imro:besluitgebied">

			<!-- Test associatie -->
		<iso:let name="beslgebied_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('Besluitgebied_index',$beslgebied_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 30: Associatie Onthoudingsgebied.besluitgebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 32: (Associatie) GemeentelijkGebied.plangebied = StructuurvisieGebied.id -->
		<iso:rule context="imro:GemeentelijkGebied/imro:plangebied">

			<!-- Test associatie -->
		<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('StructuurvisieGebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 32: Associatie GemeentelijkGebied.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 33: (Associatie) GemeentelijkGebied.categorieGebieden = GemeentelijkGebied.id -->
		<iso:rule context="imro:GemeentelijkGebied/imro:categorieGebieden">

			<!-- Test associatie -->
		<iso:let name="gebied_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('GemeentelijkGebied_index',$gebied_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 33: Associatie GemeentelijkGebied.categorieGebieden ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 34: (Associatie) GemeentelijkVerbinding.plangebied = StructuurvisieGebied.id -->
		<!-- Rule identiek aan rule 32, op melding na -->
		<iso:rule context="imro:GemeentelijkVerbinding/imro:plangebied">

			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('StructuurvisieGebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 34: Associatie GemeentelijkVerbinding.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 35: (Associatie) GemeentelijkVerbinding.categorieVerbindingen = GemeentelijkVerbinding.id -->
		<iso:rule context="imro:GemeentelijkVerbinding/imro:categorieVerbindingen">

			<!-- Test associatie -->
			<iso:let name="verbinding_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('GemeentelijkVerbinding_index',$verbinding_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 35: Associatie GemeentelijkVerbinding.categorieVerbindingen ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 36: (Associatie) GemeentelijkComplex.plangebied = StructuurvisieGebied.id -->
		<!-- Rule identiek aan rule 32, op melding na -->
		<iso:rule context="imro:GemeentelijkComplex/imro:plangebied">

			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('StructuurvisieGebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 36: Associatie GemeentelijkComplex.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 37: (Associatie) GemeentelijkComplex.planobject = Planobject.id -->
		<!-- NOTE: Deze rule zou een verbijzondering van rule 10 moeten zijn -->
		<iso:rule context="imro:GemeentelijkComplex/imro:planobject">

			<!-- Test associatie -->
			<iso:let name="planobj_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('GemeentelijkComplex_index',$planobj_idn) or 
							key('GemeentelijkVerbinding_index',$planobj_idn) or 
							key('GemeentelijkGebied_index',$planobj_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 37: Associatie imro:GemeentelijkComplex/imro:planobject ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 42: (Associatie) ProvinciaalGebied.plangebied = ProvinciaalPlangebied.id -->
		<iso:rule context="imro:ProvinciaalGebied/imro:plangebied">

			<!-- Test associatie -->
		  	<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('ProvinciaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 42: Associatie ProvinciaalGebied.plangebied ongeldig. (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 44: (Associatie) ProvinciaalVerbinding.plangebied = ProvinciaalPlangebied.id -->
		<!-- Rule identiek aan rule 42, op melding na -->
		<iso:rule context="imro:ProvinciaalVerbinding/imro:plangebied">
	
			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('ProvinciaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 44: Associatie ProvinciaalVerbinding.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 47: (Associatie) ProvinciaalComplex.plangebied = ProvinciaalPlangebied.id -->
		<!-- Rule identiek aan rule 42, op melding na -->
		<iso:rule context="imro:ProvinciaalComplex/imro:plangebied">
	
			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('ProvinciaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 47: Associatie ProvinciaalComplex.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 49: (Associatie) ProvinciaalComplex.planobject = Planobject.id -->
		<!-- NOTE: Deze rule zou een verbijzondering van rule 10 moeten zijn -->
		<iso:rule context="imro:ProvinciaalComplex/imro:planobject">
	
			<!-- Test associatie -->
			<iso:let name="planobj_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('ProvinciaalComplex_index',$planobj_idn) or 
							key('ProvinciaalVerbinding_index',$planobj_idn) or 
							key('ProvinciaalGebied_index',$planobj_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 49: Associatie imro:ProvinciaalComplex/imro:planobject ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 55: (Associatie) NationaalGebied.plangebied = NationaalPlangebied.id -->
		<!-- NOTE: rules 55 t/m 60 zijn identiek aan rules 32 t/m 37, op naamgeving na -->
		<iso:rule context="imro:NationaalGebied/imro:plangebied">
	
			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 55: Associatie NationaalGebied.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 56: (Associatie) NationaalGebied.categorieGebieden = NationaalGebied.id -->
		<iso:rule context="imro:NationaalGebied/imro:categorieGebieden">
	
			<!-- Test associatie -->
			<iso:let name="gebied_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalGebied_index',$gebied_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 56: Associatie NationaalGebied.categorieGebieden ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 57: (Associatie) NationaalVerbinding.plangebied = NationaalPlangebied.id -->
		<!-- Rule identiek aan rule 55, op melding na -->
		<iso:rule context="imro:NationaalVerbinding/imro:plangebied">
	
			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 57: Associatie NationaalVerbinding.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 58: (Associatie) NationaalVerbinding.categorieVerbindingen = NationaalVerbinding.id -->
		<iso:rule context="imro:NationaalVerbinding/imro:categorieVerbindingen">

			<!-- Test associatie -->
			<iso:let name="verbinding_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalVerbinding_index',$verbinding_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 58: Associatie NationaalVerbinding.categorieVerbindingen ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 59: (Associatie) NationaalComplex.plangebied = NationaalPlangebied.id -->
		<!-- Rule identiek aan rule 55, op melding na -->
		<iso:rule context="imro:NationaalComplex/imro:plangebied">
	
			<!-- Test associatie -->
			<iso:let name="plan_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalPlangebied_index',$plan_idn)" diagnostics="identificatieLookup1">
(Planobject id = <iso:value-of select="../imro:identificatie"/>)
Foutcode 59: Associatie NationaalComplex.plangebied ongeldig (verwijs-id = <iso:value-of select="substring(@xlink:href, 2)"/>)
			</iso:assert>
		</iso:rule>

		<!-- Rule 60: (Associatie) NationaalComplex.planobject = Planobject.id -->
		<!-- NOTE: Deze rule zou een verbijzondering van rule 10 moeten zijn -->
		<iso:rule context="imro:NationaalComplex/imro:planobject">
		
			<!-- Test associatie -->
			<iso:let name="planobj_idn" value="substring(@xlink:href, 2)"/>
			<iso:assert test="key('NationaalComplex_index',$planobj_idn) or 
							key('NationaalVerbinding_index',$planobj_idn) or 
							key('NationaalGebied_index',$planobj_idn)" diagnostics="identificatieLookup1">
(Planobject id  = <iso:value-of select="../imro:identificatie"/>)
Foutcode 60: Associatie imro:NationaalComplex/imro:planobject ongeldig (verwijs-id = <iso:value-of select="$planobj_idn"/>)
			</iso:assert>
		</iso:rule>
		
	<!-- Rule 61: Geen multi-geometrie combinatie van verschillend type voor een provinciaal plan en een gemeentelijk plan toegestaan.-->
	<!-- Rule is toegevoegd speciaal voor IMRO2006 aanpassing voor de codering van de Nota Ruimte-->
	<!-- Deze Nota Ruimte aanpassing is verwerkt in IMRO2006 version 1.1 -->
	<!-- De rule controleert of de aanpassing voor de Nota Ruimte niet toegepast wordt voor gemeentelijke- en provinciale plannen  -->
	
		<!-- <iso:pattern name="Geen GM_Aggregate voor Provinciaal en Gemeentelijk Plan "> -->
		
	<iso:rule context="imro:PuntLijnVlakMulti/imro:geometrieCombi">
			
			<iso:assert test="../../../imro:typePlanobject/text()= 'gebied; nationaalGebied' or ../../../imro:typePlanobject/text()= 'verbinding; nationaalVerbinding'  or ../../../imro:typePlanobject/text()= 'complex; nationaalComplex'" diagnostics="identificatieLookup3">
(Planobject id = <iso:value-of select="../../../imro:identificatie"/>)
(typePlanobject = <iso:value-of select="../../../imro:typePlanobject"/>)
Foutcode 61: Multi-geometrie van verschillend type is niet toegestaan voor dit type planobject.
			</iso:assert>
		</iso:rule>

	</iso:pattern>

	
	<iso:diagnostics>
		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup"><iso:value-of select="imro:identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup1"><iso:value-of select="../imro:identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup2"><iso:value-of select="../../imro:identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup3"><iso:value-of select="../../../imro:identificatie"/></iso:diagnostic>
	</iso:diagnostics>
	
</iso:schema>
