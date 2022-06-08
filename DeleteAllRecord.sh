#! /bin/bash

#check if the table empty
if [[ `cat ./database/$dbname/$tablename | wc -l` == 1 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    

echo -e "${BCyan}===============Delete All Record===============${clear}\n"


#get first line in the table (columns name) then append it to the file

echo `head -n 1 ./database/$dbname/$tablename` > ./database/$dbname/$tablename

echo -e "${BYellow}Record Deleted successfully${clear}"

echo -e "================================================================="

source ./Connect-Menu.sh