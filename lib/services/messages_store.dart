import 'package:mobx/mobx.dart';
import 'package:flutter_webchat/models/message.dart';

part 'messages_store.g.dart';

class MessagesStore = _MessagesStore with _$MessagesStore;

abstract class _MessagesStore with Store {
  @observable
  ObservableList<Message> messages = <Message>[].asObservable();

  @action
  void addMessage(Message message) {
    messages.add(message);
  }
}