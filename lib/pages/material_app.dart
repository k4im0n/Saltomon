import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:saltomon/pages/game_page.dart';
import 'package:saltomon/pages/pause_menu.dart';

import '../navigation/navigation.dart';

class MyMaterialApp extends StatelessWidget {

  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    GamePage game = GamePage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget<GamePage>(
              game: game,
              initialActiveOverlays: const [
                'PauseMenu'
              ],
              overlayBuilderMap: {
                'PauseMenu': (context, game) {
                  return PauseMenu(game: game,);
                }
              },
            ),
            Navigation(onPlayerDirectionChanged: game.onPlayerDirectionChanged,)
          ],
        ),
      ),
    );
  }
}
