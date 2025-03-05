import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_app/core/error/exceptions.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/src/spacex/data/datasources/spacex_remote_data_source.dart';
import 'package:spacex_app/src/spacex/data/models/spacex_model.dart';
import 'package:spacex_app/src/spacex/data/repositories/spacex_repository_implementatio.dart';

class MockSpacexRemoteDatasource extends Mock implements SpacexRemoteDataSource {}

void main() {
  late SpacexRemoteDataSource remoteDatasource;
  late SpacexRepositoryImplementation repository;

  setUp(() {
    remoteDatasource = MockSpacexRemoteDatasource();
    repository = SpacexRepositoryImplementation(remoteDatasource);
  });

  const tAPIException = APIException(message: 'Server Error', statusCode: 500);

  group('getSpacexList', () {
    final spacexList = [
      SpaceXModel.empty(),
    ];

    test('should return List<SpaceXEntity> when remote data source call is successful', () async {
      // Arrange
      when(() => remoteDatasource.getSpaceXList()).thenAnswer((_) async => spacexList);

      // Act
      final result = await repository.getSpacexList();

      // Assert
      expect(result, Right(spacexList));
      verify(() => remoteDatasource.getSpaceXList()).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });

    test('should return [APIFailure] when remote data source call fails', () async {
      // Arrange
      when(() => remoteDatasource.getSpaceXList()).thenThrow(tAPIException);

      // Act
      final result = await repository.getSpacexList();

      // Assert
      expect(result, Left(APIFailure.fromException(tAPIException)));
      verify(() => remoteDatasource.getSpaceXList()).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });
  });

  group('getSpacexDetail', () {
    const spacexId = '123';
    final spacexDetail = SpaceXModel.empty();

    test('should return SpaceXEntity when remote data source call is successful', () async {
      // Arrange
      when(() => remoteDatasource.getSpaceXDetail(id: spacexId)).thenAnswer((_) async => spacexDetail);

      // Act
      final result = await repository.getSpacexDetail(id: spacexId);

      // Assert
      expect(result, Right(spacexDetail));
      verify(() => remoteDatasource.getSpaceXDetail(id: spacexId)).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });

    test('should return [APIFailure] when remote data source call fails', () async {
      // Arrange
      when(() => remoteDatasource.getSpaceXDetail(id: spacexId)).thenThrow(tAPIException);

      // Act
      final result = await repository.getSpacexDetail(id: spacexId);

      // Assert
      expect(result, Left(APIFailure.fromException(tAPIException)));
      verify(() => remoteDatasource.getSpaceXDetail(id: spacexId)).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });
  });
}