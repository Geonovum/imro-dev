# Logische regels validatie Wro instrumenten overgangsrecht inclusief tijdelijke alternatieve maatregelen (TAM)

Versie 2024-12-19

Ten opzichte van de vorige versie (4 januari 2024) zijn logische regels gewijzigd voor: 

- **aanwijzingsbesluit**: per 1-1-2025 blokkeren voor Rijk;
- **Bestemmingsplan**: logische regel voor gebruik van TAM voorafgaand aan IWT verwijderen;
- **Inpassingsplan**: per 1-1-2025 voor Rijk ontwerpplannen blokkeren;
- **Structuurvisie**: per 1-1-2025 voor gemeente ontwerpplannen blokkeren;
- **Voorbereidingsbesluit**: Per 1-1-2025 geen nieuwe upload meer voor provincie en Rijk;

## Uitgangspunten

Validatieregels overgangsrecht inclusief TAM's zijn aanvullend op de huidige
validaties van IMRO, STRI etc., versies 2012, 2008 etc. om herlaad acties in
Ruimtelijkeplannen.nl te blijven ondersteunen na inwerkingtreden  van
de Omgevingswet op 1 januari 2024 en de wijziging van het Besluit elektronische publicaties (Bep)per 1 januari 2025. 

## Overgangsrecht Wro, inclusief TAM's, ten behoeve van inwerkingtreden Omgevingswet

Alle Wro instrumenten op alfabetische volgorde, inclusief het gebruik van TAM's.

### aanwijzingsbesluit

Onderdeel van het overgangsrecht: afmaken bestemmingsplan procedure na inwerkingtreden 
Omgevingswet. Dit plantype wordt ook door TAM gebruikt voor het Omgevingswet
instrument instructie. Validatieregels aangepast per 1-1-2025 aangepast ivm wijziging Bep 
TAM-instructie kan niet meer worden gebruikt.


- nieuwe upload blokkeren per 1-1-2025.

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

- vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld' of 'geconsolideerd',anders upload blokkeren;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-omgevingsplan[spatie][plannaam]';


### exploitatieplan

Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na inwerkingtreden 
Omgevingswet.

-   vanaf 1-1-2024 doorlaten als planstatus= 'vastgesteld' of 'geconsolideerd',
    anders upload blokkeren.

### gerechtelijke uitspraak

Geen Wro instrument. Wel IMRO2012: Uitspraken van de Raad van State en
gerechtelijke uitspraken met betrekking tot beschikbaar gestelde ruimtelijke
instrumenten worden door de bronhouder niet verwerkt in de ruimtelijke
instrumenten zelf, maar worden door de bronhouder van het instrument beschikbaar
gesteld naast het instrument. De Raad van State en de rechtbanken zijn zelf geen
bronhouder. Onderdeel van overgangsrecht: afmaken bestemmingsplan procedure na
inwerkingtreden  Omgevingswet

-   geen aanpassing validatieregels.

### inpassingsplan

Wro inpassingsplan is een bestemmingsplan dat alleen door het Rijk en provincie
kan worden gepubliceerd tot inwerkingtreden  Omgevingswet. De procedure moet worden kunnen
afgemaakt onder Wro na inwerkingtreding. Dit plantype wordt door TAM gebruikt
voor het Omgevingswet instrument projectbesluit. Door wijziging van het Bep kan TAM niet meer worden gebruikt door het Rijk.

- planstatus 'ontwerp' blokkeren per 1-1-2024
- per 1-1-2024 doorlaten als planstatus= 'vastgesteld', anders blokkeren';
- tenzij vanaf 1-1-2024 plannaam= 'TAM-projectbesluit[spatie][plannaam]';
- voor Rijk als plannaam='TAM-projectbesluit[spatie][plannaam]' en planstatus ‘ontwerp’ blokkeren per 1-1-2025. 

