import 'package:flutter/material.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/features/home/domain/models/destination_model.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/category_selector.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/home_header.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/recommended_item_widget.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/recommended_section.dart';
import 'package:horizon_mobile/features/home/presentation/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final recommendedDestinations = [
      DestinationModel(
        id: '1',
        name: 'Modern Loft',
        location: 'Central District',
        price: 120,
        imageUrl:
            'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=400&q=80',
      ),
      DestinationModel(
        id: '2',
        name: 'Woodland Cabin',
        location: 'North Hills',
        price: 85,
        imageUrl:
            'https://images.unsplash.com/photo-1449156233229-30243440e90c?auto=format&fit=crop&w=400&q=80',
      ),
      DestinationModel(
        id: '3',
        name: 'Beachside Suite',
        location: 'Coastal Bay',
        price: 200,
        imageUrl:
            'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?auto=format&fit=crop&w=400&q=80',
      ),
    ];

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(userName: userName),
            const SearchBarWidget(),
            const CategorySelector(),
            const RecommendedSection(),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedDestinations.length,
                itemBuilder: (context, index) {
                  return RecommendedItemWidget(
                    destination: recommendedDestinations[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
