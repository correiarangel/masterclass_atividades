// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_implict_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimationImplictButtonStore on _AnimationImplictButtonStoreBase, Store {
  final _$isAnimatioRunAtom =
      Atom(name: '_AnimationImplictButtonStoreBase.isAnimatioRun');

  @override
  bool get isAnimatioRun {
    _$isAnimatioRunAtom.reportRead();
    return super.isAnimatioRun;
  }

  @override
  set isAnimatioRun(bool value) {
    _$isAnimatioRunAtom.reportWrite(value, super.isAnimatioRun, () {
      super.isAnimatioRun = value;
    });
  }

  final _$_AnimationImplictButtonStoreBaseActionController =
      ActionController(name: '_AnimationImplictButtonStoreBase');

  @override
  bool toChangesIsloading({dynamic isLoadingValue}) {
    final _$actionInfo =
        _$_AnimationImplictButtonStoreBaseActionController.startAction(
            name: '_AnimationImplictButtonStoreBase.toChangesIsloading');
    try {
      return super.toChangesIsloading(isLoadingValue: isLoadingValue);
    } finally {
      _$_AnimationImplictButtonStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAnimatioRun: ${isAnimatioRun}
    ''';
  }
}
