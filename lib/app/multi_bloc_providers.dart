import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/injection.dart';

List<BlocProvider> buildBlocs() => AppInjection.blocs();
