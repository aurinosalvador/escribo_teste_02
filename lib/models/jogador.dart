class Jogador {
  final int _playerId;
  int _position;

  Jogador(this._playerId, this._position);

  int getPosition() {
    return _position;
  }

  void setPosition(int position) {
    _position = position;
  }

  int getPlayerId() {
    return _playerId;
  }
}
