#! /bin/bash


if [ `ls ./database/ | wc -l` == 0 ]
then
      echo -e "${Red}No Database Found${clear}"
      echo -e "================================================================="
      source ./Main_menu.sh
fi      

echo -e "${BBlue}===============Drop Database===============${clear}\n"
read -p "Which Database do you want to drop?🤔" name

while [[ ! -d ./database/$name ]] || [[ -z $name ]]
  do
      echo -e "${Red}Invalid Input${clear}"
      read -p "please enter valid Database Again:🙄" name
     
done
while [[ -d ./database/$name ]]
do   
     read -p "Are you sure? [y/N] 😯" response
      case "$response" in
       [yY]) 
      rm -r ./database/$name  
      echo -e "${BYellow}Database Deleted Successfully${clear}😎"
      echo -e "================================================================="
      source ./Main_menu.sh
        ;;
      [Nn])
      echo -e "${BCyan}Database Not Deleted${clear}"
      echo -e "================================================================="
      source ./Main_menu.sh
       ;;  
    *)
        echo -e "${Red}Invalid Input Try Again${clear}"
        echo -e "================================================================="
        source ./DropDb.sh
        ;;
       esac 
done







