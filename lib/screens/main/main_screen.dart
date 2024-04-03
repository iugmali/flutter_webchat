import 'package:flutter/material.dart';
import 'package:flutter_webchat/screens/main/message_form.dart';
import 'package:flutter_webchat/screens/main/message_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webchat/services/dark_mode_service.dart';
import 'package:flutter_webchat/shared/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "WebChat",
          style: GoogleFonts.roboto(),
        ),
        actions: [
          const Center(child: Text("Dark Mode")),
          Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
            return Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value) {
                  darkModeService.darkMode = value;
                });
          })
        ],
      ),
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