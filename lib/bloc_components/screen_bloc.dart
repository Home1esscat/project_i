// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:project_i/screens/categories.dart';
import 'package:project_i/screens/favorite.dart';
import 'package:project_i/screens/home.dart';
import 'package:project_i/screens/random.dart';
import 'dart:async';

enum ScreenEvent { event_home, event_categories, event_favorite, event_profile }

class ScreenBloc {
  late Widget _currentPage;

  // Данные заходят в поток
  final _inputEventController = StreamController<ScreenEvent>();
  StreamSink<ScreenEvent> get inputEventSink => _inputEventController.sink;

  // Данные выходят из потока
  final _outputStateController = StreamController<Widget>();
  Stream<Widget> get outputStateStream => _outputStateController.stream;

  // Мапим события
  void _mapEventToState(ScreenEvent event) {
    if (event == ScreenEvent.event_home) {
      _currentPage = const Home();
    } else if (event == ScreenEvent.event_categories) {
      _currentPage = const Categories();
    } else if (event == ScreenEvent.event_favorite) {
      _currentPage = const Favorite();
    } else if (event == ScreenEvent.event_profile) {
      _currentPage = const RandomScreen();
    }
    _outputStateController.sink.add(_currentPage);
  }

  ScreenBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
