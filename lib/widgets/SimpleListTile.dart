import 'package:flutter/material.dart';

class SimpleListTile extends StatelessWidget {
  SimpleListTile({Key key, this.title, this.icon}) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 4.0, right: 4.0),
        title: Transform.translate(
          offset: Offset(-16, 0),
          child: Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.0),
          ),
        ),
        leading: IconButton(
          icon: Icon(this.icon),
          iconSize: 20.0,
          disabledColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        onTap: () {},
      ),
    );
  }
}