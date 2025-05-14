import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/app/injection.dart';

List<RepositoryProvider> buildRepositories() => AppInjection.repositories();