In de context van inpassingsplan tbv wijziging Bep en de TAM-projectbesluit:
Check of aan 1 van de volgende eisen is voldaan
- Datum < ‘2024-01-01’
- Datum >= ‘2024-01-01’ en plannaam niet ‘TAM-projectbesluit ’ en planstatus = ‘vastgesteld’
- Datum tussen >= ‘2024-01-01' en 2025-01-01  en plannaam= 'TAM-projectbesluit  
- Datum > ‘2025-01-01’ en plannaam= 'TAM-projectbesluit  en verantwoordelijke is niet rijk
- Datum > ‘2025-01-01’ en plannaam= 'TAM-projectbesluit  en verantwoordelijke is rijk en planstatus <> ontwerp.

### omgevingsvergunning

Wabo instrument. Opvolger in Ow: omgevingsvergunning voor een buitenplanse
omgevingsplanactiviteit (BOPA).

-   geen aanpassing validatieregels.

### projectbesluit

Dit is een voormalig Wro instrument voor gemeenten, provincies en het Rijk; met inwerkingtreden van de Wabo per 1 okt 2012 is dit instrument in de Wro vervallen: wel in IMRO2008, vervallen in IMRO2012. Zie ook PRGB2008.

- nieuwe upload blokkeren per 1-1-2024.

### provinciale verordening

Dit plantype wordt door TAM gebruikt voor het Omgevingswet instrument
omgevingsverordening.

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-omgevingsverordening[spatie][plannaam]'.

### reactieve aanwijzing

Dit plantype wordt door TAM gebruikt voor het Omgevingswet instrument reactieve interventie.

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-reactieve interventie[spatie][plannaam]'.

### regeling

Dit is het Wro instrument voluit ministeriele regeling; in IMRO2012 geduid als
regeling.

-   nieuwe upload blokkeren per 1-1-2024.

### structuurvisie

Dit plantype vervalt per inwerkingtreden  Omgevingswet; onder de Omgevingswet is dit het
instrument omgevingsvisie. Er is geen overgangsrecht van toepassing voor
provincies en het Rijk. Er is wel overgangsrecht voor de gemeentelijke
structuurvisies: lopende Wro procedures afmaken na inwerkingtreden Omgevingswet. 
Wijziging van het Bep zorgt dat gemeenten per 1-1-2025 geen omgevingsvisie met de RO Standaarden kunnen uploaden via Ruimtelijkeplannen.nl

- nieuwe upload blokkeren per 1-1-2024 plantype structuurvisie van provincies (_P) en het Rijk (_R);
- vanaf 1-1-2024 plantype structuurvisie van gemeente (_G) doorlaten als 
    planstatus= 'vastgesteld' of planstatus =’ontwerp’, anders upload blokkeren.
- vanaf 1-1-2025 plantype structuurvisie van gemeente (_G) doorlaten als
    planstatus= 'vastgesteld', anders upload blokkeren.

In de context van imro:Structuurvisieplangebied_G[imro:typePlan = 'structuurvisie'
Controleer of aan 1 van de volgende eisen is voldaan:

- Datum < ‘2024-01-01’
- Datum tussen ‘2024-01-01’ en ‘2025-01-01’ en planstatus in (vastgesteld, ontwerp)
- Datum na ‘2025-01-01) en planstatus = vastgesteld.


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
voorbereidingsbesluit. Wijziging van het BEp zorgt dat alleen gemeenten per 1-1-2025 not TAM-voorbereidingsbesluit kunnen gebruiken. 

- nieuwe upload blokkeren per 1-1-2024;
- tenzij vanaf 1-1-2024 plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'.
- nieuwe upload blokkeren per 1-1-2025 plantype voorbereidingsbesluit van provincies
    (_P) en het Rijk (_R). 
- Als plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]' van gemeente
    (_G) doorlaten als planstatus= 'vastgesteld', anders upload blokkeren

In de context van imro:Besluitgebied_X[//imro:typePlan = 'voorbereidingsbesluit'
Controleer of aan 1 van de volgende eisen is voldaan

- Datum < ‘2024-01-01’
- Datum tussen 2024-01-01 en 2025-01-01 en plannaam= 'TAM-voorbereidingsbesluit’
- Datum na 2025-01-01 en en verantwoordelijke = gemeente en planstatus = 'vastgesteld'

Anders geef foutmelding.

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
