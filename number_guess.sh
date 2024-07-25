#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
PLAY_GAME() {
  read GUESS
  #if guess not an integer
  if [[ ! $GUESS =~ ^[1-9][0-9]*$ ]]
  then
    #print prompt
    echo "That is not an integer, guess again:"
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    #make them guess again.
    PLAY_GAME
  #if guess higher than secret number.
  elif [[ $GUESS > $SECRET_NUMBER ]]
  then
    #print prompt
    echo "It's lower than that, guess again:"
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    #make them guess again.
    PLAY_GAME 
  #if guess lower than secret number.
  elif [[ $GUESS < $SECRET_NUMBER ]]
  then
    #print prompt
    echo "It's higher than that, guess again:"
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    #make them guess again.
    PLAY_GAME 
  #if guess equals secret number
  elif [[ $GUESS == $SECRET_NUMBER ]]
  then
    #print prompt
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    #log results to games table
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(num_moves, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID)")
  fi
}

#ask for username
echo "Enter your username:"
read USERNAME

#get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
#if not found
if [[ -z $USER_ID ]]
then
  #print appropriate prompt
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #add user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  #get new user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  #otherwise, fetch stats
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(num_moves) FROM games WHERE user_id=$USER_ID")
  #welcome them back with their stats.
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#create a secret number
SECRET_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
NUMBER_OF_GUESSES=0
#ask to guess a number between 1 and 1000:
echo "Guess the secret number between 1 and 1000:"
#Start game logic
PLAY_GAME
