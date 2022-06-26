#!/bin/bash
####################################################################
# By Nave 🛸																													
# www.naveproject.tk																												
# For any commercial permission please contact: bruno@brunofilho.tk
####################################################################

green="\033[01;32m"
pink="\033[01;35m"
azul="\033[01;36m"
yellow="\033[01;33m"
blue="\033[01;34m"
nave_dir_arq="/Users/`users`/Desktop/NaveCommand"
local_version="1.1.1"

start()
{
		clear
		printf '\033[8;15;67t'
		clear
	    echo -e  ${yellow}"*************************************"
		echo -e  ${blue}" # Nave Command 🛸 | www.nave.tk            "
		echo -e   ${green} "# Menu inicial | $local_version" 
		echo -e   ${yellow}"*************************************"
		echo -e ""
		echo -e  ${azul}"@ Ei `Users`, o que você quer fazer ?"
		echo -e ""
		echo -e   ${green}"# 1)  NaveCommand 🛠 "
		echo -e   ${blue}"# 2)  Criar pendrive bootavel do macOS 💾 "
		echo -e  ${pink} ""
		
	read  -p "# " nave_option		
	
		if [[ $nave_option == "1" ]]; then
		import_macOS
		search
		fi
	
		if [[ $nave_option == "2" ]]; then
		welcome_USB
		search_USB
		fi
	
}

search()
{
	clear
	printf '\033[8;23;66t'
	chmod +x /tmp/utilitarios/Install.sh
	source /tmp/utilitarios/Install.sh	
	clear
	echo -e "###########################################"
	echo -e  ${blue}"# Nave Command 🛸 | www.nave.tk            "
    echo -e  ${green}"# Versão mais recente: $versao              "
    echo -e  ${pink}"# Versão que está rodando agora: $local_version   "
    echo -e  ${green}"###########################################"
	echo -e ""
	echo -e   ${yellow}"Seja bem-vindo `Users` "
	echo -e   ${green}"Certifique que vc está conectado(a) a internet 🚥"
	echo -e   ${blue}""
	echo -e    "@ Quais desses sistemas vc quer baixar?"
	echo -e    "@ Informe o numero indicado."
	echo -e ""
	# Sistemas Disponíveis
	echo -e  ${green}  "// 1   10.13.6 | Install macOS High Sierra"
	echo -e  ${green}  "// 2   10.14.6 | Install macOS Mojave"
	echo -e  ${green}  "// 3   10.15.7 | Install macOS Catalina"
	echo -e  ${azul}  "// 4 $bigsur_versao_instalador  | Install macOS Big Sur"
	echo -e  ${azul}  "// 5 $monterey_versao_instalador    | Install macOS Monterey"
	echo -e  ${pink}  "// 6 $ventura_versao_instalador     | Install macOS Ventura beta"
	echo -e ""
	# Atualizar o Nave
	echo -e  ${yellow} "// N - Atualizar o NaveCommand 🛸 (versão mais recente: ${versao})"
	echo -e   ${pink}""
	echo -e   ${pink}""
	
	read  -p " # " macos_version
	
	if [[ $macos_version == "1" ]]; then
		versao_instalador="highsierra"
	fi
	
	if [[ $macos_version == "2" ]]; then
		versao_instalador="mojave"
	fi
	
	if [[ $macos_version == "3" ]]; then
		versao_instalador="catalina"
	fi
	
	if [[ $macos_version == "4" ]]; then
		versao_instalador="bigsur"
	fi
	
	if [[ $macos_version == "5" ]]; then
		versao_instalador="monterey"
	fi
	
	if [[ $macos_version == "6" ]]; then
		versao_instalador="ventura"
	fi
	
	if [[ $versao_instalador == "highsierra" ]]; then
		link_instalador="06/50/041-91758-A_M8T44LH2AW/b5r4og05fhbgatve4agwy4kgkzv07mdid9"
	fi
	
	if [[ $versao_instalador == "mojave" ]]; then
		link_instalador="17/32/061-26589-A_8GJTCGY9PC/25fhcu905eta7wau7aoafu8rvdm7k1j4el"
	fi
	
	if [[ $versao_instalador == "catalina" ]]; then
		link_instalador="61/24/001-57224/0o1xetys5n505gocjsil5qo0p4kg939elb"
	fi
	
	link_instalador="${versao_instalador}_link_instalador"
	nome_instalador="${versao_instalador}_nome_instalador"
	versao_instalador="${versao_instalador}_versao_instalador"
	
	if [[ $macos_version == [1-3] ]]; then
		Download_Instalador_1
		Preparar_Instalador_1
		USBmacOS
	fi
	
	if [[ $macos_version == [4-6] ]]; then
		Download_Instalador_2
		Preparar_Instalador_2
		USBmacOS
	fi
	
	if	[ "${macos_version}" == "N" ] || [ "${macos_version}" == "n" ]; then
		update_navecommd
	fi
	
}

