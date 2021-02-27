// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'],
    title: json['title'] as String,
    hide: json['hide'] as String,
    checked: json['checked'] as String,
    expand: json['expand'] as String,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hide': instance.hide,
      'checked': instance.checked,
      'expand': instance.expand,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    id: json['id'] as int,
    alarm: json['alarm'] as int,
    name: json['name'] as String,
    online: json['online'] as String,
    time: json['time'] as String,
    timestamp: json['timestamp'] as int,
    acktimestamp: json['acktimestamp'] as int,
    lat: (json['lat'] as num)?.toDouble(),
    lng: (json['lng'] as num)?.toDouble(),
    course: json['course'] as int,
    speed: json['speed'] as int,
    altitude: json['altitude'] as int,
    iconType: json['iconType'] as String,
    iconColor: json['iconColor'] as String,
    iconColors: json['iconColors'] == null
        ? null
        : IconColors.fromJson(json['iconColors'] as Map<String, dynamic>),
    icon: json['icon'] == null
        ? null
        : Icon.fromJson(json['icon'] as Map<String, dynamic>),
    power: json['power'] as String,
    address: json['address'] as String,
    protocol: json['protocol'] as String,
    driver: json['driver'] as String,
    driverData: json['driverData'] == null
        ? null
        : DriverData.fromJson(json['driverData'] as Map<String, dynamic>),
    sensors: (json['sensors'] as List)
        ?.map((e) =>
            e == null ? null : Sensor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    services: json['services'] as List,
    tail: (json['tail'] as List)
        ?.map(
            (e) => e == null ? null : Tail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    distanceUnitHour: json['distanceUnitHour'] as String,
    unitOfDistance: json['unitOfDistance'] as String,
    unitOfAltitude: json['unitOfAltitude'] as String,
    unitOfCapacity: json['unitOfCapacity'] as String,
    stopDuration: json['stopDuration'] as String,
    movedTimestamp: json['movedTimestamp'] as int,
    engineStatus: json['engineStatus'] as bool,
    detectEngine: json['detectEngine'] as String,
    engineHours: json['engineHours'] as String,
    totalDistance: (json['totalDistance'] as num)?.toDouble(),
    deviceData: json['device_data'] == null
        ? null
        : DeviceData.fromJson(json['device_data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'alarm': instance.alarm,
      'name': instance.name,
      'online': instance.online,
      'time': instance.time,
      'timestamp': instance.timestamp,
      'acktimestamp': instance.acktimestamp,
      'lat': instance.lat,
      'lng': instance.lng,
      'course': instance.course,
      'speed': instance.speed,
      'altitude': instance.altitude,
      'iconType': instance.iconType,
      'iconColor': instance.iconColor,
      'iconColors': instance.iconColors,
      'icon': instance.icon,
      'power': instance.power,
      'address': instance.address,
      'protocol': instance.protocol,
      'driver': instance.driver,
      'driverData': instance.driverData,
      'sensors': instance.sensors,
      'services': instance.services,
      'tail': instance.tail,
      'distanceUnitHour': instance.distanceUnitHour,
      'unitOfDistance': instance.unitOfDistance,
      'unitOfAltitude': instance.unitOfAltitude,
      'unitOfCapacity': instance.unitOfCapacity,
      'stopDuration': instance.stopDuration,
      'movedTimestamp': instance.movedTimestamp,
      'engineStatus': instance.engineStatus,
      'detectEngine': instance.detectEngine,
      'engineHours': instance.engineHours,
      'totalDistance': instance.totalDistance,
      'deviceData': instance.deviceData,
    };

IconColors _$IconColorsFromJson(Map<String, dynamic> json) {
  return IconColors(
    moving: json['moving'] as String,
    stopped: json['stopped'] as String,
    offline: json['offline'] as String,
    engine: json['engine'] as String,
  );
}

Map<String, dynamic> _$IconColorsToJson(IconColors instance) =>
    <String, dynamic>{
      'moving': instance.moving,
      'stopped': instance.stopped,
      'offline': instance.offline,
      'engine': instance.engine,
    };

Icon _$IconFromJson(Map<String, dynamic> json) {
  return Icon(
    id: json['id'] as int,
    userId: json['userId'],
    type: json['type'] as String,
    order: json['order'] as int,
    width: json['width'] as int,
    height: json['height'] as int,
    path: json['path'] as String,
    byStatus: json['byStatus'] as String,
  );
}

Map<String, dynamic> _$IconToJson(Icon instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'order': instance.order,
      'width': instance.width,
      'height': instance.height,
      'path': instance.path,
      'byStatus': instance.byStatus,
    };

DriverData _$DriverDataFromJson(Map<String, dynamic> json) {
  return DriverData(
    id: json['id'],
    userId: json['userId'],
    deviceId: json['deviceId'],
    name: json['name'],
    rfid: json['rfid'],
    phone: json['phone'],
    email: json['email'],
    description: json['description'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
  );
}

Map<String, dynamic> _$DriverDataToJson(DriverData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'rfid': instance.rfid,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Sensor _$SensorFromJson(Map<String, dynamic> json) {
  return Sensor(
    id: json['id'],
    type: json['type'] as String,
    name: json['name'] as String,
    showInPopup: json['showInPopup'] as String,
    value: json['value'] as String,
    val: json['val'],
    scaleValue: json['scaleValue'] as int,
  );
}

Map<String, dynamic> _$SensorToJson(Sensor instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'showInPopup': instance.showInPopup,
      'value': instance.value,
      'val': instance.val,
      'scaleValue': instance.scaleValue,
    };

Tail _$TailFromJson(Map<String, dynamic> json) {
  return Tail(
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$TailToJson(Tail instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) {
  return DeviceData(
    id: json['id'] as int,
    hide: json['hide'] as String,
    checked: json['checked'] as String,
    userId: json['userId'] as int,
    currentDriverId: json['currentDriverId'],
    timezoneId: json['timezoneId'],
    traccarDeviceId: json['traccarDeviceId'] as int,
    iconId: json['iconId'] as int,
    iconColors: json['iconColors'] == null
        ? null
        : IconColors.fromJson(json['iconColors'] as Map<String, dynamic>),
    active: json['active'] as int,
    deleted: json['deleted'] as int,
    name: json['name'] as String,
    imei: json['imei'] as String,
    fuelMeasurementId: json['fuelMeasurementId'] as int,
    fuelQuantity: json['fuelQuantity'] as String,
    fuelPrice: json['fuelPrice'] as String,
    fuelPerKm: json['fuelPerKm'] as String,
    simNumber: json['simNumber'] as String,
    deviceModel: json['deviceModel'] as String,
    plateNumber: json['plateNumber'] as String,
    vin: json['vin'] as String,
    registrationNumber: json['registrationNumber'] as String,
    objectOwner: json['objectOwner'] as String,
    additionalNotes: json['additionalNotes'] as String,
    expirationDate: json['expirationDate'],
    simExpirationDate: json['simExpirationDate'] as String,
    simActivationDate: json['simActivationDate'] as String,
    installationDate: json['installationDate'] as String,
    tailColor: json['tailColor'] as String,
    tailLength: json['tailLength'] as int,
    engineHours: json['engineHours'] as String,
    detectEngine: json['detectEngine'] as String,
    minMovingSpeed: json['minMovingSpeed'] as int,
    minFuelFillings: json['minFuelFillings'] as int,
    minFuelThefts: json['minFuelThefts'] as int,
    snapToRoad: json['snapToRoad'] as int,
    gprsTemplatesOnly: json['gprsTemplatesOnly'] as int,
    validByAvgSpeed: json['validByAvgSpeed'] as String,
    parameters: json['parameters'] as String,
    currents: json['currents'],
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    forward: json['forward'],
    stopDuration: json['stopDuration'] as String,
    pivot: json['pivot'] == null
        ? null
        : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    traccar: json['traccar'] == null
        ? null
        : Traccar.fromJson(json['traccar'] as Map<String, dynamic>),
    icon: json['icon'] == null
        ? null
        : Icon.fromJson(json['icon'] as Map<String, dynamic>),
    sensors: (json['sensors'] as List)
        ?.map((e) =>
            e == null ? null : Sensors.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    services: json['services'] as List,
    driver: json['driver'],
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : Users.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastValidLatitude: (json['lastValidLatitude'] as num)?.toDouble(),
    lastValidLongitude: (json['lastValidLongitude'] as num)?.toDouble(),
    latestPositions: json['latestPositions'] as String,
    iconType: json['iconType'] as String,
    groupId: json['groupId'] as int,
    userTimezoneId: json['userTimezoneId'],
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    course: json['course'] as int,
    speed: json['speed'] as int,
  );
}

Map<String, dynamic> _$DeviceDataToJson(DeviceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hide': instance.hide,
      'checked': instance.checked,
      'userId': instance.userId,
      'currentDriverId': instance.currentDriverId,
      'timezoneId': instance.timezoneId,
      'traccarDeviceId': instance.traccarDeviceId,
      'iconId': instance.iconId,
      'iconColors': instance.iconColors,
      'active': instance.active,
      'deleted': instance.deleted,
      'name': instance.name,
      'imei': instance.imei,
      'fuelMeasurementId': instance.fuelMeasurementId,
      'fuelQuantity': instance.fuelQuantity,
      'fuelPrice': instance.fuelPrice,
      'fuelPerKm': instance.fuelPerKm,
      'simNumber': instance.simNumber,
      'deviceModel': instance.deviceModel,
      'plateNumber': instance.plateNumber,
      'vin': instance.vin,
      'registrationNumber': instance.registrationNumber,
      'objectOwner': instance.objectOwner,
      'additionalNotes': instance.additionalNotes,
      'expirationDate': instance.expirationDate,
      'simExpirationDate': instance.simExpirationDate,
      'simActivationDate': instance.simActivationDate,
      'installationDate': instance.installationDate,
      'tailColor': instance.tailColor,
      'tailLength': instance.tailLength,
      'engineHours': instance.engineHours,
      'detectEngine': instance.detectEngine,
      'minMovingSpeed': instance.minMovingSpeed,
      'minFuelFillings': instance.minFuelFillings,
      'minFuelThefts': instance.minFuelThefts,
      'snapToRoad': instance.snapToRoad,
      'gprsTemplatesOnly': instance.gprsTemplatesOnly,
      'validByAvgSpeed': instance.validByAvgSpeed,
      'parameters': instance.parameters,
      'currents': instance.currents,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'forward': instance.forward,
      'stopDuration': instance.stopDuration,
      'pivot': instance.pivot,
      'traccar': instance.traccar,
      'icon': instance.icon,
      'sensors': instance.sensors,
      'services': instance.services,
      'driver': instance.driver,
      'users': instance.users,
      'lastValidLatitude': instance.lastValidLatitude,
      'lastValidLongitude': instance.lastValidLongitude,
      'latestPositions': instance.latestPositions,
      'iconType': instance.iconType,
      'groupId': instance.groupId,
      'userTimezoneId': instance.userTimezoneId,
      'time': instance.time?.toIso8601String(),
      'course': instance.course,
      'speed': instance.speed,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return Pivot(
    userId: json['userId'] as int,
    deviceId: json['deviceId'] as int,
    groupId: json['groupId'] as int,
    currentDriverId: json['currentDriverId'],
    active: json['active'] as int,
    timezoneId: json['timezoneId'],
  );
}

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'groupId': instance.groupId,
      'currentDriverId': instance.currentDriverId,
      'active': instance.active,
      'timezoneId': instance.timezoneId,
    };

Traccar _$TraccarFromJson(Map<String, dynamic> json) {
  return Traccar(
    id: json['id'] as String,
    name: json['name'] as String,
    uniqueId: json['uniqueId'] as String,
    latestPositionId: json['latestPositionId'] as String,
    lastValidLatitude: json['lastValidLatitude'] as String,
    lastValidLongitude: json['lastValidLongitude'] as String,
    other: json['other'] as String,
    speed: json['speed'] as String,
    time: json['time'] as String,
    deviceTime: json['deviceTime'] as String,
    serverTime: json['serverTime'] as String,
    ackTime: json['ackTime'] as String,
    altitude: json['altitude'] as String,
    course: json['course'] as String,
    power: json['power'],
    address: json['address'],
    protocol: json['protocol'] as String,
    latestPositions: json['latestPositions'] as String,
    movedAt: json['movedAt'] as String,
    stopedAt: json['stopedAt'] as String,
    engineOnAt: json['engineOnAt'] as String,
    engineOffAt: json['engineOffAt'] as String,
  );
}

Map<String, dynamic> _$TraccarToJson(Traccar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uniqueId': instance.uniqueId,
      'latestPositionId': instance.latestPositionId,
      'lastValidLatitude': instance.lastValidLatitude,
      'lastValidLongitude': instance.lastValidLongitude,
      'other': instance.other,
      'speed': instance.speed,
      'time': instance.time,
      'deviceTime': instance.deviceTime,
      'serverTime': instance.serverTime,
      'ackTime': instance.ackTime,
      'altitude': instance.altitude,
      'course': instance.course,
      'power': instance.power,
      'address': instance.address,
      'protocol': instance.protocol,
      'latestPositions': instance.latestPositions,
      'movedAt': instance.movedAt,
      'stopedAt': instance.stopedAt,
      'engineOnAt': instance.engineOnAt,
      'engineOffAt': instance.engineOffAt,
    };

Sensors _$SensorsFromJson(Map<String, dynamic> json) {
  return Sensors(
    id: json['id'],
    userId: json['userId'] as String,
    deviceId: json['deviceId'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    tagName: json['tagName'] as String,
    addToHistory: json['addToHistory'] as String,
    onValue: json['onValue'] as String,
    offValue: json['offValue'] as String,
    shownValueBy: json['shownValueBy'] as String,
    fuelTankName: json['fuelTankName'],
    fullTank: json['fullTank'],
    fullTankValue: json['fullTankValue'],
    minValue: json['minValue'] as String,
    maxValue: json['maxValue'] as String,
    formula: json['formula'],
    odometerValueBy: json['odometerValueBy'],
    odometerValue: json['odometerValue'],
    odometerValueUnit: json['odometerValueUnit'] as String,
    temperatureMax: json['temperatureMax'],
    temperatureMaxValue: json['temperatureMaxValue'],
    temperatureMin: json['temperatureMin'],
    temperatureMinValue: json['temperatureMinValue'],
    value: json['value'] as String,
    valueFormula: json['valueFormula'] as String,
    showInPopup: json['showInPopup'] as String,
    unitOfMeasurement: json['unitOfMeasurement'] as String,
    onTagValue: json['onTagValue'] as String,
    offTagValue: json['offTagValue'] as String,
    onType: json['onType'] as String,
    offType: json['offType'] as String,
    calibrations: json['calibrations'],
    skipCalibration: json['skipCalibration'],
  );
}

Map<String, dynamic> _$SensorsToJson(Sensors instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'type': instance.type,
      'tagName': instance.tagName,
      'addToHistory': instance.addToHistory,
      'onValue': instance.onValue,
      'offValue': instance.offValue,
      'shownValueBy': instance.shownValueBy,
      'fuelTankName': instance.fuelTankName,
      'fullTank': instance.fullTank,
      'fullTankValue': instance.fullTankValue,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'formula': instance.formula,
      'odometerValueBy': instance.odometerValueBy,
      'odometerValue': instance.odometerValue,
      'odometerValueUnit': instance.odometerValueUnit,
      'temperatureMax': instance.temperatureMax,
      'temperatureMaxValue': instance.temperatureMaxValue,
      'temperatureMin': instance.temperatureMin,
      'temperatureMinValue': instance.temperatureMinValue,
      'value': instance.value,
      'valueFormula': instance.valueFormula,
      'showInPopup': instance.showInPopup,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'onTagValue': instance.onTagValue,
      'offTagValue': instance.offTagValue,
      'onType': instance.onType,
      'offType': instance.offType,
      'calibrations': instance.calibrations,
      'skipCalibration': instance.skipCalibration,
    };

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    id: json['id'] as int,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    deviceMainCheckbox: json['deviceMainCheckbox'] as String,
    mainExpand: json['mainExpand'] as String,
    mainHide: json['mainHide'] as String,
    checkedDeviceGroups: json['checkedDeviceGroups'] as String,
    parent: json['parent'] as String,
    active: json['active'] as int,
    groupId: json['groupId'] as int,
    managerId: json['managerId'],
    billingPlanId: json['billingPlanId'],
    mapId: json['mapId'] as int,
    devicesLimit: json['devicesLimit'],
    email: json['email'] as String,
    subscriptionExpiration: json['subscriptionExpiration'] as String,
    logedAt: json['logedAt'] as String,
    apiHashExpire: json['apiHashExpire'],
    availableMaps:
        (json['availableMaps'] as List)?.map((e) => e as String)?.toList(),
    smsGatewayAppDate: json['smsGatewayAppDate'] as String,
    smsGatewayParams: json['smsGatewayParams'] as bool,
    openGeofenceGroups: json['openGeofenceGroups'] as String,
    openDeviceGroups: json['openDeviceGroups'] as String,
    hideDeviceGroups: json['hideDeviceGroups'] as String,
    weekStartDay: json['weekStartDay'] as String,
    topToolbarOpen: json['topToolbarOpen'] as String,
    mapControls: json['mapControls'] == null
        ? null
        : MapControls.fromJson(json['mapControls'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    unitOfAltitude: json['unitOfAltitude'] as String,
    lang: json['lang'] as String,
    unitOfDistance: json['unitOfDistance'] as String,
    unitOfCapacity: json['unitOfCapacity'] as String,
    timezoneId: json['timezoneId'] as int,
    smsGateway: json['smsGateway'] as String,
    smsGatewayUrl: json['smsGatewayUrl'],
    settings: json['settings'] == null
        ? null
        : Settings.fromJson(json['settings'] as Map<String, dynamic>),
    personalPhone: json['personalPhone'] as String,
    country: json['country'],
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'deviceMainCheckbox': instance.deviceMainCheckbox,
      'mainExpand': instance.mainExpand,
      'mainHide': instance.mainHide,
      'checkedDeviceGroups': instance.checkedDeviceGroups,
      'parent': instance.parent,
      'active': instance.active,
      'groupId': instance.groupId,
      'managerId': instance.managerId,
      'billingPlanId': instance.billingPlanId,
      'mapId': instance.mapId,
      'devicesLimit': instance.devicesLimit,
      'email': instance.email,
      'subscriptionExpiration': instance.subscriptionExpiration,
      'logedAt': instance.logedAt,
      'apiHashExpire': instance.apiHashExpire,
      'availableMaps': instance.availableMaps,
      'smsGatewayAppDate': instance.smsGatewayAppDate,
      'smsGatewayParams': instance.smsGatewayParams,
      'openGeofenceGroups': instance.openGeofenceGroups,
      'openDeviceGroups': instance.openDeviceGroups,
      'hideDeviceGroups': instance.hideDeviceGroups,
      'weekStartDay': instance.weekStartDay,
      'topToolbarOpen': instance.topToolbarOpen,
      'mapControls': instance.mapControls,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'unitOfAltitude': instance.unitOfAltitude,
      'lang': instance.lang,
      'unitOfDistance': instance.unitOfDistance,
      'unitOfCapacity': instance.unitOfCapacity,
      'timezoneId': instance.timezoneId,
      'smsGateway': instance.smsGateway,
      'smsGatewayUrl': instance.smsGatewayUrl,
      'settings': instance.settings,
      'personalPhone': instance.personalPhone,
      'country': instance.country,
    };

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    listview: json['listview'] == null
        ? null
        : Listview.fromJson(json['listview'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'listview': instance.listview,
    };

Listview _$ListviewFromJson(Map<String, dynamic> json) {
  return Listview(
    columns: (json['columns'] as List)
        ?.map((e) =>
            e == null ? null : Columns.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    groupby: json['groupby'] as String,
  );
}

Map<String, dynamic> _$ListviewToJson(Listview instance) => <String, dynamic>{
      'columns': instance.columns,
      'groupby': instance.groupby,
    };

Columns _$ColumnsFromJson(Map<String, dynamic> json) {
  return Columns(
    field: json['field'] as String,
    clas: json['clas'] as String,
  );
}

Map<String, dynamic> _$ColumnsToJson(Columns instance) => <String, dynamic>{
      'field': instance.field,
      'clas': instance.clas,
    };
