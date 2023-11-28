<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: additional-validator-rules-2012v0.08-b-RC.sch
 * (C) Logica, 2011
 * 2018: Geonovum, Thijs Brentjens
 * 2022: Geonovum, Arnoud de Boer (AdB), Gijs Koedam (GRK)
 *
 * Info:
 * Extra Schematron Validation Document for IMRO 2012
 *
 * History:
 * 21-09-2011   RD  Initial version
 * 30-11-2011   RD  Added checks for "objectgerichte tekst" not permitting ordinary texts and vice versa.
 *                  Cleanup of unused "iso:let" statements and "xsl:key" statements.
 * 30-01-2012   RD  Change of imro namespace: http://www.geonovum.nl/imro2012  ===> http://www.geonovum.nl/imro/2012/1.0
 *					Removed rules AD21A and AD21B because of new constraint c14 in IMRO2012.pdf: checks moved to imro2012-rulesv003.sch.
 *                  Rule AD3 changed: format of lokaalID changed.
 *                  Bugfix for rule AD70: Only the deepest GML elements of gml:Point, gml:Curve, gml:Surface, gml:MultiPoint, gml:MultiCurve, gml:MultiSurface
 *                      are investigated for presence of coordinates. Elements like gml:metaDataProperty, gml:description, gml:descriptionReference,
 *                      gml:identifier and gml:name are also accepted as deepest elements.
 * 14-03-2012   RD  Change of imro namespace: http://www.geonovum.nl/imro/2012/1.0  ===> http://www.geonovum.nl/imro/2012/1.1
 * 06-06-2012   RD  Change of file format for pt_ files.
 *                  Change of check for imro:symboolcode format: this element should not be validated when there is no imro:symboolcode element.
 *                  Bugfix in check AD25. Was not working at all.
 *                  Addition to check AD70. CircleByCenterPoint is already rejected by check AD60. No second rejection necessary.
 * 27-09-2012   RD  Additional check AD80. Fields imro:naam may not be empty.
 * 16-04-2018   TB  Thijs Brentjens. Additional check. For plantype + overheid
 * 30-10-2018	GD	Geodan/Kadaster. various corrections on 'Additional check. For plantype + overheid' implemented RPnl v.2.4.2.3 dd.29-10-2018.
 * (23-05-2022   AdB Overgangsrecht Ow + TAM validation rules by XSLT-1)
 * (26-08-2022	AdB Aanpassingen naar aanleiding van uitgevoerde test dd. 04-07-2022)
 * 05-10-2022   AdB Overgangsrecht Ow + TAM-uitgebreid geïmplementeerd in schematron (zie <iso:pattern id="OwTAMuitgebreid">)
 * 12-10-2022	AdB IMRO2008 TAM-validaties verplaatst naar imro-dev/regels/rules-2008v1.18/additional-validator-rules-2008v1.18-b-RC.sch
 * 28-10-2022	GRK Datum inwerkingtreding Ow aangepast n.a.v. uitstel: 01-01-2023 ==> 01-07-2023
 * 21-03-2023	AdB Datum inwerkingtreding Ow aangepast na instemming : 01-07-2023 ==> 01-01-2024 
 * 28-11-2023   AdB Blokkeren structuurvisie + beheersoverordening, tenzij naam  'Chw bestemmingsplan ' én status 'vastgesteld' of 'geconsolideerd'
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

	<iso:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2012/1.1"/>
	<!--iso:ns prefix="imro2008" uri="http://www.geonovum.nl/imro/2008/1"/-->
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

	<iso:let name="upperCase" value="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<iso:let name="lowerCase" value="'abcdefghijklmnopqrstuvwxyz'"/>

	<!--
	Check voor identificatie: NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}
	Bestandsnaamconventie: ([a-z]{1,2}_)?NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}(_[A-Za-z0-9\.]{1,20})?\.(html|htm|xhtml|xml|gml|pdf|png|jpg|jpeg)
	Toegestande prefixes: (r|rb|t|tb|i|vb|pt|g|d|db|b|bb)_
	 -->
	<iso:let name="overheidsCodeFormat" value="'[0-9]{4}'"/>
	<iso:let name="lokaalIDFormat" value="'[0-9]{4}\.[A-Za-z0-9_\-\.,]{1,18}'"/>
	<iso:let name="versieFormat" value="'[A-Za-z0-9]{4}'"/>

	<iso:let name="prefix" value="'(r|d|t|vb|b|i|pt)_'"/>
	<iso:let name="idncheck" value="'NL\.IMRO\.[0-9]{4}\.[A-Za-z0-9]{1,18}-[A-Za-z0-9]{4}'"/>
	<iso:let name="naamverlenging" value="'(_[A-Za-z0-9\.]{1,20})?'"/>
	<iso:let name="alleToegestaneExtensies" value="'\.(html|htm|xhtml|xml|gml|pdf|png|jpg|jpeg)'"/>

	<iso:let name="optioneleSuffix" value="'(#.*)?'"/>

	<iso:let name="bestandsnaamRegexp" value="concat($prefix,$idncheck,$naamverlenging,$alleToegestaneExtensies,$optioneleSuffix)"/>

	<iso:let name="illustratieExtensies" value="'\.(jpg|jpeg|png|pdf)'"/>
	<iso:let name="illustratieBestandsnaamRegexp" value="concat('i_',$idncheck,$naamverlenging,$illustratieExtensies,$optioneleSuffix)"/>

	<iso:let name="bijlageExtensies" value="'\.(htm|html|xhtml|pdf)'"/>
	<iso:let name="bijlageBestandsnaamRegexp" value="concat('b_',$idncheck,$naamverlenging,$bijlageExtensies,$optioneleSuffix)"/>

	<iso:let name="vaststellingsbesluitExtensies" value="'\.(htm|html|xhtml|pdf)'"/>
	<iso:let name="vaststellingsbesluitBestandsnaamRegexp" value="concat('vb_',$idncheck,$vaststellingsbesluitExtensies,$optioneleSuffix)"/>

	<iso:let name="regelExtensies" value="'\.(htm|html|xhtml)'"/>
	<iso:let name="regelBestandsnaamRegexp" value="concat('r_',$idncheck,$regelExtensies,$optioneleSuffix)"/>

	<iso:let name="toelichtingExtensies" value="'\.(htm|html|xhtml|pdf)'"/>
	<iso:let name="toelichtingBestandsnaamRegexp" value="concat('t_',$idncheck,$toelichtingExtensies,$optioneleSuffix)"/>

	<iso:let name="beleidBesluitExtensies" value="'\.(htm|html|xhtml|pdf)'"/>
	<iso:let name="beleidBesluitBestandsnaamRegexp" value="concat('d_',$idncheck,$beleidBesluitExtensies,$optioneleSuffix)"/>

	<iso:let name="plantextExtensies" value="'\.xml'"/>
	<iso:let name="plantextBestandsnaamRegexp" value="concat('pt_',$idncheck,$plantextExtensies,$optioneleSuffix)"/>


	<iso:let name="coordinaatFormat" value="'-?[0-9]{1,6}(\.[0-9]{0,3})?'"/>
	<iso:let name="space" value="'[ \t\r\n\v\f]+'"/>

	<iso:let name="VVPSymboolcodeRegexp" value="'(S|ES|AS|L|P)\d+'"/>
	<iso:let name="VVPSymboolcodeSurfaceRegexp" value="'(S|ES|AS)\d+'"/>
	<iso:let name="VVPSymboolcodeLineRegexp" value="'L\d+'"/>
	<iso:let name="VVPSymboolcodePointRegexp" value="'P\d+'"/>



	<iso:let name="containsVerwijzingenNaarObjectgerichteTekst" value="boolean(//imro:verwijzingNaarTekst[starts-with(text(),'pt_')])"/>



	<xsl:key name="Planobject_index" match="//imro:*[@gml:id]" use="@gml:id" />

	<xsl:key name="GeometriePlangebied_index" match="//imro:GeometriePlangebied" use="@gml:id" />
	<xsl:key name="GeometriePlangebied_P_index" match="//imro:GeometriePlangebied_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_P_index" match="//imro:GeometrieStructuurvisieObject_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_index" match="//imro:GeometrieStructuurvisieObject" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_A_index" match="//imro:GeometrieBesluitobject_A" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P1_index" match="//imro:GeometrieBesluitobject_P1" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P3_index" match="//imro:GeometrieBesluitobject_P3" use="@gml:id" />



	<!-- Creëer een verzameling van alle aanwezige VVP cartografische info. -->

	<xsl:key name="VVPCartografischeInfosPerGeometrieTypeSurfaceByGmlId"
				match="//imro:cartografieInfo/imro:CartografieInfo[regexp:matches(imro:symboolcode, $VVPSymboolcodeSurfaceRegexp)]"
				use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="VVPCartografischeInfosPerGeometrieTypeLineByGmlId"
				match="//imro:cartografieInfo/imro:CartografieInfo[regexp:matches(imro:symboolcode, $VVPSymboolcodeLineRegexp)]"
				use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="VVPCartografischeInfosPerGeometrieTypePointByGmlId"
				match="//imro:cartografieInfo/imro:CartografieInfo[regexp:matches(imro:symboolcode, $VVPSymboolcodePointRegexp)]"
				use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="VVPKaartNummersKey" match="//imro:cartografieInfo/imro:CartografieInfo"
								use="imro:kaartnummer"/>

	<xsl:key name="VVPCartografischeInfoMetValideSymboolCodeByGmlIdKey" match="//imro:cartografieInfo/imro:CartografieInfo[regexp:matches(imro:symboolcode, $VVPSymboolcodeRegexp)]"
								use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="surface_index" match="//imro:geometrie[gml:Surface or gml:MultiSurface]"
								use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="line_index" match="//imro:geometrie[gml:Curve or gml:MultiCurve]"
								use="ancestor::imro:*[@gml:id]/@gml:id"/>

	<xsl:key name="point_index" match="//imro:geometrie[gml:Point or gml:MultiPoint]"
								use="ancestor::imro:*[@gml:id]/@gml:id"/>


	<xsl:key name="vvpBegrenzingPerGeometrieTypeSurface" match="imro:begrenzing[@xlink:href and key('surface_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>
	<xsl:key name="vvpBegrenzingPerGeometrieTypeLine" match="imro:begrenzing[@xlink:href and key('line_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>
	<xsl:key name="vvpBegrenzingPerGeometrieTypePoint" match="imro:begrenzing[@xlink:href and key('point_index',substring-after(@xlink:href,'#'))]" use="substring-after(@xlink:href,'#')"/>


	<iso:pattern name="Algemene_checks">

		<iso:rule abstract="true" id="check_naam_not_empty">

			<iso:assert test="regexp:matches(imro:naam, '[^ \t\r\n]{1}.*')" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode AD80: Het element imro:naam (type gml:CodeType) van een plangebied of planobject mag niet leeg zijn of met een spatie, tab, return of new line beginnen.
			</iso:assert>
		</iso:rule>



		<iso:rule abstract="true" id="check_planobjecten">
			<iso:let name="identificatie" value="@gml:id"/>

			<iso:extends rule="check_naam_not_empty"/>

			<iso:let name="namespace" value="imro:identificatie/imro:NEN3610ID/imro:namespace"/>
			<iso:let name="lokaalID" value="imro:identificatie/imro:NEN3610ID/imro:lokaalID"/>
			<iso:let name="versie" value="imro:identificatie/imro:NEN3610ID/imro:versie"/>


		<!-- AD0A: Object planobject: De waarde voor gml:id is opgebouwd uit de waarden van het samengestelde
		attribuut <imro:identificatie> volgens het format gml:id= <namespace>'.'<lokaalID>.

		Deze test is afgeleid uit paragraaf 11.2 van IMRO2012.pdf.
		 -->
			<iso:let name="composedID" value="concat($namespace,'.',$lokaalID)"/>

			<iso:assert test="$identificatie = $composedID"  diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode AD0A: Object planobject: De waarde voor gml:id (huidige waarde: '<iso:value-of select="$identificatie"/>') is opgebouwd uit de waarden van het samengestelde
