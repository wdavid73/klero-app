import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:klero_app/config/config.dart';
import 'package:klero_app/ui/views/account_details/widgets/item_detail.dart';
import 'package:klero_app/ui/views/account_details/widgets/user_details.dart';
import 'package:klero_app/ui/views/account_details/widgets/user_profile.dart';
import 'package:klero_app/ui/widgets/widgets.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const UserProfile(
              fullName: "Wilson Padilla",
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
                        text: "wilson@padilla.com",
                      )
                    ],
                  ),
                  const Divider(),
                  UserDetails(
                    title: "Mobile number",
                    items: [
                      ItemDetail(
                        icon: FontAwesomeIcons.phone,
                        text: "+57 3005481972",
                      )
                    ],
                  ),
                  const Divider(),
                  const Spacer(),
                  SizedBox(
                    width: context.width,
                    child: CustomButton(
                      buttonType: CustomButtonType.elevated,
                      onPressed: () {},
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
