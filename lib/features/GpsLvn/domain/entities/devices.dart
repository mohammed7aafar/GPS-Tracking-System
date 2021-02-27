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

  final dynamic id;
  final String title;
  final String hide;
  final String checked;
  final String expand;
  final List<Item> items;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
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
    this.complete = false,
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
  final bool complete;
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

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
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

 

  Item copyWith({
    
    int id,
    int alarm,
    String name,
    String online,
    String time,
    int timestamp,
    int acktimestamp,
    double lat,
    double lng,
    int course,
    int speed,
    int altitude,
    String iconType,
    String iconColor,
    IconColors iconColors,
    Icon icon,
    String power,
    String address,
    String protocol,
    String driver,
    DriverData driverData,
    List<Sensor> sensors,
    List<dynamic> services,
    List<Tail> tail,
    String distanceUnitHour,
    String unitOfDistance,
    String unitOfAltitude,
    String unitOfCapacity,
    String stopDuration,
    int movedTimestamp,
    bool engineStatus,
    String detectEngine,
    String engineHours,
    double totalDistance,
    DeviceData deviceData,
    bool complete, 
  }) {
    return Item(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      alarm: alarm ?? this.alarm,
      name: name ?? this.name,
      online: online ?? this.online,
      time: time ?? this.time,
      timestamp: timestamp ?? this.timestamp,
      acktimestamp: acktimestamp ?? this.acktimestamp,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      course: course ?? this.course,
      speed: speed ?? this.speed,
      altitude: altitude ?? this.altitude,
      iconType: iconType ?? this.iconType,
      iconColor: iconColor ?? this.iconColor,
      iconColors: iconColors ?? this.iconColors,
      icon: icon ?? this.icon,
      power: power ?? this.power,
      address: address ?? this.address,
      protocol: protocol ?? this.protocol,
      driver: driver ?? this.driver,
      driverData: driverData ?? this.driverData,
      sensors: sensors ?? this.sensors,
      services: services ?? this.services,
      tail: tail ?? this.tail,
      distanceUnitHour: distanceUnitHour ?? this.distanceUnitHour,
      unitOfDistance: unitOfDistance ?? this.unitOfDistance,
      unitOfAltitude: unitOfAltitude ?? this.unitOfAltitude,
      unitOfCapacity: unitOfCapacity ?? this.unitOfCapacity,
      stopDuration: stopDuration ?? this.stopDuration,
      movedTimestamp: movedTimestamp ?? this.movedTimestamp,
      engineStatus: engineStatus ?? this.engineStatus,
      detectEngine: detectEngine ?? this.detectEngine,
      engineHours: engineHours ?? this.engineHours,
      totalDistance: totalDistance ?? this.totalDistance,
      deviceData: deviceData ?? this.deviceData,
    );
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

  factory IconColors.fromJson(Map<String, dynamic> json) =>
      _$IconColorsFromJson(json);
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

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);
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

  factory DriverData.fromJson(Map<String, dynamic> json) =>
      _$DriverDataFromJson(json);
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

  final dynamic id;
  final String type;
  final String name;
  final String showInPopup;
  final String value;
  final dynamic val;
  final int scaleValue;

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
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

  factory Tail.fromJson(Map<String, dynamic> json) => _$TailFromJson(json);
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

  factory DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);
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



  DeviceData copyWith({
    int id,
    String hide,
    String checked,
    int userId,
    dynamic currentDriverId,
    dynamic timezoneId,
    int traccarDeviceId,
    int iconId,
    IconColors iconColors,
    int active,
    int deleted,
    String name,
    String imei,
    int fuelMeasurementId,
    String fuelQuantity,
    String fuelPrice,
    String fuelPerKm,
    String simNumber,
    String deviceModel,
    String plateNumber,
    String vin,
    String registrationNumber,
    String objectOwner,
    String additionalNotes,
    dynamic expirationDate,
    String simExpirationDate,
    String simActivationDate,
    String installationDate,
    String tailColor,
    int tailLength,
    String engineHours,
    String detectEngine,
    int minMovingSpeed,
    int minFuelFillings,
    int minFuelThefts,
    int snapToRoad,
    int gprsTemplatesOnly,
    String validByAvgSpeed,
    String parameters,
    dynamic currents,
    DateTime createdAt,
    DateTime updatedAt,
    dynamic forward,
    String stopDuration,
    Pivot pivot,
    Traccar traccar,
    Icon icon,
    List<Sensors> sensors,
    List<dynamic> services,
    dynamic driver,
    List<Users> users,
    double lastValidLatitude,
    double lastValidLongitude,
    String latestPositions,
    String iconType,
    int groupId,
    dynamic userTimezoneId,
    DateTime time,
    int course,
    int speed,
  }) {
    return DeviceData(
      id: id ?? this.id,
      hide: hide ?? this.hide,
      checked: checked ?? this.checked,
      userId: userId ?? this.userId,
      currentDriverId: currentDriverId ?? this.currentDriverId,
      timezoneId: timezoneId ?? this.timezoneId,
      traccarDeviceId: traccarDeviceId ?? this.traccarDeviceId,
      iconId: iconId ?? this.iconId,
      iconColors: iconColors ?? this.iconColors,
      active: active ?? this.active,
      deleted: deleted ?? this.deleted,
      name: name ?? this.name,
      imei: imei ?? this.imei,
      fuelMeasurementId: fuelMeasurementId ?? this.fuelMeasurementId,
      fuelQuantity: fuelQuantity ?? this.fuelQuantity,
      fuelPrice: fuelPrice ?? this.fuelPrice,
      fuelPerKm: fuelPerKm ?? this.fuelPerKm,
      simNumber: simNumber ?? this.simNumber,
      deviceModel: deviceModel ?? this.deviceModel,
      plateNumber: plateNumber ?? this.plateNumber,
      vin: vin ?? this.vin,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      objectOwner: objectOwner ?? this.objectOwner,
      additionalNotes: additionalNotes ?? this.additionalNotes,
      expirationDate: expirationDate ?? this.expirationDate,
      simExpirationDate: simExpirationDate ?? this.simExpirationDate,
      simActivationDate: simActivationDate ?? this.simActivationDate,
      installationDate: installationDate ?? this.installationDate,
      tailColor: tailColor ?? this.tailColor,
      tailLength: tailLength ?? this.tailLength,
      engineHours: engineHours ?? this.engineHours,
      detectEngine: detectEngine ?? this.detectEngine,
      minMovingSpeed: minMovingSpeed ?? this.minMovingSpeed,
      minFuelFillings: minFuelFillings ?? this.minFuelFillings,
      minFuelThefts: minFuelThefts ?? this.minFuelThefts,
      snapToRoad: snapToRoad ?? this.snapToRoad,
      gprsTemplatesOnly: gprsTemplatesOnly ?? this.gprsTemplatesOnly,
      validByAvgSpeed: validByAvgSpeed ?? this.validByAvgSpeed,
      parameters: parameters ?? this.parameters,
      currents: currents ?? this.currents,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      forward: forward ?? this.forward,
      stopDuration: stopDuration ?? this.stopDuration,
      pivot: pivot ?? this.pivot,
      traccar: traccar ?? this.traccar,
      icon: icon ?? this.icon,
      sensors: sensors ?? this.sensors,
      services: services ?? this.services,
      driver: driver ?? this.driver,
      users: users ?? this.users,
      lastValidLatitude: lastValidLatitude ?? this.lastValidLatitude,
      lastValidLongitude: lastValidLongitude ?? this.lastValidLongitude,
      latestPositions: latestPositions ?? this.latestPositions,
      iconType: iconType ?? this.iconType,
      groupId: groupId ?? this.groupId,
      userTimezoneId: userTimezoneId ?? this.userTimezoneId,
      time: time ?? this.time,
      course: course ?? this.course,
      speed: speed ?? this.speed,
    );
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

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
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

  factory Traccar.fromJson(Map<String, dynamic> json) =>
      _$TraccarFromJson(json);
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
  dynamic id;
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

  factory Sensors.fromJson(Map<String, dynamic> json) =>
      _$SensorsFromJson(json);
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

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
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

  User(
      {this.id,
      this.deviceMainCheckbox,
      this.mainExpand,
      this.mainHide,
      this.checkedDeviceGroups,
      this.parent,
      this.active,
      this.groupId,
      this.managerId,
      this.billingPlanId,
      this.mapId,
      this.devicesLimit,
      this.email,
      this.subscriptionExpiration,
      this.logedAt,
      this.apiHashExpire,
      this.availableMaps,
      this.smsGatewayAppDate,
      this.smsGatewayParams,
      this.openGeofenceGroups,
      this.openDeviceGroups,
      this.hideDeviceGroups,
      this.weekStartDay,
      this.topToolbarOpen,
      this.mapControls,
      this.createdAt,
      this.updatedAt,
      this.unitOfAltitude,
      this.lang,
      this.unitOfDistance,
      this.unitOfCapacity,
      this.timezoneId,
      this.smsGateway,
      this.smsGatewayUrl,
      this.settings,
      this.personalPhone,
      this.country});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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

  MapControls.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

@JsonSerializable()
class Settings extends Equatable {
  Listview listview;

  Settings({this.listview});

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  @override
  List<Object> get props => [listview];
}

@JsonSerializable()
class Listview extends Equatable {
  List<Columns> columns;
  String groupby;

  Listview({this.columns, this.groupby});

  factory Listview.fromJson(Map<String, dynamic> json) =>
      _$ListviewFromJson(json);
  Map<String, dynamic> toJson() => _$ListviewToJson(this);

  @override
  List<Object> get props => [columns, groupby];
}

@JsonSerializable()
class Columns extends Equatable {
  String field;
  String clas;

  Columns({this.field, this.clas});

  factory Columns.fromJson(Map<String, dynamic> json) =>
      _$ColumnsFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnsToJson(this);

  @override
  List<Object> get props => [field, clas];
}
