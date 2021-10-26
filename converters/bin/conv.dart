import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  double value, new_value;
  var number, k;
  while (true) {
    print(
        "Select the conversion type \n 1. USD to CAD \n 2. USD to INR \n 3. CAD to USD \n 4. CAD to INR \n 5. INR to USD \n 6. INR to CAD\n 7. Quit");
    stdout.write('Enter the number:');
    number = stdin.readLineSync();

    if (number == '1') {
      stdout.write('USD : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 1.2347;
      print('CAD value : $new_value\n');
    } else if (number == '2') {
      stdout.write('USD : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 74.98;
      print('INR value : $new_value\n');
    } else if (number == '3') {
      stdout.write('CAD : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 0.81;
      print('USD value : $new_value\n');
    } else if (number == '4') {
      stdout.write('CAD : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 60.74;
      print('INR value : $new_value\n');
    } else if (number == '5') {
      stdout.write('INR : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 0.0133;
      print('USD value : $new_value\n');
    } else if (number == '6') {
      stdout.write('INR : ');
      k = stdin.readLineSync();
      value = double.parse(k);
      new_value = value * 0.0165;
      print('CAD value : $new_value\n');
    } else if (number == '7') {
      print('Quitting');
      break;
    } else {
      print('Invalid input\n');
    }
  }
}

Future<void> getCurrencies() async {
  http.Response response = await http
      .get(Uri.parse('https://api.coinmarketcap.com/v1/ticker/?limit=50'));
  print(response.body);
}
