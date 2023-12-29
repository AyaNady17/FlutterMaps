import 'package:dio/dio.dart';
import 'package:flutter_maps/Constansts/strings.dart';

class WebService {
  late Dio dio;

  WebService() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> fetchAllSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(suggestionsBaseUrl, queryParameters: {
        'input': place,
        'components': 'country:eg',
        'types': 'address',
        'key': apiKey,
        'sessiontoken': sessionToken,
      });
      print(response.data);
      return response.data['predictions'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> fetchPlaceDetails(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(placeBaseUrl, queryParameters: {
        'place_id': placeId,
        'key': apiKey,
        'fields': 'geometry',
        'sessiontoken': sessionToken,
      });
      return response.data;
    } catch (e) {
      return Future.error(
          'place location error', StackTrace.fromString('this is ots trace'));
    }
  }
}
