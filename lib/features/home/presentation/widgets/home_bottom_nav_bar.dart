import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizon_mobile/config/assets_manager.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/config/strings_manager.dart';
import 'package:horizon_mobile/config/text_style_manager.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          top: BorderSide(color: ColorsManager.grey.withOpacity(0.1), width: 1),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.white,
        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.grey,
        selectedLabelStyle: TextStyleManager.interMedium.copyWith(
          fontSize: 10.sp,
        ),
        unselectedLabelStyle: TextStyleManager.interMedium.copyWith(
          fontSize: 10.sp,
        ),
        items: [
          _buildNavItem(IconsManager.home, StringsManager.home, 0),
          _buildNavItem(IconsManager.explore, StringsManager.explore, 1),
          _buildNavItem(IconsManager.saved, StringsManager.saved, 2),
          _buildNavItem(IconsManager.profile, StringsManager.profile, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String iconPath,
    String label,
    int index,
  ) {
    final isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? ColorsManager.blue : ColorsManager.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}
