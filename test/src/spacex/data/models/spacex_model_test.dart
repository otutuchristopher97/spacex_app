import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/data/models/spacex_model.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';

void main() {
  const tModel = SpaceXModel.empty();

  test('should be a subclass of [SpaceXEntity] entity', () {
    expect(tModel, isA<SpaceXEntity>());
  });

  const tJson = '''
    {
      "id": "",
      "name": "Unknown",
      "flight_number": 0,
      "success": false,
      "details": "",
      "date_utc": "",
      "date_unix": 0,
      "rocket": "",
      "payloads": [],
      "launchpad": "",
      "links": {
        "patch": {"small": "", "large": ""},
        "webcast": "",
        "youtube_id": "",
        "article": "",
        "wikipedia": ""
      }
    }
  ''';
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [SpaceXModel] with the right data', () {
      final result = SpaceXModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [SpaceXModel] with the right data', () {
      final result = SpaceXModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [map] with the right data', () {
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      final result = tModel.toJson();
      expect(result, equals(jsonEncode(tMap)));
    });
  });

  group('copyWith', () {
    test('should return a [SpaceXModel] with modified data', () {
      final result = tModel.copyWith(name: 'New Name');
      expect(result.name, equals('New Name'));
    });
  });
}
