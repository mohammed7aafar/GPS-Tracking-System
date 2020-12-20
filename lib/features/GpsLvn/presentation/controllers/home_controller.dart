import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpsLVN/theme.dart';
import 'package:ionicons/ionicons.dart';

class HomeModel {
  final String unitName;
  final String image;
  final String location;
  bool isSelected;

  HomeModel(
      {this.isSelected = false, this.unitName, this.image, this.location});
}

class GroupModel {
  String groupName;
  bool isExpanded;

  GroupModel({this.groupName, this.isExpanded});
}

class FilterModel {
  final String title;
  final IconData icon;

  FilterModel({this.title, this.icon});
}

class RowItemModel {
  final String title;
  final Color color;
  final IconData icon;

  RowItemModel({this.title, this.color, this.icon});
}

class HomeList {
  static List<FilterModel> getFilterList() {
    return [
      FilterModel(title: "Name", icon: Ionicons.text_outline),
      FilterModel(title: "Motion state", icon: Ionicons.car_outline),
      FilterModel(title: "Satellite", icon: Ionicons.globe_outline),
      FilterModel(title: "Connection status", icon: Ionicons.wifi_outline),
    ];
  }

  static List<RowItemModel> getRowItems() {
    return [
      RowItemModel(
          color: AppTheme2.territoryColor,
          title: "Filter",
          icon: Ionicons.filter_outline),
      RowItemModel(
          color: AppTheme2.territoryColor,
          title: "Add",
          icon: Ionicons.add_circle_outline),
      RowItemModel(
          color: AppTheme2.territoryColor,
          title: "Group",
          icon: Ionicons.grid_outline),
      RowItemModel(
          color: AppTheme2.errorColor,
          title: "Delete",
          icon: Ionicons.trash_outline),
    ];
  }

  static List<GroupModel> getGroupList() {
    return [
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
      GroupModel(groupName: "Group Name", isExpanded: false),
    ];
  }

  static List<HomeModel> getHomeList() {
    return [
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car2.png", unitName: "Unit Name", location: "Address"),
      HomeModel(
          image: "assets/car3.png", unitName: "Unit Name", location: "Address")
    ];
  }
}

class HomeController extends GetxController {
  var homeList = HomeList.getHomeList().obs;
  final filterList = HomeList.getFilterList();
  final rowItemList = HomeList.getRowItems();
  final groupListItem = HomeList.getGroupList().obs;
  var isGroupOrList = false.obs;
  var isSelected = false.obs;
  Set saved = Set().obs;
  var savedIndex = 0.obs;

 

  selectUnitToAddToView(int index) {

    homeList.value[index].isSelected = !homeList.value[index].isSelected;
    homeList.refresh();
    savedIndex.value = index;
    isUnitSelected(index) ? saved.add(index) : saved.remove(index);
    
  }

 bool isUnitSelected(int index) => homeList.value[index].isSelected == true;

 bool showGroupOrListItems() => isGroupOrList.value = !isGroupOrList.value;
}
