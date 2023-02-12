import 'package:animations/custom%20paint/shape_painter.dart';
import 'package:flutter/material.dart';

class TemperatureControl extends StatelessWidget {
  const TemperatureControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          height: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Color(0xffa0826a),
              ),
              SizedBox(
                width: 275,
                height: 275,
                child: CustomPaint(
                  painter: ShapePainter(),
                ),
              ),
              const Icon(
                Icons.remove,
                color: Color(0xffa0826a),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
