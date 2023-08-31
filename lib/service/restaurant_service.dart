import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

class restaurantService {
  Future getRestaurantList(String usercode,String userpassword,int tenant,
  {String? authCode}) async {
    final url = "https://4001.hoteladvisor.net/";

    try {
      var object = {
                "Action": "Login",
                "Usercode": usercode,
                "Password": userpassword,
                "Tenant": tenant
              };
              if(authCode != null && authCode != ''){
                object["AuthCode"] = authCode;
              }
      final response =
          await http.post(Uri.parse(url), //Client'a istek atıyoruz.
              headers: {
                'content-type': 'application/json',
              }, 
              body: json.encode(object));
      print(response.body); //Dönen verinin body'si
      if (response.statusCode == 200) {
        return response;
      } 
      else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
    
  }
}
