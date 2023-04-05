import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'outcomes_event.dart';
part 'outcomes_state.dart';

class OutcomesBloc extends Bloc<OutcomesEvent, OutcomesState> {
  OutcomesBloc() : super(OutcomesInitial()) {
    on<OutcomesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
