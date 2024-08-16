import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/utils/configs.dart';

class Background extends ParallaxComponent {
  Background();
  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax([
      ParallaxImageData('background-day.png'),
    ], baseVelocity: Vector2(Configs.gameSpeed / 5, 0));
    return super.onLoad();
  }
}
