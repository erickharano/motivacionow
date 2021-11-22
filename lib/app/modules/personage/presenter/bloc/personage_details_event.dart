part of 'personage_details_bloc.dart';

abstract class PersonageDetailsEvent extends Equatable {
  const PersonageDetailsEvent();
}

class PersonageDetailsFetchEvent extends PersonageDetailsEvent {
  final int id;

  const PersonageDetailsFetchEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
