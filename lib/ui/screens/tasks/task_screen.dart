import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/ui/blocs/task/task_bloc.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class TaskScreen extends StatelessWidget {
  final String taskId;
  const TaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final Task? task = context.watch<TaskBloc>().getTaskById(taskId);

    return AdaptiveScaffold(
      scaffoldBackgroundColor: context.select(
        (ThemeModeCubit cubit) =>
            cubit.state.isDarkMode ? null : ColorTheme.lightPrimaryColor,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          context.translate("create_task_title"),
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                    color: context.select(
                      (ThemeModeCubit cubit) => cubit.state.isDarkMode
                          ? ColorTheme.navigationBackgroundColorDark
                          : ColorTheme.white,
                    ),
                  ),
                  child: FormTask(task: task),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormTask extends StatefulWidget {
  final Task? task;
  const FormTask({super.key, this.task});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  @override
  void initState() {
    context.read<CreateTaskCubit>().setFormField(widget.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateTaskCubit>();
    final taskCubit = context.watch<TaskBloc>();

    final title = cubit.state.title;
    final description = cubit.state.description;
    final date = cubit.state.date;

    void onSubmit() {
      FocusScope.of(context).unfocus();
      cubit.onSubmit();
    }

    void navigateBack() => context.pop();

    void listener(BuildContext context, TaskState state) {
      if (state.status == TaskStatus.error) {
        CustomSnackBar.showSnackBar(
          context,
          message: state.error,
          icon: Icons.warning_rounded,
          colorIcon: ColorTheme.error,
        );
      }

      if (state.status == TaskStatus.created) {
        CustomSnackBar.showSnackBar(context, message: "Task created!");
        Future.delayed((const Duration(milliseconds: 100)))
            .then((_) => navigateBack());
      }

      if (state.status == TaskStatus.updated) {
        CustomSnackBar.showSnackBar(context, message: "Task updated!");
        Future.delayed((const Duration(milliseconds: 100)))
            .then((_) => navigateBack());
      }
    }

    return BlocListener<TaskBloc, TaskState>(
      listener: listener,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                label: context.translate("task_title_label"),
                hint: context.translate("task_title_hint"),
                onChanged: cubit.titleChanged,
                errorMessage: context.translate("${title.errorMessage}"),
                initialValue: title.value,
              ),
              CustomDatePickerField(
                label: context.translate("task_date_label"),
                hintText: context.translate("task_date_hint"),
                errorMessage: context.translate("${date.errorMessage}"),
                initialDate: date.value,
                firstDate: DateTime.now(),
                onChanged: cubit.dateChanged,
                suffixIcon: Icon(
                  Icons.calendar_month,
                  size: context.dp(2.5),
                ),
              ),
              CustomTextFormField(
                label: context.translate("task_description_label"),
                hint: context.translate("task_description_hint"),
                onChanged: cubit.descriptionChanged,
                errorMessage: context.translate("${description.errorMessage}"),
                initialValue: description.value,
                maxLines: 3,
              ),
              SizedBox(
                width: context.width,
                child: CustomButton(
                  label: context.translate("create_task"),
                  icon: Icon(Icons.add),
                  isLoading: taskCubit.state.creatingTask,
                  onPressed: cubit.state.isPosting ? null : onSubmit,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
