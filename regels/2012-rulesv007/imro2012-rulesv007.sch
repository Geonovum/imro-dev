<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: imro2012-rulesv005.sch
 *
 * (C) Logica, 2011
 *
 *
 * Info:
 * Schematron Validation Document for IMRO2012
 *
 * History:
 * 01-10-2011   RD  Initial version for IMRO2012 version 0.0.1
 * 13-12-2011   RD  Bugfixes
 * 18-01-2012   RD  Rule changes for IMRO2012 version 1.0.0.
 *                  Change of imro namespace: http://www.geonovum.nl/imro2012  ===> http://www.geonovum.nl/imro/2012/1.0
 *                  Constraint a5 (rule RPA5): only alphanumerical characters permitted
 *					Constraint a7 (rule RPA7): lokaalId 32 chars permitted and special characters
 *                  Constraints b5, b6, b25, c1, c6, e1 removed => Rule RPA16A, RPA16B and RPA16C removed.
 *                  Constraint b1, b7, b26, c2, c7, e2, e7, e11, e14, e21, e22 now dependent on imro:verwijzingNorm field 
 *                     in plangebied => Rules RPA20A, RPA20B, RPA20C, RPA20D depend on this field, Rule RPA20E added to 
 *                     check for usage of pt_ prefix when imro:verwijzingNorm='IMROPT2012'.
 *                  Constraints b3, b8 removed => Rule RPA23 removed.
 *                  Constraint b13 adapted => Rule BP4 adapted, made conditional depending on plan type.
 *                  Constraint b19, b20, b21, b22 adapted => Rule BP8A, BP8B: conditional depending on plan type
 *                  Constraint c13 adapted, also applicable for StructuurvisieComplex_R => Rule SV1 also applied 
 *                     to context //imro:StructuurvisieComplex_R.
 *                  Constraint c14 added => Rule CIN1 added about imro:CartografieInfo and the content of imro:kaartnummer 
 *                  Rule GB1 fixed, changed error message because the rule is also suitable to validate constraint e6.
 *                  Constraint e28 added: Besluitsubvlak verwijst naar besluitvlak of Besluitsubvlak => Rule GB6 added.
 *                  Constraint bb1 added: Attribuut locatieNaam verplicht indien naamOverheid is anders dan gemeente => Rule BP9 added.
 *                  Constraint bb2 added: Attribuut verwijzingNaarExternPlanInfo verplicht bij uitwerkingsplan, wijzigingsplan => Rule BP10 added.
 * 14-03-2012   RD  Constraint bb1,e20 changed: Relatie tussen attribuut beleidsmatigVerantwoordelijkeOverheid en 
 *                      attributen naamOverheid en locatieNaam. => Rule BP9 and GB1 adapted.
 *                  Constraint bb3 added: Indien verwijzingNorm een waarde PRABPK2012 heeft dan is bij maatvoering opname 
 *                      van de symboolcode verplicht en andersom. => Rule BP11 added.
 *                  Constraint ee1 added: Relatie tussen besluittype en teksttype. => Rule GB7 added.
 * 20-06-2012   RD  Constraint bb3 changed: symboolCode starting with 'other: ' not permitted when verwijzingsNorm contains 'PRABPK2012'. Rule BP11 adapted.
 *                  Constraints b1, c2, e2, e7, e11, e14, e17, e21, e22 changed: documents of type 'bijlage...' may optionally 
 *                      use the pt_ prefix when verwijzingsNorm IMROPT2012 is present. Rule RPA20E adapted.   
 *                      Constraints b26 and c7 not modified but functionality not affected by changed rule. 
 *                  Rule RPA20A, RPA20B, RPA20C, RPA20D, RPA20E changed: Error message also contains the presence of the IMROPT2012 verwijzingNorm field.
 *                  Constraint ee1 changed: Shuffling of plan types corresponding to documents. Rule GB7 changed.
 * 27-08-2012   RD  Rule GB7 (constraint ee1) bugfix because not completely up to date.
 *
 ******************************************************************************/

Opmerkingen / hints:

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xml:lang="en">  <!-- ISO Schematron 1.6 namespace -->

	<!-- <iso:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/> -->
	<iso:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
	<iso:ns prefix="nen3610" uri="http://www.ravi.nl/nen3610"/>
	<iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2012/1.1"/>
	<iso:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
	<iso:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
	

	<iso:let name="lowercaseChars" value="'abcdefghijklmnopqrstuvwxyz'"/>
	<iso:let name="uppercaseChars" value="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<iso:let name="numericalChars" value="'0123456789'"/>
	<iso:let name="extraLokaalIDChars" value="'_-.,'"/>
	
	<iso:let name="alphanumericalChars" value="concat($lowercaseChars,$uppercaseChars,$numericalChars)"/>
	<iso:let name="permitted_lokaalID_chars" value="concat($alphanumericalChars,$extraLokaalIDChars)"/>
			
	
	
	<!-- detectedPlanId is nodig voor validatie van verwijzingen naar tekst: planId moet in bestandsnaam voorkomen. -->
	<iso:let name="detectedPlanId" value="//*[imro:typePlan]/@gml:id"/>
	<iso:let name="detectedPlanType" value="//*[imro:typePlan]/imro:typePlan"/>
	
	<iso:let name="isObjectgerichteTekst" value="boolean(//*[imro:verwijzingNorm='IMROPT2012'])"/>
	<iso:let name="isAnaloogBestemmingsplanKaart" value="boolean(//*[imro:verwijzingNorm='PRABPK2012'])"/>
	<iso:let name="verwijzingsnormen" value="concat(//imro:verwijzingNorm[1],' ',//imro:verwijzingNorm[2],' ',//imro:verwijzingNorm[3])"/>
	
	<iso:let name="terVervangingVanExternPlan" 
		value="boolean(//imro:verwijzingNaarExternPlanInfo/imro:ExternPlanReferentie_BP[imro:rolExternPlan='ter vervanging van extern plan'])"/>

	<iso:let name="isInpassingsplan" value="$detectedPlanType = 'inpassingsplan'"/>
	<iso:let name="isWijzigingsplan" value="$detectedPlanType = 'wijzigingsplan'"/>
	
	
	<!-- Indexering. -->
<!-- 
	<xsl:key name="GeometriePlangebied_index" match="//imro:GeometriePlangebied" use="@gml:id" />
	<xsl:key name="GeometriePlangebied_P_index" match="//imro:GeometriePlangebied_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_P_index" match="//imro:GeometrieStructuurvisieObject_P" use="@gml:id" />
	<xsl:key name="GeometrieStructuurvisieObject_index" match="//imro:GeometrieStructuurvisieObject" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_A_index" match="//imro:GeometrieBesluitobject_A" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P1_index" match="//imro:GeometrieBesluitobject_P1" use="@gml:id" />
	<xsl:key name="GeometrieBesluitobject_P3_index" match="//imro:GeometrieBesluitobject_P3" use="@gml:id" />
-->
	<xsl:key name="Bestemmingsplangebied_index" match="//imro:Bestemmingsplangebied" use="@gml:id" />
	
	<xsl:key name="Bestemmingsvlak_index" match="//imro:Enkelbestemming | //imro:Dubbelbestemming" use="@gml:id" />

	<xsl:key name="Gebiedsaanduiding_index" match="//imro:Gebiedsaanduiding" use="@gml:id"/>
	<xsl:key name="Bouwvlak_index" match="//imro:Bouwvlak" use="@gml:id"/>
<!-- 
	<xsl:key name="Functieaanduiding_index" match="//imro:Functieaanduiding" use="@gml:id"/>
	<xsl:key name="Bouwaanduiding_index" match="//imro:Bouwaanduiding" use="@gml:id"/>
	<xsl:key name="Maatvoering_index" match="//imro:Maatvoering" use="@gml:id"/>
	<xsl:key name="Figuur_index" match="//imro:Figuur" use="@gml:id"/>
-->

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

	<xsl:key name="Structuurvisiecomplex_P_index" match="//imro:Structuurvisiecomplex_P" use="@gml:id"/>
<!-- 
	<xsl:key name="Structuurvisiegebied_P_index" match="//imro:Structuurvisiegebied_P" use="@gml:id"/>
	<xsl:key name="Structuurvisieverklaring_P_index" match="//imro:Structuurvisieverklaring_P" use="@gml:id"/>
-->
	<xsl:key name="Structuurvisiegebied_verklaring_P_index" match="//imro:Structuurvisiegebied_P | 
																	//imro:Structuurvisieverklaring_P" use="@gml:id"/>
	
	<xsl:key name="Structuurvisiecomplex_G_index" match="//imro:Structuurvisiecomplex_G" use="@gml:id"/>
	<xsl:key name="Structuurvisiegebied_G_index" match="//imro:Structuurvisiegebied_G" use="@gml:id"/>

	<xsl:key name="Structuurvisiegebied_R_index" match="//imro:Structuurvisiegebied_R" use="@gml:id"/>
	<xsl:key name="Structuurvisiecomplex_R_index" match="//imro:Structuurvisiecomplex_R" use="@gml:id"/>


<!--
Veronderstellingen:

Een plangebied in het algemeen wordt herkend door de aanwezigheid van het element imro:typePlan.

Een planobject kan herkend worden door de aanwezigheid van het element imro:typePlanobject.

Een planobject dat geen plangebied is kan herkend worden door de aanwezigheid van het 
element imro:typePlanobject en de afwezigheid van imro:typePlan.

Een bestemmingsvlak is altijd een Enkelbestemming of Dubbelbestemming (volgens de IMRO2012.XSD definitie).

