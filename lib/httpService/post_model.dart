class NearEarthObject {
  final String id;
  final String name;
  final double absoluteMagnitudeH;
  final Map<String, dynamic> estimatedDiameter;
  final bool isPotentiallyHazardousAsteroid;
  final List<dynamic> closeApproachData;
  final Map<String, dynamic> orbitalData;
  final bool isSentryObject;

  NearEarthObject({
    required this.id,
    required this.name,
    required this.absoluteMagnitudeH,
    required this.estimatedDiameter,
    required this.isPotentiallyHazardousAsteroid,
    required this.closeApproachData,
    required this.orbitalData,
    required this.isSentryObject,
  });

  factory NearEarthObject.fromJson(Map<String, dynamic> json) {
    return NearEarthObject(
      id: json['id'],
      name: json['name'],
      absoluteMagnitudeH: json['absolute_magnitude_h'],
      estimatedDiameter: json['estimated_diameter'],
      isPotentiallyHazardousAsteroid: json['is_potentially_hazardous_asteroid'],
      closeApproachData: json['close_approach_data'],
      orbitalData: json['orbital_data'],
      isSentryObject: json['is_sentry_object'],
    );
  }
}
