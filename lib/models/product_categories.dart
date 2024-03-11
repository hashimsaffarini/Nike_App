class ProductCategories {
  String id;
  String type;
  ProductCategories({
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['type'] = type;
    return result;
  }

  factory ProductCategories.fromMap(Map<String, dynamic> map) {
    return ProductCategories(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
    );
  }
}

List<ProductCategories> dummyCategories = [
  ProductCategories(type: 'All', id: '0'),
  ProductCategories(type: 'Running', id: '1'),
  ProductCategories(type: 'Football', id: '2'),
  ProductCategories(type: 'Jordan', id: '3'),
  ProductCategories(type: 'Formals', id: '4'),
  ProductCategories(type: 'Sandals', id: '5'),
  ProductCategories(type: 'Slippers', id: '6'),
];
