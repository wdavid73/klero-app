import 'package:flutter/material.dart';
import 'package:klero_app/config/theme/utils/responsive.dart';

class LogoContainer extends StatelessWidget {
  final double size;
  const LogoContainer({super.key, this.size = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "assets/app-icon/logo_app_name.png",
        height: context.hp(size),
      ),
    );
  }
}
