import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }
void main() {
  final random_number = Random();
  int u_score = 0, c_score = 0, d_score = 0;
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s/q-quit) ');
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = random_number.nextInt(3);
      final aiMove = Move.values[random];
      print('You played: $playerMove');
      print('AI played: $aiMove');
      if (playerMove == aiMove) {
        print("It's a draw\n");
        d_score++;
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print("You win\n");
        u_score++;
      } else {
        print("You lose\n");
        c_score++;
      }
    } else if (input == 'q') {
      print('Your score : $u_score');
      print('AI score : $c_score');
      print('Draw : $d_score');
      break;
    } else {
      print('Invalid input\n');
    }
  }
}
