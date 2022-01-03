import 'package:dio/dio.dart';
import 'package:core/core.dart';

class ComicsClientHttpAdapter extends HttpClientAdapterImpl {
  ComicsClientHttpAdapter(Dio dio) : super(dio: dio);
}
