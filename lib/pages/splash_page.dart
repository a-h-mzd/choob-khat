import 'package:choob_khat/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final String token = await SecureStorage().token;
      if (token != null)
        Navigator.of(context).pushReplacementNamed('/dashboard');
      else
        Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
