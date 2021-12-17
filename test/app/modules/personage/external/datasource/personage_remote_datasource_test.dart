import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  late Map<String, dynamic> dataSuccess;
  late Map<String, dynamic> queries;
  late HttpClientAdapterMock httpClient;
  late ResponseAdapter response;
  late PersonageRemoteDatasource datasource;

  setUpAll(() {
    dataSuccess = {
      'data': {
        'results': [
          {
            'id': faker.randomGenerator.integer(10),
            'name': faker.person.name(),
            'description': faker.person.lastName(),
            'thumbnail': {
              'path': faker.internet.httpUrl(),
              'extension': '.jpg',
            }
          },
        ]
      },
    };

    response = ResponseAdapter(data: dataSuccess, statusCode: 200);
    httpClient = HttpClientAdapterMock();
    datasource = PersonageRemoteDatasourceImpl(httpClient: httpClient);
    queries = {};
  });

  test("teste de sucesso busca de personagens", () async {
    when(() => httpClient.get(
          queries: queries,
          url: PersonageEndpoint.personages,
        )).thenAnswer((invocation) async => response);

    final result = await datasource.getAll(queries: queries);

    expect(result, isA<List<Personage>>());
    expect(result.length, 1);

    verify(() => httpClient.get(
          queries: queries,
          url: PersonageEndpoint.personages,
        )).called(1);
  });

  test("teste de erro na busca de personagens", () {
    when(() => httpClient.get(
          queries: queries,
          url: PersonageEndpoint.personages,
        )).thenThrow(Exception("Erro na pesquisa"));

    final result = datasource.getAll(queries: queries);

    expect(result, throwsA(isFail));

    verify(() => httpClient.get(
          queries: queries,
          url: PersonageEndpoint.personages,
        )).called(1);
  });
}
