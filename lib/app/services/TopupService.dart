import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:uas_mobile/app/models/topupmodel.dart';

class TopupService {
  var baseurlapi = "http://localhost:3000";
  var dio = Dio();

  Future<List<TopupModel>> fetchFilm() async {
    Response response = await Dio().get('$baseurlapi/data');
    List<TopupModel> ramens =
        (response.data as List).map((v) => TopupModel.fromJSON(v)).toList();
    return ramens;
  }
}
