import 'package:flutter/material.dart';
import 'package:klero_app/config/theme/responsive.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "assets/app-icon/logo_app_name.png",
        height: context.hp(10),
      ),
    );
  }
}
