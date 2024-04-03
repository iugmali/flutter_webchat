import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_webchat/services/username_store.dart';
import 'package:flutter_webchat/services/messages_store.dart';
import 'package:flutter_webchat/services/webchat_client_service.dart';
import 'package:flutter_webchat/webchat.dart';

final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<MessagesStore>(MessagesStore());
  getIt.registerSingleton<UsernameStore>(UsernameStore());
  getIt.registerSingleton<WebchatClientService>(WebchatClientService(getIt<MessagesStore>()));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  var client = getIt<WebchatClientService>();
  client.connect();

  runApp(const Webchat());
}