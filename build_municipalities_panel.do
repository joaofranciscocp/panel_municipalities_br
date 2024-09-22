*-------------------------------------------------------------------------------
* ACTION: BUILD PANEL OF EXISTENT MUNICIPALITIES PER YEAR

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

// d_2005 = 1 iff mun existed in 2006 
//(municipalities are only created one year after municipal election years; no municipalities ceased to exist in 2006)
gen d_2005 = d_2006
order d_2005, after(d_2004)

// d_2002 = 1 IF (not iff) mun existed in 2003 
// d_2001 = 1 IF (not iff) mun existed in 2002 
// (municipalities are only created one year after municipal election years)
gen d_2002 = 1 if d_2003 == 1
gen d_2001 = 1 if d_2002 == 1
order d_2001 d_2002, before(d_2003)

// Check:
// br if d_2001 == . | d_2002 == .
// Pinto Bandeira (4314548) existed in 2001 and 2002

replace d_2002 = 1 if munic_code == "4314548"
replace d_2001 = 1 if munic_code == "4314548"

order munic_code, after(uf_code)



// If a municipality did not exist in year t,
// create previous_mun_t which says to which other municipality it belonged in that year.
// Information collected by hand on Google (municipality creation laws).
// If there is more than one mother municipality, I assign previous_mun_t to the one
// from which the largest part of the population was taken, comparing population before and after new mun's creation.
// I take this information from IBGE's population estimate (https://github.com/femdias/Pop_municipal)

