# Testbestanden voor situatie na 1 januari 2025

Deze map bevat testbestanden die situaties met een datum na 1 januari 2025:

| Map        | Datum      | Type plan             | planstatus  | eigenschappen                                              | BG        | resultaaat |
| ---------- | ---------- | --------------------- | ----------- | ---------------------------------------------------------- | --------- | ---------- |
| RW-2025-1  | 2025-02-02 | aanwijzingsbesluit    | alle        | beleidsmatigVerantwoordelijkeOverheid = nationale overheid | Rijk      | blokkeren  |
| RW-2025-2a | 2025-02-02 | bestemmingsplan       | ontwerp     |                                                            | Gemeente  | blokkeren  |
| RW-2025-2b | 2025-02-02 | bestemmingsplan       | vastgesteld |                                                            | Gemeente  | OK         |
| RW-2025-3  | 2025-02-02 | inpassingsplan        | ontwerp     | 'TAM-projectbesluit[spatie][plannaam]'                     | Rijk      | blokkeren  |
| RW-2025-4a | 2025-02-02 | structuurvisie        | vastgesteld | beleidsmatigVerantwoordelijkeOverheid = gemeente           | Gemeente  | OK         |
| RW-2025-4b | 2025-02-02 | structuurvisie        | ontwerp     | beleidsmatigVerantwoordelijkeOverheid = gemeente           | Gemeente  | blokkeren  |
| RW-2025-5  | 2025-02-02 | voorbereidingsbesluit | alle        | \_P                                                        | Provincie | blokkeren  |
| RW-2025-6  | 2025-02-02 | voorbereidingsbesluit | alle        | \_R                                                        | Rijk      | blokkeren  |
| RW-2025-7a | 2025-02-02 | voorbereidingsbesluit | vastgesteld | plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'    | Gemeente  | OK         |
| RW-2025-7b | 2025-02-02 | voorbereidingsbesluit | ontwerp     | plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'    | Gemeente  | blokkeren  |

## RW-2025-1

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/aanwijzingsbesluit/1b_datum_na_IOW/NL.IMRO.9926.PA1112OUWATERLG-VA01.gml RW-2025-1.gml
PlanstatusEnDatum --> '2025-02-02'
beleidsmatigVerantwoordelijkeOverheid --> 'nationale overheid'
```

## RW-2025-2a

```shell
cp ../validatie_testbestanden_TAMomgevingsplan/bestemmingsplan/010_fout_TAM-omgevingsplan_geconsolideerd.gml RW-2025-2a.gml
PlanstatusEnDatum --> '2025-02-02'
planstatus --> ontwerp
```

## RW-2025-2b

```shell
cp ../validatie_testbestanden_TAMomgevingsplan/bestemmingsplan/010_fout_TAM-omgevingsplan_geconsolideerd.gml RW-2025-2b.gml
PlanstatusEnDatum --> '2025-02-02'
planstatus --> vastgesteld
```

## RW-2025-3  

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/inpassingsplan/1e_datum_na_IOW_ontwerp_TAMuitgebreid/NL.IMRO.0000.EZKip18GaswTern-2001.gml RW-2025-3.gml
```

## RW-2025-4a

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/structuurvisie/gemeente/1b_datum_na_IOW_vastgesteld/NL.IMRO.0119.ZoDoenWeGroen-SVC1.gml RW-2025-4a.gml
```

## RW-2025-4b

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/structuurvisie/gemeente/1e_datum_na_IOW_ontwerp/NL.IMRO.0119.ZoDoenWeGroen-SVC1.gml  RW-2025-4b.gml
```

## RW-2025-5  

```shell
 cp ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml RW-2025-5.gml
```

## RW-2025-6  

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml RW-2025-6.gml
```
## RW-2025-7a

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml RW-2025-7a.gml
```

## RW-2025-7b

```shell
cp ../validatie_testbestanden_TAM-uitgebreid/voorbereidingsbesluit/2a_IOW_TAM_toestaan/NL.IMRO.0202.VBB985-0301.gml RW-2025-7b.gml
```




