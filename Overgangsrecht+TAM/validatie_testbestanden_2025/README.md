# Testbestanden voor situatie na 1 januari 2025

Deze map bevat testbestanden die situaties met een datum na 1 januari 2025:

| Map         | Datum      | Type plan             | planstatus  | eigenschappen                                              | BG        | gewenst resultaaat |
| ----------- | ---------- | --------------------- | ----------- | ---------------------------------------------------------- | --------- | ------------------ |
| RW-2025-1   | 2025-02-02 | aanwijzingsbesluit    | alle        | beleidsmatigVerantwoordelijkeOverheid = nationale overheid | Rijk      | blokkeren          |
| RW-2025-2-a | 2025-02-02 | bestemmingsplan       | ontwerp     |                                                            | Gemeente  | blokkeren          |
| RW-2025-2-b | 2025-02-02 | bestemmingsplan       | vastgesteld |                                                            | Gemeente  | OK                 |
| RW-2025-3   | 2025-02-02 | inpassingsplan        | ontwerp     | 'TAM-projectbesluit[spatie][plannaam]'                     | Rijk      | blokkeren          |
| RW-2025-4-a | 2025-02-02 | structuurvisie        | vastgesteld | beleidsmatigVerantwoordelijkeOverheid = gemeente           | Gemeente  | OK                 |
| RW-2025-4-b | 2025-02-02 | structuurvisie        | ontwerp     | beleidsmatigVerantwoordelijkeOverheid = gemeente           | Gemeente  | blokkeren          |
| RW-2025-5   | 2025-02-02 | voorbereidingsbesluit | alle        | \_P                                                         | Provincie | blokkeren          |
| RW-2025-6   | 2025-02-02 | voorbereidingsbesluit | alle        | \_R                                                         | Rijk      | blokkeren          |
| RW-2025-7a  | 2025-02-02 | voorbereidingsbesluit | vastgesteld | plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'    | Gemeente  | OK                 |
| RW-2025-7b  | 2025-02-02 | voorbereidingsbesluit | ontwerp     | plannaam= 'TAM-voorbereidingsbesluit[spatie][plannaam]'    | Gemeente  | blokkeren          |
