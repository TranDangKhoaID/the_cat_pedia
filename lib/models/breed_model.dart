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
  String? lifeSpan;
  String? wikipedia_url;
  String? reference_image_id;

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
    this.lifeSpan,
    this.wikipedia_url,
    this.reference_image_id,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}
