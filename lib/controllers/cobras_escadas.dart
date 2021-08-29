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

  int winnerPlayer = 0;
  int playingNow = 1;

  bool rolling = false;
  int dice1 = 0;
  int dice2 = 0;

  bool isPlaying = false;

  Future<void> _rollDices() async {
    if (!isPlaying && winnerPlayer == 0) {
      rolling = true;
      notifyListeners();

      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;

      await Future.delayed(const Duration(milliseconds: 2000));

      rolling = false;
      notifyListeners();
    }
  }

  Future<void> playerAction() async {
    await _rollDices();
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
        closeMessageTimed();
        // print('Snake Move to: $moveTo');
      } else {
        //escada
        messageTitle = 'Sorte!';
        messageText = 'Você encontrou uma escada, suba para a casa $moveTo';
        closeMessageTimed();
        // print('Ladder Move to: $moveTo');
      }
      actualPlayer.setPosition(moveTo);
    }
  }

  void play(int dice1, int dice2) async {
    int dices = dice1 + dice2;
    if (dice1 == dice2) {
      showMessage = true;
      messageTitle = 'Sorte!';
      messageText = 'Dados iguais, você ganhou uma nova jogada!';
      closeMessageTimed();
    }
    Player actualPlayer = playingNow == 1 ? jogador1 : jogador2;
    int actualPosition = actualPlayer.getPosition();
    int moveTo = actualPosition + dices;
    if (!isPlaying) {
      if (winnerPlayer == 0) {
        //Verify Player Movement
        if (moveTo > 100) {
          int afterLastSquare = moveTo - 100;
          print('moveTo: ${100 - afterLastSquare}');
          await movePlayer(actualPlayer, 100 - afterLastSquare, true);
        } else if (moveTo == 100) {
          await movePlayer(actualPlayer, moveTo, false);
          winnerPlayer = playingNow;
          showMessage = true;
          messageTitle = 'Vencedor!';
          messageText =
              'O ${playingNow == 1 ? 'Jogador 1' : 'Jogador 2'} venceu!';
          closeMessageTimed();
        } else {
          await movePlayer(actualPlayer, moveTo, false);
        }

        hasSnakeOrLadder(actualPlayer);

        if (dice1 != dice2) {
          playingNow = playingNow == 1 ? 2 : 1;
        }
      } else {
        showMessage = true;
        messageTitle = 'O jogo acabou!';
        messageText = 'Deseja jogar novamente?';
      }
    } else {
      showMessage = true;
      messageTitle = 'Aguarde!';
      messageText =
          'O ${playingNow == 1 ? 'Jogador 1' : 'Jogador 2'} está na casa ${moveTo}!';
      closeMessageTimed();
    }

    notifyListeners();
  }

  Future<void> movePlayer(Player player, int to, bool afterLast) async {
    isPlaying = true;
    if (afterLast) {
      for (int i = player.getPosition(); i <= 100; i++) {
        player.setPosition(i);
        notifyListeners();
        await Future.delayed(Duration(milliseconds: i == 100 ? 100 : 800));
      }
      for (int i = 100; i >= to; i--) {
        player.setPosition(i);
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 800));
      }
    } else {
      for (int i = player.getPosition(); i <= to; i++) {
        player.setPosition(i);
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    isPlaying = false;
  }

  Color getButtonColor() {
    return playingNow == 1 ? jogador1.getColor() : jogador2.getColor();
  }

  void closeMessage() {
    showMessage = false;
    notifyListeners();
  }

  void closeMessageTimed() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      closeMessage();
    });
  }

  void reset() {
    jogador1.setPosition(0);
    jogador2.setPosition(0);

    isPlaying = false;

    showMessage = false;
    messageTitle = '';
    messageText = '';

    winnerPlayer = 0;
    playingNow = 1;
    dice1 = 0;
    dice2 = 0;

    notifyListeners();
  }
}
