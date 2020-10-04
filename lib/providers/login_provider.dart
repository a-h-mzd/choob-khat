import 'package:choob_khat/apis/account_api.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final AccountApi _api = AccountApi();
  bool isCodeSent = false;
  bool isLoading = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController code = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();

  void sendPhoneNumber() async {
    if (!formState.currentState.validate()) return;
    isLoading = true;
    notifyListeners();
    final result = await _api.sendPhoneNumber(phoneNumber.text);
    if (result ?? false) isCodeSent = true;
    isLoading = false;
    notifyListeners();
  }

  void sendCodeNumber(BuildContext context) async {
    if (!formState.currentState.validate()) return;
    isLoading = true;
    notifyListeners();
    final result = await _api.sendCode(phoneNumber.text, code.text);
    isLoading = false;
    notifyListeners();
    if (result ?? false) Navigator.of(context).pushReplacementNamed('/dashboard');
  }
}
