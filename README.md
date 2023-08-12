
# Wordle Game in Dart

This repository contains a Dart implementation of the popular word guessing game, Wordle. The game randomly selects a target word from a predefined set of words and challenges the player to guess the target word within a limited number of turns.

## How to Play

1. Clone or download this repository to your local machine.

2. Make sure you have Dart SDK installed. You can download it from the [Dart website](https://dart.dev/get-dart).

3. Open a terminal or command prompt and navigate to the directory containing the downloaded files.

4. Run the game by executing the following command:
   ```
   dart wordle_game.dart
   ```

5. The game will prompt you to enter a word of five letters. Each incorrect guess will deduct a turn, and you have a limited number of turns to guess the target word.

6. You can quit the game at any time by entering 'Q' or 'q'.

## Rules

- The target word is randomly selected from a predefined list of words.
- Each guess is evaluated, and feedback is given to help the player refine their guesses.
- Characters in the correct position are indicated as correct characters.
- Characters in the wrong position but present in the target word are indicated as correct characters in the wrong place.
- Characters not present in the target word are indicated as wrong characters.
- The game ends when the player correctly guesses the target word or runs out of turns.

## Code Structure

- `wordle.dart`: The main game logic and user interaction are implemented in this file.
- `first_list.dart` and `second_list.dart`: These files contain sets of words used for selecting the target word.

## Contribution

Feel free to contribute to this project by suggesting improvements, fixing bugs, or adding new features. Create a pull request with your changes, and they will be reviewed by the maintainers.

## License

This project is licensed under the [MIT License](LICENSE).

Enjoy playing Wordle in Dart!