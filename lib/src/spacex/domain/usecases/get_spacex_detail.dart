import 'package:equatable/equatable.dart';
import 'package:spacex_app/core/usercase/usecase.dart';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/domain/repositories/spacex_repository.dart';

class GetSpacexDetail extends UsecaseWithParams<void, SpacexDetailParams> {
  const GetSpacexDetail(this._repository);

  final SpacexRepository _repository;

  @override
  ResultFuture call(SpacexDetailParams params) async =>
      _repository.getSpacexDetail(id: params.id);
}

class SpacexDetailParams extends Equatable {
  const SpacexDetailParams({required this.id});

  const SpacexDetailParams.empty() : this(id: "");

  final String id;

  @override
  List<Object?> get props => [id];
}
