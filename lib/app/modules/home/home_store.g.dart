// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$progssVariationAtom = Atom(name: 'HomeStoreBase.progssVariation');

  @override
  bool get progssVariation {
    _$progssVariationAtom.reportRead();
    return super.progssVariation;
  }

  @override
  set progssVariation(bool value) {
    _$progssVariationAtom.reportWrite(value, super.progssVariation, () {
      super.progssVariation = value;
    });
  }

  final _$currentIndexAtom = Atom(name: 'HomeStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$dateUpgradeAtom = Atom(name: 'HomeStoreBase.dateUpgrade');

  @override
  String get dateUpgrade {
    _$dateUpgradeAtom.reportRead();
    return super.dateUpgrade;
  }

  @override
  set dateUpgrade(String value) {
    _$dateUpgradeAtom.reportWrite(value, super.dateUpgrade, () {
      super.dateUpgrade = value;
    });
  }

  final _$titleAtom = Atom(name: 'HomeStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$versionAtom = Atom(name: 'HomeStoreBase.version');

  @override
  String? get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String? value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$progressLinkAtom = Atom(name: 'HomeStoreBase.progressLink');

  @override
  bool get progressLink {
    _$progressLinkAtom.reportRead();
    return super.progressLink;
  }

  @override
  set progressLink(bool value) {
    _$progressLinkAtom.reportWrite(value, super.progressLink, () {
      super.progressLink = value;
    });
  }

  final _$isNetAtom = Atom(name: 'HomeStoreBase.isNet');

  @override
  bool? get isNet {
    _$isNetAtom.reportRead();
    return super.isNet;
  }

  @override
  set isNet(bool? value) {
    _$isNetAtom.reportWrite(value, super.isNet, () {
      super.isNet = value;
    });
  }

  final _$changeVersionAsyncAction = AsyncAction('HomeStoreBase.changeVersion');

  @override
  Future changeVersion() {
    return _$changeVersionAsyncAction.run(() => super.changeVersion());
  }

  final _$changesIsNetAsyncAction = AsyncAction('HomeStoreBase.changesIsNet');

  @override
  Future changesIsNet() {
    return _$changesIsNetAsyncAction.run(() => super.changesIsNet());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  bool changesProgressVariation(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesProgressVariation');
    try {
      return super.changesProgressVariation(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int toChangesPage(int index) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.toChangesPage');
    try {
      return super.toChangesPage(index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String changeDateUpgrade(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeDateUpgrade');
    try {
      return super.changeDateUpgrade(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String changesTitle({required String valueTitle}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesTitle');
    try {
      return super.changesTitle(valueTitle: valueTitle);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changesProgressLink(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesProgressLink');
    try {
      return super.changesProgressLink(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progssVariation: ${progssVariation},
currentIndex: ${currentIndex},
dateUpgrade: ${dateUpgrade},
title: ${title},
version: ${version},
progressLink: ${progressLink},
isNet: ${isNet}
    ''';
  }
}
