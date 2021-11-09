import '../../domain/entities/personage.dart';

abstract class PersonageRemoteDatasource {
  Future<List<Personage>> getAll({
    required Map<String, dynamic> queries,
  });
}