update_navecommd()
{
	printf '\033[8;22;84t'
	clear
	echo -e  ${blue}"Atualizando para a ${versao}..."
	rm -rf /usr/local/bin/nave
	mkdir /usr/local/bin
	curl -o /usr/local/bin/nave https://github.com/hibrunofilho/Nave-Command/raw/main/nave && chmod +x /usr/local/bin/nave && nave
	echo -e ""
}

import_macOS(){
	clear
	echo -e ${azul}"🛸 Baixando o catálogo de sistemas..." 
	for catalog in $(curl -L -s https://swscan.apple.com/content/catalogs/others/index-10.16seed-10.16-10.15-10.14-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog | grep "InstallAssistant.pkg<" | sed 's/.*<string>//' | sed 's/\/InstallAssistant.*//'); do 
	    plist=$(curl -L -s "$catalog/Info.plist")
	    versao="$(echo -e "$plist" | grep -A1 OSVersion | grep string | sed 's/.*<string>//' | sed 's/<\/string>//')"
	    seed="$(echo -e "$plist" | grep -A1 IsSeed | grep string | sed 's/.*<string>//' | sed 's/<\/string>//')"
		
	    if [[ "$versao" == 11* ]]; then 
	        if [[ "$seed" == "NO" ]]; then 
	            bigsur_pre_url="$bigsur_pre_url
	$catalog/InstallAssistant.pkg"
				bigsur_pre_versao="$bigsur_pre_versao
	$versao"
	        fi
	    fi

	    if [[ "$versao" == 12* ]]; then 
	        if [[ "$seed" == "NO" ]]; then 
	            monterey_pre_url="$monterey_pre_url
	$catalog/InstallAssistant.pkg"
				monterey_pre_versao="$monterey_pre_versao
	$versao"

	        fi
	    fi
	
	    if [[ "$versao" == 13* ]]; then 
	        if [[ "$seed" == "NO" ]]; then 
	            ventura_pre_url="$ventura_pre_url
	$catalog/InstallAssistant.pkg"
				ventura_pre_versao="$ventura_pre_versao
	$versao"
	    	else
	    	    ventura_beta_pre_url="$ventura_beta_pre_url
	$catalog/InstallAssistant.pkg"
				ventura_beta_pre_versao="$ventura_beta_pre_versao
	$versao"
	        fi
	    fi
	done
	
	bigsur_versao_instalador="$(echo -e "$bigsur_pre_versao" | tail -1)"
	monterey_versao_instalador="$(echo -e "$monterey_pre_versao" | tail -1)"
	bigsur_link_instalador="$(echo -e "$bigsur_pre_url" | tail -1)"
	monterey_link_instalador="$(echo -e "$monterey_pre_url" | tail -1)"
	ventura_link_instalador="$(echo -e "$ventura_beta_pre_url" | tail -1)"
	ventura_versao_instalador="$(echo -e "$ventura_beta_pre_versao" | tail -1)"
	#Esse aqui só em setembro!
	#ventura_link_instalador="$(echo -e "$ventura_pre_url" | tail -1)"
	#ventura_versao_instalador="$(echo -e "$ventura_pre_versao" | tail -1)"
	rm -rf /tmp/utilitarios/Install.sh
	rm -rf /tmp/navecommand
	mkdir /tmp/utilitarios/
	mkdir /tmp/navecommand
	curl -L -s -o /tmp/utilitarios/Install.sh https://raw.githubusercontent.com/hibrunofilho/Nave-Command/main/Install.txt
	
}

Download_Instalador_1()
{
		printf '\033[8;24;93t'
		####################################################################################################################
		# Fazer o Download dos instaladores: macOS High Sierra, macOS Mojave e macOS Catalina
		clear
		echo -e  ${green}"🛸 Baixando o InstallAssistantAuto.pkg"
		echo -e  ${yellow}""
		curl -# -L -o /tmp/navecommand/InstallAssistantAuto.pkg http://swcdn.apple.com/content/downloads/${link_instalador}/InstallAssistantAuto.pkg
		clear
		echo -e  ${green}"🛸 Baixando o AppleDiagnostics.chunklist"
		echo -e  ${yellow}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.chunklist http://swcdn.apple.com/content/downloads/${link_instalador}/AppleDiagnostics.chunklist
		clear
		echo -e  ${green}"🛸 Baixando o AppleDiagnostics.dmg"
		echo -e  ${yellow}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.dmg http://swcdn.apple.com/content/downloads/${link_instalador}/AppleDiagnostics.dmg
		clear
		echo -e  ${green}"🛸 Baixando o BaseSystem.chunklist"
		echo -e  ${yellow}""
		curl -# -L -o /tmp/navecommand/BaseSystem.chunklist http://swcdn.apple.com/content/downloads/${link_instalador}/BaseSystem.chunklist
		clear
		echo -e  ${green}"🛸 Baixando o BaseSystem.dmg"
		echo -e  ${yellow}""
		curl -L -o /tmp/navecommand/BaseSystem.dmg http://swcdn.apple.com/content/downloads/${link_instalador}/BaseSystem.dmg
		clear
		echo -e  ${green}"🛸 Baixando o InstallESD.dmg"
		echo -e  ${yellow}""
		curl -L -o /tmp/navecommand/InstallESD.dmg http://swcdn.apple.com/content/downloads/${link_instalador}/InstallESDDmg.pkg
		clear
		echo -e   "Ufa! arquivos de instalação ja baixados"
		######################################################################################################################
}

Preparar_Instalador_1()
{
		#####################################################################################################################
		# Compilar os instaladores: macOS High Sierra, macOS Mojave e macOS Catalina
		clear
		echo -e "Montando o instalador .app"
		mkdir ~/Desktop/NaveCommand
		cd /tmp/navecommand/
		pkgutil --expand-full InstallAssistantAuto.pkg /tmp/pkgutil
		mv /tmp/navecommand/AppleDiagnostics.chunklist /tmp/pkgutil/Payload/"${!nome_instalador}".app/Contents/SharedSupport/
		mv /tmp/navecommand/AppleDiagnostics.dmg /tmp/pkgutil/Payload/"${!nome_instalador}".app/Contents/SharedSupport/
		mv /tmp/navecommand/BaseSystem.chunklist /tmp/pkgutil/Payload/"${!nome_instalador}".app/Contents/SharedSupport/
		mv /tmp/navecommand/BaseSystem.dmg /tmp/pkgutil/Payload/"${!nome_instalador}".app/Contents/SharedSupport/
		mv /tmp/navecommand/InstallESD.dmg /tmp/pkgutil/Payload/"${!nome_instalador}".app/Contents/SharedSupport/InstallESD.dmg
		mv /tmp/pkgutil/Payload/"${!nome_instalador}".app "${nave_dir_arq}"
		clear
		echo -e   "Instalador compilado ✅"
		read -t 8
		
}

Download_Instalador_2()
{
	printf '\033[8;24;93t'
	##########################################################################################################################
	# Fazer o Download dos instaladores: macOS Monterey e macOS Big Sur
	clear
	echo -e  ${green}"🛸 Baixando o InstallAssistant.pkg"
	echo -e ${yellow} ""
	curl -L -o /tmp/navecommand/InstallAssistant.pkg ${!link_instalador}
	##########################################################################################################################
}

Preparar_Instalador_2()
{
	clear
	##########################################################################################################################
	#Compilar os Instaladores: macOS Monterey e macOS Big Sur
	echo -e  ${blue}"Compilando o Instalador..."
	cd /tmp/navecommand
	mkdir ~/Desktop/NaveCommand
	sudo /usr/sbin/installer -pkg "/tmp/navecommand/InstallAssistant.pkg" -target "/"
	mv /Applications/Install* "${nave_dir_arq}"
	clear
	echo -e "Instalador compilado ✅"
	read -t 8
	##########################################################################################################################
}


USBmacOS_nomedopendrive()
{
	###########################################################
	# Informar o nome do pendrive
	clear
	echo -e  ${green}"Digite o nome do seu pendrive (exatamente)"
	echo -e  ${azul} ""
	read  -p " # " disco_usb
	###########################################################
	
}

USBmacOS()
{
	clear
	echo -e  ${green}"Pronto! Seu instalador já foi criado, deseja criar um pendrive bootavel com esse sistema?"
	echo -e ""
	echo -e  ${green}"S) Sim"
	echo -e  ${pink}"N) Não"
	echo -e ""
	
	read  -p " # " USB
	
	if	[ "${USB}" == "S" ] || [ "${USB}" == "s" ]; then
		welcome_USB
		search_USB
	fi
	
}

welcome_USB()
{
	mkdir ~/Desktop/NaveCommand
	printf '\033[8;20;61t'
	clear
	echo -e   ${azul}"******************************************************"
	echo -e   ${azul} ""
	echo -e   ${azul} "Seja bem-vindo (`users`) ao USBmacOS"
	echo -e   ${azul} ""
	echo -e   ${azul}"******************************************************"
	echo -e   ${yellow}"Mova o applicativo de instalação para:"
	echo -e   ${green}"${nave_dir_arq}"
	echo -e   ${azul} ""
}		

search_USB()
{
	
	echo -e "/ Qual sistema vc vai utilizar?"
	echo -e "/ Informe o numero."
	echo -e "/     1 - Monterey"
	echo -e "/     2 - Big Sur"
	echo -e "/     3 - Catalina"
	echo -e "/     4 - Mojave"
	echo -e "/     5 - High Sierra"
	echo -e "/     6 - Ventura"
	
	
	read  -p " / " USBmacos_version
	
	
	if [[ $USBmacos_version == "1" ]]; then
		USBmacOS_nomedopendrive
		Monterey
	fi
	
	if [[ $USBmacos_version == "2" ]]; then
		USBmacOS_nomedopendrive
		Big_Sur
	fi
	
	if [[ $USBmacos_version == "3" ]]; then
		USBmacOS_nomedopendrive
		Catalina
	fi
	
	if [[ $USBmacos_version == "4" ]]; then
		USBmacOS_nomedopendrive
		Mojave
	fi
	
	if [[ $USBmacos_version == "5" ]]; then
		USBmacOS_nomedopendrive
		High_Sierra
	fi
	
	if [[ $USBmacos_version == "6" ]]; then
		USBmacOS_nomedopendrive
		Ventura
	fi
}

Ventura()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ 13\ beta.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}