attribuut imro:identificatie volgens het format gml:id = namespace '.' lokaalID (huidige waarde: '<iso:value-of select="$composedID"/>').
            Zie hiervoor IMRO2012.pdf paragraaf 11.2 "Nadere implementatie specificaties".
			</iso:assert>

		</iso:rule>

		<iso:rule abstract="true" id="check_plangebieden">
			<iso:let name="identificatie" value="@gml:id"/>

			<iso:extends rule="check_naam_not_empty"/>

			<iso:let name="namespace" value="imro:identificatie/imro:NEN3610ID/imro:namespace"/>
			<iso:let name="lokaalID" value="imro:identificatie/imro:NEN3610ID/imro:lokaalID"/>
			<iso:let name="versie" value="imro:identificatie/imro:NEN3610ID/imro:versie"/>

			<iso:let name="composedID" value="concat($namespace,'.',$lokaalID,'-',$versie)"/>

		<!-- AD0B: Object plangebied: De waarde voor gml:id is opgebouwd uit de waarden van het samengestelde
		attribuut <imro:identificatie> volgens het format gml:id = <namespace>'.'<lokaalID>'-'<versie>.

		Deze test is afgeleid uit paragraaf 11.2 van IMRO2012.pdf.
		 -->
			<iso:assert test="$identificatie = $composedID" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode AD0B: Object plangebied: De waarde voor gml:id (huidige waarde: '<iso:value-of select="$identificatie"/>') is opgebouwd uit de waarden van het samengestelde
