import 'response_adapter.dart';

abstract class HttpClientAdapter {
  Future<ResponseAdapter> get({
    required Map<String, dynamic> queries,
    required String url,
  });
}
