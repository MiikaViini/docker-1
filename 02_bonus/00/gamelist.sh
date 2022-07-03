#!/bin/bash

clear

echo "Welcome"

read

clear

echo -e "Choose your game \n"
echo -e "1.Bastet\n"
echo -e "2.Ninvaders\n"
echo -e "3.Pacman\n"
echo -e "4.Snake\n"
echo -e "5.Greed\n"
echo -e "0.Exit\n"

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

	echo -e "Choose your game \n"
	echo -e "1.Bastet\n"
	echo -e "2.Ninvaders\n"
	echo -e "3.Pacman\n"
	echo -e "4.Snake\n"
	echo -e "5.Greed\n"
	echo -e "0.Exit\n"


	read -n 1 game
done

echo -e "Bye bye\n"
