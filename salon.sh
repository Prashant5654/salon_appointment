#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

echo "Welcome to My Salon, how can I help you?"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
 services=$($PSQL "SELECT * FROM services")
 echo "$services" | while read SERVICE_ID BAR NAME
 do
  echo "$SERVICE_ID) $NAME "
 done
 read SERVICE_ID_SELECTED
 
 case $SERVICE_ID_SELECTED in 
 
       [1-5]) SERVICE ;;
	   
       *) MAIN_MENU "I could not find that service. What would you like today?" ;;
 esac
 
 
 }
 SERVICE(){
 echo -e "\nWhat's your phone number?"
 
 read CUSTOMER_PHONE
 
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 if [[ -z $PHONE_NUM ]]
 then
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	GET_SERVICE=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
	
    SERVICE_NAME=$(echo $GET_SERVICE| sed 's/ //g')
	
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
 
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME),$(echo $CUSTOMER_NAME)?"
 
    read SERVICE_TIME
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	
	
	echo -e "\nI have put you down for a cut at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	
 else
    
	GET_SERVICE=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
	
    SERVICE_NAME=$(echo $GET_SERVICE| sed 's/ //g')
	
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	
	echo -e "\nWhat time would you like your $(echo $SERVICE_NAME),$(echo $CUSTOMER_NAME)?"
 
    read SERVICE_TIME
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	
	
	echo -e "\nI have put you down for a cut at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	

    
	
	
 fi
 
 
 }
MAIN_MENU
