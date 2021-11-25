import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/colors.dart';
import 'package:getx_example/screens/videoInfo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


// column donot have the padding 
// we need container for padding
class TrainigHomeScreen extends StatefulWidget {
  const TrainigHomeScreen({ Key? key }) : super(key: key);

  @override
  _TrainigHomeScreenState createState() => _TrainigHomeScreenState();
}

class _TrainigHomeScreenState extends State<TrainigHomeScreen> {
  
  List info = [];
  bool hasInternet = false;

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json")//load image assests on json bundle
    .then((value){  //take to memory to decode
      setState(() {
        info = json.decode(value); //decode json file will save to list
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
    checkInternetConnection();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                   style: TextStyle(
                     fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700)
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_back_ios,
                      size: 20,
                      color: AppColor.homePageIcons),
                      SizedBox(width: 10),
                      Icon(Icons.calendar_today_outlined,
                      size: 20,
                      color: AppColor.homePageIcons),
                      SizedBox(width: 15),
                      
                       Icon(Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColor.homePageIcons),
              ],
            ),
            SizedBox(height: 30),
            Row(children: [
              Text(
                  "Your Program",
                   style: TextStyle(
                     fontSize: 20,
                      color: AppColor.homePageSubTitle,
                      fontWeight: FontWeight.w700)
                      ),
                      Expanded(child: Container()),
                      Text(
                  "Details",
                   style: TextStyle(
                     fontSize: 20,
                      color: AppColor.homePageDetail,
                      )
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: (){
                          Get.to(() => VideoInfo());
                        },
                        child: Icon(Icons.arrow_forward,
                        color: AppColor.homePageIcons,
                        size: 20,
                        ),
                      )
            ],),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(0.8),
                    AppColor.gradientSecond.withOpacity(0.9)
                  ]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(80)
                ), 
                boxShadow: [
                  BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  color: AppColor.gradientSecond.withOpacity(0.2)
                  )]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall)),
                        SizedBox(height: 5),
                        Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall)),
                        Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall)),
                        SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer, size: 20, color: AppColor.homePageContainerTextSmall),
                                SizedBox(width: 10),
                                Text(
                      "60 min",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.homePageContainerTextSmall)),
                              ],
                            ),
                            Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8)),
                              
                            ]
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60),
                        )
                          ]
                        )
                  
                  ],),
              ),
              ),
          SizedBox(height: 5,),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/card.png"
                        )
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: Offset(8, 10),
                            color: AppColor.gradientSecond.withOpacity(0.3)),
                            
                            BoxShadow(
                            blurRadius: 40,
                            offset: Offset(-1, -5),
                            color: AppColor.gradientSecond.withOpacity(0.3))
                        ]
                      )
                  ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 10, right: 200, bottom: 30),
                decoration: BoxDecoration(
                  //color: Colors.redAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/cook.png"
                        )
                        ),
                      )
              ),
              Container(
                width: double.maxFinite,
                height: 100,
                //color: Colors.redAccent.withOpacity(0.3),
                margin: const EdgeInsets.only(left: 150, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You are doing great",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.homePageDetail)
                        ),
                        SizedBox(height: 10,),
                        RichText(text: TextSpan(
                          text: "Keep it up\n",
                          style: TextStyle(
                            color: AppColor.homePagePlanColor,
                            fontSize: 14),
                            children: [
                              TextSpan(
                                text: "stick to your plan")
                            ]))
                  ],),),

              ]),
          ),
          Row(
            children: [
              Text(
                "Area of focus",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColor.homePageTitle),)
            ],
          ),
          Expanded(child: OverflowBox(//top padding is not taking any effect 
            maxWidth: MediaQuery.of(context).size.width,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: (info.length.toDouble()/2).toInt(),
                itemBuilder: (_, i,) {
                  int a = 2*i; //0,2
                  int b = 2*i + 1; //1,3
                  return Row(
                    children: [
                      Container(
                        height: 170,
                        width: (MediaQuery.of(context).size.width - 90)/2,
                        margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              info[a]['img']  //change image here
                            )
                            ),   
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: AppColor.gradientSecond.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: AppColor.gradientSecond.withOpacity(0.1)
                              )
                            ]                 
                      ),
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[a]["title"],
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.homePageDetail),
                          ),
                        )
                      )),
                      Container(
                        height: 170,
                        width: (MediaQuery.of(context).size.width - 90)/2,
                        margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              info[b]['img']  //change image here
                            )
                            ),   
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: AppColor.gradientSecond.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: AppColor.gradientSecond.withOpacity(0.1)
                              )
                            ]                 
                      ),
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[b]["title"],
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.homePageDetail),
                          ),
                        )
                      )),
                    ]
                  );
                }),
            ),
          ))
          ]
          )
          )
      
    );
  }

  void checkInternetConnection() {
      InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
        this.hasInternet
            ? print('Internet Available')
            : Get.snackbar("Github", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face,
                      size: 30,
                      color: Colors.white,),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        "No Internet Connection. Please close and reopen the app.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ));;
      });
    });
  }
}