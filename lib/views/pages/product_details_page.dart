import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/utils/app_colors.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductsModel product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    int size = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      AssetImage('assets/images/fi-rr-arrow-small-left.png'),
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          product.description,
          style: GoogleFonts.acme(
            color: AppColors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      'Nike',
                      style: GoogleFonts.fugazOne(
                        color: const Color.fromARGB(255, 172, 171, 171)
                            .withOpacity(0.4),
                        fontSize: 170.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 7,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size * 0.1),
                  child: Center(
                    child: Image.asset(
                      product.imgUrl,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: GoogleFonts.acme(
                          color: AppColors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          '10% OFF',
                          style: GoogleFonts.acme(
                            color: AppColors.red,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Swipe down to add',
              style: GoogleFonts.acme(
                color: AppColors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/box.png',
                ),
                Positioned(
                  left: 100,
                  child: Container(
                    height: 100,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 10,
                          left: 7.5,
                          child: ImageIcon(
                            AssetImage('assets/images/shop.png'),
                            color: AppColors.white,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 7.5,
                          child: SvgPicture.asset(
                            'assets/icons/fi-rr-angle-small-down.svg',
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 7.5,
                          child: SvgPicture.asset(
                            'assets/icons/fi-rr-angle-small-down (1).svg',
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 7.5,
                          child: SvgPicture.asset(
                            'assets/icons/fi-rr-angle-small-down (2).svg',
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
