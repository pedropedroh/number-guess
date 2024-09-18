# Number Guessing Game

Welcome to the Number Guessing Game! This project allows users to guess a randomly generated number between 1 and 1000. The game tracks user statistics, such as the number of games played and the best score.

## Overview

This script uses Bash and interacts with a PostgreSQL database to manage user data and game results. Users can register with a username, and their guessing statistics will be saved for future sessions.

## Files

### `number_guess.sh`

This is the main script for the game. It includes:

- User registration and login.
- Random number generation for the game.
- Input validation for user guesses.
- Database queries to store and retrieve user statistics.
