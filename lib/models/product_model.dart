// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductsModel {
  String id;
  String imgUrl;
  double price;
  String title;
  String description;
  ProductsModel({
    required this.id,
    required this.imgUrl,
    required this.price,
    required this.title,
    required this.description,
  });
}

List<ProductsModel> dummyProducts = [
  ProductsModel(
    id: '1',
    imgUrl: 'assets/images/15947562_30161559_1000-removebg-preview 1.png',
    price: 20.99,
    title: 'Running',
    description: 'Nike Air Max 90',
  ),
  ProductsModel(
    id: '2',
    imgUrl: 'assets/images/Yellow Shoe.png',
    price: 25.99,
    title: 'Running',
    description: 'Nike React Presto',
  ),
  ProductsModel(
    id: '3',
    imgUrl:
        'assets/images/toppng.png',
    price: 40.99,
    title: 'Running',
    description: 'Nike Air Max 270 React ENG',
  ),
  ProductsModel(
    id: '4',
    imgUrl:
        'assets/images/Shoe 1.png',
    price: 19.99,
    title: 'Running',
    description: 'Nike Air Max 99',
  ),
];
