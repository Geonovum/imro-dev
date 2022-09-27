<?xml version="1.0" encoding="UTF-8"?>
<imro:FeatureCollectionIMRO gml:id="Collectie" xmlns:imro="http://www.geonovum.nl/imro/2012/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.geonovum.nl/imro/2012/1.1 http://schemas.geonovum.nl/imro/2012/1.1/IMRO2012.xsd">
	<gml:description>RoPlan IMRO GML import/export. Converteert IMRO GML data naar RoPlan bestanden en vice versa</gml:description>
	<!--Bestand aangemaakt m.b.v. Crotec's RoPlan IMRO Export versie 3.0.1 (voor v8i)-->
	<gml:name>NL.IMRO.0957.BP00000293-GU01.gml</gml:name>
	<imro:featureMember>
		<imro:Besluitgebied_X gml:id="NL.IMRO.0957.BP00000293-GU01">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0957.BP00000293</imro:lokaalID>
					<imro:versie>GU01</imro:versie>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlan>gerechtelijke uitspraak</imro:typePlan>
			<imro:beleidsmatigVerantwoordelijkeOverheid>gemeentelijke overheid</imro:beleidsmatigVerantwoordelijkeOverheid>
			<imro:naamOverheid>gemeente Roermond</imro:naamOverheid>
			<imro:overheidsCode>0957</imro:overheidsCode>
			<imro:naam>Uitspraak RvS beroep Veestraat 12 Swalmen</imro:naam>
			<imro:planstatusInfo>
				<imro:PlanstatusEnDatum>
					<imro:planstatus>vastgesteld</imro:planstatus>
					<imro:datum>2023-01-01</imro:datum>
				</imro:PlanstatusEnDatum>
			</imro:planstatusInfo>
			<imro:besluitnummer>201807095/1/R1</imro:besluitnummer>
			<imro:verwijzingNaarVaststellingsbesluit>vb_NL.IMRO.0957.BP00000293-GU01.pdf</imro:verwijzingNaarVaststellingsbesluit>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentieBG_XGB>
					<imro:verwijzingNaarTekst>d_NL.IMRO.0957.BP00000293-GU01.pdf</imro:verwijzingNaarTekst>
					<imro:typeTekst>besluitdocument</imro:typeTekst>
				</imro:TekstReferentieBG_XGB>
			</imro:verwijzingNaarTekstInfo>
			<imro:ondergrondInfo>
				<imro:OndergrondReferentie>
					<imro:ondergrondtype>grootschalige basiskaart (GBK)</imro:ondergrondtype>
					<imro:ondergronddatum>2017-04-04</imro:ondergronddatum>
				</imro:OndergrondReferentie>
			</imro:ondergrondInfo>
			<imro:verwijzingNaarExternPlanInfo>
				<imro:ExternPlanReferentie_XGB>
					<imro:naamExternPlan>Veestraat 12 Swalmen</imro:naamExternPlan>
					<imro:idnExternPlan>NL.IMRO.0957.BP00000293-VG01</imro:idnExternPlan>
					<imro:rolExternPlan>ten gevolge van extern plan/besluit</imro:rolExternPlan>
				</imro:ExternPlanReferentie_XGB>
			</imro:verwijzingNaarExternPlanInfo>
			<imro:verwijzingNorm>IMRO2012</imro:verwijzingNorm>
			<imro:verwijzingNorm>PRGB2012</imro:verwijzingNorm>
			<imro:geometrie>
				<gml:Surface gml:id="id1" srsName="urn:ogc:def:crs:EPSG::28992">
					<gml:patches>
						<gml:PolygonPatch>
							<gml:exterior>
								<gml:Ring>
									<gml:curveMember>
										<gml:Curve gml:id="id2">
											<gml:segments>
												<gml:LineStringSegment>
													<gml:posList>201511.074 361757.29 201557.048 361640.591 201583.272 361650.295 201580.19 361658.068 201577.108 361665.84 201555.096 361721.353 201539.537 361760.59 201511.074 361757.29</gml:posList>
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
		</imro:Besluitgebied_X>
	</imro:featureMember>
	<imro:featureMember>
		<imro:Besluitvlak_X gml:id="NL.IMRO.0957.BG3459010020-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0957.BG3459010020-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>besluitvlak_X</imro:typePlanobject>
			<imro:naam>Besluitvlak gerechtelijke uitspraak</imro:naam>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_XGB>
					<imro:verwijzingNaarTekst>d_NL.IMRO.0957.BP00000293-GU01.pdf</imro:verwijzingNaarTekst>
					<imro:typeTekst>besluittekst</imro:typeTekst>
				</imro:TekstReferentie_XGB>
			</imro:verwijzingNaarTekstInfo>
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
													<gml:posList>201511.074 361757.29 201557.048 361640.591 201583.272 361650.295 201580.19 361658.068 201577.108 361665.84 201555.096 361721.353 201539.537 361760.59 201511.074 361757.29</gml:posList>
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
			<imro:besluitgebied xlink:href="#NL.IMRO.0957.BP00000293-GU01"/>
		</imro:Besluitvlak_X>
	</imro:featureMember>
	<imro:featureMember>
		<imro:MetadataIMRObestand gml:id="Metadata">
			<imro:datasetTitel>Uitspraak RvS beroep Veestraat 12 Swalmen</imro:datasetTitel>
			<imro:creatiedatum>2019-07-19</imro:creatiedatum>
			<imro:bronbeheerder>gemeente Roermond</imro:bronbeheerder>
			<imro:codeerVerantwoordelijke>Jbr</imro:codeerVerantwoordelijke>
			<imro:naamApplicatieschema>IMRO2012</imro:naamApplicatieschema>
			<imro:codeReferentiesysteem>28992</imro:codeReferentiesysteem>
			<imro:toepassingsschaal>1000</imro:toepassingsschaal>
			<imro:applicatieIdentificatie>RoPlan 2012 v3.0.1 (voor v8i)</imro:applicatieIdentificatie>
			<imro:versieXMLschema>1.1.0</imro:versieXMLschema>
		</imro:MetadataIMRObestand>
	</imro:featureMember>
</imro:FeatureCollectionIMRO>
