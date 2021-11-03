import 'package:career_app/view_model/drawer_view_model.dart';
import 'package:career_app/utils/routes.dart';
import 'package:career_app/view/earning_deduction.dart';
import 'package:career_app/view/loan_simulator.dart';
import 'package:career_app/view/perfil-screen.dart';
import 'package:career_app/view/settings.dart';
import 'package:career_app/view/tax.dart';
import 'package:career_app/view/wage_mapping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                colors: [Colors.green[200], Colors.green[50], Colors.green[50]],
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
                      image: AssetImage("assets/images/drawer-backgroud.webp"),
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
                  nextScreen: WageMappingScreen()),
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
