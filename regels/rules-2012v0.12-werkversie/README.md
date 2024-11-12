# Logische regels validatie Wro instrumenten overgangsrecht inclusief tijdelijke alternatieve maatregelen

Versie 1-10-2024

## overzicht

Ten opzichte van de vorige versie (4 januari 2024) zijn logische regels gewijzigd voor:

- aanwijzingsbesluit: per 1-1-2025 blokkeren voor Rijk;
- Bestemmingsplan: logische regel voor gebruik van TAM voorafgaand aan IWT verwijderen;
- Inpassingsplan: per 1-1-2025 voor Rijk ontwerpplannen blokkeren;
- Structuurvisie: per 1-1-2025 voor gemeente ontwerpplannen blokkeren;
- Voorbereidingsbesluit: Per 1-1-2025 geen nieuwe upload meer voor provincie en Rijk;

## Uitgangspunten

Validatieregels overgangsrecht inclusief TAM's zijn aanvullend op de huidige
validaties van IMRO, STRI etc., versies 2012, 2008 etc. om herlaad acties in
Ruimtelijkeplannen.nl voor te blijven ondersteunen na inwerkingtreden  van
de Omgevingswet op 1 januari 2024 en de wijziging van het Besluit elektronische publicaties per 1 januari 2025. 

## Overgangsrecht Wro, inclusief TAM's, ten behoeve van inwerkingtreden Omgevingswet

Alle Wro instrumenten op alfabetische volgorde, inclusief het gebruik van TAM's.

### aanwijzingsbesluit

Onderdeel van het overgangsrecht: afmaken bestemmingsplan procedure na inwerkingtreden 
Omgevingswet. Dit plantype wordt ook door TAM gebruikt voor het Omgevingswet
instrument instructie. Validatieregels worden niet aangepast in verband met
overgangsrecht bestemmingsplan procedure, daarom geen verder aanpassing van de
validatieregels voor aanwijzingsbesluit per 1-1-2024.

- **RW-2025-1**: plantype aanwijzingsbesluit, attribuut beleidsmatigVerantwoordelijkeOverheid = nationale overheid nieuwe upload van het rijk blokkeren per 1-1-2025

Wilko wil dit implementeren door de volgende regel toe te voegen. Er is nog helemaal geen regel over het aanwijsbesluit. Die ga ik dus maken.

```
ALS 
   het plantype een aanwijsbesluit is EN 
    PlanStatusEnDatum is na ‘2025-01-01’EN
    de beleidsmatigVerantwoordelijkeOverheid = nationale overheid 
DAN
    Geef de melding: “Fout: een aanwijzingsbesluit van het Rijk mag na 1 januari 2025 niet worden gepubliceerd”
```

### amvb

- nieuwe upload blokkeren per 1-1-2024.

### beheersverordening

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'Chw bestemmingsplan [spatie][plannaam]' dan
    behandelen als plantype bestemmingsplan, namelijk: vanaf 1-1-2024 doorlaten
    als planstatus= 'vastgesteld' of 'geconsolideerd', anders upload blokkeren.

### bestemmingsplan

Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na inwerkingtreden 
Omgevingswet. Dit plantype wordt door TAM gebruikt voor het Omgevingswet
instrument omgevingsplan. Dit plantype als TAM-omgevingsplan kan al voor
inwerkingtreden Omgevingswet bekend gemaakt en beschikbaar gesteld via
Ruimtelijkeplannen.nl. Echter pas bij inwerkingtreding Omgevingswet kan de
vastgestelde versie van het TAM omgevingsplan worden beschikbaar gesteld via
Ruimtelijkeplannen.nl.

- vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld' of 'geconsolideerd',
    anders upload blokkeren;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-omgevingsplan[spatie][plannaam]';
- **RW-2025-2** Deze regel verwijderen: tot 1-1-2024 met plannaam= 'TAM-omgevingsplan[spatie][plannaam]' alleen
    doorlaten met een van de volgende statusssen: concept, voorontwerp, ontwerp,
    anders upload blokkeren. => deze regel moet dus uit de schematron worden gehaald. (RW-2)

