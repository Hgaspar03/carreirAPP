import 'package:career_app/utils/Regime.dart';
import 'package:career_app/utils/Type.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Echelom {
  Echelom(this._id, this._value);
  final num _id;
  final num _value;

  num get value =>_value;
  num get id => _id;



  factory Echelom.fromJson(Map<String, dynamic> json) {

    return Echelom(
        json['id'] as num,
        json['value'] as num

    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && this._value ==other._value && this._id == other._id;

  @override
  int get hashCode => super.hashCode;

}
