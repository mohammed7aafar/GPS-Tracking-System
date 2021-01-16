import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices.g.dart';

class Devices extends Equatable {
  Devices({
    this.groups,
    this.user,
    this.status,
  });

  final List<Group> groups;
  final User user;
  final int status;

 

  @override
  List<Object> get props => [groups, user, status];
}

@JsonSerializable()
class Group extends Equatable {
  Group({
    this.id,
    this.title,
    this.hide,
    this.checked,
    this.expand,
    this.items,
  });

  final String id;
  final String title;
  final String hide;
  final String checked;
  final String expand;
  final List<Item> items;

  factory Group.fromJson(Map<String, dynamic> json) =>_$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      title,
      hide,
      checked,
      expand,
      items,
    ];
  }
}

@JsonSerializable()
class Item extends Equatable {
  Item({
    this.id,
    this.alarm,
    this.name,
    this.online,
    this.time,
    this.timestamp,
    this.acktimestamp,
    this.lat,
    this.lng,
    this.course,
    this.speed,
    this.altitude,
    this.iconType,
    this.iconColor,
    this.iconColors,
    this.icon,
    this.power,
    this.address,
    this.protocol,
    this.driver,
    this.driverData,
    this.sensors,
    this.services,
    this.tail,
    this.distanceUnitHour,
    this.unitOfDistance,
    this.unitOfAltitude,
    this.unitOfCapacity,
    this.stopDuration,
    this.movedTimestamp,
    this.engineStatus,
    this.detectEngine,
    this.engineHours,
    this.totalDistance,
    this.deviceData,
  });

  final int id;
  final int alarm;
  final String name;
  final String online;
  final String time;
  final int timestamp;
  final int acktimestamp;
  final double lat;
  final double lng;
  final int course;
  final int speed;
  final int altitude;
  final String iconType;
  final String iconColor;
  final IconColors iconColors;
  final Icon icon;
  final String power;
  final String address;
  final String protocol;
  final String driver;
  final DriverData driverData;
  final List<Sensor> sensors;
  final List<dynamic> services;
  final List<Tail> tail;
  final String distanceUnitHour;
  final String unitOfDistance;
  final String unitOfAltitude;
  final String unitOfCapacity;
  final String stopDuration;
  final int movedTimestamp;
  final bool engineStatus;
  final String detectEngine;
  final String engineHours;
  final double totalDistance;
  final DeviceData deviceData;

  factory Item.fromJson(Map<String, dynamic> json) =>_$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      alarm,
      name,
      online,
      time,
      timestamp,
      acktimestamp,
      lat,
      lng,
      course,
      speed,
      altitude,
      iconType,
      iconColor,
      iconColors,
      icon,
      power,
      address,
      protocol,
      driver,
      driverData,
      sensors,
      services,
      tail,
      distanceUnitHour,
      unitOfDistance,
      unitOfAltitude,
      unitOfCapacity,
      stopDuration,
      movedTimestamp,
      engineStatus,
      detectEngine,
      engineHours,
      totalDistance,
      deviceData,
    ];
  }
}

@JsonSerializable()
class IconColors extends Equatable {
  IconColors({
    this.moving,
    this.stopped,
    this.offline,
    this.engine,
  });

  final String moving;
  final String stopped;
  final String offline;
  final String engine;

  factory IconColors.fromJson(Map<String, dynamic> json) =>_$IconColorsFromJson(json);
  Map<String, dynamic> toJson() => _$IconColorsToJson(this);

  @override
  List<Object> get props => [moving, stopped, offline, engine];
}

@JsonSerializable()
class Icon extends Equatable {
  Icon({
    this.id,
    this.userId,
    this.type,
    this.order,
    this.width,
    this.height,
    this.path,
    this.byStatus,
  });

  final int id;
  final dynamic userId;
  final String type;
  final int order;
  final int width;
  final int height;
  final String path;
  final String byStatus;

  factory Icon.fromJson(Map<String, dynamic> json) =>_$IconFromJson(json);
  Map<String, dynamic> toJson() => _$IconToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      userId,
      type,
      order,
      width,
      height,
      path,
      byStatus,
    ];
  }
}

@JsonSerializable()
class DriverData extends Equatable {
  DriverData({
    this.id,
    this.userId,
    this.deviceId,
    this.name,
    this.rfid,
    this.phone,
    this.email,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  final dynamic id;
  final dynamic userId;
  final dynamic deviceId;
  final dynamic name;
  final dynamic rfid;
  final dynamic phone;
  final dynamic email;
  final dynamic description;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory DriverData.fromJson(Map<String, dynamic> json) =>_$DriverDataFromJson(json);
  Map<String, dynamic> toJson() => _$DriverDataToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      userId,
      deviceId,
      name,
      rfid,
      phone,
      email,
      description,
      createdAt,
      updatedAt,
    ];
  }
}

