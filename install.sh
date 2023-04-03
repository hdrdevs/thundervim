#!/bin/bash

PROGRAM_NAME="thundervim"
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
        sudo apt install gcc g++ git python3-pip cargo nodejs neovim ripgrep
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
    print_green "${PROGRAM_NAME} installing script"

    os_release

    print_text "Installig Packer..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    
    BASE_DIR=~/.config/
    DIR=$BASE_DIR/nvim
	if [ -d "$DIR" ];
	then
		echo "backup existing configuration"
		mv $DIR "${BASE_DIR}nvim.previous.bkp"
	fi

    print_text "Installing ${PROGRAM_NAME}..."
    git clone https://github.com/hdrdevs/thundervim.git "${BASE_DIR}${PROGRAM_NAME}"
    mv "${BASE_DIR}/${PROGRAM_NAME}" "${BASE_DIR}/nvim"

    # run neovim excuting PackerSync
    #print_text "Building ${PROGRAM_NAME} interface..."
    #nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    
    #print_text "Running TSUpdate..."
    #nvim --headless -c 'autocmd User TSUpdateComplete quitall' -c 'TSUpdate'

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
