// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_implict_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimationImplictListStore on _AnimationImplictListStoreBase, Store {
  final _$heroiModelsAtom =
      Atom(name: '_AnimationImplictListStoreBase.heroiModels');

  @override
  List<HeroiModel>? get heroiModels {
    _$heroiModelsAtom.reportRead();
    return super.heroiModels;
  }

  @override
  set heroiModels(List<HeroiModel>? value) {
    _$heroiModelsAtom.reportWrite(value, super.heroiModels, () {
      super.heroiModels = value;
    });
  }

  final _$_AnimationImplictListStoreBaseActionController =
      ActionController(name: '_AnimationImplictListStoreBase');

  @override
  List<HeroiModel> toChangesHeroiModelList(
      {required List<HeroiModel> listValue}) {
    final _$actionInfo =
        _$_AnimationImplictListStoreBaseActionController.startAction(
            name: '_AnimationImplictListStoreBase.toChangesHeroiModelList');
    try {
      return super.toChangesHeroiModelList(listValue: listValue);
    } finally {
      _$_AnimationImplictListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heroiModels: ${heroiModels}
    ''';
  }
}
