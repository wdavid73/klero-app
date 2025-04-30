import 'package:formz/formz.dart';

enum PasswordInputError { empty, length }

class Password extends FormzInput<String, PasswordInputError> {
  const Password.pure() : super.pure('');

  const Password.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty) {
      return 'is_required';
    }

    if (displayError == PasswordInputError.length) {
      return 'is_password_length';
    }

    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;
    return null;
  }
}