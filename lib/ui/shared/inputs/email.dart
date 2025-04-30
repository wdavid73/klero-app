import 'package:formz/formz.dart';

enum EmailInputError { empty, format }

class Email extends FormzInput<String, EmailInputError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  const Email.pure() : super.pure('');

  const Email.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailInputError.empty) {
      return 'is_required';
    }

    if (displayError == EmailInputError.format) {
      return 'is_email';
    }

    return null;
  }

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailInputError.format;
    return null;
  }
}