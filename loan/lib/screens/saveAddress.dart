import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan/DBtest2/database_helper.dart';
import 'package:loan/DBtest2/note.dart';
import 'package:loan/screens/addAddress.dart';
import 'package:loan/screens/chooseAddress.dart';
import 'package:loan/screens/loanVisit.dart';
import 'dart:async';
import '../DB/address.dart';
import '../DB/db_helper.dart';

class SaveLocation extends StatefulWidget {
  SaveLocation(this.latitude, this.longitude, this.zoom, this.tilt);
  final double latitude;
  final double longitude;
  final double zoom;
  final double tilt;

  @override
  State<StatefulWidget> createState() =>
      SaveLocationState(latitude, longitude, zoom, tilt);
}

class SaveLocationState extends State<SaveLocation> {
  Future<List<Address>> address;
  final double latitude;
  final double longitude;
  final double zoom;
  final double tilt;
  SaveLocationState(this.latitude, this.longitude, this.zoom, this.tilt);
  TextEditingController addTypeController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  String addType;
  String houseNum;
  int curUserId;
  final formKey = new GlobalKey<FormState>();
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _titleController;
  TextEditingController _descriptionController;
  GoogleMapController _controller;

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      db.saveNote(Note(addType, houseNum)).then((_) {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new AddAddress()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Set location',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF161A1B),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Column(children: [
          Stack(alignment: Alignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: SizedBox(
                  height: (MediaQuery.of(context).viewInsets.bottom == 0)
                      ? MediaQuery.of(context).size.height - 170 - 56 - 82
                      : MediaQuery.of(context).size.height -
                          170 -
                          56 -
                          82 -
                          MediaQuery.of(context).viewInsets.bottom,
                  child: GoogleMap(
                    onMapCreated: onMapCreated,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(latitude, longitude),
                        zoom: zoom,
                        tilt: tilt),
                    compassEnabled: false,
                    mapToolbarEnabled: false,
                    mapType: MapType.normal,
                    rotateGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    indoorViewEnabled: false,
                    myLocationEnabled: false,
                    myLocationButtonEnabled: true,
                  ),
                ),
              ),
            ),
            Positioned(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                child: SvgPicture.asset('images/locationPin.svg'),
                padding: EdgeInsets.only(bottom: 10),
              ),
            )),
          ]),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              // height: 50,
              width: double.infinity,
              // color: Color(0xFFFAEFDC),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Enter Location type',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ),

                          //textfield1
                          TextFormField(
                            controller: addTypeController,
                            cursorColor: Colors.black,
                            validator: (val) =>
                                val.length == 0 ? 'add type' : null,
                            onSaved: (val) => addType = val,
                            decoration: InputDecoration(
                                isDense: true,
                                hintStyle: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9B9B9B)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                hintText: "Home/Office"),
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: 'NunitoSans'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Enter House number/Apartment name',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: 13, color: Colors.black),
                            controller: houseNumController,
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.go,
                            validator: (val) =>
                                val.length == 0 ? 'Enter House Number' : null,
                            onSaved: (val) => houseNum = val,
                            decoration: InputDecoration(
                                isDense: true,
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9B9B9B)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF667975), width: 0.5)),
                                hintText: "No. 5, Alsa apartments"),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          GestureDetector(
                            onTap: () {
                              validate();
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 30, right: 30),
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
                                          'Save Address',
                                          style: TextStyle(
                                              fontFamily: 'NunitoSans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Confirm and proceed',
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
                    )
                  ]))
        ]));
  }
}
