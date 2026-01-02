// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stadium_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StadiumModel {

 String get id; String get name; String get location; String get imagePath; double get rating; double get distance; double get price; String get description;
/// Create a copy of StadiumModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StadiumModelCopyWith<StadiumModel> get copyWith => _$StadiumModelCopyWithImpl<StadiumModel>(this as StadiumModel, _$identity);

  /// Serializes this StadiumModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,imagePath,rating,distance,price,description);

@override
String toString() {
  return 'StadiumModel(id: $id, name: $name, location: $location, imagePath: $imagePath, rating: $rating, distance: $distance, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class $StadiumModelCopyWith<$Res>  {
  factory $StadiumModelCopyWith(StadiumModel value, $Res Function(StadiumModel) _then) = _$StadiumModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String location, String imagePath, double rating, double distance, double price, String description
});




}
/// @nodoc
class _$StadiumModelCopyWithImpl<$Res>
    implements $StadiumModelCopyWith<$Res> {
  _$StadiumModelCopyWithImpl(this._self, this._then);

  final StadiumModel _self;
  final $Res Function(StadiumModel) _then;

/// Create a copy of StadiumModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,Object? imagePath = null,Object? rating = null,Object? distance = null,Object? price = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StadiumModel].
extension StadiumModelPatterns on StadiumModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StadiumModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StadiumModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StadiumModel value)  $default,){
final _that = this;
switch (_that) {
case _StadiumModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StadiumModel value)?  $default,){
final _that = this;
switch (_that) {
case _StadiumModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String imagePath,  double rating,  double distance,  double price,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StadiumModel() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.imagePath,_that.rating,_that.distance,_that.price,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String location,  String imagePath,  double rating,  double distance,  double price,  String description)  $default,) {final _that = this;
switch (_that) {
case _StadiumModel():
return $default(_that.id,_that.name,_that.location,_that.imagePath,_that.rating,_that.distance,_that.price,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String location,  String imagePath,  double rating,  double distance,  double price,  String description)?  $default,) {final _that = this;
switch (_that) {
case _StadiumModel() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.imagePath,_that.rating,_that.distance,_that.price,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StadiumModel implements StadiumModel {
  const _StadiumModel({required this.id, required this.name, required this.location, required this.imagePath, required this.rating, required this.distance, required this.price, required this.description});
  factory _StadiumModel.fromJson(Map<String, dynamic> json) => _$StadiumModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String location;
@override final  String imagePath;
@override final  double rating;
@override final  double distance;
@override final  double price;
@override final  String description;

/// Create a copy of StadiumModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StadiumModelCopyWith<_StadiumModel> get copyWith => __$StadiumModelCopyWithImpl<_StadiumModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StadiumModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StadiumModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,imagePath,rating,distance,price,description);

@override
String toString() {
  return 'StadiumModel(id: $id, name: $name, location: $location, imagePath: $imagePath, rating: $rating, distance: $distance, price: $price, description: $description)';
}


}

/// @nodoc
abstract mixin class _$StadiumModelCopyWith<$Res> implements $StadiumModelCopyWith<$Res> {
  factory _$StadiumModelCopyWith(_StadiumModel value, $Res Function(_StadiumModel) _then) = __$StadiumModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String location, String imagePath, double rating, double distance, double price, String description
});




}
/// @nodoc
class __$StadiumModelCopyWithImpl<$Res>
    implements _$StadiumModelCopyWith<$Res> {
  __$StadiumModelCopyWithImpl(this._self, this._then);

  final _StadiumModel _self;
  final $Res Function(_StadiumModel) _then;

/// Create a copy of StadiumModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,Object? imagePath = null,Object? rating = null,Object? distance = null,Object? price = null,Object? description = null,}) {
  return _then(_StadiumModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
