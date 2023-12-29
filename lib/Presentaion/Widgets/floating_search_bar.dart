import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/Map%20Cubit/Map_cubit.dart';
import 'package:flutter_maps/Data/models/place.dart';
import 'package:flutter_maps/Data/models/suggestion_model.dart';
import 'package:flutter_maps/Presentaion/Widgets/place_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';

class customFloatingSearchBar extends StatelessWidget {
  customFloatingSearchBar({super.key, required this.mapController});
  FloatingSearchBarController controller = FloatingSearchBarController();
  late List<dynamic> placesList;
  late SuggestionModel placeSuggestion;
  late PlaceModal selectedPlace;
  late CameraPosition goToSelectedPlace;
  final mapController;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      controller: controller,
      hint: 'Find a place...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        final sessionToken = const Uuid().v4();
        BlocProvider.of<MapCubit>(context)
            .emitAllSuggestions(query, sessionToken);
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              buildPlacesBloc(),
              buildSelectedPlaceLocationBloc(),
            ]),
          ),
        );
      },
    );
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<MapCubit, MapState>(
      child: Container(),
      listener: (context, state) {
        if (state is PlaceLoaded) {
          selectedPlace = (state).place;
          goToMySearchedForLocation();
        }
      },
    );
  }

  Future<void> goToMySearchedForLocation() async {
    buildNewCameraPosition();
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(goToSelectedPlace));
  }

  void buildNewCameraPosition() {
    goToSelectedPlace = CameraPosition(
        zoom: 13,
        target: LatLng(selectedPlace.result.geometry.location.lat,
            selectedPlace.result.geometry.location.lng));
  }

  Widget buildPlacesBloc() {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is PlacesSuggestionsLoaded) {
          placesList = state.suggestions;
          if (placesList.isNotEmpty) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildPlacesList() {
    return ListView.builder(
        itemCount: placesList.length,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //TODO :review not sure
              placeSuggestion = placesList[index];
              BlocProvider.of<MapCubit>(context)
                  .emitPlace(placeSuggestion.placeId, Uuid().v4());
              controller.close();
            },
            child: PlaceItem(
              suggestion: placesList[index],
            ),
          );
        });
  }
}
