import 'package:spacex_app/core/usercase/usecase.dart';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/domain/repositories/spacex_repository.dart';

class GetSpacexList extends UsecaseWithoutParams<void> {
  const GetSpacexList(this._repository);

  final SpacexRepository _repository;

  @override
  ResultFuture call() async => _repository.getSpacexList();
}
