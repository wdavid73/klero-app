import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/shared/styles/app_spacing.dart';

class UserProfile extends StatelessWidget {
  final String fullName;
  const UserProfile({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSpacing.md,
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: context.dp(6),
            foregroundColor: ColorTheme.secondaryColor,
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar_person2.png',
                width: context.dp(12),
                height: context.dp(12),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppSpacing.sm,
          Text(
            fullName,
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
