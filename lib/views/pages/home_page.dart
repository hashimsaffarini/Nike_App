import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/utils/app_colors.dart';
import 'package:nike_app/utils/route/app_routes.dart';
import 'package:nike_app/view_models/home_cubit/home_cubit.dart';
import 'package:nike_app/views/widgets/custom_carousel_indicatior.dart';
import 'package:nike_app/views/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
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
                borderRadius: BorderRadius.circular(10.0),
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
        bloc: cubit,
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
                  CustomCarouselIndicator(
                    announcements: state.announcements,
                  ),
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
                          final category = state.types[index];
                          return Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (cubit.selectedId != null &&
                                          cubit.selectedId == category.id ||
                                      category.id == '0') {
                                    cubit.getAllData();
                                  } else {
                                    cubit.filterByCategory(category.id);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cubit.selectedId != null &&
                                              cubit.selectedId == category.id ||
                                          cubit.selectedId == null &&
                                              category.id == '0'
                                      ? Colors.black
                                      : Colors.transparent,
                                  foregroundColor: Colors.black,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Container(
                                  height: 36,
                                  width: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.types[index].type,
                                      style: TextStyle(
                                        color: cubit.selectedId != null &&
                                                    cubit.selectedId ==
                                                        category.id ||
                                                cubit.selectedId == null &&
                                                    category.id == '0'
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 120, 118, 118),
                                        fontSize: 13,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 27,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(
                            AppRoutes.productDetails,
                            arguments: state.products[index],
                          ),
                          child: ProductItems(
                            product: state.products[index],
                          ),
                        );
                      },
                    ),
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
