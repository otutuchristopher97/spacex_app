import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:spacex_app/core/error/exceptions.dart';
import 'package:spacex_app/core/utils/constants.dart';
import 'package:spacex_app/src/spacex/data/datasources/spacex_remote_data_source.dart';
import 'package:spacex_app/src/spacex/data/models/spacex_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late SpacexRemoteDataSource remoteDatasource;

  setUp(() {
    client = MockHttpClient();
    remoteDatasource = SpacexRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('getSpaceXList', () {
    final spaceXModels = [SpaceXModel.empty()];
    const tAPIFailureMessage = 'API Failure';

    test('should return List<SpaceXModel> when the status code is 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(
              jsonEncode(spaceXModels.map((e) => e.toMap()).toList()), 200));

      // Act
      final result = await remoteDatasource.getSpaceXList();

      // Assert
      expect(result, equals(spaceXModels));
      verify(() => client.get(Uri.parse('$ApiBaseUrl/launches'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(tAPIFailureMessage, 400));

      // Act
      final call = remoteDatasource.getSpaceXList;

      // Assert
      expect(() => call(), throwsA(isA<APIException>().having((e) => e.message, 'message', tAPIFailureMessage)));
      verify(() => client.get(Uri.parse('$ApiBaseUrl/launches'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('getSpaceXDetail', () {
    const String spaceXId = '123';
    final spaceXModel = SpaceXModel.empty();

    test('should return SpaceXModel when the status code is 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(jsonEncode(spaceXModel.toMap()), 200));

      // Act
      final result = await remoteDatasource.getSpaceXDetail(id: spaceXId);

      // Assert
      expect(result, equals(spaceXModel));
      verify(() => client.get(Uri.parse('$ApiBaseUrl/launches/$spaceXId'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('API Error', 404));

      // Act
      final call = remoteDatasource.getSpaceXDetail;

      // Assert
      expect(() => call(id: spaceXId), throwsA(isA<APIException>()));
      verify(() => client.get(Uri.parse('$ApiBaseUrl/launches/$spaceXId'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}