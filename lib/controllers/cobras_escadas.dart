import 'dart:math';

class CobrasEscadas {
  Map<int, int> fromTo = {
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

  List<int> _rollDices() {
    int dice1 = Random().nextInt(6) + 1;
    int dice2 = Random().nextInt(6) + 1;

    return [dice1, dice2];
  }

  bool hasTrail(int position) {
    return fromTo.keys.contains(position);
  }

  bool hasSnake(int position) {
    return position > fromTo[position]!.toInt();
  }

  bool hasStair(int position) {
    return position < fromTo[position]!.toInt();
  }
}
