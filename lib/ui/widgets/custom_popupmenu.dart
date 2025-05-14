import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class CustomPopupMenu extends StatelessWidget {
  final void Function(String type) onTap;
  final List<PopupMenuEntry>? extraOptions;
  final bool showEdit;
  final bool showDelete;

  const CustomPopupMenu({
    super.key,
    required this.onTap,
    this.extraOptions,
    this.showDelete = true,
    this.showEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert_rounded),
      popUpAnimationStyle: AnimationStyle(
        curve: Easing.standardDecelerate,
        duration: const Duration(milliseconds: 300),
      ),
      itemBuilder: (context) => <PopupMenuEntry>[
        if (extraOptions != null) ...extraOptions!,
        if (showEdit)
          PopupMenuItem(
            onTap: () => onTap("edit"),
            padding: EdgeInsets.zero,
            child: CustomMenuItem(
                icon: Icons.edit, title: context.translate("edit")),
          ),
        if (showDelete)
          PopupMenuItem(
            onTap: () => onTap("delete"),
            padding: EdgeInsets.zero,
            child: CustomMenuItem(
                icon: Icons.delete, title: context.translate("delete")),
          ),
      ],
    );
  }
}
