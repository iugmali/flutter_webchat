import 'package:flutter/material.dart';
import 'package:flutter_webchat/widgets/screens/config/config_screen.dart';
import 'package:flutter_webchat/widgets/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_webchat/widgets/screens/welcome/welcome_screen.dart';
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
              ? ThemeData.dark(
                  useMaterial3: true,
                )
              : ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor:
                      const Color.fromARGB(255, 57, 57, 30)),
                  useMaterial3: true,
                ),
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomeScreen(),
            MainScreen.routeName: (context) => const MainScreen(),
            ConfigScreen.routeName: (context) => const ConfigScreen(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) => WelcomeScreen());
          },
        );
      }),
    );
  }
}
