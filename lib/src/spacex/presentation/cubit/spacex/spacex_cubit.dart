import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';
import 'package:spacex_app/src/spacex/domain/usecases/spacex_list.dart';

part 'spacex_state.dart';

class SpaceXCubit extends Cubit<SpaceXState> {
  SpaceXCubit({required GetSpacexList getSpacexList})
      : _getSpacexList = getSpacexList,
        super(const SpaceXInitial());

  final GetSpacexList _getSpacexList;

  Future<void> getSpacexListData() async {
    emit(const LoadingSpaceX());

    final result = await _getSpacexList();

    result.fold(
      (failure) => emit(SpaceXError(failure.message)),
      (spacex) => emit(LoadedSpaceX(spacex)),
    );
  }
}
