import 'package:ai_assistent_app/configs/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  AppAPI.sendGenres2();
                  AppAPI.getJang();
                },
                child: const Text('api send'),
              ),
            ],
          )),
    );
  }
}
