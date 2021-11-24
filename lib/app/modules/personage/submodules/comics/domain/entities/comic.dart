import 'package:equatable/equatable.dart';

class Comic extends Equatable {
  final int id;
  final String title;
  final String description;
  final String image;

  final int pageCount;

  const Comic({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title];
}
