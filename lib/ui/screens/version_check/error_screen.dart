import 'package:flutter/material.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/shared/styles/app_spacing.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String message =
        "(context.read<AppCubit>().state as AppStateError).errorMessage";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorTheme.white,
        body: Stack(
          children: [
            Positioned(
              width: context.width,
              height: context.hp(50),
              child: LogoContainer(
                size: 20,
              ),
            ),
            Center(
              child: Container(
                width: context.wp(80),
                height: context.hp(20),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorTheme.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withValues(alpha: 0.27),
                      offset: Offset(4, 5),
                      blurRadius: 18,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    AppSpacing.lg,
                    Icon(
                      Icons.construction_rounded,
                      size: context.dp(4),
                      color: ColorTheme.primaryColor,
                    ),
                    AppSpacing.md,
                    Text(
                      context.translate(message),
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
