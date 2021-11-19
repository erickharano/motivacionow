import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/helpers/errors/http_client_error.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/personage.dart';
import '../../domain/usecases/usecases.dart';

part 'personage_event.dart';
part 'personage_state.dart';

class PersonageBloc extends Bloc<PersonageEvent, PersonageState> {
  final PersonageUsecase usecase;

  PersonageBloc({
    required this.usecase,
  }) : super(const PersonageInitialState());

  Stream<PersonageState> mapEventToState(PersonageEvent event) async* {
    if (event is PersonageFetchEvent) {
      yield* mapPersonageFetchEventToState(event);
    } else if (event is PersonagePaginateEvent) {
      yield* mapPersonagePaginateEventToState(event);
    }
  }

  Stream<PersonageState> mapPersonageFetchEventToState(PersonageFetchEvent event) async* {
    yield const PersonageLoadingState();

    final response = await usecase.call(params: event.params);
    yield response.fold(
      (left) => PersonageErrorState(error: left.message),
      (right) => PersonageSuccessState(personages: right),
    );
  }

  Stream<PersonageState> mapPersonagePaginateEventToState(PersonagePaginateEvent event) async* {
    yield (state as PersonageSuccessState).copyWith(isLoading: true);

    var response = await usecase(params: event.params);
    var paginateState = response.fold((left) {
      if (left is HttpClientError && left.statusCode == 400) {
        return (state as PersonageSuccessState).copyWith(
          hasMax: true,
          isLoading: false,
        );
      }
      return PersonageErrorState(
        error: left.message,
      );
    }, (right) {
      return PersonageSuccessState(
        personages: (state as PersonageSuccessState).personages..addAll(right),
        isLoading: false,
      );
    });

    yield const PersonageLoadingState();
    yield paginateState;
  }
}
