import 'dart:io';
import 'dart:math';

import 'second_list.dart';
import 'first_list.dart';

void main() {
  //variable ــــــــــــــــــــــــــــــــــــــــــــــ
  List<List<String>> inputUserWordList = [];

  List<List<String>> inputUserWordListState = [];

  Set<String> wrongCharacter = {};

  Set<String> correctCharacter = {};

  Set<String> correctInWrong = {};

  Set<String> wordset = wordlis2.union(wordlist1);

  Random random = Random();

  RegExp alphaOnly = RegExp(r'^[a-zA-Z]+$');

  int index = random.nextInt(wordset.length);

  String targetWord = wordset.elementAt(index);

  print('Target Word: $targetWord'); // Print the target word for testing

  int turnsRemaining = 6;

  compare({String? userInputWord, String? targetWord}) {
    List<String> userInput = userInputWord!.split('');
    List<String> wordleWord = targetWord!.split('');
    List<String>? word;
//ــــــــــــــــــــــــــــــــــــــــــــــــ

    for (int i = 0; i < userInput.length; i++) {
      if (wordleWord[i] == userInput[i]) {
        correctCharacter.add(userInput[i]);
      }
      if (!correctCharacter.contains(userInput[i]) &
          (wordleWord.contains(userInput[i]))) {
        correctInWrong.add(userInput[i]);
      }
      if (!(correctCharacter.contains(userInput[i])) &
          !(correctInWrong.contains(userInput[i]))) {
        wrongCharacter.add(userInput[i]);
      }
    }

//ــــــــــــــــــــــــــــــــــــــــــــــــ
    for (var inputUser in inputUserWordList) {
      List<String> test = List.from(inputUser);
      for (var i = 0; i < test.length; i++) {
        if (wrongCharacter.contains(test[i])) {
          test[i] = 'W';
        }
        if (correctCharacter.contains(test[i]) & (test[i] == userInput[i])) {
          test[i] = 'R';
        }
        if (correctInWrong.contains(test[i]) /*&  !(test[i] == userInput[i])*/) {
          test[i] = 'G';
        }
      }
      word = test;
    }

    //ــــــــــــــــــــــــــــــــــــــــــــــــ
    inputUserWordListState.add(word!);
    print('wrong character $wrongCharacter');
    print('correct character $correctCharacter');
    print('correct character but in wrong place $correctInWrong');
    for (var element in inputUserWordList) {
      print(element);
      print(inputUserWordListState[inputUserWordList.indexOf(element)]);
    }
  }

// loop for turn
// ـــــــــــــــــــــــــــــــــــــــــــــــــــــــ

  while (turnsRemaining > 0) {
    print('Please enter a word of five letters (or Q to quit):');

    String userWord = stdin.readLineSync()!.toLowerCase();

    inputUserWordList.add(userWord.split(''));

    //quiting loop qnd end script

    if (userWord.toUpperCase() == 'q') {
      break;
    }
// to ensure its only alphabitique
    if (!alphaOnly.hasMatch(userWord)) {
      print('Please enter a valid word containing only alphabetic characters.');
      continue;
    }
// to ensure its 5 chqrqchter long
    if (userWord.length != 5) {
      print('Only words of five letters are accepted.');
      continue;
    }
// to ensure the user word is in the set
    if (!wordset.contains(userWord)) {
      print('Your word is not in the dictionary.');
      continue;
    }

    if (userWord == targetWord) {
      print('Congratulations! You guessed the target word: $targetWord');
      break;
    }
    print('ــــــــــــــــــــــــــ');
    compare(targetWord: targetWord, userInputWord: userWord);
    print('ــــــــــــــــــــــــــ');

    if (--turnsRemaining == 0) {
      print('Out of turns. The target word was: $targetWord');
      break;
    }

    print('Incorrect guess. You have $turnsRemaining turn(s) remaining.');
  }
}
