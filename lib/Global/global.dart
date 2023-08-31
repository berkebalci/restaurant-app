import 'package:elektraweb_restaurant/models/loginResponse.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> loginProcess$ = BehaviorSubject<bool>();
BehaviorSubject<LoginResponse> loginObject$ = BehaviorSubject();
BehaviorSubject<bool> passwordVisibility$ =
    BehaviorSubject(); //Values in LoginPage
BehaviorSubject<String> AuthCode$ = BehaviorSubject<String>();

BehaviorSubject<int> selectedIndex$ = BehaviorSubject.seeded(0); //bottomnavBar için index
