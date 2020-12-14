import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loan/services/googleMapWidget.dart';
import 'package:loan/screens/setLocation.dart';

class NoAddress extends StatefulWidget {
  NoAddress({Key key}) : super(key: key);

  @override
  _NoAddressState createState() => _NoAddressState();
}

double lat;
double lon;
String addressLine = '';

class _NoAddressState extends State<NoAddress> {
  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = address.first;

    setState(() {
      lat = position.latitude;
      lon = position.longitude;
      addressLine = first.addressLine;
      print(addressLine);
    });
  }

  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
      GoogleMaps(latitude: 13.0868122, longitude: 80.1993428),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xFF161A1B),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Choose your address',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  'Select from saved addresses or add a new one',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
              child: Column(
            children: [
              Image(
                image: AssetImage('images/alert.png'),
                height: 140,
              ),
              SizedBox(height: 10),
              Text(
                "You don't have any saved addresses.",
                style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
              Text(
                'Add a new one to proceed.',
                style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              )
            ],
          )),
          Spacer(),
          GestureDetector(
            onTap: () async {
              _getCurrentLocation();
              _pushPage(context, _allPages[0]);
            },
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
                child: Container(
                  height: 40,
                  color: Color(0xFFEC4E4E),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Add a new address',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Text(
                          'choose a custom location',
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
          )
        ],
      ),
    );
  }
}
