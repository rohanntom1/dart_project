import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> getCurrencies() async {
  http.Response response =
      await http.get(Uri.parse('https://exchangeratesapi.io/'));
  return (response.body);
}

void main() async {
  String currencies = await getCurrencies();
  print(currencies);
}
