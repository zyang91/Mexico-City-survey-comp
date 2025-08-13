# EOD 2007 Database — DBF Table Descriptions (English Translation)

## Contents
- EOD 2007 Database
- Tr_Viviendas (Dwellings)
  - File description
  - Table description
- Tr_Hogares (Households)
  - File description
  - Table description
- Tr_Residentes (Residents)
  - File description
  - Table description
- Tr_Viajes (Trips)
  - File description
  - Table description
- Tr_Discapacitados (People with Disabilities)
  - File description
  - Table description
- Tr_Vehiculos (Vehicles)
  - File description
  - Table description

---

## EOD 2007 Database
The database contains the information collected during the 2007 Household Travel Survey (EOD‑2007), as well as the corresponding expansion (weighting) factors. The database consists of the tables **Tr_Viviendas.dbf**, **Tr_Hogares.dbf**, **Tr_Residentes.dbf**, **Tr_Viajes.dbf**, **Tr_Discapacitados.dbf**, and **Tr_Vehiculos.dbf**. A questionnaire record is assembled by linking information across the six tables using the corresponding foreign keys.

**Notes from source (as written):**
- *Stata – change all the nfactor variables to nfactor_«table name». Change the merge variable created when datasets are merged, to prevent duplication of the merge variable, which is created every time a new dataset is merged.*
- *Not all residents report trips. There are 232,317 total trips (several people made more than one trip). 86,569 people age 6+ made no trips. There are 19,215 people under age 6. Therefore, the total number of observations is 338,101.*

---

## Tr_Viviendas (Dwellings)
Stores data related to the dwelling. The primary key for this table is **idTr_Vivie**.

### File description
- **Name:** Tr_Viviendas.dbf
- **File type:** FoxPro Database
- **Total records:** 49,488
- **Record length:** 21 fields, 110 characters

### Table description
**Table Tr_Viviendas**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Table identifier | idTr_Vivie | Numeric | 1 | 20 | Primary key (positive integer) | — |
| Cover sheet | cEntidad | Character | 2 | 2 | State code | {09,15} |
| Cover sheet | cMunicipio | Character | 3 | 3 | Municipality code | {002,999} |
| Cover sheet | cLocalidad | Character | 4 | 4 | Locality code | {0001–9999} |
| Cover sheet | cAgeb | Character | 5 | 4 | AGEB code | {001, 0–9, A–Z} |
| Cover sheet | cManzana | Character | 6 | 3 | Block number | {000–999} |
| Cover sheet | cSegmento | Character | 7 | 1 | Segment of the block | {A–Z} |
| Cover sheet | cDistrito | Character | 8 | 3 | District to which the dwelling belongs | {001–999} |
| Cover sheet | cUPM | Character | 9 | 9 | Primary Sampling Unit (UPM) | {00001–99999} |
| Cover sheet | cVivienda | Character | 10 | 3 | Dwelling number | {001–999} |
| Cover sheet | cConsViv | Character | 11 | 3 | Dwelling consecutive number | {001–999} |
| Cover sheet | nSemana | Numeric | 12 | 4 | Week | {1–4} |
| Cover sheet | nDiaViaje | Numeric | 13 | 4 | Travel day | {1–5} |
| Cover sheet | cRenglon | Character | 14 | 2 | Row | {01–22} |
| Cover sheet | cFolioViv | Character | 15 | 7 | Dwelling folio | {0000000–9999999} |
| Cover sheet | nTotHogViv | Numeric | 16 | 4 | Total households in the dwelling | {01–99} |
| P1.1 | nPersonasT | Numeric | 17 | 4 | Total persons living in the dwelling | {01–99} |
| P1.2 | nMayor6 | Numeric | 18 | 4 | Persons age 6 or older | {01–99} |
| P2.1 | cPersGasto | Character | 19 | 1 | Do they share the same household expenses? | {1,2} |
| P2.2 | nHogarGasto | Numeric | 20 | 4 | How many have separate expenses? | {01–99, blank} |
| — | nFactor | Numeric | 21 | 20 | Expansion factor (positive integer) | — |

---

## Tr_Hogares (Households)
Stores data collected for households. The primary key for this table is **idTr_Hogar**. *(Source note mentions: one‑to‑many merge to dwellings, matching idTr_Vivie.)*

### File description
- **Name:** Tr_Hogares.dbf
- **File type:** FoxPro Database
- **Total records:** 51,475
- **Record length:** 27 fields, 242 characters

