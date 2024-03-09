part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class HomeCubitLoading extends HomeState {}

final class HomeCubitLoaded extends HomeState {
  final List<AnnouncementModel> products;
  final List<TypesIcons> types;
  HomeCubitLoaded(this.products, this.types);
}

final class HomeCubitError extends HomeState {
  final String message;
  HomeCubitError(this.message);
}
