#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

# ask username
echo "Enter your username:"
read USERNAME

# check username
USERNAME_RESULT=$($PSQL "select count, best from users where username = '$USERNAME' ")

if [[ ! -z $USERNAME_RESULT ]]
then
  # if username exist
  echo "$USERNAME_RESULT" | while read GAMES_PLAYED BAR BEST
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST guesses."
    
  done
else
  # if not exist
  # insert new user
  INSERT_RESULT=$($PSQL "insert into users(username,count) values('$USERNAME',0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# start game
echo "Guess the secret number between 1 and 1000:"
read INPUT

# get random nubmer
SECRET=$((1 + RANDOM % 100))

# set count = 1
COUNT=1

# check if input correct
while [[ $INPUT != $SECRET ]];
do
  # if not integer
  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read INPUT
  # if input < target
  elif [[ $INPUT -lt $SECRET ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read INPUT
  # then input > target
  elif [[ $INPUT -ge $SECRET ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    read INPUT
  fi
  # increase count by 1
  COUNT=$((COUNT+1))
done

# get the best
RESULT=$($PSQL "select count,best from users where username = '$USERNAME' ")

echo "$RESULT" | while read GAMES_PLAYED BAR BEST
do
  # update game played
  GAMES_PLAYED=$((GAMES_PLAYED+1))
  UPDATE_RESULT=$($PSQL "update users set count = $GAMES_PLAYED where username = '$USERNAME'")

  # update best
  if [[ $COUNT -lt $BEST ]]
  then
    UPDATE_RESULT=$($PSQL "update users set best = $COUNT where username = '$USERNAME'")
  fi
done


# print the stats
echo "You guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"


# we need a table with username and count
