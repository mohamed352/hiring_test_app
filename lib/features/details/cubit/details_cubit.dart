import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/logger/app_logger.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repository, {bool autoLoad = true})
    : super(const DetailsState.initial()) {
    if (autoLoad) {
      _loadInitialData();
    }
  }
  final StadiumRepository _repository;

  Future<void> _loadInitialData() async {
    log.d('Loading details data', tag: LogTags.bloc);
    emit(const DetailsState.loading());

    try {
      final sports = await _repository.getSports();
      if (isClosed) return;
      emit(
        DetailsState.loaded(
          sports: sports,
          selectedSport: sports.isNotEmpty ? sports.first : '',
        ),
      );
    } catch (e) {
      log.e('Failed to load sports data: $e', tag: LogTags.bloc);
      emit(DetailsState.error(e.toString()));
    }
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

  void retry() => _loadInitialData();
}
