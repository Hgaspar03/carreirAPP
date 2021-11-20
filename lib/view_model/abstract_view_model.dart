import 'package:flutter/material.dart';

class AbstractViewModel extends ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget selectOne(BuildContext context,
      {@required String title,
      @required String hint,
      @required Object selectedValue,
      @required List values}) {
    return Row(
      children: [
        Text(
          "$title :",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButton<String>(
              menuMaxHeight: 250,
              isDense: true,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              dropdownColor: Colors.lightBlue[100],
              value: selectedValue,
              isExpanded: true,
              onChanged: (selection) {
                selectedValue = selection;
              },
              hint: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "$hint",
                  style: TextStyle(
                    fontSize: 13.5,
                  ),
                ),
              ),
              iconEnabledColor: Theme.of(context).primaryColor,
              items: values.map((e) {
                return DropdownMenuItem<String>(
                    value: e,
                    onTap: () {
                      selectedValue = e;
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          e,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize:
                                Theme.of(context).textTheme.bodyText1.fontSize,
                          ),
                        ),
                      ],
                    ));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget roundedButtom(BuildContext context,
      {@required String title, @required Function onPressed}) {
    return Container(
      width: MediaQuery.of(context).size.width - 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        onPressed: onPressed,
        child: Text(
          "$title",
          style: TextStyle(fontSize: 14, color: Colors.blueGrey[50]),
        ),
      ),
    );
  }
}
