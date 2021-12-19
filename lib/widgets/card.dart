import 'package:flutter/material.dart';
import 'package:book_pay/models/card.dart';
import 'package:book_pay/pages/card.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;

  const CardWidget(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/book_tosyo_card.png'),
            title: Text(card.title),
            subtitle: Text('残高: ${card.balance}円\n有効期限: ${card.expireDate}'),
            isThreeLine: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(card),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
