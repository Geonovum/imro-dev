# Testbestanden voor situatie na 1 januari 2025

Deze map bevat testbestanden die situaties met een datum na 1 januari 2025:

| testbestand    | Datum      | Type plan             | Plannaam                      | planstatus  | bmv Overheid           | gewenst Resultaat |
| -------------- | ---------- | --------------------- | ----------------------------- | ----------- | ---------------------- | ----------------- |
| RW-2025-1.gml  | 2025-02-02 | aanwijzingsbesluit    | Proactieve...                 | alle        | nationale overheid     | blokkeren         |
| RW-2025-2a.gml | 2025-02-02 | bestemmingsplan       | Bestemmingsplan               | ontwerp     | gemeentelijke overheid | blokkeren         |
| RW-2025-2b.gml | 2025-02-02 | bestemmingsplan       | TAM-omgevingsplan             | ontwerp     | gemeentelijke overheid | OK                |
| RW-2025-3.gml  | 2025-02-02 | inpassingsplan        | TAM-projectbesluit            | ontwerp     | nationale overheid     | blokkeren         |
| RW-2025-4a.gml | 2025-02-02 | structuurvisie        | kadernotitie ...              | vastgesteld | gemeentelijke overheid | OK                |
| RW-2025-4b.gml | 2025-02-02 | structuurvisie        | kadernotitie ...              | ontwerp     | gemeentelijke overheid | blokkeren         |
| RW-2025-5.gml  | 2025-02-02 | voorbereidingsbesluit | TAM-voorbereidingsbesluit ... | alle        | provinciale overheid   | blokkeren         |
| RW-2025-6.gml  | 2025-02-02 | voorbereidingsbesluit | voorbereidingsbesluit ...     | alle        | nationale overheid     | blokkeren         |
| RW-2025-7a.gml | 2025-02-02 | voorbereidingsbesluit | TAM-voorbereidingsbesluit ... | vastgesteld | gemeentelijke overheid | OK                |
| RW-2025-7b.gml | 2025-02-02 | voorbereidingsbesluit | TAM-voorbereidingsbesluit ... | ontwerp     | gemeentelijke overheid | blokkeren         |

De testbestanden leveren de volgende foutmeldingen op:

| testbestand    | context                                                                                         | melding                                                                                                                                                                                                    |
| -------------- | ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RW-2025-1.gml  | IMRO-object met gml:id NL.IMRO.9926.PA1112OUWATERLG-VA01, type = imro:Besluitgebied_X:          | Fout: een aanwijzingsbesluit van het Rijk met de datum 1 januari 2025 of later mag niet worden gepubliceerd.                                                                                               |
| RW-2025-2a.gml | IMRO-object met gml:id NL.IMRO.0200.bp1416-ont1, type = imro:Bestemmingsplangebied:             | Fout: als typePlan is 'bestemmingsplan' en datum is groter dan of gelijk aan 2024-01-01, dan moet planstatus zijn 'vastgesteld' of 'geconsolideerd', tenzij naam begint met 'TAM-omgevingsplan[spatie]'.   |
| RW-2025-2b.gml |                                                                                                 |                                                                                                                                                                                                            |
| RW-2025-3.gml  | IMRO-object met gml:id NL.IMRO.0000.EZKip18GaswTern-2001, type = imro:Bestemmingsplangebied:    | Fout: een inpassingsplan van het Rijk met de status ontwerp met de datum 1 januari 2025 of later mag niet worden gepubliceerd.                                                                             |
| RW-2025-4a.gml |                                                                                                 |                                                                                                                                                                                                            |
| RW-2025-4b.gml | IMRO-object met gml:id NL.IMRO.0119.ZoDoenWeGroen-SVC1, type = imro:Structuurvisieplangebied_G: | Fout: vanaf 1 januari 2025 mag een gemeente alleen een vastgestelde omgevingsvisie publiceren op basis van het Wro plantype structuurvisie publiceren als voor 1 januari 2025 de procedure is aangevangen. |
| RW-2025-5.gml  | IMRO-object met gml:id NL.IMRO.0202.VBB985-0301, type = imro:Besluitgebied_X:                   | Fout: vanaf 1 januari 2025 mogen het Rijk en de provincies hun Omgevingswet voorbereidingsbesluiten niet meer publiceren op basis van TAM.                                                                 |
| RW-2025-6.gml  | IMRO-object met gml:id NL.IMRO.0202.VBB985-0301, type = imro:Besluitgebied_X:                   | Fout: vanaf 1 januari 2025 mogen het Rijk en de provincies hun Omgevingswet voorbereidingsbesluiten niet meer publiceren op basis van TAM.                                                                 |
| RW-2025-7a.gml |                                                                                                 |                                                                                                                                                                                                            |
| RW-2025-7b.gml | IMRO-object met gml:id NL.IMRO.0202.VBB985-0301, type = imro:Besluitgebied_X:                   | Fout: vanaf 1 januari 2025 mogen het Rijk en de provincies hun Omgevingswet voorbereidingsbesluiten niet meer publiceren op basis van TAM.                                                                 |

De gebruikte testbestanden zijn gekopieerd van de volgende bronnen waarna de datum etc. is aangepast

| testbestand    | herkomst                                                                                                                             |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| RW-2025-1.gml  | ../validatie_testbestanden_TAM-uitgebreid/aanwijzingsbesluit/1b_datum_na_IOW/NL.IMRO.9926.PA1112OUWATERLG-VA01.gml                   |
| RW-2025-2a.gml | ../validatie_testbestanden_TAMomgevingsplan/bestemmingsplan/010_fout_TAM-omgevingsplan_geconsolideerd.gml                            |
| RW-2025-2b.gml | ../validatie_testbestanden_TAMomgevingsplan/bestemmingsplan/010_fout_TAM-omgevingsplan_geconsolideerd.gml                            |
| RW-2025-3.gml  | ../validatie_testbestanden_TAM-uitgebreid/inpassingsplan/1e_datum_na_IOW_ontwerp_TAMuitgebreid/NL.IMRO.0000.EZKip18GaswTern-2001.gml |
| RW-2025-4a.gml | ../validatie_testbestanden_TAM-uitgebreid/structuurvisie/gemeente/1b_datum_na_IOW_vastgesteld/NL.IMRO.0119.ZoDoenWeGroen-SVC1.gml    |
| RW-2025-4b.gml | ../validatie_testbestanden_TAM-uitgebreid/structuurvisie/gemeente/1e_datum_na_IOW_ontwerp/NL.IMRO.0119.ZoDoenWeGroen-SVC1.gml        |
| RW-2025-5.gml  | ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml                     |
| RW-2025-6.gml  | ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml                     |
| RW-2025-7a.gml | ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml                     |
| RW-2025-7b.gml | ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml                     |
