import 'dart:convert';

import 'package:bikeapp/model/bikemodel.dart';
import 'package:http/http.dart' as http;
class BikeApiService{
  Future<dynamic> sendData(
      String name,
      String model,
      String yearofManu,
      String cc,) async{
    var client = http.Client();
    var apiUrl = Uri.parse("http://192.168.228.9:3001/api/bike/addbike");
    var response = await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {
          "name": name,
          "model": model,
          "yearofManu":yearofManu,
          "cc":cc,
        }
        )
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }

  Future<List<Bike>> getData() async{
    var client=http.Client();
    var ApiUrl=Uri.parse("http://192.168.228.9:3001/api/bike/viewbike");
    var response =await client.get(ApiUrl);

    if(response.statusCode==200)
    {
      return bikeFromJson(response.body);
    }
    else
    {
      return [];
    }

  }

}
