// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessagesStore on _MessagesStore, Store {
  late final _$messagesAtom =
      Atom(name: '_MessagesStore.messages', context: context);

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$_MessagesStoreActionController =
      ActionController(name: '_MessagesStore', context: context);

  @override
  void addMessage(Message message) {
    final _$actionInfo = _$_MessagesStoreActionController.startAction(
        name: '_MessagesStore.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_MessagesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
