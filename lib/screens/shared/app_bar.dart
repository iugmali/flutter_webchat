import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webchat/services/dark_mode_service.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
