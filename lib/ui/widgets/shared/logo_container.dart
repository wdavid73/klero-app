import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FlutterLogo(
        size: context.dp(7),
      ),
    );
  }
}
