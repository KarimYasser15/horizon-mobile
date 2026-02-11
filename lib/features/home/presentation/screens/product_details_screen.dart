import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:horizon_mobile/features/home/domain/models/product_model.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/detail_section_widget.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/product_details_availability.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/product_details_gallery.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/product_details_header.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/product_details_organization.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/product_details/product_details_pricing.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel destination;

  const ProductDetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsHeader(
                name: destination.name,
                category: destination.category,
                id: destination.id,
              ),
              ProductDetailsGallery(
                mainImageUrl: destination.imageUrl,
                thumbnails: [destination.imageUrl],
              ),
              DetailSectionWidget(
                title: 'Description',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.description,
                      style: TextStyleManager.interRegular.copyWith(
                        color: ColorsManager.grey,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _buildFeatureChips(),
                  ],
                ),
              ),
              ProductDetailsPricing(
                price: destination.price,
                compareAtPrice: destination.compareAtPrice,
              ),
              ProductDetailsOrganization(
                category: destination.category,
                tags: destination.tags,
              ),
              ProductDetailsAvailability(
                quantity: destination.quantity,
                variant: destination.variant,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Product details',
        style: TextStyleManager.interSemiBold.copyWith(
          fontSize: 18.sp,
          color: Colors.black,
        ),
      ),
      titleSpacing: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFeatureChips() {
    final features = [
      '2 Bedrooms',
      '1 Bath',
      'Wi-Fi',
      'Pet Friendly',
      'Fireplace',
    ];
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: features
          .map((feature) => _FeatureChip(label: feature))
          .toList(),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;

  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsManager.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyleManager.interMedium.copyWith(
          color: Colors.black.withOpacity(0.6),
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