attribuut imro:identificatie volgens het format gml:id = namespace '.' lokaalID '-' versie (huidige waarde: '<iso:value-of select="$composedID"/>').
            Zie hiervoor IMRO2012.pdf paragraaf 11.2 "Nadere implementatie specificaties".
			</iso:assert>

			<iso:assert test="regexp:matches(imro:overheidsCode,$overheidsCodeFormat)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode AD1: overheidsCode (huidige waarde "<iso:value-of select="imro:overheidsCode"/>") moet uit 4 cijfers bestaan.
			Zie hiervoor o.a. paragraaf 6.4.1 (afhankelijk van planobject) in IMRO2012.pdf.
			</iso:assert>

			<iso:assert test="regexp:matches($identificatie,$idncheck)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode AD2: gml:id (huidige waarde "<iso:value-of select="$identificatie"/>") voldoet niet aan de conventies van STRI2012.
			</iso:assert>

			<iso:assert test="regexp:matches($lokaalID, $lokaalIDFormat)">
Foutcode AD3: NEN3610ID.lokaalID (huidige waarde: <iso:value-of select="$lokaalID"/>) voldoet niet aan het gespecificeerde format '[0-9]{4}\.[A-Za-z0-9]{1,18}'
			Zie constraint a4 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

	</iso:pattern>





	<iso:pattern name="SVBegrenzingVerwijzingenBestaan">

		<iso:rule abstract="true" id="check_begrenzingen">

			<iso:let name="begrenzing_href" value="@xlink:href"/>

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:assert test="string-length(@xlink:href) &gt; 0" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD30A: <iso:value-of select="name($ownerFeature)"/>/imro:begrenzing dient een gevuld xlink:href attribuut te bevatten.
			</iso:assert>

			<iso:let name="begrenzing_id" value="substring($begrenzing_href,2)"/>

			<iso:assert test="key($begrenzingIndex,$begrenzing_id)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD30B: <iso:value-of select="name($ownerFeature)"/> bevat begrenzing zonder valide
