import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userID;
}

Future<void> signup(String email, String password) async {
  const url = Uri;
}
