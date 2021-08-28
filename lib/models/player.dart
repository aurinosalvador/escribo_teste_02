import 'package:flutter/material.dart';

class Player {
  final int _playerId;
  int _position;
  Color _color;

  Player(this._playerId, this._position, this._color);

  int getPlayerId() {
    return _playerId;
  }

  int getPosition() => _position;

  void setPosition(int position) {
    _position = position;
  }

  Color getColor() => _color;

  void setColor(Color color) {
    _color = color;
  }
}
