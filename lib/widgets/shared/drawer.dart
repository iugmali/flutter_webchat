import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/widgets/screens/config/config_screen.dart';
import 'package:flutter_webchat/widgets/screens/main/main_screen.dart';
import 'package:flutter_webchat/services/username_store.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final String _username = getIt<UsernameStore>().username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
            child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children:  [
                    Icon(Icons.message),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Tela do chat"),
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ConfigScreen.routeName);
            },
            child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children:  [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Alterar username"),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}