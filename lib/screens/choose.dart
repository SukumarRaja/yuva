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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(()=>MainScreen());
                },
                child: Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height / 4,
                    width: Get.width,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/yuva.png',
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          "Chandran Yuva",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=>MainScreen());

                },
                child: Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height / 4,
                    width: Get.width,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/yuva.png',
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          "Annaasthalam",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
