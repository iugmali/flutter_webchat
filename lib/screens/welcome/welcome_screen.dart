import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/screens/main/main_screen.dart';
import 'package:flutter_webchat/screens/shared/username_form.dart';
import 'package:flutter_webchat/services/username_store.dart';
import 'package:flutter_webchat/services/webchat_client_service.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final usernameStore = getIt<UsernameStore>();
  final socket = getIt<WebchatClientService>().socket;


  void _onUsernameSubmitted(String username) {
    usernameStore.setUsername(username);
    socket.emit('join', username);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final String username = usernameStore.username;
      return username.isEmpty
          ? Scaffold(
            body: UsernameForm(onSubmit: _onUsernameSubmitted),
      )
          : const MainScreen();
    });
  }
}