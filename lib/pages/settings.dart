import 'package:flutter/material.dart';
import 'package:book_pay/pages/cards.dart';
import 'package:book_pay/components/setting.dart';

// カード一覧ページの定義
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // 親クラスから子クラスに渡された値は finalで定義する

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Setting> _settings = [];

  @override
  void initState() {
    _settings.add(const Setting('カードの追加', Icons.add, CardsPage()));
    _settings.add(const Setting('カードの消去', Icons.remove, CardsPage()));
    _settings.add(const Setting('カードの残高更新', Icons.refresh, CardsPage()));
    _settings.add(const Setting('カードのエクスポート', Icons.share, CardsPage()));
    _settings.add(const Setting('カードのインポート', Icons.share, CardsPage()));
    _settings.add(const Setting('クレジット', Icons.info, CardsPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _settings.length,
        itemBuilder: (BuildContext context, int index) {
          return _settings[index];
        },
      ),
    );
  }
}
