import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  late Map<String, dynamic> dataSuccess;
  late Map<String, dynamic> dataError;

  setUpAll(() {
    dataSuccess = {
      'id': faker.randomGenerator.integer(10),
      'name': faker.person.name(),
      'description': faker.person.lastName(),
      'thumbnail': {
        'path': faker.internet.httpUrl(),
        'extension': '.jpg',
      }
    };

    dataError = {
      'id': "teste",
      'name': faker.person.name(),
      'description': faker.person.lastName(),
      'thumbnail': {
        'path': faker.internet.httpUrl(),
        'extension': '.jpg',
      }
    };
  });

  test("deve retornar um caso de sucesso", () {
    expect(PersonageMapper(map: dataSuccess).toEntity(), isA<Personage>());
  });

  test("deve retornar um caso de error", () {
    expect(() => PersonageMapper(map: dataError).toEntity(), throwsA(isA<PersonageMapperError>()));
  });
}
