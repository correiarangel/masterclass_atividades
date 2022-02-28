
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/modules/cpf_generator/cpf_generator_store.dart';

class CpfGeneratorStoreMock extends CpfGeneratorStore {}

void main() {
  final store = CpfGeneratorStoreMock();

  setUp(() {
    debugPrint("Iniciando Suite tests CpfGeneratorStore");
  });

  tearDown(() {
    debugPrint("Finalizando Suite test CpfGeneratorStore");
  });

  test('Deve retornar String com 11 caracter (changeCpf)', () async {
    var _resp = store.changeCpf('12345678912');
    expect(_resp, isA<String>());
    expect(_resp.length, 11);
  });
  test('Deve retornar String vazio (changeCpf)', () async {
    var _resp = store.changeCpf('');

    expect(_resp, isA<String>());
    expect(_resp.isEmpty, true);
  });

  test('Deve retornar bool false/true (isValid) ', () async {
    var _resp = store.isValid;
    expect(_resp, isA<bool>());
    expect(_resp, false);
  });

  test('Deve retornar String com 11 caracter ou null (validateCPF)', () async {
    var _resp = store.validateCPF();
    expect(_resp, isA<String>());
    expect(_resp!.isEmpty, false);
    expect(_resp.length > 11, true);
  });

  test('Deve retornar String com mensage (validateCpfRemdon) ', () async {
    var _resp = store.validateCpfRemdon(cpfString: '12332112321');
    expect(_resp, isA<String>());
    expect(_resp!.isEmpty, false);
    expect(_resp.length >= 11, true);
  });

  test('Deve retornar bool false (toChangesIsValidCpf) ', () async {
    var _resp = store.toChangesIsValidCpf(value: false);
    expect(_resp, isA<bool>());
    expect(_resp, false);
  });

  test('Deve retornar bool true (toChangesIsValidCpf) ', () async {
    var _resp = store.toChangesIsValidCpf(value: true);
    expect(_resp, isA<bool>());
    expect(_resp, true);
  });

  test('Deve retornar String com mensage Cpf valido (validateMaster) ',
      () async {
    var _resp = store.validateMaster(cpf: '50691575665');
    expect(_resp, isA<String>());
    expect(_resp!.isEmpty, false);
    expect(_resp.length == 13, true);
    expect(_resp, 'CPF VALIDO ;)');
  });

  test('Deve retornar String com mensage Cpf invalido (validateMaster) ',
      () async {
    var _resp = store.validateMaster(cpf: '50691575661');
    expect(_resp, isA<String>());
    expect(_resp!.isEmpty, false);
    expect(_resp.length == 14, true);
    expect(_resp, 'CPF IVALIDO :(');
  });

  test('Deve retornar bool true caso todos digitos iguais  (validateDigits) ',
      () async {
    var _resp = store.validateDigits(valueCPF: '11111111111');
    expect(_resp, isA<bool>());
    expect(_resp, true);
  });

  test('Deve retornar bool false caso digitos diferentes (validateDigits) ',
      () async {
    var _resp = store.validateDigits(valueCPF: '12345678987');
    expect(_resp, isA<bool>());
    expect(_resp, false);
  });

  test('Deve retornar int decrementValue = 10 (generateResultByDigit) ',
      () async {
    var _resp = store.generateResultByDigit(
      decrementValue: 10,
      numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7],
      value: '12345678987',
    );
    expect(_resp, isA<int>());
  });

  test('Deve retornar int decrementValue = 11 (generateResultByDigit) ',
      () async {
    var _resp = store.generateResultByDigit(
      decrementValue: 11,
      numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7],
      value: '12345678987',
    );
    expect(_resp, isA<int>());
  });

  test('Deve retornar bool false (checkDigits) ', () async {
    var digit1 = store.generateResultByDigit(
      decrementValue: 10,
      numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7],
      value: '12345678987',
    );
    var digit2 = store.generateResultByDigit(
      decrementValue: 11,
      numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7],
      value: '12345678987',
    );
    var _resp = store.checkDigits(
      digit1: digit1,
      digit2: digit2,
      value: '12345678987',
    );
    expect(_resp, isA<bool>());
    expect(_resp, false);
  });

  test('Deve retornar bool true (checkDigits) ', () async {
    var digit1 = store.generateResultByDigit(
      decrementValue: 10,
      numbers: [5, 0, 6, 9, 1, 5, 7, 5, 6, 6, 5],
      value: '50691575665',
    );
    var digit2 = store.generateResultByDigit(
      decrementValue: 11,
      numbers: [5, 0, 6, 9, 1, 5, 7, 5, 6, 6, 5],
      value: '50691575665',
    );
    var _resp = store.checkDigits(
      digit1: digit1,
      digit2: digit2,
      value: '50691575665',
    );
    expect(_resp, isA<bool>());
    expect(_resp, true);
  });

  test('Deve retornar String com 11 caracter numero Cpf (generateNumberCPF) ',
      () async {
    var _resp = store.generateNumberCPF();
    expect(_resp, isA<String>());
    expect(_resp.isEmpty, false);
    expect(_resp.length == 11, true);
  });

  test('Deve retornar String Remdon com 11 caracter numero Cpf (gerarRemdon) ',
      () async {
    var _resp = store.gerarRemdon();
    expect(_resp, isA<String>());
    expect(_resp.isEmpty, false);
    expect(_resp.length == 11, true);
  });

  test('Deve retornar String com mensage (chackMsg) ', () async {
    var _resp = store.chackMsg('CPF VALIDO ;)');
    expect(_resp, isA<String>());
    expect(_resp.isEmpty, false);
    expect(_resp.length == 13, true);
  });

  test('Deve retornar String vazia (chackMsg) ', () async {
    var _resp = store.chackMsg('');
    expect(_resp, isA<String>());
    expect(_resp.isEmpty, true);
    expect(_resp, '');
  });

  test('Deve caso msg setada "CPF IVALIDO :(" retornar bool true (checkError) ',
      () async {
    var _resp = store.checkError(msg: 'CPF IVALIDO :(');
    expect(_resp, isA<bool>());
    expect(_resp, true);
  });

  test('Deve caso msg setada "CPF IVALIDO :(" retornar bool true (checkError) ',
      () async {
    var _resp = store.checkError(msg: 'CPF IVALIDO :(');
    expect(_resp, isA<bool>());
    expect(_resp, true);
  });

  test(
      'Deve caso msg diferente "CPF IVALIDO :(" ou "CPF IVALIDO :(" '
      'retornar bool false (checkError) ', () async {
    var _resp = store.checkError(msg: '');
    expect(_resp, isA<bool>());
    expect(_resp, false);

  });
}
