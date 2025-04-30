import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/app/injection.dart';

List<BlocProvider> buildBlocs() => AppInjection.blocs();