verwijzing (huidige waarde : <iso:value-of select="$begrenzing_href"/>) naar <iso:value-of select="$begrenzingObjectType"/>
			</iso:assert>
		</iso:rule>


		<iso:rule context="//imro:Structuurvisieplangebied_G/imro:begrenzing |
							//imro:Structuurvisieplangebied_R/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisieplangebied), Rule 28: Structuurvisieplangebied heeft begrenzing die
				verwijst naar GeometriePlangebied van bijpassend type.

				Structuurvisieplangebied_G     begrenzing verwijst naar GeometriePlangebied
				Structuurvisieplangebied_R      begrenzing verwijst naar GeometriePlangebied
			-->
			<iso:let name="begrenzingObjectType" value="'GeometriePlangebied'"/>
			<iso:let name="begrenzingIndex" value="'GeometriePlangebied_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		 </iso:rule>

		<iso:rule context="//imro:Structuurvisieplangebied_P/imro:begrenzing">
			<!-- Structuurvisie (Structuurvisieplangebied), Rule 29: Structuurvisieplangebied_P heeft begrenzing die
				verwijst naar GeometriePlangebied_P.
			-->
			<iso:let name="begrenzingObjectType" value="'GeometriePlangebied_P'"/>
			<iso:let name="begrenzingIndex" value="'GeometriePlangebied_P_index'"/>
			<iso:extends rule="check_begrenzingen"/>
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
			<iso:let name="begrenzingObjectType" value="'GeometrieStructuurvisieObject_P'"/>
			<iso:let name="begrenzingIndex" value="'GeometrieStructuurvisieObject_P_index'"/>
			<iso:extends rule="check_begrenzingen"/>
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
			<iso:let name="begrenzingObjectType" value="'GeometrieStructuurvisieObject'"/>
			<iso:let name="begrenzingIndex" value="'GeometrieStructuurvisieObject_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		 </iso:rule>

	</iso:pattern>

	<iso:pattern name="GBBegrenzingVerwijzingenBestaan">

		<iso:rule context="//imro:Besluitsubvlak_A/imro:begrenzing |
							//imro:Besluitvlak_A/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 36: Besluit(sub)vlak_A verwijst met begrenzing naar GeometrieBesluitobject_A
				Besluitsubvlak_A     begrenzing  verwijst naar GeometrieBesluitobject_A
				Besluitvlak_A        begrenzing  verwijst naar GeometrieBesluitobject_A
			-->
			<iso:let name="begrenzingObjectType" value="'GeometrieBesluitobject_A'"/>
			<iso:let name="begrenzingIndex" value="'GeometrieBesluitobject_A_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		 </iso:rule>

		<iso:rule context="//imro:Besluitgebied_A/imro:begrenzing |
							//imro:Besluitgebied_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 37: Besluitgebied_A,_P verwijst met begrenzing naar GeometriePlangebied
				Besluitgebied_A      begrenzing verwijst naar GeometriePlangebied
				Besluitgebied_P      begrenzing verwijst naar GeometriePlangebied
			-->
			<iso:let name="begrenzingObjectType" value="'GeometriePlangebied'"/>
			<iso:let name="begrenzingIndex" value="'GeometriePlangebied_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		 </iso:rule>

		<iso:rule context="//imro:Besluitvlak_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 38: Besluitvlak_P verwijst met begrenzing naar GeometriePlangebied_P1
				Besluitvlak_P        begrenzing verwijst naar GeometrieBesluitobject_P1
			-->
			<iso:let name="begrenzingObjectType" value="'GeometrieBesluitobject_P1'"/>
			<iso:let name="begrenzingIndex" value="'GeometrieBesluitobject_P1_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		</iso:rule>

		<iso:rule context="//imro:Besluitsubvlak_P/imro:begrenzing">
			<!-- Gebiedsgerichte besluiten, Rule 39: Besluitsubvlak_P verwijst met begrenzing naar GeometriePlangebied_P3
				Besluitsubvlak_P     begrenzing verwijst naar GeometrieBesluitobject_P3
			-->
			<iso:let name="begrenzingObjectType" value="'GeometrieBesluitobject_P3'"/>
			<iso:let name="begrenzingIndex" value="'GeometrieBesluitobject_P3_index'"/>
			<iso:extends rule="check_begrenzingen"/>
		 </iso:rule>
	</iso:pattern>




	<iso:pattern name="gml_checks">

		<iso:rule context="//gml:CircleByCenterPoint">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:assert test="false" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD60: Gebruik van GML element <iso:name/> is niet toegestaan.
			Zie paragraaf 11.2 (Gedeelte "Geometrietypen en interpolatie" uit hoofdstuk 11 "GML Specificaties") uit IMRO2012.pdf.
			</iso:assert>
		</iso:rule>

		<!-- Coordinaten mogen maximaal 3 decimalen bevatten.
			Tevens moeten coordinaten in even aantal voorkomen
		-->
		<iso:rule context="//gml:posList | //gml:pos | //gml:lowerCorner | //gml:upperCorner">
			<!-- Convert all white space characters into single space characters -->

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:* | ancestor::gml:boundedBy"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:let name="coordinates" value="normalize-space(text())"/>
			<iso:let name="coords" value="substring($coordinates,1,66)"/>

			<!-- Try to tokenize the coordinates string and match every coordinate to an expression -->
  			<iso:assert test="regexp:matchesAfterTokenize($coordinates,$coordinaatFormat,$space)" diagnostics="coords identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD61A: coordinaten binnen <iso:value-of select="name()"/> moeten getallen zijn van maximaal 3 decimalen na de decimale komma, waarbij
meerdere exemplaren gescheiden zijn door lege ruimten. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>

			<iso:let name="aantal" value="regexp:tokenCount($coordinates,$space)"/>

			<iso:assert test="(2 * floor($aantal div 2) = $aantal) and ($aantal > 0)" diagnostics="coords identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD61B: coordinaten binnen <iso:value-of select="name()"/> komen niet in het juiste aantal voor.
Verwacht wordt dat dit een even aantal coordinaten ( &gt; 0 ) is, geconstateerd aantal is <iso:value-of select="$aantal"/>. Afwijking binnen element <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>.
Eerste coordinaten zijn: <iso:value-of select="$coords"/>
			</iso:assert>
		</iso:rule>

		<iso:rule context="//*[@srsName]">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:assert test="@srsName = 'urn:ogc:def:crs:EPSG::28992'" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD62A: srsName (huidige waarde "<iso:value-of select="@srsName"/>") moet gelijk zijn aan urn:ogc:def:crs:EPSG::28992.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//gml:posList | //gml:pos | //gml:lowerCorner | //gml:upperCorner">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:assert test="ancestor::*[@srsName]" diagnostics="identificatie coordsLookup">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD62B: Geen srsName aanwezig voor geometrisch element <iso:value-of select="name()"/>.
