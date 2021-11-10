part of 'comics_bloc.dart';

abstract class ComicsState extends Equatable {
  const ComicsState();
  
  @override
  List<Object> get props => [];
}

class ComicsInitial extends ComicsState {}
