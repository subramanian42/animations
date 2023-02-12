import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final maxslide = 225.0;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  final myDrawer = Container(
    color: Colors.blue,
  );
  final myChild = Container(
    color: Colors.yellow,
  );

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
/*       onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd, */
      onTap: toggle,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = maxslide * animationController.value;
          double scale = 1 - (0.3 * animationController.value);
          return Stack(
            children: [
              myDrawer,
              Transform(
                transform: Matrix4.identity()
                  ..scale(scale)
                  ..translate(slide),
                alignment: Alignment.centerRight,
                child: myChild,
              ),
            ],
          );
        },
      ),
    );
  }

/*   void _onDragStart(DragStartDetails details) {
    /*   bool isDragOpenFromLeft = animationController.isDismissed && details.globalPosition.dx<minDragStartEdge;
    bool isDragCloseFromRight = animationController.isCompleted && details.globalPosition.dx<maxDragStartEdge;
 */
  }

  void _onDragUpdate(DragUpdateDetails details) {}
  void _onDragEnd(DragEndDetails details) {} */
}
