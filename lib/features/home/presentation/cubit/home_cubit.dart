import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:horizon_mobile/features/home/presentation/cubit/home_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> fetchDestinations() async {
    emit(HomeLoading());
    try {
      final destinations = await _homeRepository.getProducts();
      emit(HomeLoaded(destinations));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
