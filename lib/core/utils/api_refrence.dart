class ApiRefrence {

  static const String publicDomain = 'http://gps.mymadinaty.com/';
  static const String publicUrl = 'http://gps.mymadinaty.com/api';

  static const String devices = '/get_devices_n';
  static const String user  = '/login';

  static String getDevices(String token, String lang) => publicUrl + devices + '?user_api_hash=$token' + '&lang=$lang';
  static String getUser(String username , String password) => publicUrl + user;
}
