part of 'personage_details_bloc.dart';

abstract class PersonageDetailsState extends Equatable {
  const PersonageDetailsState();
}

class PersonageDetailsInitialState extends PersonageDetailsState {
  const PersonageDetailsInitialState();

  @override
  List<Object?> get props => [];
}

class PersonageDetailsLoadingState extends PersonageDetailsState {
  const PersonageDetailsLoadingState();

  @override
  List<Object?> get props => [];
}

class PersonageDetailsErrorState extends PersonageDetailsState {
  final String error;

  const PersonageDetailsErrorState({required this.error});

  @override
  List<Object?> get props => [];
}

class PersonageDetailsSuccessState extends PersonageDetailsState {
  final Personage personage;
  final bool isLoading;

  const PersonageDetailsSuccessState({
    required this.personage,
    this.isLoading = false,
  });

  PersonageDetailsSuccessState copyWith({
    Personage? personage,
    bool? isLoading,
  }) {
    return PersonageDetailsSuccessState(
      personage: personage ?? this.personage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [personage];
}
