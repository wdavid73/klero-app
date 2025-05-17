import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/shared/shared.dart';

class VersionNotification extends StatelessWidget {
  const VersionNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final versionBloc = context.watch<AppVersionBloc>().state;

    if (versionBloc.versionStatus == VersionStatus.outdated) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        constraints: BoxConstraints(
          minWidth: context.wp(60),
          maxWidth: context.wp(80),
        ),
        decoration: BoxDecoration(
          color: ColorTheme.lightPrimaryColor.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.new_releases_outlined,
              size: context.dp(2.5),
            ),
            AppSpacing.md,
            Text(
              context.translate("new_version_available"),
              style: context.textTheme.titleMedium
                  ?.copyWith(color: ColorTheme.primaryColor),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