WQ: Van de drie beperkingen vervalt de laatste die ervoor zorgde dat alleen bestemmingsplannen met de plannaam TAM* met de status concept,voorontwerp en ontwerp geupload konden worden voor 1-1-2024  --> Met TAM-omgevingsplan mag ALLES 

```
ALS 
   Het plantype een bestemmingsplan is EN
   PlanStatusEnDatum is na ‘2024-01-01’ EN
   De planstatus is anders dan 'vastgesteld' of 'geconsolideerd' EN
   De plannaam is niet 'TAM-omgevingsplan[spatie][plannaam]';
DAN
   Geef melding “Vanaf 1 januari 2024 mag een bestemmingsplan alleen de planstatus ‘vastgesteld’ of ‘geconsolideerd’ hebben.”
```

### exploitatieplan

Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na inwerkingtreden 
Omgevingswet.

- vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld' of 'geconsolideerd',
    anders upload blokkeren.

### gerechtelijke uitspraak

Geen Wro instrument. Wel IMRO2012: Uitspraken van de Raad van State en
gerechtelijke uitspraken met betrekking tot beschikbaar gestelde ruimtelijke
instrumenten worden door de bronhouder niet verwerkt in de ruimtelijke
instrumenten zelf, maar worden door de bronhouder van het instrument beschikbaar
gesteld naast het instrument. De Raad van State en de rechtbanken zijn zelf geen
bronhouder. Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na
inwerkingtreden  Omgevingswet

- geen aanpassing validatieregels.

### inpassingsplan

Wro inpassingsplan is een bestemmingsplan dat alleen door het Rijk en provincie
kan worden gepubliceerd tot inwerkingtreden  Omgevingswet. De procedure moet worden kunnen
afgemaakt onder Wro na inwerkingtreding. Dit plantype wordt door TAM gebruikt
voor het Omgevingswet instrument projectbesluit.

- planstatus 'ontwerp' blokkeren per 1-1-2024
- per 1-1-2024 doorlaten als planstatus= 'vastgesteld', anders blokkeren';
- tenzij vanaf 1-1-2024 plannaam= 'TAM-projectbesluit[spatie][plannaam]';
- **RW-2025-3** voor Rijk als plannaam='TAM-projectbesluit[spatie][plannaam]' en planstatus ‘ontwerp’ blokkeren per 1-1-2025.

```
Wilko wil regel toevoegen:
ALS 
   Het plantype een inpassingsplan is EN
   de beleidsmatigVerantwoordelijkeOverheid = nationale overheid EN
   PlanStatusEnDatum is na ‘2025-01-01’ EN
   De planstatus is ‘ontwerp’ EN
   plannaam='TAM-projectbesluit[spatie][plannaam]'
DAN
   Geef melding “Vanaf 1 januari 2025 mag met rijk geen ontwerp inpassingsplannen meer publiceren”; 
```

### omgevingsvergunning

Wabo instrument. Opvolger in Ow: omgevingsvergunning voor een buitenplanse
omgevingsplanactiviteit (BOPA).

- geen aanpassing validatieregels.

### projectbesluit

Dit is een voormalig Wro instrument voor gemeenten, provincies en het Rijk; met inwerkingtreden van de Wabo per 1 okt 2012 is dit instrument in de Wro vervallen: wel in IMRO2008, vervallen in IMRO2012. Zie ook PRGB2008.

- nieuwe upload blokkeren per 1-1-2024.

### provinciale verordening

Dit plantype wordt door TAM gebruikt voor het Omgevingswet instrument
omgevingsverordening.

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam=
    'TAM-omgevingsverordening[spatie][plannaam]'.

### reactieve aanwijzing

Dit plantype wordt door TAM gebruikt voor het Omgevingswet instrument reactieve
interventie.

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-reactieve interventie[spatie][plannaam]'.

### regeling

Dit is het Wro instrument voluit ministeriele regeling; in IMRO2012 geduid als
regeling.

- nieuwe upload blokkeren per 1-1-2024.

### structuurvisie

