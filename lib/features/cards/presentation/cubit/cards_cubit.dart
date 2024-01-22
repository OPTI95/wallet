import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vkarmane/core/database_helper/database_help.dart';

import '../../domain/entities/card.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  final dbHelper = DatabaseHelper.instance;
  CardsCubit() : super(CardsInitial());
  Future<bool> saveCard(String name, String? numberCard, String? cvcCode,
      String scanCode, String? backImage, String? frontImage) async {
    Card newNote = Card(
      name: name,
      numberCard: numberCard,
      cvcCode: cvcCode,
      backImage: backImage!,
      frontImage: frontImage!,
      scanCode: scanCode,
    );
    int id = await dbHelper.insert(newNote);
    if (id > 0) {
      await getCards();

      return true;
    } else {
      return false;
    }
  }

  Future<void> getCards() async {
    List<Card> list = await dbHelper.getAllNotes();
    emit(CardsLoadedState(list));
  }

  Future<bool> deleteCard(int id) async {
    int count = await dbHelper.delete(id);
    if (count > 0) {
      await getCards();

      return true;
    } else {
      return false;
    }
  }
}
