import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neo/http_service.dart';
import 'package:neo/neows/api.dart';
import 'package:neo/screens/neo_detail.dart';

import '../post_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 100,
            elevation: 0,
            centerTitle: true,
            title: Text('Near-Earth Objects'),
            floating: true,
            pinned: false,
            snap: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder(
                  future: httpService.getPosts(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NearEarthObject>> snapshot) {
                    if (snapshot.hasData) {
                      List<NearEarthObject>? objs = snapshot.data;
                      return Column(
                        children: objs!
                            .map(
                              (NearEarthObject obj) => ListTile(
                                title: Text(obj.name),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => NeoDetail(neo: obj,),)
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
