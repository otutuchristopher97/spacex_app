import 'package:dartz/dartz.dart';
import 'package:spacex_app/core/error/exceptions.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/data/datasources/spacex_remote_data_source.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';
import 'package:spacex_app/src/spacex/domain/repositories/spacex_repository.dart';

class SpacexRepositoryImplementation
    implements SpacexRepository {
  const SpacexRepositoryImplementation(this._remoteDataSource);

  final SpacexRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<SpaceXEntity>> getSpacexList() async {
    try {
      final result = await _remoteDataSource.getSpaceXList();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SpaceXEntity> getSpacexDetail({required String id}) async {
    try {
      final result = await _remoteDataSource.getSpaceXDetail(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
  
}
