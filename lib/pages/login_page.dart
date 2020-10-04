import 'package:choob_khat/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  Widget _phoneWidget(BuildContext context) => Form(
        key: Provider.of<LoginProvider>(context).formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('شماره تلفن همراه'),
            TextFormField(
              maxLength: 11,
              autovalidate: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: Provider.of<LoginProvider>(context).phoneNumber,
              validator: (text) {
                const String error = 'شماره مبایل نامعتبر میباشد';
                if (text.length < 11)
                  return error;
                else if (text.substring(0, 2) != '09')
                  return error;
                else
                  return null;
              },
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.amber[300],
              child: Text('دریافت کد'),
              onPressed: Provider.of<LoginProvider>(context).isLoading
                  ? null
                  : Provider.of<LoginProvider>(context).sendPhoneNumber,
            ),
          ],
        ),
      );

  Widget _codeWidget(BuildContext context) => Form(
        key: Provider.of<LoginProvider>(context).formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('کد فعال سازی'),
            TextFormField(
              maxLength: 5,
              autovalidate: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: Provider.of<LoginProvider>(context).code,
              validator: (text) {
                const String error = 'کد نامعتبر';
                if (text.length < 5)
                  return error;
                else
                  return null;
              },
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.amber[300],
              child: Text('ارسال کد'),
              onPressed: Provider.of<LoginProvider>(context).isLoading
                  ? null
                  : () => Provider.of<LoginProvider>(context, listen: false)
                      .sendCodeNumber(context),
            ),
          ],
        ),
      );

  Widget _mainScaffold(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'چوب خط',
                    textScaleFactor: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Provider.of<LoginProvider>(context).isCodeSent
                    ? _codeWidget(context)
                    : _phoneWidget(context),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (_, __) => Builder(builder: (context) => _mainScaffold(context)),
    );
  }
}
