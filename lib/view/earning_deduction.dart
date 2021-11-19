import 'dart:ui';

import 'package:career_app/model/drawer/drawer.dart';
import 'package:career_app/utils/testeData.dart';
import 'package:career_app/view_model/abstract_view_model.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class EarningAndDeductionScreen extends StatefulWidget {
  const EarningAndDeductionScreen({Key key}) : super(key: key);

  static const String earningDeductionRoute = '/earningDeduction';

  @override
  _EarningAndDeductionScreenState createState() =>
      _EarningAndDeductionScreenState();
}

class _EarningAndDeductionScreenState extends State<EarningAndDeductionScreen> {
  final valorController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  @override
  Widget build(BuildContext context) {
    final testeData = context.read<TesteData>();

    List carreiras = testeData.carreiras;

    List classes = testeData.classes;

    List escalao = testeData.escalao;

    List edt = testeData.earningDeductionTypes;

    String selectedRegime = testeData.selectedRegime;

    String selectedCareer = testeData.selectedCareer;

    String selectedClass = testeData.selectedClass;

    num selectedEscalao = testeData.selectedEscalao;

    double salarioBase = testeData.salarioBase;

    final formater = testeData.formater;

    DateTime startDate = testeData.startDate;
    DateTime endDate = testeData.endDate;

    String type = testeData.type;

    return Scaffold(
      drawer: CareerDrawer(),
      appBar: CareerAppBar.appBar(context, title: 'Registar Abono ou Desconto'),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey[300], Colors.white30],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Form(
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
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Tipo :",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: DropdownButton<String>(
                              menuMaxHeight: 250,
                              isDense: true,
                              iconSize: 20,
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor:
                                  Theme.of(context).primaryColorLight,
                              value: (context).watch<TesteData>().type,
                              isExpanded: true,
                              onChanged: (selection) {
                                testeData.type = selection;
                              },
                              hint: const Text(
                                "Selecione um abono/desconto",
                                style: TextStyle(
                                  fontSize: 13.5,
                                ),
                              ),
                              iconEnabledColor: Theme.of(context).primaryColor,
                              items: edt.map((e) {
                                return DropdownMenuItem<String>(
                                    value: e,
                                    onTap: () {
                                      type = e;
                                      selectedCareer = null;
                                      selectedClass = null;
                                      selectedEscalao = null;
                                      salarioBase = null;
                                    },
                                    child: Row(
                                      children: [
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () =>
                              _selectDate(context: context, selectedDate: 1),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5, color: Colors.blueGrey))),
                            child: Text(
                              "${formater.format(startDate)}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Fim:",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 30),
                        GestureDetector(
                          onTap: () =>
                              _selectDate(context: context, selectedDate: 2),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5, color: Colors.blueGrey))),
                            child: Text(
                              "${formater.format(endDate)}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
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
                          child: TextField(
                            style: TextStyle(fontSize: 15),
                            controller: valorController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: 'MZN',
                              suffixStyle: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90),
                    AbstractViewModel().roundedButtom(
                      context,
                      title: 'Registar',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            content: Text(
                              '${testeData.type} registado com sucesso',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      {@required BuildContext context, @required int selectedDate}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 1),
        lastDate: DateTime(2101));
    //if (picked != null && picked != selectedDate)
    setState(() {
      if (selectedDate == 1) {
        (context).read<TesteData>().startDate = picked;
      } else {
        (context).read<TesteData>().endDate = picked;
      }
    });
  }
}
