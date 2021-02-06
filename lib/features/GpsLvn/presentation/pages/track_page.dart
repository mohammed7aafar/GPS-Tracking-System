import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';
import '../../../../theme.dart';
import '../blocs/devices/devices_bloc.dart';
import '../blocs/showTrack/showtrack_cubit.dart';
import '../widgets/home/loading.dart';

class TrackPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme2.primaryColor,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: SizeConfig.screenHeight * 2,
        child: Column(
          children: [
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
            const SizedBox(
              height: 12,
            ),
            Material(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor20,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () => buildUnitsBottomSheet(context),
                  child: Container(
                      height: SizeConfig.screenWidth / 8,
                      padding: const EdgeInsets.all(15),
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
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: SizeConfig.screenWidth / 30,
                                    color: AppTheme2.primaryColor18),
                          ),
                          IconButton(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: SizeConfig.screenWidth / 15,
                              color: AppTheme2.primaryColor18,
                            ),
                            onPressed: () => buildUnitsBottomSheet(context),
                          ),
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
                        onTap: () => buildFromShowBottomSheet(context),
              
                        child: Container(
                            height: SizeConfig.screenWidth / 8,
                            padding: const EdgeInsets.all(15),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: SizeConfig.screenWidth / 15,
                                      color: AppTheme2.primaryColor18,
                                    ),
                                    onPressed: () =>buildFromShowBottomSheet(context),)
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
                        onTap: () => buildFromShowBottomSheet(context),
                        child: Container(
                            height: SizeConfig.screenWidth / 8,
                            padding: const EdgeInsets.all(15),
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
                                    onPressed: () => buildFromShowBottomSheet(context),)
                              ],
                            )),
                      )

                      //   Get.bottomSheet(Container(
                      //       backgroundColor: AppTheme2.primaryColor,
                      //   child:
                      // )
                      ),
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
                  onTap: () => buildFromShowBottomSheet(context),
                  child: Container(
                      height: SizeConfig.screenWidth / 8,
                      padding: const EdgeInsets.all(15),
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
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: SizeConfig.screenWidth / 15,
                                color: AppTheme2.primaryColor18,
                              ),
                              onPressed: () => buildFromShowBottomSheet(context),)
                        ],
                      )),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Material(
                    color: AppTheme2.primaryColor,
                    child: Checkbox(
                      value: true,
                      onChanged: (bool value) {
                        //trackController.rememberMe(value);
                      },
                      activeColor: AppTheme2.territoryColor,
                      checkColor: AppTheme2.primaryColor,
                    ),
                
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Snip To Roud",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: SizeConfig.screenWidth / 30,
                      color: AppTheme2.primaryColor18),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Material(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme2.primaryColor20,
                child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () => context.read<ShowtrackCubit>().showTrack(),
                    child: Container(
                        height: SizeConfig.screenWidth / 7,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Show Track",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: SizeConfig.screenWidth / 25,
                              color: AppTheme2.primaryColor18),
                        )))),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<ShowtrackCubit, bool>(builder: (context, state) {
              if (state)
                return TrackResultWidget();
              else
                return Container();
            })
          ],
        ));
  }

  PersistentBottomSheetController buildFromShowBottomSheet(BuildContext context) {
    return showBottomSheet(
                  context: context,
                  builder: (context) {
                    final theme = Theme.of(context);
                    // Using Wrap makes the bottom sheet height the height of the content.
                    // Otherwise, the height will be half the height of the screen.
                    return Wrap(
                      children: [
                       for(int i=0 ; i<5;i++)
                        ListTile(
                          title: Text('time 1',
                          style:  Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(
                                  fontSize: SizeConfig.screenWidth / 30,
                                  color: AppTheme2.primaryColor18),
                          ),
                           tileColor: AppTheme2.primaryColor20,
                        ),
                      
                      ],
                    );
                  },
                );
  }

  buildUnitsBottomSheet(BuildContext context) {
    showModalBottomSheet(
                        context: context,
                        //barrierColor: Colors.transparent,
                        enableDrag: true,
                        builder: (context) {
                          return BlocProvider<DevicesBloc>.value(
                              value: sl<DevicesBloc>(),
                              child: DropDownUnitsForTrack());
                        });
  }
}

class DropDownUnitsForTrack extends StatelessWidget {
  const DropDownUnitsForTrack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DevicesBloc devicesBloc = BlocProvider.of<DevicesBloc>(context);
    return BlocBuilder<DevicesBloc, DevicesState>(
        // cubit: devicesBloc,
        builder: (context, state) {
      if ((state is DevicesDataLoading) || (state is DevicesInitial)) {
        return Center(child: const CircularProgressIndicator());
      } else if (state is DevicesDataLoaded) {
        return Container(
            color: AppTheme2.primaryColor,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: SizeConfig.screenHeight * 2,
            child: Column(children: [
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
              const SizedBox(
                height: 12,
              ),
            ]));
      } else if (state is DevicesDataError) return Container();
    });
  }
}

class TrackResultWidget extends StatelessWidget {
  const TrackResultWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: AppTheme2.primaryColor,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Obx(
            //() => homeController.saved.isNotEmpty
            //    ?
            InkWell(
              onTap: () => context.read<ShowtrackCubit>().showTrack(),
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: AppTheme2.territoryColor,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
              ),
            ),
            // : Container(),
            // ),
            Text(
              "Results",
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: AppTheme2.primaryColor18,
                    fontSize: SizeConfig.screenWidth / 23,
                  ),
            ),
            // Obx(
            // () => homeController.saved.isNotEmpty
            //    ?
            Text(
              "      ",
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: AppTheme2.territoryColor,
                    fontSize: SizeConfig.screenWidth / 25,
                  ),
            ),
            // : Container(),
            // ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Ionicons.flag_outline,
            color: AppTheme2.primaryColor18,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Ionicons.calendar_outline,
                color: AppTheme2.primaryColor18,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Trip Date",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: AppTheme2.primaryColor18,
                      fontSize: SizeConfig.screenWidth / 25,
                    ),
              ),
            ],
          ),
          trailing: Icon(
            Ionicons.time_outline,
            color: AppTheme2.primaryColor18,
          ),
        ),
        Divider(
          color: AppTheme2.primaryColor18,
          height: 3,
        ),
        for (int i = 0; i < 16; i++) ...[
          Material(
              color: AppTheme2.primaryColor,
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Ionicons.car_outline,
                  color: AppTheme2.primaryColor18,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "12:01:38 AM 2020-05-26",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "15min 33s",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: AppTheme2.primaryColor18,
                          fontSize: SizeConfig.screenWidth / 25,
                        ),
                  ),
                ),
              ))
        ]
      ]),
    );
  }
}
