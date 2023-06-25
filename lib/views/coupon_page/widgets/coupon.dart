import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../models/coupon/Coupon.dart';
import '../../../providers/cartProvider.dart';

class coupon extends StatefulWidget {
  final CouponModel model;
  coupon(this.model);

  @override
  State<coupon> createState() => _couponState();
}

class _couponState extends State<coupon> {
  @override
  Widget build(BuildContext context) {
    //set color for a whole widget
    Color borderColor = const Color(0xFFE9DEE4);
    Color couponFontColor = const Color(0xFFE7499E);
    Color buttonFontColor = const Color(0xFFF9F9F9);
    Color backgroundColor = const Color(0xFFFEEFFE);
    Color gradiantLeftColor = const Color(0xFFFE9DD7);
    Color gradiantRightColor = const Color(0xFFFF4DA1);
    //set value for widget
    int couponID = widget.model.getIDCoupon;
    String couponTitle = 'Mã giảm giá';
    String couponCode = widget.model.getCodeCoupon;
    String couponDescription = widget.model.getDescription;
    //String couponStart = model.getStartOn;
    //format chuỗi từ chuỗi datetime thành dmy
    DateTime couponEndOn = DateTime.parse(widget.model.getEndOn);
    String couponExpire = "HSD: " +
        couponEndOn.day.toString() +
        "/" +
        couponEndOn.month.toString() +
        "/" +
        couponEndOn.year.toString();
    //component
    return Container(
      width: 370,
      height: 110,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 110,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Text(
                      couponTitle,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: couponFontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
                    child: Text(
                      couponCode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: couponFontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/coupon/dot_line.svg',
            semanticsLabel: 'dot line SVG',
            width: 15,
            height: 110,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    couponDescription,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: couponFontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        couponExpire,
                        style: TextStyle(
                          color: couponFontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [gradiantLeftColor, gradiantRightColor],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<CartProvider>().setCoupon(widget.model);
                        },
                        child: Text(
                          identical(
                                  context.watch<CartProvider>().selectedCoupon,
                                  widget.model)
                              ? "voucherApplied".tr()
                              : "voucherApply".tr(),
                          style: TextStyle(
                            fontSize: 15,
                            color: buttonFontColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
