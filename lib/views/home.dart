import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/tabuleiro.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 360,
            bottom: 15,
            child: Image.asset(
              'lib/assets/pino.png',
              width: 48,
              height: 48,
            ),
          ),
        ],
      ),
    );
  }
}
