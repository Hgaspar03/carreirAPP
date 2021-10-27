import 'package:flutter/material.dart';

class CareerDrawer extends StatelessWidget {
  const CareerDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey[300], Colors.white30],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(right: 10, bottom: 25),
                padding: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(
                    Icons.account_box_rounded,
                    size: 120,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 30),
                    child: Text(
                      "Alexande Pedro Guimarães",
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  subtitle: Text(
                    "Instrutor Técnico Pedagógico N1",
                    textAlign: TextAlign.center,
                  ),
                  horizontalTitleGap: -5,
                  contentPadding: EdgeInsets.only(top: 22),
                ),
              ),
              ListTile(
                title: Text("Perfil"),
                trailing: Icon(Icons.account_circle),
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
              ),
              Divider(height: 5),
              ListTile(
                title: Text("Mapeamento Salarial"),
                trailing: Icon(Icons.monetization_on),
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
              ),
              Divider(height: 5),
              ListTile(
                title: Text("Registar Abonos ou Descontos"),
                trailing: Icon(Icons.money),
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
              ),
              Divider(height: 5),
              ListTile(
                title: Text("Calcular Impostos/INSS"),
                trailing: Icon(Icons.verified),
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
              ),
              Divider(height: 5),
              ListTile(
                title: Text("Simular Emprestimo Bancário"),
                trailing: Icon(Icons.calculate),
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
              ),
              Divider(height: 5),
              ListTile(
                minVerticalPadding: 5,
                selectedTileColor: Colors.grey,
                dense: true,
                hoverColor: Colors.grey,
                title: Text("Definições"),
                trailing: Icon(Icons.settings),
              ),
            ],
          )),
    );
  }
}
