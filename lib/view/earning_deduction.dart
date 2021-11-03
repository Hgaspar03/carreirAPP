import 'package:career_app/model/drawer/drawer.dart';
import 'package:career_app/utils/testeData.dart';
import 'package:career_app/view_model/abstract_view_model.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:flutter/material.dart';

class EarningAndDeductionScreen extends StatefulWidget {
  const EarningAndDeductionScreen({Key key}) : super(key: key);

  static const String earningDeductionRoute = '/earningDeduction';

  @override
  _EarningAndDeductionScreenState createState() =>
      _EarningAndDeductionScreenState();
}

class _EarningAndDeductionScreenState extends State<EarningAndDeductionScreen> {
  String selectedCareer;
  String selectedClass;
  int selectedEscalao;
  double salarioBase;
  String selectedRegime;

  List carreiras = TesteData.carreiras;

  List classes = TesteData.classes;

  List escalao = TesteData.escalao;

  List regime = TesteData.regime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar: CareerAppBar.appBar(context, title: 'Registar Abono ou Desconto'),
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
                    height: 145,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: const Text(
                        "Informe os seus abonos ou descontos para \n"
                        "melhorar a precisão do mapeamento salarial",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Tipo :",
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
                            dropdownColor: Colors.lightBlue[100],
                            value: selectedRegime,
                            isExpanded: true,
                            onChanged: (selection) {
                              setState(() {
                                selectedRegime = selection;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Selecione um abono/desconto",
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
                                    setState(() {
                                      selectedRegime = e;
                                      selectedCareer = null;
                                      selectedClass = null;
                                      selectedEscalao = null;
                                      salarioBase = null;
                                    });
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
                        "Início:",
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
                            dropdownColor: Colors.lightBlue[100],
                            value: selectedCareer,
                            isExpanded: true,
                            onChanged: (selection) {
                              setState(() {
                                selectedCareer = selection;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Inforne a data de iníco do abono/desconto",
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
                                    setState(() {
                                      selectedCareer = e;
                                      selectedClass = null;
                                      selectedEscalao = null;
                                      salarioBase = null;
                                    });
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
                      Text("Fim  :",
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
                            dropdownColor: Colors.lightBlue[100],
                            value: selectedClass,
                            isExpanded: true,
                            focusColor: Theme.of(context).primaryColor,
                            onChanged: (selection) {
                              setState(() {
                                selectedClass = selection;
                                selectedEscalao = null;
                                salarioBase = null;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Inforne a data de fim do abono/desconto",
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ),
                            items: classes.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                onTap: () {
                                  setState(() {
                                    selectedClass = e;
                                    selectedEscalao = null;
                                    salarioBase = null;
                                  });
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
                      Text("Valor :",
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
                            iconSize: 25,
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor: Theme.of(context).primaryColorLight,
                            value: selectedEscalao,
                            isExpanded: true,
                            focusColor: Theme.of(context).primaryColor,
                            onChanged: (selection) {
                              setState(() {
                                selectedEscalao = selection;
                                salarioBase = null;
                              });
                            },
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: const Text(
                                "Informe o valor do abono/desconto",
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
                                    setState(
                                      () {
                                        selectedEscalao = e;
                                        salarioBase = null;
                                      },
                                    );
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
                  SizedBox(height: 65),
                  AbstractViewModel().roundedButtom(context,
                      title: '                  Registar                ',
                      onPressed: () {}),
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
