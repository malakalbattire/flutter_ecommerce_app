import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/services/auth_services.dart';

enum RegisterState { initial, loading, loaded, error }

class RegisterProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServicesImpl();
  RegisterState _state = RegisterState.initial;
  String _errorMessage = '';

  RegisterState get state => _state;
  String get errorMessage => _errorMessage;

  Future<User?> register(String email, String password) async {
    _state = RegisterState.loading;
    notifyListeners();

    try {
      final result = await _authServices.register(email, password);
      if (result) {
        final user = await _authServices.getUser();
        _state = RegisterState.loaded;
        notifyListeners();
        return user;
      } else {
        _state = RegisterState.error;
        _errorMessage = 'Registration failed: Invalid credentials.';
        notifyListeners();
        return null;
      }
    } catch (e) {
      _state = RegisterState.error;
      _errorMessage = e.toString();
      notifyListeners();
      return null;
    }
  }
}
