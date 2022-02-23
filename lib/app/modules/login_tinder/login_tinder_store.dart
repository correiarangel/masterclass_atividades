import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'components/dialog_custom.dart';

part 'login_tinder_store.g.dart';

class LoginTinderStore = _LoginTinderStoreBase with _$LoginTinderStore;

abstract class _LoginTinderStoreBase with Store {
  dailog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogCustom(
          title: 'OPS! :(',
          description: 'kkkkk tider Fake...\n #Flutterando #masterClass',
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
