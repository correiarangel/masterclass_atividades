import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class ContainerPercent extends StatelessWidget {
  final double width;
  const ContainerPercent({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff055aa3),
            borderRadius: BorderRadius.circular(25.0),
          boxShadow:const <BoxShadow>[ BoxShadow(
            color: ConstColors.colorBackgroundDark,
            offset: Offset(80.0,0.0),
          )]
          ),
          
          height: 12.0,
          width: width,
        ),
      ],
    );
  }
}
