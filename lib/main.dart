import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/drawer/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de carreiras',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'App Carreira'),
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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("CarreirAPP"),
      ),
      body: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}
