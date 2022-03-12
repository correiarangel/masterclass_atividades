import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:masterclass_atividades/app/modules/cpf_generator/cpf_generator_store.dart';

class CpfGeneratorStoreMock extends Mock implements CpfGeneratorStore {}

void main() {
  final store = CpfGeneratorStoreMock();

  setUpAll(() {
    debugPrint("Iniciando Suite tests CpfGeneratorStore");
  });
  setUp(() {
    debugPrint("Iniciando Suite tests ");
  });

  tearDown(() {
    debugPrint("Finalizando Suite test ");
  });
  tearDownAll(() {
    debugPrint("Finalizando Suite test CpfGeneratorStore");
  });
  group('Caminho Feliz ;]', () {
    test('Deve retornar String (changeCpf)', () async {
      when(
        () => store.changeCpf(cpf),
      ).thenReturn(cpf);

      expect(cpf, isA<String>());
      expect(cpf.length, 11);
    });
    test('Deve retornar String vazio (changeCpf)', () async {
      var _resp = '';
      when(() => store.changeCpf(_resp)).thenReturn(_resp);

      expect(_resp, isA<String>());
      expect(_resp.isEmpty, true);
    });
    test('Deve retornar true (isValid) ', () async {
      var _resp = true;
      when(() => store.isValid).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, true);
    });

    test('Deve retornar String com 11 caracter (validateCPF)', () async {
      var _resp = cpf;

      when(() => store.validateCPF()).thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp.length, 11);
    });

    test('Deve retornar String com mensage CPF VALIDO ;) ', () async {
      var _resp = cpfValidMsg;
      when(() => store.validateCpfRemdon(cpfString: cpfValid))
          .thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp, 'CPF VALIDO ;)');
    });

    test('Deve retornar bool true (toChangesIsValidCpf) ', () async {
      var _resp = true;
      when(() => store.toChangesIsValidCpf(value: _resp)).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, true);
    });

    test('Deve retornar String com mensage Cpf valido (validateMaster) ',
        () async {
      var _resp = cpfValidMsg;

      when(() => store.validateMaster(cpf: '50691575665')).thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp, 'CPF VALIDO ;)');
    });

    test('Deve retornar bool true caso todos digitos iguais  (validateDigits) ',
        () async {
      var _resp = true;
      when(() => store.validateDigits(valueCPF: '11111111111'))
          .thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, true);
    });

    test('Deve retornar int Decrement 10 (generateResultByDigit)', () async {
      var _resp = 11;

      when(
        () => store.generateResultByDigit(
          decrementValue: 10,
          numbers: [],
          value: '12345678987',
        ),
      ).thenReturn(_resp);
      expect(_resp, isA<int>());
    });

    test('Deve retornar int Decrement 11 (generateResultByDigit) ', () async {
      var _resp = 11;
      when(
        () => store.generateResultByDigit(
          decrementValue: 10,
          numbers: [],
          value: '12345678987',
        ),
      ).thenReturn(_resp);
      expect(_resp, isA<int>());
    });

    test('Deve retornar bool true (checkDigits) ', () async {
      var digit1 = 6;
      var digit2 = 6;
      var _resp = true;
      when(
        () => store.checkDigits(
          digit1: digit1,
          digit2: digit2,
          value: '50691575665',
        ),
      ).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, true);
    });

    test('Deve retornar String com 11 caracter numero Cpf (generateNumberCPF) ',
        () async {
      var _resp = '12345678217';
      when(
        () => store.generateNumberCPF(),
      ).thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp.length == 11, true);
    });

    test(
        'Deve retornar String Remdon com 11 caracter numero Cpf (gerarRemdon) ',
        () async {
      var _resp = '12345678217';
      when(
        () => store.gerarRemdon(),
      ).thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp.length == 11, true);
    });

    test('Deve retornar String com mensage CPF VALIDO ;) (chackMsg) ',
        () async {
      var _resp = 'CPF VALIDO ;)';
      when(
        () => store.chackMsg('CPF VALIDO ;)'),
      ).thenReturn(_resp);
      expect(_resp, isA<String>());

      expect(_resp, 'CPF VALIDO ;)');
    });

    test('Caso msg setada "CPF IVALIDO :(" retornar  true (checkError) ',
        () async {
      var _resp = true;
      when(
        () => store.checkError(msg: 'CPF VALIDO :('),
      ).thenReturn(_resp);
      expect(_resp, isA<bool>());

      expect(_resp, true);
    });
    test('Deve retornar String com 14 caracter (validateMaster) ', () async {
      var _resp = 'CPF IVALIDO :(';

      when(() => store.validateMaster(cpf: '06144566665')).thenReturn(_resp);
      expect(_resp.length == 14, true);
    });

    test('Caso msg setada "CPF IVALIDO :(" retornar bool true (checkError) ',
        () async {
      var _resp = true;
      when(() => store.checkError(msg: 'CPF IVALIDO :(')).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, true);
    });
  }); //;]

  group('Caminho Triste :[', () {
    test('Deve retornar false (isValid) ', () async {
      var _resp = false;
      when(() => store.isValid).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, false);
    });
    test('Deve retornar  null (validateCPF)', () async {
      // ignore: prefer_typing_uninitialized_variables
      var _resp;

      when(() => store.validateCPF()).thenReturn(_resp);
      expect(_resp, null);
    });

    test('Deve retornar bool false (toChangesIsValidCpf) ', () async {
      var _resp = false;
      when(() => store.toChangesIsValidCpf(value: _resp)).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, false);
    });

    test('Deve retornar String com mensage Cpf invalido (validateMaster) ',
        () async {
      var _resp = 'CPF IVALIDO :(';

      when(() => store.validateMaster(cpf: '06144566665')).thenReturn(_resp);
      expect(_resp, isA<String>());
      expect(_resp.isEmpty, false);
    });

    test('Deve retornar String com msg CPF IVALIDO (validateMaster) ',
        () async {
      var _resp = 'CPF IVALIDO :(';

      when(() => store.validateMaster(cpf: '06144566665')).thenReturn(_resp);

      expect(_resp, 'CPF IVALIDO :(');
    });

    test('Deve retornar null (validateMaster) ', () async {
      var _resp;

      when(() => store.validateMaster(cpf: '06144566665')).thenReturn(_resp);

      expect(_resp, null);
    });

    test('Deve retornar bool false caso mais de 11 caracter (validateDigits) ',
        () async {
      var _resp = false;

      when(() => store.validateDigits(valueCPF: '12345678987'))
          .thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, false);
    });

    test('Deve retornar false (checkDigits) ', () async {
      var digit1 = 1;
      var digit2 = 2;
      var _resp = false;
      when(
        () => store.checkDigits(
          digit1: digit1,
          digit2: digit2,
          value: '12345678217',
        ),
      ).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, false);
    });

    test('Deve retornar String vazia (chackMsg) ', () async {
      var _resp = '';
      when(
        () => store.chackMsg(''),
      ).thenReturn(_resp);
      expect(_resp, isA<String>());

      expect(_resp, '');
    });

    test(
        'Deve caso mensage diferente de "CPF VALIDO :)" ou "CPF IVALIDO :(" '
        'retornar  false (checkError) ', () async {
      var _resp = false;
      when(
        () => store.checkError(msg: ''),
      ).thenReturn(_resp);
      expect(_resp, isA<bool>());
      expect(_resp, false);
    });
  });
}

const String cpfValid = '12332112321';
const String cpf = '12345678912';
const String cpfInvalidMsg = 'CPF IVALIDO :(';
const String cpfValidMsg = 'CPF VALIDO ;)';
