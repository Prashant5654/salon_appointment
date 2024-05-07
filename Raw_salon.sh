#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

echo "Welcome to My Salon, how can I help you?"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  echo -e "\n1) Cut\n2) color\n3) perm\n4) style\n5) trim"
  
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
      1) Cut ;;
	  2) color ;;
	  3) perm ;;
	  4) style ;;
	  5) trim ;;
      *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

Cut(){
 echo -e "\nWhat's your phone number?"
 
 read CUSTOMER_PHONE
 
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 if [[ -z $PHONE_NUM ]]
 then
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	echo -e "\nWhat time would you like your cut,$(echo $CUSTOMER_NAME)?"
	
	#added to get customer_id
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	
	read SERVICE_TIME
	
	
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	if [[ INSERT_APPOINTMENT_TIME == "INSERT 0 1" ]]
	then
	
	echo -e "\nI have put you down for a cut at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	fi
	
	
	
 else
 
     CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
	 
	 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	 
     echo -e "\nWhat time would you like your cut,$(echo $CUSTOMER_NAME)?"
	 
	 read SERVICE_TIME
	 
	 
	 
	 INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	 
	 
	
	if [[ INSERT_APPOINTMENT_TIME == "INSERT 0 1" ]]
	then
	
	echo -e "\nI have put you down for a cut at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	fi
	
	
	 
 fi
 
}
color(){
 echo -e "\nWhat's your phone number?"
 read CUSTOMER_PHONE
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 if [[ -z $PHONE_NUM ]]
 then
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	echo -e "\nWhat time would you like your color,$(echo $CUSTOMER_NAME)?"
	
	#added to get customer_id
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	
	read SERVICE_TIME
	
	
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	
	
	echo -e "\nI have put you down for a color at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	

 else
       
	 CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'") 
	 
	 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	 
     echo -e "\nWhat time would you like your color,$(echo $CUSTOMER_NAME)?"
	 
	 read SERVICE_TIME
	 
	 
	 
	 INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	 
	 

	echo -e "\nI have put you down for a color at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	 
 fi
}
perm(){
 echo -e "\nWhat's your phone number?"
 
 read CUSTOMER_PHONE
 
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 
 if [[ -z $PHONE_NUM ]]
 
 then
 
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	echo -e "\nWhat time would you like your perm,$(echo $CUSTOMER_NAME)?"
	
	#added to get customer_id
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	
	read SERVICE_TIME
	
	
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	

	echo -e "\nI have put you down for a perm at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	

 else
     
	 CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
	 
	 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	 
     echo -e "\nWhat time would you like your perm,$(echo $CUSTOMER_NAME)?"
	 
	 read SERVICE_TIME
	 
	 
	 
	 INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	 
	
	
	echo -e "\nI have put you down for a perm at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	 
 fi
}
style(){
echo -e "\nWhat's your phone number?"

 read CUSTOMER_PHONE
 
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 if [[ -z $PHONE_NUM ]]
 
 then
 
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	echo -e "\nWhat time would you like your style,$(echo $CUSTOMER_NAME)?"
	
	#added to get customer_id
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	
	read SERVICE_TIME
	
	
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	
	
	echo -e "\nI have put you down for a style at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	

 else
 
     CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'") 
	 
	 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	  
     echo -e "\nWhat time would you like your style,$(echo $CUSTOMER_NAME)?"
	 
	 read SERVICE_TIME
	 
	 
	 
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	 

	
	echo -e "\nI have put you down for a style at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	 
 fi
}
trim(){
echo -e "\nWhat's your phone number?"

 read CUSTOMER_PHONE
 
 PHONE_NUM=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")
 
 if [[ -z $PHONE_NUM ]]
 
 then
    echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME
	
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
	
	echo -e "\nWhat time would you like your trim,$(echo $CUSTOMER_NAME)?"
	
	#added to get customer_id
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	
	read SERVICE_TIME
	
	
	
	INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	
	
	
	echo -e "\nI have put you down for a trim at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
	
	

 else
 
     CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
	 
	 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
	 
     echo -e "\nWhat time would you like your trim,$(echo $CUSTOMER_NAME)?"
	 
	 read SERVICE_TIME
	 
	 
	 
	 INSERT_APPOINTMENT_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	 
	 
	
	echo -e "\nI have put you down for a trim at $(echo $SERVICE_TIME), $(echo $CUSTOMER_NAME)."
	
 
	 
 fi
}
EXIT(){ 

echo -e "\n \n"

}
MAIN_MENU
