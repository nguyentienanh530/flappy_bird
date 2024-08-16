import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../utils/configs.dart';

class Pipe extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final bool isTop;
  @override
  final double height;

  Pipe({required this.isTop, required this.height}) : super() {
    debugMode = Configs.debugMode;
  }

  @override
  FutureOr<void> onLoad() async {
    var pipe = await Flame.images.load('pipe-green.png');
    size = Vector2(52, height);
    if (isTop) {
      position = Vector2(game.size.x, 0);
      sprite = Sprite(pipe);
    } else {
      position = Vector2(game.size.x, game.size.y - Configs.heightGround);
      sprite = Sprite(pipe);
    }
    add(RectangleHitbox());
    return super.onLoad();
  }
}