@JsonSerializable()
class Sensor extends Equatable {
  Sensor({
    this.id,
    this.type,
    this.name,
    this.showInPopup,
    this.value,
    this.val,
    this.scaleValue,
  });

  final String id;
  final String type;
  final String name;
  final String showInPopup;
  final String value;
  final dynamic val;
  final int scaleValue;

  factory Sensor.fromJson(Map<String, dynamic> json) =>_$SensorFromJson(json);
  Map<String, dynamic> toJson() => _$SensorToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      type,
      name,
      showInPopup,
      value,
      val,
      scaleValue,
    ];
  }
}

@JsonSerializable()
class Tail extends Equatable {
  Tail({
    this.lat,
    this.lng,
  });

  final String lat;
  final String lng;

  factory Tail.fromJson(Map<String, dynamic> json) =>_$TailFromJson(json);
  Map<String, dynamic> toJson() => _$TailToJson(this);

  @override
  List<Object> get props => [lat, lng];
}

@JsonSerializable()
class DeviceData extends Equatable {
  DeviceData({
    this.id,
    this.hide,
    this.checked,
    this.userId,
    this.currentDriverId,
    this.timezoneId,
    this.traccarDeviceId,
    this.iconId,
    this.iconColors,
    this.active,
    this.deleted,
    this.name,
    this.imei,
    this.fuelMeasurementId,
    this.fuelQuantity,
    this.fuelPrice,
    this.fuelPerKm,
    this.simNumber,
    this.deviceModel,
    this.plateNumber,
    this.vin,
    this.registrationNumber,
    this.objectOwner,
    this.additionalNotes,
    this.expirationDate,
    this.simExpirationDate,
    this.simActivationDate,
    this.installationDate,
    this.tailColor,
    this.tailLength,
    this.engineHours,
    this.detectEngine,
    this.minMovingSpeed,
    this.minFuelFillings,
    this.minFuelThefts,
    this.snapToRoad,
    this.gprsTemplatesOnly,
    this.validByAvgSpeed,
    this.parameters,
    this.currents,
    this.createdAt,
    this.updatedAt,
    this.forward,
    this.stopDuration,
    this.pivot,
    this.traccar,
    this.icon,
    this.sensors,
    this.services,
    this.driver,
    this.users,
    this.lastValidLatitude,
    this.lastValidLongitude,
    this.latestPositions,
    this.iconType,
    this.groupId,
    this.userTimezoneId,
    this.time,
    this.course,
    this.speed,
  });

  final int id;
  final String hide;
  final String checked;
  final int userId;
  final dynamic currentDriverId;
  final dynamic timezoneId;
  final int traccarDeviceId;
  final int iconId;
  final IconColors iconColors;
  final int active;
  final int deleted;
  final String name;
  final String imei;
  final int fuelMeasurementId;
  final String fuelQuantity;
  final String fuelPrice;
  final String fuelPerKm;
  final String simNumber;
  final String deviceModel;
  final String plateNumber;
  final String vin;
  final String registrationNumber;
  final String objectOwner;
  final String additionalNotes;
  final dynamic expirationDate;
  final String simExpirationDate;
  final String simActivationDate;
  final String installationDate;
  final String tailColor;
  final int tailLength;
  final String engineHours;
  final String detectEngine;
  final int minMovingSpeed;
  final int minFuelFillings;
  final int minFuelThefts;
  final int snapToRoad;
  final int gprsTemplatesOnly;
  final String validByAvgSpeed;
  final String parameters;
  final dynamic currents;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic forward;
  final String stopDuration;
  final Pivot pivot;
  final Traccar traccar;
  final Icon icon;
  final List<Sensors> sensors;
  final List<dynamic> services;
  final dynamic driver;
  final List<Users> users;
  final double lastValidLatitude;
  final double lastValidLongitude;
  final String latestPositions;
  final String iconType;
  final int groupId;
  final dynamic userTimezoneId;
  final DateTime time;
  final int course;
  final int speed;


