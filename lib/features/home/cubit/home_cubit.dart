import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/logger/app_logger.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';
import 'package:hiring_test_app/features/home/models/stadium_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository, {bool autoLoad = true})
    : super(const HomeState.initial()) {
    if (autoLoad) {
      _loadInitialData();
    }
  }
  final StadiumRepository _repository;

  void _loadInitialData() async {
    log.d('Loading initial home data', tag: LogTags.bloc);
    emit(const HomeState.loading());

    try {
      final results = await Future.wait([
        _repository.getCities(),
        _repository.getStadiums(),
      ]);

      final cities = results[0] as List<String>;
      final stadiums = results[1] as List<StadiumModel>;

      log.i('Home data loaded successfully', tag: LogTags.bloc);
      emit(
        HomeState.loaded(
          cities: cities,
          selectedCity: cities.isNotEmpty ? cities.first : '',
          stadiums: stadiums,
        ),
      );
    } catch (e) {
      log.e('Failed to load home data: $e', tag: LogTags.bloc);
      emit(HomeState.error(e.toString()));
    }
  }

  void retry() => _loadInitialData();

  void changeCity(String city) {
    state.maybeWhen(
      loaded: (cities, currentCity, stadiums) {
        log.i('City changed to: $city', tag: LogTags.bloc);
        emit(
          HomeState.loaded(
            cities: cities,
            selectedCity: city,
            stadiums: stadiums,
          ),
        );
      },
      orElse: () {},
    );
  }
}
