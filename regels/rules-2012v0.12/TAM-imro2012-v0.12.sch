<?xml version="1.0" encoding="UTF-8"?>
<!--
/*******************************************************************************
 * File: additional-validator-rules2012v0.qw.sch
 * (C) Logica, 2011
 * 2018: Geonovum, Thijs Brentjens (TB)
 * 2024: Geonovum, Wilko Quak (WQ)
 *
 * Info:
 * Extra Schematron Validation Document for IMRO 2012 die voortvloeien uit de invoering van de omgevingswet.
 * Deze regels worden in dit schematron document beheerd maar aan het Kadaster uitgeleverd door de inhoud
 * van dit bestand vanaf de regel met 'BEGIN Validaties' tot en met de regel met 'EINDE Validaties' te 
 * kopieren naar het bestaand 'additional-validator-rules-2012vXXX.sch'
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
 * 22-11-2024   WQ  Regels aangepast voor 2025, documentatie aangepast
 ******************************************************************************/
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
        
        <!-- RW-2025-1: Deze regel test op regelwijziging RW-2025-1 zoals beschreven in README.md -->
        <iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'aanwijzingsbesluit']">
            
            <!-- plantype aanwijzingsbesluit, attribuut beleidsmatigVerantwoordelijkeOverheid = nationale overheid nieuwe upload van het rijk blokkeren per 1-1-2025  -->
            <iso:assert
                test="
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                )
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101
                    and
                    imro:beleidsmatigVerantwoordelijkeOverheid != 'nationale overheid'
                )
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>:
                Een aanwijzingsbesluit van het Rijk met de datum 1 januari 2025 of later mag niet worden gepubliceerd.
            </iso:assert>
        </iso:rule>
        
        <iso:rule context="//imro:Bestemmingsplangebied[//imro:typePlan = 'bestemmingsplan']">
            
            <!-- Blokkeren BESTEMMINGSPLAN met status niet zijnde VASTGESTELD of GECONSOLIDEERD of naam begint niet met TAM-OMGEVINGSPLAN -->
            <!-- Na 2024-01-01 is van object Bestemmingsplangebied met typePlan 'bestemmingsplan' de planstatus 'vastgesteld' of 'geconsolideerd' of de naam begint met 'TAM-omgevingsplan ' -->
            <iso:assert
                test="
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101  
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and
                    (
                        (
                            imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' 
                            or 
                            imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'geconsolideerd'
                        )
                        and
                        not(starts-with(imro:naam, 'TAM-omgevingsplan '))
                    )
                )
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and
                    starts-with(imro:naam, 'TAM-omgevingsplan ')
                )                   
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
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101 
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' 
                    and
                    not (starts-with(imro:naam, 'TAM-projectbesluit '))
                )
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                    and
                    starts-with(imro:naam, 'TAM-projectbesluit ')
                )
                or 
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101
                    and
                    imro:beleidsmatigVerantwoordelijkeOverheid != 'nationale overheid'
                )
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101
                    and
                    imro:beleidsmatigVerantwoordelijkeOverheid != 'nationale overheid'
                    and
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp' 
                )                           
                ">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
                type = <iso:value-of select="name()"/>: 
                Een inpassingsplan van het Rijk met de status ontwerp met de datum 1 januari 2025 of later mag niet worden gepubliceerd. 
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
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                    and
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101
                    and
                    starts-with(imro:naam, 'TAM-voorbereidingsbesluit ')
                )
                or
                (
                    number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101 
                    and
                    starts-with(imro:naam, 'TAM-voorbereidingsbesluit ')
                    and
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'
                    and
                    imro:beleidsmatigVerantwoordelijkeOverheid = 'gemeentelijke overheid'
                )    
                "> 
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>,
                type = <iso:value-of select="name()"/>: 
                Vanaf 1 januari 2025 mogen het Rijk en de provincies hun Omgevingswet voorbereidingsbesluiten niet meer publiceren op basis van TAM. 
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
                     number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20240101
                 or
                 (
                     number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20240101 
                     and
                     number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20250101 
                     and 
                     (imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'  
                     or 
                     imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'ontwerp')
                 )
                 or
                 (                
                     number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20250101 
                     and 
                     imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld'  
                 )
                 "> 
                 IMRO-object met gml:id <iso:value-of select="@gml:id"/>, 
                 type = <iso:value-of select="name()"/>: 
                 Vanaf 1 januari 2025 mag een gemeente alleen een vastgestelde omgevingsvisie publiceren op basis van het Wro plantype structuurvisie publiceren als voor 1 januari 2025 de procedure is aangevangen.
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
    <!-- EINDE Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
</iso:schema>
