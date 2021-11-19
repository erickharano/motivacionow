part of 'personage_details_bloc.dart';

abstract class PersonageDetailsEvent extends Equatable {
  const PersonageDetailsEvent();
}

class PersonageDetailsFetchEvent extends PersonageDetailsEvent {
  final PersonageDTO params;

  const PersonageDetailsFetchEvent({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}
