import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/ui/blocs/task/task_bloc.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

import './widgets/task_form.dart';
import './widgets/wrapper_task_bloc_providers.dart';

class TaskScreen extends StatelessWidget {
  final String taskId;
  const TaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final themeMode = getIt.get<ThemeModeCubit>();
    final Task? task = getIt.get<TaskBloc>().getTaskById(taskId);

    return AdaptiveScaffold(
      scaffoldBackgroundColor:
          themeMode.state.isDarkMode ? null : ColorTheme.lightPrimaryColor,
      appBar: AppBar(
        title: Text(
          context.translate(
            taskId == 'new' ? "create_task_title" : "edit_task_title",
          ),
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Stack(
          children: [
            ElasticIn(
              child: Image(
                image: AssetImage("assets/images/create_task.png"),
                height: context.hp(50),
              ),
            ),
            SlideInUp(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: themeMode.state.isDarkMode
                        ? ColorTheme.navigationBackgroundColorDark
                        : ColorTheme.white,
                  ),
                  child: WrapperTaskBlocProviders(child: FormTask(task: task)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
