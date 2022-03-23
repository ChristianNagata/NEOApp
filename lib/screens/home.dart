import 'package:flutter/material.dart';
import 'package:neo/httpService/http_service.dart';
import 'package:neo/screens/neo_detail.dart';

import '../httpService/post_model.dart';

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
            expandedHeight: 80,
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
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(obj.name),
                                    const Icon(Icons.arrow_forward_ios, size: 12)
                                  ],
                                ),
                                subtitle: Text(
                                    obj.isPotentiallyHazardousAsteroid
                                        ? 'Potentially hazardous'
                                        : "Isn't hazardous"),
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => NeoDetail(
                                    neo: obj,
                                  ),
                                )),
                              ),
                            )
                            .toList(),
                      );
                    }
                    return SizedBox(
                      height: 360,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
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
