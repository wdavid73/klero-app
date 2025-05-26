import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/domain/entities/task.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class FormTask extends StatefulWidget {
  final Task? task;
  const FormTask({super.key, this.task});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    context.read<CreateTaskCubit>().setFormField(widget.task);
  }

  void _onSubmit(BuildContext context) {
    context.unfocus();
    String userId = context.read<AuthBloc>().state.user!.id;
    context.read<CreateTaskCubit>().onSubmit(userId: userId);
  }

  void _listener(BuildContext context, TaskState state) {
    if (state.status == TaskStatus.error) {
      CustomSnackBar.showSnackBar(
        context,
        message: state.error,
        icon: Icons.warning_rounded,
        colorIcon: ColorTheme.error,
      );
    } else if (state.status == TaskStatus.created) {
      CustomSnackBar.showSnackBar(
        context,
        message: "Task created!",
        icon: Icons.task_alt_rounded,
      );
      Future.delayed((const Duration(milliseconds: 100))).then((_) {
        if (context.mounted) {
          context.pop();
        }
      });
    } else if (state.status == TaskStatus.updated) {
      CustomSnackBar.showSnackBar(
        context,
        message: "Task updated!",
        icon: Icons.task_alt_rounded,
      );
      Future.delayed((const Duration(milliseconds: 100))).then((_) {
        if (context.mounted) {
          context.pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();
    final state = context.watch<CreateTaskCubit>().state;

    return BlocListener<TaskBloc, TaskState>(
      listener: _listener,
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
                errorMessage: context.translate("${state.title.errorMessage}"),
                initialValue: state.title.value,
              ),
              CustomDatePickerField(
                label: context.translate("task_date_label"),
                hintText: context.translate("task_date_hint"),
                errorMessage: context.translate("${state.date.errorMessage}"),
                initialDate: state.date.value,
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
                errorMessage:
                    context.translate("${state.description.errorMessage}"),
                initialValue: state.description.value,
                maxLines: 3,
              ),
              SizedBox(
                width: context.width,
                child: CustomButton(
                  buttonType: CustomButtonType.elevated,
                  label: context.translate(
                    widget.task == null ? "create_task" : "update_task",
                  ),
                  icon: Icon(Icons.add),
                  isLoading: context.select(
                    (TaskBloc bloc) => bloc.state.creatingTask,
                  ),
                  onPressed: state.isPosting ? null : () => _onSubmit(context),
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
