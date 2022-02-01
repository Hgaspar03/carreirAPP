import 'package:career_app/model/career.dart';
import 'package:career_app/view/drawer/drawer.dart';
import 'package:career_app/service/career_service.dart';
import 'package:career_app/view/wage_mapping_view.dart';
import 'package:career_app/view_model/appbar_viewModel.dart';
import 'package:career_app/view_model/career_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({Key key}) : super(key: key);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  var editingController = TextEditingController();
  List<String> items = List.empty();
  @override
  Widget build(BuildContext context) {
    List<String> duplicateItems;
    var searchField = TextField(
      controller: editingController,
      decoration: InputDecoration(
          labelText: "Pesquisar",
          hintText: "Carreira",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );

    return Scaffold(
      drawer: CareerDrawer(),
      appBar: CareerAppBar.appBar(context, title: "selecionar carreira"),
      body: FutureBuilder<List<Career>>(
        future: CareerService().fetchCareers(),
        builder: (context, snapshot) {
          void filterSearchResults(String query) {
            List<String> dummySearchList = duplicateItems.toSet().toList();

            if (query.isNotEmpty) {
              List<String> dummyListData = List<String>();

              for (String item in dummySearchList) {
                if (item.contains(query)) {
                  dummyListData.add(item);
                }
              }
              setState(() {
                items.clear();
                items.addAll(dummyListData);
              });
              return;
            } else {
              setState(() {
                items.clear();
                items.addAll(duplicateItems);
              });
            }
          }

          if (snapshot.hasError) {
            print(snapshot.stackTrace);
            return Center(
                child: Card(
              child: Text(snapshot.error.toString()),
            ));
          }
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          duplicateItems = snapshot.data.map<String>((e) => e.name).toList();

          items = items.isEmpty ? duplicateItems.toSet().toList() : items;

          return Container(
              color: Colors.indigoAccent.withAlpha(50),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Pesquisar",
                          hintText: "Carreira",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        children: items
                            .map(
                              (career) => ListTile(
                                title: Text(
                                  career,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                    var careerData =     context.read<CareerViewModel>();
                                    careerData.selectedCategory = null;
                                    careerData.selectedEchelom = null;
                                       return  WageMappingScreen(
                                          snapshot.data.firstWhere(
                                                  (c) => c.name == career),
                                        );
                                      } ,
                                      ),
                                  );
                                },
                              ),
                            )
                            .toList()),
                  )
                ],
              ));
        },
      ),
    );
  }
}
