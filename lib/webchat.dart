import 'package:flutter/material.dart';
import 'package:flutter_webchat/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webchat/services/dark_mode_service.dart';



class Webchat extends StatelessWidget {
  const Webchat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
            create: (_) => DarkModeService()),
      ],
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          title: 'Webchat',
          theme: darkModeService.darkMode
              ? ThemeData.dark(useMaterial3: true,)
              : ThemeData(useMaterial3: true,),
          home: WelcomeScreen(),
        );
      }),
    );
  }
}