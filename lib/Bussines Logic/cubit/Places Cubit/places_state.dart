part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesLoaded extends PlacesState {
  final List<dynamic> suggestions;

  PlacesLoaded({required this.suggestions});
}
