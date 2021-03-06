import 'package:flutter/material.dart';
import 'package:project_i/network/constants.dart';
import 'package:project_i/screens/home.dart';

import 'bloc_components/screen_bloc.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.red)),
      home: Scaffold(
        body: _MainContainer(),
      ),
    );
  }
}

class _MainContainer extends StatefulWidget {
  @override
  State<_MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<_MainContainer> {
  final ScreenBloc _bloc = ScreenBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Widget>(
      stream: _bloc.outputStateStream,
      initialData: const Home(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Expanded(child: snapshot.data!),
            _getNavigationButtons(snapshot.data!.toString()),
          ],
        );
      },
    );
  }

  Widget _getNavigationButtons(String index) {
    const activeColor = GlobalColors.localColor;
    return Container(
      color: GlobalColors.globalColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            splashRadius: 120,
            padding: const EdgeInsets.all(18),
            iconSize: 28,
            onPressed: () => _bloc.inputEventSink.add(ScreenEvent.event_home),
            icon: const Icon(Icons.home_rounded),
            color: (index == 'Home') ? activeColor : Colors.white,
          ),
          IconButton(
            splashRadius: 120,
            padding: const EdgeInsets.all(18),
            iconSize: 28,
            onPressed: () =>
                _bloc.inputEventSink.add(ScreenEvent.event_categories),
            icon: const Icon(Icons.category_rounded),
            color: (index == 'Categories') ? activeColor : Colors.white,
          ),
          IconButton(
            splashRadius: 120,
            padding: const EdgeInsets.all(18),
            iconSize: 28,
            onPressed: () => _bloc.inputEventSink.add(ScreenEvent.event_search),
            icon: const Icon(Icons.search_rounded),
            color: (index == 'Search') ? activeColor : Colors.white,
          ),
          IconButton(
            splashRadius: 120,
            padding: const EdgeInsets.all(18),
            iconSize: 28,
            onPressed: () =>
                _bloc.inputEventSink.add(ScreenEvent.event_favorite),
            icon: const Icon(Icons.favorite_rounded),
            color: (index == 'Favorite') ? activeColor : Colors.white,
          ),
          IconButton(
            splashRadius: 120,
            padding: const EdgeInsets.all(18),
            iconSize: 28,
            onPressed: () =>
                _bloc.inputEventSink.add(ScreenEvent.event_profile),
            icon: const Icon(Icons.casino_rounded),
            color: (index == 'RandomScreen') ? activeColor : Colors.white,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
