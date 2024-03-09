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
    imgUrl: 'https://i.ebayimg.com/images/g/X9wAAOSwWJlk2a4E/s-l1600.jpg',
    price: 20.99,
    title: 'Running',
    description: 'Nike Air Max 90',
  ),
  ProductsModel(
    id: '2',
    imgUrl: 'https://i.ytimg.com/vi/jP4im6w74GU/maxresdefault.jpg',
    price: 25.99,
    title: 'Running',
    description: 'Nike React Presto',
  ),
  ProductsModel(
    id: '3',
    imgUrl:
        'https://static.nike.com/a/images/t_prod/w_1920,c_limit/9920e151-b490-475e-ab0d-04e022375446/pdp.jpg',
    price: 40.99,
    title: 'Running',
    description: 'Nike Air Max 270 React ENG',
  ),
  ProductsModel(
    id: '4',
    imgUrl:
        'https://cdn.shopify.com/s/files/1/0214/7974/files/D7N_0579_2048x2048.jpg?v=1539307179',
    price: 19.99,
    title: 'Running',
    description: 'Nike Air Max 99',
  ),
];
