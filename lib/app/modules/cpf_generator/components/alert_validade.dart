import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../cpf_generator_store.dart';

class AlertValidade extends StatelessWidget {
  final CpfGeneratorStore store;
  const AlertValidade({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Visibility(
        visible: store.isValidCpf,
        child: Column(
          children: const <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80.0,
            ),
          ],
        ),
      );
    });
  }
}
