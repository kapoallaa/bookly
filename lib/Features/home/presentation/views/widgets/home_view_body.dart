import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.only(left: 14),
          child: FeaturedListView(),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
        )
      ],
    );
  }
}
