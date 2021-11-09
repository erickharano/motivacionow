import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String? video;
  final double price;

  const Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.video,
  });

  @override
  List<Object?> get props => [id, name, description, price, image, video];
}
