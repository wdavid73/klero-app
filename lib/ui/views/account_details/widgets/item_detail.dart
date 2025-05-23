import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klero_app/config/config.dart';

class ItemDetail extends StatelessWidget {
  final IconData icon;
  final String? label;
  final String text;
  const ItemDetail({
    super.key,
    required this.icon,
    this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorTheme.lightPrimaryColor.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            icon,
            size: context.dp(2.5),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (label != null)
              Text(
                "$label",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorTheme.textSecondary,
                ),
              ),
            Text(
              text,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
