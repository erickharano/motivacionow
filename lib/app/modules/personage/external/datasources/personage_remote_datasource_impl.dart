import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../../core/adapters/http_client/http_client_adapter.dart';
import '../../../core/helpers/errors/errors.dart';
import '../../../core/helpers/errors/failure.dart';
import '../../domain/entities/personage.dart';
import '../mappers/personage_mapper.dart';
import '../../infra/datasources/persosage_remote_datasource.dart';

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
      final response = await httpClient.get(queries: queries);
      return PersonageMapper.fromListMap(
        maps: (response.data as List).cast<Map<String, dynamic>>(),
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
