*-------------------------------------------------------------------------------
* ACTION: IMPORT AND HARMONIZE DATA ON EXISTENT MUNICIPALITIES
* SOURCE: DTB - Divisão Territorial Brasileira (IBGE)

* CREATED: 20/09/2024
* LAST UPDATED: 22/09/2024
*-------------------------------------------------------------------------------

clear all
set more off
set varabbrev off
set scheme burd, permanently

*-------------------------------------------------------------------------------
* SET PATH AND LOCALS
*-------------------------------------------------------------------------------

//cd "(...)\panel_municipalities_br"

*-------------------------------------------------------------------------------
* IMPORT DATA
*-------------------------------------------------------------------------------

// 1997

import excel "raw\dtb_2000.xls", firstrow clear // the filename says 2000, but it's the list for 1997

keep if Nível == "5"

ren Nome munic_name
ren UF uf_code
ren municípiocomDV munic_code_end

tostring munic_code_end, replace 
tostring uf_code, replace

gen munic_code = ""

replace munic_code = uf_code + munic_code_end if strlen(munic_code_end) == 5
replace munic_code = uf_code + "0" + munic_code_end if strlen(munic_code_end) == 4
replace munic_code = uf_code + "00" + munic_code_end if strlen(munic_code_end) == 3
replace munic_code = uf_code + "000" + munic_code_end if strlen(munic_code_end) == 2

gen d_1997 = 1

keep uf_code munic_code munic_name d_1997

save "output\municipalities_1997.dta", replace


// 2003

import excel "raw\dtb_2003.xls", firstrow clear

keep if NÍVEL == "0005"

ren NOMEDOITEMGEOGRÁFICO munic_name
ren UF uf_code
ren MUNICÍPIO munic_code_end

gen munic_code = uf_code + munic_code_end
gen d_2003 = 1

keep uf_code munic_code munic_name d_2003

save "output\municipalities_2003.dta", replace


// 2004

import excel "raw\dtb_2004.xls", firstrow clear

keep if NÍVEL == "0005"

ren NOMEDOITEMGEOGRÁFICO munic_name
ren UF uf_code
ren MUNICÍPIO munic_code_end

gen munic_code = uf_code + munic_code_end
gen d_2004 = 1

keep uf_code munic_code munic_name d_2004

save "output\municipalities_2004.dta", replace


// 2006 

import excel "raw\dtb_2006.xls", firstrow clear

ren UF uf_code
ren Munic munic_code
ren NomeMunic munic_name

gen d_2006 = 1

keep uf_code munic_code munic_name d_2006

duplicates drop

save "output\municipalities_2006.dta", replace


// 2007 

import excel "raw\dtb_2007.xls", firstrow clear

ren UF uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end
gen d_2007 = 1

keep uf_code munic_code munic_name d_2007

duplicates drop

save "output\municipalities_2007.dta", replace


// 2008

import excel "raw\dtb_2008.xls", firstrow clear

ren UF uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end
gen d_2008 = 1

keep uf_code munic_code munic_name d_2008

duplicates drop

save "output\municipalities_2008.dta", replace


// 2009

import excel "raw\dtb_2009.xls", firstrow clear

ren UF uf_code
ren Município munic_code
ren Município_Nome munic_name

gen d_2009 = 1

keep uf_code munic_code munic_name d_2009

duplicates drop

save "output\municipalities_2009.dta", replace


// 2010

import excel "raw\dtb_2010.xls", firstrow clear

ren UF uf_code
ren Município munic_code
ren Nome_Munic munic_name

gen d_2010 = 1

keep uf_code munic_code munic_name d_2010

duplicates drop

save "output\municipalities_2010.dta", replace


// 2011

import excel "raw\dtb_2011.xls", firstrow clear

ren UF uf_code
ren Munic munic_code_end
ren Nome_Munic munic_name

gen munic_code = uf_code + munic_code_end
gen d_2011 = 1

keep uf_code munic_code munic_name d_2011

duplicates drop

save "output\municipalities_2011.dta", replace


// 2012

import excel "raw\dtb_2012.xls", firstrow clear

ren UF uf_code
ren Munic munic_code_end
ren Nome_Munic munic_name

gen munic_code = uf_code + munic_code_end
gen d_2012 = 1

keep uf_code munic_code munic_name d_2012

duplicates drop

save "output\municipalities_2012.dta", replace


// 2013

import excel "raw\dtb_2013.xls", firstrow clear

ren Uf uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end
gen d_2013 = 1

keep uf_code munic_code munic_name d_2013

duplicates drop

save "output\municipalities_2013.dta", replace


// 2014

import excel "raw\dtb_2014.xls", firstrow clear

ren UF uf_code
ren CodMunicipioCompleto munic_code
ren Nome_Município munic_name

gen d_2014 = 1

keep uf_code munic_code munic_name d_2014

duplicates drop

save "output\municipalities_2014.dta", replace


// 2015

import excel "raw\dtb_2015.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2015 = 1

keep uf_code munic_code munic_name d_2015

duplicates drop

save "output\municipalities_2015.dta", replace


// 2016

import excel "raw\dtb_2016.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2016 = 1

keep uf_code munic_code munic_name d_2016

duplicates drop

save "output\municipalities_2016.dta", replace


// 2017

import excel "raw\dtb_2017.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2017 = 1

keep uf_code munic_code munic_name d_2017

duplicates drop

save "output\municipalities_2017.dta", replace


// 2018

import excel "raw\dtb_2018.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2018 = 1

keep uf_code munic_code munic_name d_2018

duplicates drop

save "output\municipalities_2018.dta", replace


// 2019

import excel "raw\dtb_2019.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2019 = 1

keep uf_code munic_code munic_name d_2019

duplicates drop

save "output\municipalities_2019.dta", replace


// 2020

import excel "raw\dtb_2020.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2020 = 1

keep uf_code munic_code munic_name d_2020

duplicates drop

save "output\municipalities_2020.dta", replace


// 2021

import excel "raw\dtb_2021.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2021 = 1

keep uf_code munic_code munic_name d_2021

duplicates drop

save "output\municipalities_2021.dta", replace


// 2022

import excel "raw\dtb_2022.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

gen d_2022 = 1

keep uf_code munic_code munic_name d_2022

duplicates drop

save "output\municipalities_2022.dta", replace
