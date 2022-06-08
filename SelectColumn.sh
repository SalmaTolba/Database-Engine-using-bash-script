#! /bin/bash

#check if the table empty
if [[ `cat ./database/$dbname/$tablename | wc -l` == 1 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    
read -p "Enter Column Name You Want To Select: " colname
while [[ -z $colname ]]
do 
            echo -e "${Red}Invalid Input${clear}🤡"
            read -p "PLease Enter Column Name Again:🧐" colname
done   

echo "________________________________________________"
function selectcol(){

#check if column name exists
if [[ $colname =~ [`awk -F":" 'NR==1{for(i=1; i<=NF; i++) if ($i=="'$colname'") {a[i]++;} } { for (i in a) printf "%s\t", $i; printf "\n"}' ./database/$dbname/$tablename`] ]];
then
    #print chosen column
      awk -F":" 'NR==1{for(i=1; i<=NF; i++) if ($i=="'$colname'") {a[i]++;} } { for (i in a) printf "%s\t", $i; printf "\n"}' ./database/$dbname/$tablename
      #sed -n ''$coname'p' ./database/$dbname/$tablename    
    echo -e "================================================================="
    source ./Connect-Menu.sh
	  else              
                echo -e "${Red}Column Not Exists${clear}"
                echo -e "================================================================="
                source ./SelectColumn.sh
fi
}
selectcol
