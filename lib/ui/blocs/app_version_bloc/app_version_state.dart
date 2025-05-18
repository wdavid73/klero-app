part of 'app_version_bloc.dart';

enum VersionStatus {
  loading,
  maintenance,
  forceUpdate,
  ready,
  outdated,
  error,
  unknown,
}

class AppVersionState extends Equatable {
  final VersionStatus versionStatus;
  final Map<TargetPlatform, String?> downloadUrls;
  const AppVersionState({
    this.versionStatus = VersionStatus.loading,
    this.downloadUrls = const {},
  });

  @override
  List<Object> get props => [versionStatus, downloadUrls];

  AppVersionState copyWith({
    VersionStatus? versionStatus,
    Map<TargetPlatform, String?>? downloadUrls,
  }) {
    return AppVersionState(
      versionStatus: versionStatus ?? this.versionStatus,
      downloadUrls: downloadUrls ?? this.downloadUrls,
    );
  }
}
