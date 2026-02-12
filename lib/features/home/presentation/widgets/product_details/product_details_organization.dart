import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/detail_section_widget.dart';

class ProductDetailsOrganization extends StatelessWidget {
  final String category;
  final List<String> tags;

  const ProductDetailsOrganization({
    super.key,
    required this.category,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return DetailSectionWidget(
      title: 'Organization',
      child: Column(
        children: [
          _OrganizationRow(label: 'Category', value: category),
          _OrganizationRow(
            label: 'Tags',
            value: tags.join(' \u2022 '),
          ),
        ],
      ),
    );
  }
}

class _OrganizationRow extends StatelessWidget {
  final String label;
  final String value;

  const _OrganizationRow({required this.label, required this.value});

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
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyleManager.interSemiBold.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
