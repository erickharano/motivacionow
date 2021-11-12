import 'package:equatable/equatable.dart';

class Personage extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String? author;

  const Personage({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    this.author,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        author,
      ];
}
