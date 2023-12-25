class SuggestionModel {
  late String placeId;
  late String description;

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
  }
}
