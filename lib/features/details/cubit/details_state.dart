import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loading() = _Loading;
  const factory DetailsState.loaded({
    required List<String> sports,
    required String selectedSport,
  }) = _Loaded;
}
