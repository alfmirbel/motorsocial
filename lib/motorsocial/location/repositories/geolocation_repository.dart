import 'package:location/location.dart';

import '../data_models/location_contract.dart';

abstract class GeolocationRepository {
  Future<SocialPlace?> currentPlace();
}

class GeolocationRepositoryImpl implements GeolocationRepository {
  final Location location;
  const GeolocationRepositoryImpl(this.location);

  @override
  Future<SocialPlace?> currentPlace() async {
    final result = await location.getLocation();
    return SocialPlace(
      id: 'current',
      name: 'Ubicación actual',
      latitude: result.latitude,
      longitude: result.longitude,
    );
  }
}
