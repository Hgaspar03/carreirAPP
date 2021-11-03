import 'package:career_app/model/drawer/drawer.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:flutter/material.dart';

class LoanSimulatorScreen extends StatelessWidget {
  const LoanSimulatorScreen({Key key}) : super(key: key);

  static const String loanSimulatorRoute = '/loan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar:
          CareerAppBar.appBar(context, title: 'Simular Empréstimo Bancário'),
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
