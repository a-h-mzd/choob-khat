import 'dart:convert';

import 'package:choob_khat/constants/durations.dart';
import 'package:http/http.dart' as http;

Future<http.Response> makePost(
  final String url, {
  final Map<String, String> headers,
  final Map body,
}) =>
    http
        .post(
          url,
          headers: headers,
          body: jsonEncode(body),
        )
        .timeout(apiTimeout, onTimeout: () async => null)
        .catchError((e) => null);
