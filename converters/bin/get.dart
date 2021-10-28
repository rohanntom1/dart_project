import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<List> getCurrencies() async {
//   http.Response response = await http.get(Uri.parse(
//       'https://v6.exchangerate-api.com/v6/5366b4e648db52bac7661c6f/codes'));
//   if (response.statusCode == 200) {
//     var body = jsonDecode(response.body);
//     final lists = body["supported_codes"];
//     return lists;
//   } else {
//     throw Exception("Failed to connect to API");
//   }
// }

Future<double> convertRate(
    String source, String destination, double amount) async {
  http.Response response = await http.get(Uri.parse(
      'https://v6.exchangerate-api.com/v6/5366b4e648db52bac7661c6f/pair/${source.toUpperCase()}/${destination.toUpperCase()}/$amount'));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    final lists = body["conversion_result"];
    return lists;
  } else {
    throw Exception("Failed to connect to API");
  }
}

void main() async {
  //List currency = await getCurrencies();
  double amount;
  try {
    stdout.write('\nEnter the source currency: ');
    String? source = stdin.readLineSync();
    if (source == null || source.isEmpty) {
      throw Exception("Please enter a valid currency");
    }
    stdout.write('Enter the destination currency: ');
    String? destination = stdin.readLineSync();
    if (destination == null || destination.isEmpty) {
      throw Exception("Please enter a valid currency");
    }
    stdout.write('Enter the amount: ');
    amount = double.parse(stdin.readLineSync()!);
    final rates = await convertRate(source, destination, amount);
    print(
        'The conversion result of ${source.toUpperCase()} to ${destination.toUpperCase()} is $rates');
  } catch (e) {
    print('Exception occurs: $e');
  }
}
