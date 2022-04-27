import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../Application/Providers/helpers_provider.dart';
import 'package:latlong2/latlong.dart';

class DeliveryAddresScreen extends StatefulWidget {
  final VoidCallback _callback;
  final double _mapZoom = 13;
  final double _markerHeight = 80;
  final double _markerWidth = 80;
  final Key _markerKey = const Key("marker");
  const DeliveryAddresScreen(this._callback, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeliveryAddresState();
}

class _DeliveryAddresState extends State<DeliveryAddresScreen> {
  String _deliveryAddress = "";
  late DeliveryAddress _address;

  @override
  Widget build(BuildContext context) {
    _address =
        Provider.of<HelpersProvider>(context, listen: false).addressHelper;

    ValueNotifier<LatLng> _markerLocation =
        ValueNotifier<LatLng>(_address.getLocation().instance);

    return FutureBuilder(
      future: _address.initGpsLocation(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              backgroundColor: parseColor("#F8EDEB"),
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
                  FlutterMap(
                    options: MapOptions(
                      center: _markerLocation.value,
                      onPositionChanged: (position, hasGesture) {
                        _markerLocation.value = position.center!;
                      },
                      zoom: widget._mapZoom,
                    ),
                    nonRotatedChildren: [
                      TileLayerWidget(
                          options: TileLayerOptions(
                              urlTemplate:
                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c'])),
                      ValueListenableBuilder<LatLng>(
                          valueListenable: _markerLocation,
                          builder: (context, value, child) {
                            return MarkerLayerWidget(
                                key: widget._markerKey,
                                options: MarkerLayerOptions(markers: [
                                  Marker(
                                    width: widget._markerWidth,
                                    height: widget._markerHeight,
                                    point: value,
                                    builder: (ctx) => const FlutterLogo(),
                                  )
                                ]));
                          })
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      minWidth: 130,
                      height: 50,
                      shape: const StadiumBorder(),
                      color: parseColor("#FFB5A7"),
                      child:
                          Row(mainAxisSize: MainAxisSize.min, children: const [
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
                            latitude: _markerLocation.value.latitude,
                            longitude: _markerLocation.value.longitude,
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
