import 'package:flutter/material.dart';

enum UserRole { admin, user, guest }

class AuthService extends ChangeNotifier {
  bool _isLoggedIn = false;
  UserRole _role = UserRole.guest;
  String? _username;

  bool get isLoggedIn => _isLoggedIn;
  UserRole get role => _role;
  bool get isAdmin => _role == UserRole.admin;
  String get username => _username ?? 'Guest';
  String get email =>
      _role == UserRole.admin ? 'admin@manutd.com' : 'fan@manutd.com';

  void login(String username, String password) {
    _username = username;
    // Simple mock logic for demonstration
    if (username.toLowerCase() == 'admin' && password == 'mu123') {
      _isLoggedIn = true;
      _role = UserRole.admin;
    } else {
      _isLoggedIn = true;
      _role = UserRole.user;
    }
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _role = UserRole.guest;
    notifyListeners();
  }
}
