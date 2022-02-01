import 'dart:convert';

import 'package:career_app/model/echelom.dart';
import 'package:http/http.dart' as http;

class Category
{
  Category(this._id, this._name, this._code, this._echelom);

  final num _id;
  final String _name;
  final String _code;
  final List<Echelom> _echelom;

  List<Echelom> get echelom=>_echelom;
  String get name=> _name;
  num get id  =>_id;

  factory Category.fromJson(Map<String, dynamic> jason){
    List echeloms = json.decode(json.encode(jason['echeloms']));

    return Category(
        jason['id'] as num,
        jason['name'] as String,
        jason['code'] as String,
        echeloms.map((e) => Echelom.fromJson(e)).toList());

  }

  @override
  bool operator ==(dynamic other) =>
      other != null && this._name ==other._name && this._id == other._id;

  @override
  int get hashCode => super.hashCode;

}