import 'package:flutter/material.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../theme.dart';


class EditJobsBottomSheet extends StatelessWidget {
 
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
                "Edit Events",
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

          Container(
            alignment: Alignment.topLeft,
            child: Material(
                color: AppTheme2.primaryColor,
                child: Checkbox(
                  value: true,
                  onChanged: (bool value) {
                    //notificationsController.rememberMe3(value);
                  },
                  activeColor: AppTheme2.territoryColor,
                  checkColor: AppTheme2.primaryColor,
                ),
              ),
            
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
                          "Device Protocol",
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
                      hintText: "Parameters",
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
                          "Equal To(=)",
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
                      hintText: "Parameter Value",
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
                padding: const EdgeInsets.all(12.0),
                height: SizeConfig.screenWidth / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                ),
                child: Text(
                  "%SETFLAG[D1,D2,D3]% - is used to detect single or few characters from parameter value. D1 - starting character. D2 - amount of characters. D3 - value.",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: SizeConfig.screenWidth / 30,
                      color: AppTheme2.primaryColor18),
                )),
          ),

          SizedBox(
            height: 20,
          ),

           Material(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme2.primaryColor20,
              child: Container(
                height: SizeConfig.screenWidth / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme2.primaryColor20,
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: SizeConfig.screenWidth / 30,
                      color: AppTheme2.whiteColor),
                  decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: SizeConfig.screenWidth / 30,
                          color: AppTheme2.primaryColor18),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15)),
                ),
              )),

          //SizedBox.expand()
        ]),
      ),
    );
  }
}

class EditNotificationsCheckBoxWidget extends StatelessWidget {
  const EditNotificationsCheckBoxWidget({
    Key key,
   
    this.name1,
    this.name2,
  }) : super(key: key);


  final name1;
  final name2;

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
                    value:true,
                    onChanged: (bool value) {
                     // notificationsController.rememberMe(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
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
             Material(
                  color: AppTheme2.primaryColor,
                  child: Checkbox(
                    value: true,
                    onChanged: (bool value) {
                      //notificationsController.rememberMe2(value);
                    },
                    activeColor: AppTheme2.territoryColor,
                    checkColor: AppTheme2.primaryColor,
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
