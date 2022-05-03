import 'dart:convert';
import 'dart:developer';

import 'package:project_i/network/constants.dart';
import 'package:http/http.dart' as http;
import 'models/home_list_model.dart';

class HomeListApi {
  Future<HomeListModel> getTopList(int perPage) async {
    var params = {
      'sort': 'popular',
      'page': '1',
      'per_page': perPage.toString()
    };

    var uri = Uri.https(Constants.thingiverseBaseUrl, Constants.search, params);

    var request =
        await http.get(uri, headers: {'Authorization': Constants.bearerToken});

    log('status code: ${request.statusCode}');
    return HomeListModel.fromJson(json.decode(request.body));
  }
}
