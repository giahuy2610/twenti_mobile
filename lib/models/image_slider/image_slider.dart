import 'package:json_annotation/json_annotation.dart';

part 'image_slider.g.dart';

@JsonSerializable()
class ImageSlider {
  @JsonKey(name: 'IDImage')
  int? idImage;
  @JsonKey(name: 'StartOn')
  String? startOn;
  @JsonKey(name: 'EndOn')
  String? endOn;
  @JsonKey(name: 'Path')
  String? path;
  @JsonKey(name: 'Route')
  String? route;
  @JsonKey(name: 'IsDeleted')
  int? isDeleted;
  @JsonKey(name: 'CreatedOn')
  String? createdOn;

  ImageSlider({
    this.idImage,
    this.startOn,
    this.endOn,
    this.path,
    this.route,
    this.isDeleted,
    this.createdOn,
  });

  factory ImageSlider.fromJson(Map<String, dynamic> json) {
    return _$ImageSliderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageSliderToJson(this);
}
