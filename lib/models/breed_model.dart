import 'package:json_annotation/json_annotation.dart';
import 'package:the_cat_pedia/models/weight_model.dart';

part 'breed_model.g.dart';

@JsonSerializable()
class BreedModel {
  WeightModel? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreet_url;
  String? vcahospitals_url;
  String? temperament;
  String? origin;
  String? description;
  String? life_span;
  String? wikipedia_url;
  String? reference_image_id;
  double? indoor;
  double? lap;
  double? adaptability;
  double? affection_level;
  double? child_friendly;
  double? dog_friendly;
  double? energy_level;
  double? grooming;
  double? health_issues;
  double? intelligence;
  double? shedding_level;
  double? social_needs;
  double? stranger_friendly;
  double? vocalisation;
  double? experimental;
  double? hairless;
  double? natural;
  double? rare;
  double? rex;
  double? suppressed_tail;
  double? short_legs;
  double? hypoallergenic;
  String? url;

  BreedModel({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreet_url,
    this.vcahospitals_url,
    this.temperament,
    this.origin,
    this.description,
    this.life_span,
    this.wikipedia_url,
    this.reference_image_id,
    this.indoor,
    this.lap,
    this.adaptability,
    this.affection_level,
    this.child_friendly,
    this.dog_friendly,
    this.energy_level,
    this.grooming,
    this.health_issues,
    this.intelligence,
    this.shedding_level,
    this.social_needs,
    this.stranger_friendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressed_tail,
    this.short_legs,
    this.hypoallergenic,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}
