import 'package:json_annotation/json_annotation.dart';

import 'brand.dart';
import 'image.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'IDProduct')
  int idProduct;
  @JsonKey(name: 'NameProduct')
  String nameProduct;
  @JsonKey(name: 'IDBrand')
  int idBrand;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'CreatedOn')
  String createdOn;
  @JsonKey(name: 'IsDeleted')
  int isDeleted;
  @JsonKey(name: 'Stock')
  int stock;
  @JsonKey(name: 'TotalPurchaseQuantity')
  int? totalPurchaseQuantity;
  @JsonKey(name: 'Mass')
  int? mass;
  @JsonKey(name: 'UnitsOfMass')
  String? unitsOfMass;
  @JsonKey(name: 'Units')
  String? units;
  @JsonKey(name: 'ApplyTaxes')
  int? applyTaxes;
  @JsonKey(name: 'StatusSale')
  int? statusSale;
  @JsonKey(name: 'IDTag')
  int idTag;
  @JsonKey(name: 'IDType')
  int idType;
  @JsonKey(name: 'ListPrice')
  int listPrice;
  @JsonKey(name: 'RetailPrice')
  int retailPrice;
  @JsonKey(name: 'Brand')
  Brand? brand;
  @JsonKey(name: 'Images')
  List<Image>? images;
  @JsonKey(name: 'Rating')
  int? rating;
  @JsonKey(name: 'Reviews')
  List<dynamic>? reviews;

  Product({
    required this.idProduct,
    required this.nameProduct,
    required this.idBrand,
    this.description,
    required this.createdOn,
    required this.isDeleted,
    required this.stock,
    this.totalPurchaseQuantity,
    this.mass,
    this.unitsOfMass,
    this.units,
    this.applyTaxes,
    this.statusSale,
    required this.idTag,
    required this.idType,
    required this.listPrice,
    required this.retailPrice,
    this.brand,
    this.images,
    this.rating,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
