import 'package:bikeapp/model/bikemodel.dart';
import 'package:http/http.dart' as http;
class BikeApiService{
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
