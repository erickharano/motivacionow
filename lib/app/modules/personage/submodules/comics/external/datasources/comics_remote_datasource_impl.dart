import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../../../../core/adapters/http_client/http_client_adapter.dart';
import '../../../../../core/helpers/errors/errors.dart';
import '../../infra/datatsources/comics_remote_datasource.dart';
import '../../domain/entities/comic.dart';
import '../mappers/comics_mapper.dart';

class ComicsRemoteDatasourceImpl implements ComicsRemoteDatasource {
  final HttpClientAdapter httpClient;

  const ComicsRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<List<Comic>> getAll({
    required Map<String, dynamic> queries,
  }) async {
    try {
      final response = await httpClient.get(queries: queries);
      return ComicsMapper.fromListMap(maps: (response.data as List).cast<Map<String, dynamic>>());
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
