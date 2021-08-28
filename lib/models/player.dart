import 'package:flutter/material.dart';

class Player {
  final int _playerId;
  int _position;
  Color _color;
  String _name;

  Player(this._playerId, this._position, this._color, this._name);

  int getPlayerId() {
    return _playerId;
  }

  int getPosition() => _position;

  void setPosition(int position) {
    _position = position;
  }

  String getName() => _name;

  void setName(String name) {
    _name = name;
  }

  Color getColor() => _color;

  void setColor(Color color) {
    _color = color;
  }
}
