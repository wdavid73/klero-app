import 'package:klero_app/domain/usecases/auth_usecases.dart';
import 'package:klero_app/ui/shared/service/service.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthUseCase extends Mock implements AuthUseCases {}

class MockKeyValueStorageService extends Mock
    implements KeyValueStorageService {}
