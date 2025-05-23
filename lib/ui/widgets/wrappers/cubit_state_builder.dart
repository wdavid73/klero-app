import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CubitStateBuilder<C extends Cubit<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state) builder;

  const CubitStateBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<C>();
    return StreamBuilder<S>(
      stream: cubit.stream,
      initialData: cubit.state,
      builder: (context, snapshot) {
        final state = snapshot.data as S;
        return builder(context, state);
      },
    );
  }
}

extension ReadCubitStateExtension on BuildContext {
  S readCubitState<C extends Cubit<S>, S>() {
    return GetIt.I<C>().state;
  }
}
