import 'package:flutter/material.dart';

import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color kPrimaryColor = Color(0xFFD32F2F);
    const Color kSecondaryColor = Color(0xFF7C4DFF);
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Sellout Web',
      theme: ThemeData(
        dividerTheme: const DividerThemeData(thickness: 0.5, space: 0),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: kPrimaryColor,
        colorScheme: const ColorScheme(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.red,
          onSecondary: Colors.deepPurple,
          onSurface: Colors.grey,
          onBackground: Colors.grey,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
