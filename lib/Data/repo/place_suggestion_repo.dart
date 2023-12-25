import 'package:flutter_maps/Data/Web%20Services/web_service.dart';
import 'package:flutter_maps/Data/models/suggestion_model.dart';

class PlaceSuggestionsRepo {
  WebService webService = WebService();
  Future<List<dynamic>> fetchAllSuggestions(
      String place, String sessionToken) async {
    final suggestionsList =
        await webService.fetchAllSuggestions(place, sessionToken);
    return suggestionsList
        .map((suggestion) => SuggestionModel.fromJson(suggestion))
        .toList();
  }
}
