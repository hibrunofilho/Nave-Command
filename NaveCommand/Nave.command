 #!/bin/bash

####################################################################
# By Nave 🛸																													
# www.nave.tk																												
# For any commercial permission please contact: bruno@brunofilho.tk
####################################################################

green="\033[01;32m"
pink="\033[01;35m"
azul="\033[01;36m"
yellow="\033[01;33m"
blue="\033[01;34m"
nave_dir_arq="/Users/`users`/Desktop/NaveCommand"
local_version="1.1.0"

start()
{
		clear
		printf '\033[8;15;67t'
		clear
	    echo  ${yellow}"*************************************"
		echo  ${blue}" # Nave Command 🛸 | www.nave.tk            "
		echo   ${green} "# Menu inicial | $local_version" 
		echo   ${yellow}"*************************************"
		echo ""
		echo  ${azul}"@ Ei `Users`, o que você quer fazer ?"
		echo ""
		echo   ${green}"# 1)  NaveCommand 🛠 "
		echo   ${blue}"# 2)  Criar pendrive bootavel do macOS 💾 "
		echo  ${pink} ""
		
	read  -p "# " nave_option		
	
		if [[ $nave_option == "1" ]]; then
		import_install
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
	echo "###########################################"
	echo  ${blue}"# Nave Command � | www.nave.tk            "
    echo  ${green}"# Versão mais recente: $versao              "
    echo  ${pink}"# Versão que está rodando agora: $local_version   "
    echo  ${green}"###########################################"
	echo ""
	echo   ${yellow}"Seja bem-vindo `Users` "
	echo   ${green}"Certifique que vc está conectado(a) a internet 🚥"
	echo   ${blue}""
	echo    "/ Quais desses sistemas vc quer baixar?"
	echo    "/ Informe o numero indicado."
	echo ""
	# Sistemas Disponíveis
	echo  ${green}  "#  1� - $highsierra_versao_instalador | $highsierra_nome_instalador"
	echo  ${green}  "#  2 - $mojave_versao_instalador | $mojave_nome_instalador"
	echo  ${green}  "#  3 - $catalina_versao_instalador | $catalina_nome_instalador"
	echo  ${azul}  "#  4 - $bigsur_versao_instalador  | $bigsur_nome_instalador"
	echo  ${azul}  "#  5 - $monterey_versao_instalador  | $monterey_nome_instalador"
	echo  ${pink}  "#  6 - $ventura_versao_instalador  | $ventura_nome_instalador"
	echo ""
	# Atualizar o Nave
	echo  ${yellow} "// N - Atualizar o NaveCommand 🛸 (versão mais recente: ${versao})"
	echo   ${pink}""
	echo   ${pink}""
	
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
	echo  ${blue}"Atualizando para a ${versao}..."
	rm -rf /usr/local/bin/nave
	mkdir /usr/local/bin
	curl -o /usr/local/bin/nave https://github.com/hibrunofilho/Nave-Command/raw/main/nave && chmod +x /usr/local/bin/nave && nave
	echo ""
}

import_install()
{
		printf '\033[8;24;93t'
		######################################################################
		# Importar tabela de links
		clear
		rm -rf /tmp/utilitarios/
		clear
		echo  ${green}"🛸 Baixando o catalogo de sistemas para a instalação..."
		echo ""
		mkdir /tmp/navecommand
		mkdir /tmp/utilitarios/
		curl -L -s -o /tmp/utilitarios/Install.sh https://raw.githubusercontent.com/hibrunofilho/Nave-Command/main/Install.txt
		######################################################################
}

Download_Instalador_1()
{
		printf '\033[8;24;93t'
		####################################################################################################################
		# Fazer o Download dos instaladores: macOS High Sierra, macOS Mojave e macOS Catalina
		clear
		echo  ${green}"🛸 Baixando o InstallAssistantAuto.pkg"
		echo  ${yellow}""
		curl -# -L -o /tmp/navecommand/InstallAssistantAuto.pkg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallAssistantAuto.pkg
		clear
		echo  ${green}"🛸 Baixando o AppleDiagnostics.chunklist"
		echo  ${yellow}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.chunklist http://swcdn.apple.com/content/downloads/${!link_instalador}/AppleDiagnostics.chunklist
		clear
		echo  ${green}"🛸 Baixando o AppleDiagnostics.dmg"
		echo  ${yellow}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/AppleDiagnostics.dmg
		clear
		echo  ${green}"🛸 Baixando o BaseSystem.chunklist"
		echo  ${yellow}""
		curl -# -L -o /tmp/navecommand/BaseSystem.chunklist http://swcdn.apple.com/content/downloads/${!link_instalador}/BaseSystem.chunklist
		clear
		echo  ${green}"🛸 Baixando o BaseSystem.dmg"
		echo  ${yellow}""
		curl -L -o /tmp/navecommand/BaseSystem.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/BaseSystem.dmg
		clear
		echo  ${green}"🛸 Baixando o InstallESD.dmg"
		echo  ${yellow}""
		curl -L -o /tmp/navecommand/InstallESD.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallESDDmg.pkg
		clear
		echo   "Ufa! arquivos de instalação ja baixados"
		######################################################################################################################
}