Eerste coordinaten zijn: <iso:value-of select="substring(text(),1,66)"/>
			</iso:assert>
		</iso:rule>

	<!--
		Check dat elk laagst gelegen gml-element van het type pos, posList, lowerCorner of upperCorner is,
		zolang het maar coordinaten bevat. We staan geen geometrie zonder coordinaten toe.
	 -->
		<iso:rule context="//gml:Point//gml:*[not(child::gml:*)] |
							//gml:Curve//gml:*[not(child::gml:*)] |
							//gml:Surface//gml:*[not(child::gml:*)] |
							//gml:MultiPoint//gml:*[not(child::gml:*)] |
							//gml:MultiCurve//gml:*[not(child::gml:*)] |
							//gml:MultiSurface//gml:*[not(child::gml:*)]">

			<iso:let name="otherLowestGmlType"
					value="contains('metaDataProperty,description,descriptionReference,identifier,name,radius',local-name())"/>

			<iso:let name="oneOfPermitted" value="contains('pos,posList,lowerCorner,upperCorner',local-name())"/>

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>


			<!-- Geometrical child elements need to be present here or coordinate elements. -->
			<iso:assert test="$otherLowestGmlType or $oneOfPermitted" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD70: <iso:value-of select="name()"/> is een deel van een geometrie zonder coordinaten inhoud.
			</iso:assert>
		</iso:rule>


	</iso:pattern>





	<!--
		STRI2012 paragraaf 4.2, bestandsnaamconventies
	 -->
	<iso:pattern name="Bestandsnaamconventies">

	<!-- De meest basic test. Voldoen de bestandsnamen in verwijzingen aan de STRI2012 bestandsnaamconventies ? -->
		<iso:rule abstract="true" id="algemene_bestandsnaam_check">
			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:let name="verwijzing" value="text()"/>

			<iso:let name="isAlgemeenValide" value="regexp:matches($verwijzing,$bestandsnaamRegexp)"/>

			<iso:assert test="$isAlgemeenValide" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD5A: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="text()"/>") is een bestandsnaam
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2012 voldoet.
			</iso:assert>

		</iso:rule>

		<iso:rule context="//imro:verwijzingNaarVaststellingsbesluit">

			<iso:extends rule="algemene_bestandsnaam_check"/>

			<!-- Voer onderstaande check alleen uit indien bovenstaande check slaagt -->
			<iso:assert test="not($isAlgemeenValide) or
								regexp:matches($verwijzing,$vaststellingsbesluitBestandsnaamRegexp)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD5B: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="$verwijzing"/>") is een bestandsnaam
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2012 voldoet.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//imro:IllustratieReferentie/imro:verwijzingNaarIllustratie">

			<iso:extends rule="algemene_bestandsnaam_check"/>

			<!-- Voer onderstaande check alleen uit indien bovenstaande check slaagt -->
			<iso:assert test="not($isAlgemeenValide) or
								regexp:matches($verwijzing,$illustratieBestandsnaamRegexp)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD5B: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="$verwijzing"/>") is een bestandsnaam
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2012 voldoet.
			</iso:assert>
		</iso:rule>

		<iso:rule context="//imro:verwijzingNaarTekstInfo/imro:*/imro:verwijzingNaarTekst">

			<iso:extends rule="algemene_bestandsnaam_check"/>

			<iso:let name="isBeleidBesluit" value="starts-with($verwijzing,'d_')"/>
			<iso:let name="isBijlage"  value="starts-with($verwijzing,'b_')"/>
			<iso:let name="isRegel"  value="starts-with($verwijzing,'r_')"/>
			<iso:let name="isToelichting"  value="starts-with($verwijzing,'t_')"/>
			<iso:let name="isPlanTekst" value="starts-with($verwijzing,'pt_')"/>

			<!-- Voer onderstaande check alleen uit indien bovenstaande check slaagt -->
			<iso:assert test="not($isAlgemeenValide) or
								($isBijlage and regexp:matches($verwijzing,$bijlageBestandsnaamRegexp)) or
								($isRegel and regexp:matches($verwijzing,$regelBestandsnaamRegexp)) or
								($isToelichting and regexp:matches($verwijzing,$toelichtingBestandsnaamRegexp)) or
								($isBeleidBesluit and regexp:matches($verwijzing,$beleidBesluitBestandsnaamRegexp)) or
								($isPlanTekst and regexp:matches($verwijzing,$plantextBestandsnaamRegexp))" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD5B: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="$verwijzing"/>") is een bestandsnaam
die niet aan de reguliere expressie van de bestandsnaamconventies van STRI2012 voldoet.
			</iso:assert>

			<iso:let name="isRegelToelichtingBeleidBesluit" value="($isBeleidBesluit or $isToelichting or $isRegel)"/>

			<!--
			Als er geen verwijzing naar objectgerichte tektsten aanwezig is dan is een regel/toelichting/beleid/besluit document toegestaan.
			Dit betekent dat de combinatie regel/toelichting/beleid/besluit document en verwijzing naar objectgerichte teksten verboden is.
			 -->
			<iso:assert test="not($isRegelToelichtingBeleidBesluit and $containsVerwijzingenNaarObjectgerichteTekst)">
Foutcode AD5C: <iso:value-of select="name()"/> (huidige waarde "<iso:value-of select="$verwijzing"/>") is een verwijzing naar tekst met een onverwachte prefix.
Indien er verwijzingen naar tekst voorkomen met prefix 'pt_' dan is de prefix 'r_', 't_' of 'd_' niet toegestaan en omgekeerd.
			</iso:assert>

		</iso:rule>

	</iso:pattern>



	<!-- Validatieregel controle naam bestemming (Mantis melding 3933) -->
	<iso:pattern name="Naam_bestemmingsvlak_bevat_hoofdgroep_check">

		<iso:rule context="//imro:Enkelbestemming | //imro:Dubbelbestemming">

			<iso:extends rule="check_planobjecten"/>

			<iso:let name="hoofdgroep" value="imro:bestemmingshoofdgroep"/>
			<iso:let name="hoofdgroepIsOverig" value="$hoofdgroep = 'overig'"/>
			<iso:let name="naam" value="imro:naam"/>
<!-- Reeds eerder gedefinieerd
			<iso:let name="identificatie" value="@gml:id"/>
-->
			<iso:let name="naamLowercase" value="translate($naam,$upperCase,$lowerCase)"/>
			<iso:let name="naamAfterHoofdgroep" value="substring($naam, string-length($hoofdgroep)+1)"/>

			<iso:let name="naamEndRegexp" value="' - .*'"/>

			<iso:assert test="$hoofdgroepIsOverig or
							($naamLowercase = $hoofdgroep) or
							(starts-with($naamLowercase, $hoofdgroep) and regexp:matches($naamAfterHoofdgroep,$naamEndRegexp) )" diagnostics="identificatie">
