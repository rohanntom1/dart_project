import 'dart:io';
//import 'dart:math';
//import 'dart:async';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

void main() {
  double value, new_value;
  var number, k;
  print(
      "Select the conversion type \n 1. USD to CAD \n 2. USD to INR \n 3. CAD to USD \n 4. CAD to INR \n 5. INR to USD \n 6. INR to CAD");
  stdout.write('Enter the number:');
  number = stdin.readLineSync();
  switch (number) {
    case '1':
      {
        stdout.write('USD : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 1.2347;
        print('CAD value : $new_value\n');
        break;
      }

    case '2':
      {
        stdout.write('USD : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 74.98;
        print('INR value : $new_value\n');
        break;
      }

    case '3':
      {
        stdout.write('CAD : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 0.81;
        print('USD value : $new_value\n');
        break;
      }

    case '4':
      {
        stdout.write('CAD : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 60.74;
        print('INR value : $new_value\n');
        break;
      }

    case '5':
      {
        stdout.write('INR : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 0.0133;
        print('USD value : $new_value\n');
        break;
      }

    case '6':
      {
        stdout.write('INR : ');
        k = stdin.readLineSync();
        value = double.parse(k);
        new_value = value * 0.0165;
        print('CAD value : $new_value\n');
        break;
      }
    default:
      {
        print('Invalid input\n');
        break;
      }
  }
}
