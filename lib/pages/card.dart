import 'package:flutter/material.dart';
import 'package:book_pay/models/card.dart';
import 'package:url_launcher/url_launcher.dart';

// カード情報ページの定義
class CardPage extends StatefulWidget {
  final CardModel card;

  const CardPage(this.card, {Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

// カード情報画面の定義
class _CardPageState extends State<CardPage> {
  bool _showPin = false;
  String _id = '**** **** **** ****';
  String _pin = '****';
  String _label = 'カード情報を表示';

  void _openCardView(CardPage widget) async {
    var ua = widget.card.uniqueId;
    var us = widget.card.uniqueId2;
    var url = 'https://toshocard.jp/customer/tcn/netgift?ua=$ua&us=$us';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  void __toggleShowState(CardPage widget) {
    if (!_showPin) {
      setState(() {
        _id = widget.card.cardId;
        _pin = widget.card.cardPin;
        _label = 'カード情報を隠す';
        _showPin = true;
      });
    } else {
      setState(() {
        _id = '**** **** **** ****';
        _pin = '****';
        _label = 'カード情報を表示';
        _showPin = false;
      });
    }
  }

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
                      '残高: ${widget.card.balance} 円',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '有効期限: ${widget.card.expireDate}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _openCardView(widget);
                        },
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
                            "ID: $_id",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "PIN: $_pin",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () => __toggleShowState(widget),
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                              child: Text(_label),
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
