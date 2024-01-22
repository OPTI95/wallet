part of 'cards_cubit.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object> get props => [];
}

class CardsInitial extends CardsState {}

class CardsLoadedState extends CardsState {
  final List<Card> list;

  CardsLoadedState(this.list);
}

