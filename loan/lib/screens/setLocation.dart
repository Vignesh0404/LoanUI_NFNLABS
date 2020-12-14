import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:loan/screens/saveAddress.dart';
import 'package:loan/screens/search.dart';

import '../services/googleMapWidget.dart';

List<Placemark> placemarks;

class GoogleMaps extends GoogleMapExampleAppPage {
  GoogleMaps({this.latitude, this.longitude})
      : super(const Icon(Icons.map), 'User interface');
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return SetLocation(latitude: latitude, longitude: longitude);
  }
}

class SetLocation extends StatefulWidget {
  final double latitude;
  final double longitude;
  SetLocation({this.latitude, this.longitude});

  @override
  State<StatefulWidget> createState() =>
      SetLocationState(latitude: latitude, longitude: longitude);
}

class SetLocationState extends State<SetLocation> {
  final double latitude;
  final double longitude;
  SetLocationState({this.latitude, this.longitude});

  CameraPosition _position;
  CameraPosition initialPosition;

  GoogleMapController _controller;
  @override
  void initState() {
    super.initState();
    initialPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15.0,
    );
    _position = initialPosition;
  }

  @override
  void dispose() {
    super.dispose();
  }

  String addressLine = '';
  void _updateCameraPosition(CameraPosition position) async {
    final coordinates =
        new Coordinates(_position.target.latitude, _position.target.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = address.first;
    setState(() {
      _position = position;
      addressLine = first.addressLine;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      print(controller);
    });
  }

  Future<Widget> findAddress() async {
    placemarks = await placemarkFromCoordinates(13.0868105, 80.1993374);
    print(placemarks);
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Set location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF161A1B),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
              )
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 230,
                      child: GoogleMap(
                        compassEnabled: true,
                        mapToolbarEnabled: false,
                        cameraTargetBounds: CameraTargetBounds.unbounded,
                        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                        mapType: MapType.normal,
                        rotateGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        indoorViewEnabled: true,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        onMapCreated: onMapCreated,
                        initialCameraPosition: initialPosition,
                        onCameraMove: _updateCameraPosition,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SvgPicture.asset('images/locationPin.svg'),
                  ),
                ))
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: 65,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Text(
                          addressLine,
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 30, right: 30),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SaveLocation(
                                      _position.target.latitude,
                                      _position.target.longitude,
                                      _position.zoom,
                                      _position.tilt)));
                        },
                        height: 40,
                        color: Color(0xFFEC4E4E),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Confirm Location',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                'Double check pinned location',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
