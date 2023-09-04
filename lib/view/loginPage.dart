import 'dart:convert';
import 'package:elektraweb_restaurant/extensions/context_extension.dart';
import 'package:elektraweb_restaurant/view/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Global/global.dart';
import '../service/loginService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userCodeController;
  late TextEditingController userpasswController;
  late TextEditingController userTenantController;
  String loginAnimation = "assets/animation/login_animation.json";
  @override
  void initState() {
    super.initState();
    userCodeController = TextEditingController();
    userpasswController = TextEditingController();
    userTenantController = TextEditingController();
    passwordVisibility$.value = true; //Behavior Subject value
  }

  @override
  void dispose() {
    userCodeController.clear();
    userTenantController.clear();
    userpasswController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: buildTextFields())),
    );
  }

  Padding buildTextFields() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Lottie.asset(loginAnimation, fit: BoxFit.fill),
            height: context.getdynamicHeight(0.5),
            width: context.getdynamicWidth(0.7),
          ),
          SizedBox(
            height: context.getdynamicHeight(0.02),
          ),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 40, fontFamily: "proxima"),
          ),
          TextField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            keyboardType: TextInputType.number,
            controller: userTenantController,
            decoration: InputDecoration(
              labelText: "Hotel Code",
            ),
          ),
          SizedBox(
            height: context.getdynamicHeight(0.02),
          ),
          TextField(
              controller: userCodeController,
              decoration: InputDecoration(labelText: "User Code")),
          SizedBox(
            height: context.getdynamicHeight(0.02),
          ),
          StreamBuilder(
              stream: passwordVisibility$.stream,
              initialData: true,
              builder: (context, snapshot) {
                return TextField(
                    obscureText: snapshot.data!,
                    controller: userpasswController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: snapshot.data!
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            passwordVisibility$.value =
                                !passwordVisibility$.value;
                          },
                        ),
                        labelText: "User Password"));
              }),
          SizedBox(
            height: context.getdynamicHeight(0.04),
          ),
          ElevatedButton(onPressed: buildloginButton, child: Text("Giriş Yap"))
        ],
      ),
    );
  }

  Future buildloginButton({String? AuthCode}) async {
    print("Butona basildi");
    try {
      LoginService.requestLogin(userCodeController.text,
              userpasswController.text, userTenantController.text,
              authCode: AuthCode)
          .then(
        (value) {
          print(" Value is $value");
          Map<String, dynamic> decodedJson = jsonDecode(value.body);
          if (decodedJson["Success"] == true &&
              decodedJson["LoginToken"] != null) {
            loginObject$.value = LoginService.castmodelClassobject(decodedJson);
            print(loginObject$.value);
            print("başarili");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MenuPage()));
                        
          } else {
            print("Olumsuz");
            switch (decodedJson["Code"]) {
              case "0":
                buildAlertDialog(context, "Unsuccessful Login",
                    "Please check your information",
                    isTextFieldVisible: false);
                break;
              case "30":
                buildAlertDialog(
                    context, "2FA Authentication", "Please Enter Your 2FA key");
              case "31":
                buildAlertDialog(context, "Wrong 2FA",
                    "Please check your 2FA and try again");
              case "90":
                buildAlertDialog(context, "Suspicious Login",
                    "Your IP seems suspicious. Please contact with supervisor");
            }

            //TODO: Gereksiz textfield var.
          }
        },
      );
      showDialog(
          context: context,
          builder: (context) {
            return SizedBox(
                height: context.getdynamicHeight(0.3),
                width: context.getdynamicWidth(0.3),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber,
                )));
          });
    } catch (e) {
      print("The error is $e");
    }
  }

  void buildAlertDialog(BuildContext context, String title, String message,
      {bool isTextFieldVisible = true}) {
    final controller = TextEditingController();
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontFamily: "proxima"),
          ),
          content: isTextFieldVisible? TextFormField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
                counterText: "",
                labelText: message,
                labelStyle: TextStyle(fontSize: 15)),
          ): null,
          actions: [
            ElevatedButton(
                onPressed: isTextFieldVisible
                    ? () async {
                        print(
                            "Alert dialog butona basildi"); //TODO: Burasi yapilacak.
                        AuthCode$.value = controller.text;
                        Navigator.of(context).pop();
                        print("Sj");
                        await buildloginButton(AuthCode: AuthCode$.value);
                      }
                    : () {
                        Navigator.of(context).pop();
                        print("Code 0, ALERT Dialog'a basildi");
                      },
                child: Text("Ok"))
          ],
        );
      },
    );
  }
}
