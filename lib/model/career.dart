import 'package:career_app/utils/Regime.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Career {
  Career(this._id, this._name, this._code, this._regime);
  final num _id;
  final String _name;
  final String _code;
  final Regime _regime;

 static Future<Career> fetchCareers() async {
    final response = await http.get('127.0.0.1:8080/career/all');

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      return Career.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Erro ao carregar carreiras');
    }
  }

  factory Career.fromJson(Map<String, dynamic> json) {

    return Career(
      json['id'] as num,
      json['name'] as String,
      json['code'] as String,
      Regime.values.byName(json['regime']),
    );
  }
}
