import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../models/login/loginResponse.dart';

class LoginService {
  static Future<Response> requestLogin(
      String usercode, String userpassword, String tenant,{String? authCode}) async {
    //endpoint private
    try {
      var object = {
                //parameters private
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

  static LoginResponse castmodelClassobject(Map<String, dynamic> decoded) {
    return LoginResponse.fromJson(decoded);
  }
}
