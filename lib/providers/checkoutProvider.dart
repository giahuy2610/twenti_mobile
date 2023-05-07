import 'package:flutter/material.dart';

import '../models/coupon/Coupon.dart';
import '../models/order/address.dart';

class CheckoutProvider with ChangeNotifier {
  Address? address;
  CouponModel? selectedCoupon;
}
