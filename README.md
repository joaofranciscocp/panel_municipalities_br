# Existent municipalities in Brazil (1997-2022)

This repository contains a panel on existent municipalities in Brazil from 1997 to 2022, as well as original IBGE data (`raw`) and .do files (`code`) used to build it. 

Final panel is on `output` folder in .csv and .dta formats, with the following variables:

| ***Variable***| ***Description*** |
|-----|-----|
| `uf_abb` | State abbreviation|
| `uf_code` | State code (IBGE)|
| `munic_code` |Municipality code (IBGE)|
| `munic_name` |Municipality name|
| `d_t` |= 1 if municipality existed in year t|
| `previous_mun_t` |= previous mother municipality if not existent in year t, and = munic_code if existent in year t|
