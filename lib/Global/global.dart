import 'package:elektraweb_restaurant/models/login/loginResponse.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> loginProcess$ = BehaviorSubject<bool>();
BehaviorSubject<LoginResponse> loginObject$ = BehaviorSubject();
BehaviorSubject<bool> passwordVisibility$ =
    BehaviorSubject(); //Values in LoginPage
BehaviorSubject<String> AuthCode$ = BehaviorSubject<String>();
/*BehaviorSubject<Map> departmantMap$ =
    BehaviorSubject<Map>(); //İstekteki 1. köşeli parantez için
BehaviorSubject<Map> productGroupMap$ = BehaviorSubject();
BehaviorSubject<Map> productMap$ = BehaviorSubject();*/
