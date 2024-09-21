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

*-------------------------------------------------------------------------------
* BUILD PANEL
*-------------------------------------------------------------------------------

use "output\municipalities_1997.dta", clear


foreach year in 2003 2004 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 {
    merge m:m munic_code using "output\municipalities_`year'.dta"
	
	drop _merge
}

duplicates drop

gen d_2005 = 1 if d_2004 == 1
order d_2005, after(d_2004)
order munic_code, after(uf_code)

//If a municipality did not exist in year t,
//find to which other municipality it belonged

foreach year in 1997 2003 2004 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 {
	gen previous_mun_`year' = ""
	
	replace previous_mun_`year' = munic_code if d_`year' != .
	
	replace previous_mun_`year' = "1506807" if d_`year' == . & munic_code == "1504752" // 1504752	Mojuí dos Campos : Santarém 
	replace previous_mun_`year' = "2208007" if d_`year' == . & munic_code == "2200954" // 2200954	Aroeiras do Itaim : Picos
	
	
}

*******************************************************
*TO DO: manually find such municipalities zzzz
*******************************************************

// 2206720	Nazária : Teresina 
// 2207793	Pau D'Arco do Piauí : Altos
// 2406155	Jundiá : Várzea
// 2703759	Jequiá da Praia : São Miguel dos Campos e Coruripe
// 2903276	Barrocas : Serrinha
// 2919553	Luís Eduardo Magalhães : Barreiras
// 3202256	Governador Lindenberg : Colatina 
// 3302858	Mesquita : Nova Iguaçu
// 4212650	Pescaria Brava : Laguna
// 4220000	Balneário Rincão : Içara
// 4300034	Aceguá : Bagé 
// 4300471	Almirante Tamandaré do Sul : Carazinho 
// 4301073	Arroio do Padre : Pelotas
// 4302220	Boa Vista do Cadeado : Cruz Alta, Ijuí e Augusto Pestana
// 4302238	Boa Vista do Incra : Cruz Alta
// 4302584	Bozano : Ijuí 
// 4304614	Canudos do Vale : Lajeado
// 4304622	Capão Bonito do Sul : Lagoa Vermelha
// 4304655	Capão do Cipó : Santiago
// 4305835	Coqueiro Baixo : Nova Bréscia e Relvado
// 4305934	Coronel Pilar : Garibaldi 
// 4306130	Cruzaltense : Campinas do Sul
// 4308433	Forquetinha : Lajeado
// 4310652	Itati : Terra de Areia
// 4310876	Jacuizinho : Salto do Jacuí
// 4311239	Lagoa Bonita do Sul : Sobradinho 
// 4312179	Mato Queimado : Caibaté 
// 4313466	Novo Xingu : Constantina
// 4314134	Paulo Bento : Erechim 
// 4314175	Pedras Altas : Herval e Pinheiro Machado
// 4314464	Pinhal da Serra : Esmeralda
// 4314548	Pinto Bandeira : Bento Gonçalves
// 4315313	Quatro Irmãos : Erechim e Jacutinga
// 4315958	Rolador : São Luiz Gonzaga
// 4316733	Santa Cecília do Sul : Tapejara 
// 4316972	Santa Margarida do Sul : São Gabriel
// 4318614	São José do Sul : Montenegro, Salvador do Sul e Maratá
// 4319364	São Pedro das Missões : Palmeira das Missões
// 4321469	Tio Hugo : Victor Graeff
// 4323770	Westfalia : Teutônia e Imigrante
// 5003900	Figueirão : Camapuã e Costa Rica
// 5006275	Paraíso das Águas : Água Clara, Costa Rica e Chapadão do Sul
// 5101852	Bom Jesus do Araguaia : Ribeirão Cascalheira e Alto Boa Vista
// 5103254	Colniza : Aripuanã
// 5103361	Conquista D'Oeste : Pontes e Lacerda
// 5103437	Curvelândia : Cáceres, Mirassol d`Oeste e Lambari d`Oeste
// 5104526	Ipiranga do Norte : Tapurah
// 5104542	Itanhangá : Tapurah 
// 5106174	Nova Nazaré : Água Boa
// 5106190	Nova Santa Helena : Itaúba e Cláudia
// 5106315	Novo Santo Antônio : São Félix do Araguaia
// 5107578	Rondolândia : Aripuanã 
// 5107743	Santa Cruz do Xingu : São José do Xingu
// 5107768	Santa Rita do Trivelato : Nova Mutum
// 5107792	Santo Antônio do Leste : Novo São Joaquim
// 5107883	Serra Nova Dourada : Alto Boa Vista e São Félix do Araguaia
// 5108352	Vale de São Domingos : Pontes e Lacerda
// 5204854	Campo Limpo de Goiás : Anápolis 
// 5208152	Gameleira de Goiás : Silvânia
// 5210158	Ipiranga de Goiás : Ceres
// 5212253	Lagoa Santa : Itajá



save "output\municipalities_panel.dta", replace








