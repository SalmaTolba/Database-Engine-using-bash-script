#! /bin/bash

#check if the table empty
if [[ `cat ./database/$dbname/$tablename | wc -l` == 1 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    

echo -e "${BCyan}===============Delete Record===============${clear}\n"


function delete()
{
    read -p "Enter PK Record " record
    while [[ -z $record ]]
    do 
        echo -e "${Red}Invalid Input${clear}🤡"
        read -p "PLease Enter PK Record Again:🧐" Record
    done   
    ##check that the input pk exists       
    ## if input record = cut first column from the table then search for input pk record  
    if [[ $record =~ [`cut -d':' -f1 ./database/$dbname/$tablename | grep -x $record`] ]] 
    then
    #then,(recordnumber = NR) we search in all rows using awk, if the first column field matches the record 
    #then prints number of records 
    #like 1- /n 2- /n 3- ......
            recordnumber=`awk -F":" '{if ($1=="'$record'") print NR}' ./database/$dbname/$tablename`
    #delete the recordnumber .. line 1 .or 2 .....
            sed -i ''$recordnumber'd' ./database/$dbname/$tablename    
            echo -e "${BYellow}Record deleted successfuly${clear}"
            echo -e "================================================================="
            source ./Connect-Menu.sh
     else              
        echo -e "${Red}Invalid${clear}"
        echo -e "================================================================="
        #call delete function
        delete
    fi
}
delete