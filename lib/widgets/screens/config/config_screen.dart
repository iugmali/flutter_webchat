import 'package:flutter/material.dart';
import 'package:flutter_webchat/widgets/shared/username_form.dart';
import 'package:flutter_webchat/widgets/shared/app_bar.dart';
import 'package:flutter_webchat/widgets/shared/drawer.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  static const routeName = '/config';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: const MyAppBar(),
        body: const UsernameForm()
    );
  }
}