### Table description
**Table Tr_Hogares**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Table identifier | idTr_Hogar | Numeric | 1 | 20 | Primary key (positive integer) | — |
| Dwelling identifier | idTr_Vivie | Numeric | 2 | 20 | Key to Tr_Viviendas | {0000–9999} |
| Cover sheet | nHogar | Numeric | 3 | 4 | Household number | {0000–0099, blank} |
| Cover sheet | nTotCuestH | Numeric | 4 | 4 | Total questionnaires in the household | {01,99} |
| P4.8 | nVehicUt | Numeric | 5 | 4 | Available vehicles that were used | {01–99, blank} |
| P4.9 | nVehicNoUt | Numeric | 6 | 4 | Available vehicles that were not used | {01–99, blank} |
| P4.10 | nVisitantes | Numeric | 7 | 4 | Number of visitors | {01–99, blank} |
| P2.3.1 | nTransPriv | Numeric | 8 | 4 | How many available **private** transport vehicles | {0–9, blank} |
| P2.3.2 | nTransPub | Numeric | 9 | 4 | How many available **public** transport vehicles | {0–9, blank} |
| P2.3.3 | nMoto | Numeric | 10 | 4 | Has motorcycle or moped | {0–9, blank} |
| P2.3.4 | nBicicleta | Numeric | 11 | 4 | Has bicycle | {0–9, blank} |
| P2.4 | cDiscap | Character | 12 | 1 | Are there people with disabilities? | {1,2} |
| P2.5 | nTotDiscap | Numeric | 13 | 4 | Total people with disabilities | {0–9, blank} |
| P2.7 | idTc_TipoV | Numeric | 14 | 4 | Type of dwelling | — |
| P2.7.5 | cDescTipoV | Character | 15 | 25 | Description of dwelling type | — |
| P2.7.2 | nPagando | Numeric | 16 | 20 | Payment for the owned dwelling | — |
| P2.8 | nRentaEstim | Numeric | 17 | 20 | Estimated rent for the dwelling | — |
| P2.9 | nRentaMens | Numeric | 18 | 20 | Estimated **monthly** rent | — |
| P2.10 | cComputado | Character | 19 | 1 | Has a computer at home | — |
| P2.11 | idTc_TipoI | Numeric | 20 | 4 | Type of internet connection | — |
| P2.12 | idTc_Servi | Numeric | 21 | 4 | Type of pay‑TV service | — |
| P6.6 | nIngresoTo | Numeric | 22 | 4 | Periodicity of household income | {Open, blank} |
| P6.6.6 | sIngresoTo | Character | 23 | 10 | Description of other household income | {00001–99999} |
| P6.7 | idTc_Salar | Numeric | 24 | 4 | Range by minimum wages | {1–9, blank} |
| — | nFactor | Numeric | 26 | 20 | Expansion factor (positive integer) | — |
| — | fIngresoMe | Numeric | 27 | 20 | (5 decimals) Total **monthly** household income (computed) | — |
| — | rangoSM | Numeric | 28 | 4 | Salary range (computed) | — |

---

## Tr_Residentes (Residents)
Stores data collected for residents. The primary key for this table is **idTr_Resid**.

### File description
- **Name:** Tr_Residente.dbf
- **File type:** FoxPro Database
- **Total records:** 204,007
- **Record length:** 33 fields, 325 characters

