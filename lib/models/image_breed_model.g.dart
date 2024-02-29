// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageBreedModel _$ImageBreedModelFromJson(Map<String, dynamic> json) =>
    ImageBreedModel(
      id: json['id'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      breeds: json['breeds'] == null
          ? null
          : BreedModel.fromJson(json['breeds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageBreedModelToJson(ImageBreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'breeds': instance.breeds,
    };