Een gml:id van een plangebied is gelijk aan imro:namespace+'.'+imro:lokaalID+'-'+imro:versie
Een gml:id van een planobject (ongelijk plangebied) is gelijk aan imro:namespace+'.'+imro:lokaalID

 -->


<!--
Ruimtelijk Plan Algemeen:
-->


	
	<iso:pattern name="algemene_tellingen">


		<iso:rule context="/">

		<!-- a1: Minimaal en maximaal 1 object plangebied per bestand
			context IMRO2012::Plangebied
			inv PlangebiedMax1: Plangebied::allInstances() -> size() = 1
			
			Commentaar: Een plangebied is herkenbaar aan de aanwezigheid van een imro:typePlan element
		-->
			<iso:let name="aantalPlangebieden" value="count(//imro:*[imro:typePlan])"/>
			
			<iso:assert test="$aantalPlangebieden = 1">
Foutcode RPA1: Er moet exact 1 plangebied aanwezig zijn (aantal = <iso:value-of select="$aantalPlangebieden"/>)
            Zie constraint a1 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
			<iso:let name="aantalMetadataIMRObestanden" value="count(//imro:MetadataIMRObestand)"/>
			
		<!-- a2: Minimaal en maximaal 1 object MetadataIMRObestand
			context IMRO2012:: MetadataIMRObestand
			inv MetadataMax1: MetadataIMRObestand::allInstances() -> size() = 1
		-->
			<iso:assert test="$aantalMetadataIMRObestanden = 1">
Foutcode RPA2: Er moet exact 1 MetadataIMRObestand aanwezig zijn (aantal = <iso:value-of select="$aantalMetadataIMRObestanden"/>)
            Zie constraint a2 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
			<iso:let name="cartografieInfo" value="//imro:cartografieInfo/imro:CartografieInfo"/>
			<iso:let name="aantalKaartnummers1" value="count($cartografieInfo[imro:kaartnummer='1'])"/>
			<iso:let name="aantalKaartnummers0" value="count($cartografieInfo[imro:kaartnummer='0'])"/>
			
			<iso:assert test="not($cartografieInfo) or (($aantalKaartnummers1 &gt; 0) and ($aantalKaartnummers0 = 0))">
Foutcode CIN1: CartografieInfo, indien gebruikt is er altijd een kaart met nummer 1 (huidig aantal: <iso:value-of select="$aantalKaartnummers1"/>). Nummer 0 mag niet voorkomen (huidig aantal: <iso:value-of select="$aantalKaartnummers0"/>).
			Zie constraint c14 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>


	</iso:pattern>


	<iso:pattern name="coordinaten_verplicht_rijksdriehoek">
		<!-- a11,f1: Coordinaatreferentiesysteem is verplicht Rijksdriehoeksstelsel
			context IMRO2012::MetadataIMROBestand
			inv EPSGCode: self.codeReferentiesysteem = '28992'
		 -->
		<iso:rule context="//imro:MetadataIMRObestand">
			<iso:let name="coordsystem" value="imro:codeReferentiesysteem"/>
			
			<iso:assert test="$coordsystem = '28992'">
