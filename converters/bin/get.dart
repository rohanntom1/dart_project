//import 'dart:html';
import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//import 'rate.dart';

// Future<String> getCurrencies() async {
//   http.Response response = await http.get(Uri.parse(
//       'https://v6.exchangerate-api.com/v6/5366b4e648db52bac7661c6f/latest/USD'));
//   return (response.body);
// }

Future<double> convertRate(
    String source, String destination, double amount) async {
  http.Response response = await http.get(Uri.parse(
      'https://v6.exchangerate-api.com/v6/5366b4e648db52bac7661c6f/pair/${source.toUpperCase()}/${destination.toUpperCase()}/$amount'));
  var body = jsonDecode(response.body);
  final lists = body["conversion_result"];
  return lists;
}

void main() async {
  // print(await getCurrencies());
  double amount;
  stdout.write('\nEnter the source currency: ');
  String? source = stdin.readLineSync();
  stdout.write('Enter the destination currency: ');
  String? destination = stdin.readLineSync();
  stdout.write('Enter the amount: ');
  amount = double.parse(stdin.readLineSync()!);
  if (source == null || destination == null) {
    throw Exception("Please enter the valid value");
  }
  final rates = await convertRate(source, destination, amount);
  //double rate = rates;
  print(
      'The conversion rate of ${source.toUpperCase()} to ${destination.toUpperCase()} is $rates');
}