Foutcode AD14: De naam van de <iso:value-of select="name()"/> '<iso:value-of select="$identificatie"/>' (huidige waarde: '<iso:value-of select="$naam"/>') voldoet niet aan SVBP2012 paragraaf 3.3
waarin staat dat deze begint met de hoofdgroep (huidige waarde ongelijk aan 'overige': '<iso:value-of select="$hoofdgroep"/>')
eventueel gevolgd door een koppelteken ('-') met daarachter de rest van de naam.
			</iso:assert>
		</iso:rule>
	</iso:pattern>



	<!-- De onderstaande check is voor IMRO2008 versie 1.1 van toepassing -->
	<iso:pattern name="CheckGebiedsaanduidinggroepNaamMatch">

		<iso:rule context="//imro:Gebiedsaanduiding">

			<iso:extends rule="check_planobjecten"/>

			<iso:let name="gebiedsaanduidinggroep" value="imro:gebiedsaanduidinggroep" />
			<iso:let name="gebiedsaanduidingnaam" value="imro:naam" />

			<iso:assert test="(starts-with($gebiedsaanduidingnaam,'other:') and ($gebiedsaanduidinggroep='overig'))
								or
								(starts-with($gebiedsaanduidingnaam,$gebiedsaanduidinggroep))" diagnostics="identificatie">
Foutcode AD10: In gebiedsaanduiding '<iso:value-of select="@gml:id"/>' komt categorie imro:gebiedsaanduidinggroep (huidige waarde='<iso:value-of select="$gebiedsaanduidinggroep"/>')
niet overeen met imro:naam (huidige waarde='<iso:value-of select="$gebiedsaanduidingnaam"/>') volgens SVBP2012
			</iso:assert>
		</iso:rule>
	</iso:pattern>







	<iso:pattern name="VVP_Checks">

<!--
Rules AD21A and AD21B removed.
 -->

		<!-- Ga voor elke cartografieInfo na of de inhoud valide is -->
		<iso:rule context="//imro:cartografieInfo/imro:CartografieInfo">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

	<!-- Check de syntax van de symboolcode
	 -->
			<iso:let name="isValideSymboolcode" value="not(imro:symboolcode) or regexp:matches(imro:symboolcode, $VVPSymboolcodeRegexp)"/>

			<iso:assert test="$isValideSymboolcode" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD20: Element met identificatie <iso:value-of select="$identificatie"/> met cartografieInfo
heeft een symboolcode (huidige waarde '<iso:value-of select="imro:symboolcode"/>'). Deze moet beginnen met 'ES', 'AS', 'S', 'L' of 'P'
met daarachter een nummer.
			</iso:assert>

	<!-- Check het kaartnummer
	 -->
			<iso:let name="isValideKaartnummer" value="regexp:matches(imro:kaartnummer,'\d+')"/>

			<iso:assert test="$isValideKaartnummer" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD20: Element met identificatie <iso:value-of select="$identificatie"/> met cartografieInfo
heeft een kaartnummer (huidige waarde '<iso:value-of select="imro:kaartnummer"/>'). Dit veld dient een numerieke waarde te hebben.
			</iso:assert>



			<iso:let name="kaartnummer" value="imro:kaartnummer"/>
			<iso:let name="kaartnaam" value="imro:kaartnaam"/>

			<iso:let name="cartografischeInfosMetAndereKaartnaamBijNummer" value="key('VVPKaartNummersKey',$kaartnummer)[not(imro:kaartnaam = $kaartnaam)]"/>

			<!--
				XPath-2.0 expressie string-join(..) is kunstmatig gerealiseerd net als matches(..)
				wegens dat deze expressie niet bestaat in XSLT-1.0.
			 -->
			<iso:assert test="count($cartografischeInfosMetAndereKaartnaamBijNummer)=0" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD23: Element met identificatie <iso:value-of select="ancestor::*[@gml:id][1]/@gml:id"/>
bevat een kaartnummer-kaartnaam combinatie die niet uniek is wegens dat er reeds andere combinaties voorkomen.
Huidig kaartnummer='<iso:value-of select="$kaartnummer"/>'. Andere kaartnamen: <iso:value-of select="regexp:string-join($cartografischeInfosMetAndereKaartnaamBijNummer/imro:kaartnaam,' , ')"/>.
Bij een kaartnummer hoort slechts 1 kaartnaam.
			</iso:assert>

		</iso:rule>

 		<!-- Check de geometrie van de begrenzingen met de cartografischeInfo's
 			waarin symboolcodes voor deze geometrieën kunnen zitten.
 			De bedoeling is dat voor ieder geometrietype van een begrenzing er een
 			cartografischeInfo is waar een bijpassende symboolcode in zit.
 			In het geval van meerdere kaarten zijn er ook meerdere cartografischeInfo's
 			voor deze symboolcode.
 		-->
		<iso:rule context="imro:begrenzing[key('VVPCartografischeInfoMetValideSymboolCodeByGmlIdKey',parent::imro:*[@gml:id]/@gml:id) and @xlink:href]">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>

			<iso:let name="gmlId" value="parent::imro:*/@gml:id"/>
			<iso:let name="objectId" value="substring-after(@xlink:href,'#')"/>

			<iso:let name="begrenzingIsSurface" value="boolean(key('vvpBegrenzingPerGeometrieTypeSurface',$objectId))"/>
			<iso:let name="begrenzingIsLine" value="boolean(key('vvpBegrenzingPerGeometrieTypeLine',$objectId))"/>
			<iso:let name="begrenzingIsPoint" value="boolean(key('vvpBegrenzingPerGeometrieTypePoint',$objectId))"/>


			<iso:let name="cartografischeInfosVoorGeometrieSurface"
					value="key('VVPCartografischeInfosPerGeometrieTypeSurfaceByGmlId',$gmlId)"/>

			<iso:let name="cartografischeInfosVoorGeometrieLine"
					value="key('VVPCartografischeInfosPerGeometrieTypeLineByGmlId',$gmlId)"/>

			<iso:let name="cartografischeInfosVoorGeometriePoint"
					value="key('VVPCartografischeInfosPerGeometrieTypePointByGmlId',$gmlId)"/>

			<iso:let name="geometrieKomtOvereenMetCartografischeInfo"
					value="(not($begrenzingIsSurface) or $cartografischeInfosVoorGeometrieSurface) and
							(not($begrenzingIsLine) or $cartografischeInfosVoorGeometrieLine) and
							(not($begrenzingIsPoint) or $cartografischeInfosVoorGeometriePoint)" />


			<!-- Test geometrie. Er dient minstens 1 cartografischeInfo te zijn met de bijbehorende symboolcode -->
			<iso:assert test="$geometrieKomtOvereenMetCartografischeInfo" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode AD25: Element <iso:value-of select="name(parent::imro:*)"/>