Foutcode RPA11: Coordinaatreferentiesysteem is verplicht Rijksdriehoeksstelsel. 
De waarde van element imro:MetadataIMRObestand/imro:codeReferentiesysteem (huidige waarde: '<iso:value-of select="$coordsystem"/>') moet gelijk zijn aan '28992'.
			Zie constraint a11 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>


	
	<iso:pattern name="namespace_Startswith_NL.IMRO">
		<!-- a3: Het attribuut namespace heeft altijd de waarde NL.IMRO
		
			context IMRO2012::NEN3610ID
			inv ObjectNamespace: self.namespace = 'NL.IMRO'
		-->
		
		<iso:rule context="//imro:*/imro:identificatie">
			
			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>
			
			<iso:let name="namespace" value="imro:NEN3610ID/imro:namespace"/>

			<iso:assert test="$namespace='NL.IMRO'" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode RPA3: Het attribuut namespace heeft altijd de waarde NL.IMRO (huidige waarde: '<iso:value-of select="$namespace"/>')
            Zie constraint a3 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	
	<iso:pattern name="plangebied_checks">

		<iso:rule abstract="true" id="check_plangebied">
			<iso:let name="identificatie" value="@gml:id"/>
			<iso:let name="namespace" value="imro:identificatie/imro:NEN3610ID/imro:namespace"/>
			<iso:let name="lokaalID" value="imro:identificatie/imro:NEN3610ID/imro:lokaalID"/>
			<iso:let name="versie" value="imro:identificatie/imro:NEN3610ID/imro:versie"/>

	<!--
	Ruimtelijk Plan Algemeen: a4, a5, a8, a10
	-->

		<!-- a4: Maximale lengte van de lokaalID van een plangebied is 23 tekens.
		
			context IMRO2012::Plangebied
			inv PlangebiedLokaalIDMaxChar: self.identificatie.NEN3610ID.lokaalID.size() < 24

			toelichting: format = [0-9]{4}\.[A-Za-z0-9]{1,18}
		-->
			<iso:assert test="string-length($lokaalID) &lt; 24" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA4: Maximale lengte van de lokaalID van een plangebied is 23 tekens (huidige waarde ='<iso:value-of select="$lokaalID"/>', lengte = <iso:value-of select="string-length($lokaalID)"/>)
            Zie constraint a4 van IMRO2012.pdf paragraaf 8.4. 
			</iso:assert>

		<!-- a5: Attribuut versie bestaat verplicht uit 4 alfanumerieke tekens.
			context IMRO2012::Plangebied
			
			inv PlangebiedVersieAantalEnTypeChar:let allowedChar: Set = Set{'A'..'Z', 'a'..'z', '0'..'9'}
			
			in self.identificatie.NEN3610ID.versie->forAll (char | allowedChar->exists( char ))and
			self.identificatie.NEN3610ID.versie.size() = 4
			
			toelichting: format = [A-Za-z0-9]{4}
		-->
			<iso:let name="illegale_karakters" value="translate($versie,$alphanumericalChars,'')"/>
		
			<iso:assert test="(string-length($versie) = 4) and ($illegale_karakters='')" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA5: Attribuut versie bestaat verplicht uit 4 alfanumerieke tekens (huidige waarde ='<iso:value-of select="$versie"/>', lengte = <iso:value-of select="string-length($versie)"/>)
            Zie constraint a5 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		<!-- a8: Plangebieden hebben verplicht het attribuut versie in de NEN3610ID
			context IMRO2012::Plangebied
			inv PlangebiedVersieVerplicht: self.identificatie.NEN3610ID.versie.notEmpty()
		-->
			<iso:assert test="($versie)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA8: Plangebieden hebben verplicht het attribuut versie in de NEN3610ID
            Zie constraint a8 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		<!-- a10: CBS-code bronhouder verwerkt in identificatiecode. 
			context IMRO2012::Plangebied
			inv PlangebiedIdnCBSCode: self.identificatie.NEN3610ID.lokaalID.substring(1,4) = self.overheidsCode
		 -->
			<iso:let name="overheidscode" value="imro:overheidsCode"/>
			
			<iso:assert test="substring($lokaalID,1,4) = $overheidscode" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA10: CBS-code bronhouder moet in identificatiecode van het plangebied. (Huidige CBS-code in identificatiecode = '<iso:value-of select="substring($lokaalID,1,4)"/>', huidige overheidsCode = '<iso:value-of select="$overheidscode"/>'.
            Zie constraint a10 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		<!-- b4,c5,e5,e13,e19: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en
			verplicht indien planstatus vastgesteld
		-->
			 <iso:let name="planstatus" value="imro:planstatusInfo//imro:planstatus"/>
			 <iso:let name="besluitnummerVerplicht" value="$planstatus = 'vastgesteld'" />

			<!-- NOTE: leeg element telt ook als niet ingevuld element. text() check vangt dit correct af -->
			 <iso:let name="besluitnummerEnVerwijzingEmpty" value="not(imro:besluitnummer/text()) and not(imro:verwijzingNaarVaststellingsbesluit/text())" />
			 <iso:let name="besluitnummerEnVerwijzingNotEmpty" value="(imro:besluitnummer/text()) and (imro:verwijzingNaarVaststellingsbesluit/text())"/>

			 <iso:assert test="($besluitnummerVerplicht and $besluitnummerEnVerwijzingNotEmpty) or (not($besluitnummerVerplicht) and $besluitnummerEnVerwijzingEmpty)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA15: Attribuut besluitnummer en verwijzingNaarVaststellingsbesluit alleen toegestaan en verplicht vanaf planstatus = vastgesteld of onherroepelijk. (Huidige waarde planstatus: <iso:value-of select="$planstatus"/>)
            Zie constraint b4, c5, e5, e13, e19 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			 </iso:assert>

		</iso:rule>


		<iso:rule abstract="true" id="check_planobjecten">
		
			<iso:let name="identificatie" value="@gml:id"/>
			<iso:let name="namespace" value="imro:identificatie/imro:NEN3610ID/imro:namespace"/>
			<iso:let name="lokaalID" value="imro:identificatie/imro:NEN3610ID/imro:lokaalID"/>
			<iso:let name="versie" value="imro:identificatie/imro:NEN3610ID/imro:versie"/>

		<!-- a7: Maximale lengte van de lokaalID van een planobject is 32 tekens en toegestane tekens
			context IMRO2012::Planobject
			
			inv PlanobjectLokaalIDMaxCharEnTypeTekens:
			let allowedChar: Set = Set{'A'..'Z', 'a'..'z', '0'..'9', '_', '-' '.', ','}
			
			in self.lokaalID.element->forAll (char | allowedChar->exists( char ))
			and
			self.identificatie.NEN3610ID.lokaalID.size() < 33
		-->
			<iso:let name="illegale_karakters" value="translate($lokaalID,$permitted_lokaalID_chars,'')"/>
		
			<iso:assert test="(string-length($lokaalID) &lt; 33) and ($illegale_karakters='')" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA7: Maximale lengte van de lokaalID van een planobject is 32 tekens en toegestane tekens (huidige waarde ='<iso:value-of select="$lokaalID"/>', lengte = <iso:value-of select="string-length($lokaalID)"/>, aantal gevonden niet toegestane tekens = <iso:value-of select="string-length($illegale_karakters)"/>). 
Toegestane tekens: "<iso:value-of select="$permitted_lokaalID_chars"/>".
            Zie constraint a7 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
		<!-- a9: Planobjecten hebben geen versie attribuut in de NEN3610ID
			context IMRO2012::Planobject
			inv PlanobjectGeenVersie: self.identificatie.NEN3610ID.versie.isEmpty()
		-->
			<iso:assert test="not($versie)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode RPA9: Planobjecten hebben geen versie attribuut in de NEN3610ID
            Zie constraint a9 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
		</iso:rule>
		
		
		<!-- bb1: Relatie tussen attribuut beleidsmatigVerantwoordelijkeOverheid en attributen naamOverheid en locatieNaam.
			Context: IMRO2012::Bestemmingsplangebied
			
			Inv locatieNaamVerplicht_naamOverheid:
			*/gemeente/*
			*/ naamOverheid 1 maal/*
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_BP:: gemeentelijke overheid implies
			self.naamOverheid -> size() = 1
			and
			*/deelgemeente/*
			*/naamOverheid 1 maal*/
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_BP:: deelgemeente/stadsdeel implies
			self.naamOverheid -> size() = 1
			*/provinciale overheid/*
			*/naamOverheid 1 maal, locatieNaam verplicht*/
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_BP:: provinciale overheid implies
			self.naamOverheid -> size() = 1 and self.locatieNaam -> notEmpty()
			and
			*/nationale overheid/*
			*/naamOverheid 1 of meer, locatieNaam verplicht*/
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_BP:: nationale overheid
			implies
			self.locatieNaam -> notEmpty()


			e6: Attribuut locatieNaam is verplicht indien attribuut beleidsmatigVerantwoordelijkeOverheid = provinciale - of nationale overheid 
			
			Context: IMRO2012::Besluitgebied_P
			Inv LocatienaamVerplichtP:
			self.beleidsmatigVerantwoordelijkeOverheid = Overheden_P::provinciale overheid or
			self.beleidsmatigVerantwoordelijkeOverheid = Overheden_P::nationale overheid
			110 Informatiemodel Ruimtelijke Ordening 2012 versie 1.01
			implies
			self.locatieNaam -> notEmpty()			

			
			Deze regel overlapt geheel met de nieuwe regel e20 en met regel bb1. Alleen de context is anders.
			
			e20: Relatie tussen attribuut beleidsmatigVerantwoordelijkeOverheid en attributen naamOverheid en locatieNaam.
			
			Inv locatieNaamVerplicht_naamOverheid:
			*/gemeente/*
			*/naamOverheid 1 maal/*
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_XGB:: gemeentelijke overheid implies
			self.naamOverheid -> size() = 1
			and
			*/deelgemeente/*
			*/naamOverheid 1 maal/*
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_XGB:: deelgemeente/stadsdeel implies
			self.naamOverheid -> size() = 1
			*/provinciale overheid/*
			*/naamOverheid 1 maal, locatieNaam verplicht/*
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_XGB:: provinciale overheid implies
			self.naamOverheid -> size() = 1 and self.locatieNaam -> notEmpty()
			and
			*/nationale overheid/*
			*/naamOverheid 1 of meer, locatieNaam verplicht/*
			118 Informatiemodel Ruimtelijke Ordening 2012 versie 1.01
			self. beleidsmatigVerantwoordelijkeOverheid = Overheden_XGB:: nationale overheid
			implies
			self.locatieNaam -> notEmpty()
			
			
			Deze regel is geheel identiek aan bb1 in de uitvoering, alleen de context is anders.

			Verondersteld wordt dat variable $foutcode gevuld is met de te produceren foutcode (BP9 of GB1, afhankelijk van de context).
		 -->
		<iso:rule abstract="true" id="check_bb1_e6_e20">

	 		<iso:let name="beleidsmatigVerantwoordelijkeOverheid" value="imro:beleidsmatigVerantwoordelijkeOverheid"/>

	 		<iso:let name="hasLocatieNaam" value="boolean(imro:locatieNaam)"/>
	 		<iso:let name="aantalNaamOverheid" value="count(imro:naamOverheid)"/>
	 		
	 		<iso:let name="isNationaleOverheid" value="contains('nationale overheid',$beleidsmatigVerantwoordelijkeOverheid)"/>
	 		<iso:let name="isProvincialeOverheid" value="contains('provinciale overheid',$beleidsmatigVerantwoordelijkeOverheid)"/>
	 		<iso:let name="isGemeentelijkeOverheid" value="contains('gemeentelijke overheid,deelgemeente/stadsdeel',$beleidsmatigVerantwoordelijkeOverheid)"/>
	 		
			<iso:assert test="not($isGemeentelijkeOverheid) or ($aantalNaamOverheid=1)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode <iso:value-of select="$foutcode"/>: Attribuut naamOverheid moet verplicht 1x voorkomen (huidig aantal: <iso:value-of select="$aantalNaamOverheid"/>) 
indien beleidsmatigVerantwoordelijkeOverheid (huidige waarde: <iso:value-of select="$beleidsmatigVerantwoordelijkeOverheid"/>) gelijk aan 'gemeentelijke overheid' of 'deelgemeente/stadsdeel'.
			Zie constraint bb1, e20 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="not($isProvincialeOverheid) or ($aantalNaamOverheid=1 and $hasLocatieNaam)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode <iso:value-of select="$foutcode"/>: Attribuut naamOverheid moet verplicht 1x voorkomen (huidig aantal: <iso:value-of select="$aantalNaamOverheid"/>) 
en attribuut locatieNaam moet verplicht aanwezig zijn (aanwezig: <iso:value-of select="$hasLocatieNaam"/>) 
indien beleidsmatigVerantwoordelijkeOverheid (huidige waarde: <iso:value-of select="$beleidsmatigVerantwoordelijkeOverheid"/>) gelijk aan 'provinciale overheid'.
			Zie constraint bb1, e6, e20 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
	 		
			<iso:assert test="not($isNationaleOverheid) or ($hasLocatieNaam)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode <iso:value-of select="$foutcode"/>: Attribuut locatieNaam moet verplicht aanwezig zijn (aanwezig: <iso:value-of select="$hasLocatieNaam"/>) 
indien beleidsmatigVerantwoordelijkeOverheid (huidige waarde: <iso:value-of select="$beleidsmatigVerantwoordelijkeOverheid"/>) gelijk aan 'nationale overheid'.
			Zie constraint bb1, e6, e20 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
		</iso:rule>
		
		
		
		
		<iso:rule context="//imro:Bestemmingsplangebied">
		
			<iso:extends rule="check_plangebied"/>
			
			
			<iso:let name="foutcode" value="'BP9'"/>
			<iso:extends rule="check_bb1_e6_e20"/>


		<!-- Constraint bb2: Attribuut verwijzingNaarExternPlanInfo verplicht bij uitwerkingsplan, wijzigingsplan
		
			Context: IMRO2012::Bestemmingsplangebied
			
			inv ExternPlanInfoVerplicht:
			self.typePlan = RuimtelijkPlanOfBesluit_BP::uitwerkingsplan or
			self.typePlan = RuimtelijkPlanOfBesluit_BP::wijzigingsplan
			implies
			self.verwijzingNaarExternPlanInfo.notEmpty()
		 -->
		 
		 	<iso:let name="isUitwerkingsplan" value="(imro:typePlan = 'uitwerkingsplan')"/>
		 	<iso:let name="isWijzigingsplan" value="(imro:typePlan = 'wijzigingsplan')"/>
		 	
		 	<iso:assert test="not($isUitwerkingsplan or $isWijzigingsplan) or (imro:verwijzingNaarExternPlanInfo)">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode BP10: Attribuut verwijzingNaarExternPlanInfo verplicht bij uitwerkingsplan, wijzigingsplan (huidig typePlan: '<iso:value-of select="imro:typePlan"/>')
			Zie constraint bb2 van IMRO2012.pdf paragraaf 8.4.
		 	</iso:assert>

		</iso:rule>
		
	</iso:pattern>

	<iso:pattern name="verwijzing_naar_teksten_checks">

<!--
Typen tekst in IMRO2012:

document
beleid
beleid gemandateerd aan GS
beleidstekst
besluitdocument
besluittekst

bijlage
bijlage bij beleidstekst
bijlage bij besluitdocument
bijlage bij besluittekst
bijlage bij regel met voorbereidingsbescherming
bijlage bij regel zonder voorbereidingsbescherming
bijlage bij regels
bijlage bij toelichting
bijlage bij voorschriften/regels

regel met voorbereidingsbescherming
regel zonder voorbereidingsbescherming
regels
voorschrift/regel
voorschriften/regels

toelichting
 -->
	 
		<iso:rule context="//imro:verwijzingNaarTekstInfo/imro:*" id="verwijzing_naar_tekst_checks">

			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>
			
			<iso:let name="regelsDoc" value="concat('r_',$detectedPlanId)"/>
			<iso:let name="toelichtingDoc" value="concat('t_',$detectedPlanId)"/>
			<iso:let name="bijlageDoc" value="concat('b_',$detectedPlanId)"/>
			<iso:let name="beleidBesluitDoc" value="concat('d_',$detectedPlanId)"/>
			<iso:let name="planTekstDoc" value="concat('pt_',$detectedPlanId)"/>

			<iso:let name="typeTekst" value="imro:typeTekst"/>

			<iso:let name="isBeleidBesluitType" value="contains('document,beleid,beleid gemandateerd aan GS,beleidstekst,besluitdocument,besluittekst',$typeTekst)"/>
			<iso:let name="isBijlageType"  value="contains($typeTekst,'bijlage')"/> <!-- contains('bijlage,bijlage bij beleidstekst,bijlage bij besluitdocument,bijlage bij besluittekst,bijlage bij regel met voorbereidingsbescherming,bijlage bij regel zonder voorbereidingsbescherming,bijlage bij regels,bijlage bij voorschriften/regels,bijlage bij toelichting',$typeTekst)"-->
			<iso:let name="isRegelVoorschriftType"  value="contains('regel met voorbereidingsbescherming,regel zonder voorbereidingsbescherming,regels,voorschrift/regel,voorschriften/regels',$typeTekst)"/>
			<iso:let name="isToelichtingType"  value="contains('toelichting',$typeTekst)"/>

			<iso:let name="verwijzing" value="imro:verwijzingNaarTekst"/>


			<iso:assert test="$isObjectgerichteTekst or not($isRegelVoorschriftType) or starts-with($verwijzing,$regelsDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode RPA20A: Format voor verwijzing naar tekst (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$regelsDoc"/>' (Huidige waarde typeTekst: '<iso:value-of select="$typeTekst"/>').
            Aangetroffen verwijzingsnormen (<iso:value-of select="$verwijzingsnormen"/>) bevatten geen IMROPT2012 dus prefix pt_ is niet toegestaan.
            Zie constraints b1, b7, b26, e2, e7, e11, e14, e21, e22 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="$isObjectgerichteTekst or not($isToelichtingType) or starts-with($verwijzing,$toelichtingDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name(ancestor::imro:*[imro:verwijzingNaarTekstInfo])"/>)
Foutcode RPA20B: Format voor verwijzing naar tekst (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$toelichtingDoc"/>' (Huidige waarde typeTekst: '<iso:value-of select="$typeTekst"/>').
            Aangetroffen verwijzingsnormen (<iso:value-of select="$verwijzingsnormen"/>) bevatten geen IMROPT2012 dus prefix pt_ is niet toegestaan.
            Zie constraints b1, c7, e2, e7, e11, e14, e21, e22 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="$isObjectgerichteTekst or not($isBeleidBesluitType) or starts-with($verwijzing,$beleidBesluitDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name(ancestor::imro:*[imro:verwijzingNaarTekstInfo])"/>)
Foutcode RPA20C: Format voor verwijzing naar tekst (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$beleidBesluitDoc"/>' (Huidige waarde typeTekst: '<iso:value-of select="$typeTekst"/>').
            Aangetroffen verwijzingsnormen (<iso:value-of select="$verwijzingsnormen"/>) bevatten geen IMROPT2012 dus prefix pt_ is niet toegestaan.
            Zie constraints c2, c7, e2, e11, e14, e17, e21, e22 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="$isObjectgerichteTekst or not($isBijlageType) or starts-with($verwijzing,$bijlageDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name(ancestor::imro:*[imro:verwijzingNaarTekstInfo])"/>)
Foutcode RPA20D: Format voor verwijzing naar tekst (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$bijlageDoc"/>' (Huidige waarde typeTekst: '<iso:value-of select="$typeTekst"/>').
            Aangetroffen verwijzingsnormen (<iso:value-of select="$verwijzingsnormen"/>) bevatten geen IMROPT2012 dus prefix pt_ is niet toegestaan.
            Zie constraints b1, c2, e2, e7, e11, e14, e17, e21, e22 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

<!--
/* tekst objectgericht*/
/* geen tekstTypeBijlage */
(objectgerichteTekst and not(tekstTypeBijlage)) implies
verwijzingNaarTekst.substring(1,aantalKarakters + 3) = 'pt_' + planID

/* tekst objectgericht*/
/* tekstTypeBijlage */
(objectgerichteTekst and tekstTypeBijlage)implies
(verwijzingNaarTekst.substring(1,aantalKarakters + 2) = 'b_' + planID)
or
(verwijzingNaarTekst.substring(1,aantalKarakters + 3) = 'pt_' + planID)

=====> 
OK = (	not(isObjectgerichteTekst) or 
		(not($isBijlageType) and startsWith(pt_planID)) or 
		(($isBijlageType) and startsWith(b_planId) or startsWith(pt_planID)) 
	)

=====>
OK = (	not(isObjectgerichteTekst) or  startsWith(pt_planID) or 
		(($isBijlageType) and startsWith(b_planId))
	) 
 -->

			<iso:assert test="not($isObjectgerichteTekst) or 
								starts-with($verwijzing,$planTekstDoc) or 
								($isBijlageType and starts-with($verwijzing,$bijlageDoc))" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name(ancestor::imro:*[imro:verwijzingNaarTekstInfo])"/>)
