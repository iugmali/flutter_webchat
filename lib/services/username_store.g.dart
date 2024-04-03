// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsernameStore on _UsernameStore, Store {
  late final _$usernameAtom =
      Atom(name: '_UsernameStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$_UsernameStoreActionController =
      ActionController(name: '_UsernameStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_UsernameStoreActionController.startAction(
        name: '_UsernameStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_UsernameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username}
    ''';
  }
}
