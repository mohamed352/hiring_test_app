import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/logger/app_logger.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({bool autoLoad = true}) : super(const DetailsState.initial()) {
    if (autoLoad) {
      Future.microtask(_loadInitialData);
    }
  }

  Future<void> _loadInitialData() async {
    log.d('Loading details data', tag: LogTags.bloc);
    emit(const DetailsState.loading());
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (isClosed) return;
    final sports = [
      'Football',
      'Tennis',
      'Ping Pong',
      'Volleyball',
      'Basketball',
    ];
    emit(DetailsState.loaded(sports: sports, selectedSport: sports.first));
  }

  void selectSport(String sport) {
    state.maybeWhen(
      loaded: (sports, _) {
        log.d('Selected sport: $sport', tag: LogTags.bloc);
        emit(DetailsState.loaded(sports: sports, selectedSport: sport));
      },
      orElse: () {},
    );
  }
}
