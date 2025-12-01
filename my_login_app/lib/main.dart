import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'utils/auto_route_logger.dart';   // <-- Add this

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Login App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
  ),
  debugShowCheckedModeBanner: false,
  home: const LoginPage(),
  navigatorObservers: [AutoRouteLogger()],
);
  }
}

