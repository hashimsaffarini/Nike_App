class Categories {
  String id;
  String type;
  Categories({
    required this.id,
    required this.type,
  });
}

List<Categories> dummyCategories = [
  Categories(type: 'All', id: '0'),
  Categories(type: 'Running', id: '1'),
  Categories(type: 'Football', id: '2'),
  Categories(type: 'Jordan', id: '3'),
  Categories(type: 'Formals', id: '4'),
  Categories(type: 'Sandals', id: '5'),
  Categories(type: 'Slippers', id: '6'),
];
