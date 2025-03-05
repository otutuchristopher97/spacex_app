import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';
import 'package:spacex_app/src/spacex/domain/usecases/get_spacex_detail.dart';

part 'spacex_detail_state.dart';

class SpacexDetailCubit extends Cubit<SpaceXDetailState> {
  SpacexDetailCubit({required GetSpacexDetail getSpacexDetail})
      : _getSpacexDetail = getSpacexDetail,
        super(const SpaceXDetailInitial());

  final GetSpacexDetail _getSpacexDetail;

  Future<void> getSpacexDetailData({required String id}) async {
    emit(const LoadingSpaceXDetail());

    final result = await _getSpacexDetail(SpacexDetailParams(id: id));

    result.fold(
      (failure) => emit(SpaceXDetailError(failure.message)),
      (spacex) => emit(LoadedSpaceXDetail(spacex)),
    );
  }
}
