#! /bin/bash

source ./Colours.sh

if [ ! -d "database" ]
then
    mkdir database
fi
echo -e "================================================================="

echo -e "       ${BYellow}***Welcome In Our DataBase Engine 🤗***${clear}\n"

echo -e "================================================================="
select choice in "Create database🤔" "List database😌" "Connect to database🤨" "Drop database😱" "Exit😳"
do
    case $REPLY in
      1) source ./Create.sh  ;;
      2) source ./ListDB.sh ;;
      3) source ./ConnectDB.sh ;;
      4) source ./DropDb.sh ;;
      5) break ;;
      *) echo -e "${Red}invalid option${clear}" 
            source ./Main_menu.sh;; 

esac

done
