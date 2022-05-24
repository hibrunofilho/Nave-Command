#!/bin/bash

##############################################################################################################################################
# By Nave 🛸																																		   
# www.nave.tk																																		   
#																																						
# Copyright © 2021-2022 Bruno Filho | All rights reserved - You may not copy, reproduce, distribute, publish, display, perform,							
# modify, You may not alter or remove any copyright or other notice from copies of the content and you won't be able to sell 
# this work either (NaveCommand), this code was entirely made by Bruno Filho, Nave Command to be used strictly for non-profit/non-commercial purposes, 
# all installation files were downloaded from swcdn.apple.com (subdomain of apple.com) without any changes
#
#							Licença Pública Geral GNU 				
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>5.
#
# For any commercial permission please contact: bruno@brunofilho.tk
##############################################################################################################################################

# Atalhos
verde="\033[01;32m"
vermelho="\033[01;35m"
azul="\033[01;36m"
amarelo="\033[01;33m"
azul_dark="\033[01;34m"
nave_dir_arq="/Users/`users`/Desktop/NaveCommand"
link="http://www.nave.tk/download/Install.txt"
link2="http://www.nave.tk/download/NaveCommand.zip"
versao_local="1.0.5"

inicio()
{
		clear
		printf '\033[8;15;67t'
		clear
	    echo -e  ${amarelo}"*************************************"
		echo -e  ${amarelo} "Seja bem-vindo(a): `users`" 
		echo -e  ${amarelo} "Inicio "
		echo -e  ${amarelo}"*************************************"
		echo ""
		echo -e  ${azul}"# O que vc quer fazer?"
		echo -e  ${azul}"# Informe o numero."
		echo -e  ${amarelo}""
		echo -e  ${verde}"1)  NaveCommand (fast macOS installer)"
		echo -e  ${azul_dark}"2)  Criar pendrive bootavel do macOS (fast macOS installer on USB)"
		echo -e  ${vermelho}""
	
		read -e -p " / " nave_option		
	
		if [[ $nave_option == "1" ]]; then
		importar_install
		escolher_a_versao
		fi
	
		if [[ $nave_option == "2" ]]; then
		Welcome_USB
		Escolha_USB
		fi
	
}

escolher_a_versao()
{
	clear
	printf '\033[8;22;64t'
	chmod +x /tmp/utilitarios/Install.sh
	source /tmp/utilitarios/Install.sh	
	mkdir /tmp/navecommand
	clear
	echo -e  ${azul_dark}"#######################################################"
	echo "################ N A V E - C O M M A N D ##############"
	echo "############### ${links} ###################"
	echo "################### versão: ${versao_local} #####################"
	echo "#######################################################"
	echo ""
	echo -e  ${amarelo}"Seja bem-vindo `Users` "
	echo -e  ${verde}"Certifique que vc está conectado(a) a internet"
	echo -e  ${azul_dark}""
	echo -e   "/ Quais desses sistemas vc quer baixar?"
	echo -e   "/ Informe o numero indicado."
	echo ""
	echo -e ${verde}  "#  1 - $highsierra_versao_instalador | $highsierra_nome_instalador"
	echo -e ${verde}  "#  2 - $mojave_versao_instalador | $mojave_nome_instalador"
	echo -e ${verde}  "#  3 - $catalina_versao_instalador | $catalina_nome_instalador"
	echo -e ${azul}  "#  4 - $bigsur_versao_instalador  | $bigsur_nome_instalador"
	echo -e ${azul}  "#  5 - $monterey_versao_instalador  | $monterey_nome_instalador"
	echo ""
	echo -e ${amarelo} "// N - Atualizar o NaveCommand 🛸 (versão mais recente: ${versao})"
	echo -e  ${vermelho}""
	echo -e  ${vermelho}""
	
	read -e -p " # " macos_versao
	
	if [[ $macos_versao == "1" ]]; then
		versao_instalador="highsierra"
	fi
	
	if [[ $macos_versao == "2" ]]; then
		versao_instalador="mojave"
	fi
	
	if [[ $macos_versao == "3" ]]; then
		versao_instalador="catalina"
	fi
	
	if [[ $macos_versao == "4" ]]; then
		versao_instalador="bigsur"
	fi
	
	if [[ $macos_versao == "5" ]]; then
		versao_instalador="monterey"
	fi
	
	link_instalador="${versao_instalador}_link_instalador"
	nome_instalador="${versao_instalador}_nome_instalador"
	versao_instalador="${versao_instalador}_versao_instalador"

	if [[ $macos_versao == [1-3] ]]; then
		Download_Instalador_1
		Preparar_Instalador_1
		USBmacOS
	fi
	
	if	[ "${macos_versao}" == "4" ] || [ "${macos_versao}" == "5" ]; then
		Download_Instalador_2
		Preparar_Instalador_2
		USBmacOS
	fi
	
	if	[ "${macos_versao}" == "N" ] || [ "${macos_versao}" == "n" ]; then
		update_navecommd
	fi
	
}

