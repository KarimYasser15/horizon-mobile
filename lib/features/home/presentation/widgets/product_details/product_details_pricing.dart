import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/detail_section_widget.dart';

class ProductDetailsPricing extends StatelessWidget {
  final double price;
  final double compareAtPrice;

  const ProductDetailsPricing({
    super.key,
    required this.price,
    required this.compareAtPrice,
  });

  @override
  Widget build(BuildContext context) {
    return DetailSectionWidget(
      title: 'Pricing',
      child: Column(
        children: [
          _PricingRow(
            label: 'Base price',
            value: '\$${price.toStringAsFixed(2)}',
          ),
          _PricingRow(
            label: 'Discount price',
            value: '\$${compareAtPrice.toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }
}

class _PricingRow extends StatelessWidget {
  final String label;
  final String value;

  const _PricingRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyleManager.interRegular.copyWith(
              color: ColorsManager.grey,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyleManager.interSemiBold.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
