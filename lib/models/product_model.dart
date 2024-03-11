import 'package:nike_app/models/types.dart';

class ProductsModel {
  String id;
  String imgUrl;
  double price;
  String title;
  String description;
  Categories category;
  ProductsModel({
    required this.id,
    required this.imgUrl,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
  });
}

List<ProductsModel> dummyProducts = [
  ProductsModel(
    id: '1',
    imgUrl: 'assets/images/15947562_30161559_1000-removebg-preview 1.png',
    price: 20.99,
    title: 'Running',
    description: 'Nike Air Max 90',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: '1',
    imgUrl: 'assets/images/Yellow Shoe.png',
    price: 25.99,
    title: 'Running',
    description: 'Nike React Presto',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: '1',
    imgUrl: 'assets/images/toppng.png',
    price: 40.99,
    title: 'Running',
    description: 'Nike Air Max 270',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: '1',
    imgUrl: 'assets/images/Shoe 1.png',
    price: 19.99,
    title: 'Running',
    description: 'Nike Air Max 99',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: '2',
    imgUrl: 'assets/images/Red Shoe.png',
    price: 20.99,
    title: 'Jordan',
    description: 'Nike Jordan 90',
    category: dummyCategories[3],
  ),
  ProductsModel(
    id: '3',
    imgUrl: 'assets/images/nike5.png',
    price: 25.99,
    title: 'Football',
    description: 'Nike Superfly 7',
    category: dummyCategories[2],
  ),
  ProductsModel(
    id: '3',
    imgUrl: 'assets/images/nike7.png',
    price: 40.99,
    title: 'Football',
    description: 'Nike Air Max 270',
    category: dummyCategories[2],
  ),
  ProductsModel(
    id: '2',
    imgUrl: 'assets/images/nike6.png',
    price: 19.99,
    title: 'Jordan',
    description: 'Nike Jordan Max 99',
    category: dummyCategories[3],
  ),
];
