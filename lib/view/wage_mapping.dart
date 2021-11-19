import 'package:career_app/model/drawer/drawer.dart';
import 'package:career_app/utils/testeData.dart';
import 'package:career_app/view_model/abstract_view_model.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WageMappingScreen extends StatelessWidget {
  const WageMappingScreen({Key key}) : super(key: key);

  static const String wageMappingRoute = '/mapping';

  @override
  Widget build(BuildContext context) {
    final testeData = context.read<TesteData>();
    List carreiras = testeData.carreiras;

    List classes = testeData.classes;

    List escalao = testeData.escalao;

    List edt = testeData.earningDeductionTypes;

    List regime = testeData.regime;

    String selectedRegime = testeData.selectedRegime;

    String selectedCareer = testeData.selectedCareer;

    String selectedClass = testeData.selectedClass;

    num selectedEscalao = testeData.selectedEscalao;

    double salarioBase = testeData.salarioBase;

    final formater = testeData.formater;

    DateTime startDate = testeData.startDate;

    DateTime endDate = testeData.endDate;

    return Scaffold(
      drawer: CareerDrawer(),
      appBar: CareerAppBar.appBar(context, title: "Mapeamento Salarial"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey[300], Colors.white30],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: const Text(
                        "Preencha os dados da sua carreira",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Regime :",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                Theme.of(context).textTheme.bodyText1.fontSize,
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
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: context.watch<TesteData>().selectedRegime,
                            isExpanded: true,
                            onChanged: (selection) {
                              testeData.selectedRegime = selection;
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Selecione um regime",
                                style: TextStyle(
                                  fontSize: 13.5,
                                ),
                              ),
                            ),
                            iconEnabledColor: Theme.of(context).primaryColor,
                            items: regime.map((e) {
                              return DropdownMenuItem<String>(
                                  value: e,
                                  onTap: () {
                                    selectedRegime = e;
                                    testeData.selectedCareer = null;
                                    testeData.selectedClass = null;
                                    testeData.selectedEscalao = null;
                                    testeData.salarioBase = null;
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        e,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .fontSize,
                                        ),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Carreira:",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                Theme.of(context).textTheme.bodyText1.fontSize,
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
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedCareer,
                            isExpanded: true,
                            onChanged: (selection) {
                              testeData.selectedCareer = selection;
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Selecione uma carreira",
                                style: TextStyle(
                                  fontSize: 13.5,
                                ),
                              ),
                            ),
                            iconEnabledColor: Theme.of(context).primaryColor,
                            items: carreiras.map((e) {
                              return DropdownMenuItem<String>(
                                  value: e,
                                  onTap: () {
                                    selectedCareer = e;
                                    testeData.selectedClass = null;
                                    testeData.selectedEscalao = null;
                                    testeData.salarioBase = null;
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        e,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .fontSize,
                                        ),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Classe  :",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton<String>(
                            menuMaxHeight: 250,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            isDense: true,
                            iconSize: 20,
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedClass,
                            isExpanded: true,
                            focusColor: Theme.of(context).primaryColor,
                            onChanged: (selection) {
                              testeData.selectedClass = selection;
                              testeData.selectedEscalao = null;
                              testeData.salarioBase = null;
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Selecione a classe",
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ),
                            items: classes.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                onTap: () {
                                  testeData.selectedClass = e;
                                  testeData.selectedEscalao = null;
                                  testeData.salarioBase = null;
                                },
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .fontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Escalão :",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButton<int>(
                            menuMaxHeight: 250,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            isDense: true,
                            iconSize: 20,
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedEscalao,
                            isExpanded: true,
                            focusColor: Theme.of(context).primaryColor,
                            onChanged: (selection) {
                              testeData.selectedEscalao = selection;
                              salarioBase = null;
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: const Text(
                                "Selecione o escalão",
                                style: TextStyle(
                                  fontSize: 13.5,
                                ),
                              ),
                            ),
                            items: escalao.map(
                              (e) {
                                return DropdownMenuItem<int>(
                                  value: e,
                                  onTap: () {
                                    selectedEscalao = e;
                                    salarioBase = null;
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '$e',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .fontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                  AbstractViewModel().roundedButtom(context,
                      title: "Calcular Salário Base", onPressed: () {}),
                  Text(
                    " ${salarioBase != null ? salarioBase : " "} ${salarioBase != null ? "MZN" : " "}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
