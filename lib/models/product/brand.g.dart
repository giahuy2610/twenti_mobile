// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      idBrand: json['IDBrand'] as int,
      nameBrand: json['NameBrand'] as String,
      idCollection: json['IDCollection'],
      country: json['Country'] as String?,
      createdOn: json['CreatedOn'] as String?,
      isDeleted: json['IsDeleted'] as int?,
      totalProduct: json['TotalProduct'] as int?,
      totalPurchaseQuantity: json['TotalPurchaseQuantity'] as int?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'IDBrand': instance.idBrand,
      'NameBrand': instance.nameBrand,
      'IDCollection': instance.idCollection,
      'Country': instance.country,
      'CreatedOn': instance.createdOn,
      'IsDeleted': instance.isDeleted,
      'TotalProduct': instance.totalProduct,
      'TotalPurchaseQuantity': instance.totalPurchaseQuantity,
    };
