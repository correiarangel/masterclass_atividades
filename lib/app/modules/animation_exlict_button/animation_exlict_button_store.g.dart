// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_exlict_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimationExplictButtonStore on _AnimationExplictButtonStoreBase, Store {
  final _$isAnimatioRunAtom =
      Atom(name: '_AnimationExplictButtonStoreBase.isAnimatioRun');

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

  final _$_AnimationExplictButtonStoreBaseActionController =
      ActionController(name: '_AnimationExplictButtonStoreBase');

  @override
  bool toChangesIsloading({dynamic isLoadingValue}) {
    final _$actionInfo =
        _$_AnimationExplictButtonStoreBaseActionController.startAction(
            name: '_AnimationExplictButtonStoreBase.toChangesIsloading');
    try {
      return super.toChangesIsloading(isLoadingValue: isLoadingValue);
    } finally {
      _$_AnimationExplictButtonStoreBaseActionController
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
