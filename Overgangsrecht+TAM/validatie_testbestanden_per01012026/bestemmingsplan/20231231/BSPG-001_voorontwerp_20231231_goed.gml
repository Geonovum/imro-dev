<?xml version="1.0" encoding="utf-8"?>
<!-- TESTBESTAND
	
	  TESTCASE: 		BESTEMMINGSPLAN met planstatus VOORONTWERP vóór 01-01-2024 toestaan
  	TESTINPUT:		<imro:planstatus> = 'voorontwerp' && <imro:datum>2023-12-31</imro:datum>  	
      TESTRESULTAAT:	GOED, niet blokkeren.
	
-->
<imro:FeatureCollectionIMRO gml:id="NL.IMRO.FEATURECOLLECTION" xmlns:imro="http://www.geonovum.nl/imro/2012/1.1" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.geonovum.nl/imro/2012/1.1 http://schemas.geonovum.nl/imro/2012/1.1/IMRO2012.xsd">
   <imro:featureMember>
      <imro:MetadataIMRObestand gml:id="NL.IMRO.METADATA">
         <imro:datasetTitel>Raadhuisstaete Spijkenisse</imro:datasetTitel>
         <imro:creatiedatum>2021-11-15</imro:creatiedatum>
         <imro:bronbeheerder>Gemeente Nissewaard</imro:bronbeheerder>
         <imro:codeerVerantwoordelijke>BraGIS BV</imro:codeerVerantwoordelijke>
         <imro:naamApplicatieschema>IMRO2012</imro:naamApplicatieschema>
         <imro:codeReferentiesysteem>28992</imro:codeReferentiesysteem>
         <imro:toepassingsschaal>1000</imro:toepassingsschaal>
         <imro:applicatieIdentificatie>GISkit PlanKaart IMRO2012</imro:applicatieIdentificatie>
         <imro:versieXMLschema>0.0.1</imro:versieXMLschema>
      </imro:MetadataIMRObestand>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Maatvoering gml:id="NL.IMRO.a8b3ec51eea648adaa250900a85db786">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>a8b3ec51eea648adaa250900a85db786</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>maatvoering</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:naam>maximum bouwhoogte (m)</imro:naam>
         <imro:symboolInfo>
            <imro:SymboolEnPositie>
               <imro:symboolCode>s104</imro:symboolCode>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.25b3cfbd4ecf495eb055897ea03f6b0c">
                           <gml:pos>82171.924 429375.607</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:SymboolEnPositie>
         </imro:symboolInfo>
         <imro:maatvoeringInfo>
            <imro:WaardeEnType>
               <imro:waarde>24</imro:waarde>
               <imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
               <imro:symboolCode>s104</imro:symboolCode>
            </imro:WaardeEnType>
         </imro:maatvoeringInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.76713cae9a7f46278d254b83085e3309" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82165.136 429377.645 82173.557 429367.518 82179.268 429372.294 82170.86 429382.405 82165.136 429377.645</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:aanduiding xlink:href="#NL.IMRO.7e528d458cf44250b6e625300991d66a" />
      </imro:Maatvoering>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Maatvoering gml:id="NL.IMRO.0f406ab40bab4c77b6496fb9452afaed">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>0f406ab40bab4c77b6496fb9452afaed</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>maatvoering</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:naam>maximum bouwhoogte (m)</imro:naam>
         <imro:symboolInfo>
            <imro:SymboolEnPositie>
               <imro:symboolCode>s104</imro:symboolCode>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.431ccb94126a475d9815d2aa144a6ba0">
                           <gml:pos>82166.466 429370.226</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:SymboolEnPositie>
         </imro:symboolInfo>
         <imro:maatvoeringInfo>
            <imro:WaardeEnType>
               <imro:waarde>27</imro:waarde>
               <imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
               <imro:symboolCode>s104</imro:symboolCode>
            </imro:WaardeEnType>
         </imro:maatvoeringInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.caba77a0d66b4b1fa4ebbd2c10cbe8ae" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82159.6 429373.041 82168.034 429362.899 82173.557 429367.518 82165.136 429377.645 82159.6 429373.041</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:aanduiding xlink:href="#NL.IMRO.7e528d458cf44250b6e625300991d66a" />
      </imro:Maatvoering>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Maatvoering gml:id="NL.IMRO.423fb19b14554561bdad98c9410245b5">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>423fb19b14554561bdad98c9410245b5</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>maatvoering</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:naam>maximum bouwhoogte (m)</imro:naam>
         <imro:symboolInfo>
            <imro:SymboolEnPositie>
               <imro:symboolCode>s104</imro:symboolCode>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.46094a11e0f34bd088745a06f890e9a0">
                           <gml:pos>82158.791 429363.531</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:SymboolEnPositie>
         </imro:symboolInfo>
         <imro:maatvoeringInfo>
            <imro:WaardeEnType>
               <imro:waarde>30</imro:waarde>
               <imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
               <imro:symboolCode>s104</imro:symboolCode>
            </imro:WaardeEnType>
         </imro:maatvoeringInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.a7f8cc6dbce64931aecf45544bececbb" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82148.528 429363.834 82156.968 429353.684 82165.49 429360.771 82168.034 429362.899 82159.6 429373.041 82148.528 429363.834</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:aanduiding xlink:href="#NL.IMRO.7e528d458cf44250b6e625300991d66a" />
      </imro:Maatvoering>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Maatvoering gml:id="NL.IMRO.320fe708e40d468d91cac3a889f428f1">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>320fe708e40d468d91cac3a889f428f1</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>maatvoering</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:naam>maximum bouwhoogte (m)</imro:naam>
         <imro:symboolInfo>
            <imro:SymboolEnPositie>
               <imro:symboolCode>s104</imro:symboolCode>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.9e213bf7b76d444fa068c3f207f83270">
                           <gml:pos>82148.186 429336.191</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:SymboolEnPositie>
         </imro:symboolInfo>
         <imro:maatvoeringInfo>
            <imro:WaardeEnType>
               <imro:waarde>34</imro:waarde>
               <imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
               <imro:symboolCode>s104</imro:symboolCode>
            </imro:WaardeEnType>
         </imro:maatvoeringInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.8ddd5b3a88314645a953b75d44c0cf08" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82148.528 429363.834 82138.592 429355.571 82136.246 429353.606 82130.704 429349.008 82130.289 429348.663 82127.926 429346.706 82127.513 429346.358 82127.854 429345.945 82139.036 429332.494 82139.381 429332.079 82142.297 429328.573 82142.642 429328.158 82148.81 429320.741 82149.156 429320.326 82152.07 429316.821 82152.416 429316.406 82155.326 429312.906 82155.671 429312.491 82156.086 429312.836 82158.854 429315.137 82163.359 429318.884 82164.021 429319.435 82168.412 429323.087 82171.925 429326.008 82163.445 429336.205 82159.931 429333.286 82148.691 429346.801 82156.968 429353.684 82148.528 429363.834</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:aanduiding xlink:href="#NL.IMRO.7e528d458cf44250b6e625300991d66a" />
      </imro:Maatvoering>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Bouwaanduiding gml:id="NL.IMRO.73fe92e9d0c64bf18f5050b1e27a2c57">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>73fe92e9d0c64bf18f5050b1e27a2c57</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:bestemmingsvlak xlink:href="#NL.IMRO.0de575642f7f4be8b3a6b7382868741a" />
         <imro:naam>bijgebouwen</imro:naam>
         <imro:labelInfo>
            <imro:Label>
               <imro:tekst>[bg]</imro:tekst>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.f9d4ca0587484bd7ba9d6f108ec571f1">
                           <gml:pos>82165.631 429356.298</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:Label>
         </imro:labelInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.c21d24525467425db6356ef0a3de838a" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82179.268 429372.294 82165.49 429360.771 82148.691 429346.801 82159.931 429333.286 82163.445 429336.205 82160.208 429340.097 82156.971 429343.988 82157.827 429344.703 82166.01 429351.544 82174.193 429358.385 82175.701 429356.581 82180.601 429360.691 82185.501 429364.801 82182.529 429368.373 82179.268 429372.294</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
      </imro:Bouwaanduiding>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Bouwvlak gml:id="NL.IMRO.7e528d458cf44250b6e625300991d66a">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>7e528d458cf44250b6e625300991d66a</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>bouwvlak</imro:typePlanobject>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
         <imro:bestemmingsvlak xlink:href="#NL.IMRO.0de575642f7f4be8b3a6b7382868741a" />
         <imro:naam>bouwvlak</imro:naam>
         <imro:geometrie>
            <gml:Surface gml:id="id.8bbcca2ac8674aa087bb398395cdd125" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82164.021 429319.435 82168.412 429323.087 82171.925 429326.008 82163.445 429336.205 82159.931 429333.286 82148.691 429346.801 82165.49 429360.771 82179.268 429372.294 82170.86 429382.405 82138.592 429355.571 82136.246 429353.606 82130.704 429349.008 82130.289 429348.663 82127.926 429346.706 82127.513 429346.358 82127.854 429345.945 82139.036 429332.494 82139.381 429332.079 82142.297 429328.573 82142.642 429328.158 82148.81 429320.741 82149.156 429320.326 82152.07 429316.821 82152.416 429316.406 82155.326 429312.906 82155.671 429312.491 82156.086 429312.836 82158.854 429315.137 82163.359 429318.884 82164.021 429319.435</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
      </imro:Bouwvlak>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Dubbelbestemming gml:id="NL.IMRO.63acc30f84e54020bbfde4c67af18834">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>63acc30f84e54020bbfde4c67af18834</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>dubbelbestemming</imro:typePlanobject>
         <imro:naam>Waarde - Archeologie 3</imro:naam>
         <imro:bestemmingshoofdgroep>waarde</imro:bestemmingshoofdgroep>
         <imro:artikelnummer>4</imro:artikelnummer>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentie_BP>
               <imro:verwijzingNaarTekst>r_NL.IMRO.1930.BPRaadhuislaanSP-1001.html#NL.IMRO.PT.2bac3cf770984d1aa9a47beff2eece29</imro:verwijzingNaarTekst>
               <imro:typeTekst>regels</imro:typeTekst>
            </imro:TekstReferentie_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:labelInfo>
            <imro:Label>
               <imro:tekst>WR-A3</imro:tekst>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.d027c61dc1c84c919674eb3eec7529e8">
                           <gml:pos>82155.422 429328.427</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:Label>
         </imro:labelInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.90269d54e87045ada2ede732e86d3d83" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82142.642 429328.158 82148.81 429320.741 82148.983 429320.534 82149.156 429320.326 82152.07 429316.821 82152.243 429316.613 82152.416 429316.406 82155.326 429312.906 82155.499 429312.699 82155.671 429312.491 82155.879 429312.664 82156.086 429312.836 82159.727 429315.864 82160.142 429316.209 82162.082 429317.822 82164.021 429319.435 82164.444 429319.787 82166.216 429321.261 82167.989 429322.735 82168.412 429323.087 82169.945 429324.362 82171.925 429326.008 82167.685 429331.107 82163.445 429336.205 82160.208 429340.097 82156.971 429343.988 82157.827 429344.703 82166.01 429351.544 82174.193 429358.385 82175.701 429356.581 82180.601 429360.691 82185.501 429364.801 82182.529 429368.373 82179.268 429372.294 82175.444 429376.893 82171.62 429381.491 82170.86 429382.405 82154.726 429368.988 82138.592 429355.571 82130.704 429349.008 82130.289 429348.663 82127.926 429346.706 82127.719 429346.532 82127.513 429346.358 82127.598 429346.255 82127.684 429346.151 82127.854 429345.945 82139.036 429332.494 82139.381 429332.079 82142.297 429328.573 82142.642 429328.158</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
      </imro:Dubbelbestemming>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Enkelbestemming gml:id="NL.IMRO.0de575642f7f4be8b3a6b7382868741a">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>0de575642f7f4be8b3a6b7382868741a</imro:lokaalID>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlanobject>enkelbestemming</imro:typePlanobject>
         <imro:naam>Gemengd - 1</imro:naam>
         <imro:bestemmingshoofdgroep>gemengd</imro:bestemmingshoofdgroep>
         <imro:artikelnummer>3</imro:artikelnummer>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentie_BP>
               <imro:verwijzingNaarTekst>r_NL.IMRO.1930.BPRaadhuislaanSP-1001.html#NL.IMRO.PT.b42f969651f3449689f47a134bb98769</imro:verwijzingNaarTekst>
               <imro:typeTekst>regels</imro:typeTekst>
            </imro:TekstReferentie_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:labelInfo>
            <imro:Label>
               <imro:tekst>GD-1</imro:tekst>
               <imro:positie>
                  <imro:Labelpositie>
                     <imro:plaatsingspunt>
                        <gml:Point srsName="urn:ogc:def:crs:EPSG::28992" gml:id="id.7e49f55fffae44bca50c39adc55b7702">
                           <gml:pos>82139.258 429343.445</gml:pos>
                        </gml:Point>
                     </imro:plaatsingspunt>
                  </imro:Labelpositie>
               </imro:positie>
            </imro:Label>
         </imro:labelInfo>
         <imro:geometrie>
            <gml:Surface gml:id="id.526a44b9b9ef48dab61ecba05ccf88a6" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82142.642 429328.158 82148.81 429320.741 82148.983 429320.534 82149.156 429320.326 82152.07 429316.821 82152.243 429316.613 82152.416 429316.406 82155.326 429312.906 82155.499 429312.699 82155.671 429312.491 82155.879 429312.664 82156.086 429312.836 82159.727 429315.864 82160.142 429316.209 82162.082 429317.822 82164.021 429319.435 82164.444 429319.787 82166.216 429321.261 82167.989 429322.735 82168.412 429323.087 82169.945 429324.362 82171.925 429326.008 82167.685 429331.107 82163.445 429336.205 82160.208 429340.097 82156.971 429343.988 82157.827 429344.703 82166.01 429351.544 82174.193 429358.385 82175.701 429356.581 82180.601 429360.691 82185.501 429364.801 82182.529 429368.373 82179.268 429372.294 82175.444 429376.893 82171.62 429381.491 82170.86 429382.405 82154.726 429368.988 82138.592 429355.571 82130.704 429349.008 82130.289 429348.663 82127.926 429346.706 82127.719 429346.532 82127.513 429346.358 82127.598 429346.255 82127.684 429346.151 82127.854 429345.945 82139.036 429332.494 82139.381 429332.079 82142.297 429328.573 82142.642 429328.158</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
         <imro:plangebied xlink:href="#NL.IMRO.1930.BPRaadhuislaanSP-1001" />
      </imro:Enkelbestemming>
   </imro:featureMember>
   <imro:featureMember>
      <imro:Bestemmingsplangebied gml:id="NL.IMRO.1930.BPRaadhuislaanSP-1001">
         <imro:identificatie>
            <imro:NEN3610ID>
               <imro:namespace>NL.IMRO</imro:namespace>
               <imro:lokaalID>1930.BPRaadhuislaanSP</imro:lokaalID>
               <imro:versie>1001</imro:versie>
            </imro:NEN3610ID>
         </imro:identificatie>
         <imro:typePlan>bestemmingsplan</imro:typePlan>
         <imro:beleidsmatigVerantwoordelijkeOverheid>gemeentelijke overheid</imro:beleidsmatigVerantwoordelijkeOverheid>
         <imro:naamOverheid>Gemeente Nissewaard</imro:naamOverheid>
         <imro:overheidsCode>1930</imro:overheidsCode>
         <imro:naam>Raadhuisstaete Spijkenisse</imro:naam>
         <imro:locatieNaam>Raadhuislaan 39 - 55 Spijkenisse</imro:locatieNaam>
         <imro:planstatusInfo>
            <imro:PlanstatusEnDatum>
               <imro:planstatus>voorontwerp</imro:planstatus>
               <imro:datum>2023-12-31</imro:datum>
            </imro:PlanstatusEnDatum>
         </imro:planstatusInfo>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentiePG_BP>
               <imro:verwijzingNaarTekst>b_NL.IMRO.1930.BPRaadhuislaanSP-1001_regels.html</imro:verwijzingNaarTekst>
               <imro:typeTekst>bijlage bij regels</imro:typeTekst>
            </imro:TekstReferentiePG_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentiePG_BP>
               <imro:verwijzingNaarTekst>r_NL.IMRO.1930.BPRaadhuislaanSP-1001.html</imro:verwijzingNaarTekst>
               <imro:typeTekst>regels</imro:typeTekst>
            </imro:TekstReferentiePG_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentiePG_BP>
               <imro:verwijzingNaarTekst>b_NL.IMRO.1930.BPRaadhuislaanSP-1001_toelichting.html</imro:verwijzingNaarTekst>
               <imro:typeTekst>bijlage bij toelichting</imro:typeTekst>
            </imro:TekstReferentiePG_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:verwijzingNaarTekstInfo>
            <imro:TekstReferentiePG_BP>
               <imro:verwijzingNaarTekst>t_NL.IMRO.1930.BPRaadhuislaanSP-1001.pdf</imro:verwijzingNaarTekst>
               <imro:typeTekst>toelichting</imro:typeTekst>
            </imro:TekstReferentiePG_BP>
         </imro:verwijzingNaarTekstInfo>
         <imro:ondergrondInfo>
            <imro:OndergrondReferentie>
               <imro:ondergrondtype>basisregistratie grootschalige topografie (BGT)</imro:ondergrondtype>
               <imro:ondergronddatum>2021-11-15</imro:ondergronddatum>
            </imro:OndergrondReferentie>
         </imro:ondergrondInfo>
         <imro:verwijzingNorm>IMRO2012</imro:verwijzingNorm>
         <imro:verwijzingNorm>PRBP2012</imro:verwijzingNorm>
         <imro:verwijzingNorm>PRABPK2012</imro:verwijzingNorm>
         <imro:geometrie>
            <gml:Surface gml:id="id.74ff051694d849a793dd267c3203a3c5" srsName="urn:ogc:def:crs:EPSG::28992">
               <gml:patches>
                  <gml:PolygonPatch>
                     <gml:exterior>
                        <gml:LinearRing>
                           <gml:posList>82142.642 429328.158 82148.81 429320.741 82148.983 429320.534 82149.156 429320.326 82152.07 429316.821 82152.243 429316.613 82152.416 429316.406 82155.326 429312.906 82155.499 429312.699 82155.671 429312.491 82155.879 429312.664 82156.086 429312.836 82159.727 429315.864 82160.142 429316.209 82162.082 429317.822 82164.021 429319.435 82164.444 429319.787 82166.216 429321.261 82167.989 429322.735 82168.412 429323.087 82169.945 429324.362 82171.925 429326.008 82167.685 429331.107 82163.445 429336.205 82160.208 429340.097 82156.971 429343.988 82157.827 429344.703 82166.01 429351.544 82174.193 429358.385 82175.701 429356.581 82180.601 429360.691 82185.501 429364.801 82182.529 429368.373 82179.268 429372.294 82175.444 429376.893 82171.62 429381.491 82170.86 429382.405 82154.726 429368.988 82138.592 429355.571 82130.704 429349.008 82130.289 429348.663 82127.926 429346.706 82127.719 429346.532 82127.513 429346.358 82127.598 429346.255 82127.684 429346.151 82127.854 429345.945 82139.036 429332.494 82139.381 429332.079 82142.297 429328.573 82142.642 429328.158</gml:posList>
                        </gml:LinearRing>
                     </gml:exterior>
                  </gml:PolygonPatch>
               </gml:patches>
            </gml:Surface>
         </imro:geometrie>
      </imro:Bestemmingsplangebied>
   </imro:featureMember>
</imro:FeatureCollectionIMRO>
