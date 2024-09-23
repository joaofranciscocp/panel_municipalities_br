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

//cd "(...)\panel_municipalities_br"

*-------------------------------------------------------------------------------
* IMPORT DATA AND BUILD PANEL
*-------------------------------------------------------------------------------

use "output\municipalities_1997.dta", clear

foreach year in 2003 2004 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 {
    merge m:m munic_code using "output\municipalities_`year'.dta"
	
	drop _merge
}

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

// To the best of my knowledge,
// no municipalities were created or ceased to exist between 1998 and 2000

gen d_1998 = d_1997
gen d_1999 = d_1998
gen d_2000 = d_1999

order d_1998 d_1999 d_2000, after(d_1997)

order munic_code, after(uf_code)



// If a municipality did not exist in year t,
// create previous_mun_t which says to which other municipality it belonged in that year.
// Information collected by hand on Google (municipality creation laws).
// If there is more than one mother municipality, I assign previous_mun_t to the one
// from which the largest part of the population was taken, comparing population before and after new mun's creation.
// I take this information from IBGE's population estimate (https://github.com/femdias/Pop_municipal)

forvalues year = 1997/2022 {
	gen previous_mun_`year' = ""
	
	replace previous_mun_`year' = munic_code if d_`year' != .
	
	replace previous_mun_`year' = "1506807" if d_`year' == . & munic_code == "1504752" // 1504752 Mojuí dos Campos : Santarém 
	replace previous_mun_`year' = "2208007" if d_`year' == . & munic_code == "2200954" // 2200954 Aroeiras do Itaim : Picos
	replace previous_mun_`year' = "2211001" if d_`year' == . & munic_code == "2206720" // 2206720 Nazária : Teresina 
	replace previous_mun_`year' = "2211001" if d_`year' == . & munic_code == "2207793" // 2207793 Pau D'Arco do Piauí : Altos
	replace previous_mun_`year' = "2414704" if d_`year' == . & munic_code == "2406155" // 2406155 Jundiá : Várzea
	replace previous_mun_`year' = "2708600" if d_`year' == . & munic_code == "2703759" // 2703759 Jequiá da Praia : São Miguel dos Campos e Coruripe
	replace previous_mun_`year' = "2413508" if d_`year' == . & munic_code == "2903276" // 2903276 Barrocas : Serrinha
	replace previous_mun_`year' = "2903201" if d_`year' == . & munic_code == "2919553" // 2919553 Luís Eduardo Magalhães : Barreiras
	replace previous_mun_`year' = "3201506" if d_`year' == . & munic_code == "3202256" // 3202256 Governador Lindenberg : Colatina 
	replace previous_mun_`year' = "3303500" if d_`year' == . & munic_code == "3302858" // 3302858 Mesquita : Nova Iguaçu
	replace previous_mun_`year' = "4209409" if d_`year' == . & munic_code == "4212650" // 4212650 Pescaria Brava : Laguna
	replace previous_mun_`year' = "4207007" if d_`year' == . & munic_code == "4220000" // 4220000 Balneário Rincão : Içara
	replace previous_mun_`year' = "4301602" if d_`year' == . & munic_code == "4300034" // 4300034 Aceguá : Bagé 
	replace previous_mun_`year' = "4304705" if d_`year' == . & munic_code == "4300471" // 4300471 Almirante Tamandaré do Sul : Carazinho 
	replace previous_mun_`year' = "4314407" if d_`year' == . & munic_code == "4301073" // 4301073 Arroio do Padre : Pelotas
	replace previous_mun_`year' = "4306106" if d_`year' == . & munic_code == "4302220" // 4302220 Boa Vista do Cadeado : Cruz Alta, Ijuí e Augusto Pestana
	replace previous_mun_`year' = "4306106" if d_`year' == . & munic_code == "4302238" // 4302238 Boa Vista do Incra : Cruz Alta
	replace previous_mun_`year' = "4310207" if d_`year' == . & munic_code == "4302584" // 4302584 Bozano : Ijuí 
	replace previous_mun_`year' = "4311403" if d_`year' == . & munic_code == "4304614" // 4304614 Canudos do Vale : Lajeado
	replace previous_mun_`year' = "4311304" if d_`year' == . & munic_code == "4304622" // 4304622 Capão Bonito do Sul : Lagoa Vermelha
	replace previous_mun_`year' = "4317400" if d_`year' == . & munic_code == "4304655" // 4304655 Capão do Cipó : Santiago
	replace previous_mun_`year' = "4313003" if d_`year' == . & munic_code == "4305835" // 4305835 Coqueiro Baixo : Nova Bréscia e Relvado
	replace previous_mun_`year' = "4308607" if d_`year' == . & munic_code == "4305934" // 4305934 Coronel Pilar : Garibaldi 
	replace previous_mun_`year' = "4303806" if d_`year' == . & munic_code == "4306130" // 4306130 Cruzaltense : Campinas do Sul
	replace previous_mun_`year' = "4311403" if d_`year' == . & munic_code == "4308433" // 4308433 Forquetinha : Lajeado
	replace previous_mun_`year' = "4321436" if d_`year' == . & munic_code == "4310652" // 4310652 Itati : Terra de Areia
	replace previous_mun_`year' = "4316451" if d_`year' == . & munic_code == "4310876" // 4310876 Jacuizinho : Salto do Jacuí
	replace previous_mun_`year' = "4320701" if d_`year' == . & munic_code == "4311239" // 4311239 Lagoa Bonita do Sul : Sobradinho 
	replace previous_mun_`year' = "4303301" if d_`year' == . & munic_code == "4312179" // 4312179 Mato Queimado : Caibaté 
	replace previous_mun_`year' = "4305801" if d_`year' == . & munic_code == "4313466" // 4313466 Novo Xingu : Constantina
	replace previous_mun_`year' = "4307005" if d_`year' == . & munic_code == "4314134" // 4314134 Paulo Bento : Erechim 
	replace previous_mun_`year' = "4307104" if d_`year' == . & munic_code == "4314175" // 4314175 Pedras Altas : Herval e Pinheiro Machado
	replace previous_mun_`year' = "4307401" if d_`year' == . & munic_code == "4314464" // 4314464 Pinhal da Serra : Esmeralda
	replace previous_mun_`year' = "4302105" if d_`year' == . & munic_code == "4314548" // 4314548 Pinto Bandeira : Bento Gonçalves
	replace previous_mun_`year' = "4307005" if d_`year' == . & munic_code == "4315313" // 4315313 Quatro Irmãos : Erechim e Jacutinga
	replace previous_mun_`year' = "4318903" if d_`year' == . & munic_code == "4315958" // 4315958 Rolador : São Luiz Gonzaga
	replace previous_mun_`year' = "4320909" if d_`year' == . & munic_code == "4316733" // 4316733 Santa Cecília do Sul : Tapejara 
	replace previous_mun_`year' = "4318309" if d_`year' == . & munic_code == "4316972" // 4316972 Santa Margarida do Sul : São Gabriel
	replace previous_mun_`year' = "4316501" if d_`year' == . & munic_code == "4318614" // 4318614 São José do Sul : Montenegro, Salvador do Sul e Maratá
	replace previous_mun_`year' = "4313706" if d_`year' == . & munic_code == "4319364" // 4319364 São Pedro das Missões : Palmeira das Missões
	replace previous_mun_`year' = "4323200" if d_`year' == . & munic_code == "4321469" // 4321469 Tio Hugo : Victor Graeff
	replace previous_mun_`year' = "4321451" if d_`year' == . & munic_code == "4323770" // 4323770 Westfalia : Teutônia e Imigrante
	replace previous_mun_`year' = "5002605" if d_`year' == . & munic_code == "5003900" // 5003900 Figueirão : Camapuã e Costa Rica
	replace previous_mun_`year' = "5003256" if d_`year' == . & munic_code == "5006275" // 5006275 Paraíso das Águas : Água Clara, Costa Rica e Chapadão do Sul
	replace previous_mun_`year' = "5100359" if d_`year' == . & munic_code == "5101852" // 5101852 Bom Jesus do Araguaia : Ribeirão Cascalheira e Alto Boa Vista
	replace previous_mun_`year' = "5101407" if d_`year' == . & munic_code == "5103254" // 5103254 Colniza : Aripuanã
	replace previous_mun_`year' = "5106752" if d_`year' == . & munic_code == "5103361" // 5103361 Conquista D'Oeste : Pontes e Lacerda
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5103437" // 5103437 Curvelândia : Cáceres, Mirassol d`Oeste e Lambari d`Oeste
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5104526" // 5104526 Ipiranga do Norte : Tapurah
	replace previous_mun_`year' = "5108006" if d_`year' == . & munic_code == "5104542" // 5104542 Itanhangá : Tapurah 
	replace previous_mun_`year' = "5100201" if d_`year' == . & munic_code == "5106174" // 5106174 Nova Nazaré : Água Boa
	replace previous_mun_`year' = "5104559" if d_`year' == . & munic_code == "5106190" // 5106190 Nova Santa Helena : Itaúba e Cláudia
	replace previous_mun_`year' = "5107859" if d_`year' == . & munic_code == "5106315" // 5106315 Novo Santo Antônio : São Félix do Araguaia
	replace previous_mun_`year' = "5101407" if d_`year' == . & munic_code == "5107578" // 5107578 Rondolândia : Aripuanã 
	replace previous_mun_`year' = "5107354" if d_`year' == . & munic_code == "5107743" // 5107743 Santa Cruz do Xingu : São José do Xingu
	replace previous_mun_`year' = "5106224" if d_`year' == . & munic_code == "5107768" // 5107768 Santa Rita do Trivelato : Nova Mutum
	replace previous_mun_`year' = "5106281" if d_`year' == . & munic_code == "5107792" // 5107792 Santo Antônio do Leste : Novo São Joaquim
	replace previous_mun_`year' = "5100359" if d_`year' == . & munic_code == "5107883" // 5107883 Serra Nova Dourada : Alto Boa Vista e São Félix do Araguaia
	replace previous_mun_`year' = "5106752" if d_`year' == . & munic_code == "5108352" // 5108352 Vale de São Domingos : Pontes e Lacerda
	replace previous_mun_`year' = "5201108" if d_`year' == . & munic_code == "5204854" // 5204854 Campo Limpo de Goiás : Anápolis 
	replace previous_mun_`year' = "5220603" if d_`year' == . & munic_code == "5208152" // 5208152 Gameleira de Goiás : Silvânia
	replace previous_mun_`year' = "5205406" if d_`year' == . & munic_code == "5210158" // 5210158 Ipiranga de Goiás : Ceres
	replace previous_mun_`year' = "5210802" if d_`year' == . & munic_code == "5212253" // 5212253 Lagoa Santa : Itajá
}


