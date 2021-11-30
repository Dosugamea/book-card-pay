import 'package:flutter/material.dart';

// ホーム画面の定義
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // 親クラスから子クラスに渡された値は finalで定義する

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    _counter += 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/book_tosyo_card.png'),
          Text(
            '総残高: $_counter',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            'カード枚数: $_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    ));
  }
}
