import 'package:klero_app/domain/usecases/auth_usecase.dart';
import 'package:klero_app/ui/shared/service/service.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthUseCase extends Mock implements AuthUseCase {}

class MockKeyValueStorageService extends Mock
    implements KeyValueStorageService {}
