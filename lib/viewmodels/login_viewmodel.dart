import 'package:flutter/material.dart';
import 'package:backendFlutterFirebase/models/user.dart';
import 'package:backendFlutterFirebase/services/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  User? _user;
  String? _errorMessage;

  User? get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _user = await _apiService.login(username, password);
    if (_user == null) {
      _errorMessage = 'Invalid username or password';
    }
    notifyListeners();
  }
}
