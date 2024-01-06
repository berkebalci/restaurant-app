import 'dart:convert';

import 'package:elektraweb_restaurant/Global/global.dart';
import 'package:elektraweb_restaurant/models/model/DepartmantModel.dart';
import 'package:elektraweb_restaurant/models/model/productGroupModel.dart';
import 'package:elektraweb_restaurant/models/model/productModel.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class menuService {
  Future getRestaurantList(
      {String? usercode,
      String? userpassword,
      int? tenant,
      String? authCode}) async {
    //endpoint private
    
    try {
      var object = {
       //parameters private
      };

      final response =
          await http.post(Uri.parse(url), //Client'a istek atıyoruz.
              headers: {
                'content-type': 'application/json',
              },
              body: json.encode(object));
      print("response.body: ${response.body}"); //Dönen verinin body'si

      if (response.statusCode == 200) {
        final decodedList = jsonDecode(utf8.decode(response.bodyBytes));
        //Bununla birlikte türkçe karakterler de bozulmadan gelebiecek

        return decodedList;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  void handledepartmentObject(List decodedBody) {
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

    for (var department in departments) {
      index = 0;

      department.productgroupmodelList.addAll(productGroup

          /* productGroup.where((element) {
        if (index < productGroup.length) {
          if (element.id != previousid && index != productGroup.length - 1) {
            previousid = element.id;
            index++;
            return true; //TODO: Daha farklı durumlar için 
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
      })*/
          );
    }

    for (var x in productGroup) {
      print("x is : $x");
      x.productmodelList
          .addAll(products.where((element) => element.productGroupId == x.id));
    }

    mainDepartmantmodelList$.value =
        departments; //BehaviorSubject objesine değer atadığımız yer.
    print(mainDepartmantmodelList$.value.runtimeType);
  
  }

  List getproductList(
    String productgroupName,
  ) {
    var selectedDatas =
        mainDepartmantmodelList$.value[0].productgroupmodelList.where(
      (element) {
        if (element.name == productgroupName) {
          return true;
        } else {
          return false;
        }
      },
    ).toList();
    print(
        "Selected Datas: $selectedDatas ,,,,,,,,, runtimetype: ${selectedDatas.runtimeType}");

    return selectedDatas[0].productmodelList;
  }
}
