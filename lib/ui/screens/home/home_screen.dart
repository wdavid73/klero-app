import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/screens/home/widgets/drawer_home.dart';
import 'package:klero_app/ui/shared/styles/app_spacing.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

import './widgets/filter_tag.dart';
import './widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    final uid = context.read<AuthBloc>().state.user!.id;
    context.read<TaskBloc>().getTasks(uid: uid);
  }

  void _showForceUpdateDialog(BuildContext context) {
    final appVersionBloc = context.read<AppVersionBloc>();
    if (appVersionBloc.state.versionStatus == VersionStatus.forceUpdate) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomForceUpdateVersion(
            downloadUrls: appVersionBloc.state.downloadUrls,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showForceUpdateDialog(context));
    return AdaptiveScaffold(
      appBar: _appBarHome(context),
      drawer: DrawerHome(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TaskBloc>().createMultiple(),
        child: Icon(Icons.add, size: context.dp(2.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _FilterCategories(),
          AppSpacing.sm,
          VersionNotification(),
          _ListBody(),
        ],
      ),
    );
  }

  PreferredSizeWidget? _appBarHome(BuildContext context) {
    return AppBar(
      title: Text(context.translate('home')),
      actions: [
        IconButton(
          onPressed: () => context.push('/settings'),
          icon: Icon(Icons.settings),
        )
      ],
    );
  }
}

class _FilterCategories extends StatelessWidget {
  const _FilterCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          FilterTag(
            count: context.select(
              (TaskBloc cubit) =>
                  cubit.state.tasks.where((e) => e.type == 'to_do').length,
            ),
            isSelected: context.select(
              (TaskBloc bloc) => bloc.state.filter == 'to_do',
            ),
            label: context.translate("to_do"),
            type: "to_do",
            onTap: () => context.read<TaskBloc>().filterTags("to_do"),
          ),
          FilterTag(
            count: context.select(
              (TaskBloc cubit) =>
                  cubit.state.tasks.where((e) => e.type == 'in_review').length,
            ),
            isSelected: context.select(
              (TaskBloc bloc) => bloc.state.filter == 'in_review',
            ),
            label: context.translate("in_review"),
            type: "in_review",
            onTap: () => context.read<TaskBloc>().filterTags("in_review"),
          ),
          FilterTag(
            count: context.select(
              (TaskBloc cubit) =>
                  cubit.state.tasks.where((e) => e.type == 'complete').length,
            ),
            isSelected: context.select(
              (TaskBloc bloc) => bloc.state.filter == 'complete',
            ),
            label: context.translate("complete"),
            type: "complete",
            onTap: () => context.read<TaskBloc>().filterTags("complete"),
          ),
        ],
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody();

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();
    final taskBlocState = context.watch<TaskBloc>().state;

    if (taskBlocState.isLoading) {
      return Expanded(
        child: ShimmerList(),
      );
    }

    if (taskBlocState.tasks.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemCount: taskBlocState.tasks.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            Task task = taskBlocState.tasks[index];
            return TaskItem(
              title: task.title,
              description: task.description,
              isComplete: task.type == 'complete',
              date: task.date,
              type: task.type,
              onSelectOption: (type) {
                if (type == 'delete') taskBloc.deleteTask(task);
                if (type == 'edit') context.push("/task/${task.id}");
                if (type == 'complete') {
                  taskBloc.promoteTask(promote: "complete", task: task);
                }
                if (type == 'in_review') {
                  taskBloc.promoteTask(promote: "in_review", task: task);
                }
              },
            );
          },
        ),
      );
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.translate("its_empty"),
            style: context.textTheme.headlineMedium,
          ),
          Text("UID: ${context.read<AuthBloc>().state.user!.id}"),
        ],
      ),
    );
  }
}

/* class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}

class _MediumNavigationRailHome extends StatelessWidget {
  const _MediumNavigationRailHome();

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      onDestinationSelected: (index) {},
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text("Profile"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
    );
  }
}

class _ExpandedNavigationDrawerHome extends StatelessWidget {
  const _ExpandedNavigationDrawerHome();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: 0,
      onDestinationSelected: (index) {},
      children: [
        CustomDrawerHeader(),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person),
          label: Text("Profile"),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
    );
  }
}
 */