update_navecommd()
{
	printf '\033[8;22;84t'
	clear
	echo -e ${azul_dark}"Atualizando para a ${versao}..."
	curl -L -s -o ~/Desktop/Nave-"${versao}".zip ${link2}
	echo -e ${verde}"Pronto! a versao do seu NaveCommand já esta na mais recente"
	echo -e ${azul}"A partir de agora passe a utilizar essa versão: /Users/`users`/Desktop/Nave-"${versao}".zip"
	read -t 10
	echo ""
}

importar_install()
{
		printf '\033[8;24;93t'
		######################################################################
		# Importar tabela de links
		clear
		rm -rf /tmp/utilitarios/
		rm -rf /tmp/navecommand/
		clear
		echo -e ${verde}"🛸 Baixando o catalogo de sistemas para a instalação..."
		echo ""
		mkdir /tmp/utilitarios/
		curl -L -s -o /tmp/utilitarios/Install.sh ${link}
		######################################################################
}

Download_Instalador_1()
{
		printf '\033[8;24;93t'
		####################################################################################################################
		# Fazer o Download dos instaladores: macOS High Sierra, macOS Mojave e macOS Catalina
		clear
		echo -e ${verde}"🛸 Baixando o InstallAssistantAuto.pkg"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/InstallAssistantAuto.pkg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallAssistantAuto.pkg
		clear
		echo -e ${verde}"🛸 Baixando o AppleDiagnostics.chunklist"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.chunklist http://swcdn.apple.com/content/downloads/${!link_instalador}/AppleDiagnostics.chunklist
		clear
		echo -e ${verde}"🛸 Baixando o AppleDiagnostics.dmg"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/AppleDiagnostics.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/AppleDiagnostics.dmg
		clear
		echo -e ${verde}"🛸 Baixando o BaseSystem.chunklist"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/BaseSystem.chunklist http://swcdn.apple.com/content/downloads/${!link_instalador}/BaseSystem.chunklist
		clear
		echo -e ${verde}"🛸 Baixando o BaseSystem.dmg"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/BaseSystem.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/BaseSystem.dmg
		clear
		echo -e ${verde}"🛸 Baixando o InstallESD.dmg"
		echo -e ${amarelo}""
		curl -# -L -o /tmp/navecommand/InstallESD.dmg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallESDDmg.pkg
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
		read -t 10
		
}

Download_Instalador_2()
{
	printf '\033[8;24;93t'
	##########################################################################################################################
	# Fazer o Download dos instaladores: macOS Monterey e macOS Big Sur
	clear
	echo -e ${verde}"🛸 Baixando o InstallAssistant.pkg"
	echo -e ${amarelo} ""
	curl -# -L -o /tmp/navecommand/InstallAssistant.pkg http://swcdn.apple.com/content/downloads/${!link_instalador}/InstallAssistant.pkg
	##########################################################################################################################
}

