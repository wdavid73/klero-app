import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/app/dependency_injection.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/blocs/blocs.dart';
import 'package:klero_app/ui/cubits/cubits.dart';
import 'package:klero_app/ui/views/account_details/widgets/item_detail.dart';
import 'package:klero_app/ui/views/account_details/widgets/user_details.dart';
import 'package:klero_app/ui/views/account_details/widgets/user_profile.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt.get<AuthBloc>();
    final themeMode = getIt.get<ThemeModeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate("account_details"),
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: context.width,
            height: context.hp(35),
            decoration: BoxDecoration(
              color: ColorTheme.secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: UserProfile(
              fullName: authBloc.state.user!.fullName,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  UserDetails(
                    title: "Email",
                    items: [
                      ItemDetail(
                        icon: FontAwesomeIcons.envelope,
                        label: "Principal",
                        text: authBloc.state.user!.email,
                      )
                    ],
                  ),
                  const Divider(),
                  Opacity(
                    opacity: 0.2,
                    child: SvgPictureCustom(
                      iconPath: 'assets/icon/logo_app.svg',
                      iconSize: context.dp(20),
                      colorFilter: themeMode.state.isDarkMode
                          ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                          : ColorFilter.mode(
                              ColorTheme.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: context.width,
                    child: CustomButton(
                      buttonType: CustomButtonType.elevated,
                      onPressed: () => authBloc.logout(),
                      label: context.translate('logout'),
                      icon: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
