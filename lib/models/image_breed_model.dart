import 'package:json_annotation/json_annotation.dart';
import 'package:the_cat_pedia/models/breed_model.dart';

part 'image_breed_model.g.dart';

@JsonSerializable()
class ImageBreedModel {
  String? id;
  String? url;
  int? width;
  int? height;
  BreedModel? breeds;

  ImageBreedModel({
    this.id,
    this.url,
    this.width,
    this.height,
    this.breeds,
  });

  factory ImageBreedModel.fromJson(Map<String, dynamic> json) =>
      _$ImageBreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageBreedModelToJson(this);
}
