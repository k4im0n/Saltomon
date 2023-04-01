import 'package:flutter/material.dart';
import 'package:saltomon/navigation/player_directions.dart';

class Navigation extends StatelessWidget {
  final ValueChanged<PlayerDirection>? onPlayerDirectionChanged;

  const Navigation({super.key, required this.onPlayerDirectionChanged});

  void updateDirection(PlayerDirection playerDirection) {
    onPlayerDirectionChanged!(playerDirection);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 1;
        if (details.delta.dy > sensitivity) {
          updateDirection(PlayerDirection.down);
        } else if (details.delta.dy < -sensitivity) {
          updateDirection(PlayerDirection.up);
        } else {
          updateDirection(PlayerDirection.none);
        }
      },
    );
  }
}
