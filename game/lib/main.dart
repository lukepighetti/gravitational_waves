import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() async {
  Flame.initializeWidget();

  Flame.audio.disableLog();
  await Flame.util.setLandscape();
  Size size = await Flame.util.initialDimensions();

  MyGame game = MyGame(size);

  runApp(MaterialApp(
    routes: {
      '/': (BuildContext ctx) => Scaffold(
              body: WillPopScope(
            onWillPop: () async {
              game.pause();
              return false;
            },
            child: game.widget,
          )),
    },
  ));
}
