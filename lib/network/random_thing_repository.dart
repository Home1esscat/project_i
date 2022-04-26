import 'package:project_i/network/random_thing.dart';
import 'package:project_i/network/random_thing_api_provider.dart';

class RandomThingRepository {
  final RandomThingApi _randomThingApi = RandomThingApi();
  Future<SingleThing> getSingleThing() {
    return _randomThingApi.getRandomThing();
  }
}
