
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerViewModel extends StatelessWidget {
  const DrawerViewModel({Key key}) : super(key: key);

  Widget listTile(
      {@required BuildContext context,
      @required title,
      @required IconData icon,
      @required Widget nextScreen}) {
    return ListTile(
      title: Text(
        "$title",
        style: GoogleFonts.comfortaa(fontSize: 13.50  , color: Colors.blueGrey[600], fontWeight: FontWeight.w900),
      ),
      trailing: Icon(icon,color: Colors.blueGrey[700],),
      minVerticalPadding: 5,
      selectedTileColor: Colors.grey,
      dense: true,
      hoverColor: Colors.grey,
      onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (_) {

                return nextScreen;
              }))

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
