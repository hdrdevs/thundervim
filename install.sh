#!/bin/bash

PROGRAM_NAME="thunderVIM"
COLOR_GREEN='\033[0;32m'
COLOR_NO='\033[0m'
TXT_BOLD=$(tput bold)
TXT_NORMAL=$(tput sgr0)

function print_welcome(){
clear
echo "                                                                                "
echo "                                                               %%%%             "
echo "                                                           %%%%%/%%             "
echo "                                                      ,%%%%#**///%%             "
echo "                                                  #%%%%/***//////%%             "
echo "                                              %%%%%*****////////(%%             "
echo "                                          %%%%%******////////(%%%(              "
echo "                                      %%%%%********///////(%%%(                 "
echo "                                 ,%%%%#*********///////(%%%(                    "
echo "                             (%%%%(**********///////(%%%#                       "
echo "                         #%%%%*************************/%%%%%/                  "
echo "                       %%%******************************///%%/                  "
echo "                       %%//////////////*************///////%%/                  "
echo "                      ,%%///////////************///////////%%/                  "
echo "                      (%%////////***********////////////%%%%                    "
echo "                      #%%%%%%%%*********////////////%%%%                        "
echo "                        ,%%%********////////////%%%%                            "
echo "                      %%%%******////////////%%%%                                "
echo "                   (%%%*****////////////%%%#                                    "
echo "                 %%%#***///////////(%%%#                                        "
echo "              #%%%**///////////#%%%/                                            "
echo "              %%///////////#%%%*                                                "
echo "              %%///////%%%%,                                                    "
echo "              %%///%%%%.                                                        "
echo "              %%%%%.                                                            "
echo "                                                                                "
echo " ████████╗██╗░░██╗██╗░░░██╗███╗░░██╗██████╗░███████╗██████╗░██╗░░░██╗██╗███╗░░░███╗"
echo " ╚══██╔══╝██║░░██║██║░░░██║████╗░██║██╔══██╗██╔════╝██╔══██╗██║░░░██║██║████╗░████║"
echo " ░░░██║░░░███████║██║░░░██║██╔██╗██║██║░░██║█████╗░░██████╔╝╚██╗░██╔╝██║██╔████╔██║"
echo " ░░░██║░░░██╔══██║██║░░░██║██║╚████║██║░░██║██╔══╝░░██╔══██╗░╚████╔╝░██║██║╚██╔╝██║"
echo " ░░░██║░░░██║░░██║╚██████╔╝██║░╚███║██████╔╝███████╗██║░░██║░░╚██╔╝░░██║██║░╚═╝░██║"
echo " ░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝"
echo ""
echo ""
echo "                                 I N S T A L L E R"
echo ""
echo ""
}

function os_release() {
	[[ -r  /etc/os-release ]] && . /etc/os-release

	case "$ID" in
	ubuntu)
		
        echo "Ubuntu detected"	
		;;
	fedora)
        echo "Fedora detected"	
        echo "Installing dependences..."
        sudo dnf install gcc gcc-c++ git python-pip cargo nodejs neovim ripgrep
		;;
	*)
		echo "Unsupported OS" | stderr
		exit 1
		;;
	esac
}

function print_green() {
    echo -e "${COLOR_GREEN} ${TXT_BOLD}$1 ${TXT_NORMAL} ${COLOR_NO}"
}

function print_text() {
    echo -e "${TXT_BOLD}$1 ${TXT_NORMAL}"
}


function run_install(){
    print_green "Script de instalacion de ${PROGRAM_NAME}"

    os_release

    print_text "Instalando Packer..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    print_text "Instalando ${PROGRAM_NAME}..."
    git clone http://192.168.1.70:8020/horacio/nvim.git ~/.config/

    # run neovim excuting PackerSync
    print_text "Building ${PROGRAM_NAME} interface..."
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

    print_green "Done! :)"
    echo "run nvim command from your terminal"
}

# COMIENZA LA INSTALACION

print_welcome

echo -e "Are you sure you want to install ${TXT_BOLD}${PROGRAM_NAME}${TXT_NORMAL}? (yes|no)"
read test

if [[ $test = "yes" ]]
then
    run_install
else
    exit 1
fi
