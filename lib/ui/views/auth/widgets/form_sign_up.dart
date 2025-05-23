import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  void _register(BuildContext context) {
    context.unfocus();
    context.read<RegisterFormCubit>().onSubmit();
  }

  void _listenerShowSnackBar(BuildContext context, AuthState state) async {
    if (state.authStatus == AuthStatus.notAuthenticated &&
        state.errorMessage != '') {
      CustomSnackBar.showSnackBar(
        context,
        message: context.translate(state.errorMessage),
        icon: Icons.warning_rounded,
        colorIcon: ColorTheme.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterFormCubit>();
    final state = context.watch<RegisterFormCubit>().state;

    return BlocListener<AuthBloc, AuthState>(
      listener: _listenerShowSnackBar,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            textFormFieldKey: const Key("fullName_field"),
            label: context.translate('fullname_label'),
            hint: context.translate('fullname_hint'),
            prefixIcon: Icon(Icons.person_rounded),
            onChanged: cubit.fullNameChanged,
            errorMessage: context.translate('${state.fullName.errorMessage}'),
            /* initialValue: state.fullName.value, */
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("email_field"),
            label: context.translate('email_label'),
            hint: context.translate('email_hint'),
            prefixIcon: Icon(Icons.email_rounded),
            onChanged: cubit.emailChanged,
            errorMessage: context.translate('${state.email.errorMessage}'),
            /* initialValue: state.email.value, */
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("password_field"),
            label: context.translate('password_label'),
            hint: context.translate('password_hint'),
            prefixIcon: Icon(Icons.password),
            obscureText: state.isObscure,
            toggleObscure: cubit.toggleObscure,
            onChanged: cubit.passwordChanged,
            errorMessage: context.translate('${state.password.errorMessage}'),
            /* initialValue: state.password.value, */
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("confirm_password_field"),
            label: context.translate('confirm_password_label'),
            hint: context.translate('confirm_password_hint'),
            prefixIcon: Icon(Icons.password),
            obscureText: state.isObscure,
            toggleObscure: cubit.toggleObscure,
            onChanged: cubit.confirmPasswordChanged,
            errorMessage:
                context.translate('${state.confirmPassword.errorMessage}'),
            /* initialValue: state.confirmPassword.value, */
          ),
          SizedBox(
            width: context.width,
            child: CustomButton(
              buttonKey: const Key("register_button"),
              label: context.translate("sign_up"),
              icon: Icon(Icons.login_rounded),
              isLoading: context.select(
                (AuthBloc bloc) => bloc.state.isCreating,
              ),
              onPressed: state.isPosting ? null : () => _register(context),
            ),
          ),
        ],
      ),
    );
  }
}
