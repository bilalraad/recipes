import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/data/API/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi;

  AuthProvider(this._authApi);

  User? _user;
  String? _error;

  User? get user => _user;
  String? get error => _error;

  bool get isLoggedIn => _authApi.isLogged();

  Future<void> signUp(String email, String password) async {
    try {
      print('object1');
      _user = await _authApi.signUp(email, password);
      print('object2');

      notifyListeners();
    } catch (e) {
      if (e is PlatformException) {
        _error = ('network error');
      } else {
        _error = ('Unknown error ${e}');
      }
      notifyListeners();
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      _user = await _authApi.logIn(email, password);
      notifyListeners();
    } catch (e) {
      if (e is PlatformException) {
        _error = ('network error');
      } else {
        _error = ('Unknown error');
      }
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    try {
      await _authApi.logOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      if (e is PlatformException) {
        _error = ('network error');
      } else {
        _error = ('Unknown error');
      }
      notifyListeners();
    }
  }
}
