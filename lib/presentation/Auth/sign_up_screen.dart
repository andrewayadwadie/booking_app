import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/shared_widgets/loader_widget.dart';
import '../../data/controller/sign_up_controller.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  String? email = '';
  String? password = '';
  String? name = '';
  String? phone = '';
  final _signUpformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  //! Header =======
                  Container(
                    height: SizeConfig.screenHeight! / MediaSize.m3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(BorderRadiusValues.br90)),
                      color: ColorManager.primary,
                      gradient: LinearGradient(
                        colors: [
                          (ColorManager.primary),
                          ColorManager.lightPrimary
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: AppSize.s55,
                          child: Image.asset(
                            ImageAssets.logo,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: AppMargin.m20,
                            top: AppMargin.m20,
                          ),
                          alignment: Alignment.bottomRight,
                          child: Text(AppStrings.signUp,
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s20)),
                        ),
                      ],
                    )),
                  ),
                  Form(
                      key: _signUpformKey,
                      child: Column(
                        children: [
                          //! Name
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p32,
                                right: AppPadding.p32,
                                top: AppPadding.p32),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.primary),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  icon: Icon(
                                    Icons.person,
                                    color: ColorManager.primary,
                                  ),
                                  labelText: AppStrings.userNmae,
                                  hintText: AppStrings.userNmae,
                                  labelStyle: getBoldStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s16)),
                              onSaved: (val) {
                                name = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.emptyNameValidation;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          //! Phone
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p32,
                                right: AppPadding.p32,
                                top: AppPadding.p32),
                            child: TextFormField(
                              maxLength: 11,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.primary),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  icon: Icon(
                                    Icons.person,
                                    color: ColorManager.primary,
                                  ),
                                  labelText: AppStrings.userPhone,
                                  hintText: AppStrings.userPhone,
                                  labelStyle: getBoldStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s16)),
                              onSaved: (val) {
                                phone = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.emptyPhoneValidation;
                                } else if (!value.isPhoneNumber) {
                                  return AppStrings.notValidPhoneValidation;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          //! email
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p32,
                                right: AppPadding.p32,
                                top: AppPadding.p32),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: AppSize.s2,
                                        color: ColorManager.primary),
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10),
                                  ),
                                  icon: Icon(
                                    Icons.email,
                                    color: ColorManager.primary,
                                  ),
                                  labelText: AppStrings.email,
                                  hintText: AppStrings.email,
                                  labelStyle: getBoldStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s16)),
                              onSaved: (val) {
                                email = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.emptyEmailValidation;
                                } else if (!value.contains("@")) {
                                  return AppStrings.notValidEmailValidation;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          //! password
                          GetBuilder<SignupController>(
                              init: SignupController(),
                              builder: (loginCtrl) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p32,
                                      right: AppPadding.p32,
                                      top: AppPadding.p32),
                                  child: TextFormField(
                                    obscureText: loginCtrl.vis,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: ColorManager.primary,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: AppSize.s2,
                                              color: ColorManager.grey),
                                          borderRadius: BorderRadius.circular(
                                              BorderRadiusValues.br10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: AppSize.s2,
                                              color: ColorManager.primary),
                                          borderRadius: BorderRadius.circular(
                                              BorderRadiusValues.br10),
                                        ),
                                        icon: Icon(
                                          Icons.vpn_key,
                                          color: ColorManager.primary,
                                        ),
                                        labelText: AppStrings.password,
                                        hintText: AppStrings.password,
                                        labelStyle: getBoldStyle(
                                            color: ColorManager.secondary,
                                            fontSize: FontSize.s16),
                                        suffix: GestureDetector(
                                          onTap: () {
                                            loginCtrl.eyetToggle();
                                          },
                                          child: Icon(
                                            loginCtrl.vis == true
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: ColorManager.primary,
                                            size: AppSize.s16,
                                          ),
                                        ) // enab
                                        ),
                                    onSaved: (val) {
                                      password = val;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppStrings
                                            .emptyPasswordValidation;
                                      } else if (value.length <
                                          AppValues.passwordLength) {
                                        return AppStrings
                                            .passwordLengthValidation;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                );
                              }),
                          //! sign up Button
                          GetX<SignupController>(
                              init: SignupController(),
                              builder: (ctrl) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (_signUpformKey.currentState!
                                        .validate()) {
                                      _signUpformKey.currentState!.save();
                                      ctrl.sendSignUpData(
                                          name: name,
                                          phone: phone,
                                          email: email,
                                          password: password);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        left: AppMargin.m20,
                                        right: AppMargin.m20,
                                        top: AppMargin.m60),
                                    padding: const EdgeInsets.only(
                                        left: AppMargin.m20,
                                        right: AppMargin.m20),
                                    height: SizeConfig.screenHeight! /
                                        MediaSize.m15,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            (ColorManager.primary),
                                            ColorManager.lightPrimary
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(
                                          BorderRadiusValues.br50),
                                    ),
                                    child: ctrl.loading.value == true
                                        ? Text(AppStrings.signUp,
                                            style: getMediumStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s17))
                                        : const LoaderWidget(
                                            height: AppSize.s40,
                                            width: AppSize.s40,
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
