import 'dart:convert';

import 'package:general_informative_app/services/utils/app_url.dart';
import 'package:http/http.dart'as http;
class WorldStateServices{
  Future<List<dynamic>> worldRecords()async{
    var data;
    final response= await http.get(Uri.parse(MyAppUrl.myUrl));
    if(response.statusCode==200){
      data =jsonDecode(response.body.toString());
      return data;
    }else{
      throw Exception('error');
    }
  }
}