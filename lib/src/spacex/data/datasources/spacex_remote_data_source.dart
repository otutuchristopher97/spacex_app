import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_app/core/error/exceptions.dart';
import 'package:spacex_app/core/utils/constants.dart';
import 'package:spacex_app/core/utils/typedef.dart';
import 'package:spacex_app/src/spacex/data/models/spacex_model.dart';

abstract class SpacexRemoteDataSource {
  Future<List<SpaceXModel>> getSpaceXList();

  Future<SpaceXModel> getSpaceXDetail(
      {required String id});
}

class SpacexRemoteDataSrcImpl implements SpacexRemoteDataSource {
  const SpacexRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<List<SpaceXModel>> getSpaceXList() async {
    
    var url = Uri.parse('$ApiBaseUrl/launches');

    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((postData) => SpaceXModel.fromMap(postData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<SpaceXModel> getSpaceXDetail(
  {required String id}) async {
    
    var url = Uri.parse("$ApiBaseUrl/launches/$id");

    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return SpaceXModel.fromMap(jsonDecode(response.body));
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

}
