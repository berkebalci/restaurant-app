import 'dart:convert';

import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:elektraweb_restaurant/models/menu/DepartmantModel.dart';
import 'package:elektraweb_restaurant/models/menu/productGroupModel.dart';
import 'package:elektraweb_restaurant/models/menu/productModel.dart';
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

  void handlerestaurantObject(List decodedBody) {
    //print("Konntrol ;))))) ${decodedBody[0][0]["DEPARTMENTNAME"]}"); //Restaurant dönüyor
    //Eğer map'de öyle bir şey yok ise null döndürüyor.
    print("Gelen cevap's length is : ${decodedBody.length}");

    int index;

    int previousid = 0;

    List<DepartmantModel> departments = (decodedBody[0] as List)
        .map((e) => DepartmantModel.fromJson(e))
        .toList();

    List<ProductGroupModel> productGroup = (decodedBody[1] as List)
        .map((e) => ProductGroupModel.fromJson(e))
        .toList();

    List<ProductModel> products =
        (decodedBody[2] as List).map((e) => ProductModel.fromJson(e)).toList();

    for (var x in departments) {
      index = 0;

      x.productgroupmodelList.addAll(
       productGroup
       
       /* productGroup.where((element) {
        if (index < productGroup.length) {
          if (element.id != previousid && index != productGroup.length - 1) {
            previousid = element.id;
            index++;
            return true; //TODO: Burasi yapilacak.
          } 
          else if (element.id != previousid && index == productGroup.length - 1) {
            return true;
          }
          else if(element.id == previousid && index != productGroup.length - 1){

          }
        } 
        else {
          return false;
        }
      })*/); //TODO: Sorun buradan kaynaklanıyor.
    }

    for (var x in productGroup) {
      print("x is : $x");
      x.productmodelList
          .addAll(products.where((element) => element.productGroupId == x.id));
    }

    mainDepartmantmodelList$.value =
        departments; //BehaviorSubject objesine değer atadığımız yer.
  }

  handlemodelClassList() {}
}
