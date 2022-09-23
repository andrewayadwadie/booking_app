import 'package:booking_app/presentation/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
 

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;

  final transitionDuration =
        const Duration(seconds: Constants.splashAnimationDelay);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: Constants.splashDelay),
    );

    Future.delayed(const Duration(seconds: Constants.splashDelay))
        .then((value0) => setState(() => expanded = true))
        .then((value1) => const Duration(seconds: Constants.splashDelay))
        .then(
          (value2) =>
              Future.delayed(const Duration(seconds: Constants.splashDelay))
                  .then(
            (value3) => _lottieAnimation.forward().then(
              (value4) {
                Get.offAll(const LoginScreen());
              },
            ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        color: ColorManager.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: Image.asset(
                ImageAssets.logo,
                width: 150,
                height: 150,
              ),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}
