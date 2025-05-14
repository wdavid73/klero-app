import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          context.translate('login'),
          style: context.textTheme.titleLarge,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _LoginView(),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/auth_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Container(
          width: context.width,
          height: context.height,
          alignment: Alignment.center,
          child: _LoginBody(),
        ),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
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
                      context.translate('sign_in_account'),
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    _ButtonsOtherSignIn(),
                    const SizedBox(height: 10),
                    _DividerBody(
                      text: "Or use email",
                    ),
                    const SizedBox(height: 10),
                    _FormSignIn(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          "${context.translate("not_have_account")},",
                          style: context.textTheme.labelMedium,
                        ),
                        TextButton(
                          key: Key("go_to_register_screen"),
                          onPressed: () => context.pushNamed("register"),
                          child: Text(
                            context.translate("create_one_here"),
                            style: context.textTheme.labelMedium?.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: AppTypography.semiBoldWeight,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonsOtherSignIn extends StatelessWidget {
  const _ButtonsOtherSignIn();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.textTheme.bodyMedium?.copyWith(
      color: ColorTheme.textPrimary,
    );

    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        ColorTheme.backgroundLight,
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 10),
      ),
    );

    double iconSize = context.dp(3);

    return Wrap(
      children: [
        FilledButton(
          onPressed: () {},
          style: buttonStyle,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPictureCustom(
                iconPath: 'assets/icon/icon_google.svg',
                iconSize: iconSize,
              ),
              const SizedBox(width: 10),
              Text(
                context.translate('sign_in_with_google'),
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DividerBody extends StatelessWidget {
  final String text;
  const _DividerBody({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 10),
        Text(text),
        const SizedBox(width: 10),
        Expanded(child: Divider()),
      ],
    );
  }
}

class _FormSignIn extends StatelessWidget {
  const _FormSignIn();

  @override
  Widget build(BuildContext context) {
    final signInForm = context.watch<SignInFormCubit>();
    final email = signInForm.state.email;
    final password = signInForm.state.password;

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
            textFormFieldKey: Key("email_field"),
            label: "Email",
            hint: "Input your email",
            prefixIcon: Icon(Icons.email_rounded),
            onChanged: signInForm.emailChanged,
            errorMessage: context.translate("${email.errorMessage}"),
            initialValue: signInForm.state.email.value,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            textFormFieldKey: Key("password_field"),
            label: "Password",
            hint: "Input your password",
            obscureText: signInForm.state.isObscure,
            toggleObscure: signInForm.toggleObscure,
            prefixIcon: Icon(Icons.password),
            onChanged: signInForm.passwordChanged,
            errorMessage: context.translate("${password.errorMessage}"),
            initialValue: signInForm.state.password.value,
          ),
          SizedBox(
            width: context.width,
            child: FilledButton.icon(
              key: Key("login_button"),
              onPressed: signInForm.state.isPosting
                  ? null
                  : () => signInForm.onSubmit(),
              icon: Icon(Icons.login_rounded),
              label: Text("Sign in"),
            ),
          )
        ],
      ),
    );
  }
}
