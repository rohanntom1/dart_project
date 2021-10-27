import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.parse(
      'http://api.exchangeratesapi.io/v1/latest?access_key=0bc1b1cafb8a8e7f9b2971c32fad153b');

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];

      List<String> currencies = (list.keys).toList();
      return (currencies);
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}

void main() async {
  ApiClient client = ApiClient();
  print(await client.getCurrencies());
  double rate, amount;
  stdout.write('Enter the source currency: ');
  String? source = stdin.readLineSync();
  stdout.write('Enter the destination currency: ');
  String? destination = stdin.readLineSync();
  stdout.write('Enter the amount: ');
  amount = double.parse(stdin.readLineSync()!);
  rate = amount * 2;
  print('The conversion rate is $rate');
}
