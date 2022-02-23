import 'package:flutter/material.dart';

import 'herois_card_implicit.dart';

import '../../../shared/models/heroi_model.dart';

class ListViewImplicit extends StatelessWidget {
  final List<HeroiModel>? heroiModels;

  const ListViewImplicit({
    Key? key,
    required this.heroiModels,
  }) : super(key: key);

  bool testListHeroi() {
    if (heroiModels == null || heroiModels!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return testListHeroi()
        ? Expanded(
            child: ListView.builder(
              itemCount: heroiModels!.length,
              itemBuilder: (context, index) {
                HeroiModel heroi = heroiModels![index];
              
                return HeroiCardImplict(
                  name: heroi.name!,
                  poder: heroi.poder!,
                  descricao: heroi.descricao!,
                );
              },
            ),
          )
        : const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
