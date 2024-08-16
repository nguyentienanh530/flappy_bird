import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flutter/material.dart';

import 'components/background.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasCollisionDetection, TapDetector {
  late Bird bird;
  @override
  FutureOr<void> onLoad() {
    add(Background());
    add(Ground());
    add(bird = Bird());
    return super.onLoad();
  }

  @override
  void onTap() {
    bird.addFly();
    super.onTap();
  }
}
