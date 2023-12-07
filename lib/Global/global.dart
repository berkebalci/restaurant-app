import 'package:elektraweb_restaurant/models/login/loginResponse.dart';
import 'package:elektraweb_restaurant/models/model/DepartmantModel.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> loginProcess$ = BehaviorSubject<bool>();
BehaviorSubject<LoginResponse> loginObject$ = BehaviorSubject();
BehaviorSubject<bool> passwordVisibility$ =
    BehaviorSubject(); //Values in LoginPage
BehaviorSubject<String> AuthCode$ = BehaviorSubject<String>();
BehaviorSubject<List<DepartmantModel>> mainDepartmantmodelList$ = BehaviorSubject();
