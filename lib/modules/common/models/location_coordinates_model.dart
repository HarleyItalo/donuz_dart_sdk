class LocationCoordinates {
  final double latitude;
  final double longitude;

  LocationCoordinates({required this.latitude, required this.longitude});

  factory LocationCoordinates.defaultInstance() {
    return LocationCoordinates(latitude: -23.5489, longitude: -46.6388);
  }
}
