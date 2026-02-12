import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';
import 'package:intl/intl.dart';

class ProductDetailsTimestamps extends StatelessWidget {
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductDetailsTimestamps({
    super.key,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TimestampRow(
          label: 'Created',
          value: DateFormat('MMM dd, yyyy').format(createdAt),
        ),
        SizedBox(height: 4.h),
        _TimestampRow(
          label: 'Last updated',
          value: _formatRelativeTime(updatedAt),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  String _formatRelativeTime(DateTime date) {
    final duration = DateTime.now().difference(date);
    if (duration.inHours < 24) {
      return '${duration.inHours} hours ago';
    } else {
      return '${duration.inDays} days ago';
    }
  }
}

class _TimestampRow extends StatelessWidget {
  final String label;
  final String value;

  const _TimestampRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyleManager.interRegular.copyWith(
            color: ColorsManager.grey,
            fontSize: 12.sp,
          ),
        ),
        Text(
          value,
          style: TextStyleManager.interRegular.copyWith(
            color: ColorsManager.grey,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
