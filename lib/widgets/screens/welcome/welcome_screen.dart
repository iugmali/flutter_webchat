import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/widgets/screens/main/main_screen.dart';
import 'package:flutter_webchat/widgets/shared/username_form.dart';
import 'package:flutter_webchat/services/username_store.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final usernameStore = getIt<UsernameStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final String username = usernameStore.username;
      return username.isEmpty
          ? const Scaffold(
            body: UsernameForm(),
      )
          : const MainScreen();
    });
  }
}
