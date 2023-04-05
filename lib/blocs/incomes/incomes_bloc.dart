

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'incomes_event.dart';
part 'incomes_state.dart';

class IncomesBloc extends Bloc<IncomesEvent, IncomesState> {
  IncomesBloc() : super(IncomesInitial()) {
    on<IncomesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
