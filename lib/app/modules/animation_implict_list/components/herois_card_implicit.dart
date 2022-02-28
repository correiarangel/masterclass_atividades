import 'package:flutter/material.dart';

import '../../../shared/util/value/const_colors.dart';

import '../controllers/state_animation.dart';

class HeroiCardImplict extends StatefulWidget {
  final String name;
  final String poder;
  final String descricao;

  const HeroiCardImplict({
    Key? key,
    required this.name,
    required this.poder,
    required this.descricao,
  }) : super(key: key);

  @override
  State<HeroiCardImplict> createState() => _HeroiCardImplictState();
}

class _HeroiCardImplictState extends State<HeroiCardImplict> {
  final  stateAnimation = StateAnimation();
  final _duration = const Duration(seconds: 3);


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: stateAnimation,
      builder: (
        context,
        child,
      ) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: stateAnimation.color,
            ),
          )),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Heroi:${widget.name}',
                  style: const TextStyle(
                    color: ConstColors.colorDescriptionDark,
                    fontSize: 18.0,
                  ),
                ),
                onTap: () {
                  stateAnimation.testRotation();
                  stateAnimation.rotation();
                },
                trailing: AnimatedRotation(
                  turns: stateAnimation.angle,
                  duration: _duration,
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Icon(
                    Icons.expand_more,
                    color: stateAnimation.isRotation
                        ? ConstColors.colorDescriptionDark
                        : ConstColors.colorPrimary,
                  ),
                ),
              ),
              AnimatedAlign(
                curve: Curves.decelerate,
                duration: _duration,
                alignment: Alignment.center,
                heightFactor: stateAnimation.isRotation ? 1 : 0,
                child: AnimatedCrossFade(
                  firstCurve: Curves.decelerate,
                  crossFadeState: stateAnimation.isRotation
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: _duration,
                  firstChild: ClipRRect(
                    child: Align(
                      heightFactor: stateAnimation.isRotation ? 1.0 : 0.0,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: FlutterLogo(
                              size: 40,
                            ),
                          ),
                          Text(
                            'Descrição: ${widget.descricao}',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  secondChild: const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
