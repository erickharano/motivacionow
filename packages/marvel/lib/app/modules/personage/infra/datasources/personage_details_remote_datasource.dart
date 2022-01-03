import '../../domain/entities/personage.dart';

abstract class PersonageDetailsRemoteDatasource {
  Future<Personage> get({
    required int id,
  });
}
