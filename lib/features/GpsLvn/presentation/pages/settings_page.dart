import 'package:flutter/material.dart';
import 'package:gpsLVN/core/utils/size_config.dart';

import '../../../../theme.dart';

class SettingsPage extends StatelessWidget {
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
                    onTap: () {},
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
                              "Unit of Distance",
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
                    onTap: () {},
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
                              "Unit of capacity",
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
                    onTap: () {},
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
                              "Unit of altitude",
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
                    onTap: () {},
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
                              "Default calender week start day",
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
                    onTap: () {},
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
                              "TimeZone",
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
                    onTap: () =>{},
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
                              "Daylight saving time",
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
                    onTap: () {},
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
                              "type",
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
                    onTap: () {},
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
                              "countrey",
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

              Row(
                children: [
                  Expanded(
                    child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme2.primaryColor20,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {},
                          child: Container(
                              height: SizeConfig.screenWidth / 8,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Obx(
                                  //   () =>
                                  Text(
                                    "From",
                                    //loginController.hostServerName.value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize:
                                                SizeConfig.screenWidth / 30,
                                            color: AppTheme2.primaryColor18),
                                  ),
                                  //),
                                  IconButton(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: SizeConfig.screenWidth / 15,
                                        color: AppTheme2.primaryColor18,
                                      ),
                                      onPressed: () {})
                                ],
                              )),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme2.primaryColor20,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {},
                          child: Container(
                              height: SizeConfig.screenWidth / 8,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Obx(
                                  //   () =>
                                  Text(
                                    "To",
                                    //loginController.hostServerName.value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize:
                                                SizeConfig.screenWidth / 30,
                                            color: AppTheme2.primaryColor18),
                                  ),
                                  //),
                                  IconButton(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: SizeConfig.screenWidth / 15,
                                        color: AppTheme2.primaryColor18,
                                      ),
                                      onPressed: () {})
                                ],
                              )),
                        )),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Material(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {},
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
                              "Languages",
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
                height: 40,
              ),

              //SizedBox.expand()
            ]),
          ),
        ));
  }
}
