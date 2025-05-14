import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("settings")),
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
              const SizedBox(height: 20),
              Text(
                context.translate('theme'),
                style: context.textTheme.titleSmall,
              ),
              CustomSwitch(
                icon: Icon(Icons.dark_mode_outlined),
                title: context.translate('dark_theme'),
                switchValue: context.select(
                  (ThemeModeCubit cubit) => cubit.state.isDarkMode,
                ),
                onChanged: (_) {
                  context.read<ThemeModeCubit>().toggleTheme();
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
  const _ItemSettings({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: context.textTheme.bodyMedium,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.zero,
        ),
        Divider(height: 0, endIndent: 0, indent: 0),
      ],
    );
  }
}
