import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TosyoCard extends StatelessWidget {
  final DateFormat formatter = DateFormat('yyyy/MM/dd', "ja_JP");
  final int _id;
  final String _title;
  final int _balance;
  final DateTime _expireDate;

  TosyoCard(this._id, this._title, this._balance, this._expireDate,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
              leading: Image.asset('assets/book_tosyo_card.png'),
              title: Text(_title),
              subtitle: Text(
                '残高: ' + _balance.toString() + '円\n有効期限: ' + formatter.format(_expireDate),
              ),
              isThreeLine: true),
        ],
      ),
    );
  }
}
