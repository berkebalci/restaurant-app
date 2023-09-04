import 'dart:convert';

import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class menuService {
  Future getRestaurantList(
      {String? usercode,
      String? userpassword,
      int? tenant,
      String? authCode}) async {
    final url = "https://4001.hoteladvisor.net/";
    //20854(Hotelid) demo(usercode) 123(userpassword) için istek atıyoruz.
    try {
      var object = {
        "Action": "Execute",
        "Object": "SP_HOTELGUEST_POSDATA",
        "Parameters": {"HOTELID": 23155}
      };

      final response =
          await http.post(Uri.parse(url), //Client'a istek atıyoruz.
              headers: {
                'content-type': 'application/json',
              },
              body: json.encode(object));
      print("response.body: ${response.body}"); //Dönen verinin body'si

      if (response.statusCode == 200) {
        final decodedList = jsonDecode(response.body); //List<dynamic> tipinde
        return decodedList;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  handlerestaurantObject() {
    


  }
}