  factory DeviceData.fromJson(Map<String, dynamic> json) =>_$DeviceDataFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDataToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      hide,
      checked,
      userId,
      currentDriverId,
      timezoneId,
      traccarDeviceId,
      iconId,
      iconColors,
      active,
      deleted,
      name,
      imei,
      fuelMeasurementId,
      fuelQuantity,
      fuelPrice,
      fuelPerKm,
      simNumber,
      deviceModel,
      plateNumber,
      vin,
      registrationNumber,
      objectOwner,
      additionalNotes,
      expirationDate,
      simExpirationDate,
      simActivationDate,
      installationDate,
      tailColor,
      tailLength,
      engineHours,
      detectEngine,
      minMovingSpeed,
      minFuelFillings,
      minFuelThefts,
      snapToRoad,
      gprsTemplatesOnly,
      validByAvgSpeed,
      parameters,
      currents,
      createdAt,
      updatedAt,
      forward,
      stopDuration,
      pivot,
      traccar,
      icon,
      sensors,
      services,
      driver,
      users,
      lastValidLatitude,
      lastValidLongitude,
      latestPositions,
      iconType,
      groupId,
      userTimezoneId,
      time,
      course,
      speed,
    ];
  }
}

@JsonSerializable()
class Pivot extends Equatable {
  Pivot({
    this.userId,
    this.deviceId,
    this.groupId,
    this.currentDriverId,
    this.active,
    this.timezoneId,
  });

  final int userId;
  final int deviceId;
  final int groupId;
  final dynamic currentDriverId;
  final int active;
  final dynamic timezoneId;

  factory Pivot.fromJson(Map<String, dynamic> json) =>_$PivotFromJson(json);
  Map<String, dynamic> toJson() => _$PivotToJson(this);

  @override
  List<Object> get props {
    return [
      userId,
      deviceId,
      groupId,
      currentDriverId,
      active,
      timezoneId,
    ];
  }
}

@JsonSerializable()
class Traccar extends Equatable {


  String id;
  String name;
  String uniqueId;
  String latestPositionId;
  String lastValidLatitude;
  String lastValidLongitude;
  String other;
  String speed;
  String time;
  String deviceTime;
  String serverTime;
  String ackTime;
  String altitude;
  String course;
  dynamic power;
  dynamic address;
  String protocol;
  String latestPositions;
  String movedAt;
  String stopedAt;
  String engineOnAt;
  String engineOffAt;

    Traccar(
      {this.id,
      this.name,
      this.uniqueId,
      this.latestPositionId,
      this.lastValidLatitude,
      this.lastValidLongitude,
      this.other,
      this.speed,
      this.time,
      this.deviceTime,
      this.serverTime,
      this.ackTime,
      this.altitude,
      this.course,
      this.power,
      this.address,
      this.protocol,
      this.latestPositions,
      this.movedAt,
      this.stopedAt,
      this.engineOnAt,
      this.engineOffAt});


  factory Traccar.fromJson(Map<String, dynamic> json) =>_$TraccarFromJson(json);
  Map<String, dynamic> toJson() => _$TraccarToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      name,
      uniqueId,
      latestPositionId,
      lastValidLatitude,
      lastValidLongitude,
      other,
      speed,
      time,
      deviceTime,
      serverTime,
      ackTime,
      altitude,
      course,
      power,
      address,
      protocol,
      latestPositions,
      movedAt,
      stopedAt,
      engineOnAt,
      engineOffAt,
    ];
  }
}

@JsonSerializable()
class Sensors extends Equatable {
  
  String id;
  String userId;
  String deviceId;
  String name;
  String type;
  String tagName;
  String addToHistory;
  String onValue;
  String offValue;
  String shownValueBy;
  dynamic fuelTankName;
  dynamic fullTank;
  dynamic fullTankValue;
  String minValue;
  String maxValue;
  dynamic formula;
  dynamic odometerValueBy;
  dynamic odometerValue;
  String odometerValueUnit;
  dynamic temperatureMax;
  dynamic temperatureMaxValue;
  dynamic temperatureMin;
  dynamic temperatureMinValue;
  String value;
  String valueFormula;
  String showInPopup;
  String unitOfMeasurement;
  String onTagValue;
  String offTagValue;
  String onType;
  String offType;
  dynamic calibrations;
  dynamic skipCalibration;

  Sensors(
      {this.id,
      this.userId,
      this.deviceId,
      this.name,
      this.type,
      this.tagName,
      this.addToHistory,
      this.onValue,
      this.offValue,
      this.shownValueBy,
      this.fuelTankName,
      this.fullTank,
      this.fullTankValue,
      this.minValue,
      this.maxValue,
      this.formula,
      this.odometerValueBy,
      this.odometerValue,
      this.odometerValueUnit,
      this.temperatureMax,
      this.temperatureMaxValue,
      this.temperatureMin,
      this.temperatureMinValue,
      this.value,
      this.valueFormula,
      this.showInPopup,
      this.unitOfMeasurement,
      this.onTagValue,
      this.offTagValue,
      this.onType,
      this.offType,
      this.calibrations,
      this.skipCalibration});


