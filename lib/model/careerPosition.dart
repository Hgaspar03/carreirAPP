import 'package:career_app/utils/Regime.dart';
import 'package:career_app/utils/Type.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CareerPosition {
  CareerPosition(this._id, this._name, this._type, this._code);
  final num _id;
  final String _name;
  final Type _type;
  final String _code;



  factory CareerPosition.fromJson(Map<String, dynamic> json) {

    return CareerPosition(
      json['id'] as num,
      json['name'] as String,
      Type.values.byName(json['type']),
      json['code'] as String

    );
  }
}
