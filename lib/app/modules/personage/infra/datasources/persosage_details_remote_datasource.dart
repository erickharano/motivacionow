import '../../domain/entities/personage.dart';

abstract class PersonageDetailsRemoteDatasource {
  Future<Personage> get({
    required Map<String, dynamic> queries,
  });
}