Foutcode RPA20E: Format voor verwijzing naar tekst (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$planTekstDoc"/>' of in het geval van bijlage met: '<iso:value-of select="$bijlageDoc"/>' 
            of '<iso:value-of select="$planTekstDoc"/>' (Huidige waarde typeTekst: '<iso:value-of select="$typeTekst"/>').
            Check tevens het veld imro:verwijzingNorm in het plangebied van dit plan of het inderdaad de bedoeling is om objectgerichte teksten te gebruiken. 
            Aangetroffen verwijzingsnormen (<iso:value-of select="$verwijzingsnormen"/>) bevatten de norm IMROPT2012 dus de prefix pt_ is verplicht behalve voor documenten van een bijlage type.
            Zie constraints b1, b26, c2, c7, e2, e7, e11, e14, e17, e21, e22 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		</iso:rule>
		
		<iso:rule context="//imro:verwijzingNaarVaststellingsbesluit" id="verwijzingNaarVaststellingsbesluit_check">
		
			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>
			
			<iso:let name="vaststellingsbesluitDoc" value="concat('vb_',$detectedPlanId)"/>
			
			<iso:let name="verwijzing" value="text()"/>
			
			<iso:assert test="starts-with($verwijzing,$vaststellingsbesluitDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode RPA21: Format voor verwijzing vaststellingsbesluit (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$vaststellingsbesluitDoc"/>'
            Zie constraints b2, c3, e3 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>
		
		<iso:rule context="//imro:verwijzingNaarIllustratie" id="verwijzingNaarIllustratie_check">
		
			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>
			
			<iso:let name="illustratieDoc" value="concat('i_',$detectedPlanId)"/>

			<iso:let name="verwijzing" value="text()"/>			

			<iso:assert test="starts-with($verwijzing,$illustratieDoc)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode RPA22: Format voor verwijzing naar illustratie (huidige waarde: '<iso:value-of select="$verwijzing"/>') is niet correct.
            Verwacht wordt dat deze verwijzing begint met: '<iso:value-of select="$illustratieDoc"/>'
            Zie constraints b23 ,c4, c8, e4, e8, e10, e12, e15, e16, e18 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>
		
	</iso:pattern>
	
	<iso:pattern name="bestemmingsplanobjecten">


		<!-- b9: Een Enkelbestemming kent andere hoofdgroepen dan een Dubbelbestemming
		
			context IMRO2012::Enkelbestemming
			inv EnkelHoofdgroep: self.bestemmingshoofdgroep <>
			Bestemminghoofdgroep_ED::leiding and
			self.bestemmingshoofdgroep <> Bestemminghoofdgroep_ED::waarde and
			self.bestemmingshoofdgroep <> Bestemminghoofdgroep_ED::waterstaat
			context IMRO2012::Dubbelbestemming
			
			inv DubbelHoofdgroep: self.bestemmingshoofdgroep =
			Bestemminghoofdgroep_ED::leiding or
			self.bestemmingshoofdgroep = Bestemminghoofdgroep_ED::waarde or
			self.bestemmingshoofdgroep = Bestemminghoofdgroep_ED::waterstaat
		-->
		<iso:rule context="//imro:Enkelbestemming | //imro:Dubbelbestemming">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:let name="isDubbelbestemming" value="local-name()='Dubbelbestemming'"/>

			<iso:let name="hoofdgroep" value="imro:bestemmingshoofdgroep"/>
			<iso:let name="isDubbelbestemmingHoofdgroep" value="('leiding'=$hoofdgroep or 'waarde'=$hoofdgroep or 'waterstaat'=$hoofdgroep)"/>

			<iso:assert test="($isDubbelbestemming and $isDubbelbestemmingHoofdgroep) 
			           or (not($isDubbelbestemming) and not($isDubbelbestemmingHoofdgroep))"  diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode BP1: Een Enkelbestemming kent andere hoofdgroepen dan een Dubbelbestemming. Hoofdgroepen van dubbelbestemmingen zijn ('leiding','waarde','waterstaat'). 
Hoofdgroepen van enkelbestemmingen mogen deze waarden niet hebben. Huidige waarde hoofdgroep: '<iso:value-of select="$hoofdgroep"/>'
            Zie constraint b9 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>


		<!-- b10: Bestemmingsvlak verwijst naar een bestaand plangebied id
			
				Geen OCL constraint
		
		Context: Enkelbestemming,Dubbelbestemming
		 -->
			<iso:extends rule="check_b10_b11"/>
		
		</iso:rule>


 		<iso:rule abstract="true" id="check_b10_b11">


		<!-- b10: Bestemmingsvlak verwijst naar een bestaand plangebied id
			b11 Aanduiding verwijst naar een bestaand plangebied id
			
				Geen OCL constraint
		
		Context: Enkelbestemming,Dubbelbestemming,Functieaanduiding,Figuur,Bouwvlak,Gebiedsaanduiding,Maatvoering
		 -->
			<iso:let name="plan_idn" value="substring(imro:plangebied/@xlink:href, 2)"/>

			<iso:assert test="not(imro:plangebied) or key('Bestemmingsplangebied_index',$plan_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP2: De verwijzing naar het Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
            Zie constraints b10, b11 (afhankelijk van het type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

 

		<iso:rule abstract="true" id="check_b12">

		<!-- b12 Aanduiding verwijst naar een bestaand bestemmingsvlak id
		 
			Geen OCL constraint
		-->
			<iso:let name="vlak_idn" value="substring(imro:bestemmingsvlak/@xlink:href, 2)"/>

			<iso:assert test="not(imro:bestemmingsvlak) or key('Bestemmingsvlak_index',$vlak_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP3: Een aanduiding verwijst naar een ongeldig bestemmingsvlak-id (verwijs-id = <iso:value-of select ="$vlak_idn"/>)
            Zie constraints b12 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		</iso:rule>
		



		<!--
		b19: Functieaanduiding verwijst altijd naar een bestemmingsvlak of een gebiedsaanduiding maar is optioneel 
		bij plantype wijzigingsplan en inpassingsplan of indien het dient ter vervanging van een extern plan.
		
		context IMRO2012::Functieaanduiding

		inv FunctieaanduidingVoorBestOfAanduiding:
		def: terVervangingExternPlanInfo: Boolean = (self.plangebied.BestemmingsplanGebied. verwijzingNaarExternPlanInfo.rolExternPlan_BP = RolExternPlan_BP::ter vervanging van extern plan)
		and
		if
		(self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::wijzigingsplan and
		self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::inpassingsplan and not terVervangingExternPlanInfo) then
		not (self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) and self.bestemmingsvlak.notEmpty())
		and
		not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())
		else
		not (self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) and self.bestemmingsvlak.notEmpty())
		 -->
		<iso:rule abstract="true" id="check_b19">

			<iso:let name="bestemmingsvlak" value="imro:bestemmingsvlak"/>
			<iso:let name="aanduiding" value="imro:aanduiding"/>

			<iso:let name="gebiedsaanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
			<iso:let name="isGebiedsaanduidingRef" value="key('Gebiedsaanduiding_index',$gebiedsaanduiding_idn)"/>

			<iso:assert test="$terVervangingVanExternPlan or $isInpassingsplan or $isWijzigingsplan or 
								($bestemmingsvlak and not($aanduiding)) or 
								(not($bestemmingsvlak) and ($isGebiedsaanduidingRef))"  diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP8A: <iso:value-of select="local-name()"/> verwijst altijd naar een bestemmingsvlak of een gebiedsaanduiding maar is optioneel 
