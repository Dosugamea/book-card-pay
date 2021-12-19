import 'package:flutter/material.dart';
import 'package:book_pay/models/card.dart';

// カード情報画面の定義
class CardPage extends StatelessWidget {
  final CardModel card;

  const CardPage(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カード情報'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            const Spacer(flex: 1),
            Expanded(
              flex: 6, // 割合.
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Column(
                  children: [
                    Image.asset('assets/book_tosyo_card.png'),
                    Text(
                      '残高: ${card.balance} 円',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '有効期限: ${card.expireDate}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 23),
                        ),
                        child: const Text('このカードで支払う'),
                      ),
                    ),
                    const SizedBox(height: 35),
                    FractionallySizedBox(
                      widthFactor: 1.0,
                      child: Column(
                        children: [
                          Text(
                            "ID: **** **** **** ****",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "PIN: ****",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                              child: const Text('カード情報を表示'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
