import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_gmaps/.env.dart';
import 'package:flutter_gmaps/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  String googleAPIKey = 'AIzaSyA9Ay7pHXZDTa1-KQMgz3AywMpKq9VwBL4';
  final Dio _dio;

  DirectionsRepository({Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    @required LatLng origin,
    @required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.data);
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
