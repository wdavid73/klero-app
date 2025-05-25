import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/shared/styles/app_spacing.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String? description;
  final bool isComplete;
  final String date;
  final String type;
  final void Function(String type)? onSelectOption;
  /* final List<String> categories */

  const TaskItem({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    this.onSelectOption,
    this.description,
    this.isComplete = false,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colors = {
      "complete": ColorTheme.success,
      "in_review": ColorTheme.accentColor,
      "to_do": ColorTheme.lightPrimaryColor,
      "remove": ColorTheme.error,
    };

    return FadeInLeft(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  AppSpacing.sm,
                  if (isComplete)
                    Icon(
                      Icons.check_circle,
                      color: ColorTheme.success,
                      size: context.dp(2),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomPopupMenu(
                    showEdit: type == 'to_do',
                    onTap: (type) =>
                        onSelectOption != null ? onSelectOption!(type) : null,
                    extraOptions: [
                      if (type == 'to_do')
                        PopupMenuItem(
                          onTap: () => onSelectOption != null
                              ? onSelectOption!("in_review")
                              : null,
                          padding: EdgeInsets.zero,
                          child: CustomMenuItem(
                            icon: Icons.visibility,
                            title: context.translate("in_review"),
                          ),
                        ),
                      if (type == 'in_review')
                        PopupMenuItem(
                          onTap: () => onSelectOption != null
                              ? onSelectOption!("complete")
                              : null,
                          padding: EdgeInsets.zero,
                          child: CustomMenuItem(
                            icon: Icons.check,
                            title: context.translate("complete"),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "$description",
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 10,
                  children: [
                    Chip(
                      label: Text(context.translate(type)),
                      backgroundColor: colors[type],
                      elevation: 5,
                      labelStyle: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(color: Colors.black54),
                    ),
                    const Spacer(),
                    Icon(Icons.calendar_month),
                    Text(
                      DateFormat.yMMMd(context.currentLocale()).format(
                        DateTime.parse(date),
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.xs,
            ],
          ),
        ),
      ),
    );
  }
}
