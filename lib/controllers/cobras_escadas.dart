import 'dart:math';

import 'package:escribo_teste_02/models/jogador.dart';
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

  Jogador jogador1 = Jogador(1, 0);
  Jogador jogador2 = Jogador(2, 0);

  bool endGame = false;

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
    jogar(dice1, dice2);
  }

  void hasTrail(Jogador jogadorAtual, int moveTo) {
    if (_fromTo.keys.contains(moveTo)) {
      if (moveTo > _fromTo[moveTo]!) {
        //cobra
        showMessage = true;
        messageTitle = 'Azar!';
        messageText =
            'A cobra picou você, volte para a casa ${_fromTo[moveTo]!}';
        print('Snake Move to: ${_fromTo[moveTo]!}');
        jogadorAtual.setPosition(_fromTo[moveTo]!);
      } else {
        //escada
        showMessage = true;
        messageTitle = 'Sorte!';
        messageText =
            'Você encontrou uma escada, suba para a casa ${_fromTo[moveTo]!}';
        print('Stair Move to: ${_fromTo[moveTo]!}');
        jogadorAtual.setPosition(_fromTo[moveTo]!);
      }
    }
  }

  void jogar(int dice1, int dice2) {
    int dices = dice1 + dice2;
    Jogador jogadorAtual = playingNow == 1 ? jogador1 : jogador2;
    int moveTo = jogadorAtual.getPosition() + dices;

    //Verify Player Movement
    if (moveTo > 100) {
      int afterLastSquare = moveTo - 100;
      jogadorAtual.setPosition(100 - afterLastSquare);
      print('Player $playingNow Move to: ${100 - afterLastSquare}');
      //Verify has Snake or Stair
      hasTrail(jogadorAtual, 100 - afterLastSquare);
    } else if (moveTo == 100) {
      endGame = true;
      showMessage = true;
      messageTitle = 'Vencedor!';
      messageText = 'O ${playingNow == 1 ? 'Jogador 1' : 'Jogador 2'} venceu!';
      jogadorAtual.setPosition(moveTo);
      print('Player $playingNow Move to: $moveTo');
    } else {
      jogadorAtual.setPosition(moveTo);
      print('Player $playingNow Move to: $moveTo');
      //Verify has Snake or Stair
      hasTrail(jogadorAtual, moveTo);
    }
    notifyListeners();

    playingNow = playingNow == 1 ? 2 : 1;
  }

  int getPlayerPosition(int player) {
    Jogador jogador = player == 1 ? jogador1 : jogador2;
    return jogador.getPosition();
  }

  void closeMessage() {
    showMessage = false;
    notifyListeners();
  }
}
