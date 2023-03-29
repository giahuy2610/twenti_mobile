// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      idProduct: json['IDProduct'] as int,
      nameProduct: json['NameProduct'] as String,
      idBrand: json['IDBrand'] as int,
      description: json['Description'] as String?,
      createdOn: json['CreatedOn'] as String,
      isDeleted: json['IsDeleted'] as int,
      stock: json['Stock'] as int,
      totalPurchaseQuantity: json['TotalPurchaseQuantity'] as int?,
      mass: json['Mass'] as int?,
      unitsOfMass: json['UnitsOfMass'] as String?,
      units: json['Units'] as String?,
      applyTaxes: json['ApplyTaxes'] as int?,
      statusSale: json['StatusSale'] as int?,
      idTag: json['IDTag'] as int,
      idType: json['IDType'] as int,
      listPrice: json['ListPrice'] as int,
      retailPrice: json['RetailPrice'] as int,
      brand: json['Brand'] == null
          ? null
          : Brand.fromJson(json['Brand'] as Map<String, dynamic>),
      images: (json['Images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: json['Rating'] as dynamic?,
      reviews: (json['Reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'IDProduct': instance.idProduct,
      'NameProduct': instance.nameProduct,
      'IDBrand': instance.idBrand,
      'Description': instance.description,
      'CreatedOn': instance.createdOn,
      'IsDeleted': instance.isDeleted,
      'Stock': instance.stock,
      'TotalPurchaseQuantity': instance.totalPurchaseQuantity,
      'Mass': instance.mass,
      'UnitsOfMass': instance.unitsOfMass,
      'Units': instance.units,
      'ApplyTaxes': instance.applyTaxes,
      'StatusSale': instance.statusSale,
      'IDTag': instance.idTag,
      'IDType': instance.idType,
      'ListPrice': instance.listPrice,
      'RetailPrice': instance.retailPrice,
      'Brand': instance.brand,
      'Images': instance.images,
      'Rating': instance.rating,
      'Reviews': instance.reviews,
    };
