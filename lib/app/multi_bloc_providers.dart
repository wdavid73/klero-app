import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/app/injection.dart';

List<BlocProvider> buildBlocs() => AppInjection.blocs();
