
import 'package:flutter/material.dart';
import 'package:neo/httpService/post_model.dart';

class NeoDetail extends StatelessWidget {
  final NearEarthObject neo;
  const NeoDetail({Key? key, required this.neo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(neo.name),
        toolbarHeight: 80,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Object name'),
                  subtitle: Text(neo.name),
                ),
                ListTile(
                  title: const Text('Id'),
                  subtitle: Text(neo.id),
                ),
                ListTile(
                  title: const Text('Is potentially hazardous?'),
                  subtitle: Text(neo.isPotentiallyHazardousAsteroid ? 'True' : 'False'),
                ),
                ListTile(
                  title: const Text('Close approach date'),
                  subtitle: Text('${neo.closeApproachData[0]['close_approach_date_full']}'),
                ),
                ListTile(
                  title: const Text('Estimated diameter (m)'),
                  subtitle: Text('${neo.estimatedDiameter['meters']['estimated_diameter_min']} to ${neo.estimatedDiameter['meters']['estimated_diameter_max']}'),
                ),
                ListTile(
                  title: const Text('Relative velocity (Km/h)'),
                  subtitle: Text('${neo.closeApproachData[0]['relative_velocity']['kilometers_per_hour']}'),
                ),
                ListTile(
                  title: const Text('Absolute magnitude (H)'),
                  subtitle: Text('${neo.absoluteMagnitudeH}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
}
