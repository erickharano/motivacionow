import 'package:dio/dio.dart' hide HttpClientAdapter;
import 'package:core/core.dart';

import '../../../../shared/helpers/url/personage_endpoint.dart';
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

      return (body as List)
          .cast<Map<String, dynamic>>()
          .map((map) => PersonageMapper(
                map: map,
              ).toEntity())
          .toList();
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
