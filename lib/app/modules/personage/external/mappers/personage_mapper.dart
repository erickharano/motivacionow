import 'package:motivacionow/app/modules/personage/domain/entities/entities.dart';
import 'package:motivacionow/app/modules/personage/external/helpers/errors/personage_mapper_error.dart';

class PersonageMapper {
  const PersonageMapper._();

  static Personage fromMap({
    required Map<String, dynamic> map,
  }) {
    var imageBase =
        "https://static3.tcdn.com.br/img/img_prod/460977/pre_venda_busto_homem_de_ferro_iron_man_marvel_mark_iii_life_size_sideshow_43864_1_20201211173537.jpg";
    var image = map['thumbnail']['path'] + "." + map['thumbnail']['extension'];
    try {
      return Personage(
        id: map['id'] ?? "",
        description: map['description'] ?? "...",
        image: image ?? imageBase,
        name: map['name'] ?? "",
      );
    } catch (e, stackTrace) {
      throw PersonageMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static Map<String, dynamic> toMap({required Personage personage}) {
    try {
      return {
        'id': personage.id,
        'name': personage.name,
        'description': personage.description,
        'image': personage.image,
      };
    } catch (e, stackTrace) {
      throw PersonageMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  static List<Personage> fromListMap({
    required List<Map<String, dynamic>> maps,
  }) {
    try {
      return maps.map((map) => fromMap(map: map)).toList();
    } catch (e, stackTrace) {
      throw PersonageMapperError(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
