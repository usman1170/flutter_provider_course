// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
//
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //
  void login(String email, password) async {
    setLoading(true);
    try {
      const url = "https://reqres.in/api/login";
      Response response = await post(Uri.parse(url), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        print("Successfully login");
      } else {
        setLoading(false);
        print("Login failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
// "eve.holt@reqres.in"
// "cityslicka"
