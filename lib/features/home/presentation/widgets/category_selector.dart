import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = [
    StringsManager.all,
    StringsManager.popular,
    StringsManager.recent,
    StringsManager.favorites,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: SizedBox(
        height: 32.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsManager.blue
                        : ColorsManager.whitishGrey,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyleManager.interMedium.copyWith(
                      color: isSelected
                          ? ColorsManager.white
                          : ColorsManager.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
