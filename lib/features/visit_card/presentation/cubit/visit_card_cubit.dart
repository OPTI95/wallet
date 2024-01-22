import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visit_card_state.dart';

class VisitCardCubit extends Cubit<VisitCardState> {
  VisitCardCubit() : super(VisitCardInitial());
}
