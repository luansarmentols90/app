// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccessController on _AccessController, Store {
  late final _$valueAtom =
      Atom(name: '_AccessController.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AccessController.isLoading', context: context);

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

  late final _$_AccessControllerActionController =
      ActionController(name: '_AccessController', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_AccessControllerActionController.startAction(
        name: '_AccessController.increment');
    try {
      return super.increment();
    } finally {
      _$_AccessControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_AccessControllerActionController.startAction(
        name: '_AccessController.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_AccessControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
isLoading: ${isLoading}
    ''';
  }
}
