import 'package:flutter/material.dart';
import 'package:klero_app/config/theme/theme.dart';

class UserDetails extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const UserDetails({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium,
          ),
          ...items,
        ],
      ),
    );
  }
}
