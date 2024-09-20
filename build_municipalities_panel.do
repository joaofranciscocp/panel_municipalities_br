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

cd "C:\Users\joaofrancisco\Desktop\USP\Economia\FUNDEF project\Municipalities\panel_municipalities_br\raw"
*-------------------------------------------------------------------------------
* IMPORT DATA
*-------------------------------------------------------------------------------

// 2000

import excel "dtb_2000.xls", firstrow clear

keep if Nível == "5"

ren Nome munic_name
ren UF uf
ren municípiocomDV munic_code_end

tostring munic_code_end, replace 
tostring uf, replace

keep uf munic_name munic_code_end


gen munic_code = ""

replace munic_code = uf + munic_code_end if strlen(munic_code_end) == 5
replace munic_code = uf + "0" + munic_code_end if strlen(munic_code_end) == 4
replace munic_code = uf + "00" + munic_code_end if strlen(munic_code_end) == 3
replace munic_code = uf + "000" + munic_code_end if strlen(munic_code_end) == 2