Preparar_Instalador_1()
{
		#####################################################################################################################
		# Compilar os instaladores: macOS High Sierra, macOS Mojave e macOS Catalina
		clear
		echo "Montando o instalador .app"
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
		echo   "Instalador compilado ✅"
		read -t 8
		
}

Download_Instalador_2()
{
	printf '\033[8;24;93t'
	##########################################################################################################################
	# Fazer o Download dos instaladores: macOS Monterey e macOS Big Sur
	clear
	echo  ${green}"🛸 Baixando o InstallAssistant.pkg"
	curl -L -o /tmp/navecommand/InstallAssistant.pkg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallAssistant.pkg
	##########################################################################################################################
}

Preparar_Instalador_2()
{
	clear
	##########################################################################################################################
	#Compilar os Instaladores: macOS Monterey e macOS Big Sur
	echo  ${blue}"Compilando o Instalador..."
	cd /tmp/navecommand
	mkdir ~/Desktop/NaveCommand
	sudo /usr/sbin/installer -pkg "/tmp/navecommand/InstallAssistant.pkg" -target "/"
	mv /Applications/Install* "${nave_dir_arq}"
	clear
	echo "Instalador compilado ✅"
	read -t 8
	##########################################################################################################################
}

USBmacOS_nomedopendrive()
{
	###########################################################
	# Informar o nome do pendrive
	clear
	echo  ${green}"Digite o nome do seu pendrive (exatamente)"
	echo  ${azul} ""
	read  -p " # " disco_usb
	###########################################################
	
}

USBmacOS()
{
	clear
	echo  ${green}"Pronto! Seu instalador já foi criado, deseja criar um pendrive bootavel com esse sistema?"
	echo ""
	echo  ${green}"S) Sim"
	echo  ${pink}"N) Não"
	echo ""
	
	read  -p " # " USB
	
	if	[ "${USB}" == "S" ] || [ "${USB}" == "s" ]; then
		atalhos
		welcome_USB
		search_USB
	fi
	
}

welcome_USB()
{
	mkdir ~/Desktop/NaveCommand
	printf '\033[8;20;61t'
	clear
	echo   ${azul}"******************************************************"
	echo   ${azul} ""
	echo   ${azul} "Seja bem-vindo (`users`) ao USBmacOS"
	echo   ${azul} ""
	echo   ${azul}"******************************************************"
	echo   ${yellow}"Mova o applicativo de instalação para:"
	echo   ${green}"${nave_dir_arq}"
	echo   ${azul} ""
}		

search_USB()
{
	
	echo "/ Qual sistema vc vai utilizar?"
	echo "/ Informe o numero."
	echo "/     1 - Monterey"
	echo "/     2 - Big Sur"
	echo "/     3 - Catalina"
	echo "/     4 - Mojave"
	echo "/     5 - High Sierra"
	echo "/     6 - Ventura"
	
	
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
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ 13\ beta.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 8
	clear
}

Monterey()
{
	clear
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 8
	clear
}


Big_Sur()
{
	clear
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 8
	clear
}

Catalina()
{
	clear
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 8
	clear
}

Mojave()
{
	clear
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 8
	clear
}

High_Sierra()
{
	clear
	echo  ${yellow} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
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
	echo   ${azul}"Obrigado por usar o Nave Command 🛸"
	echo   ${green}"Download concluído! Espero que tenha gostado dessa experiência totalmente brasileira 🇧🇷"
	echo   ${green}"Contato caso queira dar sugestões para este projeto = dicas@nave.tk 🛸 🛠 "
	echo   ${yellow}
	echo "                              _   _"                                             
	echo "                             | \ | |"                                            
	echo "                             |  \| | __ ___    _____"                            
	echo "                             | .   |/ _  \ \ / / __/ "                            
	echo "                             | |\  | (_) |\ V /  __/"                           
	echo "                             |_| \_|\__,_| \_/ \___|"                            
	echo ""                                                                                
	echo ""                                                                                
	echo "                        _____           _           _"                          
	echo "                       |  __ \         (_)         | |"                         
	echo "                       | (__) | __ ___  _  ___  ___| |_"                        
	echo "                       |  ___/ '__/ _ \| |/ _ \/ __| __|"                      
	echo "                       | |   | | | (_) | |  __/ (__)| |_"                        
	echo "                       |_|   |_|  \___/| |\___|\___|\__|"                       
	echo "                                      _/ |"                                     
	echo "                                     |__/ "            
	exit 0
}
	###########################################################################################################
	
start
finished

# All code by Nave				
