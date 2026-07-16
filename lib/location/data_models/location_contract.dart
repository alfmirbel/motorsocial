class LocationContract {
  final bool enableGeolocation;
  final bool enablePostalCode;
  final int defaultLocalityLimit;

  const LocationContract({
    this.enableGeolocation = true,
    this.enablePostalCode = true,
    this.defaultLocalityLimit = 20,
  });

  factory LocationContract.fromJson(Map<String, dynamic> json) => LocationContract(
        enableGeolocation: json['enableGeolocation'] as bool? ?? true,
        enablePostalCode: json['enablePostalCode'] as bool? ?? true,
        defaultLocalityLimit: (json['defaultLocalityLimit'] as int?) ?? 20,
      );
}

class SocialPlace {
  final String id;
  final String name;
  final double? latitude;
  final double? longitude;
  final String? postalCode;

  const SocialPlace({
    required this.id,
    required this.name,
    this.latitude,
    this.longitude,
    this.postalCode,
  });

  factory SocialPlace.fromJson(Map<String, dynamic> json) => SocialPlace(
        id: json['id'] as String? ?? json['_id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        postalCode: json['postalCode'] as String?,
      );
}

class PostalCodeLookupResult {
  final String postalCode;
  final List<LocalityEntry> localities;

  const PostalCodeLookupResult({
    required this.postalCode,
    this.localities = const <LocalityEntry>[],
  });

  factory PostalCodeLookupResult.fromJson(Map<String, dynamic> json) => PostalCodeLookupResult(
        postalCode: json['postalCode'] as String? ?? '',
        localities: (json['localities'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map<String, dynamic>>()
            .map(LocalityEntry.fromJson)
            .toList(),
      );
}

class LocalityEntry {
  final String name;
  final String state;
  final String country;

  const LocalityEntry({
    required this.name,
    required this.state,
    required this.country,
  });

  factory LocalityEntry.fromJson(Map<String, dynamic> json) => LocalityEntry(
        name: json['name'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
      );
}
