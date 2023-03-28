import 'package:json_annotation/json_annotation.dart';
import 'package:twenti_mobile/models/product/product.dart';

@JsonSerializable()
class CartProduct {
  late int quantity;
  late Product product;
  CartProduct({required this.quantity, required this.product});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      CartProduct(quantity: json["Quantity"], product: Product.fromJson(json));
}

// @JsonSerializable()
// class CartProduct extends Product {
//   @JsonKey(name: 'Path')
//   int quantity;

//   CartProduct(
//       {idProduct,
//       nameProduct,
//       idBrand,
//       description,
//       createdOn,
//       isDeleted,
//       stock,
//       totalPurchaseQuantity,
//       mass,
//       unitsOfMass,
//       units,
//       applyTaxes,
//       statusSale,
//       idTag,
//       idType,
//       listPrice,
//       retailPrice,
//       brand,
//       images,
//       rating,
//       reviews,
//       required this.quantity})
//       : super(
//             idProduct: idProduct,
//             nameProduct: nameProduct,
//             idBrand: idBrand,
//             description,
//             createdOn: createdOn,
//             isDeleted: isDeleted,
//             stock: stock,
//             totalPurchaseQuantity,
//             mass,
//             unitsOfMass,
//             units,
//             applyTaxes,
//             statusSale,
//             idTag: idTag,
//             idType: idType,
//             listPrice: listPrice,
//             retailPrice: retailPrice,
//             brand,
//             images,
//             rating,
//             reviews);

//   CartProduct.fromJson(Map<String, dynamic> json) :
//     quantity = json["Quantity"];

// }
