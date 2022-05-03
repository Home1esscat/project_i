import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:project_i/network/constants.dart';
import 'package:project_i/network/models/random_thing_model.dart';

class RandomThingApi {
  Future<String> _getRandomThingId() async {
    final responce = await http.Client()
        .get(Uri.parse('https://thingiverserandomizer.com/'));

    if (responce.statusCode == 200) {
      var document = parse(responce.body);
      var linkList = document.getElementsByClassName('nav-item navpad');
      String dirtyString = linkList[0].innerHtml.trim().substring(0, 58);

      dirtyString = dirtyString.substring(
          dirtyString.indexOf('"') + 1, dirtyString.lastIndexOf('"'));

      return dirtyString.substring(
          dirtyString.lastIndexOf(':') + 1, dirtyString.length);
    } else {
      throw Exception("Connection problem :(");
    }
  }

  Future<SingleThing> getRandomThing() async {
    final id = await _getRandomThingId();

    var uri = Uri.https(Constants.thingiverseBaseUrl, Constants.things + id);
    //print('request : ' + uri.toString());

    var response = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    //print('Status Code: ' + response.statusCode.toString());

    return SingleThing.fromJson(json.decode(response.body));
  }
}
