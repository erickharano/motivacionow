part of 'personage_bloc.dart';

abstract class PersonageState extends Equatable {
  const PersonageState();
}

class PersonageInitialState extends PersonageState {
  const PersonageInitialState();

  @override
  List<Object?> get props => [];
}

class PersonageLoadingState extends PersonageState {
  const PersonageLoadingState();

  @override
  List<Object?> get props => [];
}

class PersonageErrorState extends PersonageState {
  final String error;

  const PersonageErrorState({required this.error});

  @override
  List<Object?> get props => [];
}

class PersonageSuccessState extends PersonageState {
  final List<Personage> personages;
  final bool hasMax;
  final bool isLoading;

  const PersonageSuccessState({
    required this.personages,
    this.hasMax = false,
    this.isLoading = false,
  });

  PersonageSuccessState copyWith({
    List<Personage>? personages,
    bool? hasMax,
    bool? isLoading,
  }) {
    return PersonageSuccessState(
      personages: personages ?? this.personages,
      hasMax: hasMax ?? this.hasMax,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [personages, hasMax];
}
