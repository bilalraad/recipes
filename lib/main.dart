import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'data/API/auth_api.dart';
import 'data/models/theme.dart';
import 'view/screens/home.dart';
import 'view/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Fooder());
}

class Fooder extends StatelessWidget {
  Fooder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = AuthApi();

    final theme = FooderTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooder',
      home: auth.isLogged() ? const Home() : const SignUp(),
    );
  }
}
