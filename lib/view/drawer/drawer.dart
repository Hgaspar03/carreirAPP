import 'package:career_app/view/career_list_view.dart';
import 'package:career_app/view_model/drawer_viewModel.dart';
import 'package:career_app/utils/routes.dart';
import 'package:career_app/view/earning_deduction_view.dart';
import 'package:career_app/view/loan_simulator_view.dart';
import 'package:career_app/view/perfil_view.dart';
import 'package:career_app/view/settings_view.dart';
import 'package:career_app/view/tax_view.dart';
import 'package:career_app/view/wage_mapping_view.dart';
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
                colors: [Colors.indigo[200], Colors.indigo[100], Colors.indigo[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                onDetailsPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersfilScreen(),
                  ),
                ),
                margin: EdgeInsets.only(right: 1),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/blue_background.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(50, 20),
                      bottomRight: Radius.circular(35)),
                  border: Border.all(
                      color: Colors.blueGrey,
                      width: 2,
                      style: BorderStyle.solid),
                ),
                accountName: Text(
                  "Helenio de Vasconcelos",
                  style: TextStyle(color: Colors.blueGrey[100]),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                accountEmail: Text(
                  "Instrutor Técnico Pedagógico N1",
                  style: TextStyle(color: Colors.blueGrey[200]),
                  textAlign: TextAlign.center,
                ),
                currentAccountPictureSize: const Size.fromRadius(40),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/helenio.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DrawerViewModel().listTile(
                  context: context,
                  title: "Meu Perfil",
                  icon: Icons.account_circle,
                  nextScreen: PersfilScreen()),

              DrawerViewModel().listTile(
                  context: context,
                  title: "Mapeamento Salarial",
                  icon: Icons.monetization_on,
                  nextScreen: CareerScreen()),
              DrawerViewModel().listTile(
                  context: context,
                  title: "Registar Abonos ou Descontos",
                  icon: Icons.money,
                  nextScreen: EarningAndDeductionScreen()),
              DrawerViewModel().listTile(
                  context: context,
                  title: "Calcular Impostos/INSS",
                  icon: Icons.verified,
                  nextScreen: TaxScreen()),
              DrawerViewModel().listTile(
                  context: context,
                  title: "Simular Emprestimo Bancário",
                  icon: Icons.calculate,
                  nextScreen: LoanSimulatorScreen()),
              Divider(height: 5),
              DrawerViewModel().listTile(
                  context: context,
                  title: "Definições",
                  icon: Icons.settings,
                  nextScreen: SettingsScreen()),
            ],
          )),
    );
  }
}
