import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_order_client/Models/Profile/address_model.dart';

class DeliveryAddresScreen extends StatefulWidget {
  const DeliveryAddresScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeliveryAddresState();
}

class _DeliveryAddresState extends State<DeliveryAddresScreen> {
  final Set<Marker> _deliveryAdressMarker = {};
  final Address _address = Address();
  final MarkerId _markerId = const MarkerId("deliveryAddress");
  bool _markerMovementEnabled = false;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      Marker marker =
          Marker(markerId: _markerId, position: _address.getLocation());
      _deliveryAdressMarker.add(marker);
    });
  }

  Future<void> _onCameraMove(CameraPosition cameraPosition) async {
    if (_markerMovementEnabled) {
      _deliveryAdressMarker
          .add(Marker(markerId: _markerId, position: cameraPosition.target));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _address.getDeviceLocation(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: _address.getLocation(), zoom: 10),
            markers: _deliveryAdressMarker,
            onTap: (positon) {
              setState(() {
                _markerMovementEnabled = !_markerMovementEnabled;
              });
            },
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
