import 'package:flutter/material.dart';
import 'package:hello_flutter/controllers/auth_provider.dart';
import 'package:provider/src/provider.dart';
import '../../data/API/auth_api.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ElevatedButton(
        child: Text('Logout'),
        onPressed: () {
          context.read<AuthProvider>().logOut();
        },
      ),
    );
  }
}