bij plantype wijzigingsplan en inpassingsplan of indien het dient ter vervanging van een extern plan.
				Zie constraints b19 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

		<!--
		b20: Bouwaanduiding verwijst altijd naar een bestemmingsvlak, bouwvlak of een gebiedsaanduiding 
		maar is optioneel bij plantype wijzigingsplan en inpassingsplan of indien het dient ter vervanging van een extern plan.

		context IMRO2012::Bouwaanduiding

		inv BouwaanduidingVoorBestOfAanduiding:
		def: terVervangingExternPlanInfo: Boolean = (self.plangebied.BestemmingsplanGebied. verwijzingNaarExternPlanInfo.rolExternPlan_BP = RolExternPlan_BP::ter vervanging van extern plan)
		and
		if
		(self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::wijzigingsplan and
		self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::inpassingsplan and not terVervangingExternPlanInfo) then
		not (((self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)) and self.bestemmingsvlak.notEmpty()))
		and
		not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())
		else
		not (((self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)) and self.bestemmingsvlak.notEmpty()))

		b21: Maatvoering verwijst altijd naar een bestemmingsvlak , een bouwvlak of een gebiedsaanduiding 
		maar is optioneel bij plantype wijzigingsplan en inpassingsplan of indien het dient ter vervanging van een extern plan.

		context IMRO2012::Maatvoering

		inv MaatvoeringVoorBestOfAanduiding:
		def: terVervangingExternPlanInfo: Boolean = (self.plangebied.BestemmingsplanGebied. verwijzingNaarExternPlanInfo.rolExternPlan_BP = RolExternPlan_BP::ter vervanging van extern plan)
		and
		if
		(self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::wijzigingsplan and
		self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::inpassingsplan and not terVervangingExternPlanInfo) then
		not (((self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)) and self.bestemmingsvlak.notEmpty()))
		and
		not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty())
		else
		not (((self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding)) and self.bestemmingsvlak.notEmpty()))
		
		b22: Figuur verwijst altijd naar een bestemmingsvlak of een bouwvlak of een gebiedsaanduiding maar is optioneel bij plantype wijzigingsplan en inpassingsplan 
		of indien het dient ter vervanging van een extern plan

		context IMRO2012::Figuur

		inv FiguurVoorBestOfAanduiding:
		def: terVervangingExternPlanInfo: Boolean = (self.plangebied.BestemmingsplanGebied. verwijzingNaarExternPlanInfo.rolExternPlan_BP = RolExternPlan_BP::ter vervanging van extern plan)
		and
		if
		(self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::wijzigingsplan and
		self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::inpassingsplan and not terVervangingExternPlanInfo) then
		(not (self.aanduiding.notEmpty() and self.bestemmingsvlak.notEmpty()))
		and
		(not (self.aanduiding.isEmpty() and self.bestemmingsvlak.isEmpty()))
		and
		(self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) or self.aanduiding.isEmpty())
		else
		(self.aanduiding.oclIsTypeOf(Bouwvlak) or self.aanduiding.oclIsTypeOf(Gebiedsaanduiding) or self.aanduiding.isEmpty())
		 -->
		
		<iso:rule abstract="true" id="check_b20_b21_b22">

			<iso:let name="bestemmingsvlak" value="imro:bestemmingsvlak"/>
			<iso:let name="aanduiding" value="imro:aanduiding"/>

			<iso:let name="isBouwvlakRef" value="key('Bouwvlak_index',$aanduiding_idn)"/>
			<iso:let name="isGebiedsaanduidingRef" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>

			<iso:assert test="$terVervangingVanExternPlan or $isInpassingsplan or $isWijzigingsplan or
								($bestemmingsvlak and not($aanduiding)) or 
								(not($bestemmingsvlak) and ($isBouwvlakRef or $isGebiedsaanduidingRef))"  diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP8B: <iso:value-of select="local-name()"/> verwijst altijd naar een bestemmingsvlak , een bouwvlak of een gebiedsaanduiding 
