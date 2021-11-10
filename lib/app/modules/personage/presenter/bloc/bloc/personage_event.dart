part of 'personage_bloc.dart';

abstract class PersonageEvent extends Equatable {
  const PersonageEvent();
}

class PersonageFetchEvent extends PersonageEvent {
  final PersonageDTO params;

  const PersonageFetchEvent({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

class PersonagePaginateEvent extends PersonageEvent {
  final PersonageDTO params;

  const PersonagePaginateEvent({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}