// Create UF abbreviation variable

gen uf_abb = ""

replace uf_abb = "RO" if uf_code == "11"
replace uf_abb = "AC" if uf_code == "12"
replace uf_abb = "AM" if uf_code == "13"
replace uf_abb = "RR" if uf_code == "14"
replace uf_abb = "PA" if uf_code == "15"
replace uf_abb = "AP" if uf_code == "16"
replace uf_abb = "TO" if uf_code == "17"
replace uf_abb = "MA" if uf_code == "21"
replace uf_abb = "PI" if uf_code == "22"
replace uf_abb = "CE" if uf_code == "23"
replace uf_abb = "RN" if uf_code == "24"
replace uf_abb = "PB" if uf_code == "25"
replace uf_abb = "PE" if uf_code == "26"
replace uf_abb = "AL" if uf_code == "27"
replace uf_abb = "SE" if uf_code == "28"
replace uf_abb = "BA" if uf_code == "29"
replace uf_abb = "MG" if uf_code == "31"
replace uf_abb = "ES" if uf_code == "32"
replace uf_abb = "RJ" if uf_code == "33"
replace uf_abb = "SP" if uf_code == "35"
replace uf_abb = "PR" if uf_code == "41"
replace uf_abb = "SC" if uf_code == "42"
replace uf_abb = "RS" if uf_code == "43"
replace uf_abb = "MS" if uf_code == "50"
replace uf_abb = "MT" if uf_code == "51"
replace uf_abb = "GO" if uf_code == "52"
replace uf_abb = "DF" if uf_code == "53"

order uf_abb, before(uf_code)


// Save final panel in .dta
save "output\municipalities_panel.dta", replace

// and .csv (Stata should really include an encoding option for "export". Lesson: use R)
export delimited using "output\municipalities_panel_pre.csv", replace
unicode convertfile "output/municipalities_panel_pre.csv" "output/municipalities_panel.csv", dstencoding(latin1) replace
erase "output\municipalities_panel_pre.csv"

