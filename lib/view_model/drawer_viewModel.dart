import 'package:career_app/view/career_list_view.dart';
import 'package:career_app/view_model/career_viewModel.dart';
import 'package:flutter/material.dart';

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
        style: TextStyle(color: Colors.blueGrey[600]),
      ),
      trailing: Icon(icon),
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
