import '../product/cartProduct.dart';
import 'address.dart';

class Order {
  int iDInvoice;
  int iDTracking;
  int iDAddress;
  int? iDCoupon;
  int iDCus;
  String? note;
  int totalValue;
  int methodPay;
  int methodTransfer;
  String createdOn;
  int isPrintInvoice;
  int isPaid;
  Address address;
  List<CartProduct> products;

  Order(
      {required this.iDInvoice,
      required this.iDTracking,
      required this.iDAddress,
      this.iDCoupon,
      required this.iDCus,
      required this.totalValue,
      required this.methodPay,
      required this.methodTransfer,
      required this.createdOn,
      required this.isPrintInvoice,
      required this.isPaid,
      required this.address,
      required this.products,
      this.note});

  factory Order.fromJson(Map<String, dynamic> json) {
    var a = <CartProduct>[];
    for (var i in json['Products']) a.add(CartProduct.fromJson(i));
    return Order(
        iDInvoice: json['IDInvoice'],
        iDTracking: json['IDTracking'],
        iDAddress: json['IDAddress'],
        iDCoupon: json['IDCoupon'],
        iDCus: json['IDCus'],
        note: json['Note'],
        totalValue: json['TotalValue'],
        methodPay: json['MethodPay'],
        methodTransfer: json['MethodTransfer'],
        createdOn: json['CreatedOn'],
        isPrintInvoice: json['IsPrintInvoice'],
        isPaid: json['IsPaid'],
        address: Address.fromJson(json['Address']),
        products: a);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDInvoice'] = this.iDInvoice;
    data['IDTracking'] = this.iDTracking;
    data['IDAddress'] = this.iDAddress;
    data['IDCoupon'] = this.iDCoupon;
    data['IDCus'] = this.iDCus;
    data['Note'] = this.note;
    data['TotalValue'] = this.totalValue;
    data['MethodPay'] = this.methodPay;
    data['MethodTransfer'] = this.methodTransfer;
    data['CreatedOn'] = this.createdOn;
    data['IsPrintInvoice'] = this.isPrintInvoice;
    data['IsPaid'] = this.isPaid;
    if (this.address != null) {
      data['Address'] = this.address.toJson();
    }
    return data;
  }
}
