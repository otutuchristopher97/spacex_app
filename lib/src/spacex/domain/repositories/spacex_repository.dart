import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';

abstract class SpacexRepository {
  const SpacexRepository();

  ResultFuture<List<SpaceXEntity>> getSpacexList();
  ResultFuture<SpaceXEntity> getSpacexDetail(
      {required String id});
}
