import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:versionarte/versionarte.dart';

class CustomVersionarteProvider extends VersionarteProvider {
  final String remoteConfigKey;
  final FirebaseRemoteConfig? remoteConfig;

  CustomVersionarteProvider({
    this.remoteConfig,
    this.remoteConfigKey = 'versionarte',
  });

  Future<FirebaseRemoteConfig> _getRemoteConfig() async {
    if (remoteConfig != null) {
      return remoteConfig!;
    }

    final instance = FirebaseRemoteConfig.instance;
    await instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    await instance.fetchAndActivate();
    return instance;
  }

  @override
  FutureOr<DistributionManifest?> getDistributionManifest() async {
    try {
      final config = await _getRemoteConfig();
      final remoteConfigString = config.getString(remoteConfigKey);
      if (remoteConfigString.isEmpty) {
        return null;
      }

      final remoteConfigData =
          jsonDecode(remoteConfigString) as Map<String, dynamic>;
      final androidData = remoteConfigData["android"] as Map<String, dynamic>?;

      if (androidData == null) {
        return null;
      }

      final versionData = androidData["version"] as Map<String, dynamic>?;
      final minimumVersion = versionData?['minimum'] as String?;
      final latestVersion = versionData?['latest'] as String?;
      final downloadUrl = androidData['download_url'] as String?;
      final statusData = androidData['status'] as Map<String, dynamic>?;
      final isActive = statusData?['active'] as bool? ?? false;
      final messagesData = statusData?['message'] as Map<String, dynamic>?;

      final downloadUrls = <String, String>{};

      if (downloadUrl != null) {
        downloadUrls['android'] = downloadUrl;
      }

      final messages = <String, String>{};
      if (messagesData != null) {
        messages.addAll(messagesData.cast<String, String>());
      }

      return DistributionManifest(
        android: PlatformDistributionInfo(
          downloadUrl: downloadUrl,
          version: VersionDetails(
            minimum: minimumVersion ?? '0.0.1',
            latest: latestVersion ?? '0.0.1',
          ),
          status: StatusDetails(
            active: isActive,
            message: messages,
          ),
        ),
        iOS: null, // Puedes implementar esto si tienes datos para iOS
      );
    } catch (e) {
      debugPrint("[versionarte] Exception: $e");
      return null;
    }
  }
}
