import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Helpers/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  static Position? position;
  static final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude), zoom: 17);
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.determineCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      }, //msh fahma el onmapcreated
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        position != null
            ? buildMap()
            : const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
