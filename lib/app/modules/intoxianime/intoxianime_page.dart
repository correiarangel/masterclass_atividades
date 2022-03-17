import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'intoxianime_store.dart';

class IntoxianimePage extends StatefulWidget {
  final String title;
  const IntoxianimePage({Key? key, this.title = 'IntoxianimePage'}) : super(key: key);
  @override
  IntoxianimePageState createState() => IntoxianimePageState();
}
class IntoxianimePageState extends State<IntoxianimePage> {
  final IntoxianimeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}