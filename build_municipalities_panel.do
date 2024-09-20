*-------------------------------------------------------------------------------
* ACTION: BUILD PANEL OF EXISTENT MUNICIPALITIES PER YEAR

* CREATED: 20/09/2024
* LAST UPDATED: 20/09/2024
*-------------------------------------------------------------------------------

clear all
set more off
set varabbrev off
set scheme burd, permanently

*-------------------------------------------------------------------------------
* SET PATH AND LOCALS
*-------------------------------------------------------------------------------

if c(username)=="sotero"				global dropbox "/Users/sotero/Dropbox/Research/Brazil"
if c(username)=="claire.montialoux"		global dropbox "C:/Users/claire.montialoux/Dropbox"
if c(username)=="rober"					global dropbox "C:\Users\rober\Dropbox"
if c(username)=="arthu"					global dropbox "C:\Users\arthu\Dropbox"
if c(username)=="joaofrancisco"         global dropbox "C:\Users\joaofrancisco\Dropbox"

global data			"$dropbox/brazil_education/01_data"
global out			"$dropbox/brazil_education/04_out"
*global data "C:\Users\joao.perez\Downloads\brazil_education\01_data"

cd "C:\Users\joaofrancisco\Desktop\USP\Economia\FUNDEF project\Municipalities\panel_municipalities_br"
*-------------------------------------------------------------------------------
* IMPORT DATA
*-------------------------------------------------------------------------------

// 2000

import excel "raw\dtb_2000.xls", firstrow clear

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

keep uf_code munic_code munic_name

save "output\municipalities_2000.dta"


// 2003

import excel "raw\dtb_2003.xls", firstrow clear

keep if NÍVEL == "0005"

ren NOMEDOITEMGEOGRÁFICO munic_name
ren UF uf_code
ren MUNICÍPIO munic_code_end

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

save "output\municipalities_2003.dta"


// 2004

import excel "raw\dtb_2004.xls", firstrow clear

keep if NÍVEL == "0005"

ren NOMEDOITEMGEOGRÁFICO munic_name
ren UF uf_code
ren MUNICÍPIO munic_code_end

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

save "output\municipalities_2004.dta"


// 2006 

import excel "raw\dtb_2006.xls", firstrow clear

ren UF uf_code
ren Munic munic_code
ren NomeMunic munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2006.dta"


// 2007 

import excel "raw\dtb_2007.xls", firstrow clear

ren UF uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2007.dta"


// 2008

import excel "raw\dtb_2008.xls", firstrow clear

ren UF uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2008.dta"


// 2009

import excel "raw\dtb_2009.xls", firstrow clear

ren UF uf_code
ren Município munic_code
ren Município_Nome munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2009.dta"


// 2010

import excel "raw\dtb_2010.xls", firstrow clear

ren UF uf_code
ren Município munic_code
ren Nome_Munic munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2010.dta"


// 2011

import excel "raw\dtb_2011.xls", firstrow clear

ren UF uf_code
ren Munic munic_code_end
ren Nome_Munic munic_name

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2011.dta"


// 2012

import excel "raw\dtb_2012.xls", firstrow clear

ren UF uf_code
ren Munic munic_code_end
ren Nome_Munic munic_name

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2012.dta"


// 2013

import excel "raw\dtb_2013.xls", firstrow clear

ren Uf uf_code
ren Município munic_code_end
ren Nome_Município munic_name

gen munic_code = uf_code + munic_code_end

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2013.dta"


// 2014

import excel "raw\dtb_2014.xls", firstrow clear

ren UF uf_code
ren CodMunicipioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2014.dta"


// 2015

import excel "raw\dtb_2015.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2015.dta"


// 2016

import excel "raw\dtb_2016.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2016.dta"


// 2017

import excel "raw\dtb_2017.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2017.dta"


// 2018

import excel "raw\dtb_2018.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2018.dta"


// 2019

import excel "raw\dtb_2019.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2019.dta"


// 2020

import excel "raw\dtb_2020.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2020.dta"


// 2021

import excel "raw\dtb_2021.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2021.dta"


// 2022

import excel "raw\dtb_2022.xls", firstrow clear

ren UF uf_code
ren CódigoMunicípioCompleto munic_code
ren Nome_Município munic_name

keep uf_code munic_code munic_name

duplicates drop

save "output\municipalities_2022.dta"










