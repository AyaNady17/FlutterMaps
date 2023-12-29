import 'package:bloc/bloc.dart';
import 'package:flutter_maps/Data/models/place.dart';
import 'package:flutter_maps/Data/models/suggestion_model.dart';
import 'package:flutter_maps/Data/repo/place_suggestion_repo.dart';
import 'package:meta/meta.dart';

part 'Map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapsRepo mapsRepo;
  MapCubit(this.mapsRepo) : super(MapInitial());

  void emitAllSuggestions(String place, String sessionToken) async {
    final suggestionsList =
        await mapsRepo.fetchAllSuggestions(place, sessionToken);
    emit(PlacesSuggestionsLoaded(suggestions: suggestionsList));
  }

  void emitPlace(String placeId, String sessionToken) async {
    final place = await mapsRepo.fetchPlaceDetails(placeId, sessionToken);
    emit(PlaceLoaded(place: place));
  }
}
