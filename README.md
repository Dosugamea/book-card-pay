# Book Pay

図書カードNEXT ネットギフトを保存/提示するアプリ(非公式)

## 使い方
(まだ開発中です)
- 設定 -> カードを追加 -> ネットギフトのURLを入力
- 登録すると カード一覧に追加されます
- 支払い時は カード一覧から選択して支払いボタンを押すとコードが表示されます

### 仕様
- カード残高は自動更新されません
  - 支払いする都度、設定画面から更新ボタンを押してください
- GooglePlay等のアプリバックアップには対応しません
  - (Flutterはじめてなので やり方わかりません)
- カードは暗号化されずそのままの文字列で保存されます
  - (そもそも図書カードNEXTがURLそのままで扱う前提なので...)

## 完成予定図
- [Whimsical参照](https://whimsical.com/pay-S6ih3EB1jjBG3R8gxHK6R6)
  - QUOカードPayの画面を参考にしています

## Flutter Guide

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
