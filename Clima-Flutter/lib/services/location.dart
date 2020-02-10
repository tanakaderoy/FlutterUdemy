import 'package:geolocator/geolocator.dart';

class Location {
  Position position;
  double longitude = 0;
  double latitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return 'Location{ longitude: $longitude, latitude: $latitude}';
  }
}