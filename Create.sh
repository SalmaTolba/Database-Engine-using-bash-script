#! /bin/bash

#re='^[0-9]+$'
echo -e "${BBlue}===============Create Database===============${clear}"
read -p "Enter Database Name: " name

while [[ -z $name ]] || [[ $name == *['!''@#/$\"*{^})(+|,;:~`._%&/=-]>[<?']* ]] || [[ $name =~ [0-9] ]]
do 
            echo -e "${Red}Invalid Input🤡${clear}"
            read -p "PLease Enter Database Name Again:🧐" name
done

if [ -d ./database/$name ] 
then
    echo -e "${Red}database already exists🙂${clear}"
    echo -e "================================================================="
    source ./Create.sh
fi
mkdir ./database/$name  
echo -e "${BYellow}Congratulations Your Database Is Created😎${clear}"	
echo -e "================================================================="
source ./Main_menu.sh
          

