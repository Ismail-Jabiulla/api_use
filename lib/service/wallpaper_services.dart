import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/wallpaper.dart';

Future<int> fetchWallpaper() async {
  final response = await http.get(Uri.parse("https://geniepers.onrender.com/community-images/all"),
      headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzU1ZWRhODI2ZTYxMDA0MjQ1NTEwMCIsImlhdCI6MTcwMjE5MDgxMCwiZXhwIjoxNzA0NzgyODEwfQ.EDg2gCw8tcgCVsbVrGz6VY6xUBbn3Yqxcfk9CdBO-ok'});
  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    List<Wallpaper> allWallpapers = responseData.map((item) => Wallpaper.fromJson(item)).toList();

    print(response.body);
    print(response.statusCode);
    return 200;
  } else {
    print(response.body);
    print(response.statusCode);
    throw Exception('Failed to load data');
  }
}