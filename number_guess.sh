#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ask username
echo "Enter your username:"
read USERNAME

# check username
USERNAME_RESULT=$($PSQL "select * from users where username = '$USERNAME' ")

if [[ ! -z $USERNAME_RESULT ]]
then
  # if username exist
  echo "$USERNAME_RESULT" | while read USERNAME BAR GAMES_PLAYED BAR BEST
  do
    # update game played
    GAMES_PLAYED=$(($GAMES_PLAYED+1))
    UPDATE_RESULT=$($PSQL "update users set count = $GAMES_PLAYED")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took <best_game> guesses."
  done
else
  # if not exist
  # insert new user
  INSERT_RESULT=$($PSQL "insert into users(username,count) values('$USERNAME',1)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# start game
echo "Guess the secret number between 1 and 1000:"
read INPUT

# get random nubmer
SECRET=$((1 + RANDOM % 100))
echo "$SECRET"

# set count = 1
COUNT=1

# check if input correct
while [[ $INPUT != $SECRET ]];
do
  # if not integer
  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read INPUT
  # if input < target
  elif [[ $INPUT < $SECRET ]]
  then
    echo "It's lower than that, guess again:"
    read INPUT
  # then input > target
  else
    echo "It's higher than that, guess again:"
    read INPUT
  fi

  # increase count by 1
  COUNT=$((COUNT+1))
done

# get the answer
echo "You guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"


# we need a table with username and count