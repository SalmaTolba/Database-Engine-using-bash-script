#! /bin/bash

if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurple}===============Delete From Table===============${clear}\n"

read -p "Enter Table You Want To Delete from : " tablename
export tablename
while [[ -z $tablename ]] || [[ $tablebname == *['!''@#/$\"*{^})(+_/=-]>[<?']* ]]
do 
  echo -e "${Red}Invalid Input${clear}🤡"
  read -p "PLease Enter Table Name Again:🧐" tablename
done

if [ -f ./database/$dbname/$tablename ]
then

    select choice in "Delete All Records😲" "Delete Record😧" "Back To Menu"
    do
        case $REPLY in
        1) source ./DeleteAllRecord.sh ;;
        2) source ./DeleteRecord.sh ;;
        3) source ./Connect-Menu.sh ;;
        *) echo -e "${Red}invalid option${clear}" ;; 

        esac

    done
else
    echo -e "${Red}Table Not Exists${clear}"
    echo -e "================================================================="
    source ./Delete_menu.sh
fi	
