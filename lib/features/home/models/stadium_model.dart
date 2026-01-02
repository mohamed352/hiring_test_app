import 'package:freezed_annotation/freezed_annotation.dart';

part 'stadium_model.freezed.dart';
part 'stadium_model.g.dart';

@freezed
abstract class StadiumModel with _$StadiumModel {
  const factory StadiumModel({
    required String id,
    required String name,
    required String location,
    required String imagePath,
    required double rating,
    required double distance,
    required double price,
    required String description,
  }) = _StadiumModel;

  factory StadiumModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumModelFromJson(json);
}
