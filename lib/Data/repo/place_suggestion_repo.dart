import 'package:flutter_maps/Data/Web%20Services/web_service.dart';
import 'package:flutter_maps/Data/models/place.dart';
import 'package:flutter_maps/Data/models/suggestion_model.dart';

class MapsRepo {
  WebService webService = WebService();
  Future<List<dynamic>> fetchAllSuggestions(
      String place, String sessionToken) async {
    final suggestionsList =
        await webService.fetchAllSuggestions(place, sessionToken);
    return suggestionsList
        .map((suggestion) => SuggestionModel.fromJson(suggestion))
        .toList();
  }

  Future<dynamic> fetchPlaceDetails(String placeId, String sessionToken) async {
    final place = await webService.fetchPlaceDetails(placeId, sessionToken);
    return PlaceModal.fromjson(place);
  }
}
