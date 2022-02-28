// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpf_generator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CpfGeneratorStore on _CpfGeneratorStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_CpfGeneratorStoreBase.isValid'))
      .value;

  final _$cpftextAtom = Atom(name: '_CpfGeneratorStoreBase.cpftext');

  @override
  String? get cpftext {
    _$cpftextAtom.reportRead();
    return super.cpftext;
  }

  @override
  set cpftext(String? value) {
    _$cpftextAtom.reportWrite(value, super.cpftext, () {
      super.cpftext = value;
    });
  }

  final _$isValidCpfAtom = Atom(name: '_CpfGeneratorStoreBase.isValidCpf');

  @override
  bool get isValidCpf {
    _$isValidCpfAtom.reportRead();
    return super.isValidCpf;
  }

  @override
  set isValidCpf(bool value) {
    _$isValidCpfAtom.reportWrite(value, super.isValidCpf, () {
      super.isValidCpf = value;
    });
  }

  final _$numberCPFAtom = Atom(name: '_CpfGeneratorStoreBase.numberCPF');

  @override
  String get numberCPF {
    _$numberCPFAtom.reportRead();
    return super.numberCPF;
  }

  @override
  set numberCPF(String value) {
    _$numberCPFAtom.reportWrite(value, super.numberCPF, () {
      super.numberCPF = value;
    });
  }

  final _$_CpfGeneratorStoreBaseActionController =
      ActionController(name: '_CpfGeneratorStoreBase');

  @override
  String changeCpf(String? value) {
    final _$actionInfo = _$_CpfGeneratorStoreBaseActionController.startAction(
        name: '_CpfGeneratorStoreBase.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_CpfGeneratorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool toChangesIsValidCpf({required bool value}) {
    final _$actionInfo = _$_CpfGeneratorStoreBaseActionController.startAction(
        name: '_CpfGeneratorStoreBase.toChangesIsValidCpf');
    try {
      return super.toChangesIsValidCpf(value: value);
    } finally {
      _$_CpfGeneratorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String generateNumberCPF() {
    final _$actionInfo = _$_CpfGeneratorStoreBaseActionController.startAction(
        name: '_CpfGeneratorStoreBase.generateNumberCPF');
    try {
      return super.generateNumberCPF();
    } finally {
      _$_CpfGeneratorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpftext: ${cpftext},
isValidCpf: ${isValidCpf},
numberCPF: ${numberCPF},
isValid: ${isValid}
    ''';
  }
}
