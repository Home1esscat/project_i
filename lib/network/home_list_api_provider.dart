import 'dart:convert';
import 'dart:developer';

import 'package:project_i/network/constants.dart';
import 'package:http/http.dart' as http;
import 'models/home_list_model.dart';

class HomeListApi {
  Future<HomeListModel> getTopList(int page) async {
    var params = {
      'sort': 'popular',
      'page': page.toString(),
      'per_page': '42',
    };

    var uri = Uri.https(Constants.thingiverseBaseUrl, Constants.search, params);

    var request = await http
        .get(uri, headers: {Constants.autotization: Constants.bearerToken});

    log('status code: ${request.statusCode}');
    return HomeListModel.fromJson(json.decode(request.body));
  }
}
