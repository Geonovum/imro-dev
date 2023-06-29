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
 * 29-06-2023   AdB Tegenbouden bestemmingsplan met naam beginnend met TAMomgevingsplan en status is niet concept, voorontwerp of ontwerp 
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

        <iso:rule context="//imro:Bestemmingsplangebied[//imro:typePlan = 'bestemmingsplan']">

            <!-- Blokkeren BESTEMMINGSPLAN met naam begint met 'TAM-omgevingsplan en status niet zijnde CONCEPT of VOORONTWERP of ONTWERP -->
            <!-- Als object Bestemmingsplangebied met typePlan 'bestemmingsplan' de naam begint met 'TAM-omgevingsplan ' en de planstatus is 'concept' of 'voorontwerp' of 'ontwerp', of naam begint niet met 'TAM-omgevingsplan ' -->
            <iso:assert test="
                    (
                    starts-with(imro:naam, 'TAM-omgevingsplan ')
                    and
                    (
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'concept'
                    or
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'voorontwerp'
                    or
                    imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'ontwerp'
                    )
                    )
                    or
                    (not(starts-with(imro:naam, 'TAM-omgevingsplan ')))
                    "> IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type =
                    <iso:value-of select="name()"/>: Fout in planstatus -> Als typePlan is
                'bestemmingsplan' en naam begint met 'TAM-omgevingsplan ', dan moet planstatus zijn
                'concept' of 'voorontwerp' of 'ontwerp'.</iso:assert>
        </iso:rule>



    </iso:pattern>

</iso:schema>
