import 'package:flutter/material.dart';
import 'package:flutter_webchat/main.dart';
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
          InkWell(
            onTap: () {
              // Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ConfigurationPage()));
            },
            child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children:  [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(_username),
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              // Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ConfigurationPage()));
            },
            child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children:  [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}