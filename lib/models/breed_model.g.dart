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
      life_span: json['life_span'] as String?,
      wikipedia_url: json['wikipedia_url'] as String?,
      reference_image_id: json['reference_image_id'] as String?,
      indoor: (json['indoor'] as num?)?.toDouble(),
      lap: (json['lap'] as num?)?.toDouble(),
      adaptability: (json['adaptability'] as num?)?.toDouble(),
      affection_level: (json['affection_level'] as num?)?.toDouble(),
      child_friendly: (json['child_friendly'] as num?)?.toDouble(),
      dog_friendly: (json['dog_friendly'] as num?)?.toDouble(),
      energy_level: (json['energy_level'] as num?)?.toDouble(),
      grooming: (json['grooming'] as num?)?.toDouble(),
      health_issues: (json['health_issues'] as num?)?.toDouble(),
      intelligence: (json['intelligence'] as num?)?.toDouble(),
      shedding_level: (json['shedding_level'] as num?)?.toDouble(),
      social_needs: (json['social_needs'] as num?)?.toDouble(),
      stranger_friendly: (json['stranger_friendly'] as num?)?.toDouble(),
      vocalisation: (json['vocalisation'] as num?)?.toDouble(),
      experimental: (json['experimental'] as num?)?.toDouble(),
      hairless: (json['hairless'] as num?)?.toDouble(),
      natural: (json['natural'] as num?)?.toDouble(),
      rare: (json['rare'] as num?)?.toDouble(),
      rex: (json['rex'] as num?)?.toDouble(),
      suppressed_tail: (json['suppressed_tail'] as num?)?.toDouble(),
      short_legs: (json['short_legs'] as num?)?.toDouble(),
      hypoallergenic: (json['hypoallergenic'] as num?)?.toDouble(),
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
      'life_span': instance.life_span,
      'wikipedia_url': instance.wikipedia_url,
      'reference_image_id': instance.reference_image_id,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'adaptability': instance.adaptability,
      'affection_level': instance.affection_level,
      'child_friendly': instance.child_friendly,
      'dog_friendly': instance.dog_friendly,
      'energy_level': instance.energy_level,
      'grooming': instance.grooming,
      'health_issues': instance.health_issues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.shedding_level,
      'social_needs': instance.social_needs,
      'stranger_friendly': instance.stranger_friendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressed_tail': instance.suppressed_tail,
      'short_legs': instance.short_legs,
      'hypoallergenic': instance.hypoallergenic,
    };