### Table description
**Table Tr_Residentes**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Table identifier | idTr_Resid | Numeric | 1 | 20 | Primary key (positive integer) | — |
| Household identifier | idTr_Hogar | Numeric | 2 | 20 | Foreign key to Tr_Hogar (positive integer) | — |
| P3.1, P5.1, P6.1 | cPersona | Character | 3 | 4 | Resident number | {0–8, A, B} |
| P3.2 | sNombre | Character | 4 | 40 | Resident’s name | {A–Z, blank} |
| P3.3 | idTc_Paren | Numeric | 5 | 4 | Relationship to reference person | {0–9, blank} |
| P3.4 | cSexo | Character | 6 | 1 | Sex | {1,2} |
| P3.5 | nEdad | Numeric | 7 | 4 | Age | {00–99, blank} |
| P3.6.1 | cAniosCurs | Character | 8 | 1 | Last year completed (schooling) | — |
| P3.6.2 | idTc_Nivel | Numeric | 9 | 4 | Education level | {1–9, blank} |
| P3.7 | idTc_Activ | Numeric | 10 | 4 | Usual activity | {1–8, blank} |
| P3.7.1 | sDescActiv | Character | 11 | 40 | Description of other activity | {A–Z, blank} |
| P3.8 | idTc_Ocupa | Numeric | 12 | 4 | Occupation or position | {1–8, blank} |
| P3.8.1 | sDescOcupa | Character | 13 | 35 | Description of other occupation | {A–Z, blank} |
| P3.9 | idTc_Rama | Numeric | 14 | 4 | Industry/branch of the workplace | {1–8, blank} |
| P3.9.1 | sDescRama | Character | 15 | 30 | Description of other workplace industry | {A–Z, blank} |
| P4.2 | cUsoTransp | Character | 16 | 1 | To carry out activities, did you use transport? | {1,2} |
| P4.3 | cEntrevPer | Character | 17 | 1 | Was the resident interviewed personally? | {1,2} |
| P4.4 | cUsoTarj | Character | 18 | 1 | Did you use a travel card? | {1,2} |
| P4.5 | cTrabFuera | Character | 19 | 1 | On the travel day, did you work away from home? | {1,2} |
| P4.6 | cViajes | Character | 20 | 1 | Did you make trips during the day? | {1,2} |
| P4.7 | cViajesAD | Character | 21 | 1 | Did you make trips before and after the workday? | {1,2} |
| P6.3 | cIngresos | Character | 22 | 1 | Do you have income? | {1,2} |
| P6.4 | nMontoIngr | Numeric | 23 | 20 | What is the resident’s income? | {00000–99999} |
| P6.5 | idTc_Ingre | Numeric | 24 | 4 | How often do you receive it? | {1–6, blank} |
| P6.5.1 | sPeriodoIn | Character | 25 | 20 | Other income period | {A–Z, blank} |
| P5.2.1 | cInicioVia | Character | 26 | 1 | The first trip began at: | {1,2} |
| P5.2.2 | cEntidadOr | Character | 27 | 2 | State where the trip began | {00, 32, blank} |
| P5.2.3 | cMunicipio | Character | 28 | 3 | Municipality where the trip began | {001–999} |
| P5.2.4 | cAGEBOrige | Character | 29 | 4 | AGEB where the trip began | {001, 0–9, A–Z} |
| P5.2.5 | idTc_Propo | Numeric | 30 | 4 | Trip purpose | {1–10, blank} |
| P5.11.1 | nTotViaje | Numeric | 31 | 4 | Total trips by resident | {00–99} |
| — | nFactor | Numeric | 32 | 20 | Expansion factor (positive integer) | — |
| — | fIngresoMe | Numeric | 33 | 20 | (5 decimals) Resident’s **monthly** income | — |

---

## Tr_Viajes (Trips)
Stores data collected for trips. The primary key for this table is **idTr_Viaje**.

### File description
- **Name:** Tr_Viajes.dbf
- **File type:** FoxPro Database
- **Total records:** 232,317
- **Record length:** 29 fields, 478 characters

