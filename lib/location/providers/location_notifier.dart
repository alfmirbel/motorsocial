import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationState {
  final String locality;
  final bool isLoading;
  final String? error;
  const LocationState({this.locality = '', this.isLoading = false, this.error});

  LocationState copyWith({String? locality, bool? isLoading, String? error}) {
    return LocationState(locality: locality ?? this.locality, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

class LocationNotifier extends Notifier<LocationState> {
  @override
  LocationState build() => const LocationState();
}

final locationProvider = NotifierProvider<LocationNotifier, LocationState>(LocationNotifier.new);
