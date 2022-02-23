import 'dart:io';

import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/modules/home/home_store.dart';

class HorizontalList extends StatelessWidget {
  final HomeStore homeStore;
  const HorizontalList({Key? key, required this.homeStore}) : super(key: key);
 double setHeight(context) {
    if (Platform.isAndroid || Platform.isIOS) {
     return MediaQuery.of(context).size.height / 7;
    }else{
      return MediaQuery.of(context).size.height / 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    var list = homeStore.fillListHoriz();
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0,
      ),
      height: setHeight(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 38.0,
                    right: 38.0,
                  ),
                  child: Image.network(
                    list[index].imgUrl,
                    width: 42.0,
                    height: 42.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    list[index].name,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
