import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/detail_section_widget.dart';

class ProductDetailsAvailability extends StatelessWidget {
  final int quantity;
  final String variant;

  const ProductDetailsAvailability({
    super.key,
    required this.quantity,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return DetailSectionWidget(
      title: 'Availability',
      child: Column(
        children: [
          _AvailabilityRow(label: 'Total quantity', value: '$quantity'),
          _AvailabilityRow(label: 'Product variant', value: variant),
        ],
      ),
    );
  }
}

class _AvailabilityRow extends StatelessWidget {
  final String label;
  final String value;

  const _AvailabilityRow({required this.label, required this.value});

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
