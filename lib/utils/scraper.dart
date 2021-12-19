import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:book_pay/models/card.dart';
import 'dart:math';

const cardBalanceEndpoint = 'https://toshocard.jp/customer/card/getCardInfo';

class Scraper {
  Future<String?> getResponseText(Uri uri) async {
    final response = await http.get(uri, headers: {
      "User-Agent":
          "Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36"
    });
    if (response.statusCode != 200) {
      return null;
    }
    return response.body;
  }

  Future<int?> fetchBalance(String cardId, String cardPin) async {
    var queryParameters = {
      'cardNo': cardId,
      'pin': cardPin,
    };
    var balanceUri = Uri.parse(cardBalanceEndpoint);
    balanceUri = balanceUri.replace(queryParameters: queryParameters);
    var balanceHtml = await getResponseText(balanceUri);
    if (balanceHtml == null) {
      return null;
    }
    var balanceDocument = parse(balanceHtml);
    if (balanceDocument.getElementsByTagName('p').isEmpty) {
      return null;
    }
    var balanceText = balanceDocument
        .getElementsByTagName('p')[0]
        .text
        .replaceAll('￥', '')
        .replaceAll(',', '');
    var balance = int.parse(balanceText);
    return balance;
  }

  Future<CardModel?> fetchCard(String uri) async {
    var url = Uri.parse(uri);
    var payHtml = await getResponseText(url);
    if (payHtml == null) {
      return null;
    }
    // 必要なデータを QRコードページから取り出す
    var payDocument = parse(payHtml);
    var datas = payDocument.getElementsByClassName('data');
    if (datas.length != 3) {
      return null;
    }
    var cardId = datas[0].getElementsByTagName('span')[1].text;
    var cardPin = datas[1].getElementsByTagName('span')[1].text;
    var expireDate = datas[2].getElementsByTagName('span')[1].text;
    var uniqueId = url.queryParameters['ua'] ?? '';
    var uniqueId2 = url.queryParameters['us'] ?? '';
    // 残高を読み出す
    var balance = await fetchBalance(cardId, cardPin);
    if (balance == null) {
      return null;
    }
    return CardModel(
        id: Random().nextInt(1000000),
        title: 'title',
        balance: balance,
        expireDate: expireDate,
        cardId: cardId,
        cardPin: cardPin,
        uniqueId: uniqueId,
        uniqueId2: uniqueId2);
  }
}
