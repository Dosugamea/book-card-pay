import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final String _title;
  final IconData _icon;
  final Widget _to;

  const Setting(this._title, this._icon, this._to, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(_icon),
        title: Text(_title),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => _to));
        });
  }
}
