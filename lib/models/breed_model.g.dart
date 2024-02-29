// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
      weight: json['weight'] == null
          ? null
          : WeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      cfaUrl: json['cfaUrl'] as String?,
      vetstreet_url: json['vetstreet_url'] as String?,
      vcahospitals_url: json['vcahospitals_url'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      wikipedia_url: json['wikipedia_url'] as String?,
      reference_image_id: json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'cfaUrl': instance.cfaUrl,
      'vetstreet_url': instance.vetstreet_url,
      'vcahospitals_url': instance.vcahospitals_url,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'lifeSpan': instance.lifeSpan,
      'wikipedia_url': instance.wikipedia_url,
      'reference_image_id': instance.reference_image_id,
    };
