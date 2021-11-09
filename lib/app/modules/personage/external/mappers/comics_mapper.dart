import 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';
import 'package:motivacionow/app/modules/personage/external/helpers/errors/comics_mapper_error.dart';

class ComicsMapper {
  const ComicsMapper._();

  static Comics fromMap({
    required Map<String, dynamic> map,
  }) {
    try {
      return Comics(
        id: map['id'],
        title: map['title'] as String,
        description: map['description'],
        image: map[''],
        pageCount: map['pageCount'],
      );
    } catch (e, stackTrace) {
      throw ComicsMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static Map<String, dynamic> toMap({required Comics comic}) {
    try {
      return {
        'id': comic.id,
        'title': comic.title,
        'description': comic.description,
        'pageCount': comic.pageCount,
        'image': comic.image,
      };
    } catch (e, stackTrace) {
      throw ComicsMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static List<Comics> fromListMap({
    required List<Map<String, dynamic>> maps,
  }) {
    try {
      return maps.map((map) => fromMap(map: map)).toList();
    } catch (e, stackTrace) {
      throw ComicsMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
