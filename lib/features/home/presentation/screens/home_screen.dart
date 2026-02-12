import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_mobile/config/colors_manager.dart';
import 'package:horizon_mobile/core/di/service_locator.dart';
import 'package:horizon_mobile/features/home/presentation/cubit/home_cubit.dart';
import 'package:horizon_mobile/features/home/presentation/cubit/home_states.dart';
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
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..fetchDestinations(),
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: SafeArea(
          child: Column(
            children: [
              HomeHeader(userName: userName),
              const SearchBarWidget(),
              const CategorySelector(),
              const RecommendedSection(),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoaded) {
                      return ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return RecommendedItemWidget(
                            destination: state.products[index],
                          );
                        },
                      );
                    } else if (state is HomeError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const HomeBottomNavBar(),
      ),
    );
  }
}
