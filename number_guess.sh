#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guess-t --no-align -c"

# ask username
echo "Enter your username:"
read USERNAME

# check username
USERNAME_RESULT=$($PSQL "")

if [[ -z USERNAME_RESULT ]]
then
  # if username exist
  echo "Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."
else
  # if not exist
  echo "Welcome, <username>! It looks like this is your first time here."
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
  if [[ $INPUT =~ ^[0-9]+$ ]]
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