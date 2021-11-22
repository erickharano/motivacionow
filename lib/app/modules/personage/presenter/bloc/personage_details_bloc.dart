import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:motivacionow/app/modules/personage/domain/usecases/personage_details_usecase.dart';

import '../../domain/entities/personage.dart';

part 'personage_details_event.dart';
part 'personage_details_state.dart';

class PersonageDetailsBloc extends Bloc<PersonageDetailsEvent, PersonageDetailsState> {
  final PersonageDetailsUsecase usecase;

  PersonageDetailsBloc({
    required this.usecase,
  }) : super(const PersonageDetailsInitialState());

  Stream<PersonageDetailsState> mapEventToState(PersonageDetailsEvent event) async* {
    if (event is PersonageDetailsFetchEvent) {
      yield* mapPersonageFetchEventToState(event);
    }
  }

  Stream<PersonageDetailsState> mapPersonageFetchEventToState(PersonageDetailsFetchEvent event) async* {
    yield const PersonageDetailsLoadingState();

    final response = await usecase.call(id: event.id);
    yield response.fold(
      (left) => PersonageDetailsErrorState(error: left.message),
      (right) => PersonageDetailsSuccessState(personage: right),
    );
  }
}
