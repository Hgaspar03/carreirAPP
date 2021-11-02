import 'package:career_app/drawer/drawer.dart';
import 'package:flutter/material.dart';

class PersfilScreen extends StatelessWidget {
  const PersfilScreen({Key key}) : super(key: key);

  static const String profileRoute = '/perfil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Center(
        child: ListTile(
          title: Text(
            'Página em Desemvolvimento!!!',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          ),
          trailing: Icon(Icons.no_transfer),
        ),
      ),
    );
  }
}
