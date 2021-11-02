import 'package:career_app/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TaxScreen extends StatelessWidget {
  const TaxScreen({Key key}) : super(key: key);

  static const String taxRoute = '/tax';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar: AppBar(
        title: const Text('Calcular imposto/INSS'),
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
