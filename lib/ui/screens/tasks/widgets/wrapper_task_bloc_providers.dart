import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';

class WrapperTaskBlocProviders extends StatelessWidget {
  final Widget child;
  const WrapperTaskBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final createTaskCubit = getIt.get<CreateTaskCubit>();
    final taskBloc = getIt.get<TaskBloc>();
    final authBloc = getIt.get<AuthBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateTaskCubit>(create: (_) => createTaskCubit),
        BlocProvider<TaskBloc>.value(value: taskBloc),
        BlocProvider<AuthBloc>.value(value: authBloc),
      ],
      child: child,
    );
  }
}
