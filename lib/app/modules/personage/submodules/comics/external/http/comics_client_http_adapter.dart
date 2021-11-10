import 'package:dio/dio.dart';
import 'package:motivacionow/app/modules/core/adapters/http_client/http_client_adapter_impl.dart';

class ComicsClientHttpAdapter extends HttpClientAdapterImpl {
  ComicsClientHttpAdapter(
    Dio dio,
  ) : super(
          dio: dio,
          url: '/v1/comics',
        );
}
