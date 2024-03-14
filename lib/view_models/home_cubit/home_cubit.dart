import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/models/announcement_model.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/models/product_categories.dart';
import 'package:nike_app/services/firestore_services.dart';
import 'package:nike_app/services/home_services.dart';
import 'package:nike_app/utils/route/api_paths.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final homeServices = HomeServicesImpl();
  final firestoreService = FirestoreService.instance;
  String? selectedId;

  HomeCubit() : super(HomeCubitInitial());
  void getHomeData() async {
    emit(HomeCubitLoading());
    try {
      // await Future.delayed(const Duration(seconds: 2));
      final announcments = await homeServices.getAnnouncements();
      final types = await homeServices.getCategories();
      final products = await homeServices.getProducts();
      emit(HomeCubitLoaded(announcments, types, products));
    } catch (e) {
      emit(HomeCubitError(e.toString()));
    }
  }

  Future<void> filterByCategory(String categoryId) async {
    if (state is HomeCubitLoaded) {
      selectedId = categoryId;
      final filteredProducts = dummyProducts
          .where((product) => product.category.id == categoryId)
          .toList();
      emit(HomeCubitLoaded(
        (state as HomeCubitLoaded).announcements,
        (state as HomeCubitLoaded).types,
        filteredProducts,
      ));
    }
  }

  Future<void> getAllData() async {
    selectedId = null;
    emit(HomeCubitLoaded(dummyAnnouncements, dummyCategories, dummyProducts));
  }

  Future<void> changeFavorites(String id) async {
    final favProducts = await homeServices.getFavProducts();
    final product = dummyProducts.firstWhere((element) => element.id == id);

    final index = favProducts.indexWhere((element) => element.id == id);
    if (index != -1) {
      firestoreService.deleteData(path: ApiPaths.favItem(id));
      favProducts.removeAt(index);
    } else {
      firestoreService.setData(
        path: ApiPaths.favItem(id),
        data: product.toMap(),
      );
      favProducts.add(product);
    }

    emit(HomeCubitLoadedFav(favProducts));
  }

  Future<void> getFav() async {
    final favProducts = await homeServices.getFavProducts();
    emit(HomeCubitLoadedFav(favProducts));
  }

  // Future<void> add() async {
  //   for (var i = 0; i < dummyProducts.length; i++) {
  //     await homeServices.addAnnouncments(dummyAnnouncements[i]);
  //   }
  //    Future<void> add() async {
  //   for (var i = 0; i < dummyProducts.length; i++) {
  //     await homeServices.addToHomePage(dummyProducts[i]);
  //   }

  //   for (var i = 0; i < dummyCategories.length; i++) {
  //     await homeServices.addCategories(dummyCategories[i]);
  //   }
  // }
}
