import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:saltomon/navigation/player_directions.dart';

class SaltoMan extends SpriteComponent with HasGameRef {

  PlayerDirection playerDirection = PlayerDirection.none;

  SaltoMan() : super(size: Vector2.all(150.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load('SaltoMan.png');
    position = gameRef.size / 2;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position.x = size.x / 2;
  }

  void updatePosition(double dt) {
    angle += 0.01;
    switch (playerDirection) {
      case PlayerDirection.up:
        position.y --;
        break;
      case PlayerDirection.down:
        position.y ++;
        break;
      case PlayerDirection.left:
        position.x --;
        break;
      case PlayerDirection.right:
        position.x ++;
        break;
      case PlayerDirection.none:
        break;
    }
  }
}