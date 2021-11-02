import 'package:career_app/drawer/drawer.dart';
import 'package:career_app/utils/testeData.dart';
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
      appBar: AppBar(
        title: const Text('Registar Abono ou Desconto'),
      ),
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
                                "Selecione a classe",
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
                            dropdownColor: Colors.lightBlue[100],
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
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Selecione o escalão",
                                style: TextStyle(
                                    fontSize: 13.5, color: Colors.grey),
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
                  Container(
                      margin: const EdgeInsets.only(top: 60, bottom: 15),
                      decoration: BoxDecoration(),
                      child: ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          setState(() {
                            salarioBase = 25471;
                          });
                        },
                        child: Text(
                          "Calcular Salário Base:",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      )),
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
