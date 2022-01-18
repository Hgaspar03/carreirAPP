  import 'package:career_app/utils/testeData.dart';
import 'package:career_app/view/earning_deduction.dart';
import 'package:flutter/material.dart';
import 'model/drawer/drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TesteData()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de carreiras',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: EarningAndDeductionScreen(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CareerDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("CarreirApp"),
      ),
      body: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}
