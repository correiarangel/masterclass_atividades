import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors.dart';

import '../../../shared/models/heroi_model.dart';
import 'explict_herois_card.dart';

class ListViewExplicit extends StatelessWidget {
  final List<HeroiModel>? heroiModels;

  const ListViewExplicit({Key? key, required this.heroiModels})
      : super(key: key);
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
                print('${heroi.name!}');
                return HeroiCardExplict(
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
