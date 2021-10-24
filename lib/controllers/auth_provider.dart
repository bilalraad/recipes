import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/data/API/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi;

  AuthProvider(this._authApi);

  User? _user;

  User? get user => _user;

  Future<void> signUp(String email, String password) async {
    try {
      _user = await _authApi.signUp(email, password);
      notifyListeners();
    } catch (e) {
      if (e is PlatformException) {
        throw FlutterError('network error');
      } else {
        throw FlutterError('Unknown erro');
      }
    }
  }
}
