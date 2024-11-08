<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: additional-validator-rules2012v0.07.sch
 * (C) Logica, 2011
 * 2018: Geonovum, Thijs Brentjens
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
 * 30-10-2018   GD	Geodan/Kadaster. various corrections on 'Additional check. For plantype + overheid' implemented RPnl v.2.4.2.3 dd.29-10-2018.
 * 21-03-2023   AdB Datum inwerkingtreding Ow aangepast na instemming : 01-07-2023 ==> 01-01-2024 
 * 28-11-2023   AdB Blokkeren structuurvisie + beheersoverordening, tenzij naam  'Chw bestemmingsplan ' én status 'vastgesteld' of 'geconsolideerd'
 * 26-02-2024   AdB Toestaan gemeentelijke structuurvisie met status 'ontwerp' na 2024-01-01 
 * 30-10-2024   WQ  Toevoegen regel voor aanwijzingsbesluit
  ******************************************************************************/

Opmerkingen / hints:

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings"
    xmlns:func="http://exslt.org/functions" xml:lang="en">
    
    <iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2012/1.1"/>   
    <!--iso:ns prefix="imro2008" uri="http://www.geonovum.nl/imro/2008/1"/-->
    <iso:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    
    <!-- BEGIN Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
    <iso:let name="identificatie" value="@gml:id"/>
    <iso:pattern id="OwTAMuitgebreid">
        <!-- RW1: Wilko heeft deze regel toegevoegd maar nog niet getest -->
        <iso:rule context="//imro:Bestemmingsplangebied[//imro:typePlan = 'aanwijzingsbesluit']">

            <!-- plantype aanwijzingsbesluit, attribuut beleidsmatigVerantwoordelijkeOverheid = nationale overheid nieuwe upload van het rijk blokkeren per 1-1-2025  -->
             <iso:assert
                test="
                (
                number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                and
                imro:beleidsmatigVerantwoordelijkeOverheid = 'nationale overheid'
                )
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Fout een aanwijzingsbesluit van het Rijk mag na 1 januari 2025 niet worden gepubliceerd'.
            </iso:assert>
        </iso:rule>

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
        
        <!-- (RW-5) nieuwe upload blokkeren per 1-1-2025 plantype voorbereidingsbesluit van provincies (_P)   -->
        <iso:rule context="//imro:Besluitgebied_P[//imro:typePlan = 'voorbereidingsbesluit']">
            <iso:assert
                test="
                number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Vanaf 1 januari 2025 de Provincie geen Omgevingswet voorbereidingsbesluiten op basis van TAM meer publiceren '.
            </iso:assert>
        </iso:rule>
        <!-- (RW-6) nieuwe upload blokkeren per 1-1-2025 plantype voorbereidingsbesluit van Rijk  (_R) -->
        <iso:rule context="//imro:Besluitgebied_R[//imro:typePlan = 'voorbereidingsbesluit']">
            <iso:assert
                test="
                number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Vanaf 1 januari 2025 het Rijk geen Omgevingswet voorbereidingsbesluiten op basis van TAM meer publiceren '.
            </iso:assert>
        </iso:rule>
        <!-- (RW-7) Als plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]' van gemeente (_G) doorlaten als planstatus= 'vastgesteld', anders upload blokkeren -->
        <iso:rule context="//imro:Besluitgebied_G[//imro:typePlan = 'voorbereidingsbesluit']">
            <iso:assert
                test="
                starts-with(imro:naam, 'TAM-voorbereidingsbesluit ')
                and
                imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Vanaf 1 januari 2024 mag de gemeente alleen vastgestelde Omgevingswet voorbereidingsbesluiten op basis van TAM publiceren'.
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
        
        <!-- Blokkeren STRUCTUURVISIE GEMEENTE-->
         <!-- Na 2024-01-01 mag voor objecttype Structuurvisieplangebied_G typePlan niet zijn 'structuurvisie', tenzij planstatus is ontwerp of vastgesteld-->
         <iso:rule context="//imro:Structuurvisieplangebied_G[imro:typePlan = 'structuurvisie']">
             <iso:assert
                 test=" 
                 (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and 
                    (imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'  
                    or 
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'ontwerp')
                 )
                 or
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
                 "> 
                 IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
                 type = <iso:value-of select="name()"/>: 
                 Fout in typePlan -> Als typePlan is 'structuurvisie' en datum is groter dan of gelijk aan 2024-01-01, 
                 dan mag typePlan niet zijn 'structuurvisie', tenzij planstatus is gelijk aan ontwerp of vastgesteld. 
                 </iso:assert>
         </iso:rule>
        
        <!-- WQ: Deze extra regel controleert dat bij een structuurvie van een Gemeente van na 1 januari 2025  de
                 wel vastgesteld is. Bij het falen van deze controle wordt de foutmelding gegeven. RW-4 -->
        <iso:rule context="//imro:Structuurvisieplangebied_G[imro:typePlan = 'structuurvisie']">
            <iso:assert
                test="
                number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101
                and
                imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Vanaf 1 januari 2025 mag een gemeente alleen vastgestelde omgevingsvisie
                volgens het plantype structuurvisie publiceren als voor 1 januari 2025 de procedure is aangevangen.
            </iso:assert>
        </iso:rule>


        <!-- Blokkeren STRUCTUURVISIE PROVINCIE-->
        <!-- Na 2024-01-01 mag voor objecttype Structuurvisieplangebied_P typePlan niet zijn 'structuurvisie'-->
        <iso:rule context="//imro:Structuurvisieplangebied_P[imro:typePlan = 'structuurvisie']">
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
        
        <!-- Blokkeren STRUCTUURVISIE RIJK-->
        <!-- Na 2024-01-01 mag voor objecttype Structuurvisieplangebied_R typePlan niet zijn 'structuurvisie'-->
        <iso:rule context="//imro:Structuurvisieplangebied_R[imro:typePlan = 'structuurvisie']">
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
        
    </iso:pattern>
    
</iso:schema>
