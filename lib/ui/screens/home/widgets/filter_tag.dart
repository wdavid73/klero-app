import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/cubits/cubits.dart';

class FilterTag extends StatelessWidget {
  final bool isSelected;
  final String label;
  final int count;
  final VoidCallback onTap;
  final String type;

  const FilterTag({
    super.key,
    required this.isSelected,
    required this.label,
    required this.count,
    required this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? Colors.black : Colors.white;
    final textColor = isSelected ? Colors.white : Colors.black;

    final Map<String, Color> colors = {
      "complete": ColorTheme.success,
      "in_review": ColorTheme.accentColor,
      "to_do": ColorTheme.lightPrimaryColor,
      "remove": ColorTheme.error,
    };

    return BounceIn(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: context.select(
              (ThemeModeCubit cubit) =>
                  cubit.state.isDarkMode ? colors[type] : backgroundColor,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: context.textTheme.labelLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: context.select(
                    (ThemeModeCubit cubit) =>
                        cubit.state.isDarkMode ? Colors.black54 : colors[type],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$count",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
