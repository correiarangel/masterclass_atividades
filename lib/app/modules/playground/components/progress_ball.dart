import 'package:flutter/material.dart';

import 'ball.dart';

class ProgressBall extends StatefulWidget {
  final bool isLoading;
  const ProgressBall({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<ProgressBall> createState() => _ProgressBallState();
}

class _ProgressBallState extends State<ProgressBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation ball0Animation;
  late Animation ball1Animation;
  late Animation ball2Animation;
  late Animation ball3Animation;

  void start() async {
    await _controller.repeat(reverse: true);
  }

  double range({
    required double begin,
    required double end,
    required double percent,
  }) {
    var value = end - begin;
    value - value * percent;
    value += begin;
    return value;
  }

  double specialRange(double x) {
    if (x < .5) {
      var value = -100 * x;
      value = value * 2;
      return value;
    } else {
      var value = -100 * (1 - x);
      value = value * 2;
      return value;
    }
  }

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 2);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      upperBound: 0.75,
    );
    ball0Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.3,
        ),
      ),
    );
    ball1Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.15,
          0.45,
        ),
      ),
    );

    ball2Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.30,
          0.60,
        ),
      ),
    );

    ball3Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.45,
          0.75,
        ),
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
    start();
  }

/*   @override
  void dispose() {
    _controller.dispose();
    if (_controller != null) _controller.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    //timeDilation = 8.0;
    return Visibility(
      visible: widget.isLoading,
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, specialRange(ball0Animation.value)),
              child: const Ball(),
            ),
            Transform.translate(
              offset: Offset(0, specialRange(ball1Animation.value)),
              child: const Ball(),
            ),
            Transform.translate(
              offset: Offset(0, specialRange(ball2Animation.value)),
              child: const Ball(),
            ),
            Transform.translate(
              offset: Offset(0, specialRange(ball3Animation.value)),
              child: const Ball(),
            ),
          ],
        ),
      ),
    );
  }
}