foreach year in 1997 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 {
	gen previous_mun_`year' = ""
	
	replace previous_mun_`year' = munic_code if d_`year' != .
	
	replace previous_mun_`year' = "1506807" if d_`year' == . & munic_code == "1504752" // 1504752	Mojuí dos Campos : Santarém 
	replace previous_mun_`year' = "2208007" if d_`year' == . & munic_code == "2200954" // 2200954	Aroeiras do Itaim : Picos
	replace previous_mun_`year' = "2211001" if d_`year' == . & munic_code == "2206720" // 2206720	Nazária : Teresina 
	replace previous_mun_`year' = "2211001" if d_`year' == . & munic_code == "2207793" // 2207793	Pau D'Arco do Piauí : Altos
	replace previous_mun_`year' = "2414704" if d_`year' == . & munic_code == "2406155" // 2406155	Jundiá : Várzea
	replace previous_mun_`year' = "2708600" if d_`year' == . & munic_code == "2703759" // 2703759	Jequiá da Praia : São Miguel dos Campos e Coruripe
	replace previous_mun_`year' = "2413508" if d_`year' == . & munic_code == "2903276" // 2903276	Barrocas : Serrinha
	replace previous_mun_`year' = "2903201" if d_`year' == . & munic_code == "2919553" // 2919553	Luís Eduardo Magalhães : Barreiras
	replace previous_mun_`year' = "3201506" if d_`year' == . & munic_code == "3202256" // 3202256	Governador Lindenberg : Colatina 
	replace previous_mun_`year' = "3303500" if d_`year' == . & munic_code == "3302858" // 3302858	Mesquita : Nova Iguaçu
	replace previous_mun_`year' = "4209409" if d_`year' == . & munic_code == "4212650" // 4212650	Pescaria Brava : Laguna
	replace previous_mun_`year' = "4207007" if d_`year' == . & munic_code == "4220000" // 4220000	Balneário Rincão : Içara
	replace previous_mun_`year' = "4301602" if d_`year' == . & munic_code == "4300034" // 4300034	Aceguá : Bagé 
	replace previous_mun_`year' = "4304705" if d_`year' == . & munic_code == "4300471" // 4300471	Almirante Tamandaré do Sul : Carazinho 
	replace previous_mun_`year' = "4314407" if d_`year' == . & munic_code == "4301073" // 4301073	Arroio do Padre : Pelotas
	replace previous_mun_`year' = "4306106" if d_`year' == . & munic_code == "4302220" // 4302220	Boa Vista do Cadeado : Cruz Alta, Ijuí e Augusto Pestana
	replace previous_mun_`year' = "4306106" if d_`year' == . & munic_code == "4302238" // 4302238	Boa Vista do Incra : Cruz Alta
	replace previous_mun_`year' = "4310207" if d_`year' == . & munic_code == "4302584" // 4302584	Bozano : Ijuí 
	replace previous_mun_`year' = "4311403" if d_`year' == . & munic_code == "4304614" // 4304614	Canudos do Vale : Lajeado
	replace previous_mun_`year' = "4311304" if d_`year' == . & munic_code == "4304622" // 4304622	Capão Bonito do Sul : Lagoa Vermelha
	replace previous_mun_`year' = "4317400" if d_`year' == . & munic_code == "4304655" // 4304655	Capão do Cipó : Santiago
	replace previous_mun_`year' = "4313003" if d_`year' == . & munic_code == "4305835" // 4305835	Coqueiro Baixo : Nova Bréscia e Relvado
	replace previous_mun_`year' = "4308607" if d_`year' == . & munic_code == "4305934" // 4305934	Coronel Pilar : Garibaldi 
	replace previous_mun_`year' = "4303806" if d_`year' == . & munic_code == "4306130" // 4306130	Cruzaltense : Campinas do Sul
	replace previous_mun_`year' = "4311403" if d_`year' == . & munic_code == "4308433" // 4308433	Forquetinha : Lajeado
	replace previous_mun_`year' = "4321436" if d_`year' == . & munic_code == "4310652" // 4310652	Itati : Terra de Areia
	replace previous_mun_`year' = "4316451" if d_`year' == . & munic_code == "4310876" // 4310876	Jacuizinho : Salto do Jacuí
	replace previous_mun_`year' = "4320701" if d_`year' == . & munic_code == "4311239" // 4311239	Lagoa Bonita do Sul : Sobradinho 
	replace previous_mun_`year' = "4303301" if d_`year' == . & munic_code == "4312179" // 4312179	Mato Queimado : Caibaté 
	replace previous_mun_`year' = "4305801" if d_`year' == . & munic_code == "4313466" // 4313466	Novo Xingu : Constantina
	replace previous_mun_`year' = "4307005" if d_`year' == . & munic_code == "4314134" // 4314134	Paulo Bento : Erechim 
	replace previous_mun_`year' = "4307104" if d_`year' == . & munic_code == "4314175" // 4314175	Pedras Altas : Herval e Pinheiro Machado
	replace previous_mun_`year' = "4307401" if d_`year' == . & munic_code == "4314464" // 4314464	Pinhal da Serra : Esmeralda
	replace previous_mun_`year' = "4302105" if d_`year' == . & munic_code == "4314548" // 4314548	Pinto Bandeira : Bento Gonçalves
	replace previous_mun_`year' = "4307005" if d_`year' == . & munic_code == "4315313" // 4315313	Quatro Irmãos : Erechim e Jacutinga
	replace previous_mun_`year' = "4318903" if d_`year' == . & munic_code == "4315958" // 4315958	Rolador : São Luiz Gonzaga
	replace previous_mun_`year' = "4320909" if d_`year' == . & munic_code == "4316733" // 4316733	Santa Cecília do Sul : Tapejara 
	replace previous_mun_`year' = "4318309" if d_`year' == . & munic_code == "4316972" // 4316972	Santa Margarida do Sul : São Gabriel
	replace previous_mun_`year' = "4316501" if d_`year' == . & munic_code == "4318614" // 4318614	São José do Sul : Montenegro, Salvador do Sul e Maratá
	replace previous_mun_`year' = "4313706" if d_`year' == . & munic_code == "4319364" // 4319364	São Pedro das Missões : Palmeira das Missões
	replace previous_mun_`year' = "4323200" if d_`year' == . & munic_code == "4321469" // 4321469	Tio Hugo : Victor Graeff
	replace previous_mun_`year' = "4321451" if d_`year' == . & munic_code == "4323770" // 4323770	Westfalia : Teutônia e Imigrante
	replace previous_mun_`year' = "5002605" if d_`year' == . & munic_code == "5003900" // 5003900	Figueirão : Camapuã e Costa Rica
	replace previous_mun_`year' = "5003256" if d_`year' == . & munic_code == "5006275" // 5006275	Paraíso das Águas : Água Clara, Costa Rica e Chapadão do Sul
	replace previous_mun_`year' = "5100359" if d_`year' == . & munic_code == "5101852" // 5101852	Bom Jesus do Araguaia : Ribeirão Cascalheira e Alto Boa Vista
	replace previous_mun_`year' = "5101407" if d_`year' == . & munic_code == "5103254" // 5103254	Colniza : Aripuanã
	replace previous_mun_`year' = "5106752" if d_`year' == . & munic_code == "5103361" // 5103361	Conquista D'Oeste : Pontes e Lacerda
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5103437" // 5103437	Curvelândia : Cáceres, Mirassol d`Oeste e Lambari d`Oeste
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5104526" // 5104526	Ipiranga do Norte : Tapurah
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5104542" // 5104542	Itanhangá : Tapurah 
	replace previous_mun_`year' = "5100201" if d_`year' == . & munic_code == "5106174" // 5106174	Nova Nazaré : Água Boa
	replace previous_mun_`year' = "5104559" if d_`year' == . & munic_code == "5106190" // 5106190	Nova Santa Helena : Itaúba e Cláudia
	replace previous_mun_`year' = "5107859" if d_`year' == . & munic_code == "5106315" // 5106315	Novo Santo Antônio : São Félix do Araguaia
	replace previous_mun_`year' = "5101407" if d_`year' == . & munic_code == "5107578" // 5107578	Rondolândia : Aripuanã 
	replace previous_mun_`year' = "5107354" if d_`year' == . & munic_code == "5107743" // 5107743	Santa Cruz do Xingu : São José do Xingu
	replace previous_mun_`year' = "5106224" if d_`year' == . & munic_code == "5107768" // 5107768	Santa Rita do Trivelato : Nova Mutum
	replace previous_mun_`year' = "5106281" if d_`year' == . & munic_code == "5107792" // 5107792	Santo Antônio do Leste : Novo São Joaquim
	replace previous_mun_`year' = "5100359" if d_`year' == . & munic_code == "5107883" // 5107883	Serra Nova Dourada : Alto Boa Vista e São Félix do Araguaia
	replace previous_mun_`year' = "5106752" if d_`year' == . & munic_code == "5108352" // 5108352	Vale de São Domingos : Pontes e Lacerda
	replace previous_mun_`year' = "5201108" if d_`year' == . & munic_code == "5204854" // 5204854	Campo Limpo de Goiás : Anápolis 
	replace previous_mun_`year' = "5220603" if d_`year' == . & munic_code == "5208152" // 5208152	Gameleira de Goiás : Silvânia
	replace previous_mun_`year' = "5205406" if d_`year' == . & munic_code == "5210158" // 5210158	Ipiranga de Goiás : Ceres
	replace previous_mun_`year' = "5210802" if d_`year' == . & munic_code == "5212253" // 5212253	Lagoa Santa : Itajá
}

save "output\municipalities_panel.dta", replace








