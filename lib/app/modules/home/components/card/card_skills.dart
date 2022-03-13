// יְהֹוָה my create

import 'package:flutter/material.dart';
import '../../../../shared/util/value/const_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../shared/controllers/theme_controller.dart';

import '../../home_store.dart';

// ignore: must_be_immutable
class CardASkills extends StatelessWidget {
  final HomeStore homeStore;
  final ThemeController themeController;

  const CardASkills({
    required this.themeController,
    required this.homeStore,
    Key? key,
  }) : super(key: key);

  double setPercent({
    required BuildContext context,
    required int percentWith,
  }) {
    double withPercent = MediaQuery.of(context).size.width;
    var respPercent = (withPercent / 100) * percentWith;

    return respPercent;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
          left: 18.0, right: 18.0, top: 18.0, bottom: 18.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 18.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Dart'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.8,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Java'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.4,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('HTML5'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.6,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('CCS'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.4,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('JavaSript'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.4,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Flutter'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.8,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Cordova'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.2,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Nativo'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.3,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('VSCode'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.8,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Android Std'),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(50),
                  backgroundColor: ConstColors.colorBackgroundDark,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  progressColor: ConstColors.colorPrimary,

                  lineHeight: 12.0,
                  percent: 0.7,

                  //addAutomaticKeepAlive: true,
                  // animateFromLastPercent: true,
                  width: setPercent(context: context, percentWith: 60),
                )
              ],
            ),
            const SizedBox(height: 18.0,),
          ],
        ),
      ),
    );
  }
}
