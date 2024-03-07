import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());
}
