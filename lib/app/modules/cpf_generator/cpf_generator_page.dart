import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/controllers/theme_controller.dart';
import 'components/field_cpf.dart';
import 'cpf_generator_store.dart';

class CpfGeneratorPage extends StatefulWidget {
  const CpfGeneratorPage({Key? key}) : super(key: key);
  @override
  CpfGeneratorPageState createState() => CpfGeneratorPageState();
}

class CpfGeneratorPageState extends State<CpfGeneratorPage> {
  final CpfGeneratorStore store = Modular.get();
  final ThemeController themeController = Modular.get();

  final field = FieldCpf();
  var textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _with = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 42.0,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Observer(
            builder: (context) {
              return IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.moon,
                  color: themeController.setColor(),
                ),
                onPressed: () async {
                  themeController.toChangesTheme();
                },
              );
            },
          )
        ],
        title: const Text(
          'Validador Gerador CPF',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 28.0),
          Observer(
            builder: (context) {
              return Visibility(
                visible: store.checkError(msg: store.validateCPF()!),
                child: Column(
                  children: <Widget>[
                    store.msg == 'CPF VALIDO ;)'
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
            },
          ),
          const SizedBox(height: 18.0),
          Observer(
            builder: (context) {
              if (store.cpftext != null && store.cpftext!.length == 11) {
                textEditController.text = store.cpftext!;
              }
              return field.build(
                onChanged: store.changeCpf,
                editTextController: textEditController,
                textInputType: TextInputType.number,
                hintText: 'CPF somente numeros',
                lblText: 'CPF:',
                errorText: store.validateCPF,
              );
            },
          ),
          const SizedBox(height: 28.0),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(9.0),
              padding: MaterialStateProperty.all(
                EdgeInsets.fromLTRB(
                  _with,
                  14.0,
                  _with,
                  14.0,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            onPressed: () {
              store.generateNumberCPF();
            },
            child: const Text(
              'GERAR CPF',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(
            height: 38.0,
          ),
          ElevatedButton.icon(
            label: const Text(
              'LIMPAR',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            icon: const Icon(Icons.delete_forever),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(9.0),
              padding: MaterialStateProperty.all(
                EdgeInsets.fromLTRB(
                  _with,
                  14.0,
                  _with,
                  14.0,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            onPressed: () {
              store.toChangesIsValidCpf(value: false);
              textEditController.clear();
              store.changeCpf('');
              store.chackMsg('');
            },
          ),
        ],
      ),
    );
  }
}