Monterey()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}


Big_Sur()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}

Catalina()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}

Mojave()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}

High_Sierra()
{
	clear
	echo -e  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo -e "Pendrive Feito ✅ "
	read -t 8
	clear
}

finished()
{
	#######################################################################################################
	# Finalização
	printf '\033[8;50;100t'
	clear
	rm -rf /tmp/navecommand/
	echo -e   ${azul}"Obrigado por usar o Nave Command 🛸"
	echo -e   ${green}"Download concluído! Espero que tenha gostado dessa experiência totalmente brasileira 🇧🇷"
	echo -e   ${green}"Contato caso queira dar sugestões para este projeto = dicas@nave.tk 🛸 🛠 "
	echo -e   ${yellow}
	echo -e "                              _   _"                                             
	echo -e "                             | \ | |"                                            
	echo -e "                             |  \| | __ ___    _____"                            
	echo -e "                             | .   |/ _  \ \ / / __/ "                            
	echo -e "                             | |\  | (_) |\ V /  __/"                           
	echo -e "                             |_| \_|\__,_| \_/ \___|"                            
	echo -e ""                                                                                
	echo -e ""                                                                                
	echo -e "                        _____           _           _"                          
	echo -e "                       |  __ \         (_)         | |"                         
	echo -e "                       | (__) | __ ___  _  ___  ___| |_"                        
	echo -e "                       |  ___/ '__/ _ \| |/ _ \/ __| __|"                      
	echo -e "                       | |   | | | (_) | |  __/ (__)| |_"                        
	echo -e "                       |_|   |_|  \___/| |\___|\___|\__|"                       
	echo -e "                                      _/ |"                                     
	echo -e "                                     |__/ "            
	exit 0
}
	###########################################################################################################
	
start
finished

# All code by Nave				
