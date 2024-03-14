import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/utils/app_colors.dart';
import 'package:nike_app/view_models/home_cubit/home_cubit.dart';

class ProductItems extends StatefulWidget {
  final ProductsModel product;
  const ProductItems({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getFav();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getFav();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      widget.product.imgUrl,
                      height: 130,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.description,
                              style: GoogleFonts.acme(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.product.price}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.7),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        'assets/icons/arow.svg',
                                        height: 12.5,
                                        width: 12.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 4,
                  right: 21,
                  child: InkWell(
                    onTap: () {
                      cubit.changeFavorites(widget.product.id);
                      debugPrint(state is HomeCubitLoadedFav
                          ? state.favProducts.length.toString()
                          : "No Elemets");
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          state is HomeCubitLoadedFav &&
                                  state.favProducts.any(
                                      (element) => element.id == widget.product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
