import 'package:front_scaffold_flutter_v2/domain/usecases/auth_usecase.dart';
import 'package:front_scaffold_flutter_v2/ui/shared/service/service.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthUseCase extends Mock implements AuthUseCase {}

class MockKeyValueStorageService extends Mock
    implements KeyValueStorageService {}
