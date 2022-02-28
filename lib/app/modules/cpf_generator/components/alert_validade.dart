import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../cpf_generator_store.dart';

class AlertValidade extends StatelessWidget {
  final CpfGeneratorStore store;
  const AlertValidade({
    Key? key,
    required this.store,
  }) : super(key: key);
  // 'CPF IVALIDO :(';
  // 'CPF VALIDO ;)';
  bool checkError() {
    if (store.validateCPF() == 'CPF VALIDO ;)' ||
        store.validateCPF() == 'CPF IVALIDO :(') {
      return true;
    } else   {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var msg = store.validateCPF();
    return Visibility(
      visible: checkError(),
      child: Column(
        children: <Widget>[
          msg == 'CPF VALIDO ;)'
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80.0,
                )
              : const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 80.0,
                )
        ],
      ),
    );
  }
}
