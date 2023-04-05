part of 'outcomes_bloc.dart';

abstract class OutcomesState extends Equatable {
  const OutcomesState();
}

class OutcomesInitial extends OutcomesState {
  @override
  List<Object> get props => [];
}
