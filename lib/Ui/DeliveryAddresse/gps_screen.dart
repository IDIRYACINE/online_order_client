import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

import '../../Application/Providers/helpers_provider.dart';

class DeliveryAddresScreen extends StatefulWidget {
  final VoidCallback _callback;

  const DeliveryAddresScreen(this._callback, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeliveryAddresState();
}

class _DeliveryAddresState extends State<DeliveryAddresScreen> {
  final Set<Marker> _deliveryAdressMarker = {};
  final MarkerId _markerId = const MarkerId("deliveryAddress");
  String _deliveryAddress = "";
  LatLng _coordinations = const LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    final DeliveryAddress _address =
        Provider.of<HelpersProvider>(context).addressHelper;

    Future<void> _onMapCreated(GoogleMapController controller) async {
      setState(() {
        Marker marker =
            Marker(markerId: _markerId, position: _address.getLocation());
        _deliveryAdressMarker.add(marker);
      });
    }

    Future<void> _onCameraMove(CameraPosition cameraPosition) async {
      _coordinations = cameraPosition.target;
      setState(() {
        _deliveryAdressMarker
            .add(Marker(markerId: _markerId, position: cameraPosition.target));
      });
    }

    return FutureBuilder(
      future: _address.initGpsLocation(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor:parseColor("#F8EDEB"),
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Address',
                        ),
                        onChanged: (value) {
                          _deliveryAddress = value;
                        },
                      ))),
              body: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                        target: _address.getLocation(), zoom: 10),
                    markers: _deliveryAdressMarker,
                    onCameraMove: _onCameraMove,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child: MaterialButton(
                      minWidth: 130,
                      height: 50,
                      shape: const StadiumBorder(),

                      color: parseColor("#FFB5A7"),
                      child: Row(mainAxisSize: MainAxisSize.min, 
                      children: const [
                        Text(
                          "Confirm",
                          style: TextStyle(
                            fontFamily: "Lobster",
                          ),
                        ),
                        Icon(Icons.gps_fixed),
                      ]),
                      onPressed: () {
                        _address.setLocation(
                            coordinations: _coordinations,
                            infos: _deliveryAddress);
                        widget._callback();
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ));
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
