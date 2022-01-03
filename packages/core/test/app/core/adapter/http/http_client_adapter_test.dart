import 'package:core/core/adapters/http_client/http_client.dart';
import 'package:core/core/helpers/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class DioErrorMock extends Mock implements DioError {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  late DioMock dio;
  late HttpClientAdapterImpl http;
  late String endpoint;
  late Map<String, dynamic> queries;
  late RequestOptionsMock requestOptions;

  setUpAll(() {
    dio = DioMock();
    http = HttpClientAdapterImpl(dio: dio);
    endpoint = faker.internet.httpUrl();
    queries = {};
    requestOptions = RequestOptionsMock();
  });

  test("teste status 200", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await http.get(queries: queries, url: endpoint);

    expect(result, isA<ResponseAdapter>());

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste status 204", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 204,
        requestOptions: requestOptions,
      ),
    );

    final result = await http.get(queries: queries, url: endpoint);

    expect(result, isA<ResponseAdapter>());

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro status 500", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 500,
        requestOptions: requestOptions,
      ),
    );

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpClientError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(DioErrorMock());

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpClientError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro generico dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(Exception());

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpClientError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });
}
