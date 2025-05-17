import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klero_app/ui/blocs/custom_versionarte_provider.dart';
import 'package:versionarte/versionarte.dart';

part 'app_version_event.dart';
part 'app_version_state.dart';

class AppVersionBloc extends Bloc<AppVersionEvent, AppVersionState> {
  AppVersionBloc() : super(AppVersionState()) {
    on<CheckVersionEvent>((event, emit) async {
      emit(state.copyWith(versionStatus: VersionStatus.loading));

      try {
        final result = await Versionarte.check(
          versionarteProvider: CustomVersionarteProvider(
            remoteConfigKey: "versionarte",
          ),
        );

        switch (result.status) {
          case VersionarteStatus.inactive:
            emit(state.copyWith(
              versionStatus: VersionStatus.maintenance,
            ));
            break;
          case VersionarteStatus.forcedUpdate:
            emit(state.copyWith(
              versionStatus: VersionStatus.forceUpdate,
            ));

            break;
          case VersionarteStatus.outdated:
            emit(state.copyWith(
              versionStatus: VersionStatus.outdated,
            ));
          case VersionarteStatus.upToDate:
            emit(state.copyWith(
              versionStatus: VersionStatus.ready,
            ));
            break;
          case VersionarteStatus.unknown:
            emit(state.copyWith(
              versionStatus: VersionStatus.error,
            ));
            break;
        }
      } catch (e) {
        emit(state.copyWith(
          versionStatus: VersionStatus.error,
        ));
      }
    });
  }

  void checkVersion() {
    add(CheckVersionEvent());
  }
}
