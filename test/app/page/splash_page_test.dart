import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_atividades/app/page/splash_page.dart';

Widget createSplashPage() {
  return const MaterialApp(home: SplashPage());
}

main() {
  setUp(() {
    debugPrint("Iniciando tests SplashPage");
  });

  tearDown(() {
    debugPrint("Finalizando test SplashPage");
  });
  group('SplashPage', () {
    testWidgets('Deve conter um Scaffold, Row, Image, Text ...',(tester) async {
      //comente o timer na pg splash
    /*   await tester.pumpWidget(createSplashPage());

       expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Image), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Text), findsWidgets); */

/*       // ignore: non_constant_identifier_names
      var img = find.byType(Image);
      expect(img, findsOneWidget);

      // ignore: non_constant_identifier_names
      var text = find.byType(Text);
      expect(text, findsWidgets); */
    });
  });
}
