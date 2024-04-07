import 'package:flutter/material.dart';
import 'package:flutter_webchat/screens/main/message_form.dart';
import 'package:flutter_webchat/screens/main/message_list.dart';
import 'package:flutter_webchat/screens/shared/app_bar.dart';
import 'package:flutter_webchat/screens/shared/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: const MyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: MessageList(),
          ),
          const MessageForm()
        ],
      )
    );
  }
}