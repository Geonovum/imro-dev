<?xml version="1.0" encoding="UTF-8"?>
<!-- TESTBESTAND
	
	  TESTCASE: 		VOORBEREIDINGSBESLUIT van RIJK vóór 2024-01-01 toestaan
  	TESTINPUT:		<beleidsmatigVerantwoordelijkeOverheid> = 'nationale overheid' && <imro:planstatus> = ontwerp && <imro:datum> = 2023-12-31  	
  	TESTRESULTAAT:	GOED, toestaan.
	
-->
<imro:FeatureCollectionIMRO gml:id="Collectie" xmlns:imro="http://www.geonovum.nl/imro/2012/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.geonovum.nl/imro/2012/1.1 http://schemas.geonovum.nl/imro/2012/1.1/IMRO2012.xsd">
	<gml:description>RoPlan IMRO GML import/export. Converteert IMRO GML data naar RoPlan bestanden en vice versa</gml:description>
	<!--Bestand aangemaakt m.b.v. Crotec's RoPlan IMRO Export versie 3.0.1 (voor v8i)-->
	<gml:name>NL.IMRO.0202.VBB985-0301.gml</gml:name>
	<imro:featureMember>
		<imro:Besluitgebied_X gml:id="NL.IMRO.0202.VBB985-0301">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.VBB985</imro:lokaalID>
					<imro:versie>0301</imro:versie>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlan>voorbereidingsbesluit</imro:typePlan>
			<imro:beleidsmatigVerantwoordelijkeOverheid>nationale overheid</imro:beleidsmatigVerantwoordelijkeOverheid>
			<imro:naamOverheid>gemeente Arnhem</imro:naamOverheid>
			<imro:overheidsCode>0202</imro:overheidsCode>
			<imro:naam>Voorbereidingsbesluit Bronbeeklaan 66</imro:naam>
			<imro:planstatusInfo>
				<imro:PlanstatusEnDatum>
					<imro:planstatus>ontwerp</imro:planstatus>
					<imro:datum>2023-12-31</imro:datum>
				</imro:PlanstatusEnDatum>
			</imro:planstatusInfo>
			<imro:besluitnummer>535216</imro:besluitnummer>
			<imro:verwijzingNaarVaststellingsbesluit>vb_NL.IMRO.0202.VBB985-0301.pdf</imro:verwijzingNaarVaststellingsbesluit>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentieBG_XGB>
					<imro:verwijzingNaarTekst>d_NL.IMRO.0202.VBB985-0301.pdf</imro:verwijzingNaarTekst>
					<imro:typeTekst>besluitdocument</imro:typeTekst>
				</imro:TekstReferentieBG_XGB>
			</imro:verwijzingNaarTekstInfo>
			<imro:ondergrondInfo>
				<imro:OndergrondReferentie>
					<imro:ondergrondtype>basisregistratie grootschalige topografie (BGT)</imro:ondergrondtype>
					<imro:ondergronddatum>2020-12-01</imro:ondergronddatum>
				</imro:OndergrondReferentie>
			</imro:ondergrondInfo>
			<imro:ondergrondInfo>
				<imro:OndergrondReferentie>
					<imro:ondergrondtype>grootschalige basiskaart (GBK)</imro:ondergrondtype>
					<imro:ondergronddatum>2020-12-01</imro:ondergronddatum>
				</imro:OndergrondReferentie>
			</imro:ondergrondInfo>
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
													<gml:posList>193501.665 445945.359 193511.416 445945.86</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193511.416 445945.86 193531.187 445946.576</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193531.187 445946.576 193550.958 445947.293</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193550.958 445947.293 193562.162 445947.655</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193562.162 445947.655 193563.878 445947.9</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193563.878 445947.9 193565.064 445948.432</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.064 445948.432 193566.174 445949.463</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.174 445949.463 193566.862 445950.477</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.862 445950.477 193567.434 445951.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193567.434 445951.745 193567.516 445952.931</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193567.516 445952.931 193566.823 445965.902</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.823 445965.902 193565.867 445982.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.867 445982.951 193564.91 446000</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.91 446000 193562.417 446046.285</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193562.417 446046.285 193564.01 446064.972</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.01 446064.972 193564.863 446079.858</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.863 446079.858 193565.715 446094.744</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.715 446094.744 193548.829 446093.928</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193548.829 446093.928 193549.299 446083.013</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193549.299 446083.013 193530.723 446082.074</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193530.723 446082.074 193532.102 446054.636</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193532.102 446054.636 193512.713 446053.865</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193512.713 446053.865 193512.982 446042.939</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193512.982 446042.939 193492.69 446042.47</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193492.69 446042.47 193493.428 446015.43</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193493.428 446015.43 193493.843 446000</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193493.843 446000 193494.773 445965.42</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193494.773 445965.42 193495.272 445947.491</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193495.272 445947.491 193501.665 445945.359</gml:posList>
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
		<imro:Besluitvlak_X gml:id="NL.IMRO.0202.BG2503590386-00">
			<imro:identificatie>
				<imro:NEN3610ID>
					<imro:namespace>NL.IMRO</imro:namespace>
					<imro:lokaalID>0202.BG2503590386-00</imro:lokaalID>
				</imro:NEN3610ID>
			</imro:identificatie>
			<imro:typePlanobject>besluitvlak_X</imro:typePlanobject>
			<imro:naam>Voorbereidingsbesluit</imro:naam>
			<imro:verwijzingNaarTekstInfo>
				<imro:TekstReferentie_XGB>
					<imro:verwijzingNaarTekst>d_NL.IMRO.0202.VBB985-0301.pdf</imro:verwijzingNaarTekst>
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
													<gml:posList>193501.665 445945.359 193511.416 445945.86</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193511.416 445945.86 193531.187 445946.576</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193531.187 445946.576 193550.958 445947.293</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193550.958 445947.293 193562.162 445947.655</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193562.162 445947.655 193563.878 445947.9</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193563.878 445947.9 193565.064 445948.432</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.064 445948.432 193566.174 445949.463</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.174 445949.463 193566.862 445950.477</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.862 445950.477 193567.434 445951.745</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193567.434 445951.745 193567.516 445952.931</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193567.516 445952.931 193566.823 445965.902</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193566.823 445965.902 193565.867 445982.951</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.867 445982.951 193564.91 446000</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.91 446000 193562.417 446046.285</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193562.417 446046.285 193564.01 446064.972</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.01 446064.972 193564.863 446079.858</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193564.863 446079.858 193565.715 446094.744</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193565.715 446094.744 193548.829 446093.928</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193548.829 446093.928 193549.299 446083.013</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193549.299 446083.013 193530.723 446082.074</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193530.723 446082.074 193532.102 446054.636</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193532.102 446054.636 193512.713 446053.865</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193512.713 446053.865 193512.982 446042.939</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193512.982 446042.939 193492.69 446042.47</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193492.69 446042.47 193493.428 446015.43</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193493.428 446015.43 193493.843 446000</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193493.843 446000 193494.773 445965.42</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193494.773 445965.42 193495.272 445947.491</gml:posList>
												</gml:LineStringSegment>
												<gml:LineStringSegment>
													<gml:posList>193495.272 445947.491 193501.665 445945.359</gml:posList>
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
			<imro:besluitgebied xlink:href="#NL.IMRO.0202.VBB985-0301"/>
		</imro:Besluitvlak_X>
	</imro:featureMember>
	<imro:featureMember>
		<imro:MetadataIMRObestand gml:id="Metadata">
			<imro:datasetTitel>Voorbereidingsbesluit Bronbeeklaan 66</imro:datasetTitel>
			<imro:creatiedatum>2021-01-14</imro:creatiedatum>
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
