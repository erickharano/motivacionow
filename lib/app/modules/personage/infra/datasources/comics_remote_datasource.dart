import '../../domain/entities/comics.dart';

abstract class ComicsRemoteDatasource {
  Future<List<Comics>> getAll({
    required Map<String, dynamic> queries,
  });
}