Dit plantype vervalt per inwerkingtreden  Omgevingswet; onder de Omgevingswet is dit het
instrument omgevingsvisie. Er is geen overgangsrecht van toepassing voor
provincies en het Rijk. Er is wel overgangsrecht voor de gemeentelijke
structuurvisies: lopende Wro procedures afmaken na inwerkingtreden Omgevingswet.

- nieuwe upload blokkeren per 1-1-2024 plantype structuurvisie van provincies
    (_P) en het Rijk (_R);
- vanaf 1-1-2024 plantype structuurvisie van gemeente (_G) doorlaten als
    planstatus= 'vastgesteld' of planstatus =’ontwerp’, anders upload blokkeren.
- **RW-2025-4** Vanaf 1-1-2025 plantype structuurvisie van gemeente (_G) doorlaten als
    planstatus= 'vastgesteld', anders upload blokkeren.

```
Wilko wil een nieuwe regel toevoegen:
ALS 
   Het plantype een structuurvisie is EN
   de beleidsmatigVerantwoordelijkeOverheid = gemeente EN
   PlanStatusEnDatum is na ‘2025-01-01’ EN
   De planstatus is niet ‘vastgesteld‘
DAN
   Geef melding “Vanaf 1 januari 2025 mag een gemeente alleen vastgestelde omgevingsvisie volgens het plantype structuurvisie publiceren als voor 1 januari 2025 de procedure is aangevangen”; 
```

### tijdelijke ontheffing buitenplans

Dit is een voormalig Wro instrument; met iwt Wabo omgevingsvergunning geworden.
Dus tijdelijk ontheffing buitenplans wel in IMRO2008, niet IMRO2012. In IMRO2012
daarvoor in de plaats de omgevingsvergunning.

- nieuwe upload blokkeren per 1-1-2024.

### uitwerkingsplan

Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na iwt
Omgevingswet.

- vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld', anders upload
    blokkeren.

### voorbereidingsbesluit

Dit plantype wordt door TAM gebruikt voor het Omgevingswet instrument
voorbereidingsbesluit.

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'.
- **RW-2025-5** nieuwe upload blokkeren per 1-1-2025 plantype voorbereidingsbesluit van provincies (_P)
- **RW-2025-6** nieuwe upload blokkeren per 1-1-2025 plantype voorbereidingsbesluit van het Rijk (_R)
- **RW-2025-7** Als plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]' van gemeente
    (_G) doorlaten als planstatus= 'vastgesteld', anders upload blokkeren

```
Dit moet met een assertie worden gecontroleerd
Regel 3:
ALS
   plantype = voorbereidingsbesluit EN
   de beleidsmatigVerantwoordelijkeOverheid = provincie EN
   PlanStatusEnDatum < ‘2025-01-01’ EN)
DAN is het goed
ANDERS:
   Geef melding “Vanaf 1 januari 2025 mogen het Rijk en de provincies Omgevingswet voorbereidingsbesluiten op basis van TAM meer publiceren”; 

ALS 
   Het plantype een voorbereidingsbesluit is EN
   de plannaam = 'TAM-voorbereidingsbesluit[spatie][plannaam]' EN
   de beleidsmatigVerantwoordelijkeOverheid = gemeente EN
   planstatus is iets anders dan ‘vastgesteld’ 
DAN
   Geef melding “Vanaf 1 januari 2024 mag de gemeente alleen vastgestelde Omgevingswet voorbereidingsbesluiten op basis van TAM publiceren”; 
```

### wijzigingsplan

Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na iwt
Omgevingswet.
- vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld', anders upload blokkeren.

### plancontour en pdf

De facultatieve standaard Plancontour en PDF is voor het beschikbaar stellen van
oude ruimtelijke plannen, visies en besluiten die tussen 1 juli 2008 en 1
januari 2010 overeenkomstig de Wro analoog in procedure zijn geweest, alsook
voor bestemmingsplannen van de oude WRO (voor 1 juli 2008) digitaal beschikbaar
te stellen. Er is geen overgangsrecht van toepassing.

- nieuwe upload blokkeren per 1-1-2024.