Preparar_Instalador_2()
{
	clear
	##########################################################################################################################
	#Compilar os Instaladores: macOS Monterey e macOS Big Sur
	echo -e ${azul_dark}"Compilando o Instalador..."
	cd /tmp/navecommand
	mkdir ~/Desktop/NaveCommand
	mkdir tar
	pkgutil --expand /tmp/navecommand/InstallAssistant.pkg /tmp/navecommand/pkgutil
	tar -xf /tmp/navecommand/pkgutil/Payload -C  /tmp/navecommand/tar
	mv /tmp/navecommand/tar/Applications/"${!nome_instalador}".app "${nave_dir_arq}"
	mkdir -p ${nave_dir_arq}/"${!nome_instalador}".app/Contents/SharedSupport/
	cp /tmp/navecommand/InstallAssistant.pkg "${nave_dir_arq}"/"${!nome_instalador}".app/Contents/SharedSupport/SharedSupport.dmg
	clear
	echo "Instalador compilado ✅"
	read -t 10
	##########################################################################################################################
}

USBmacOS_nomedopendrive()
{
	###########################################################
	# Informar o nome do pendrive
	clear
	echo -e ${verde}"Digite o nome do seu pendrive (exatamente)"
	echo -e ${azul} ""
	read -e -p " # " disco_usb
	###########################################################
	
}

USBmacOS()
{
	clear
	echo -e ${verde}"Pronto! Seu instalador já foi criado, deseja criar um pendrive bootavel com esse sistema?"
	echo ""
	echo -e ${verde}"S) Sim"
	echo -e ${vermelho}"N) Não"
	echo ""
	
	read -e -p " # " USB
	
	if	[ "${USB}" == "S" ] || [ "${USB}" == "s" ]; then
		atalhos
		Welcome_USB
		Escolha_USB
	fi
	
	if [[ $nao == "n" ]]; then
		final
	fi
	
}

Welcome_USB()
{
	mkdir ~/Desktop/NaveCommand
	printf '\033[8;20;61t'
	clear
	echo -e  ${azul}"******************************************************"
	echo -e  ${azul} ""
	echo -e  ${azul} "Seja bem-vindo (`users`) ao USBmacOS"
	echo -e  ${azul} ""
	echo -e  ${azul}"******************************************************"
	echo -e  ${amarelo}"Mova o applicativo de instalação para:"
	echo -e  ${verde}"${nave_dir_arq}"
	echo -e  ${azul} ""
}		

Escolha_USB()
{
	
	echo "/ Qual sistema vc vai utilizar?"
	echo "/ Informe o numero."
	echo "/     1 - Monterey"
	echo "/     2 - Big Sur"
	echo "/     3 - Catalina"
	echo "/     4 - Mojave"
	echo "/     5 - High Sierra"
	
	
	read -e -p " / " USBmacOS_versao
	
	
	if [[ $USBmacOS_versao == "1" ]]; then
		USBmacOS_nomedopendrive
		Monterey
	fi
	
	if [[ $USBmacOS_versao == "2" ]]; then
		USBmacOS_nomedopendrive
		Big_Sur
	fi
	
	if [[ $USBmacOS_versao == "3" ]]; then
		USBmacOS_nomedopendrive
		Catalina
	fi
	
	if [[ $USBmacOS_versao == "4" ]]; then
		USBmacOS_nomedopendrive
		Mojave
	fi
	
	if [[ $USBmacOS_versao == "5" ]]; then
		USBmacOS_nomedopendrive
		High_Sierra
	fi
}

Monterey()
{
	clear
	echo -e ${amarelo} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 10
	clear
}


Big_Sur()
{
	clear
	echo -e ${amarelo} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 10
	clear
}

Catalina()
{
	clear
	echo -e ${amarelo} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 10
	clear
}

Mojave()
{
	clear
	echo -e ${amarelo} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 10
	clear
}

High_Sierra()
{
	clear
	echo -e ${amarelo} "Digite a sua senha ⬇️"
	sudo $nave_dir_arq/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/$disco_usb
	clear
	echo "Pendrive Feito ✅ "
	read -t 10
	clear
}

final()
{
	#######################################################################################################
	# Finalização
	printf '\033[8;50;100t'
	clear
	rm -rf /tmp/navecommand/
	echo -e  ${azul}"Obrigado por usar o Nave Command 🛸"
	echo -e  ${verde}"Download concluído! Espero que tenha gostado dessa experiência totalmente brasileira 🇧🇷"
	echo -e  ${verde}"Contato caso queira dar sugestões para este projeto = dicas@nave.tk 🛸 🛠 "
	echo -e  ${amarelo}
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
	
inicio
final

# All code by Nave				