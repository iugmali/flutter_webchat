import 'package:flutter/material.dart';
import 'package:flutter_webchat/screens/shared/username_form.dart';
import 'package:flutter_webchat/screens/shared/app_bar.dart';
import 'package:flutter_webchat/screens/shared/drawer.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: const MyAppBar(),
        body: const UsernameForm()
    );
  }
}
