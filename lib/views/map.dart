
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import './crime.dart';
import '../config.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FlutterMap(
      options: MapOptions(
        center: LatLng(29.834, -95.4342),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': Config.MAPBOX_KEY ?? 'oopsies',
            'id': 'mapbox.streets',
          },
        ),
      ],
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => CrimeView()
            )
          ),
        tooltip: 'Increment',
        icon: Icon(Icons.camera),
        label: Text("Report crime"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// MarkerLayerOptions(
//   markers: [
//     Marker(
//       width: 80.0,
//       height: 80.0,
//       point: LatLng(29.834, -95.4342),
//       builder: (ctx) =>
//       Container(
//         child: IconButton(
//           icon: Icon(Icons.warning),
//           iconSize: 48.0,
//           color: Colors.orange,
//           onPressed: () => {},
//         )
//       ),
//     ),
//   ],
// ),
