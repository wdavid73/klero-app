import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationBloc = context.read<NotificationsBloc>();
    final notificationsStatus = context.watch<NotificationsBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate('home'),
          style: context.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              notificationBloc.requestPermission();
            },
            icon: Icon(
              notificationsStatus.status == AuthorizationStatus.authorized
                  ? Icons.notifications_active
                  : Icons.notifications_off,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*ListTile(
              leading: Icon(Icons.login),
              trailing: Icon(Icons.adaptive.arrow_forward),
              title: Text("go to login"),
              onTap: () => context.push('/login'),
            ),*/
            ListTile(
              leading: Icon(Icons.widgets),
              trailing: Icon(Icons.adaptive.arrow_forward),
              title: Text("go to widgets"),
              onTap: () => context.push('/widgets'),
            ),
            ListTile(
              leading: Icon(Icons.api),
              trailing: Icon(Icons.adaptive.arrow_forward),
              title: Text("go to example api service implementation"),
              onTap: () => context.push('/example_service'),
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: () => context.read<AuthBloc>().logout(),
              label: Text("LogOut"),
              icon: Icon(Icons.logout_rounded),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}