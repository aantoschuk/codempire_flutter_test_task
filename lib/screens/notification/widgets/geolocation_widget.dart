import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationWidget extends StatelessWidget {
  const GeolocationWidget({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  Future<List<Placemark>> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Text("Немає дозволу на службу локацій"),
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Дозволу тимчасово немає, неможливо зробити запит на дозвіл.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _determinePosition(),
        builder: (context, AsyncSnapshot<List<Placemark>> snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Text(snapshot.data![0].country ?? ''),
                Text(snapshot.data![0].locality ?? ''),
                Text(snapshot.data![0].street ?? ''),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('error');
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
