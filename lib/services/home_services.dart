import 'package:nike_app/models/announcement_model.dart';
import 'package:nike_app/models/product_categories.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/services/firestore_services.dart';
import 'package:nike_app/utils/route/api_paths.dart';

abstract class HomeServices {
  Future<List<ProductsModel>> getProducts();
  Future<List<AnnouncementModel>> getAnnouncements();
  Future<List<ProductCategories>> getCategories();
  Future<void> addProducts(ProductsModel product);
  Future<void> addAnnouncments(AnnouncementModel product);
  Future<void> addCategories(ProductCategories product);
}

class HomeServicesImpl implements HomeServices {
  final firestoreService = FirestoreService.instance;
  @override
  Future<List<ProductsModel>> getProducts() async =>
      await firestoreService.getCollection<ProductsModel>(
        path: ApiPaths.products(),
        builder: (data, documentId) => ProductsModel.fromMap(
          data,
          documentId,
        ),
      );
  @override
  Future<List<AnnouncementModel>> getAnnouncements() async =>
      await firestoreService.getCollection<AnnouncementModel>(
        path: ApiPaths.announcements(),
        builder: (data, documentId) => AnnouncementModel.fromMap(
          data,
          documentId,
        ),
      );
  @override
  Future<List<ProductCategories>> getCategories() async =>
      await firestoreService.getCollection<ProductCategories>(
        path: ApiPaths.categories(),
        builder: (data, documentId) => ProductCategories.fromMap(
          data,
        ),
      );
  @override
  Future<void> addProducts(ProductsModel product) async =>
      await firestoreService.setData(
        path: ApiPaths.productItem(product.id),
        data: product.toMap(),
      );
  @override
  Future<void> addAnnouncments(AnnouncementModel product) async =>
      await firestoreService.setData(
        path: ApiPaths.announcementItem(product.id),
        data: product.toMap(),
      );
  @override
  Future<void> addCategories(ProductCategories product) async =>
      await firestoreService.setData(
        path: ApiPaths.categoriesItem(product.id),
        data: product.toMap(),
      );
}
