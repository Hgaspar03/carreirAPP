import 'dart:core';

import 'package:career_app/model/echelom.dart';
import 'package:career_app/model/career.dart';
import 'package:career_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CareerViewModel extends ChangeNotifier {
  Career _selectedCareer;
  Category _selectedCategory;
  Echelom _selectedEchelom;
  double _baseSalary;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  final formater = new DateFormat('dd-MM-yyyy');
  String _earninDeductionType;

  List earningDeductionTypes = ["Abono", "Desconto"];

  List<Echelom> get echeloms => _selectedCategory.echelom;
  Career get selectedCareer => _selectedCareer;
  Category get selectedCategory => _selectedCategory;
  Echelom get selectedEchelom => _selectedEchelom;
  double get baseSalary => _baseSalary;
  String get earninDeductionType => _earninDeductionType;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  set selectedCareer(Career value) {

    if(value == null){

      return;
    }

      _selectedCareer = value;

  }

  set selectedCategory(Category value) {
    _selectedCategory = value;
    notifyListeners();
  }

  set selectedEchelom(Echelom value) {
    _selectedEchelom = value;

    notifyListeners();
  }


  set startDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  set endDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }

  set selectedCategoty(Category value) {
    _selectedCategory = value;
    notifyListeners();
  }

  set earninDeductionType(String type) {
    _earninDeductionType = type;
    notifyListeners();
  }
}
