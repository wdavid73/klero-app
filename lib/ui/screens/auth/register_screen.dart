import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Text(
          "Register Screen",
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}