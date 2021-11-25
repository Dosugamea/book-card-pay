import 'package:flutter/material.dart';
import 'package:tosyo_card_pay/components/card.dart';

// カード一覧ページの定義
class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  // 親クラスから子クラスに渡された値は finalで定義する

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final List<TosyoCard> _cardList = [];

  @override
  void initState() {
    _cardList.add(TosyoCard(
      12345,
      'Test',
      1000,
      DateTime.now(),
    ));
    _cardList.add(TosyoCard(
      12345,
      'Test2',
      1000,
      DateTime.now(),
    ));
    _cardList.add(TosyoCard(
      12345,
      'Test3',
      1000,
      DateTime.now(),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardList[index];
          },
        ),
      ),
    );
  }
}
