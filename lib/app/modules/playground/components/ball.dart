import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';


class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 25.0,
      decoration: BoxDecoration(
        color: ConstColors.colorPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
