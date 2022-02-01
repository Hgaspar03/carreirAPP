import 'dart:convert';
import 'package:career_app/model/category.dart';
import 'package:career_app/model/echelom.dart';
import 'package:career_app/model/wage_mapping.dart';
import 'package:http/http.dart' as http;
import 'package:career_app/model/career.dart';

class CareerService {
  static final CareerService _instance = CareerService._internal();

  List<Career> all = List.empty();

  factory CareerService() {
    return _instance;
  }
  CareerService._internal() {
    all = all.isNotEmpty ? fetchCareers() as List<Career> : all;
  }

  Future<List<Career>> fetchCareers() async {
    if (all.isEmpty) {
      final response = await http.get('http://10.0.2.2:8080/career//all', headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Transfer-Encoding': 'chunked'
      }).catchError((err) => throw Exception(err));

      if (response.statusCode == 200) {
        // If the call to the server was successful (returns OK), parse the JSON.
        String source = Utf8Decoder().convert(response.bodyBytes);
        final careersJson = json.decode(source);

        all = careersJson
            .map<Career>((career) => Career.fromJson(career))
            .toList();
      } else {
        // If that call was not successful (response was unexpected), it throw an error.
        throw Exception('Erro ao carregar carreiras');
      }
    }
    return all;
  }

  Future<WageMapping> fetchWageMappingByParameters(
      Career career, Category category, Echelom echelom) async {
    if (category != null) {
      final response = await http.get(
          'http://10.0.2.2:8080/wage/?position=${category.id}&echalom=${echelom
              .id}&career=${career.id}',
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Transfer-Encoding': 'chunked'
          }).catchError((err) => print(err));
      if (response.statusCode == 200) {
        // If the call to the server was successful (returns OK), parse the JSON.
        String source = Utf8Decoder().convert(response.bodyBytes);
        final wageMapping = json.decode(source);
        return WageMapping.fromJson(wageMapping);
      } else {
        // If that call was not successful (response was unexpected), it throw an error.
        throw Exception(
            'Erro ao buscar o mapeamento salrial da carreira: ${response
                .body}');
      }
    }
  }
}
