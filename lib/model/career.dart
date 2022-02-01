import 'package:career_app/utils/Regime.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'dart:convert';


import 'category.dart';

class Career {
  Career(this.id, this.name, this.code, this.regime, this.categorys);
  final num id;
  final String name;
  final String code;
  final Regime regime;
  final List<Category> categorys;






  factory Career.fromJson(Map<String, dynamic> jason) {


   final categorys =json.decode(json.encode(jason['categorys']));

  final dynamycCategorys =  categorys.map<Category>((c)=>Category.fromJson(c)).toList();




  return Career(
      jason['id'] as num,
      jason['name'] as String,
      jason['code'] as String,
      Regime.values.byName(jason['regime']),
    dynamycCategorys);


  }



}
