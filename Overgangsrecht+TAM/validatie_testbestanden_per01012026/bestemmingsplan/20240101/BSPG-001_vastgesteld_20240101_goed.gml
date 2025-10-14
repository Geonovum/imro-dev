<?xml version="1.0" encoding="UTF-8"?>
<!-- TESTBESTAND
	
	  TESTCASE: 		BESTEMMINGSPLAN met planstatus VASTGESTELD per 01-01-2024 toestaan
  	TESTINPUT:		<imro:planstatus> = 'vastgesteld' && <imro:datum>2024-01-01</imro:datum>  	
      TESTRESULTAAT:	GOED, niet blokkeren.
	
-->
<imro:FeatureCollectionIMRO gml:id="Collectie" xmlns:imro="http://www.geonovum.nl/imro/2012/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.geonovum.nl/imro/2012/1.1 http://schemas.geonovum.nl/imro/2012/1.1/IMRO2012.xsd">
	<gml:description>RoPlan IMRO GML import/export. Converteert IMRO GML data naar RoPlan bestanden en vice versa</gml:description>
	<!--Bestand aangemaakt m.b.v. Crotec's RoPlan IMRO Export versie 3.0.1 (voor v8i)-->
	<gml:name>NL.IMRO.0202.974-0301.gml</gml:name>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP5488278903-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP5488278903-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id170" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191200.862 441537.472</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id2" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id3">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191208.786 441541.378 191203.234 441544.639</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191203.234 441544.639 191202.007 441545.366</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191202.007 441545.366 191200.854 441546.05</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191200.854 441546.05 191198.098 441542.895</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191198.098 441542.895 191196.754 441541.356</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191196.754 441541.356 191195.352 441539.751 191193.238 441537.33</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191193.238 441537.33 191199.716 441531.673</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191199.716 441531.673 191198.672 441530.478 191181.504 441510.82</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191181.504 441510.82 191182.545 441509.911</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.545 441509.911 191189.607 441518.001</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191189.607 441518.001 191191.12 441519.734</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191191.12 441519.734 191204.476 441535.021</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191204.476 441535.021 191208.993 441531.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191208.993 441531.076 191210.107 441532.352</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191210.107 441532.352 191211.513 441537.247 191208.786 441541.378</gml:posList>
												</gml:Arc>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA19484996329-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA19484996329-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP8488278955-00"/>
			<imro:naam>specifieke bouwaanduiding - 2</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-2]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id171" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191162.817 441488.739</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id172" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191183.073 441498.806</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id6" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id7">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191187.647 441501.391 191185.764 441503.035</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191185.764 441503.035 191181.62 441498.29</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191181.62 441498.29 191182.151 441497.826</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.151 441497.826 191183.921 441497.124</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191183.921 441497.124 191187.647 441501.391</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA3485948110-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA3485948110-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP109485006223-00"/>
			<imro:naam>specifieke bouwaanduiding - 1</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-1]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id173" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191286.014 441448.488</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id174" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191296.172 441457.386</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id10" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id11">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191291.533 441452.712 191292.289 441452.054</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191292.289 441452.054 191300.168 441461.078</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191300.168 441461.078 191299.413 441461.735</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191299.413 441461.735 191291.533 441452.712</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP111485006370-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP111485006370-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id175" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191438.223 441384.299</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id14" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id15">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191468.93 441357.532 191470.397 441361.886 191468.37 441365.993</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191468.37 441365.993 191451.865 441381.712 191440.111 441392</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191440.111 441392 191437.907 441393.929</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.907 441393.929 191437.155 441394.588</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.155 441394.588 191433.756 441397.562 191429.833 441400.72</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.833 441400.72 191425.766 441403.869</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191425.766 441403.869 191421.699 441407.018</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191421.699 441407.018 191417.806 441410.028</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191417.806 441410.028 191414.985 441412.128</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191414.985 441412.128 191413.067 441413.547</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191413.067 441413.547 191411.148 441414.967</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191411.148 441414.967 191406.851 441416.171 191402.977 441414.152</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191402.977 441414.152 191401.663 441412.648</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.663 441412.648 191401.813 441412.516 191421.862 441395.059</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191421.862 441395.059 191423.129 441396.426 191423.929 441396.772 191425.155 441396.432</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191425.155 441396.432 191426.183 441395.981</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191426.183 441395.981 191426.871 441395.475</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191426.871 441395.475 191427.986 441396.653</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191427.986 441396.653 191428.364 441396.295</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.364 441396.295 191429.151 441397.127</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.151 441397.127 191430.556 441395.798</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191430.556 441395.798 191429.003 441394.157 191429.12 441393.087 191429.991 441392.022 191429.967 441391.004 191428.747 441388.896</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.747 441388.896 191436.503 441382.122 191460.68 441361.007</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191460.68 441361.007 191447.097 441345.443</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191447.097 441345.443 191448.601 441344.134</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191448.601 441344.134 191462.186 441359.692</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191462.186 441359.692 191467.082 441355.416</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191467.082 441355.416 191468.93 441357.532</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP61485005127-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP61485005127-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id176" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191293.404 441459.016</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>10</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id16" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id17">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191291.533 441452.712 191299.401 441461.746</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191299.401 441461.746 191295.762 441464.915</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191295.762 441464.915 191287.894 441455.881</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191287.894 441455.881 191291.533 441452.712</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA49485004843-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA49485004843-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id177" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191257.181 441459.068</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id178" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191272.67 441467.501</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id20" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id21">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191289.866 441450.803 191291.533 441452.712</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191291.533 441452.712 191256.529 441483.2</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.529 441483.2 191254.861 441481.291</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191254.861 441481.291 191289.866 441450.803</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP10488278994-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP10488278994-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Verkeer - Verblijfsgebied</imro:naam>
			<imro:bestemmingshoofdgroep>verkeer</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>5</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s194</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>V-VB</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id179" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191248.937 441516.819</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id24" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id25">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191215.47 441531.804 191219.034 441533.78 191223.019 441533.036</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191223.019 441533.036 191223.369 441532.831 191231.894 441527.844</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191231.894 441527.844 191232.109 441527.718</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191232.109 441527.718 191233.081 441523.905</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191233.081 441523.905 191252.672 441512.442</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191252.672 441512.442 191256.533 441513.427</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.533 441513.427 191256.731 441513.311 191262.27 441510.07</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191262.27 441510.07 191265.102 441505.839 191263.69 441500.986</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191263.69 441500.986 191256.58 441492.845</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.58 441492.845 191251.684 441497.12</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191251.684 441497.12 191238.091 441481.552</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191238.091 441481.552 191237.599 441480.988</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.599 441480.988 191246.046 441473.638</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.046 441473.638 191253.651 441482.346</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191253.651 441482.346 191267.278 441497.949</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191267.278 441497.949 191267.128 441498.081</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191267.128 441498.081 191269.159 441500.407</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191269.159 441500.407 191272.79 441502.394 191276.74 441501.619</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191276.74 441501.619 191277.473 441501.176</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191277.473 441501.176 191278.478 441500.588 191279.469 441500</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191279.469 441500 191283.652 441497.517 191283.797 441497.431</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191283.797 441497.431 191284.776 441493.595</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191284.776 441493.595 191304.104 441481.987</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191304.104 441481.987 191307.883 441482.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.883 441482.951 191307.943 441482.914</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.943 441482.914 191314.667 441478.78</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191314.667 441478.78 191317.659 441474.415 191316.241 441469.601</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191316.241 441469.601 191309.099 441461.424</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191309.099 441461.424 191304.223 441465.723</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191304.223 441465.723 191290.622 441450.145</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191290.622 441450.145 191290.129 441449.58</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191290.129 441449.58 191298.562 441442.214</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191298.562 441442.214 191305.327 441449.961</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191305.327 441449.961 191318.946 441465.554</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.946 441465.554 191318.796 441465.686</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.796 441465.686 191321.384 441468.649</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191321.384 441468.649 191324.946 441470.626 191328.879 441469.912</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191328.879 441469.912 191329.73 441466.142</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191329.73 441466.142 191349.483 441453.312</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191349.483 441453.312 191351.006 441452.319</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191351.006 441452.319 191381.567 441432.411</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191381.567 441432.411 191385.322 441433.167</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.322 441433.167 191389.424 441430.439</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191389.424 441430.439 191393.646 441427.632</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191393.646 441427.632 191397.58 441424.818</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191397.58 441424.818 191400.073 441420.379 191398.608 441415.991</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191398.608 441415.991 191391.974 441408.395</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191391.974 441408.395 191387.078 441412.67</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191387.078 441412.67 191373.5 441397.12</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191373.5 441397.12 191369.714 441392.784</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191369.714 441392.784 191378.147 441385.419</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191378.147 441385.419 191401.813 441412.516</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.813 441412.516 191401.663 441412.648</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.663 441412.648 191402.977 441414.152</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191402.977 441414.152 191406.952 441416.181 191411.148 441414.967</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191411.148 441414.967 191413.067 441413.547</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191413.067 441413.547 191414.985 441412.128</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191414.985 441412.128 191417.806 441410.028</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191417.806 441410.028 191421.699 441407.018</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191421.699 441407.018 191425.766 441403.869</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191425.766 441403.869 191429.833 441400.72</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.833 441400.72 191433.756 441397.562 191437.155 441394.588</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.155 441394.588 191437.907 441393.929</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.907 441393.929 191440.111 441392</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191440.111 441392 191451.865 441381.712</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191451.865 441381.712 191468.37 441365.993</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191468.37 441365.993 191470.398 441361.871 191468.93 441357.532</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191468.93 441357.532 191467.082 441355.416</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191467.082 441355.416 191462.186 441359.692</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191462.186 441359.692 191448.601 441344.134</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191448.601 441344.134 191443.156 441337.898</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191443.156 441337.898 191451.617 441330.564</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191451.617 441330.564 191470.762 441352.484</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191470.762 441352.484 191470.635 441352.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191470.635 441352.643 191471.443 441353.568</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191471.443 441353.568 191475.187 441355.552 191479.242 441354.857</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191479.242 441354.857 191480.199 441353.857</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191480.199 441353.857 191484.329 441357.799</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191484.329 441357.799 191485.233 441358.764</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191485.233 441358.764 191478.785 441365.122</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191478.785 441365.122 191473.705 441370.131</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191473.705 441370.131 191471.575 441372.277</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191471.575 441372.277 191469.334 441374.53</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191469.334 441374.53 191467.869 441375.911</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191467.869 441375.911 191464.64 441378.918</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191464.64 441378.918 191461.411 441381.926</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191461.411 441381.926 191455.7 441387.184</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191455.7 441387.184 191449.259 441392.918</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191449.259 441392.918 191447.945 441394.053</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191447.945 441394.053 191445.671 441396.058</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191445.671 441396.058 191443.896 441397.581</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191443.896 441397.581 191439.477 441401.484</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191439.477 441401.484 191435.148 441405.147</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191435.148 441405.147 191430.698 441408.661</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191430.698 441408.661 191422.854 441414.594</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.854 441414.594 191422.018 441415.266</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.018 441415.266 191416.643 441419.273</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191416.643 441419.273 191415.625 441421.144</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191415.625 441421.144 191411.289 441424.274</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191411.289 441424.274 191405.823 441428.401</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191405.823 441428.401 191403.036 441430.495</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191403.036 441430.495 191401.383 441431.69</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.383 441431.69 191360.624 441459.315</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191360.624 441459.315 191334.399 441476.304</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191334.399 441476.304 191322.984 441483.423</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191322.984 441483.423 191281.424 441508.442</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191281.424 441508.442 191269.691 441515.162</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191269.691 441515.162 191228.72 441539.114</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191228.72 441539.114 191213.598 441546.272</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191213.598 441546.272 191194.383 441557.567</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191194.383 441557.567 191188.062 441553.633</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191188.062 441553.633 191198.842 441547.243</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191198.842 441547.243 191196.079 441544.079 191191.934 441546.509</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191191.934 441546.509 191190.065 441544.369</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191190.065 441544.369 191195.352 441539.751</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191195.352 441539.751 191196.754 441541.356</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191196.754 441541.356 191198.098 441542.895</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191198.098 441542.895 191200.854 441546.05</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191200.854 441546.05 191202.007 441545.366</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191202.007 441545.366 191203.234 441544.639</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191203.234 441544.639 191208.786 441541.378</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191208.786 441541.378 191211.535 441537.09 191210.107 441532.352</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191210.107 441532.352 191208.993 441531.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191208.993 441531.076 191204.476 441535.021</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191204.476 441535.021 191191.12 441519.734</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191191.12 441519.734 191189.607 441518.001</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191189.607 441518.001 191182.545 441509.911 191180.532 441507.605</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191180.532 441507.605 191192.882 441496.819</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191192.882 441496.819 191204.867 441510.542</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191204.867 441510.542 191216.826 441524.235</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191216.826 441524.235 191212.307 441528.182</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191212.307 441528.182 191215.47 441531.804</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0202.BP41485004548-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BP41485004548-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP101485006132-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id26" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id27">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191250.931 441497.778 191219.809 441524.959</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191219.809 441524.959 191211.837 441515.83</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191211.837 441515.83 191211.084 441516.488</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191211.084 441516.488 191207.097 441511.924</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191207.097 441511.924 191207.851 441511.266</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191207.851 441511.266 191206.202 441509.376</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191206.202 441509.376 191237.335 441482.211</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.335 441482.211 191237.512 441482.413 191250.931 441497.778</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwvlak>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP97485005621-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP97485005621-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id180" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191344.439 441433.039</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>10</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id28" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id29">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191316.359 441459.582 191308.481 441450.557</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191308.481 441450.557 191331.92 441430.086 191335.2 441433.841 191373.613 441400.293 191381.493 441409.316 191342.689 441443.206 191339.409 441439.451 191316.359 441459.582</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP103485006143-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP103485006143-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>7</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s202</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id181" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191349.952 441426.164</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id32" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id33">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191371.99 441398.435 191385.571 441413.986</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.571 441413.986 191346.971 441447.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191346.971 441447.699 191343.683 441443.95</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191343.683 441443.95 191320.435 441464.254</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191320.435 441464.254 191318.946 441465.554</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.946 441465.554 191305.327 441449.961</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191305.327 441449.961 191306.823 441448.658</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191306.823 441448.658 191330.289 441428.218</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191330.289 441428.218 191333.533 441431.933</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191333.533 441431.933 191371.99 441398.435</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP73485005273-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP73485005273-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP101485006132-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id182" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191226.164 441503.857</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>10</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id34" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id35">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191215.731 441520.289 191207.851 441511.266 191238.972 441484.085 191246.853 441493.108</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.853 441493.108 191215.731 441520.289</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA4485948126-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA4485948126-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP6488278921-00"/>
			<imro:naam>specifieke bouwaanduiding - 1</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-1]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id183" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191233.53 441481.186</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id184" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191243.544 441488.797</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id38" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id39">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191239.727 441483.426 191247.606 441492.45</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191247.606 441492.45 191246.853 441493.108</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.853 441493.108 191238.972 441484.085</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191238.972 441484.085 191239.727 441483.426</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP6488278921-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP6488278921-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id185" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191253.776 441503.024</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id42" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id43">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191263.69 441500.986 191265.096 441505.879 191262.27 441510.07</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191262.27 441510.07 191256.731 441513.311 191256.533 441513.427</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.533 441513.427 191252.672 441512.442</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191252.672 441512.442 191233.081 441523.905</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191233.081 441523.905 191232.109 441527.718</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191232.109 441527.718 191231.894 441527.844 191223.369 441532.831 191223.019 441533.036</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191223.019 441533.036 191219.012 441533.777 191215.47 441531.804</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191215.47 441531.804 191212.307 441528.182</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191212.307 441528.182 191216.826 441524.235</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191216.826 441524.235 191218.475 441526.124</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191218.475 441526.124 191219.809 441524.959</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191219.809 441524.959 191250.931 441497.778</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191250.931 441497.778 191246.853 441493.108</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.853 441493.108 191237.512 441482.413 191237.335 441482.211</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.335 441482.211 191238.091 441481.552</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191238.091 441481.552 191251.684 441497.12</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191251.684 441497.12 191256.58 441492.845</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.58 441492.845 191263.69 441500.986</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0202.BP42485004552-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BP42485004552-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id44" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id45">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191256.529 441483.2 191254.861 441481.291</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191254.861 441481.291 191289.866 441450.803</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191289.866 441450.803 191303.473 441466.384</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191303.473 441466.384 191268.481 441496.9</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191268.481 441496.9 191260.521 441487.761</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191260.521 441487.761 191259.762 441488.422</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191259.762 441488.422 191255.775 441483.858</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191255.775 441483.858 191256.529 441483.2</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwvlak>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA50485004905-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA50485004905-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id186" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191304.19 441430.942</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id187" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191318.489 441439.842</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id48" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id49">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191330.289 441428.218 191331.92 441430.086</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191331.92 441430.086 191308.481 441450.557</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191308.481 441450.557 191306.823 441448.658</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191306.823 441448.658 191330.289 441428.218</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bestemmingsplangebied gml:id="NL.IMRO.0202.974-0301">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.974</imro:lokaalID>
					<imro:versie>0301</imro:versie>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlan>bestemmingsplan</imro:typePlan>
			<imro:beleidsmatigVerantwoordelijkeOverheid>gemeentelijke overheid</imro:beleidsmatigVerantwoordelijkeOverheid>
			<imro:naamOverheid>gemeente Arnhem</imro:naamOverheid>
			<imro:overheidsCode>0202</imro:overheidsCode>
			<imro:naam>Whemedreef</imro:naam>
			<imro:planstatusInfo>
				<imro:PlanstatusEnDatum>
					<imro:planstatus>vastgesteld</imro:planstatus>
					<imro:datum>2024-01-01</imro:datum>
				</imro:PlanstatusEnDatum>
			</imro:planstatusInfo>
			<imro:besluitnummer>532961</imro:besluitnummer>
			<imro:verwijzingNaarVaststellingsbesluit>vb_NL.IMRO.0202.974-0301.pdf</imro:verwijzingNaarVaststellingsbesluit>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s119</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s117</imro:verwijzingNaarTekst>
					<imro:typeTekst>bijlage bij toelichting</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s1</imro:verwijzingNaarTekst>
					<imro:typeTekst>toelichting</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:ondergrondInfo>
				<imro:OndergrondReferentie>
					<imro:ondergrondtype>basisregistratie grootschalige topografie (BGT)</imro:ondergrondtype>
					<imro:ondergronddatum>2020-03-01</imro:ondergronddatum>
				</imro:OndergrondReferentie>
			</imro:ondergrondInfo>
			<imro:verwijzingNorm>IMRO2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>PRBP2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>PRABPK2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>IMROPT2012</imro:verwijzingNorm>
			<imro:geometrie>
				<gml:Surface gml:id="id52" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id53">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191213.598 441546.272 191194.383 441557.567</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191194.383 441557.567 191162.239 441537.559</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191162.239 441537.559 191156.803 441508.258</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191156.803 441508.258 191158.656 441507.159 191176.679 441500</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191176.679 441500 191184.839 441496.759 191217.525 441481.724 191239.951 441472.288</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191239.951 441472.288 191247.529 441466.505 191282.025 441442.727 191295.968 441440.01</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191295.968 441440.01 191301.538 441436.588 191317.291 441424.646</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191317.291 441424.646 191318.595 441423.76</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.595 441423.76 191320.882 441422.299</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191320.882 441422.299 191322.149 441421.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191322.149 441421.538 191344.139 441410.238 191345.806 441408.706 191346.193 441396.109 191348.689 441393.25 191363.776 441386.467 191403.196 441369.74</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191403.196 441369.74 191415.637 441349.053</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191415.637 441349.053 191449.217 441325.545</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191449.217 441325.545 191480.199 441353.857</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191480.199 441353.857 191484.329 441357.799</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191484.329 441357.799 191485.233 441358.764</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191485.233 441358.764 191478.785 441365.122</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191478.785 441365.122 191473.705 441370.131</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191473.705 441370.131 191471.575 441372.277</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191471.575 441372.277 191469.334 441374.53</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191469.334 441374.53 191467.869 441375.911</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191467.869 441375.911 191464.64 441378.918</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191464.64 441378.918 191461.411 441381.926</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191461.411 441381.926 191455.7 441387.184</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191455.7 441387.184 191449.259 441392.918</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191449.259 441392.918 191447.945 441394.053</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191447.945 441394.053 191445.671 441396.058</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191445.671 441396.058 191443.896 441397.581</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191443.896 441397.581 191439.477 441401.484</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191439.477 441401.484 191435.148 441405.147</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191435.148 441405.147 191430.698 441408.661</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191430.698 441408.661 191422.854 441414.594</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.854 441414.594 191422.018 441415.266</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.018 441415.266 191416.643 441419.273</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191416.643 441419.273 191415.625 441421.144</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191415.625 441421.144 191411.289 441424.274</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191411.289 441424.274 191405.823 441428.401</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191405.823 441428.401 191403.036 441430.495</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191403.036 441430.495 191401.383 441431.69</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.383 441431.69 191360.624 441459.315</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191360.624 441459.315 191334.399 441476.304</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191334.399 441476.304 191322.984 441483.423</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191322.984 441483.423 191281.424 441508.442</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191281.424 441508.442 191269.691 441515.162</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191269.691 441515.162 191228.72 441539.114</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191228.72 441539.114 191213.598 441546.272</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bestemmingsplangebied>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP81485005364-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP81485005364-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id188" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191307.122 441459.099</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id189" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191310.736 441453.902</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>4</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id54" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id55">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191311.713 441455.78 191307.729 441451.213</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.729 441451.213 191308.481 441450.557 191312.468 441455.121 191311.713 441455.78</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA99485006049-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA99485006049-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP8488278955-00"/>
			<imro:naam>specifieke bouwaanduiding - 2</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-2]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id190" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191349.6 441374.157</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id191" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191380.232 441384.645</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id58" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id59">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191380.445 441383.412 191379.849 441382.73</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191379.849 441382.73 191384.123 441386.174</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191384.123 441386.174 191383.405 441386.802</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191383.405 441386.802 191381.76 441384.919</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191381.76 441384.919 191379.463 441386.925</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191379.463 441386.925 191378.147 441385.419</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191378.147 441385.419 191380.445 441383.412</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP112485006374-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP112485006374-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id192" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191473.142 441350.921</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id63" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id64">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191479.242 441354.857 191475.059 441355.531 191471.443 441353.568</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191471.443 441353.568 191470.635 441352.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191470.635 441352.643 191470.762 441352.484</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191470.762 441352.484 191474.097 441348.281</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191474.097 441348.281 191480.199 441353.857</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191480.199 441353.857 191479.242 441354.857</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0202.BP43485004558-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BP43485004558-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id65" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id66">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191308.481 441450.557 191306.823 441448.658</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191306.823 441448.658 191330.289 441428.218</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191330.289 441428.218 191333.533 441431.933</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191333.533 441431.933 191371.99 441398.435</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191371.99 441398.435 191385.571 441413.986</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.571 441413.986 191346.971 441447.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191346.971 441447.699 191343.683 441443.95</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191343.683 441443.95 191320.435 441464.254</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191320.435 441464.254 191312.468 441455.122</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191312.468 441455.122 191311.713 441455.78</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191311.713 441455.78 191307.729 441451.213</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.729 441451.213 191308.481 441450.557</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwvlak>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0202.BP1488278860-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BP1488278860-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP9488278975-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id67" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id68">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191182.332 441546.856 191163.923 441525.777</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191163.923 441525.777 191171.854 441518.85</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191171.854 441518.85 191172.051 441519.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191172.051 441519.076 191181.504 441510.82</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191181.504 441510.82 191199.716 441531.673</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191199.716 441531.673 191182.332 441546.856</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwvlak>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP104485006148-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP104485006148-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>7</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s202</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id193" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191432.177 441363.819</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id72" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id73">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191460.68 441361.007 191436.503 441382.122</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191436.503 441382.122 191422.883 441366.528</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.883 441366.528 191447.097 441345.443</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191447.097 441345.443 191460.68 441361.007</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP85485005418-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP85485005418-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id194" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191254.369 441490.566</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id195" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191258.123 441485.807</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>4</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id74" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id75">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191259.762 441488.422 191255.775 441483.858</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191255.775 441483.858 191256.529 441483.2 191260.521 441487.761 191259.762 441488.422</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA51485004910-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA51485004910-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id196" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191343.397 441404.645</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id197" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191355.845 441414.156</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id78" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id79">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191371.99 441398.435 191373.613 441400.293</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191373.613 441400.293 191335.2 441433.841</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191335.2 441433.841 191333.533 441431.933</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191333.533 441431.933 191371.99 441398.435</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP113485006383-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP113485006383-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Water</imro:naam>
			<imro:bestemmingshoofdgroep>water</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>6</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s316</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>WA</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id198" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191402.619 441384.235</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id83" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id84">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191429.991 441392.022 191429.12 441393.087</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.12 441393.087 191429.003 441394.157</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.003 441394.157 191430.556 441395.798</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191430.556 441395.798 191429.151 441397.127</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.151 441397.127 191428.364 441396.295</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.364 441396.295 191427.986 441396.653</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191427.986 441396.653 191426.871 441395.475</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191426.871 441395.475 191426.183 441395.981</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191426.183 441395.981 191425.155 441396.432</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191425.155 441396.432 191423.929 441396.772 191423.129 441396.426 191421.862 441395.059</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191421.862 441395.059 191420.422 441393.506</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191420.422 441393.506 191401.381 441400.081</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.381 441400.081 191377.342 441380.71</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191377.342 441380.71 191403.196 441369.74</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191403.196 441369.74 191406.682 441363.944</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191406.682 441363.944 191428.635 441388.703 191428.747 441388.896 191429.967 441391.004</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.967 441391.004 191429.991 441392.022</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0202.BP45485004590-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BP45485004590-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP104485006148-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id85" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id86">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191424.544 441368.43 191425.282 441367.785</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191425.282 441367.785 191423.622 441365.884</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191423.622 441365.884 191447.097 441345.443</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191447.097 441345.443 191460.68 441361.007</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191460.68 441361.007 191437.241 441381.478</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.241 441381.478 191429.268 441372.35</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191429.268 441372.35 191428.53 441372.994</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.53 441372.994 191424.544 441368.43</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwvlak>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA100485006059-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA100485006059-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP113485006383-00"/>
			<imro:naam>specifieke bouwaanduiding - 2</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-2]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id199" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191378.294 441380.56</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id200" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191384.595 441380.56</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id89" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id90">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191379.849 441382.73 191378.8 441381.529</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191378.8 441381.529 191380.495 441380.049</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191380.495 441380.049 191385.099 441385.322</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.099 441385.322 191384.123 441386.174</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191384.123 441386.174 191379.849 441382.73</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP7488278942-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP7488278942-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen - Landschap en park</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>4</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s252</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G-LP</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id201" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191431.27 441342.748</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id93" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id94">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191470.762 441352.484 191451.617 441330.564</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191451.617 441330.564 191443.156 441337.898</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191443.156 441337.898 191448.601 441344.134</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191448.601 441344.134 191447.097 441345.443 191423.622 441365.884</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191423.622 441365.884 191422.883 441366.528</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191422.883 441366.528 191424.544 441368.43</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191424.544 441368.43 191428.53 441372.994</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.53 441372.994 191436.503 441382.122</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191436.503 441382.122 191428.747 441388.896</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191428.747 441388.896 191428.635 441388.703 191406.682 441363.944</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191406.682 441363.944 191415.637 441349.053</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191415.637 441349.053 191449.217 441325.545</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191449.217 441325.545 191474.097 441348.281</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191474.097 441348.281 191470.762 441352.484</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP87485005466-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP87485005466-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP104485006148-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id202" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191424.37 441374.808</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id203" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191426.697 441370.166</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>4</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id95" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id96">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191428.53 441372.994 191424.544 441368.43 191425.282 441367.785 191429.268 441372.35 191428.53 441372.994</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP2488278879-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP2488278879-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP9488278975-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id204" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191180.844 441528.336</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>13</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id97" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id98">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191199.716 441531.673 191182.332 441546.856</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.332 441546.856 191163.923 441525.777</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191163.923 441525.777 191171.854 441518.85</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191171.854 441518.85 191172.051 441519.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191172.051 441519.076 191181.504 441510.82</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191181.504 441510.82 191199.716 441531.673</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP109485006223-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP109485006223-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id205" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191296.025 441477.731</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id101" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id102">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191316.241 441469.601 191317.607 441474.714 191314.667 441478.78</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191314.667 441478.78 191307.943 441482.914</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.943 441482.914 191307.883 441482.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191307.883 441482.951 191304.104 441481.987</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191304.104 441481.987 191284.776 441493.595</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191284.776 441493.595 191283.797 441497.431</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191283.797 441497.431 191283.652 441497.517</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191283.652 441497.517 191277.473 441501.176</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191277.473 441501.176 191276.74 441501.619</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191276.74 441501.619 191272.67 441502.374 191269.159 441500.407</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191269.159 441500.407 191267.128 441498.081</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191267.128 441498.081 191267.278 441497.949</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191267.278 441497.949 191303.473 441466.384</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191303.473 441466.384 191289.866 441450.803</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191289.866 441450.803 191290.622 441450.145</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191290.622 441450.145 191304.223 441465.723</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191304.223 441465.723 191309.099 441461.424</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191309.099 441461.424 191316.241 441469.601</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP10485344166-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP10485344166-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP101485006132-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id206" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191206.143 441519.531</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id207" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191210.006 441514.422</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>4</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id103" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id104">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191207.85 441511.266 191211.837 441515.83</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191211.837 441515.83 191211.084 441516.488</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191211.084 441516.488 191207.097 441511.924</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191207.097 441511.924 191207.85 441511.266</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA52485004950-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA52485004950-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP104485006148-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id208" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191442.029 441375.497</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id209" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191447.079 441369.983</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id107" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id108">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191460.68 441361.007 191437.241 441381.478</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191437.241 441381.478 191433.162 441376.808</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191433.162 441376.808 191456.603 441356.336</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191456.603 441356.336 191460.68 441361.007</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP8488278955-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP8488278955-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen - Landschap en park</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>4</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s252</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G-LP</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id210" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191253.502 441466.629</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id111" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id112">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191181.504 441510.82 191172.051 441519.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191172.051 441519.076 191171.854 441518.85</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191171.854 441518.85 191163.908 441525.79</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191163.908 441525.79 191181.288 441545.662 191182.332 441546.856</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.332 441546.856 191180.186 441548.73</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191180.186 441548.73 191162.239 441537.559</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191162.239 441537.559 191156.803 441508.258</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191156.803 441508.258 191158.656 441507.159 191176.679 441500</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191176.679 441500 191184.839 441496.759 191217.525 441481.724 191239.951 441472.288</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191239.951 441472.288 191247.529 441466.505 191282.025 441442.727 191295.968 441440.01</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191295.968 441440.01 191301.538 441436.588 191317.291 441424.646</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191317.291 441424.646 191318.595 441423.76</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.595 441423.76 191320.882 441422.299</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191320.882 441422.299 191322.149 441421.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191322.149 441421.538 191344.139 441410.238 191345.806 441408.706 191346.193 441396.109 191348.689 441393.25 191363.776 441386.467 191377.342 441380.71</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191377.342 441380.71 191401.381 441400.081</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.381 441400.081 191420.422 441393.506</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191420.422 441393.506 191421.862 441395.059</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191421.862 441395.059 191401.813 441412.516</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191401.813 441412.516 191378.147 441385.419</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191378.147 441385.419 191369.714 441392.784</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191369.714 441392.784 191373.5 441397.12</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191373.5 441397.12 191371.99 441398.435</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191371.99 441398.435 191333.533 441431.933</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191333.533 441431.933 191330.289 441428.218</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191330.289 441428.218 191306.823 441448.658</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191306.823 441448.658 191305.327 441449.961</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191305.327 441449.961 191298.562 441442.214</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191298.562 441442.214 191290.129 441449.58</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191290.129 441449.58 191290.622 441450.145</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191290.622 441450.145 191289.866 441450.803</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191289.866 441450.803 191254.861 441481.291 191253.651 441482.346</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191253.651 441482.346 191246.046 441473.638</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.046 441473.638 191237.599 441480.988</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.599 441480.988 191238.091 441481.552</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191238.091 441481.552 191237.335 441482.211</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.335 441482.211 191206.202 441509.376</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191206.202 441509.376 191204.867 441510.542</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191204.867 441510.542 191192.882 441496.819</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191192.882 441496.819 191180.532 441507.605</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191180.532 441507.605 191182.545 441509.911</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.545 441509.911 191181.504 441510.82</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA46485004624-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA46485004624-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP101485006132-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id211" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191229.07 441514.145</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id212" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191237.055 441507.984</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id115" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id116">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191250.931 441497.778 191219.809 441524.959</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191219.809 441524.959 191215.731 441520.289</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191215.731 441520.289 191246.853 441493.108</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191246.853 441493.108 191250.931 441497.778</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA53485005002-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA53485005002-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP104485006148-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id213" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191419.422 441351.068</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id214" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191433.767 441358.495</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id119" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id120">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191425.282 441367.785 191423.622 441365.884 191447.097 441345.443 191448.726 441347.31</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191448.726 441347.31 191425.282 441367.785</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP110485006361-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP110485006361-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id215" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191375.516 441427.817</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id122" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id123">
											<gml:segments>
												<gml:Arc>
													<gml:posList>191398.608 441415.991 191400.014 441420.884 191397.58 441424.818</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191397.58 441424.818 191393.646 441427.632</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191393.646 441427.632 191389.424 441430.439</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191389.424 441430.439 191385.322 441433.167</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.322 441433.167 191381.567 441432.411</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191381.567 441432.411 191351.006 441452.319</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191351.006 441452.319 191349.483 441453.312</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191349.483 441453.312 191329.73 441466.142</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191329.73 441466.142 191328.879 441469.912</gml:posList>
												</gml:LineStringSegment>
												<gml:Arc>
													<gml:posList>191328.879 441469.912 191324.866 441470.612 191321.384 441468.649</gml:posList>
												</gml:Arc>
												<gml:LineStringSegment>
													<gml:posList>191321.384 441468.649 191318.796 441465.686</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.796 441465.686 191318.946 441465.554</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191318.946 441465.554 191320.435 441464.254</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191320.435 441464.254 191343.683 441443.95</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191343.683 441443.95 191346.971 441447.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191346.971 441447.699 191385.571 441413.986</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191385.571 441413.986 191371.99 441398.435</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191371.99 441398.435 191373.5 441397.12</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191373.5 441397.12 191387.078 441412.67</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191387.078 441412.67 191391.974 441408.395</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191391.974 441408.395 191398.608 441415.991</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP101485006132-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP101485006132-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>7</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s202</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id216" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191227.787 441496.302</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id125" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id126">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191250.931 441497.778 191218.475 441526.124</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191218.475 441526.124 191216.826 441524.235 191204.867 441510.542</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191204.867 441510.542 191237.335 441482.211</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191237.335 441482.211 191237.512 441482.413 191250.931 441497.778</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA1485948070-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA1485948070-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP111485006370-00"/>
			<imro:naam>specifieke bouwaanduiding - 1</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-1]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id217" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191445.282 441344.086</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id218" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191453.383 441351.065</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id129" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id130">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191450.229 441345.997 191458.108 441355.021</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191458.108 441355.021 191456.603 441356.336</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191456.603 441356.336 191448.726 441347.31</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191448.726 441347.31 191450.229 441345.997</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA54485005038-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA54485005038-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP103485006143-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id219" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191334.343 441450.565</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id220" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191339.774 441445.203</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id133" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id134">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191320.435 441464.254 191316.359 441459.582 191339.409 441439.451 191342.689 441443.206 191381.493 441409.316 191385.571 441413.986 191346.971 441447.699 191343.683 441443.95</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191343.683 441443.95 191320.435 441464.254</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP4488278901-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP4488278901-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Groen</imro:naam>
			<imro:bestemmingshoofdgroep>groen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s186</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>G</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id221" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191186.546 441547.251</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id136" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id137">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191187.951 441541.948 191188.256 441542.297</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191188.256 441542.297 191190.065 441544.369 191191.934 441546.509</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191191.934 441546.509 191196.079 441544.079 191198.842 441547.243</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191198.842 441547.243 191188.062 441553.633</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191188.062 441553.633 191180.186 441548.73</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191180.186 441548.73 191182.332 441546.856 191187.951 441541.948</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP57485005108-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP57485005108-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id222" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191277.939 441473.451</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>13</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id138" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id139">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191287.894 441455.881 191295.762 441464.915</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191295.762 441464.915 191268.054 441489.048</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191268.054 441489.048 191260.186 441480.015</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191260.186 441480.015 191287.894 441455.881</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA47485004744-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA47485004744-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP101485006132-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id223" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191204.001 441491.039</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id224" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191217.674 441501.026</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id142" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id143">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191207.851 441511.266 191206.202 441509.376 191237.335 441482.211 191238.972 441484.085</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191238.972 441484.085 191207.851 441511.266</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA16484996245-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA16484996245-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP8488278955-00"/>
			<imro:naam>specifieke bouwaanduiding - 2</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-2]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id225" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191218.011 441463.623</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id226" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191240.957 441472.226</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id146" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id147">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191244.798 441474.724 191243.289 441476.037</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191243.289 441476.037 191239.99 441472.258</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191239.99 441472.258 191241.583 441471.042</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191241.583 441471.042 191244.798 441474.724</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP9488278975-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP9488278975-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>7</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s202</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id227" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191179.614 441521.93</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id149" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id150">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191181.288 441545.662 191163.908 441525.79</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191163.908 441525.79 191171.854 441518.85</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191171.854 441518.85 191172.051 441519.076</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191172.051 441519.076 191181.504 441510.82</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191181.504 441510.82 191198.672 441530.478 191199.716 441531.673</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191199.716 441531.673 191193.238 441537.33</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191193.238 441537.33 191195.352 441539.751</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191195.352 441539.751 191190.065 441544.369</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191190.065 441544.369 191188.256 441542.297</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191188.256 441542.297 191187.951 441541.948</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191187.951 441541.948 191182.332 441546.856</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191182.332 441546.856 191181.288 441545.662</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA17484996276-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA17484996276-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP8488278955-00"/>
			<imro:naam>specifieke bouwaanduiding - 2</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-2]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id228" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191268.187 441432.385</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id229" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191294.765 441441.518</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id153" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id154">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191295.785 441444.64 191292.306 441440.724</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191292.306 441440.724 191295.145 441440.17</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191295.145 441440.17 191297.661 441443.002</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191297.661 441443.002 191295.785 441444.64</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA2485948093-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA2485948093-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP110485006361-00"/>
			<imro:naam>specifieke bouwaanduiding - 1</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-1]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id230" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191368.434 441397.022</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id231" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191380.792 441406.357</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id157" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id158">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191375.121 441398.976 191383 441408</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191383 441408 191381.493 441409.316</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191381.493 441409.316 191373.613 441400.293</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191373.613 441400.293 191375.121 441398.976</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP1519396149-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP1519396149-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id232" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191440.088 441363.002</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>10</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id159" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id160">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191425.282 441367.785 191428.937 441364.592 191445.026 441350.543 191448.726 441347.31 191456.603 441356.336 191452.895 441359.576 191436.806 441373.625 191433.162 441376.808 191425.282 441367.785</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:aanduiding xlink:href="#NL.IMRO.0202.BP45485004590-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0202.EP102485006138-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.EP102485006138-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>7</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>pt_NL.IMRO.0202.974-0301.xml#NL.IMRO.PT.s202</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id233" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191268.667 441476.737</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id162" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id163">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191303.473 441466.384 191267.278 441497.949</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191267.278 441497.949 191253.651 441482.346</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191253.651 441482.346 191289.866 441450.803</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191289.866 441450.803 191303.473 441466.384</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0202.MP59485005115-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.MP59485005115-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id234" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191262.329 441485.913</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>10</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id164" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id165">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191260.186 441480.015 191268.054 441489.048</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191268.054 441489.048 191264.409 441492.224</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191264.409 441492.224 191260.521 441487.761</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191260.521 441487.761 191256.54 441483.19</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191256.54 441483.19 191260.186 441480.015</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0202.BA48485004810-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BA48485004810-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0202.974-0301"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0202.EP102485006138-00"/>
			<imro:naam>bijgebouwen</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[bg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id235" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191281.828 441483.94</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id236" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>191285.41 441478.628</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id168" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id169">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>191303.473 441466.384 191268.481 441496.9</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191268.481 441496.9 191264.409 441492.224</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191264.409 441492.224 191299.413 441461.735</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>191299.413 441461.735 191303.473 441466.384</gml:posList>
												</gml:LineStringSegment>
											</gml:segments>
										</gml:Curve>
									</gml:curveMember>
								</gml:Ring>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</imro:geometrie>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:MetadataIMRObestand gml:id="Metadata">
			<imro:datasetTitel>Whemedreef</imro:datasetTitel>
			<imro:creatiedatum>2021-06-24</imro:creatiedatum>
			<imro:bronbeheerder>gemeente Arnhem</imro:bronbeheerder>
			<imro:codeerVerantwoordelijke>Gemeente Arnhem, Afd. Beleidsdomein Fysiek</imro:codeerVerantwoordelijke>
			<imro:naamApplicatieschema>IMRO2012</imro:naamApplicatieschema>
			<imro:codeReferentiesysteem>28992</imro:codeReferentiesysteem>
			<imro:toepassingsschaal>1000</imro:toepassingsschaal>
			<imro:applicatieIdentificatie>RoPlan 2012 v3.0.1 (voor v8i)</imro:applicatieIdentificatie>
			<imro:versieXMLschema>1.1.0</imro:versieXMLschema>
		</imro:MetadataIMRObestand>
	</imro:featureMember>
</imro:FeatureCollectionIMRO>
