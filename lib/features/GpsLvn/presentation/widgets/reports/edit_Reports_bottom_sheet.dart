import 'package:flutter/material.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../theme.dart';
class EditReportsBottomSheetWidget extends StatelessWidget {
  EditReportsBottomSheetWidget({Key key}) : super(key: key);

  
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
                "Edit Reports",
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
                      hintText: "Report Name",
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
                onTap: () => {},
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
                onTap: () => {},
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Obx(
                              //   () =>
                              Text(
                                "Format",
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
              ),
              SizedBox(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Obx(
                              //   () =>
                              Text(
                                "Period",
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
              ),
            ],
          ),
          SizedBox(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              SizedBox(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
          ),

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
                          "GeoFences",
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
                          "Stops",
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
                      hintText: "Speed Limit",
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
              )),

          SizedBox(
            height: 20,
          ),

          EditReportsCheckBoxWidget(),

          EditReportsCheckBoxWidget(),

          SizedBox(
            height: 20,
          ),

          //SizedBox.expand()
        ]),
      ),
    );
  }
}

class EditReportsCheckBoxWidget extends StatelessWidget {
  const EditReportsCheckBoxWidget({
    Key key,
   
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
           Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: true,
                    onChanged: (bool value) {
                     // reportsController.rememberMe(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              
              SizedBox(
                width: 5,
              ),
              Text(
                "Daily",
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
               Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: true,
                    onChanged: (bool value) {
                     // reportsController.rememberMe(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
                  ),
                ),
              
              SizedBox(
                width: 5,
              ),
              Text(
                "Show Address",
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
