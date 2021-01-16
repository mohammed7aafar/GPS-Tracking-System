class ApiRefrence {

  static const String publicDomain = 'http://gps.mymadinaty.com/';
  static const String publicUrl = 'http://gps.mymadinaty.com/api';

  static const String devices = '/get_devices';

  static String getDevices(String token, String lang) => publicUrl + devices + '?user_api_hash=$token' + '&lang=$lang';
}
