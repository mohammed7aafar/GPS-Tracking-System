import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../theme.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
        body: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                height: SizeConfig.screenWidth / 8,
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: SizeConfig.screenWidth / 30,
                      color: AppTheme2.whiteColor),
                  decoration: InputDecoration(
                      hintText: "UserName",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: SizeConfig.screenWidth / 30,
                            color: AppTheme2.primaryColor18
                          ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: SizeConfig.screenWidth / 8,
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: SizeConfig.screenWidth / 30,
                      color: AppTheme2.whiteColor),
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: SizeConfig.screenWidth / 30,
                            color: AppTheme2.primaryColor18
                          ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: SizeConfig.screenWidth / 8,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                   
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme2.primaryColor20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          loginController.hostServerName.value,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18
                              ),
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.symmetric(vertical: 1),
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: SizeConfig.screenWidth / 15,
                            color: AppTheme2.primaryColor18,
                          ),
                          onPressed: () {
                            buildBottomSheet(context);
                          })
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: loginController.isRemembered.value,
                      
                      onChanged: (bool value) {
                        loginController.rememberMe(value);
                      },
                      activeColor: AppTheme2.territoryColor,
                      checkColor: AppTheme2.primaryColor,


                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Remember me",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: SizeConfig.screenWidth / 7,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme2.primaryColor20,
                  ),
                  child: Text(
                    "Log in",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: SizeConfig.screenWidth / 22,
                        color: AppTheme2.primaryColor18
                        ),
                  )),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text("Forgot Password?",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: SizeConfig.screenWidth / 25,
                          color: AppTheme2.territoryColor,
                        )),
              ),
              Spacer(),
              Container(
                  child: Text("Powered by GPS LVN",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: SizeConfig.screenWidth / 25,
                          color: AppTheme2.primaryColor18
                          )))
            ],
          ),
        ));
  }

  Future buildBottomSheet(BuildContext context) {
    return Get.bottomSheet(
                            Container(
                                height: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppTheme2.primaryColor,
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 40),
                                        child: Center(
                                          child: Container(
                                            width: 40,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:
                                                    AppTheme2.primaryColor11),
                                          ),
                                        )),
                                    Material(
                                        borderOnForeground: true,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: AppTheme2.primaryColor,
                                        child: ListTile(
                                          title: Text("Europe",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  .copyWith(
                                                      fontSize: SizeConfig
                                                              .screenWidth /
                                                          25,
                                                       color: AppTheme2.primaryColor18   
                                                          )),
                                          onTap: () => loginController
                                              .selectTrackingServer("Europe"),
                                        )),
                                    Material(
                                        borderOnForeground: true,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: AppTheme2.primaryColor,
                                        child: ListTile(
                                          title: Text("Asia",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  .copyWith(
                                                    color: AppTheme2.primaryColor18,
                                                      fontSize: SizeConfig
                                                              .screenWidth /
                                                          25)),
                                          onTap: () => loginController
                                              .selectTrackingServer("Asia"),
                                        )),
                                    Material(
                                        borderOnForeground: true,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: AppTheme2.primaryColor,
                                        child: ListTile(
                                          title: Text("USA",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  .copyWith(
                                                    color: AppTheme2.primaryColor18,
                                                      fontSize: SizeConfig
                                                              .screenWidth /
                                                          25)),
                                          onTap: () => loginController
                                              .selectTrackingServer("USA"),
                                        )),
                                    Material(
                                      
                                        borderOnForeground: true,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: AppTheme2.primaryColor,
                                        child: ListTile(
                                            title: Text("Custom",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    .copyWith(
                                                      color: AppTheme2.primaryColor18,
                                                        fontSize: SizeConfig
                                                                .screenWidth /
                                                            25)),
                                            onTap: () =>
                                                buildGetDefaultDialog(
                                                    context))),
                                  ],
                                )),
                          );
  }

  buildGetDefaultDialog(context) {
    return Get.defaultDialog(
      title: "Enter Server",
      content: Container(
        height: SizeConfig.screenWidth / 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme2.primaryColor11,
        ),
        child: TextFormField(
          style: Theme.of(context).textTheme.headline5.copyWith(
              fontSize: SizeConfig.screenWidth / 22,
              color: AppTheme2.whiteColor),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10)),
          cursorColor: AppTheme2.territoryColor,
        ),
      ),
      backgroundColor: AppTheme2.primaryColor,
      titleStyle: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontSize: SizeConfig.screenWidth / 23),
      confirm: Text(
        "OK",
        style: Theme.of(context).textTheme.button.copyWith(
            fontSize: SizeConfig.screenWidth / 23,
            color: AppTheme2.territoryColor),
      ),
    );
  }

  // CupertinoActionSheet buildCupertinoActionSheet(context) {
  //   return CupertinoActionSheet(

  //     cancelButton:  CupertinoActionSheetAction(
  //         onPressed: () {},
  //         child: Text("cancel",
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .headline3
  //                 .copyWith(fontSize: SizeConfig.screenWidth / 20)),
  //       ),
  //     actions: [
  //       CupertinoActionSheetAction(

  //         onPressed: () {},
  //         child: Text("Europe",
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .headline3
  //                 .copyWith(fontSize: SizeConfig.screenWidth / 20)),
  //       ),
  //       CupertinoActionSheetAction(
  //         onPressed: () {},
  //         child: Text("Asia",
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .headline3
  //                 .copyWith(fontSize: SizeConfig.screenWidth / 20)),
  //       ),
  //        CupertinoActionSheetAction(
  //         onPressed: () {},
  //         child: Text("USA",
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .headline3
  //                 .copyWith(fontSize: SizeConfig.screenWidth / 20)),
  //       ),

  //        CupertinoActionSheetAction(
  //         onPressed: () {},
  //         child: Text("Custom",
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .headline3
  //                 .copyWith(fontSize: SizeConfig.screenWidth / 20)),
  //       ),

  //     ],
  //   );
  // }
}
