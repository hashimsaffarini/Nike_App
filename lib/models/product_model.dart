import 'package:nike_app/models/product_categories.dart';

class ProductsModel {
  String id;
  String imgUrl;
  double price;
  String title;
  String description;
  ProductCategories category;
  ProductsModel({
    required this.id,
    required this.imgUrl,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['imgUrl'] = imgUrl;
    result['price'] = price;
    result['title'] = title;
    result['description'] = description;
    result['category'] = category.toMap();
    return result;
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductsModel(
      id: id,
      imgUrl: map['imgUrl'] ?? '',
      price: map['price'] ?? 0.0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] != null
          ? ProductCategories.fromMap(map['category'] as Map<String, dynamic>)
          : ProductCategories.fromMap({}),
    );
  }
}

List<ProductsModel> dummyFav = [];
List<ProductsModel> dummyProducts = [
  ProductsModel(
    id: 'ey5T4jGMSn9xQNDFNBvf',
    imgUrl: 'assets/images/15947562_30161559_1000-removebg-preview 1.png',
    price: 20.99,
    title: 'Running',
    description: 'Nike Air Max 90',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: 'fbqhuwufS1tLkQA6Y29v',
    imgUrl: 'assets/images/Yellow Shoe.png',
    price: 25.99,
    title: 'Running',
    description: 'Nike React Presto',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: 'V9eh7L2w5c9heYBYjF53',
    imgUrl: 'assets/images/toppng.png',
    price: 40.99,
    title: 'Running',
    description: 'Nike Air Max 270',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: 'iyQ9VCAG8N2xJgnVN4PJ',
    imgUrl: 'assets/images/Shoe 1.png',
    price: 19.99,
    title: 'Running',
    description: 'Nike Air Max 99',
    category: dummyCategories[1],
  ),
  ProductsModel(
    id: '8nCH2WUVf3aOPTkwWSrg',
    imgUrl: 'assets/images/Red Shoe.png',
    price: 20.99,
    title: 'Jordan',
    description: 'Nike Jordan 90',
    category: dummyCategories[3],
  ),
  ProductsModel(
    id: 'hdkmguNkNd7wL1ppZBJ7',
    imgUrl: 'assets/images/nike5.png',
    price: 25.99,
    title: 'Football',
    description: 'Nike Superfly 7',
    category: dummyCategories[2],
  ),
  ProductsModel(
    id: 'WcCXe2skIRnOtEzBXYZN',
    imgUrl: 'assets/images/nike7.png',
    price: 40.99,
    title: 'Football',
    description: 'Nike Air Max 270',
    category: dummyCategories[2],
  ),
  ProductsModel(
    id: 'LABTYvLsQT8MWW52rM3G',
    imgUrl: 'assets/images/nike6.png',
    price: 19.99,
    title: 'Jordan',
    description: 'Nike Jordan Max 99',
    category: dummyCategories[3],
  ),
];
