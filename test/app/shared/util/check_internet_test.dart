import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/shared/util/check_internet.dart';

class CheckInternetMock implements CheckInternet {
  @override
  Future<bool> isInternet() async => true;
}

void main() {
  final checkNet = CheckInternetMock();

  setUp(() {
    debugPrint("Iniciando tests CheckInternet");
  });

  tearDown(() {
    debugPrint("Finalizando test CheckInternet");
  });

  test('Deve retornar tipo bool true ', () async {
    //arrage
    var result = await checkNet.isInternet();
    
    expect(result, isA<bool>());
    expect(result, true);
  });

}
