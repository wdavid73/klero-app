import 'package:flutter/material.dart';
import 'package:klero_app/config/helpers/extensions.dart';
import 'package:klero_app/config/theme/theme.dart';
import 'package:klero_app/ui/widgets/widgets.dart';
import 'package:versionarte/versionarte.dart';

class CustomForceUpdateVersion extends StatelessWidget {
  final Map<TargetPlatform, String?> downloadUrls;
  const CustomForceUpdateVersion({super.key, required this.downloadUrls});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Icon(
              Icons.install_mobile_outlined,
              size: context.dp(3),
            ),
            Text(
              context.translate("new_version_available"),
              style: context.textTheme.titleMedium,
            ),
            SizedBox(
              width: context.wp(90),
              child: Text(
                context.translate("update_message"),
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    context.translate("update_now"),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward_sharp)
                ],
              ),
              onPressed: () {
                Versionarte.launchDownloadUrl(downloadUrls);
              },
            )
          ],
        ),
      ),
    );
  }
}
