import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Future<void> initHome() async {
    Modular.to.pushReplacementNamed('/home');
    /*await Future.delayed(const Duration(seconds: 3), () async {
      Modular.to.pushReplacementNamed('/home');
    }); */
  }

  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 80.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        if (controller.isCompleted) initHome();
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "images/logo/logo@2x.png",
            width: animation.value,
            height: animation.value,
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'flutterando',
                textAlign: TextAlign.start,
                style: TextStyle(
                  // color: ConstColors.colorHighLightDark,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Masterclass',
                  style: TextStyle(
                    // color: ConstColors.colorHighLightDark,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.start),
            ],
          ),
        ],
      ),
    );
  }
}
