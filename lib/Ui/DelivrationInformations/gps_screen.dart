import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';

class DeliveryAddresScreen extends StatefulWidget {
  const DeliveryAddresScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeliveryAddresState();
}

class _DeliveryAddresState extends State<DeliveryAddresScreen> {
  final Set<Marker> _deliveryAdressMarker = {};
  final DeliveryAddress _address = DeliveryAddress();
  final MarkerId _markerId = const MarkerId("deliveryAddress");

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      Marker marker =
          Marker(markerId: _markerId, position: _address.getLocation());
      _deliveryAdressMarker.add(marker);
    });
  }

  Future<void> _onCameraMove(CameraPosition cameraPosition) async {
    setState(() {
      _deliveryAdressMarker
          .add(Marker(markerId: _markerId, position: cameraPosition.target));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _address.initGpsLocation(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: _address.getLocation(), zoom: 10),
            markers: _deliveryAdressMarker,
            onCameraMove: _onCameraMove,
          );
        }
        if (snapshot.hasError) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
