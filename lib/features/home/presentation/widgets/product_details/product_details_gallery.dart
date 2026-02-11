import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsGallery extends StatelessWidget {
  final String mainImageUrl;
  final List<String> thumbnails;

  const ProductDetailsGallery({
    super.key,
    required this.mainImageUrl,
    required this.thumbnails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            mainImageUrl,
            width: double.infinity,
            height: 300.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: double.infinity,
              height: 300.h,
              color: Colors.grey.withOpacity(0.1),
              child: const Icon(Icons.broken_image, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: thumbnails.map((url) => Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: _Thumbnail(imageUrl: url, isActive: url == mainImageUrl),
          )).toList(),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const _Thumbnail({required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: isActive ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 60.w,
            height: 40.h,
            color: Colors.grey.withOpacity(0.1),
            child: const Icon(Icons.broken_image, color: Colors.grey, size: 20),
          ),
        ),
      ),
    );
  }
}
