import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_i/network/random_thing.dart';
import 'package:project_i/network/random_thing_repository.dart';

enum LoadingEvent { event_loading, event_loaded, event_error }

class RandomBloc {
// Данные заходят в поток
  final _inputEventController = StreamController<LoadingEvent>();
  StreamSink<LoadingEvent> get inputEventSink => _inputEventController.sink;

  // Данные выходят из потока
  final _outputStateController = StreamController<Widget>();
  Stream<Widget> get outputStateStream => _outputStateController.stream;

  Stream<Widget> mapEventToState(LoadingEvent event) async* {
    if (event == LoadingEvent.event_loading) {
      yield loadingStateWidget();
      try {
        final SingleThing _loadedThing =
            await RandomThingRepository().getSingleThing();
        yield loadedStateWidget(_loadedThing);
      } catch (_) {
        yield errorStateWidget();
      }
    }
  }

  RandomBloc() {
    _inputEventController.stream.listen(mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }

  Widget loadedStateWidget(SingleThing thing) {
    return SizedBox(
      height: 500,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        margin: const EdgeInsets.all(14),
        elevation: 4,
        child: Container(
          color: Colors.grey[200],
          child: const Center(
            child: Text('Error!!!'),
          ),
        ),
      ),
    );
  }

  Widget errorStateWidget() {
    return SizedBox(
      height: 500,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        margin: const EdgeInsets.all(14),
        elevation: 4,
        child: Container(
          color: Colors.grey[200],
          child: const Center(
            child: Text('Error!!!'),
          ),
        ),
      ),
    );
  }

  Widget loadingStateWidget() {
    return SizedBox(
      height: 500,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        margin: const EdgeInsets.all(14),
        elevation: 4,
        child: Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
