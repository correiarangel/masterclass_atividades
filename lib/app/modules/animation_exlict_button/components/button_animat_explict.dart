import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

import '../animation_exlict_button_store.dart';





class ButtonAnimatExplict extends StatefulWidget {
  final AnimationExplictButtonStore store;
  final Color colorButton;

  const ButtonAnimatExplict({
    Key? key,
    required this.store,
    required this.colorButton,
  }) : super(key: key);

  @override
  State<ButtonAnimatExplict> createState() => _ButtonAnimatExplictState();
}

class _ButtonAnimatExplictState extends State<ButtonAnimatExplict>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation sizeAnimation;
  late Animation ovalAnimation;
  late Animation colorAnimation;
  late Animation topAnimation;
  late Animation leftAnimation;

  void start() async {
    widget.store.toChangesIsloading();
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // upperBound: 0.75,
    );
    sizeAnimation = Tween<double>(begin: 50, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        reverseCurve: const Interval(
          0.0,
          0.2,
          curve: Curves.decelerate,
        ),
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.decelerate,
        ),
      ),
    );

    ovalAnimation = Tween<double>(begin: 100, end: 8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
    topAnimation = Tween<double>(begin: 550.0, end: 18.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );
    leftAnimation = Tween<double>(begin: 300.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          0.3,
          curve: Curves.decelerate,
        ),
      ),
    );

    colorAnimation = ColorTween(
      begin: ConstColors.colorPrimary,
      end: ConstColors.colorDescriptionDark,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.decelerate),
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    
    //timeDilation = 8.0;
    return Padding(
      padding: EdgeInsets.only(
        top: topAnimation.value,
        left: leftAnimation.value,
      ),
      child: GestureDetector(
        onTap: () async {
          start();
        },
        child: Container(
          width: sizeAnimation.value,
          height: 48,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(
              ovalAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
