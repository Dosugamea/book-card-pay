import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:book_pay/models/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cards = <CardModel>[
    CardModel(
      id: 1,
      title: 'a',
      balance: 100,
      expireDate: '2022/12/04',
      cardId: '12345678',
      cardPin: '1234',
    ),
    CardModel(
      id: 2,
      title: 'a',
      balance: 200,
      expireDate: '2022/12/04',
      cardId: '12345678',
      cardPin: '1234',
    ),
    CardModel(
      id: 3,
      title: 'a',
      balance: 300,
      expireDate: '2022/12/04',
      cardId: '12345678',
      cardPin: '1234',
    ),
  ];

  addCard(CardModel card) {
    cards.add(card);
    notifyListeners();
  }

  editCard(CardModel card) {
    cards.removeWhere((element) => element.id == card.id);
    cards.add(card);
    notifyListeners();
  }

  removeCard(CardModel card) {
    cards = cards.where((c) => c.id != card.id).toList();
    notifyListeners();
  }

  Future save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cardStrings =
        cards.map((f) => json.encode(f.toJson())).toList();
    await prefs.setStringList('cards', cardStrings);
  }

  Future load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('cards') ?? [];
    cards = result.map((f) => CardModel.fromJson(json.decode(f))).toList();
  }
}