bevat een begrenzing (xlink:href="<iso:value-of select="$objectId"/>") die naar een object met een geometrie verwijst die niet
voorkomt in de symboolcodes van de aanwezige cartografischeInfo (huidige waarde: "<iso:value-of select="regexp:string-join(../imro:cartografieInfo/imro:CartografieInfo/imro:symboolcode,' , ')"/>").
Geometrie waarnaar verwezen wordt bevat: Surfaces: <iso:value-of select="$begrenzingIsSurface"/>, Lines: <iso:value-of select="$begrenzingIsLine"/>, Points: <iso:value-of select="$begrenzingIsPoint"/>.
			</iso:assert>

		</iso:rule>

		<!-- TODO: Er dient ook nog of een of andere manier gevalideerd te worden dat iedere symboolcode overeekomt met een geometrie.
		Onbekend is of hierbij ook kind-geometrieën (ouder=besluitvlak, kind=besluitsubvlak) meegenomen dienen te worden of niet.
		 -->

	</iso:pattern>

	<iso:pattern name="overige_planobjecten_en_plangebieden">

		<!-- Overige plangebieden -->
		<iso:rule context="//imro:*[imro:typePlan]">
			<iso:extends rule="check_plangebieden"/>

			<!-- check if the typePlan and overheid are okay -->
			<iso:let name="detectedPlanType" value="//*[imro:typePlan]/imro:typePlan"/>
			<iso:let name="beleidsmatigVerantwoordelijkeOverheid" value="//*[imro:beleidsmatigVerantwoordelijkeOverheid]/imro:beleidsmatigVerantwoordelijkeOverheid"/>
			<iso:let name="isAanwijzingsbesluit" value="$detectedPlanType ='aanwijzingsbesluit'"/>
			<iso:let name="isGemeentelijk" value="$beleidsmatigVerantwoordelijkeOverheid='gemeentelijke overheid'"/>
			
			<!-- assertions: -->
			<iso:assert test="not($isAanwijzingsbesluit and $isGemeentelijk)">
                (Planobject gml:id = <iso:value-of select="$identificatie"/>)
                Foutcode AD26: Het plantype aanwijzingsbesluit kan niet door een Gemeentelijke overheid gepubliceerd worden.
		   </iso:assert>

		</iso:rule>

		<!-- Overige planobjecten ongelijk plangebieden -->
		<iso:rule context="//imro:*[imro:typePlanobject and not(imro:typePlan)]">

			<iso:extends rule="check_planobjecten"/>
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
	
	<!-- BEGIN Validaties t.b.v. Tijdelijke Alternatieve Maatregel Uitgebreid c.q. Overgangsrecht Omgevingswet -->
	<iso:let name="identificatie" value="@gml:id"/>
	<iso:pattern id="OwTAMuitgebreid">
		
		<iso:rule context="//imro:Bestemmingsplangebied[//imro:typePlan = 'bestemmingsplan']">
			
			<!-- Blokkeren BESTEMMINGSPLAN met status niet zijnde VASTGESTELD of GECONSOLIDEERD of naam begint niet met TAM-OMGEVINGSPLAN -->
			<!-- Na 2024-01-01 is van object Bestemmingsplangebied met typePlan 'bestemmingsplan' de planstatus 'vastgesteld' of 'geconsolideerd' of de naam begint met 'TAM-omgevingsplan ' -->
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and
				(
				(
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' 
				or 
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'geconsolideerd'
				)
				or
				starts-with(imro:naam, 'TAM-omgevingsplan ')
				)
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101                    
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in planstatus -> Als typePlan is 'bestemmingsplan' en datum is groter dan of gelijk aan 2024-01-01, 
				dan moet planstatus zijn 'vastgesteld' of 'geconsolideerd', tenzij naam begint met 'TAM-omgevingsplan '.
			</iso:assert>
		</iso:rule>
		
		<!-- Blokkeren INPASSINGSPLAN als status ongelijk aan 'vastgesteld', tenzij TAM-INPASSINGSPLAN-->
		<!-- Na 2024-01-01 begint object Bestemmingsplangebied met typePlan 'inpassingsplan' de naam met 'TAM-projectbesluit ' -->
		<iso:rule
			context="//imro:Bestemmingsplangebied[//imro:typePlan = 'inpassingsplan']">
			<iso:assert
				test="                
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and 
				(
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' 
				or 
				starts-with(imro:naam, 'TAM-projectbesluit ')
				)
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101                    
				">
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'inpassingsplan' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'inpassingsplan', tenzij naam begint met 'TAM-projectbesluit '.
			</iso:assert>
		</iso:rule>
		
		
		<!-- Blokkeren UITWERKINGSPLAN en WIJZIGINGSPLAN met status ONTWERP-->
		<!-- Na 2024-01-01 is van object Bestemmingsplangebied met typePlan 'uitwerkingsplan' of 'wijzigingsplan' de planstatus niet 'ontwerp'-->
		<iso:rule
			context="//imro:Bestemmingsplangebied[//imro:typePlan = 'uitwerkingsplan' or //imro:typePlan = 'wijzigingsplan']">
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and 
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101                    
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in planstatus -> Als typePlan is 'uitwerkingsplan' of 'wijzigingsplan' en datum is groter dan of gelijk aan 2024-01-01, 
				dan moet planstatus zijn 'vastgesteld'.
			</iso:assert>
		</iso:rule>
		
		<!-- Blokkeren AMVB en REGELING -->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_A typePlan niet zijn 'amvb' of 'regeling'-->
		<iso:rule context="//imro:Besluitgebied_A[imro:typePlan = 'amvb' or imro:typePlan = 'regeling']">
			<iso:assert
				test="
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'amvb' of 'regeling' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'amvb' of 'regeling'.
			</iso:assert>
		</iso:rule>
		
		<!-- Blokkeren PROVINCIALE VERORDENING, tenzij TAM-PROVINCIALE VERORDENING-->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_P typePlan niet zijn 'provinciale verordening'-->
		<iso:rule context="//imro:Besluitgebied_P[//imro:typePlan = 'provinciale verordening']">
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20240101 
				and 
				starts-with(imro:naam, 'TAM-omgevingsverordening ')
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'provinciale verordening' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'provinciale verordening', tenzij naam begint met 'TAM-omgevingsverordening '.
			</iso:assert>
		</iso:rule>
		
		
		<!-- Blokkeren REACTIEVE AANWIJZING, tenzij TAM-REACTIEVE AANWIJZING-->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'reactieve aanwijzing', tenzij naam begint met 'TAM-reactieve interventie  '-->
		<iso:rule
			context="//imro:Besluitgebied_X[//imro:typePlan = 'reactieve aanwijzing']">
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and 
				starts-with(imro:naam, 'TAM-reactieve interventie ')
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'reactieve aanwijzing' en datum is groter dan of gelijk aan 2024-01-01,  
				dan mag typePlan niet zijn 'reactieve aanwijzing', tenzij naam begint met 'TAM-reactieve interventie '.
			</iso:assert>
		</iso:rule>
		
		<!-- Blokkeren BEHEERSVERORDENING-->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'beheersverordening'-->
		<iso:rule
			context="//imro:Besluitgebied_X[//imro:typePlan = 'beheersverordening']">
			<iso:assert
				test="(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101
				and 
				starts-with(imro:naam, 'Chw bestemmingsplan ')
				and
				(
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'
				or                            
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'geconsolideerd'
				)
				)
				or                    
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'beheersverordening' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'beheersverordening', tenzij naam begint met 'Chw bestemmingsplan ' en status is gelijk aan 'vastgesteld' of 'geconsolideerd'.
			</iso:assert>
		</iso:rule>
		
		<!-- Blokkeren VOORBEREIDINGSBESLUIT, tenzij TAM-Voorbereidingsbesluit-->
		<!-- Na 2024-01-01 is voor objecttype Besluitgebied_X typePlan niet 'voorbereidingsbesluit' of naam begint met 'TAM-voorbereidingsbesluit'-->
		<iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'voorbereidingsbesluit']">
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and 
				starts-with(imro:naam, 'TAM-voorbereidingsbesluit ')
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typeplan is 'voorbereidingsbesluit' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'voorbereidingsbesluit', tenzij naam begint met 'TAM-voorbereidingsbesluit '.
			</iso:assert>
		</iso:rule>
		
		
		<!-- Blokkeren EXPLOITATIEPLAN met status ONTWERP, CONCEPT, VOORONTWERP -->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_X met typePlan 'exploitatieplan' niet hebben status 'ontwerp', 'concept' of 'voorontwerp'-->
		<iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'exploitatieplan']">
			<iso:assert
				test="
				(
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
				and 
				(
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp' 
				and 
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'concept' 
				and 
				imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'voorontwerp'
				)
				)
				or
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				">
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in planstatus -> Als typePlan is 'exploitatieplan' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag planstatus niet zijn 'ontwerp', 'concept' of 'voorontwerp'.
			</iso:assert>
		</iso:rule>	
		
		<!-- Blokkeren STRUCTUURVISIE-->
		<!-- Na 2024-01-01 mag voor objecttype Structuurvisieplangebied_G typePlan niet zijn 'structuurvisie'-->
		<iso:rule context="//imro:Structuurvisieplangebied_G[imro:typePlan = 'structuurvisie']">
			<iso:assert
				test="                
				number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'structuurvisie' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'structuurvisie'. 
			</iso:assert>
		</iso:rule>
		
		<!-- LET OP: IMRO2008 -->
		<!-- UPDATE: 2022-10-12 -->
		<!-- Blokkeren PROJECTBESLUIT en TIJDELIJK ONTHEFFING BUITENPLANS-->
		<!-- Na 2024-01-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'-->
		<!--<iso:rule context="//imro2008:Besluitgebied_X[//imro2008:typePlan = 'projectbesluit' or //imro2008:typePlan = 'tijdelijke ontheffing buitenplans']">
			<iso:assert
				test="               
				number(translate(imro2008:planstatusInfo/imro2008:PlanstatusEnDatum_XGB/imro2008:datum, '-', '')) &lt; 20240101
				"> 
				IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
				type = <iso:value-of select="name()"/>: 
				Fout in typePlan -> Als typePlan is 'projectbesluit' of 'tijdelijke ontheffing buitenplans' en datum is groter dan of gelijk aan 2024-01-01, 
				dan mag typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'.
			</iso:assert>
		</iso:rule>-->
		
		
		
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
		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
		<iso:diagnostic id="identificatieLookup"><iso:value-of select="ancestor::imro:*/@gml:id"/></iso:diagnostic>

		<iso:diagnostic id="coords"><iso:value-of select="$coords"/></iso:diagnostic>
		<iso:diagnostic id="coordsLookup"><iso:value-of select="substring(normalize-space(text()),1,66)"/></iso:diagnostic>

		<iso:diagnostic id="warning"></iso:diagnostic>
	</iso:diagnostics>


</iso:schema>
