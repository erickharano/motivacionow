import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../../core/helpers/url/personage_endpoint.dart';
import '../../../core/adapters/http_client/http_client_adapter.dart';
import '../../../core/helpers/errors/errors.dart';
import '../../infra/datasources/persosage_details_remote_datasource.dart';
import '../../domain/entities/personage.dart';
import '../mappers/personage_mapper.dart';

class PersonageDetailsRemoteDatasourceImpl
    implements PersonageDetailsRemoteDatasource {
  final HttpClientAdapter httpClient;

  PersonageDetailsRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<Personage> get({
    required int id,
  }) async {
    try {
      final response = await httpClient.get(
        queries: {},
        url: PersonageEndpoint.personages + "/$id",
      );
      var body = response.data['data']['results'] ?? [];
      List<Personage> list = PersonageMapper.fromListMap(
        maps: (body as List).cast<Map<String, dynamic>>(),
      );

      return list.first;
    } on Failure {
      rethrow;
    } on DioError catch (e) {
      throw HttpClientError(
        e.message,
        e.stackTrace ?? StackTrace.current,
        statusCode: e.response?.statusCode ?? 400,
      );
    } catch (e, stackTrace) {
      throw DataSourceError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
