import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  ComicsBloc() : super(ComicsInitial()) {
    on<ComicsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
