class Suggestion {
  late String placeId;
  late String description;

  Suggestion.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
  }
}
