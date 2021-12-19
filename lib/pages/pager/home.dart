import 'package:flutter/material.dart';
import 'package:book_pay/providers/card.dart';
import 'package:provider/provider.dart';

// ホーム画面の定義
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // 親クラスから子クラスに渡された値は finalで定義する

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _renderHomeView(CardProvider model) {
    var cardList = model.cards;
    var cardSum = cardList.map((c) => c.balance).reduce((a, b) => a + b);
    var cardNum = cardList.length;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/book_tosyo_card.png'),
          Text(
            '総残高: $cardSum円',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'カード枚数: $cardNum 枚',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CardProvider>(builder: (context, model, _) {
        return _renderHomeView(model);
      }),
    );
  }
}
