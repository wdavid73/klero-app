import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';

class CustomMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: context.dp(2.3),
        color: ColorTheme.primaryColor,
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: ColorTheme.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
