/* import 'package:flutter/material.dart';
import 'package:masterclass_atividades/app/modules/cpf_generator/cpf_generator_store.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors.dart';

class FieldCPF extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final String lblText;
  final dynamic onChanged;
  //final String? Function() errorText;
  final CpfGeneratorStore store;
  final TextEditingController editTextController;

  const FieldCPF({
    required this.textInputType,
    required this.hintText,
    required this.lblText,
    required this.editTextController,
    required this.onChanged,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 18.0,
      ),
      child: TextField(
        controller: editTextController,
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(
            26.0,
            12.0,
            26.0,
            12.0,
          ),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: ConstColors.colorPrimary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          hintText: hintText,
          labelText: lblText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            //label
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ConstColors.colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
} */

import 'package:flutter/material.dart';
import '../../../shared/util/value/const_colors.dart';

class FieldCpf {
  Widget build({
    required TextInputType textInputType,
    required String hintText,
    required String lblText,
    required dynamic onChanged,
    required String? Function() errorText,
    required TextEditingController editTextController,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 18.0,
      ),
      child: TextField(
        onChanged: onChanged,
        controller: editTextController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: errorText() == 'CPF VALIDO ;)'
                ? Colors.green.shade600
                : Colors.red.shade600,
          ),
          // ignore: unnecessary_null_comparison
          errorText: errorText == null ? 'Not error' : errorText(),
          contentPadding: const EdgeInsets.fromLTRB(
            8.0,
            10.0,
            8.0,
            10.0,
          ),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: ConstColors.colorPrimary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          hintText: hintText,
          labelText: lblText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            //label
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ConstColors.colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
