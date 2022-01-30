class APIPath {
  static String appointment(String uid, String appointmentId) => '/users/$uid/orders/$appointmentId';
  static String appointments(String uid) => 'users/$uid/orders';
  static String bill(String uid, String billid) => '/users/$uid/bills/$billid';
  static String bills(String uid) => 'users/$uid/bills';
  static String service(String uid, String serviceId) => '/users/$uid/services/$serviceId';
  static String services(String uid) => 'users/$uid/services';
}