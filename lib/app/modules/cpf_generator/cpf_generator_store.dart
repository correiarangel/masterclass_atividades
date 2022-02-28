import 'dart:math';

import 'package:mobx/mobx.dart';

part 'cpf_generator_store.g.dart';

class CpfGeneratorStore = _CpfGeneratorStoreBase with _$CpfGeneratorStore;

abstract class _CpfGeneratorStoreBase with Store {
  @observable
  String? cpftext;
  @action
  String changeCpf(String? value) {
    cpftext = value;
    return cpftext!;
  }

  @computed
  bool get isValid {
    return validateCPF() == null;
  }

  String? validateCPF() {
    if (cpftext == null || cpftext!.isEmpty) {
      return 'Digite ou Gere um CPF:';
    } else if (cpftext!.length < 11) {
      return "Digite 11 numeros não menus !";
    } else if (cpftext!.length > 11) {
      return "Digite 11 numeros não mais !";
    } else if (cpftext!.length == 11) {
      return validateMaster(cpf: cpftext!);
    }
  }

  String? validateCpfRemdon({required String? cpfString}) {
    if (cpfString == null || cpfString.isEmpty) {
      return 'CPF_NULL';
    } else if (cpfString.length == 11) {
      return validateMaster(cpf: cpfString);
    }
  }

  @observable
  bool isValidCpf = false;
  @action
  bool toChangesIsValidCpf({required bool value}) {
    return isValidCpf = value;
  }

  String? validateMaster({required String cpf}) {
    if (checkEqualityNumber(value: cpf) == false) {
      return 'CPF IVALIDO :(';
    } else {
      if (validateDigits(valueCPF: cpf) == false) {
        return 'CPF IVALIDO :(';
      } else {
        return 'CPF VALIDO ;)';
      }
    }
  }

  bool validateDigits({required String valueCPF}) {
    final numbers = valueCPF.split('').map((e) => int.parse(e)).toList();
    final digit1 = generateResultByDigit(
        value: valueCPF, decrementValue: 10, numbers: numbers);
    final digit2 = generateResultByDigit(
      numbers: numbers,
      value: valueCPF,
      decrementValue: 11,
    );
    return checkDigits(digit1: digit1, digit2: digit2, value: valueCPF);
  }

  int generateResultByDigit({
    required String value,
    required int decrementValue,
    required List numbers,
  }) {
    var buff = 0;
    var result = 0;

    for (var i = decrementValue; i >= 2; i--) {
      final int number = numbers[buff];
      result += number * i;
      buff++;
    }
    result = result * 10;
    return result % 11;
  }

  bool checkDigits({
    required int digit1,
    required int digit2,
    required String value,
  }) {
    return digit1 == int.parse(value[9]) && digit2 == int.parse(value[10]);
  }

  bool checkEqualityNumber({required String value}) {
    final isEquals = value
        .split('')
        .every((element) => int.parse(element) == int.parse(value[0]));
    if (isEquals) {
      return false;
    } else {
      return true;
    }
  }

  @observable
  String numberCPF = '0';
  @action
  String generateNumberCPF() {
    numberCPF = gerarRemdon(); // recebe cpf string
    var cpf = validateCpfRemdon(cpfString: numberCPF);

    while (cpf != 'CPF VALIDO ;)') {
      numberCPF = gerarRemdon();
      cpf = validateCpfRemdon(cpfString: numberCPF);
    }
    toChangesIsValidCpf(value: true);
    changeCpf(numberCPF);
    return numberCPF;
  }

  String gerarRemdon() {
    Random _rendomNunber = Random();
    var listNumber = [];
    var index = 0;
    while (index <= 2) {
      var numb = _rendomNunber.nextInt(1000);
      while (numb.toString().length != 3) {
        numb = _rendomNunber.nextInt(1000);
      }
      listNumber.add(numb);
      index++;
    }
    var numb2Digts = _rendomNunber.nextInt(100);
    while (numb2Digts.toString().length != 2) {
      numb2Digts = _rendomNunber.nextInt(1000);
    }
    listNumber.add(numb2Digts);
    return '${listNumber[0]}${listNumber[1]}${listNumber[2]}${listNumber[3]}';
  }
}
