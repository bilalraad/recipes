import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/controllers/auth_provider.dart';
import 'package:provider/provider.dart';

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
    final theme = FooderTheme.light();
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(AuthApi()),
      child: App(theme: theme),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Fooder',
      home: context.watch<AuthProvider>().isLoggedIn
          ? const Home()
          : const SignUp(),
    );
  }
}
