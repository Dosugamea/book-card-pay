import 'package:flutter/material.dart';
import 'package:book_pay/widgets/card.dart';
import 'package:book_pay/providers/card.dart';
import 'package:provider/provider.dart';

// カード一覧ページの定義
class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  // 親クラスから子クラスに渡された値は finalで定義する

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  Widget _renderListView(CardProvider model) {
    final cardList = model.cards;
    return ListView.builder(
      itemCount: cardList.length,
      itemBuilder: (BuildContext context, int index) {
        return CardWidget(cardList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CardProvider>(builder: (context, model, _) {
        return _renderListView(model);
      }),
    );
  }
}
