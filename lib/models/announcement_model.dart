class AnnouncementModel {
  final String id;
  final String imgUrl;

  AnnouncementModel({required this.id, required this.imgUrl});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['imgUrl'] = imgUrl;
    return result;
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map, String id) {
    return AnnouncementModel(
      id: id,
      imgUrl: map['imgUrl'] ?? '',
    );
  }
}

List<AnnouncementModel> dummyAnnouncements = [
  AnnouncementModel(
    id: 'Y9JURhw75VySIEgmGmdZ',
    imgUrl: 'https://i.ebayimg.com/images/g/X9wAAOSwWJlk2a4E/s-l1600.jpg',
  ),
  AnnouncementModel(
    id: 'cLCC0sqFZQpdtBiYsffl',
    imgUrl: 'https://i.ytimg.com/vi/jP4im6w74GU/maxresdefault.jpg',
  ),
  AnnouncementModel(
    id: 'fuSWvEjviI56q9NJHcsL',
    imgUrl:
        'https://static.nike.com/a/images/t_prod/w_1920,c_limit/9920e151-b490-475e-ab0d-04e022375446/pdp.jpg',
  ),
  AnnouncementModel(
    id: '2cl0LPF6MSMVAT6ONkkf',
    imgUrl:
        'https://cdn.shopify.com/s/files/1/0214/7974/files/D7N_0579_2048x2048.jpg?v=1539307179',
  ),
];
