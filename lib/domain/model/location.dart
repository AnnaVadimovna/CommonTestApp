class Location {
  final double bearing;
  final DateTime datetime;
  final double distanceFromLast;
  final String gpsStatus;
  final double lat;
  final double lon;
  final double speed;
  final double xAcc;
  final double yAcc;
  final double zAcc;

  Location({
    required this.bearing,
    required this.datetime,
    required this.distanceFromLast,
    required this.gpsStatus,
    required this.lat,
    required this.lon,
    required this.speed,
    required this.xAcc,
    required this.yAcc,
    required this.zAcc,
  });
}
