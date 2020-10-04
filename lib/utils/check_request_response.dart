import 'dart:convert';

import 'package:http/http.dart';

bool checkRequestResponse(Response response) {
  if (response?.body == null) return null;
  try {
    final Map temp = jsonDecode(response.body);
    if (!(temp['ok'] ?? true)) return false;
    return true;
  } catch (e) {
    return null;
  }
}
