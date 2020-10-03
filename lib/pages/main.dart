import 'package:choob_khat/utils/biometrics.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final bio = Biometrics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('چوب خط'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => bio.authenticate().then(print),
          child: Text('click me!'),
        ),
      ),
    );
  }
}
