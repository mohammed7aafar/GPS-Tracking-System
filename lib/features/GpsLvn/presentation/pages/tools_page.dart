import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsLVN/core/utils/size_config.dart';

import '../../../../theme.dart';

class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme2.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Center(
                child: Text(
                  "save",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: AppTheme2.territoryColor,
                        fontSize: SizeConfig.screenWidth / 23,
                      ),
                ),
              ),
            ),
          ],
          title: Text(
            "Setups",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: AppTheme2.primaryColor18,
                  fontSize: SizeConfig.screenWidth / 23,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                              "Font Color",
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
                              "Font Size",
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
                              "Map Center",
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
                  )),

              const SizedBox(
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
                              "Zoom Level",
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
                  )),

              const SizedBox(
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
                              "Theme",
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
                  )),

          
              //SizedBox.expand()
            ]),
          ),
        ));
  }
}
