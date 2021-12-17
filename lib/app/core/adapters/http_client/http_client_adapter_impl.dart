import 'package:dio/dio.dart' hide HttpClientAdapter;

import '../../helpers/errors/http_client_error.dart';
import 'http_client_adapter.dart';
import 'response_adapter.dart';

class HttpClientAdapterImpl implements HttpClientAdapter {
  final Dio dio;

  HttpClientAdapterImpl({
    required this.dio,
  });

  @override
  Future<ResponseAdapter> get({
    required Map<String, dynamic> queries,
    required String url,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queries);
      if (!(response.statusCode == 200 || response.statusCode == 204)) {
        throw HttpClientError(
          response.statusMessage ?? 'Erro inesperado',
          StackTrace.current,
          statusCode: response.statusCode,
        );
      }

      return ResponseAdapter(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } on DioError catch (error, stackTrace) {
      throw HttpClientError(
        'Erro inesperado',
        stackTrace,
        statusCode: error.response?.statusCode ?? 500,
      );
    } catch (error, stackTrace) {
      throw HttpClientError(
        'Erro inesperado',
        stackTrace,
        statusCode: 500,
      );
    }
  }
}
