import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/cubits/cubits.dart';
import 'package:front_scaffold_flutter_v2/ui/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Register",
          style: context.textTheme.titleLarge?.copyWith(
            color: ColorTheme.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Container(
        width: context.width,
        height: context.height,
        alignment: Alignment.center,
        child: const _RegisterBody(),
      )),
    );
  }
}

class _RegisterBody extends StatelessWidget {
  const _RegisterBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  LogoContainer(),
                  const SizedBox(height: 10),
                  Text(
                    context.translate('sign_up'),
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  _FormSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormSignUp extends StatelessWidget {
  const _FormSignUp();

  @override
  Widget build(BuildContext context) {
    final authBlocState = context.watch<AuthBloc>().state;
    final registerCubit = context.watch<RegisterFormCubit>();
    final fullName = registerCubit.state.fullName;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    final confirmPassword = registerCubit.state.confirmPassword;

    void listenerShowSnackBar(BuildContext context, AuthState state) async {
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

    return BlocListener<AuthBloc, AuthState>(
      listener: listenerShowSnackBar,
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
            onChanged: registerCubit.fullNameChanged,
            errorMessage: context.translate('${fullName.errorMessage}'),
            initialValue: registerCubit.state.fullName.value,
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("email_field"),
            label: context.translate('email_label'),
            hint: context.translate('email_hint'),
            prefixIcon: Icon(Icons.email_rounded),
            onChanged: registerCubit.emailChanged,
            errorMessage: context.translate('${email.errorMessage}'),
            initialValue: registerCubit.state.email.value,
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("password_field"),
            label: context.translate('password_label'),
            hint: context.translate('password_hint'),
            prefixIcon: Icon(Icons.password),
            obscureText: registerCubit.state.isObscure,
            toggleObscure: registerCubit.toggleObscure,
            onChanged: registerCubit.passwordChanged,
            errorMessage: context.translate('${password.errorMessage}'),
            initialValue: registerCubit.state.password.value,
          ),
          CustomTextFormField(
            textFormFieldKey: const Key("confirm_password_field"),
            label: context.translate('confirm_password_label'),
            hint: context.translate('confirm_password_hint'),
            prefixIcon: Icon(Icons.password),
            obscureText: registerCubit.state.isObscure,
            toggleObscure: registerCubit.toggleObscure,
            onChanged: registerCubit.confirmPasswordChanged,
            errorMessage: context.translate('${confirmPassword.errorMessage}'),
            initialValue: registerCubit.state.confirmPassword.value,
          ),
          SizedBox(
            width: context.width,
            child: CustomButton(
              buttonKey: const Key("register_button"),
              label: context.translate("sign_up"),
              icon: Icon(Icons.login_rounded),
              isLoading: authBlocState.isCreating,
              onPressed: registerCubit.state.isPosting
                  ? null
                  : () => registerCubit.onSubmit(),
            ),
          ),
        ],
      ),
    );
  }
}
