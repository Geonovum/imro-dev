<?xml version="1.0" encoding="UTF-8"?>
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <iso:ns prefix="imro" uri="http://www.geonovum.nl/imro/2012/1.1"/>
    <iso:ns prefix="imro2008" uri="http://www.geonovum.nl/imro/2008/1"/>
    <iso:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>    
    
    <!-- BEGIN Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
    <iso:let name="identificatie" value="@gml:id"/>
    <iso:pattern id="TAM">   
        
        <iso:rule context="//imro:Bestemmingsplangebied">
            
            <!-- Blokkeren BESTEMMINGSPLAN met status niet zijnde VASTGESTELD of GECONSOLIDEERD of naam begint niet met TAM-OMGEVINGSPLAN -->
            <!-- Na 2022-07-01 is van object Bestemmingsplangebied met typePlan 'bestemmingsplan' de planstatus 'vastgesteld' of 'geconsolideerd' of de naam begint met 'TAM-omgevingsplan' -->
            <iso:assert test="if (imro:typePlan = 'bestemmingsplan' and number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701) 
                then (imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'vastgesteld' or imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus = 'geconsolideerd') or starts-with(imro:naam, 'TAM-omgevingsplan') 
                else imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in imro:planstatus -> Als imro:typePlan is 'bestemmingsplan' en imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan moet imro:planstatus zijn 'vastgesteld' of 'geconsolideerd' of imro:naam moet beginnen met 'TAM-omgevingsplan'.
            </iso:assert>
            
            <!-- Blokkeren INPASSINGSPLAN en UITWERKINGSPLAN en WIJZIGINGSPLAN met status ONTWERP-->
            <!-- Na 2022-07-01 is van object Bestemmingsplangebied met typePlan 'inpassingsplan' of 'uitwerkingsplan' of 'wijzigingsplan' de planstatus niet 'ontwerp'-->
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701 and (imro:typePlan = 'inpassingsplan' or imro:typePlan = 'uitwerkingsplan' or imro:typePlan = 'wijzigingsplan')) 
                then imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp'
                else imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in imro:planstatus -> Als imro:typePlan is 'inpassingsplan' of 'uitwerkingsplan' of 'wijzigingsplan' en imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag imro:planstatus niet zijn 'ontwerp'.
            </iso:assert>                   
            
        </iso:rule>        
        
        <iso:rule context="//imro:Besluitgebied_A">
            
            <!-- Blokkeren AMVB en REGELING -->
            <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_A typePlan niet zijn 'amvb' of 'regeling'-->            
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701) then imro:typePlan != 'amvb' and imro:typePlan != 'regeling' else imro:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'amvb' of 'regeling'.   
            </iso:assert>
            
        </iso:rule>
        
        <iso:rule context="//imro:Besluitgebied_P">
            
            <!-- Blokkeren PROVINCIALE VERORDENING-->
            <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_P typePlan niet zijn 'provinciale verordening'-->        
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701) 
                then imro:typePlan != 'provinciale verordening'
                else imro:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'provinciale verordening'.   
            </iso:assert>
            
        </iso:rule>
        
        <iso:rule context="//imro:Besluitgebied_X"> 
            
            <!-- Blokkeren AANWIJZINGSBESLUIT en BEHEERSVERORDENING en REACTIEVE AANWIJZING-->
            <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'aanwijzigingsbesluit' of 'beheersverordening' of 'reactieve aanwijzing'-->        
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701) 
                then imro:typePlan != 'aanwijzingsbesluit' and imro:typePlan != 'beheersverordening' and imro:typePlan != 'reactieve aanwijzing'
                else imro:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'aanwijzigingsbesluit' of 'beheersverordening' of 'reactieve aanwijzing'.   
            </iso:assert>
            
            <!-- Blokkeren VOORBEREIDINGSBESLUIT niet zijnde TAM-Voorbereidingsbesluit-->
            <!-- Na 2022-07-01 is voor objecttype Besluitgebied_X typePlan niet 'voorbereidingsbesluit' of naam begint met 'TAM'-->        
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701) 
                then imro:typePlan != 'voorbereidingsbesluit' or starts-with(imro:naam, 'TAM')
                else imro:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'voorbereidingsbesluit' of imro:naam moet beginnen met 'TAM'.  
            </iso:assert>
            
            <!-- Blokkeren EXPLOITATIEPLAN met status ONTWERP -->
            <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X met typePlan 'exploitatieplan' niet hebben status 'ontwerp'-->        
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701 and imro:typePlan = 'exploitatieplan') 
                then imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus != 'ontwerp'
                else imro:planstatusInfo/imro:PlanstatusEnDatum/imro:planstatus">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:typePlan is 'exploitatieplan' en imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag planstatus niet zijn 'ontwerp'.   
            </iso:assert>
            
        </iso:rule>
                <iso:rule context="//imro2008:Besluitgebied_X"> 
           
            <!-- LET OP: IMRO2008 -->
            <!-- Blokkeren PROJECTBESLUIT en TIJDELIJK ONTHEFFING BUITENPLANS-->
            <!-- Na 2022-07-01 mag voor objecttype Besluitgebied_X typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'-->        
            <iso:assert test="if (number(replace(imro2008:planstatusInfo/imro2008:PlanstatusEnDatum_XGB/imro2008:datum, '-', '')) >= 20220701)                                                
                then imro2008:typePlan != 'projectbesluit' and imro2008:typePlan != 'tijdelijke ontheffing buitenplans'
                else imro2008:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'projectbesluit' of 'tijdelijke ontheffing buitenplans'.   
            </iso:assert>
            
        </iso:rule>
        
        <iso:rule context="//imro:Structuurvisieplangebied_G">
            
            <!-- Blokkeren STRUCTUURVISIE-->
            <!-- Na 2022-07-01 mag voor objecttype Structuurvisieplangebied_G typePlan niet zijn 'structuurvisie'--> 
            <iso:assert test="if (number(replace(imro:planstatusInfo/imro:PlanstatusEnDatum/imro:datum, '-', '')) >= 20220701)
                then imro:typePlan != 'structuurvisie'
                else imro:typePlan">
                IMRO-object met gml:id <iso:value-of select="@gml:id"/>, type = <iso:value-of select="name()"/>:
                Fout in typePlan -> Als imro:datum is groter dan of gelijk aan 2022-07-01, 
                dan mag typePlan niet zijn 'structuurvisie'.                 
            </iso:assert>          
            
        </iso:rule>
        
    </iso:pattern>
    <!-- EINDE Validaties t.b.v. Tijdelijke Alternatieve Maatregel c.q. Overgangsrecht Omgevingswet -->
</iso:schema>