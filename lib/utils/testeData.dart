import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TesteData extends ChangeNotifier {
  String _selectedCareer;
  String _selectedClass;
  num _selectedEscalao;
  double _salarioBase;
  String _selectedRegime;
  String _type;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  final formater = new DateFormat('dd-MM-yyyy');

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

  List earningDeductionTypes = ["Abono", "Desconto"];

  String get selectedCareer => _selectedCareer;
  String get selectedClass => _selectedClass;
  num get selectedEscalao => _selectedEscalao;
  double get salarioBase => _salarioBase;
  String get selectedRegime => _selectedRegime;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  String get type => _type;

  set selectedCareer(String value) {
    _selectedCareer = value;
    notifyListeners();
  }

  set selectedClass(String value) {
    _selectedClass = value;
    notifyListeners();
  }

  set selectedEscalao(num value) {
    _selectedEscalao = value;
    notifyListeners();
  }

  set salarioBase(double value) {
    _salarioBase = value;
    notifyListeners();
  }

  set selectedRegime(String value) {
    _selectedRegime = value;
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

  set type(String value) {
    _type = value;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
