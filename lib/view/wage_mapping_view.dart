import 'package:career_app/model/echelom.dart';
import 'package:career_app/model/career.dart';
import 'package:career_app/model/category.dart';
import 'package:career_app/model/wage_mapping.dart';
import 'package:career_app/service/career_service.dart';
import 'package:career_app/view/career_list_view.dart';
import 'package:career_app/view/drawer/drawer.dart';
import 'package:career_app/view_model/career_viewModel.dart';
import 'package:career_app/view_model/abstract_viewModel.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WageMappingScreen extends StatelessWidget {
  WageMappingScreen(this._selectedCareer);

  static const String wageMappingRoute = '/mapping';

  Career _selectedCareer;

  @override
  Widget build(BuildContext context) {
    final careerViewModel = context.watch<CareerViewModel>();


    careerViewModel.selectedCareer = _selectedCareer;
    double baseSalary = careerViewModel.baseSalary;
    WageMapping wageMapping;
    final _form = GlobalKey<FormState>();

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
          child: Form(
            key: _form,
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
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            careerViewModel.selectedCareer.regime != null
                                ? careerViewModel.selectedCareer.regime.name
                                : '',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .fontSize,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Carreira:",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              return  Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>CareerScreen()
                                ),
                              );
                            },
                            child: Text(
                            this._selectedCareer.name,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .fontSize,
                                fontWeight: FontWeight.normal),
                          ),)
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                              "${careerViewModel.selectedCareer.regime.name != 'SPECIAL_DIFFERENTIATED' ? 'Classe' : 'Categoria'}:",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .fontSize,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: 20,
                            child: DropdownButton<Category>(
                              menuMaxHeight: 250,
                              iconEnabledColor: Theme.of(context).primaryColor,
                              isDense: true,
                              iconSize: 20,
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor:
                                  Theme.of(context).primaryColorLight,
                              value: careerViewModel.selectedCategory,
                              isExpanded: true,
                              focusColor: Theme.of(context).primaryColor,
                              onChanged: (selection) {
                                careerViewModel.selectedCategory = selection;
                                careerViewModel.selectedEchelom = null;
                              },
                              hint: Text(
                                "Selecione a ${careerViewModel.selectedCareer.regime.name != 'SPECIAL_DIFFERENTIATED' ? 'Classe' : 'Categoria'}",
                                style: TextStyle(fontSize: 13.5),
                              ),
                              items: careerViewModel.selectedCareer.categorys.toSet().map((e) {
                                return DropdownMenuItem<Category>(
                                  value: e,
                                  onTap: () {
                                    careerViewModel.selectedCategory = e;
                                    careerViewModel.selectedEchelom = null;
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: Text(
                                      e.name,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: careerViewModel
                                                      .selectedCareer
                                                      .regime
                                                      .name !=
                                                  'SPECIAL_DIFFERENTIATED'
                                              ? 14
                                              : 12.5),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
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
                        // SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton<Echelom>(
                              menuMaxHeight: 250,
                              iconEnabledColor: Theme.of(context).primaryColor,
                              isDense: true,
                              iconSize: 20,
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor:
                                  Theme.of(context).primaryColorLight,
                              value: context
                                  .watch<CareerViewModel>()
                                  .selectedEchelom,
                              isExpanded: true,
                              focusColor: Theme.of(context).primaryColor,
                              onChanged: (selection) {
                                careerViewModel.selectedEchelom = selection;
                                baseSalary = null;
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
                              items: careerViewModel.selectedCategory != null
                                  ? careerViewModel.echeloms.map(
                                      (e) {
                                        return DropdownMenuItem<Echelom>(
                                          value: e,
                                          onTap: () {
                                            careerViewModel.selectedEchelom = e;
                                            baseSalary = null;
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                e.value.toString(),
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
                                    ).toList()
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90),

                      FutureBuilder<WageMapping>(
                          future: CareerService().fetchWageMappingByParameters(
                              careerViewModel.selectedCareer,
                              careerViewModel.selectedCategory,
                              careerViewModel.selectedEchelom),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                " ${snapshot.data != null ? snapshot.data.wage : "***"} ${snapshot.data != null ? "MZN" : " "}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor),
                              );
                            }
                            if (snapshot.hasError ) {
                               print(snapshot.error);
                               return Container();
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    SizedBox(
                      height: 20,
                    ),
                    AbstractViewModel().roundedButtom(context,
                        title: "Calcular Salário Base", onPressed: () async {
                      {
                        if (_form.currentState.validate()) {
                          wageMapping = await CareerService()
                              .fetchWageMappingByParameters(
                                  careerViewModel.selectedCareer,
                                  careerViewModel.selectedCategory,
                                  careerViewModel.selectedEchelom)
                              .whenComplete(() => context
                                  .read<CareerViewModel>()
                                  .notifyListeners());
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
