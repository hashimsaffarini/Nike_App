import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/models/announcement_model.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/models/types.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  String? selectedId;

  HomeCubit() : super(HomeCubitInitial());
  void getHomeData() async {
    emit(HomeCubitLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final announcments = dummyAnnouncements;
      final types = dummyCategories;
      final products = dummyProducts;
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
}
