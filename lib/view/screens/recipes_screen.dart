import 'package:flutter/material.dart';
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
          AuthApi().logOut();
        },
      ),
    );
  }
}