### Table description
**Table Tr_Viajes**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Table identifier | idTr_Viaje | Numeric | 1 | 20 | Primary key (positive integer) | — |
| Resident identifier | idTr_Resid | Numeric | 2 | 20 | Foreign key to Tr_Residente | (Auto‑number) |
| P5.1 | cPersona | Character | 3 | 4 | Resident number | {0–8, blank} |
| P5.3 | nViaje | Numeric | 4 | 4 | Trip number | {0–5, blank} |
| P5.4.1 | cHoraInici | Character | 5 | 4 | Trip start time | 00:00–28:00 |
| P5.4.2 | cHoraFin | Character | 6 | 4 | Trip end time | 00:00–28:00 |
| P5.5.1 | cEntidadDe | Character | 7 | 2 | Destination state code | {01,32} |
| P5.5.2 | cMunicipio | Character | 8 | 3 | Destination municipality code | {001,999} |
| P5.5.3 | cAGEBDest | Character | 9 | 4 | Destination AGEB code | {001, 0–9, A–Z} |
| P5.6 | idTc_TipoL | Numeric | 10 | 4 | What kind of place is it? | {1–12, blank} |
| P5.6.1 | sDescTipoL | Character | 11 | 100 | Description of other place | {A–Z, blank} |
| P5.7 | idTc_Propo | Numeric | 12 | 4 | Trip purpose | {1–10, blank} |
| P5.7.1 | sDescPropo | Character | 13 | 100 | Description of other trip purpose | {A–Z, blank} |
| P5.8 | sOrdenTran | Character | 14 | 7 | Order of modes used | {1–9, A, B, C, blank} |
| P5.8.7 | sOtroTrans | Character | 15 | 50 | Other mode of transport | {A–Z, blank} |
| P5.8.1 | cEstacionS | Character | 16 | 3 | Metro station where boarded | {A, B, M, T, 1–9} |
| P5.8.2 | cEstacionB | Character | 17 | 3 | Metro station where alighted | {A, B, M, T, 1–9} |
| P5.8.3 | fCostoSub | Numeric | 18 | 20 | (5 decimals) Cost of suburban rail | {0000.00–9999.99, blank} |
| P5.8.4 | fCostoCole | Numeric | 19 | 20 | (5 decimals) Cost of collective/mass transport | {0000.00–9999.99, blank} |
| P5.8.5 | fCostoTaxi | Numeric | 20 | 20 | (5 decimals) Taxi cost | {0000.00–9999.99, blank} |
| P5.8.6 | fCostoOtro | Numeric | 21 | 20 | (5 decimals) Cost of another mode | {0000.00–9999.99, blank} |
| P5.9.1 | cPasajeroV | Character | 22 | 2 | If the person drove, how many passengers were there? | {00–99, blank} |
| P5.9.2 | idTc_TipoE | Numeric | 23 | 4 | Parking location | {1–4, blank} |
| P5.9.3 | cTiempoEst | Character | 24 | 5 | How long was the vehicle parked? | 00:00–23:59 |
| P5.9.4 | cPagoEstac | Character | 25 | 1 | Was parking paid? | {1,2, blank} |
| P5.10.1 | fPagoTotEs | Numeric | 26 | 20 | (5 decimals) Total parking payment | {0000.00–9999.99, blank} |
| P5.10.2 | idTc_Tarif | Numeric | 27 | 4 | If a tariff was paid, for what period of time? | {1–4, blank} |
| P5.10.3 | cTiempoCam | Character | 28 | 5 | How long did you walk from the last mode? | 00:00–23:59 |
| — | nFactor | Numeric | 29 | 20 | Expansion factor (positive integer) | — |

---

## Tr_Discapacitados (People with Disabilities)
Contains data on people with disabilities in each household. The primary key is **idTr_Disca**.

### File description
- **Name:** Tr_Discapacitados.dbf
- **File type:** FoxPro Database
- **Total records:** 3,411
- **Record length:** 3 fields, 65 characters

### Table description
**Table Tr_Discapacitados**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Household identifier | idTr_Hogar | Numeric | 2 | 20 | Foreign key to Tr_Hogares | {0000–9999} |
| P2.6 | sNombreDis | Character | 4 | 25 | Name of the person with a disability | {A–Z} |
| — | nFactor | Numeric | 5 | 20 | Expansion factor (positive integer) | — |

---

## Tr_Vehiculos (Vehicles)
Contains data on vehicles in the household. The primary key is **idTr_Vehic**.

### File description
- **Name:** Tr_Vehiculos.dbf
- **File type:** FoxPro Database
- **Total records:** 30,215
- **Record length:** 7 fields, 133 characters

### Table description
**Table Tr_Vehiculos**

| Section / Question | Mnemonic | Data type | Position | Length | Description | Valid ranges |
|---|---|---|---:|---:|---|---|
| Table identifier | idTr_Vehic | Numeric | 1 | 20 | Primary key (positive integer) | — |
| Household identifier | idTr_Hogar | Numeric | 2 | 20 | Foreign key to Tr_Hogares | {0000–9999} |
| P2.3a | nVehiculo | Numeric | 3 | 4 | Vehicle number | {1–6, blank} |
| P2.3b | cMarca | Character | 4 | 30 | Vehicle make/brand | {A–Z} |
| P2.3c | cModelo | Character | 5 | 30 | Vehicle model | {A–Z, 1–9, blank} |
| P2.3d | nAnio | Numeric | 6 | 8 | Vehicle year | {0000–9999, blank} |
| — | nFactor | Numeric | 7 | 20 | Expansion factor (positive integer) | — |

---

*End of document.*
