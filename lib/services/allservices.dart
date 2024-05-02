import 'dart:convert';

import 'package:covidapplication/utils/url/app_url.dart';

import '../model/CountryListModel.dart';
import '../model/WorldStateModel.dart';
import 'package:http/http.dart'as http;

class AllServices{

/// worldstate data api

  Future<WorldStateModel> worldState ()async{
    final response = await http.get(Uri.parse(AppUrl.worldurl));

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else{
      throw Exception();
    }

  }





List<CountryListModel>countrylist= [];

  /// country data api

  Future<List<CountryListModel>> CountryList ()async{
    final response = await http.get(Uri.parse(AppUrl.countryurl));

    if(response.statusCode==200){
     var data = jsonDecode(response.body);
    for(Map i in data){
      countrylist.add(CountryListModel.fromJson(i));
    }
    return countrylist;
    } else{
      throw Exception('Error');
    }

  }




  

}