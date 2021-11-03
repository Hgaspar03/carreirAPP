import 'package:flutter/material.dart';

class CareerAppBar extends StatelessWidget {
  const CareerAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static appBar(BuildContext context, {@required String title}) {
    return AppBar(
      elevation: 20,
      title: Text(
        '$title',
        style: TextStyle(
          color: Colors.blueGrey[50],
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
