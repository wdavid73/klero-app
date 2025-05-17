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
  const AppVersionState({
    this.versionStatus = VersionStatus.loading,
  });

  @override
  List<Object> get props => [versionStatus];

  AppVersionState copyWith({
    VersionStatus? versionStatus,
  }) {
    return AppVersionState(
      versionStatus: versionStatus ?? this.versionStatus,
    );
  }
}