maar is optioneel bij plantype wijzigingsplan en inpassingsplan of indien het dient ter vervanging van een extern plan.
				Zie constraints b20, b21, b22 (afhankelijk van type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

		



		<iso:rule abstract="true" id="check_b24">

		<!-- b24: Alle aanduidingen, behalve het object Figuur, kunnen maximaal naar 1 bestemmingsvlak verwijzen.
			context IMRO2012::Aanduiding
			inv verwijzingNaarBestemming:
			not(self.oclIsTypeOf(Figuur)) implies
			self.bestemmingsvlak->size()< 2
		 -->
		 	<iso:let name="aantalBestemmingsvlakVerwijzingen" value="count(imro:bestemmingsvlak)"/>

			<iso:assert test="(local-name()='Figuur') or ($aantalBestemmingsvlakVerwijzingen = 0 or $aantalBestemmingsvlakVerwijzingen = 1)">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP9: Alle aanduidingen, behalve het object Figuur, kunnen maximaal naar 1 bestemmingsvlak verwijzen.  
Aantal bestemmingsvlakken: <iso:value-of select="$aantalBestemmingsvlakVerwijzingen"/>.
				Zie constraints b24 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>


		<!-- b16: Bouwaanduiding kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
			b17 Maatvoering kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
			b18 Figuur kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
		
			B16: context IMRO2012::Bouwaanduiding
				inv AssociatieBouwaanduidingNiet:
				not(self.aanduiding.oclIsTypeOf(Functieaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Bouwaanduiding))
				and
				not(self.aanduiding.oclIsTypeOf(Maatvoering))
				and
				not(self.aanduiding.oclIsTypeOf(Figuur)
		
			Idem b17, b18:
			DUS: mag alleen verwijzen naar Gebiedsaanduiding of Bouwvlak 
		 -->
		<iso:rule abstract="true" id="check_b16_b17_b18">

			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
		
			<iso:let name="isBouwvlak" value="key('Bouwvlak_index',$aanduiding_idn)"/>
			<iso:let name="isGebiedsaanduiding" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>
			
			<iso:assert test="not(imro:aanduiding) or $isGebiedsaanduiding or $isBouwvlak" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP7: <iso:value-of select="local-name()"/> kan niet verwijzen naar aanduiding van het type functieaanduiding, bouwaanduiding, maatvoering, figuur
			Zie constraints b16, b17, b18 (afhankelijk van type planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>


 		<iso:rule context="//imro:Functieaanduiding">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b10_b11"/>
			
			<iso:extends rule="check_b12"/>			

			<iso:extends rule="check_b19"/>		 

			<iso:let name="aanduiding_idn" value="substring(imro:aanduiding/@xlink:href, 2)"/>
		
			<iso:let name="isGebiedsaanduiding" value="key('Gebiedsaanduiding_index',$aanduiding_idn)"/>

		<!-- b15: Functieaanduiding kan niet verwijzen naar aanduiding van het type bouwvlak,
			functieaanduiding, bouwaanduiding, maatvoering, figuur.
			context IMRO2012::Functieaanduiding
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
			
			DUS: Functieaanduiding mag wel verwijzen naar Gebiedsaanduiding. 
		 -->
			<iso:assert test="not(imro:aanduiding) or $isGebiedsaanduiding" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP6: Functieaanduiding kan niet verwijzen naar aanduiding van het type bouwvlak, functieaanduiding, bouwaanduiding, maatvoering, figuur
			Zie constraints b15 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule> 

 		<iso:rule context="//imro:Figuur">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b10_b11"/>
			
			<iso:extends rule="check_b12"/>			

			<iso:extends rule="check_b16_b17_b18"/>

			<iso:extends rule="check_b20_b21_b22"/>

			<iso:extends rule="check_b24"/>		 
		</iso:rule> 


 		<iso:rule context="//imro:Bouwvlak">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b10_b11"/>
			
			<iso:extends rule="check_b12"/>			

			<iso:extends rule="check_b24"/>		 

		<!-- b13: Bouwvlak verwijst altijd naar een bestemmingsvlak maar is optioneel bij plantype wijzigingsplan, 
				inpassingsplan of indien het dient ter vervanging van een extern plan.
				
			context IMRO2012::Bouwvlak
			
			inv AssociatieBouwvlakBestvlak:
			def: terVervangingExternPlanInfo: Boolean = (self.plangebied.BestemmingsplanGebied.verwijzingNaarExternPlanInfo.rolExternPlan_BP = RolExternPlan_BP::ter vervanging van extern plan)
			and
			(self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::wijzigingsplan and
			self.plangebied.Bestemmingsplangebied.typePlan <> RuimtelijkPlanOfBesluit_BP::inpassingsplan and not terVervangingExternPlanInfo) implies self.bestemmingsvlak.notEmpty()
		 -->
			<iso:assert test="$terVervangingVanExternPlan or $isInpassingsplan or $isWijzigingsplan or (imro:bestemmingsvlak)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP4: Bouwvlak verwijst altijd naar een bestemmingsvlak maar is optioneel bij plantype wijzigingsplan, inpassingsplan of indien het dient ter vervanging van een extern plan.
			Zie constraints b13 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		<!-- b14: Naam bouwvlak is altijd bouwvlak
			context IMRO2013::Bouwvlak
			inv Bouwvlaknaam: self.naam = 'bouwvlak' 
		 -->
			<iso:assert test="imro:naam='bouwvlak'" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name()"/>)
Foutcode BP5: Naam bouwvlak is altijd bouwvlak. Huidige naam is '<iso:value-of select="imro:naam"/>'.
			Zie constraints b14 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule> 

 		<iso:rule context="//imro:Gebiedsaanduiding">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b10_b11"/>
			
			<iso:extends rule="check_b12"/>

			<iso:extends rule="check_b24"/>
		
		</iso:rule> 


 		<iso:rule context="//imro:Bouwaanduiding">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b12"/>			

			<iso:extends rule="check_b16_b17_b18"/>
			
			<iso:extends rule="check_b20_b21_b22"/>		 

			<iso:extends rule="check_b24"/>		 
		</iso:rule> 


 		<iso:rule context="//imro:Maatvoering">
 			
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:extends rule="check_b10_b11"/>
			
			<iso:extends rule="check_b12"/>			

			<iso:extends rule="check_b16_b17_b18"/>
			
			<iso:extends rule="check_b20_b21_b22"/>		 

			<iso:extends rule="check_b24"/>

		</iso:rule>
		
		<iso:rule context="//imro:Maatvoering/imro:maatvoeringInfo">
		
			<iso:let name="owner" value="parent::imro:*"/>
			<iso:let name="identificatie" value="$owner/@gml:id"/>
			
			<!-- bb3: Indien verwijzingNorm een waarde PRABPK2012 heeft dan is bij maatvoering opname van de symboolcode verplicht en is de symboolcodelijst gesloten.
			 -->
			<iso:let name="symboolCode" value="imro:WaardeEnType/imro:symboolCode"/>
			<iso:let name="maatvoeringHasSymboolCode" value="boolean($symboolCode)"/>
			
			<iso:assert test="($isAnaloogBestemmingsplanKaart and $maatvoeringHasSymboolCode and not(starts-with($symboolCode,'other: ')))
						or (not($isAnaloogBestemmingsplanKaart) and not($maatvoeringHasSymboolCode))" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>: <iso:value-of select="name($owner)"/>)
Foutcode BP11: <iso:value-of select="local-name()"/> heeft verplichte symboolcode (huidige waarde symboolCode: '<iso:value-of select="$symboolCode"/>') 
uit de gesloten symboolcodelijst (dus geen 'other: ') als verwijzingNorm de waarde PRABPK2012 heeft (verwijzingNorm='PRABPK2012': <iso:value-of select="$isAnaloogBestemmingsplanKaart"/>). 
Het gebruik van deze symboolcode is verboden als geen van de aanwezige verwijzingnormen de genoemde waarde heeft.  
				Zie constraints bb3 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
			
		</iso:rule> 

	</iso:pattern>


	<iso:pattern name="structuurvisies">



		<!-- c9 Structuurvisiegebied verwijst naar een bestaand plangebied id
		
			Geen OCL constraint 
		 -->	
		<iso:rule abstract="true" id="check_c9_c11">

			<iso:let name="plan_idn" value="substring(imro:plangebied/@xlink:href, 2)"/>
			
			<iso:assert test="not(imro:plangebied) or key($index,$plan_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode SV2: Verwijzing van dit <iso:value-of select="local-name()"/> naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			Zie constraint c9, c11 (afhankelijk van planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

		<!-- c10 Structuurvisiecomplex verwijst naar een bestaand plangebied id

			Geen OCL constraint
		 -->	
		<iso:rule abstract="true" id="check_c10">

<!-- reeds eerder gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->
			<iso:let name="plan_idn" value="substring(imro:plangebied/@xlink:href, 2)"/>
			
			<iso:assert test="not(imro:plangebied) or key($svPlangebiedIndex,$plan_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode SV3: Verwijzing van dit <iso:value-of select="local-name()"/> naar Plangebied is ongeldig. Verwijs-id is niet gelijk aan Plangebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			Zie constraint c10 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		</iso:rule>
		
		<iso:rule abstract="true" id="check_c12">
		
			<iso:let name="ownerFeature" value="ancestor::imro:featureMember/imro:*"/>
			<iso:let name="identificatie" value="$ownerFeature/@gml:id"/>
		
			<iso:let name="object_id" value="substring(@xlink:href, 2)"/>

			<iso:assert test="key($svComplexIndex,$object_id) or
								key($svGebiedIndex,$object_id)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name($ownerFeature)"/>)
Foutcode SV5: Verwijzing van dit <iso:value-of select="local-name()"/> naar een planobject is ongeldig (verwijs-id = <iso:value-of select="$object_id"/>)
			Zie constraint c12 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>


		<!-- c13 Structuurvisiegebied_R en Structuurvisiecomplex_R
				Het object heeft verplicht een geometrie indien het object naar een kaart illustratie verwijst.
				
			Context: IMRO2012::Structuurvisiegebied_R
			Context: IMRO2012::Structuurvisiecomplex_R

			Inv GeometrieVerplichtGebiedRSV:
			self.verwijzingNaarIllustratieInfo.IllustratieReferentie.typeIllustratie = Illustratie::kaart implies
			self.begrenzing.notEmpty()
		 -->
		<iso:rule abstract="true" id="check_c13">

			<iso:let name="verwijzingNaarIllustratieInfo" value="imro:verwijzingNaarIllustratieInfo"/>
			<iso:let name="typeIllustratie" value="imro:verwijzingNaarIllustratieInfo/imro:IllustratieReferentie/imro:typeIllustratie"/>
			<iso:let name="begrenzing" value="imro:begrenzing"/>

			<iso:assert test="not($verwijzingNaarIllustratieInfo) or not($typeIllustratie='kaart') or ($begrenzing)">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode SV1: Het object heeft verplicht een geometrie indien het object naar een kaart illustratie verwijst.
            Zie constraint c13 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		</iso:rule>

	
		<iso:rule context="//imro:Structuurvisiegebied_R">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			

		 	<iso:extends rule="check_c13"/>
			
			<iso:let name="index" value="'Structuurvisieplangebied_R_index'"/>
			<iso:extends rule="check_c9_c11"/>	
			
		</iso:rule>
	
		<iso:rule context="//imro:Structuurvisiegebied_P">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:let name="index" value="'Structuurvisieplangebied_P_index'"/>
			<iso:extends rule="check_c9_c11"/>
		
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiegebied_G">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:let name="index" value="'Structuurvisieplangebied_G_index'"/>
			<iso:extends rule="check_c9_c11"/>
	
		</iso:rule>


		<iso:rule context="//imro:Structuurvisieverklaring_P">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>
<!-- is hierboven reeds gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->			
			<iso:let name="index" value="'Structuurvisieplangebied_P_index'"/>
			<iso:extends rule="check_c9_c11"/>
		
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_G">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="svPlangebiedIndex" value="'Structuurvisieplangebied_G_index'"/>
			<iso:extends rule="check_c10"/>
	
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_G/imro:planobject">
		
			<iso:let name="svComplexIndex" value="'Structuurvisiecomplex_G_index'"/>
			<iso:let name="svGebiedIndex" value="'Structuurvisiegebied_G_index'"/>
			
			<iso:extends rule="check_c12"/>
		</iso:rule>
				
		<iso:rule context="//imro:Structuurvisiecomplex_P">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="svPlangebiedIndex" value="'Structuurvisieplangebied_P_index'"/>
			<iso:extends rule="check_c10"/>
	
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_P/imro:planobject">
		
			<iso:let name="svComplexIndex" value="'Structuurvisiecomplex_P_index'"/>
			<iso:let name="svGebiedIndex" value="'Structuurvisiegebied_verklaring_P_index'"/>
			
			<iso:extends rule="check_c12"/>
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_R">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="svPlangebiedIndex" value="'Structuurvisieplangebied_R_index'"/>
			<iso:extends rule="check_c10"/>
	
			<iso:extends rule="check_c13"/>
		</iso:rule>

		<iso:rule context="//imro:Structuurvisiecomplex_R/imro:planobject">
			<iso:let name="svComplexIndex" value="'Structuurvisiecomplex_R_index'"/>
			<iso:let name="svGebiedIndex" value="'Structuurvisiegebied_R_index'"/>
			
			<iso:extends rule="check_c12"/>
		</iso:rule>

	</iso:pattern>
	


	<iso:pattern name="gebiedsbesluiten">
	
		 <!-- e23 Besluitgebied verwijst naar een bestaand plangebied id
				e24 Besluitvlak verwijst naar een bestaand plangebied id
				e25 Besluitsubvlak verwijst naar een bestaand plangebied id
		
				Geen OCL constraint 
		  -->
		<iso:rule abstract="true" id="check_e23_e24_e25">
<!-- reeds eerder gedefinieerd 
			<iso:let name="identificatie" value="@gml:id"/>
-->
			<iso:let name="plan_idn" value="substring(imro:besluitgebied/@xlink:href, 2)"/>
			
			<iso:assert test="not(imro:besluitgebied) or key($index,$plan_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB2: Verwijzing van dit <iso:value-of select="local-name()"/>) naar Besluitgebied is ongeldig. Verwijs-id is niet gelijk aan Besluitgebied-id (verwijs-id = <iso:value-of select="$plan_idn"/>)
			Zie constraint e23, e24, e25 (afhankelijk van planobject) van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

	

		<iso:rule abstract="true" id="check_besluitsubvlak_of_besluitvlak_aanwezig">
		
			<iso:assert test="(imro:besluitsubvlak) or (imro:besluitvlak)"  diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB3: <iso:value-of select="local-name()"/> dient naar minimaal 1 Besluitvlak of minimaal 1 Besluitsubvlak te verwijzen.
			</iso:assert>
		</iso:rule>

		<!-- e26 Besluitsubvlak verwijst naar een bestaand Besluitvlak id
		
			Geen OCL constraint
		 -->
 		<iso:rule abstract="true" id="check_e26">
<!-- Reeds gedefinieerd in rule "check_e23_e24_e25"
			<iso:let name="identificatie" value="@gml:id"/>
-->		
			<iso:let name="vlak_idn" value="substring(imro:besluitvlak/@xlink:href, 2)"/>

			<iso:assert test="not(imro:besluitvlak) or key($besluitvlakIndex,$vlak_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB4: Verwijzing van dit <iso:value-of select="local-name()"/> naar Besluitvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			Zie constraint e26 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

		<!-- e27 Besluitsubvlak verwijst naar een bestaand Besluitsubvlak id
		
			Geen OCL constraint
		 -->
		<iso:rule abstract="true" id="check_e27">
<!-- Reeds gedefinieerd in rule "check_e23_e24_e25"
			<iso:let name="identificatie" value="@gml:id"/>
-->

			<iso:let name="sub_vlak_idn" value="substring(imro:besluitsubvlak/@xlink:href, 2)"/>

			<iso:assert test="not(imro:besluitsubvlak) or key($besluitsubvlakIndex,$sub_vlak_idn)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB5: Verwijzing van dit <iso:value-of select="local-name()"/> naar Besluitsubvlak is ongeldig. Verwijs-id is niet gelijk aan een Besluitsubvlak-id (verwijs-id = <iso:value-of select="$vlak_idn"/>)
			Zie constraint e27 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		</iso:rule>

		<!-- e28 Besluitsubvlak verwijst naar besluitvlak of Besluitsubvlak
			Context: IMRO2012::Besluitsubvlak_P
			Context: IMRO2012::Besluitsubvlak_A
			Context: IMRO2012::Besluitsubvlak_X
			
		Inv subvlakHoortBijAnderVlak:
			not(self.besluitvlak.isEmpty() and self.besluitsubvlak.isEmpty())
			and
			not(self.besluitvlak.notEmpty() and self.besluitsubvlak.notEmpty())
			
			Dit is gelijkwaardig aan:
			(self.besluitvlak.notEmpty() or self.besluitsubvlak.notEmpty())
			and
			not(self.besluitvlak.notEmpty() and self.besluitsubvlak.notEmpty())
		 -->
		<iso:rule abstract="true" id="check_e28">
<!-- Reeds gedefinieerd in rule "check_e23_e24_e25"
			<iso:let name="identificatie" value="@gml:id"/>
-->
			<iso:assert test="not((imro:besluitsubvlak) and (imro:besluitvlak)) and ((imro:besluitsubvlak) or (imro:besluitvlak))" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB6: <iso:value-of select="local-name()"/> verwijst niet naar een besluitvlak (verwijzingen: <iso:value-of select="count(imro:besluitvlak)"/>) of een besluitsubvlak (verwijzingen: <iso:value-of select="count(imro:besluitsubvlak)"/>) of verwijst juist naar beide soorten tegelijk.
			Zie constraint e28 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>
		
		</iso:rule>

		<!-- ee1: Relatie tussen besluittype en teksttype
			Context: IMRO2012::Besluitgebied_X
			Inv RelatieBesluitEnTeksttype:
			def: Teksttypen: Bag = self.verwijzingNaarTekstInfo.TekstReferentieBG_XGB -> collect (typeTekst)
			and
			/* aanwijzingsbesluit, gerechtelijke uitspraak, omgevingsvergunning en reactieve aanwijzing */
			(self.typePlan = RuimtelijkPlanOfBesluit_XGB::aanwijzingsbesluit or
			self.typePlan = RuimtelijkPlanOfBesluit_XGB::’gerechtelijke uitspraak’ or
			self.typePlan = RuimtelijkPlanOfBesluit_XGB::omgevingsvergunning or
			self.typePlan = RuimtelijkPlanOfBesluit_XGB::'reactieve aanwijzing') implies
			Teksttypen->Count( 'besluitdocument' ) = 1
			and
			Teksttypen->Count( 'voorschriften/regels' ) = 0
			and
			Teksttypen->Count( 'toelichting' ) <= 1
			and
			Teksttypen->Count( 'bijlage bij besluitdocument' ) <= 1
			and
			Teksttypen->Count( 'bijlage bij voorschriften/regels’ ) = 0
			and
			Teksttypen->Count( ‘bijlage bij toelichting’ ) <= 1)
			and
			/* beheersverordening, exploitatieplan */
			(self.typePlan = RuimtelijkPlanOfBesluit_XGB:: beheersverordening or self.typePlan = RuimtelijkPlanOfBesluit_XGB:: exploitatieplan) implies
			Teksttypen->Count( ‘besluitdocument’ ) = 0
			and
			Teksttypen->Count( ‘voorschriften/regels’ ) = 1
			and
			Teksttypen->Count( ‘toelichting’ ) <= 1
			and
			Teksttypen->Count( ‘bijlage bij besluitdocument’ ) = 0
			and
			Teksttypen->Count( ‘bijlage bij voorschriften/regels’ ) <= 1
			and
			Teksttypen->Count( ‘bijlage bij toelichting’ ) <= 1)
			and
			/* voorbereidngsbesluit */
			self.typePlan = RuimtelijkPlanOfBesluit_XGB:: voorbereidingsbesluit implies
			Teksttypen->Count( ‘besluitdocument’ ) = 1
			and
			Teksttypen->Count(‘voorschriften/regels’ ) <= 1
			and
			Teksttypen->Count( ‘toelichting’ ) <= 1
			and
			Teksttypen->Count( ‘bijlage bij besluitdocument’ ) <= 1
			and
			Teksttypen->Count( ‘bijlage bij voorschriften/regels’ ) <= 1
			and
			Teksttypen->Count( ‘bijlage bij toelichting’ ) <= 1)
		 -->

		<iso:rule abstract="true" id="check_ee1">

			<iso:let name="typePlan" value="imro:typePlan"/>
			
			<iso:let name="isAanwijzingsbesluit_GerechtelijkeUitspraak_Omgevingsvergunning_ReactieveAanwijzing" value="($typePlan='aanwijzingsbesluit') or 
											($typePlan='gerechtelijke uitspraak') or 
											($typePlan='omgevingsvergunning') or 
											($typePlan='reactieve aanwijzing')"/>
											
			<iso:let name="isBeheersverordening_Exploitatieplan" value="($typePlan='beheersverordening') or ($typePlan='exploitatieplan')"/>
			<iso:let name="isVoorbereidingsbesluit" value="($typePlan='voorbereidingsbesluit')"/>
		
			<iso:let name="aantalBesluitDocumenten" value="count(.//imro:typeTekst[text()='besluitdocument'])"/>
			<iso:let name="aantalVoorschriftenRegels" value="count(.//imro:typeTekst[text()='voorschriften/regels'])"/>
			<iso:let name="aantalToelichting" value="count(.//imro:typeTekst[text()='toelichting'])"/>
			<iso:let name="aantalBijlageBijBesluitDocument" value="count(.//imro:typeTekst[text()='bijlage bij besluitdocument'])"/>
			<iso:let name="aantalBijlageBijVoorschriftenRegels" value="count(.//imro:typeTekst[text()='bijlage bij voorschriften/regels'])"/>
			<iso:let name="aantalBijlageBijToelichting" value="count(.//imro:typeTekst[text()='bijlage bij toelichting'])"/>

			<iso:assert test="not($isAanwijzingsbesluit_GerechtelijkeUitspraak_Omgevingsvergunning_ReactieveAanwijzing) or
							(
								($aantalBesluitDocumenten = 1) and
								($aantalVoorschriftenRegels = 0) and
								($aantalToelichting &lt;= 1) and
								($aantalBijlageBijBesluitDocument &lt;= 1) and
								($aantalBijlageBijVoorschriftenRegels = 0) and
								($aantalBijlageBijToelichting &lt;= 1)
							)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB7: <iso:value-of select="local-name()"/> bevat niet de juiste typeTekst attributen bij verwijzingen naar tekst voor typePlan='<iso:value-of select="$typePlan"/>'. 
typeTekst = 'besluitdocument', gevonden aantal: <iso:value-of select="$aantalBesluitDocumenten"/>, verwacht aantal: 1.
typeTekst = 'voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalVoorschriftenRegels"/>, verwacht aantal: 0.
typeTekst = 'toelichting', gevonden aantal: <iso:value-of select="$aantalToelichting"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij besluitdocument', gevonden aantal: <iso:value-of select="$aantalBijlageBijBesluitDocument"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalBijlageBijVoorschriftenRegels"/>, verwacht aantal: 0.
typeTekst = 'bijlage bij toelichting', gevonden aantal: <iso:value-of select="$aantalBijlageBijToelichting"/>, verwacht aantal: 0 of 1.
			Zie constraint ee1 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="not($isBeheersverordening_Exploitatieplan) or
							(
								($aantalBesluitDocumenten = 0) and
								($aantalVoorschriftenRegels = 1) and
								($aantalToelichting &lt;= 1) and
								($aantalBijlageBijBesluitDocument = 0) and
								($aantalBijlageBijVoorschriftenRegels &lt;= 1) and
								($aantalBijlageBijToelichting &lt;= 1)
							)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB7: <iso:value-of select="local-name()"/> bevat niet de juiste typeTekst attributen bij verwijzingen naar tekst voor typePlan='<iso:value-of select="$typePlan"/>'. 
typeTekst = 'besluitdocument', gevonden aantal: <iso:value-of select="$aantalBesluitDocumenten"/>, verwacht aantal: 0.
typeTekst = 'voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalVoorschriftenRegels"/>, verwacht aantal: 1.
typeTekst = 'toelichting', gevonden aantal: <iso:value-of select="$aantalToelichting"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij besluitdocument', gevonden aantal: <iso:value-of select="$aantalBijlageBijBesluitDocument"/>, verwacht aantal: 0.
typeTekst = 'bijlage bij voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalBijlageBijVoorschriftenRegels"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij toelichting', gevonden aantal: <iso:value-of select="$aantalBijlageBijToelichting"/>, verwacht aantal: 0 of 1.
			Zie constraint ee1 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

			<iso:assert test="not($isVoorbereidingsbesluit) or
							(
								($aantalBesluitDocumenten = 1) and
								($aantalVoorschriftenRegels &lt;= 1) and
								($aantalToelichting &lt;= 1) and
								($aantalBijlageBijBesluitDocument &lt;= 1) and
								($aantalBijlageBijVoorschriftenRegels &lt;= 1) and
								($aantalBijlageBijToelichting &lt;= 1)
							)" diagnostics="identificatie">
(Planobject gml:id = <iso:value-of select="$identificatie"/>, type = <iso:value-of select="name()"/>)
Foutcode GB7: <iso:value-of select="local-name()"/> bevat niet de juiste typeTekst attributen bij verwijzingen naar tekst voor typePlan='<iso:value-of select="$typePlan"/>'. 
typeTekst = 'besluitdocument', gevonden aantal: <iso:value-of select="$aantalBesluitDocumenten"/>, verwacht aantal: 1.
typeTekst = 'voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalVoorschriftenRegels"/>, verwacht aantal: 0 of 1.
typeTekst = 'toelichting', gevonden aantal: <iso:value-of select="$aantalToelichting"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij besluitdocument', gevonden aantal: <iso:value-of select="$aantalBijlageBijBesluitDocument"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij voorschriften/regels', gevonden aantal: <iso:value-of select="$aantalBijlageBijVoorschriftenRegels"/>, verwacht aantal: 0 of 1.
typeTekst = 'bijlage bij toelichting', gevonden aantal: <iso:value-of select="$aantalBijlageBijToelichting"/>, verwacht aantal: 0 of 1.
			Zie constraint ee1 van IMRO2012.pdf paragraaf 8.4.
			</iso:assert>

		
		</iso:rule>



	 	<iso:rule context="//imro:Besluitgebied_P">
	 						
	 		<!-- Dit is een plangebied, dus ook hierbij de generieke plangebied checks uitvoeren -->
	 		<iso:extends rule="check_plangebied"/>
	 		
			<iso:let name="foutcode" value="'GB1'"/>
			<iso:extends rule="check_bb1_e6_e20"/>
		</iso:rule>

	 	<iso:rule context="//imro:Besluitgebied_X">
	 						
	 		<!-- Dit is een plangebied, dus ook hierbij de generieke plangebied checks uitvoeren -->
	 		<iso:extends rule="check_plangebied"/>
	 		
			<iso:let name="foutcode" value="'GB1'"/>
			<iso:extends rule="check_bb1_e6_e20"/>
			
			<iso:extends rule="check_ee1"/>
	 	</iso:rule>


		<iso:rule context="//imro:Besluitvlak_A">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_A_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>

		</iso:rule>

		<iso:rule context="//imro:Besluitvlak_P">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_P_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>

		</iso:rule>

		<iso:rule context="//imro:Besluitvlak_X">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_X_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>

		</iso:rule>

		<iso:rule context="//imro:Besluitsubvlak_A">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_A_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>
			
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>

			<iso:let name="besluitvlakIndex" value="'Besluitvlak_A_index'"/>
			<iso:extends rule="check_e26"/>
		
			<iso:let name="besluitsubvlakIndex" value="'Besluitsubvlak_A_index'"/>
			<iso:extends rule="check_e27"/>

			<iso:extends rule="check_e28"/>

		</iso:rule>



		<iso:rule context="//imro:Besluitsubvlak_P">

			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_P_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>
			
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>

			<iso:let name="besluitvlakIndex" value="'Besluitvlak_P_index'"/>
			<iso:extends rule="check_e26"/>

			<iso:let name="besluitsubvlakIndex" value="'Besluitsubvlak_P_index'"/>
			<iso:extends rule="check_e27"/>

			<iso:extends rule="check_e28"/>
			
		</iso:rule>


		<iso:rule context="//imro:Besluitsubvlak_X">
		
			<!-- Dit is een planobject, dus ook de generieke checks uitvoeren -->
			<iso:extends rule="check_planobjecten"/>

			<iso:let name="index" value="'Besluitgebied_X_index'"/>
			<iso:extends rule="check_e23_e24_e25"/>
			
			<iso:extends rule="check_besluitsubvlak_of_besluitvlak_aanwezig"/>

			<iso:let name="besluitvlakIndex" value="'Besluitvlak_X_index'"/>
			<iso:extends rule="check_e26"/>
		
			<iso:let name="besluitsubvlakIndex" value="'Besluitsubvlak_X_index'"/>
			<iso:extends rule="check_e27"/>

			<iso:extends rule="check_e28"/>

		</iso:rule>
	
	</iso:pattern>


	<iso:pattern name="resterende_gebieden_en_objecten_checks">
		
		<iso:rule context="//imro:Besluitgebied_A | 
							//imro:Structuurvisieplangebied_G |
							//imro:Structuurvisieplangebied_P |
							//imro:Structuurvisieplangebied_R">
							
			<iso:extends rule="check_plangebied"/>
		</iso:rule>
		
<!-- Geen resterende planobjecten.
		<iso:rule context="//imro:*[imro:typePlanobject and not(imro:typePlan)]">
			<iso:extends rule="check_planobjecten"/>
		</iso:rule>
-->
		
	</iso:pattern>
	
	

	<iso:diagnostics>
		<iso:diagnostic id="identificatie"><iso:value-of select="$identificatie"/></iso:diagnostic>
	</iso:diagnostics>

</iso:schema>