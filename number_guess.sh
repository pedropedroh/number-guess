#!/bin/bash

# PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

get_user_info() {
  echo -e "\nEnter your username:"
  read USERNAME

  # Fetch user info
  USER_INFO=$($PSQL "SELECT user_id, COUNT(game_id) AS games_played, COALESCE(MIN(number_of_guesses), 0) AS best_game FROM users LEFT JOIN games USING(user_id) WHERE username='$USERNAME' GROUP BY user_id")

  if [[ -z $USER_INFO ]]; then
    # Username is not in the database, create a new user
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME') RETURNING user_id")
    USER_ID=$(echo $INSERT_RESULT | xargs)
    GAMES_PLAYED=0
    BEST_GAME=0
  else
    # Extract user info
    USER_ID=$(echo $USER_INFO | awk -F'|' '{print $1}')
    GAMES_PLAYED=$(echo $USER_INFO | awk -F'|' '{print $2}')
    BEST_GAME=$(echo $USER_INFO | awk -F'|' '{print $3}')
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took ${BEST_GAME} guesses."
  fi
}

# Function to start the game
start_game() {
  SECRET_NUMBER=$((RANDOM % 1000 + 1))
  NUMBER_OF_GUESSES=0

  echo "Guess the secret number between 1 and 1000:"

  while true; do
    read GUESS

    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi

    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

    if [[ $GUESS -lt $SECRET_NUMBER ]]; then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
      echo "It's lower than that, guess again:"
    else
      break
    fi
  done

  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  # Update user stats
  update_user_stats
}

# Function to update user stats in the database
update_user_stats() {
  # Insert game record and capture the new game_id
  INSERT_RESULT=$($PSQL "INSERT INTO games (user_id, secret_number, number_of_guesses) VALUES ($USER_ID, $SECRET_NUMBER, $NUMBER_OF_GUESSES) RETURNING game_id")
  GAME_ID=$(echo $INSERT_RESULT | xargs)  # Get the new game_id
  
  # Fetch current stats
  CURRENT_STATS=$($PSQL "SELECT games_played, best_game FROM users WHERE user_id=$USER_ID")
  CURRENT_GAMES_PLAYED=$(echo $CURRENT_STATS | awk -F'|' '{print $1}')
  CURRENT_BEST_GAME=$(echo $CURRENT_STATS | awk -F'|' '{print $2}')

  # Check if CURRENT_STATS are valid
  if [[ -z $CURRENT_GAMES_PLAYED ]]; then
    CURRENT_GAMES_PLAYED=0
  fi
  if [[ -z $CURRENT_BEST_GAME ]]; then
    CURRENT_BEST_GAME=0
  fi
  
  # Increment games_played
  NEW_GAMES_PLAYED=$((CURRENT_GAMES_PLAYED + 1))
  
  # Determine new best_game
  if [[ $CURRENT_BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $CURRENT_BEST_GAME ]]; then
    NEW_BEST_GAME=$NUMBER_OF_GUESSES
  else
    NEW_BEST_GAME=$CURRENT_BEST_GAME
  fi

  # Update user stats
  $PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST_GAME WHERE user_id=$USER_ID"
}

# Main script logic
get_user_info
start_game
