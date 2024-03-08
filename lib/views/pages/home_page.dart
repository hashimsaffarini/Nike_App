import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/utils/app_colors.dart';
import 'package:nike_app/view_models/home_cubit/home_cubit.dart';
import 'package:nike_app/views/widgets/custom_carousel_indicatior.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: const ImageIcon(
                  AssetImage('assets/images/menu.png'),
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
        title: Row(
          children: [
            SizedBox(
              width: 0,
            ),
            Image.asset(
              ('assets/images/nike.png'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors
                    .transparent, // يمكنك تعيين اللون الذي تريده أو استخدام Colors.transparent لمربع شفاف
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey, // لون الحدود الخارجية
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: const ImageIcon(
                AssetImage('assets/images/shop.png'),
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: BlocProvider.of<HomeCubit>(context),
        buildWhen: (previous, current) =>
            current is HomeCubitLoaded ||
            current is HomeCubitLoading ||
            current is HomeCubitError,
        builder: (context, state) {
          if (state is HomeCubitLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is HomeCubitLoaded) {
            return CustomCarouselIndicator(announcements: state.products);
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
