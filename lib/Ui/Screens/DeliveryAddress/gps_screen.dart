import 'package:flutter/material.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/Buttons/buttons_default.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DeliveryAddresScreen extends StatefulWidget {
  final VoidCallback _callback;
  final double _mapZoom = 13;
  final double _markerHeight = 80;
  final double _markerWidth = 80;
  final double _padding = 16.0;
  final double _textFieldtopPadding = 32.0;
  final double _markerSize = 50.0;
  final Key _markerKey = const Key("marker");
  const DeliveryAddresScreen(this._callback, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeliveryAddresState();
}

class _DeliveryAddresState extends State<DeliveryAddresScreen> {
  String _deliveryAddress = "";
  late DeliveryAddress _address;
  final MapController _controller = MapController();

  @override
  Widget build(BuildContext context) {
    _address =
        Provider.of<HelpersProvider>(context, listen: false).addressHelper;
    _deliveryAddress = _address.getAddress();

    ValueNotifier<LatLng> markerLocation =
        ValueNotifier<LatLng>(_address.getLocation().instance);

    ThemeData theme = Theme.of(context);

    return FutureBuilder(
      future: _address.initGpsLocation(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              body: Stack(
            children: [
              FlutterMap(
                  mapController: _controller,

                options: MapOptions(
                  initialCenter: markerLocation.value,
                  onPositionChanged: (position, hasGesture) {
                    markerLocation.value = position.center!;
                  },
                  initialZoom: widget._mapZoom,
                ),
                children: [
                  TileLayer(
                      
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c']),
                  ValueListenableBuilder<LatLng>(
                      valueListenable: markerLocation,
                      builder: (context, value, child) {
                        return MarkerLayer(
                            key: widget._markerKey,
                            markers: [
                              Marker(
                                width: widget._markerWidth,
                                height: widget._markerHeight,
                                rotate: false,
                                alignment: Alignment.center,
                                point: value,
                                child: Icon(
                                  Icons.add_location_alt,
                                  size: widget._markerSize,
                                  color: theme.colorScheme.primary,
                                ),
                              )
                            ]);
                      })
                ],
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: widget._padding,
                        right: widget._padding,
                        top: widget._textFieldtopPadding),
                    child: ColoredBox(
                      color: theme.colorScheme.background,
                      child: TextFormField(
                        initialValue: _deliveryAddress,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: addressHint,
                          labelStyle: theme.textTheme.bodyLarge,
                          hintStyle: theme.textTheme.titleSmall,
                        ),
                        onChanged: (value) {
                          _deliveryAddress = value;
                        },
                      ),
                    )),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(widget._padding),
                  child: DefaultButton(
                    text: confirmLabel,
                    width: double.infinity,
                    onPressed: () {
                      _address.setLocation(
                          latitude: markerLocation.value.latitude,
                          longitude: markerLocation.value.longitude,
                          infos: _deliveryAddress);
                      widget._callback();
                    },
                  ),
                ),
              )
            ],
          ));
        }
        if (snapshot.hasError) {
          return Container(
            color: theme.colorScheme.surface,
            child: Center(
              child: DefaultButton(
                text: buttonRequestGpsPermissions,
                onPressed: () {
                  _address.requestGpsPermissions(context);
                },
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
