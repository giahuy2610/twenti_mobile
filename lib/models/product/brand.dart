import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  @JsonKey(name: 'IDBrand')
  int idBrand;
  @JsonKey(name: 'NameBrand')
  String nameBrand;
  @JsonKey(name: 'IDCollection')
  int? idCollection;
  @JsonKey(name: 'Country')
  String? country;
  @JsonKey(name: 'CreatedOn')
  String? createdOn;
  @JsonKey(name: 'IsDeleted')
  int? isDeleted;
  @JsonKey(name: 'TotalProduct')
  int? totalProduct;
  @JsonKey(name: 'TotalPurchaseQuantity')
  int? totalPurchaseQuantity;

  Brand({
    required this.idBrand,
    required this.nameBrand,
    this.idCollection,
    this.country,
    this.createdOn,
    this.isDeleted,
    this.totalProduct,
    this.totalPurchaseQuantity,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
