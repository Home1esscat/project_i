import 'package:project_i/network/home_list_api_provider.dart';

import 'models/home_list_model.dart';

class HomeListRepository {
  final HomeListApi _homeListApi = HomeListApi();
  Future<HomeListModel> getHomeList(int page) {
    return _homeListApi.getTopList(page);
  }
}
