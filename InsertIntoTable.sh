#! /bin/bash

if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurple}===============Insert Into Table===============${clear}\n"

re='^[0-9]+$'
read -p "Enter Table You Want To Insert : " tablename

while [[ -z $tablename ]] || [[ $tablebname == *['!''@#/$\"*{^})(+_/|,;:~`.%&.=-]>[<?']* ]]
do 
    echo -e "${Red}Invalid Input${clear}🤡"
    read -p "PLease Enter Table Name Again:🧐" tablename
done
declare -a valueofcnamearray

if [ -f ./database/$dbname/$tablename ]
then
    echo -e "${BBlue}*****Primary key must be unique*****${clear}"

    #iterate on tablename.type to know the number of fields to insert in it
    for (( j=0 ; j < `cat ./database/$dbname/$tablename.Type | wc -w` ; j++ ))
    do
      read -p "Enter Value Of `head -n 1 ./database/$dbname/$tablename | cut -f $((j+1)) -d ":"` column: " valueofcname
       ## check datatype of record
       function checkdatatype()
       {
           #know the datatype of the column in the table type
       datatype=`cut -f $((j+1)) -d " " ./database/$dbname/$tablename.Type`
       ###check if value is integer

       if [[ "$datatype" == "int" ]] 
       then 
           while ! [[ $valueofcname =~ $re ]]
           do
             echo -e "${BBlue}Column must be integer${clear}"
             read -p "Enter Value Of `head -n 1 ./database/$dbname/$tablename | cut -f $((j+1)) -d ":"` column: " valueofcname
      
           done
       fi
       ###check if value is string
       if [[ "$datatype" == "string" ]] 
       then 
           while  [[ $valueofcname =~ $re ]] || [[ -z $valueofcname ]] || [[ $valueofcname == *['!''@#/$\"*{^})(+_|,;:~`.%&/=-]>[<?']* ]]
           do
              echo -e "${BBlue}Column must be string${clear}"
              read -p "Enter Value Of `head -n 1 ./database/$dbname/$tablename | cut -f $((j+1)) -d ":"` column: " valueofcname
        
            done
        fi
        }
        ###########check primary key
        function checkpk()
        {
        pkvalue=`cut -f 1 -d ":" ./database/$dbname/$tablename | grep -w $valueofcname`
        #check that pkvalue = input value of colname ,,&&,, check that it belong in the first column onlyyyyy
        while [[ $pkvalue == $valueofcname ]] && [[ $j == 0 ]]
        do 
           echo -e "${Red}This Value is Already Exists (Pk)${clear}" 
           echo -e "================================================================="
           read -p "Enter Value Of `head -n 1 ./database/$dbname/$tablename | cut -f $((j+1)) -d ":"` column: " valueofcname  
        done    
        }
checkdatatype
checkpk
#insert values of array
valueofcnamearray[$j]=$valueofcname
done

#take the array and pass it to the file
    for (( j=0 ; j < `cat ./database/$dbname/$tablename.Type | wc -w` ; j++ ))
    do
        echo -ne "${valueofcnamearray[$j]}:" >> ./database/$dbname/$tablename
    done
    echo "" >> ./database/$dbname/$tablename
    else
        echo -e "${Red}Table Not Exists${clear}"
        echo -e "================================================================="
        source ./Connect-Menu.sh
fi
echo -e "${BYellow}Insertion Complete${clear}"
echo -e "================================================================="
source ./Connect-Menu.sh

  
