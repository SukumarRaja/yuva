import 'package:chandrans.yuva/app/controller/main.dart';
import 'package:chandrans.yuva/app/themes/colors.dart';
import 'package:chandrans.yuva/screens/main_screen_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              MainController.to.isAnnasThalam = false;
              Get.to(() => MainScreen());
            },
            child: Container(
              alignment: Alignment.center,
              height: Get.height / 4,
              width: Get.width,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.buttonGradient]),
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/yuva.png',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    "Chandran Yuva",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              MainController.to.isAnnasThalam = true;
              Get.to(() => MainScreen());
            },
            child: Container(
              alignment: Alignment.center,
              height: Get.height / 4,
              width: Get.width,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [AppColors.black, AppColors.buttonGradient]),
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/annasthalam.png',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    "Annasthalam",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
