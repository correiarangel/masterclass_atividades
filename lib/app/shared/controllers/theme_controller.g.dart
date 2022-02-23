// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeController on _ThemeControllerBase, Store {
  final _$themeMainAtom = Atom(name: '_ThemeControllerBase.themeMain');

  @override
  ThemeMode get themeMain {
    _$themeMainAtom.reportRead();
    return super.themeMain;
  }

  @override
  set themeMain(ThemeMode value) {
    _$themeMainAtom.reportWrite(value, super.themeMain, () {
      super.themeMain = value;
    });
  }

  final _$_ThemeControllerBaseActionController =
      ActionController(name: '_ThemeControllerBase');

  @override
  ThemeMode toChangesTheme() {
    final _$actionInfo = _$_ThemeControllerBaseActionController.startAction(
        name: '_ThemeControllerBase.toChangesTheme');
    try {
      return super.toChangesTheme();
    } finally {
      _$_ThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMain: ${themeMain}
    ''';
  }
}
