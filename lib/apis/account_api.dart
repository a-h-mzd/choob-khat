import 'dart:convert';
import 'dart:io';

import 'package:choob_khat/constants/strings.dart';
import 'package:choob_khat/utils/check_request_response.dart';
import 'package:choob_khat/utils/post.dart';
import 'package:choob_khat/utils/secure_storage.dart';

class AccountApi {
  static final AccountApi _instance = AccountApi._();

  AccountApi._();

  factory AccountApi() => _instance;

  Future<bool> sendPhoneNumber(final String phoneNumber) async {
    const String authApiLink = '$mainApiLink/accounts/auth';
    final response = await makePost(
      authApiLink,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: {
        'phone': phoneNumber,
      },
    );
    final bool cond = checkRequestResponse(response);
    return cond;
  }

  Future<bool> sendCode(final String phoneNumber, final String code) async {
    const String authApiLink = '$mainApiLink/accounts/login/otp';
    final response = await makePost(
      authApiLink,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: {
        'phone': phoneNumber,
        'code': code,
      },
    );
    final bool cond = checkRequestResponse(response);
    if (cond ?? false)
      SecureStorage().setToken(jsonDecode(response.body)['token']);
    return cond;
  }

  Future<void> getAccountDetails() async {
    final String token = await SecureStorage().token;
  }
}
