import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_app/models/announcement_model.dart';
import 'package:nike_app/models/product_model.dart';
import 'package:nike_app/models/types.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeCubitInitial());
  void getHomeData() async {
    emit(HomeCubitLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final announcments = dummyAnnouncements;
      final types = typesIcons;
      final products = dummyProducts;
      emit(HomeCubitLoaded(announcments, types, products));
    } catch (e) {
      emit(HomeCubitError(e.toString()));
    }
  }
}
