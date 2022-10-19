import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicmodel/features/music/models/music_model.dart';

class MusicServices {
  Future<List<Results>> getData() async {
    List<Results>? result = [];
    var res = await http
        .get(Uri.parse("https://itunes.apple.com/search?term=radiohead"));
    var data = jsonDecode(res.body);
    print("Response " + data.toString());
    if (res.statusCode == 200) {
      // result = Results.fromJson(data["results"]);
    //  print("List Size " + result!.length.toString());
      return List<Results>.generate(data["results"].length,
          (index) => Results.fromJson(data["results"][index])).toList();
    
    }
    return result;
  }
}
