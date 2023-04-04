import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CouponModel {
  late int iDCoupon;
  late int valueDiscount;
  late String startOn;
  late String endOn;
  late String description;
  late int isDeleted;
  late int minInvoiceValue;
  late String codeCoupon;
  late int quantity;
  late int isMutualEvent;
  late int stock;

  CouponModel(
      {
        required this.iDCoupon,
        required this.valueDiscount,
        required this.startOn,
        required this.endOn,
        required this.description,
        required this.isDeleted,
        required this.minInvoiceValue,
        required this.codeCoupon,
        required this.quantity,
        required this.isMutualEvent,
        required this.stock
      }
  );

   factory CouponModel.fromJson(Map<String, dynamic> json) {
     return CouponModel(
        iDCoupon: json['IDCoupon'],
        valueDiscount: json['ValueDiscount'],
        startOn: json['StartOn'],
        endOn: json['EndOn'],
        description: json['Description'],
        isDeleted: json['IsDeleted'],
        minInvoiceValue: json['MinInvoiceValue'],
        codeCoupon: json['CodeCoupon'],
        quantity: json['Quantity'],
        isMutualEvent: json['IsMutualEvent'],
        stock: json['Stock'],
      );
   }

  int get getIDCoupon => iDCoupon;
  int get getValueDiscount => valueDiscount;
  String get getStartOn => startOn;
  String get getEndOn => endOn;
  String get getDescription => description;
  int get getIsDeleted => isDeleted;
  int get getMinInvoiceValue => minInvoiceValue;
  String get getCodeCoupon => codeCoupon;
  int get getQuantity => quantity;
  int get getIsMutualEvent => isMutualEvent;
  int get getStock => stock;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IDCoupon'] = iDCoupon;
    data['ValueDiscount'] = valueDiscount;
    data['StartOn'] = startOn;
    data['EndOn'] = endOn;
    data['Description'] = description;
    data['IsDeleted'] = isDeleted;
    data['MinInvoiceValue'] = minInvoiceValue;
    data['CodeCoupon'] = codeCoupon;
    data['Quantity'] = quantity;
    data['IsMutualEvent'] = isMutualEvent;
    data['Stock'] = stock;
    return data;
  }
}
