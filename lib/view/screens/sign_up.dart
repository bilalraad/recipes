import 'dart:math';

import 'package:flutter/material.dart';
import '../../data/API/auth_api.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'example@ajdh.com',
                  label: Text('Email'),
                ),
                validator: (val) {
                  if (val == null) {
                    return "email can't be null";
                  } else if (val.isEmpty) {
                    return "email can't be empty";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'iquwyeiq7e',
                  label: Text('Password'),
                ),
                validator: (val) {
                  if (val == null) {
                    return "pass can't be null";
                  } else if (val.isEmpty) {
                    return "pass can't be empty";
                  } else if (val.length <= 6) {
                    return "should be longer than 6";
                  }

                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_fromKey.currentState!.validate()) {
                    try {
                      await AuthApi().signUp(
                          emailController.text, passwordController.text);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text('SignUp'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
