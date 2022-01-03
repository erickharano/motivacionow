import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/personage_details_usecase.dart';
import '../../domain/entities/personage.dart';

part 'personage_details_event.dart';
part 'personage_details_state.dart';

class PersonageDetailsBloc extends Bloc<PersonageDetailsEvent, PersonageDetailsState> {
  final PersonageDetailsUsecase usecase;

  PersonageDetailsBloc({
    required this.usecase,
  }) : super(const PersonageDetailsInitialState()) {
    on<PersonageDetailsFetchEvent>((event, emit) async {
      emit(const PersonageDetailsLoadingState());

      final response = await usecase.call(id: event.id);
      emit(response.fold(
        (left) => PersonageDetailsErrorState(error: left.message),
        (right) => PersonageDetailsSuccessState(personage: right),
      ));
    });
  }
}