      factory Sensors.fromJson(Map<String, dynamic> json) =>_$SensorsFromJson(json);
      Map<String, dynamic> toJson() => _$SensorsToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      userId,
      deviceId,
      name,
      type,
      tagName,
      addToHistory,
      onValue,
      offValue,
      shownValueBy,
      fuelTankName,
      fullTank,
      fullTankValue,
      minValue,
      maxValue,
      formula,
      odometerValueBy,
      odometerValue,
      odometerValueUnit,
      temperatureMax,
      temperatureMaxValue,
      temperatureMin,
      temperatureMinValue,
      value,
      valueFormula,
      showInPopup,
      unitOfMeasurement,
      onTagValue,
      offTagValue,
      onType,
      offType,
      calibrations,
      skipCalibration,
    ];
  }
}

@JsonSerializable()
class Users extends Equatable {
  int id;
  String email;

  Users({this.id, this.email});

  factory Users.fromJson(Map<String, dynamic> json) =>_$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object> get props => [id, email];
}

@JsonSerializable()
class User extends Equatable {
	int id;
	String deviceMainCheckbox;
	String mainExpand;
	String mainHide;
	String checkedDeviceGroups;
	String parent;
	int active;
	int groupId;
	dynamic managerId;
	dynamic billingPlanId;
	int mapId;
	dynamic devicesLimit;
	String email;
	String subscriptionExpiration;
	String logedAt;
	dynamic apiHashExpire;
	List<String> availableMaps;
	String smsGatewayAppDate;
	bool smsGatewayParams;
	String openGeofenceGroups;
	String openDeviceGroups;
	String hideDeviceGroups;
	String weekStartDay;
	String topToolbarOpen;
	MapControls mapControls;
	String createdAt;
	String updatedAt;
	String unitOfAltitude;
	String lang;
	String unitOfDistance;
	String unitOfCapacity;
	int timezoneId;
	String smsGateway;
	dynamic smsGatewayUrl;
	Settings settings;
	String personalPhone;
	dynamic country;

	User({this.id, this.deviceMainCheckbox, this.mainExpand, this.mainHide, this.checkedDeviceGroups, this.parent, this.active, this.groupId, this.managerId, this.billingPlanId, this.mapId, this.devicesLimit, this.email, this.subscriptionExpiration, this.logedAt, this.apiHashExpire, this.availableMaps, this.smsGatewayAppDate, this.smsGatewayParams, this.openGeofenceGroups, this.openDeviceGroups, this.hideDeviceGroups, this.weekStartDay, this.topToolbarOpen, this.mapControls, this.createdAt, this.updatedAt, this.unitOfAltitude, this.lang, this.unitOfDistance, this.unitOfCapacity, this.timezoneId, this.smsGateway, this.smsGatewayUrl, this.settings, this.personalPhone, this.country});
  
  factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      deviceMainCheckbox,
      mainExpand,
      mainHide,
      checkedDeviceGroups,
      parent,
      active,
      groupId,
      managerId,
      billingPlanId,
      mapId,
      devicesLimit,
      email,
      subscriptionExpiration,
      logedAt,
      apiHashExpire,
      availableMaps,
      smsGatewayAppDate,
      smsGatewayParams,
      openGeofenceGroups,
      openDeviceGroups,
      hideDeviceGroups,
      weekStartDay,
      topToolbarOpen,
      mapControls,
      createdAt,
      updatedAt,
      unitOfAltitude,
      lang,
      unitOfDistance,
      unitOfCapacity,
      timezoneId,
      smsGateway,
      smsGatewayUrl,
      settings,
      personalPhone,
      country,
    ];
  }
}


class MapControls {


	MapControls();

	MapControls.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
@JsonSerializable()
class Settings extends Equatable {
	Listview listview;

	Settings({this.listview});

  factory Settings.fromJson(Map<String, dynamic> json) =>_$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  @override
  List<Object> get props => [listview];
}

@JsonSerializable()
class Listview extends Equatable {
	List<Columns> columns;
	String groupby;

	Listview({this.columns, this.groupby});
  
  factory Listview.fromJson(Map<String, dynamic> json) =>_$ListviewFromJson(json);
  Map<String, dynamic> toJson() => _$ListviewToJson(this);

  @override
  List<Object> get props => [columns, groupby];
}

@JsonSerializable()
class Columns extends Equatable {
	String field;
	String clas;

	Columns({this.field, this.clas});

  factory Columns.fromJson(Map<String, dynamic> json) =>_$ColumnsFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnsToJson(this);

  @override
  List<Object> get props => [field, clas];
}
