import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/ui/cubits/cubits.dart';
import 'package:front_scaffold_flutter_v2/ui/widgets/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    context.read<IntroductionCubit>().markIntroductionAsSeen();
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: context.textTheme.titleLarge!.copyWith(
        color: ColorTheme.white,
      ),
      bodyTextStyle: context.textTheme.bodyLarge!.copyWith(
        color: ColorTheme.white,
      ),
    );
    return IntroductionScreen(
      key: introKey,
      onDone: () => _onIntroEnd(),
      onSkip: () => _onIntroEnd(),
      showDoneButton: true,
      showNextButton: true,
      showBackButton: true,
      showSkipButton: true,
      done: Text(
        context.translate('done'),
        style: context.textTheme.bodyLarge?.copyWith(
          color: ColorTheme.white,
        ),
      ),
      next: Icon(
        Icons.adaptive.arrow_forward,
        color: ColorTheme.white,
        size: context.dp(3),
      ),
      back: Icon(
        Icons.adaptive.arrow_back,
        color: ColorTheme.white,
        size: context.dp(3),
      ),
      skip: Text(
        context.translate('skip'),
        style: context.textTheme.bodyLarge?.copyWith(
          color: ColorTheme.white,
        ),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: ColorTheme.lightPrimaryColor,
      ),
      globalBackgroundColor: ColorTheme.primaryColor,
      pages: [
        PageViewModel(
          image: SvgPictureCustom(
            iconPath: "assets/images/introduction/startup.svg",
            iconSize: context.dp(20),
          ),
          title: context.translate('section_one_title'),
          body: context.translate('section_one_body'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: SvgPictureCustom(
            iconPath: "assets/images/introduction/dashboard.svg",
            iconSize: context.dp(20),
          ),
          title: context.translate('section_two_title'),
          body: context.translate('section_two_body'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: SvgPictureCustom(
            iconPath: "assets/images/introduction/construction.svg",
            iconSize: context.dp(20),
          ),
          title: context.translate('section_three_title'),
          body: context.translate('section_three_body'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
