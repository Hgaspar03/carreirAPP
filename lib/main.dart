import 'package:career_app/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CarreirAPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCareer;
  String selectedClass;
  int selectedEscalao;
  double salarioBase;
  String selectedRegime;

  List carreiras = [
    "Instrutor e Técnico Pedagógico N2",
    "Docente N1",
    "Técnicos Superiores da Saúde N1",
    "Assistentes Técnicos da Saúde",
    "Agente municipal",
    "Medicina Hospitalar",
    "Técnico Superior de Seguros N1",
    "Conservador e Notário Técnico",
    "Guarda Judicial Fiscal",
    "Técnico superior do Turismo N1",
  ];

  List classes = [
    "Classe A",
    "Classe B",
    "Classe C",
    "Classe E",
  ];

  List escalao = [
    1,
    2,
    3,
    4,
  ];

  List regime = [
    "Geral",
    "Específico",
    "Especial não diferenciado",
    "Especial diferenciado",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("CarreirAPP"),
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
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: const Text(
                        "Mapeamento Salarial",
                        style: TextStyle(fontSize: 22, color: Colors.blueGrey),
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
                            dropdownColor: Colors.lightBlue[100],
                            value: selectedRegime,
                            isExpanded: true,
                            onChanged: (selection) {
                              setState(() {
                                selectedRegime = selection;
                              });
                            },
                            hint: const Text(
                              "Selecione um regime",
                              style: TextStyle(
                                fontSize: 13.5,
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
                            hint: const Text(
                              "Selecione uma carreira",
                              style: TextStyle(
                                fontSize: 13.5,
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
                              });
                            },
                            hint: const Text(
                              "Selecione a classe",
                              style: TextStyle(fontSize: 13.5),
                            ),
                            items: classes.map((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                onTap: () {
                                  setState(() {
                                    selectedClass = e;
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
                              });
                            },
                            hint: const Text(
                              "Selecione o escalão",
                              style:
                                  TextStyle(fontSize: 13.5, color: Colors.grey),
                            ),
                            items: escalao.map(
                              (e) {
                                return DropdownMenuItem<int>(
                                  value: e,
                                  onTap: () {
                                    setState(
                                      () {
                                        selectedEscalao = e;
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
