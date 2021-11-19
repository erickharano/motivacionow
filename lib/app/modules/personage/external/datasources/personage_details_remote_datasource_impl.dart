import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../../core/helpers/url/personage_endpoint.dart';
import '../../../core/adapters/http_client/http_client_adapter.dart';
import '../../../core/helpers/errors/errors.dart';
import '../../infra/datasources/persosage_details_remote_datasource.dart';
import '../../domain/entities/personage.dart';
import '../mappers/personage_mapper.dart';

class PersonageDetailsRemoteDatasourceImpl implements PersonageDetailsRemoteDatasource {
  final HttpClientAdapter httpClient;

  PersonageDetailsRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<Personage> get({
    required Map<String, dynamic> queries,
  }) async {
    try {
      final response = await httpClient.get(
        queries: queries,
        url: PersonageEndpoint.personages,
      );
      return PersonageMapper.fromMap(
        map: response.data['data']['results'] ?? [],
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
