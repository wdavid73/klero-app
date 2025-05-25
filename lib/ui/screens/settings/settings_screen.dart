import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final notificationBloc = context.read<NotificationsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("settings")),

        /* leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.adaptive.arrow_back),
          ), */
      ),
      body: SafeArea(
        child: Container(
          width: context.width,
          height: context.height,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              Text(
                context.translate('general'),
                style: context.textTheme.titleSmall,
              ),
              _ItemSettings(
                title: context.translate('account'),
                icon: Icons.person_rounded,
                onTap: () => context.pushNamed("account_details"),
              ),
              _ItemSettings(
                title: context.translate('delete_account'),
                icon: Icons.delete_forever_rounded,
              ),
              /* const SizedBox(height: 20),
                Text(
                  context.translate('feedback'),
                  style: context.textTheme.titleSmall,
                ),
                _ItemSettings(
                  title: context.translate('report_bug'),
                  icon: Icons.bug_report,
                ),
                _ItemSettings(
                  title: context.translate('send_feedback'),
                  icon: Icons.send_rounded,
                ),
                */

              /*
                const SizedBox(height: 20),
                Text(
                  context.translate('permission'),
                  style: context.textTheme.titleSmall,
                ),
                CustomSwitch(
                  icon: Icon(Icons.notifications),
                  title: context.translate('notifications'),
                  switchValue: context.select(
                    (NotificationsBloc bloc) =>
                        bloc.state.status == AuthorizationStatus.authorized,
                  ),
                  onChanged: (_) {
                    notificationBloc.requestPermission();
                  },
                ),
                const Divider(),
                */

              const SizedBox(height: 20),
              Text(
                context.translate('theme'),
                style: context.textTheme.titleSmall,
              ),
              BlocSelector<ThemeModeCubit, ThemeModeState, bool>(
                bloc: getIt.get<ThemeModeCubit>(),
                selector: (state) => state.isDarkMode,
                builder: (context, isDarkMode) {
                  return CustomSwitch(
                    icon: Icon(Icons.dark_mode_outlined, size: context.dp(2.6)),
                    title: context.translate('dark_theme'),
                    switchValue: isDarkMode,
                    onChanged: (_) {
                      getIt.get<ThemeModeCubit>().toggleTheme();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemSettings extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;
  const _ItemSettings({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = context.dp(2.6);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          leading: Icon(icon, size: iconSize),
          onTap: onTap,
          title: Text(
            title,
            style: context.textTheme.bodyMedium,
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          contentPadding: EdgeInsets.zero,
        ),
        Divider(height: 0, endIndent: 0, indent: 0),
      ],
    );
  }
}
