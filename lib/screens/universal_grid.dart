import 'dart:developer';

import 'package:flutter/material.dart';

import '../network/home_list_repository.dart';
import '../network/models/home_list_model.dart';

class UniversalGrid extends StatefulWidget {
  const UniversalGrid({Key? key}) : super(key: key);

  @override
  State<UniversalGrid> createState() => _UniversalGridState();
}

class _UniversalGridState extends State<UniversalGrid> {
  late Future<HomeListModel> homeList;
  late ScrollController _controller = ScrollController();
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return _uploadData();
  }

  FutureBuilder<HomeListModel> _uploadData() {
    return FutureBuilder<HomeListModel>(
      future: homeList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemBuilder: (context, index) {
              return Image.network(
                snapshot.data!.hits![index].previewImage!,
                fit: BoxFit.cover,
              );
            },
            itemCount: snapshot.data!.hits!.length,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    homeList = HomeListRepository().getHomeList(page);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        log("Scroll");
        setState(() {
          page++;
          homeList = HomeListRepository().getHomeList(page);
        });
      }
    });
    super.initState();
  }
}
