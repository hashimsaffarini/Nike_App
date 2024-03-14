part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class HomeCubitLoading extends HomeState {}

final class HomeCubitLoaded extends HomeState {
  final List<AnnouncementModel> announcements;
  final List<ProductCategories> types;
  final List<ProductsModel> products;
  HomeCubitLoaded(this.announcements, this.types, this.products);
}

final class HomeCubitError extends HomeState {
  final String message;
  HomeCubitError(this.message);
}

final class HomeCubitLoadedFav extends HomeState {
  final List<ProductsModel> favProducts;
  HomeCubitLoadedFav(this.favProducts);
}
