import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class ProductDetailsHeader extends StatelessWidget {
  final String name;
  final String category;
  final String id;

  const ProductDetailsHeader({
    super.key,
    required this.name,
    required this.category,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          '$name, $category',
          style: TextStyleManager.interBold.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, color: Colors.green, size: 8),
                  SizedBox(width: 4.w),
                  Text(
                    'Available',
                    style: TextStyleManager.interSemiBold.copyWith(
                      color: Colors.green,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'ID: #$id',
              style: TextStyleManager.interMedium.copyWith(
                color: ColorsManager.grey.withOpacity(0.5),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
