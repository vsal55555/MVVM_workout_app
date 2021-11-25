import 'package:flutter/material.dart';
import 'package:getx_example/controllers/OnboardingController.dart';

class OnboardingPage extends StatelessWidget {
  final controller = OnboardingController();
  //const OnboardingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
            itemCount: controller.onboardingPage.length,
            itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.onboardingPage[index].imageAsset),
                  SizedBox(height: 32),
                  Text(controller.onboardingPage[index].title, 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(controller.onboardingPage[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
                  )
                ]),
            );
          }),
          Positioned(
            bottom: 20,
            child: Row(
              children: List.generate(controller.onboardingPage.length, (index) => Container(
                margin: const EdgeInsets.all(4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle)))),
          )
          ]
        ),
      ),
    );
  }
}