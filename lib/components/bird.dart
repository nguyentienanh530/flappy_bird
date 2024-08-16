import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/utils/configs.dart';

class Bird extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  var birdSpeed = 0.0;
  Bird() : super() {
    debugMode = Configs.debugMode;
  }

  @override
  FutureOr<void> onLoad() async {
    List<Sprite> sprites = [
      await Sprite.load('bluebird-downflap.png'),
      await Sprite.load('bluebird-midflap.png'),
      await Sprite.load('bluebird-upflap.png'),
    ];

    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.1, loop: true);
    size = Vector2(Configs.birdSizeWidth, Configs.birdSizeHeight);
    position = Vector2(70, game.size.y / 2 - Configs.heightGround);
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    addGravity(dt);
    super.update(dt);
  }

  void addGravity(double dt) {
    birdSpeed += Configs.gravity * dt;
    position = Vector2(position.x, position.y + birdSpeed * dt);
    anchor = Anchor.center;
    angle = clampDouble(birdSpeed / 180, -pi * 0.25, pi * 0.25);
  }

  void addFly() {
    birdSpeed = -Configs.jumpForce;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ground) {
      print('game over');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
