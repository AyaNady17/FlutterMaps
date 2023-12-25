import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Helpers/location_helper.dart';
import 'package:flutter_maps/Presentaion/Widgets/floating_search_bar.dart';
import 'package:flutter_maps/Presentaion/Widgets/my_drawer.dart';
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
  static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude), zoom: 17);
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.determineCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: myCurrentLocationCameraPosition,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      }, //msh fahma el onmapcreated
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
  }

  Widget _buildFloatingActionButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 30),
      child: FloatingActionButton(
        onPressed: () {
          _goToMyCurrentLocation();
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.place,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : const Center(child: CircularProgressIndicator()),
          const customFloatingSearchBar(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
