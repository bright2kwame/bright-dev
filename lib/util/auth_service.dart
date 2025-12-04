import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // 3. Login Method: Changes state and notifies listeners.
  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  // 4. Logout Method: Resets state.
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
