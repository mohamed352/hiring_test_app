// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stadium_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StadiumModel _$StadiumModelFromJson(Map<String, dynamic> json) =>
    _StadiumModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      imagePath: json['imagePath'] as String,
      rating: (json['rating'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$StadiumModelToJson(_StadiumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'imagePath': instance.imagePath,
      'rating': instance.rating,
      'distance': instance.distance,
      'price': instance.price,
      'description': instance.description,
    };
