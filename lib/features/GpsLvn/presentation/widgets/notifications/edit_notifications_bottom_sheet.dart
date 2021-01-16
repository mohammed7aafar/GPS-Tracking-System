import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../theme.dart';
import '../../controllers/notifications_controller.dart';

class EditNotificationsBottomSheet extends StatelessWidget {
  final NotificationsController notificationsController =
      Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme2.primaryColor,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              height: 5.5,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppTheme2.primaryColor11),
            ),
          )),
          SizedBox(
            height: 10,
          ),

             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             // Obx(
                //() => homeController.saved.isNotEmpty
                //    ? 
                    Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      ),
                   // : Container(),
             // ),
              Text(
                "Edit Notifications",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 23,
                    ),
              ),
             // Obx(
               // () => homeController.saved.isNotEmpty
                //    ?
                     Text(
                        "Save",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: AppTheme2.territoryColor,
                              fontSize: SizeConfig.screenWidth / 25,
                            ),
                      ),
                   // : Container(),
             // ),
            ],
          ),
         
          SizedBox(
            height: 40,
          ),
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: Container(
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
                      hintText: "Notification Name",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => Get.bottomSheet(Container(),
                    backgroundColor: AppTheme2.primaryColor),
                child: Container(
                    height: SizeConfig.screenWidth / 8,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Obx(
                        //   () =>
                        Text(
                          "Units",
                          //loginController.hostServerName.value,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18),
                        ),
                        //),
                        IconButton(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: SizeConfig.screenWidth / 15,
                              color: AppTheme2.primaryColor18,
                            ),
                            onPressed: () {})
                      ],
                    )),
              )),

          SizedBox(
            height: 20,
          ),
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => Get.bottomSheet(Container(),
                    backgroundColor: AppTheme2.primaryColor),
                child: Container(
                    height: SizeConfig.screenWidth / 8,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Obx(
                        //   () =>
                        Text(
                          "Type",
                          //loginController.hostServerName.value,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: SizeConfig.screenWidth / 30,
                              color: AppTheme2.primaryColor18),
                        ),
                        //),
                        IconButton(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: SizeConfig.screenWidth / 15,
                              color: AppTheme2.primaryColor18,
                            ),
                            onPressed: () {})
                      ],
                    )),
              )),

          SizedBox(
            height: 20,
          ),

          EditNotificationsCheckBoxWidget(
            notificationsController: notificationsController,
            name1: "Zone In",
            name2: "Zone Out",
          ),

           Obx(() => notificationsController.isRemembered.value ||
                  notificationsController.isRemembered2.value
              ? SizedBox(
                  height: 20,
                )
              : Container()),

          Obx(() => notificationsController.isRemembered.value ||
                  notificationsController.isRemembered2.value
              ? Material(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => Get.bottomSheet(Container(),
                        backgroundColor: AppTheme2.primaryColor),
                    child: Container(
                        height: SizeConfig.screenWidth / 8,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Obx(
                            //   () =>
                            Text(
                              "Geofences",
                              //loginController.hostServerName.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: SizeConfig.screenWidth / 30,
                                      color: AppTheme2.primaryColor18),
                            ),
                            //),
                            IconButton(
                                padding: EdgeInsets.symmetric(vertical: 0),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: SizeConfig.screenWidth / 15,
                                  color: AppTheme2.primaryColor18,
                                ),
                                onPressed: () {})
                          ],
                        )),
                  ))
              : Container()),

          Obx(() => notificationsController.isRemembered.value ||
                  notificationsController.isRemembered2.value
              ? SizedBox(
                  height: 20,
                )
              : Container()),

          Row(
            children: [
              Obx(
                () => Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: notificationsController.isRemembered3.value,
                    onChanged: (bool value) {
                      notificationsController.rememberMe3(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Schedule",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: SizeConfig.screenWidth / 30,
                    color: AppTheme2.primaryColor18),
              ),
            ],
          ),

         Obx(() => notificationsController.isRemembered3.value 
              ? SizedBox(
                  height: 20,
                )
              : Container()),

          Obx(() => notificationsController.isRemembered3.value
              ? Material(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => Get.bottomSheet(Container(),
                        backgroundColor: AppTheme2.primaryColor),
                    child: Container(
                        height: SizeConfig.screenWidth / 8,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Obx(
                            //   () =>
                            Text(
                              "Configurator",
                              //loginController.hostServerName.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: SizeConfig.screenWidth / 30,
                                      color: AppTheme2.primaryColor18),
                            ),
                            //),
                            IconButton(
                                padding: EdgeInsets.symmetric(vertical: 0),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: SizeConfig.screenWidth / 15,
                                  color: AppTheme2.primaryColor18,
                                ),
                                onPressed: () {})
                          ],
                        )),
                  ))
              : Container()),


                Obx(() => notificationsController.isRemembered3.value 
              ? SizedBox(
                  height: 20,
                )
              : Container()),
           

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Obx(
                      () => Material(
                        color: AppTheme2.primaryColor,
                        child: Checkbox(
                          value: notificationsController.isRemembered4.value,
                          onChanged: (bool value) {
                            notificationsController.rememberMe4(value);
                          },
                          activeColor: AppTheme2.territoryColor,
                          checkColor: AppTheme2.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sound Notification",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Obx(
                      () => Material(
                        color: AppTheme2.primaryColor,
                        child: Checkbox(
                          value: notificationsController.isRemembered5.value,
                          onChanged: (bool value) {
                            notificationsController.rememberMe5(value);
                          },
                          activeColor: AppTheme2.territoryColor,
                          checkColor: AppTheme2.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Push Notification",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                    ),
                  ],
                ),
              ),
            ],
          ),


               Row(
            children: [
              Obx(
                () => Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: notificationsController.isRemembered6.value,
                    onChanged: (bool value) {
                      notificationsController.rememberMe6(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Email Notification",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: SizeConfig.screenWidth / 30,
                    color: AppTheme2.primaryColor18),
              ),
            ],
          ),

                Obx(() => notificationsController.isRemembered6.value 
              ? SizedBox(
                  height: 20,
                )
              : Container()),

          Obx(()=>
          notificationsController.isRemembered6.value?
          Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: Container(
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
                      hintText: "Email",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              )):Container()
              ),

              SizedBox(
                  height: 50,
                )

          //SizedBox.expand()
        ]),
      ),
    );
  }
}

class EditNotificationsCheckBoxWidget extends StatelessWidget {
  const EditNotificationsCheckBoxWidget({
    Key key,
    @required this.notificationsController,
    this.name1,
    this.name2,
  }) : super(key: key);

  final NotificationsController notificationsController;
  final name1;
  final name2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Obx(
                () => Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: notificationsController.isRemembered.value,
                    onChanged: (bool value) {
                      notificationsController.rememberMe(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$name1",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: SizeConfig.screenWidth / 30,
                    color: AppTheme2.primaryColor18),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Obx(
                () => Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: notificationsController.isRemembered2.value,
                    onChanged: (bool value) {
                      notificationsController.rememberMe2(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$name2",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: SizeConfig.screenWidth / 30,
                    color: AppTheme2.primaryColor18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
