import 'package:equatable/equatable.dart';

class Personage extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? image;

  const Personage({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, description, image];
}
