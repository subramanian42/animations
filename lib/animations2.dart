import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipMenu extends StatefulWidget {
  const FlipMenu({Key? key}) : super(key: key);

  @override
  _FlipMenuState createState() => _FlipMenuState();
}

class _FlipMenuState extends State<FlipMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final maxSlide = 225;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();
  @override
  Widget build(BuildContext context) {
    final myDrawer = Container(
      width: 225,
      color: Colors.blue,
    );
    final myChild = Container(
      color: Colors.yellow,
    );
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(maxSlide * (_animationController.value - 1), 0),
                child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - _animationController.value)),
                    alignment: Alignment.centerRight,
                    child: myDrawer),
              ),
              Transform.translate(
                offset: Offset(maxSlide * _animationController.value, 0),
                child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * _animationController.value),
                    alignment: Alignment.centerLeft,
                    child: myChild),
              ),
            ],
          );
        },
      ),
    );
  }
}
