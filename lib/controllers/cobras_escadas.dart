import 'dart:math';

import 'package:escribo_teste_02/models/player.dart';
import 'package:flutter/material.dart';

class CobrasEscadas with ChangeNotifier {
  final Map<int, int> _fromTo = {
    2: 38,
    7: 14,
    8: 31,
    15: 26,
    16: 6,
    21: 42,
    28: 84,
    36: 44,
    46: 25,
    49: 11,
    51: 67,
    62: 19,
    64: 60,
    71: 91,
    74: 53,
    78: 98,
    87: 94,
    89: 68,
    92: 88,
    95: 75,
    99: 80,
  };

  Player jogador1 = Player(1, 0, Colors.deepPurple);
  Player jogador2 = Player(2, 0, Colors.deepOrange);

  bool showMessage = false;
  String messageTitle = '';
  String messageText = '';

  int playingNow = 1;
  int dice1 = 0;
  int dice2 = 0;

  void _rollDices() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
  }

  void playerAction() {
    _rollDices();
    play(dice1, dice2);
  }

  void hasSnakeOrLadder(Player actualPlayer) {
    int position = actualPlayer.getPosition();
    if (_fromTo.keys.contains(position)) {
      int moveTo = _fromTo[position]!;
      showMessage = true;
      if (position > moveTo) {
        //cobra
        messageTitle = 'Azar!';
        messageText = 'A cobra picou você, volte para a casa $moveTo';
        print('Snake Move to: $moveTo');
      } else {
        //escada
        messageTitle = 'Sorte!';
        messageText = 'Você encontrou uma escada, suba para a casa $moveTo';
        print('Ladder Move to: $moveTo');
      }
      actualPlayer.setPosition(moveTo);
    }
  }

  void play(int dice1, int dice2) async {
    int dices = dice1 + dice2;
    Player actualPlayer = playingNow == 1 ? jogador1 : jogador2;
    int actualPosition = actualPlayer.getPosition();
    int moveTo = actualPosition + dices;

    //Verify Player Movement
    if (moveTo > 100) {
      int afterLastSquare = moveTo - 100;
      // actualPlayer.setPosition(100 - afterLastSquare);
      await movePlayer(actualPlayer, 100 - afterLastSquare);
      print('Player $playingNow Move to: ${100 - afterLastSquare}');
      //Verify has Snake or Stair
      // hasSnakeOrLadder(actualPlayer);
    } else if (moveTo == 100) {
      showMessage = true;
      messageTitle = 'Vencedor!';
      messageText = 'O ${playingNow == 1 ? 'Jogador 1' : 'Jogador 2'} venceu!';
      // actualPlayer.setPosition(moveTo);
      await movePlayer(actualPlayer, moveTo);
      print('Player $playingNow Move to: $moveTo');
    } else {
      // actualPlayer.setPosition(moveTo);
      await movePlayer(actualPlayer, moveTo);
      print('Player $playingNow Move to: $moveTo');
      //Verify has Snake or Stair
      // hasSnakeOrLadder(actualPlayer);
    }

    hasSnakeOrLadder(actualPlayer);

    if (dice1 != dice2) {
      playingNow = playingNow == 1 ? 2 : 1;
    } else {
      showMessage = true;
      messageTitle = 'Sorte!';
      messageText = 'Dados iguais, jogue novamente!';
    }

    notifyListeners();
  }

  Future<void> movePlayer(Player player, int to) async {
    for (int i = player.getPosition(); i <= to; i++) {
      player.setPosition(i);
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 600));
    }
  }

  Color getButtonColor() {
    return playingNow == 1 ? jogador1.getColor() : jogador2.getColor();
  }

  void closeMessage() {
    showMessage = false;
    notifyListeners();
  }
}
