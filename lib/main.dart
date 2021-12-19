import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:book_pay/providers/card.dart';
import 'package:provider/provider.dart';
import 'pager.dart';

// エントリーポイント
void main() {
  initializeDateFormatting('ja_JP');
  runApp(const MyApp());
}

// アプリパッケージの定義
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // アプリ直下
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'ブックPay',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Pager(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => CardProvider(),
        )
      ],
    );
  }
}
