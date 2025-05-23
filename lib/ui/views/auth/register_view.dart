import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/shared/styles/app_spacing.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

import './widgets/form_sign_up.dart';
import './widgets/wrapper_bloc_providers.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: context.wp(10),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(
                            Icons.adaptive.arrow_back,
                            size: context.dp(3),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: context.wp(10)),
                          child: LogoContainer(),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.sm,
                  Text(
                    context.translate('sign_up'),
                    style: context.textTheme.titleMedium,
                  ),
                  AppSpacing.sm,
                  WrapperBlocProvidersAuth(child: FormSignUp()),
                  AppSpacing.sm,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
