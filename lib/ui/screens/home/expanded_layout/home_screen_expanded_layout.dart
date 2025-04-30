import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/shared/shared.dart';

class HomeScreenExpandedLayout extends StatelessWidget {
  const HomeScreenExpandedLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: FlutterLogo(
            size: context.dp(25),
          ),
        ),
        AppSpacing.md,
        Text(
          "${context.translate("home")} - Expanded Layout",
          style: context.textTheme.titleLarge,
        ),
      ],
    );
  }
}