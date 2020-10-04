import 'package:choob_khat/pages/dashboard_dart.dart';
import 'package:choob_khat/pages/login_page.dart';
import 'package:choob_khat/pages/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'چوب خط',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Color(0xFF1C1C1C),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
