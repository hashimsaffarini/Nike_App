import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/utils/app_colors.dart';
import 'package:nike_app/view_models/home_cubit/home_cubit.dart';
import 'package:nike_app/views/widgets/custom_carousel_indicatior.dart';
import 'package:nike_app/views/widgets/product_item.dart';

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
            const SizedBox(
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
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomCarouselIndicator(announcements: state.announcements),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.types.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Container(
                                  height: 36,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.types[index].type,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 120, 118, 118),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  GridView.builder(
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: ProductItems(
                          product: state.products[index],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
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
