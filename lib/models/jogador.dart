class Jogador {
  int playerId;
  int position;

  Jogador(this.playerId, this.position);

  int getPosition() {
    return position;
  }

  void setPosition(int position) {
    this.position = position;
  }

  int getPlayerId() {
    return playerId;
  }
}
