
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/login_controller.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

 

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email = '';

  String? password = '';

  final _loginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  // Header =======
                  Container(
                    height: 300,
                    decoration:   BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(90)),
                      color: ColorManager.primary,
                      gradient: LinearGradient(
                        colors: [( ColorManager.primary), ColorManager.lightPrimary],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: AppSize.s2, color:  ColorManager.primary),
                              borderRadius: BorderRadius.circular(60)),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: AppSize.s2, color: ColorManager.white),
                                borderRadius: BorderRadius.circular(60)),
                            //margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              ImageAssets.splashLogo,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'login'.tr,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    )),
                  ),
                  Form(
                      key: _loginformKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 40),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor:  ColorManager.primary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: AppSize.s2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:   BorderSide(
                                        width: AppSize.s2, color:  ColorManager.primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  icon:   Icon(
                                    Icons.email,
                                    color:  ColorManager.primary,
                                  ),
                                  labelText: 'E-mail'.tr,
                                  hintText: 'E-mail'.tr,
                                  labelStyle: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)
                                  //enabledBorder: InputBorder.none
                                  ),
                              onSaved: (val) {
                                email = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter e-mail'.tr;
                                } else if (!value.contains("@")) {
                                  return 'Please enter a valid email'.tr;
                                } else {
                                  return null;
                                }
                              }, // enabledBorder: InputBorder.none,
                            ),
                          ),
                          GetBuilder<LoginController>(
                              init: LoginController(),
                              builder: (loginCtrl) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 30),
                                  child: TextFormField(
                                    obscureText: loginCtrl.vis,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor:  ColorManager.primary,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:   BorderSide(
                                              width: AppSize.s2, color:  ColorManager.primary),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        icon:   Icon(
                                          Icons.vpn_key,
                                          color:  ColorManager.primary,
                                        ),
                                        labelText: 'password'.tr,
                                        hintText: 'password'.tr,
                                        labelStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        suffix: GestureDetector(
                                          onTap: () {
                                            loginCtrl.eyetToggle();
                                          },
                                          child: Icon(
                                            loginCtrl.vis== true
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color:  ColorManager.primary,
                                            size: 19,
                                          ),
                                        ) // enab
                                        ),
                                    onSaved: (val) {
                                      password = val;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password'.tr;
                                      } else if (value.length < 8) {
                                        return 'The password must be more than 8 characters'
                                            .tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                );
                              }),

                          //! login button ========
                          GetX<LoginController>(
                              init: LoginController(),
                              builder: (ctrl) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (_loginformKey.currentState!
                                        .validate()) {
                                      _loginformKey.currentState!.save();
                                      ctrl.sendLoginData(
                                          email: email, password: password);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 70),
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    height: 54,
                                    decoration: BoxDecoration(
                                      gradient:   LinearGradient(
                                          colors: [
                                            ( ColorManager.primary),
                                            ColorManager.lightPrimary
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[200],
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 50,
                                            color: Color(0xffEEEEEE)),
                                      ],
                                    ),
                                    child: ctrl.loading.value == true
                                        ?   Text(
                                            'login'.tr,
                                            style:
                                                const TextStyle(color: Colors.white),
                                          )
                                        :   CircularProgressIndicator(
                                            color: ColorManager.white,
                                          ),
                                  ),
                                );
                              }),
                        ],
                      )),
                ],
              ))),
    );
  }
}
