import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../playground_store.dart';
import '../../../shared/util/value/const_colors.dart';


class ButtonAnimat extends StatefulWidget {
  final PlaygroundStore groundStore;
  final String text;
  final double fontSize;
  final String router;
  final Color colorButton;

  const ButtonAnimat({
    Key? key,
    required this.groundStore,
    required this.fontSize,
    required this.colorButton,
    required this.text,
    required this.router,
  }) : super(key: key);

  @override
  State<ButtonAnimat> createState() => _ButtonAnimatState();
}

class _ButtonAnimatState extends State<ButtonAnimat>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation ovalAnimation;
  late Animation colorAnimation;
  late Animation textOpacityAnimation;
  late Animation loadingOpacityAnimation;

  void start() async {
    widget.groundStore.toChangesIsloading();
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // upperBound: 0.75,
    );
    sizeAnimation = Tween<double>(begin: 280, end: 50).animate(
      CurvedAnimation(
        parent: animationController,
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

    ovalAnimation = Tween<double>(begin: 25, end: 100).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
    loadingOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          1.0,
          curve: Curves.bounceInOut,
        ),
      ),
    );
    textOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );
    colorAnimation = ColorTween(
      begin: ConstColors.colorPrimary,
      end: ConstColors.colorCardLight,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.5, curve: Curves.bounceInOut),
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //timeDilation = 8.0;
    return GestureDetector(
      onTap: () async {
        start();
        await Future.delayed(const Duration(milliseconds: 2500), () async {
          start();
          Modular.to.pushNamed(widget.router);
        });
      },
      child: Center(
        child: Container(
          width: sizeAnimation.value,
          height: 48,
          decoration: BoxDecoration(
            color: widget.colorButton,
            borderRadius: BorderRadius.circular(ovalAnimation.value),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Opacity(
                  opacity: textOpacityAnimation.value,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Opacity(
                  opacity: loadingOpacityAnimation.value,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
