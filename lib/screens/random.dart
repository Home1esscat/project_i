import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_i/network/models/random_thing_model.dart';
import 'package:project_i/network/random_thing_api_provider.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  late Future<SingleThing> thing;

  @override
  void initState() {
    thing = RandomThingApi().getRandomThing();
    super.initState();
  }

  void refresh() {
    HapticFeedback.mediumImpact();
    setState(() {
      thing = RandomThingApi().getRandomThing();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SingleThing>(
        future: thing,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.only(top: 12),
              color: Colors.white,
              child: _fullCard(snapshot),
            );
          } else {
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 12),
              child: _emptyCard(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.refresh_rounded),
        onPressed: (() => {refresh()}),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Widget _emptyCard() {
  return SizedBox(
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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

Widget _fullCard(AsyncSnapshot<SingleThing> snapshot) {
  return SizedBox(
    height: 500,
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(14),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(snapshot.data!.thumbnail.toString()),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _titleAvatar(
                snapshot.data!.creator!.thumbnail.toString(),
                snapshot.data!.description!.toString(),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    favorite(),
                    share(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget favorite() {
  return Row(
    children: [
      Icon(
        Icons.favorite_border,
        size: 24,
        color: Colors.grey[600],
      ),
      const SizedBox(
        width: 10,
      ),
      Text("89655",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[600])),
    ],
  );
}

Widget share() {
  return Row(
    children: [
      Icon(
        Icons.share_rounded,
        size: 24,
        color: Colors.grey[600],
      ),
      const SizedBox(
        width: 10,
      ),
      Text("Share",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[600])),
    ],
  );
}

Widget _titleAvatar(String avatar, String description) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))),
    margin: const EdgeInsets.all(8),
    child: Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(avatar),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(description),
            ),
          )
        ],
      ),
    ),
  );
}
