import 'package:bloc/bloc.dart';
import 'package:flutter_maps/Data/models/suggestion_model.dart';
import 'package:flutter_maps/Data/repo/place_suggestion_repo.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlaceSuggestionsRepo placeSuggestionsRepo;
  PlacesCubit(this.placeSuggestionsRepo) : super(PlacesInitial());

  void emitAllSuggestions(String place, String sessionToken) async {
    final suggestionsList =
        await placeSuggestionsRepo.fetchAllSuggestions(place, sessionToken);
    emit(PlacesLoaded(suggestions: suggestionsList));
  }
}
