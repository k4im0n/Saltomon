import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:saltomon/navigation/player_directions.dart';

import '../object/saltoman.dart';

class GamePage extends FlameGame with SingleGameInstance {

  SaltoMan saltoMan = SaltoMan();

  @override
  Color backgroundColor() => Colors.blueAccent;

  void onPlayerDirectionChanged(PlayerDirection playerDirection) {
    saltoMan.playerDirection = playerDirection;
    overlays.add('PauseMenu');
  }

  @override
  Future<void> onLoad() async {
    await add(saltoMan);
  }
}