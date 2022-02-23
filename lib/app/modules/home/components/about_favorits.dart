// יְהֹוָה my create

import 'package:flutter/material.dart';

import '../home_store.dart';
import 'horyzoltal_list.dart';

// ignore: must_be_immutable
class AboutFavorits extends StatelessWidget {
  final HomeStore homeStore;

  const AboutFavorits({
    required this.homeStore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: 18.0,
              left: 18.0,
              bottom: 8.0,
              right: 18.0,
            ),
            child: Text('Tecnologias Favoritas'),
          ),
        ),
        HorizontalList(homeStore: homeStore),
        const SizedBox(height: 18.0),
      ],
    );
  }
}
