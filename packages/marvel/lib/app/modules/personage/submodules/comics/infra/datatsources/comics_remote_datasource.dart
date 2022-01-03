import '../../domain/entities/comic.dart';

abstract class ComicsRemoteDatasource {
  Future<List<Comic>> getAll({
    required Map<String, dynamic> queries,
  });
}
