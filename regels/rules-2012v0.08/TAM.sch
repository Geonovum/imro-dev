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
 * 30-10-2018	GD	Geodan/Kadaster. various corrections on 'Additional check. For plantype + overheid' implemented RPnl v.2.4.2.3 dd.29-10-2018.
 ******************************************************************************/

Opmerkingen / hints:

-->
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings"
    xmlns:func="http://exslt.org/functions" xml:lang="en">
    
    <iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2012/1.1"/>
    <iso:ns prefix="imro2008" uri="http://www.geonovum.nl/imro/2008/1"/>
    <iso:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    
    <!-- BEGIN Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
    <iso:let name="identificatie" value="@gml:id"/>
    <iso:pattern id="TAM">
        
        <iso:rule context="//imro:Bestemmingsplangebied[//imro:typePlan = 'bestemmingsplan']">
            
            <!-- Blokkeren BESTEMMINGSPLAN met status niet zijnde VASTGESTELD of GECONSOLIDEERD of naam begint niet met TAM-OMGEVINGSPLAN -->
            <!-- Na 2022-07-01 is van object Bestemmingsplangebied met typePlan 'bestemmingsplan' de planstatus 'vastgesteld' of 'geconsolideerd' of de naam begint met 'TAM-omgevingsplan' -->
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 
                and
                ((imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' or imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'geconsolideerd')
                or
                starts-with(imro:naam, 'TAM-omgevingsplan ')
                )
                )
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)                    
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in imro:planstatus -> Als imro:typePlan is
                'bestemmingsplan' en imro:datum is groter dan of gelijk aan 2022-07-01, dan moet
                imro:planstatus zijn 'vastgesteld' of 'geconsolideerd' of imro:naam moet beginnen
                met 'TAM-omgevingsplan '. </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren INPASSINGSPLAN en UITWERKINGSPLAN en WIJZIGINGSPLAN met status ONTWERP-->
        <!-- Na 2022-07-01 is van object Bestemmingsplangebied met typePlan 'inpassingsplan' of 'uitwerkingsplan' of 'wijzigingsplan' de planstatus niet 'ontwerp'-->
        <iso:rule
            context="//imro:Bestemmingsplangebied[//imro:typePlan = 'inpassingsplan' or //imro:typePlan = 'uitwerkingsplan' or //imro:typePlan = 'wijzigingsplan']">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 and (imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp'))
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)                    
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in imro:planstatus -> Als imro:typePlan is
                'inpassingsplan' of 'uitwerkingsplan' of 'wijzigingsplan' en imro:datum is groter
                dan of gelijk aan 2022-07-01, dan mag imro:planstatus niet zijn 'ontwerp'.
            </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren AMVB en REGELING -->
        <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_A typePlan niet zijn 'amvb' of 'regeling'-->
        <iso:rule context="//imro:Besluitgebied_A">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 and (imro:typePlan != 'amvb' and imro:typePlan != 'regeling'))
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'amvb' of 'regeling'. </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren PROVINCIALE VERORDENING-->
        <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_P typePlan niet zijn 'provinciale verordening'-->
        <iso:rule context="//imro:Besluitgebied_P">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701 and imro:typePlan != 'provinciale verordening')
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'provinciale verordening'. </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren AANWIJZINGSBESLUIT en BEHEERSVERORDENING en REACTIEVE AANWIJZING-->
        <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'beheersverordening' of 'reactieve aanwijzing'-->
        <iso:rule
            context="//imro:Besluitgebied_X[//imro:typePlan = 'beheersverordening' or //imro:typePlan = 'reactieve aanwijzing']">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 and (imro:typePlan != 'beheersverordening' and imro:typePlan != 'reactieve aanwijzing'))
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'beheersverordening' of 'reactieve aanwijzing'. </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren VOORBEREIDINGSBESLUIT niet zijnde TAM-Voorbereidingsbesluit-->
        <!-- Na 2022-07-01 is voor objecttype Besluitgebied_X typePlan niet 'voorbereidingsbesluit' of naam begint met 'TAM-voorbereidingsbesluit'-->
        <iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'voorbereidingsbesluit']">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 and (imro:typePlan != 'voorbereidingsbesluit' or starts-with(imro:naam, 'TAM-voorbereidingsbesluit ')))
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'voorbereidingsbesluit' of imro:naam moet
                beginnen met 'TAM-voorbereidingsbesluit '. </iso:assert>
        </iso:rule>
        
        
        <!-- Blokkeren EXPLOITATIEPLAN met status ONTWERP -->
        <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X met typePlan 'exploitatieplan' niet hebben status 'ontwerp'-->
        <iso:rule context="//imro:Besluitgebied_X[//imro:typePlan = 'exploitatieplan']">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &gt;= 20220701 and imro:typePlan = 'exploitatieplan' and imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp')
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:typePlan is 'exploitatieplan' en
                imro:datum is groter dan of gelijk aan 2022-07-01, dan mag planstatus niet zijn
                'ontwerp'. </iso:assert>
        </iso:rule>
        
        <!-- LET OP: IMRO2008 -->
        <!-- Blokkeren PROJECTBESLUIT en TIJDELIJK ONTHEFFING BUITENPLANS-->
        <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'-->
        <iso:rule context="//imro2008:Besluitgebied_X">
            <iso:assert
                test="
                (number(translate(imro2008:planstatusInfo/imro2008:PlanstatusEnDatum_XGB/imro2008:datum, '-', '')) &gt;= 20220701 and (imro2008:typePlan != 'projectbesluit' and imro2008:typePlan != 'tijdelijke ontheffing buitenplans'))
                or
                (number(translate(imro2008:planstatusInfo/imro2008:PlanstatusEnDatum_XGB/imro2008:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'projectbesluit' of 'tijdelijke
                ontheffing buitenplans'. </iso:assert>
        </iso:rule>
        
        <!-- Blokkeren STRUCTUURVISIE-->
        <!-- Na 2022-07-01 mag voor objecttype Structuurvisieplangebied_G typePlan niet zijn 'structuurvisie'-->
        <iso:rule context="//imro:Structuurvisieplangebied_G">
            <iso:assert
                test="
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701 and imro:typePlan != 'structuurvisie')
                or
                (number(translate(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) &lt; 20220701)
                "
                > IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of
                    select="name()"/>: Fout in typePlan -> Als imro:datum is groter dan of gelijk
                aan 2022-07-01, dan mag typePlan niet zijn 'structuurvisie'. </iso:assert>
        </iso:rule>
        
    </iso:pattern>
    
</iso:schema>
