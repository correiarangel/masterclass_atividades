// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaygroundStore on _PlaygroundStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_PlaygroundStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_PlaygroundStoreBaseActionController =
      ActionController(name: '_PlaygroundStoreBase');

  @override
  bool toChangesIsloading({dynamic isLoadingValue}) {
    final _$actionInfo = _$_PlaygroundStoreBaseActionController.startAction(
        name: '_PlaygroundStoreBase.toChangesIsloading');
    try {
      return super.toChangesIsloading(isLoadingValue: isLoadingValue);
    } finally {
      _$_PlaygroundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
