import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hiring_test_app/features/home/models/stadium_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<String> cities,
    required String selectedCity,
    required List<StadiumModel> stadiums,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
