import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Location> fetchLocation(String searchText) async {
  String apiKey = 'AIzaSyCLMhZgmt4DdkTloZiPhgcmmBI7-UkY2Iw';
  final response = await http.get(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=' +
          searchText +
          '&key=' +
          apiKey);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Location.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load location');
  }
}

class Location {
  final List results;
  Location({this.results});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      results: json['results'],
      // id: json['id'],
      // title: json['title'],
    );
  }
}
