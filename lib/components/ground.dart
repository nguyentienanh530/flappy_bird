import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/utils/configs.dart';
import 'package:flutter/widgets.dart';

class Ground extends ParallaxComponent with CollisionCallbacks {
  Ground() : super() {
    debugMode = Configs.debugMode;
  }
  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('base.png'),
      ],
      baseVelocity: Vector2(Configs.gameSpeed, 0),
      fill: LayerFill.none,
      alignment: Alignment.bottomCenter,
    );
    add(RectangleHitbox(
      position: Vector2(0, game.size.y - Configs.heightGround),
      size: Vector2(game.size.x, Configs.heightGround),
    ));
    return super.onLoad();
  }
}
