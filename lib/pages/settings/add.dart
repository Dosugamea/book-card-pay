import 'package:flutter/material.dart';
import 'package:book_pay/utils/scraper.dart';

// カード情報ページの定義
class CardAddPage extends StatefulWidget {
  const CardAddPage({Key? key}) : super(key: key);

  @override
  State<CardAddPage> createState() => _CardAddPageState();
}

// カード情報画面の定義
class _CardAddPageState extends State<CardAddPage> {
  String _url = '';

  void _updateUrl(String e) {
    setState(() {
      _url = e;
    });
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _addCard() async {
    if (_url.isEmpty) {
      _showAlert('エラー', 'URLを入力してください');
      return;
    }
    var scraper = Scraper();
    var card = await scraper.fetchCard(_url);
    if (card == null) {
      _showAlert('エラー', 'カード情報が取得できませんでした。アドレスをご確認ください。');
      return;
    }
    // カード情報を追加したら、カード一覧画面に遷移する
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カードの追加'),
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
                    Text(
                      '受け取ったカードのURLを入力',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    TextField(
                      enabled: true,
                      maxLength: 100,
                      obscureText: false,
                      maxLines: 1,
                      onChanged: _updateUrl,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _addCard();
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 23),
                        ),
                        child: const Text('カードを追加する'),
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
