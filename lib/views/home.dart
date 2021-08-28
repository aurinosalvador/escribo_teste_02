import 'dart:math';

import 'package:escribo_teste_02/controllers/cobras_escadas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<int, Point> squares = {
    0: const Point(-56, 5),
    1: const Point(0, 5),
    2: const Point(56, 5),
    3: const Point(112, 5),
    4: const Point(168, 5),
    5: const Point(224, 5),
    6: const Point(280, 5),
    7: const Point(336, 5),
    8: const Point(392, 5),
    9: const Point(448, 5),
    10: const Point(504, 5),
    11: const Point(504, 61),
    12: const Point(448, 61),
    13: const Point(392, 61),
    14: const Point(336, 61),
    15: const Point(280, 61),
    16: const Point(224, 61),
    17: const Point(168, 61),
    18: const Point(112, 61),
    19: const Point(56, 61),
    20: const Point(0, 61),
    21: const Point(0, 117),
    22: const Point(56, 117),
    23: const Point(112, 117),
    24: const Point(168, 117),
    25: const Point(224, 117),
    26: const Point(280, 117),
    27: const Point(336, 117),
    28: const Point(392, 117),
    29: const Point(448, 117),
    30: const Point(504, 117),
    31: const Point(504, 173),
    32: const Point(448, 173),
    33: const Point(392, 173),
    34: const Point(336, 173),
    35: const Point(280, 173),
    36: const Point(224, 173),
    37: const Point(168, 173),
    38: const Point(112, 173),
    39: const Point(56, 173),
    40: const Point(0, 173),
    41: const Point(0, 229),
    42: const Point(56, 229),
    43: const Point(112, 229),
    44: const Point(168, 229),
    45: const Point(224, 229),
    46: const Point(280, 229),
    47: const Point(336, 229),
    48: const Point(392, 229),
    49: const Point(448, 229),
    50: const Point(504, 229),
    51: const Point(504, 285),
    52: const Point(448, 285),
    53: const Point(392, 285),
    54: const Point(336, 285),
    55: const Point(280, 285),
    56: const Point(224, 285),
    57: const Point(168, 285),
    58: const Point(112, 285),
    59: const Point(56, 285),
    60: const Point(0, 285),
    61: const Point(0, 341),
    62: const Point(56, 341),
    63: const Point(112, 341),
    64: const Point(168, 341),
    65: const Point(224, 341),
    66: const Point(280, 341),
    67: const Point(336, 341),
    68: const Point(392, 341),
    69: const Point(448, 341),
    70: const Point(504, 341),
    71: const Point(504, 397),
    72: const Point(448, 397),
    73: const Point(392, 397),
    74: const Point(336, 397),
    75: const Point(280, 397),
    76: const Point(224, 397),
    77: const Point(168, 397),
    78: const Point(112, 397),
    79: const Point(56, 397),
    80: const Point(0, 397),
    81: const Point(0, 453),
    82: const Point(56, 453),
    83: const Point(112, 453),
    84: const Point(168, 453),
    85: const Point(224, 453),
    86: const Point(280, 453),
    87: const Point(336, 453),
    88: const Point(392, 453),
    89: const Point(448, 453),
    90: const Point(504, 453),
    91: const Point(504, 509),
    92: const Point(448, 509),
    93: const Point(392, 509),
    94: const Point(336, 509),
    95: const Point(280, 509),
    96: const Point(224, 509),
    97: const Point(168, 509),
    98: const Point(112, 509),
    99: const Point(56, 509),
    100: const Point(0, 509),
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<CobrasEscadas>(
      builder: (context, provider, _) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey,
            child: Column(
              children: [
                Text(
                  provider.playingNow == 1 ? 'Jogador 1' : 'Jogador 2',
                  style: GoogleFonts.lobster(),
                ),
                Text(
                  'Dados: ${provider.dice1} + ${provider.dice2} = '
                  '${provider.dice1 + provider.dice2}',
                ),

                ///Tabuleiro
                Expanded(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 68.0,
                        vertical: 8.0,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          ///Tabuleiro casa = 58 x 58
                          Image.asset(
                              'assets/tabuleiro.png'), // todo: alterar lugar

                          ///Jogador 1
                          AnimatedPositioned(
                            // curve: Curves.easeIn,
                            left: squares[provider.getPlayerPosition(1)]!
                                .x
                                .toDouble(),
                            bottom: squares[provider.getPlayerPosition(1)]!
                                .y
                                .toDouble(),
                            duration: const Duration(milliseconds: 500),
                            child: SvgPicture.asset(
                              'assets/pin.svg',
                              color: Colors.deepPurple,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),

                          ///Jogador 2
                          AnimatedPositioned(
                            // curve: Curves.easeIn,
                            left: squares[provider.getPlayerPosition(2)]!
                                    .x
                                    .toDouble() +
                                30.0,
                            bottom: squares[provider.getPlayerPosition(2)]!
                                .y
                                .toDouble(),
                            duration: const Duration(milliseconds: 500),
                            child: SvgPicture.asset(
                              'assets/pin.svg',
                              // color: provider.,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                if (provider.showMessage)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: AlertDialog(
                      title: Text(provider.messageTitle),
                      content: Text(provider.messageText),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => provider.closeMessage(),
                          child: const Text(
                            'Fechar',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                /// Ações
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          provider.playerAction();
                        },
                        child: const Text('Jogar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
