import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naja/helpers/colors.dart';

class DealsWidget extends StatelessWidget {
  final String image;
  final String txt1;
  final String txt2;
  final String qty;
  final double price;
  final double originalPrice;

  const DealsWidget({
    super.key,
    required this.image,
    required this.txt1,
    required this.txt2,
    required this.qty,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 110.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 70.h,
          ),
          SizedBox(height: 4.h),
          Text(
            txt1,
            style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            txt2,
            style: TextStyle(fontSize: 9.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            qty,
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: ColorUtils.font_grey,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AED ${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: ColorUtils.secondary_green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'AED ${originalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 8.sp,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                height: 20.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: ColorUtils.secondary_green,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: ColorUtils.bg_white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
