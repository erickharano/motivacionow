import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../../core/helpers/url/personage_endpoint.dart';
import '../../../core/adapters/http_client/http_client_adapter.dart';
import '../../../core/helpers/errors/errors.dart';
import '../../infra/datasources/personage_remote_datasource.dart';
import '../../domain/entities/personage.dart';
import '../mappers/personage_mapper.dart';

class PersonageRemoteDatasourceImpl implements PersonageRemoteDatasource {
  final HttpClientAdapter httpClient;

  PersonageRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<List<Personage>> getAll({
    required Map<String, dynamic> queries,
  }) async {
    try {
      final response = await httpClient.get(
        queries: queries,
        url: PersonageEndpoint.personages,
      );
      var body = response.data['data']['results'] ?? [];
      return PersonageMapper.fromListMap(
        maps: (body as List).cast<Map<String, dynamic>>(),
      );
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
