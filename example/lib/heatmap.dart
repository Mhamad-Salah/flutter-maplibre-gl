import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:maplibre_gl_example/page.dart';

class Heatmap extends ExamplePage {
  Heatmap() : super(const Icon(Icons.whatshot_outlined), 'Heatmap');

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HeatmapBody());
  }
}

class HeatmapBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeatmapState();
}

const styleString = 'https://tiles.a.kubak.co/styles/kubak/style.json';

class HeatmapState extends State {
  static final LatLng center = const LatLng(35.565776, 45.430791);

  late MaplibreMapController controller;
  int filteredId = 0;

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      styleString: styleString,
      dragEnabled: false,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      // onMapClick: (point, latLong) =>
      //     print(point.toString() + latLong.toString()),
      onStyleLoadedCallback: _onStyleLoadedCallback,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 11.0,
      ),
      annotationOrder: const [],
    );
  }

  void _onMapCreated(MaplibreMapController controller) {
    this.controller = controller;

    controller.onFeatureTapped.add(onFeatureTap);
  }

  void onFeatureTap(dynamic featureId, Point<double> point, LatLng latLng) {
    final snackBar = SnackBar(
      content: Text(
        'Tapped feature with id $featureId',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onStyleLoadedCallback() async {
    await controller.addGeoJsonSource("points", _points);

    await controller.addHeatmapLayer(
      'ss',
      'points',
    );
  }
}

const _points = {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 1,
      "geometry": {
        "type": "Point",
        "coordinates": [45.377853200000004, 35.5692241]
      }
    },
    {
      "type": "Feature",
      "id": 2,
      "geometry": {
        "type": "Point",
        "coordinates": [45.485310406756156, 35.54933616124203]
      }
    },
    {
      "type": "Feature",
      "id": 3,
      "geometry": {
        "type": "Point",
        "coordinates": [45.3904301, 35.5685471]
      }
    },
    {
      "type": "Feature",
      "id": 4,
      "geometry": {
        "type": "Point",
        "coordinates": [45.42646474485778, 35.55812232882516]
      }
    },
    {
      "type": "Feature",
      "id": 5,
      "geometry": {
        "type": "Point",
        "coordinates": [45.33469381460307, 35.587235747165735]
      }
    },
    {
      "type": "Feature",
      "id": 6,
      "geometry": {
        "type": "Point",
        "coordinates": [45.38853030000001, 35.5483304]
      }
    },
    {
      "type": "Feature",
      "id": 7,
      "geometry": {
        "type": "Point",
        "coordinates": [45.35545012236025, 35.57135303313118]
      }
    },
    {
      "type": "Feature",
      "id": 8,
      "geometry": {
        "type": "Point",
        "coordinates": [45.443382081702055, 35.530041863136425]
      }
    },
    {
      "type": "Feature",
      "id": 9,
      "geometry": {
        "type": "Point",
        "coordinates": [45.465166955134805, 35.52911569374637]
      }
    },
    {
      "type": "Feature",
      "id": 10,
      "geometry": {
        "type": "Point",
        "coordinates": [45.35237866441426, 35.5728497972088]
      }
    },
    {
      "type": "Feature",
      "id": 11,
      "geometry": {
        "type": "Point",
        "coordinates": [45.40551311067637, 35.56309428188231]
      }
    },
    {
      "type": "Feature",
      "id": 12,
      "geometry": {
        "type": "Point",
        "coordinates": [45.41567718142389, 35.581429391448545]
      }
    },
    {
      "type": "Feature",
      "id": 13,
      "geometry": {
        "type": "Point",
        "coordinates": [45.42523832398692, 35.55842304682041]
      }
    },
    {
      "type": "Feature",
      "id": 14,
      "geometry": {
        "type": "Point",
        "coordinates": [45.42262965937681, 35.53755909034612]
      }
    },
    {
      "type": "Feature",
      "id": 15,
      "geometry": {
        "type": "Point",
        "coordinates": [45.44810939473089, 35.60669167376473]
      }
    },
    {
      "type": "Feature",
      "id": 16,
      "geometry": {
        "type": "Point",
        "coordinates": [45.435588512040425, 35.55394829638957]
      }
    },
    {
      "type": "Feature",
      "id": 17,
      "geometry": {
        "type": "Point",
        "coordinates": [45.4518209286712, 35.53529225621407]
      }
    },
    {
      "type": "Feature",
      "id": 18,
      "geometry": {
        "type": "Point",
        "coordinates": [45.486468599999995, 35.55262219999999]
      }
    },
    {
      "type": "Feature",
      "id": 19,
      "geometry": {
        "type": "Point",
        "coordinates": [45.46234813383268, 35.54141437315327]
      }
    },
    {
      "type": "Feature",
      "id": 20,
      "geometry": {
        "type": "Point",
        "coordinates": [45.45978259999998, 35.5464723]
      }
    },
    {
      "type": "Feature",
      "id": 21,
      "geometry": {
        "type": "Point",
        "coordinates": [45.40399611376952, 35.57911368126286]
      }
    },
    {
      "type": "Feature",
      "id": 22,
      "geometry": {
        "type": "Point",
        "coordinates": [45.378311752594186, 35.56012265573827]
      }
    },
    {
      "type": "Feature",
      "id": 23,
      "geometry": {
        "type": "Point",
        "coordinates": [45.35132883942495, 35.562954280997175]
      }
    },
    {
      "type": "Feature",
      "id": 24,
      "geometry": {
        "type": "Point",
        "coordinates": [45.42262965937681, 35.53755909034612]
      }
    },
    {
      "type": "Feature",
      "id": 25,
      "geometry": {
        "type": "Point",
        "coordinates": [45.44704230993841, 35.57175953693135]
      }
    }
  ]
};
