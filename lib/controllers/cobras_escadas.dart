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

  Jogador jogador1 = Jogador(1, 1);
  Jogador jogador2 = Jogador(2, 1);

  int _playingNow = 1;

  List<int> _rollDices() {
    int dice1 = Random().nextInt(6) + 1;
    int dice2 = Random().nextInt(6) + 1;

    return [dice1, dice2];
  }

  bool _hasTrail(int position) {
    return _fromTo.keys.contains(position);
  }

  bool _hasSnake(int position) {
    return position > _fromTo[position]!.toInt();
  }

  bool _hasStair(int position) {
    return position < _fromTo[position]!.toInt();
  }

  int playerAction() {
    List<int> dices = _rollDices();
    jogar(dices[0], dices[1]);
    print('Dados: $dices');

    return jogador1.getPosition();
  }

  void jogar(int dice1, int dice2) {
    Jogador jogadorAtual = _playingNow == 1 ? jogador1 : jogador2;
    print('Posição atual: ${jogadorAtual.getPosition()}');
    int moveTo = jogadorAtual.getPosition() + dice1 + dice2;
    print('Mover para: $moveTo');
    jogadorAtual.setPosition(moveTo);
    notifyListeners();

    if (_hasTrail(moveTo)) {
      if (_hasStair(moveTo)) {}
    }
  }
}
