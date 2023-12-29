part of 'Map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class PlacesSuggestionsLoaded extends MapState {
  final List<dynamic> suggestions;

  PlacesSuggestionsLoaded({required this.suggestions});
}

final class PlaceLoaded extends MapState {
  final PlaceModal place;

  PlaceLoaded({required this.place});
}
