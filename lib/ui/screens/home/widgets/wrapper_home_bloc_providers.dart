import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';

class WrapperHomeBlocProviders extends StatelessWidget {
  final Widget child;
  const WrapperHomeBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final taskBloc = getIt.get<TaskBloc>();
    final authBloc = getIt.get<AuthBloc>();
    final themeModeCubit = getIt.get<ThemeModeCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: taskBloc),
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: themeModeCubit),
      ],
      child: child,
    );
  }
}
