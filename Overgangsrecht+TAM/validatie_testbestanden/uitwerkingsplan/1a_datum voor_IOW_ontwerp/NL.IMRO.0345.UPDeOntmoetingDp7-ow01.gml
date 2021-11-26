<?xml version="1.0" encoding="UTF-8"?>
<imro:FeatureCollectionIMRO gml:id="Collectie" xmlns:imro="http://www.geonovum.nl/imro/2012/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.geonovum.nl/imro/2012/1.1 http://schemas.geonovum.nl/imro/2012/1.1/IMRO2012.xsd">
	<gml:description>RoPlan IMRO GML import/export. Converteert IMRO GML data naar RoPlan bestanden en vice versa</gml:description>
	<!--Bestand aangemaakt m.b.v. RoPlan IMRO Export versie 3.5 (voor OpenCities Map)-->
	<gml:name>NL.IMRO.0345.UPDeOntmoetingDp7-ow01.gml</gml:name>
	<imro:featureMember>
		<imro:Enkelbestemming gml:id="NL.IMRO.0345.EP19517404793-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.EP19517404793-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>enkelbestemming</imro:typePlanobject>
			<imro:naam>Wonen</imro:naam>
			<imro:bestemmingshoofdgroep>wonen</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>3</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>r_NL.IMRO.0345.UPDeOntmoetingDp7-ow01.html#_3_Wonen</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>W</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id58" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168205.964 448508.13</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id3" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id4">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168217.416 448546.311 168180.653 448446.358 168193.042 448441.801 168229.805 448541.755 168217.416 448546.311</gml:posList>
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
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
		</imro:Enkelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Figuur gml:id="NL.IMRO.0345.ID110084-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.ID110084-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>figuur</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.DP20517404825-00"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>gevellijn</imro:naam>
			<imro:geometrie>
				<gml:Curve gml:id="id10" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:segments>
						<gml:LineStringSegment>
							<gml:posList>168218.12 448546.052 168181.357 448446.099</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</imro:geometrie>
		</imro:Figuur>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bestemmingsplangebied gml:id="NL.IMRO.0345.UPDeOntmoetingDp7-ow01">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.UPDeOntmoetingDp7</imro:lokaalID>
					<imro:versie>ow01</imro:versie>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlan>uitwerkingsplan</imro:typePlan>
			<imro:beleidsmatigVerantwoordelijkeOverheid>gemeentelijke overheid</imro:beleidsmatigVerantwoordelijkeOverheid>
			<imro:naamOverheid>gemeente Veenendaal</imro:naamOverheid>
			<imro:overheidsCode>0345</imro:overheidsCode>
			<imro:naam>De Ontmoeting, deelplan 7</imro:naam>
			<imro:planstatusInfo>
				<imro:PlanstatusEnDatum>
					<imro:planstatus>ontwerp</imro:planstatus>
					<imro:datum>2022-06-30</imro:datum>
				</imro:PlanstatusEnDatum>
			</imro:planstatusInfo>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>r_NL.IMRO.0345.UPDeOntmoetingDp7-ow01.html</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>b_NL.IMRO.0345.UPDeOntmoetingDp7-ow01_tb.html</imro:verwijzingNaarTekst>
					<imro:typeTekst>bijlage bij toelichting</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentiePG_BP>
					<imro:verwijzingNaarTekst>t_NL.IMRO.0345.UPDeOntmoetingDp7-ow01.html</imro:verwijzingNaarTekst>
					<imro:typeTekst>toelichting</imro:typeTekst>
				</imro:TekstReferentiePG_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:ondergrondInfo>
				<imro:OndergrondReferentie>
					<imro:ondergrondtype>basisregistratie grootschalige topografie (BGT)</imro:ondergrondtype>
					<imro:ondergronddatum>2021-04-20</imro:ondergronddatum>
				</imro:OndergrondReferentie>
			</imro:ondergrondInfo>
			<imro:verwijzingNaarExternPlanInfo>
				<imro:ExternPlanReferentie_BP>
					<imro:naamExternPlan>Veenendaal-Oost, Buurtstede</imro:naamExternPlan>
					<imro:idnExternPlan>NL.IMRO.0345.Buurtstede-vg01</imro:idnExternPlan>
					<imro:rolExternPlan>ten gevolge van extern plan/besluit</imro:rolExternPlan>
				</imro:ExternPlanReferentie_BP>
			</imro:verwijzingNaarExternPlanInfo>
			<imro:verwijzingNorm>IMRO2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>PRBP2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>PRABPK2012</imro:verwijzingNorm>
			<imro:geometrie>
				<gml:Surface gml:id="id11" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id12">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168217.416 448546.311 168180.653 448446.358 168193.042 448441.801 168229.805 448541.755 168217.416 448546.311</gml:posList>
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
		<imro:Dubbelbestemming gml:id="NL.IMRO.0345.DP20517404825-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.DP20517404825-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>dubbelbestemming</imro:typePlanobject>
			<imro:naam>Leiding</imro:naam>
			<imro:bestemmingshoofdgroep>leiding</imro:bestemmingshoofdgroep>
			<imro:artikelnummer>4</imro:artikelnummer>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_BP>
					<imro:verwijzingNaarTekst>r_NL.IMRO.0345.UPDeOntmoetingDp7-ow01.html#_4_Leiding</imro:verwijzingNaarTekst>
					<imro:typeTekst>regels</imro:typeTekst>
				</imro:TekstReferentie_BP>
			</imro:verwijzingNaarTekstInfo>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>L</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id59" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168214.269 448528.254</gml:pos>
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
												<gml:LineStringSegment>
													<gml:posList>168211.276 448526.565 168212.955 448526.171 168214.666 448525.743 168216.444 448525.612 168219.439 448525.414 168189.188 448443.218</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168189.188 448443.218 168193.042 448441.801 168229.805 448541.755 168217.416 448546.311 168210.278 448526.904</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168210.278 448526.904 168211.276 448526.565</gml:posList>
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
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
		</imro:Dubbelbestemming>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP5517404523-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP5517404523-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id60" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168222.416 448532.733</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
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
				<gml:Surface gml:id="id16" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id17">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168220.089 448538.271 168217.169 448530.332</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168217.169 448530.332 168218.876 448529.703 168224.597 448527.596</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168224.597 448527.596 168227.518 448535.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168227.518 448535.538 168221.796 448537.643 168220.089 448538.271</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP7517404534-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP7517404534-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id61" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168213.435 448513.114</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
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
				<gml:Surface gml:id="id18" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id19">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168212.771 448518.374 168209.851 448510.435</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168209.851 448510.435 168211.558 448509.806 168217.279 448507.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168217.279 448507.699 168220.2 448515.641</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168220.2 448515.641 168214.478 448517.746 168212.771 448518.374</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP9517404540-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP9517404540-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id62" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168206.365 448493.279</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
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
				<gml:Surface gml:id="id20" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id21">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168205.453 448498.477 168202.533 448490.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168202.533 448490.538 168204.239 448489.909 168209.961 448487.802</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168209.961 448487.802 168212.882 448495.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168212.882 448495.745 168207.16 448497.849 168205.453 448498.477</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP11517404545-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP11517404545-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id63" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168199.127 448473.89</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
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
				<gml:Surface gml:id="id22" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id23">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168198.135 448478.58 168195.215 448470.641</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168195.215 448470.641 168196.921 448470.012 168202.643 448467.905</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168202.643 448467.905 168205.564 448475.848</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168205.564 448475.848 168199.842 448477.952 168198.135 448478.58</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP13517404550-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP13517404550-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id64" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168191.687 448453.634</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
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
				<gml:Surface gml:id="id24" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id25">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168195.325 448448.008 168198.246 448455.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168198.246 448455.951 168192.524 448458.056 168190.817 448458.683</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168190.817 448458.683 168187.897 448450.744</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168187.897 448450.744 168189.603 448450.116 168195.325 448448.008</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwvlak gml:id="NL.IMRO.0345.BP15517404636-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BP15517404636-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwvlak</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>bouwvlak</imro:naam>
			<imro:geometrie>
				<gml:Surface gml:id="id31" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id32">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168224.082 448543.86 168217.416 448546.311 168180.653 448446.358 168187.312 448443.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168187.312 448443.909 168189.603 448450.116</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168189.603 448450.116 168195.325 448448.008</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168195.325 448448.008 168198.246 448455.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168198.246 448455.951 168192.524 448458.056</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168192.524 448458.056 168196.921 448470.012</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168196.921 448470.012 168202.643 448467.905</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168202.643 448467.905 168205.564 448475.848</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168205.564 448475.848 168199.842 448477.952</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168199.842 448477.952 168204.239 448489.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168204.239 448489.909 168209.961 448487.802</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168209.961 448487.802 168212.882 448495.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168212.882 448495.745 168207.16 448497.849</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168207.16 448497.849 168211.558 448509.806</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168211.558 448509.806 168217.279 448507.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168217.279 448507.699 168220.2 448515.641</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168220.2 448515.641 168214.478 448517.746</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168214.478 448517.746 168218.876 448529.703</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168218.876 448529.703 168224.597 448527.596</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168224.597 448527.596 168227.518 448535.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168227.518 448535.538 168221.796 448537.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168221.796 448537.643 168224.082 448543.86</gml:posList>
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
		<imro:Maatvoering gml:id="NL.IMRO.0345.MP16517404661-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.MP16517404661-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>maatvoering</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>maximum bouwhoogte (m)</imro:naam>
			<imro:symboolInfo>
				<imro:SymboolEnPositie>
					<imro:symboolCode>s104</imro:symboolCode>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id65" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168205.809 448502.283</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:SymboolEnPositie>
			</imro:symboolInfo>
			<imro:maatvoeringInfo>
				<imro:WaardeEnType>
					<imro:waarde>7,5</imro:waarde>
					<imro:waardeType>maximum bouwhoogte (m)</imro:waardeType>
					<imro:symboolCode>s104</imro:symboolCode>
				</imro:WaardeEnType>
			</imro:maatvoeringInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id33" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id34">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168224.082 448543.86 168217.416 448546.311 168180.653 448446.358 168187.312 448443.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168187.312 448443.909 168189.603 448450.116</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168189.603 448450.116 168187.897 448450.744 168190.817 448458.683 168192.524 448458.056</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168192.524 448458.056 168196.921 448470.012</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168196.921 448470.012 168195.215 448470.641 168198.135 448478.58 168199.842 448477.952</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168199.842 448477.952 168204.239 448489.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168204.239 448489.909 168202.533 448490.538 168205.453 448498.477 168207.16 448497.849</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168207.16 448497.849 168211.558 448509.806</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168211.558 448509.806 168209.851 448510.435 168212.771 448518.374 168214.478 448517.746</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168214.478 448517.746 168218.876 448529.703</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168218.876 448529.703 168217.169 448530.332 168220.089 448538.271 168221.796 448537.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168221.796 448537.643 168224.082 448543.86</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Maatvoering>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA18517404716-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA18517404716-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:naam>aaneengebouwd</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[aeg]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id66" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168203.791 448505.543</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id36" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id37">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168224.082 448543.86 168217.416 448546.311 168180.653 448446.358 168187.312 448443.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168187.312 448443.909 168189.603 448450.116</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168189.603 448450.116 168195.325 448448.008</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168195.325 448448.008 168198.246 448455.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168198.246 448455.951 168192.524 448458.056</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168192.524 448458.056 168196.921 448470.012</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168196.921 448470.012 168202.643 448467.905</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168202.643 448467.905 168205.564 448475.848</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168205.564 448475.848 168199.842 448477.952</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168199.842 448477.952 168204.239 448489.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168204.239 448489.909 168209.961 448487.802</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168209.961 448487.802 168212.882 448495.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168212.882 448495.745 168207.16 448497.849</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168207.16 448497.849 168211.558 448509.806</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168211.558 448509.806 168217.279 448507.699</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168217.279 448507.699 168220.2 448515.641</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168220.2 448515.641 168214.478 448517.746</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168214.478 448517.746 168218.876 448529.703</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168218.876 448529.703 168224.597 448527.596</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168224.597 448527.596 168227.518 448535.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168227.518 448535.538 168221.796 448537.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168221.796 448537.643 168224.082 448543.86</gml:posList>
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
			<imro:aanduiding xlink:href="#NL.IMRO.0345.BP15517404636-00"/>
		</imro:Bouwaanduiding>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA2517407848-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA2517407848-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id67" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168231.057 448545.181</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id68" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168226.403 448540.717</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id40" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id41">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168229.805 448541.755 168224.082 448543.86</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168224.082 448543.86 168221.796 448537.643</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168221.796 448537.643 168227.518 448535.538</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168227.518 448535.538 168229.805 448541.755</gml:posList>
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
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA3517407872-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA3517407872-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id69" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168216.577 448517.15</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>69.786</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id43" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id44">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168224.597 448527.596 168218.876 448529.703</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168218.876 448529.703 168214.478 448517.746</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168214.478 448517.746 168220.2 448515.641</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168220.2 448515.641 168224.597 448527.596</gml:posList>
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
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA4517407883-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA4517407883-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id70" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168209.2 448497.579</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>69.786</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id46" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id47">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168217.279 448507.699 168211.558 448509.806</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168211.558 448509.806 168207.16 448497.849</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168207.16 448497.849 168212.882 448495.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168212.882 448495.745 168217.279 448507.699</gml:posList>
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
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA5517407886-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA5517407886-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id71" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168202.164 448477.694</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>69.786</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id49" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id50">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168209.961 448487.802 168204.239 448489.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168204.239 448489.909 168199.842 448477.952</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168199.842 448477.952 168205.564 448475.848</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168205.564 448475.848 168209.961 448487.802</gml:posList>
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
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA6517407889-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA6517407889-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id72" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168194.723 448457.997</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:hoek>69.786</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
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
													<gml:posList>168202.643 448467.905 168196.921 448470.012</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168196.921 448470.012 168192.524 448458.056</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168192.524 448458.056 168198.246 448455.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168198.246 448455.951 168202.643 448467.905</gml:posList>
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
		<imro:Bouwaanduiding gml:id="NL.IMRO.0345.BA7517407892-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0345.BA7517407892-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>bouwaanduiding</imro:typePlanobject>
			<imro:plangebied xlink:href="#NL.IMRO.0345.UPDeOntmoetingDp7-ow01"/>
			<imro:bestemmingsvlak xlink:href="#NL.IMRO.0345.EP19517404793-00"/>
			<imro:naam>specifieke bouwaanduiding - patio</imro:naam>
			<imro:labelInfo>
				<imro:Label>
					<imro:tekst>[sba-pa]</imro:tekst>
					<imro:positie>
						<imro:Labelpositie>
							<imro:plaatsingspunt>
								<gml:Point gml:id="id73" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168175.345 448438.952</gml:pos>
								</gml:Point>
							</imro:plaatsingspunt>
							<imro:aanpijlingspunt>
								<gml:Point gml:id="id74" srsName="urn:ogc:def:crs:EPSG::28992">
									<gml:pos>168191.168 448445.113</gml:pos>
								</gml:Point>
							</imro:aanpijlingspunt>
							<imro:hoek>0</imro:hoek>
						</imro:Labelpositie>
					</imro:positie>
				</imro:Label>
			</imro:labelInfo>
			<imro:geometrie>
				<gml:Surface gml:id="id56" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id57">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>168193.042 448441.801 168195.325 448448.008</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168195.325 448448.008 168189.603 448450.116</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168189.603 448450.116 168187.312 448443.909</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>168187.312 448443.909 168193.042 448441.801</gml:posList>
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
			<imro:datasetTitel>De Ontmoeting, deelplan 7</imro:datasetTitel>
			<imro:creatiedatum>2021-10-19</imro:creatiedatum>
			<imro:bronbeheerder>gemeente Veenendaal</imro:bronbeheerder>
			<imro:codeerVerantwoordelijke>buRO</imro:codeerVerantwoordelijke>
			<imro:naamApplicatieschema>IMRO2012</imro:naamApplicatieschema>
			<imro:codeReferentiesysteem>28992</imro:codeReferentiesysteem>
			<imro:toepassingsschaal>1000</imro:toepassingsschaal>
			<imro:applicatieIdentificatie>RoPlan 2012 v3.5 (voor OpenCities Map)</imro:applicatieIdentificatie>
			<imro:versieXMLschema>1.1.0</imro:versieXMLschema>
		</imro:MetadataIMRObestand>
	</imro:featureMember>
</imro:FeatureCollectionIMRO>
