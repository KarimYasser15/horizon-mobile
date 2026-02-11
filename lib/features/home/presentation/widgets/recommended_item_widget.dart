import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/features/home/domain/models/product_model.dart';
import 'package:horizon_mobile/features/home/presentation/screens/product_details_screen.dart';

class RecommendedItemWidget extends StatelessWidget {
  final ProductModel destination;

  const RecommendedItemWidget({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(destination: destination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                destination.imageUrl,
                width: 64.w,
                height: 64.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 64.w,
                  height: 64.h,
                  color: ColorsManager.grey.withOpacity(0.1),
                  child: Icon(Icons.broken_image, color: ColorsManager.grey),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.interSemiBold.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${destination.category} \u2022 \$${destination.price.toInt()}/night',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.interRegular.copyWith(
                      color: ColorsManager.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                destination.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: destination.isFavorite
                    ? ColorsManager.red
                    : ColorsManager.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
