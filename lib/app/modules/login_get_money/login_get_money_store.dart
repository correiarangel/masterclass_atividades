import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'components/dialog_custom.dart';

part 'login_get_money_store.g.dart';

class LoginGetMoneyStore = _LoginGetMoneyStoreBase with _$LoginGetMoneyStore;

abstract class _LoginGetMoneyStoreBase with Store {
  dailog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogCustom(
          title: 'OPS! :(',
          description: 'App Fake Seu Dinheiro não esta aqui rssrrss\n'
              'Turma 2: #flutter #Flutterando #MasterClass',
          top: 50.0,
          bottom: 20.0,
          left: 18.0,
          right: 18.0,
          radius: 8.0,
          // ignore: unnecessary_lambdas
        );
      },
    );
  }
}
