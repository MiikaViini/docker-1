#!/bin/bash

RED='\e[1;31m'
CYAN='\e[1;36m'
NC=' \e[0m'

clear

echo  -e "\033[33;5;7mWELCOME TO LINUX GAMECENTER!\033[0m"

read -n 1

clear


echo -e "\e[1;31mChoose your game \n"
echo -e "${CYAN}1.Bastet"
echo -e "2.Ninvaders"
echo -e "3.Pacman"
echo -e "4.Snake"
echo -e "5.Greed${NC}"
echo -e "${RED}0.Exit${NC}"

read -n 1 game


while [ "$game" != 0 ]
do
	if [ "$game" == 1 ]
		then
			/usr/games/bastet
			game=0
	fi

	if [ "$game" == 2 ]
		then
			/usr/games/ninvaders
			game=0
	fi

	if [ "$game" == 3 ]
		then
			/usr/games/pacman4console
			game=0
	fi

	if [ "$game" == 4 ]
		then
			/usr/games/nsnake
			game=0
	fi

	if [ "$game" == 5 ]
		then
			/usr/games/greed
			game=0
	fi

	clear

	echo -e "\e[1;31mChoose your game \n"
	echo -e "${CYAN}1.Bastet"
	echo -e "2.Ninvaders"
	echo -e "3.Pacman"
	echo -e "4.Snake"
	echo -e "5.Greed${NC}"
	echo -e "${RED}0.Exit${NC}"

	read -n 1 game
done

echo -e "Bye bye\n"
