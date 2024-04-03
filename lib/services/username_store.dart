import 'package:mobx/mobx.dart';

part 'username_store.g.dart';

class UsernameStore = _UsernameStore with _$UsernameStore;

abstract class _UsernameStore with Store {
  @observable
  String username = "";

  @action
  void setUsername(String value) {
    username = value;
  }
}