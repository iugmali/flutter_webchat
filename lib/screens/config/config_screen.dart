import 'package:flutter/material.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/screens/shared/username_form.dart';
import 'package:flutter_webchat/services/username_store.dart';
import 'package:flutter_webchat/services/webchat_client_service.dart';
import 'package:flutter_webchat/screens/shared/app_bar.dart';
import 'package:flutter_webchat/screens/shared/drawer.dart';

class ConfigScreen extends StatelessWidget {
  ConfigScreen({super.key});

  final usernameStore = getIt<UsernameStore>();
  final socket = getIt<WebchatClientService>().socket;


  void _onUsernameSubmitted(String username) {
    socket.emit('leave', usernameStore.username);
    usernameStore.setUsername(username);
    socket.emit('join', username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: const MyAppBar(),
        body: UsernameForm(onSubmit: _onUsernameSubmitted)
    );
  }
}
