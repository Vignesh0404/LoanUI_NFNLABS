import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'setLocation.dart';
import '../services/search_restfulApi.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<Location> newLocation;
  @override
  void initState() {
    super.initState();
    newLocation = fetchLocation('');
  }

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for your location',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            Text(
              'Start typing to search',
              style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: searchText,
              decoration: new InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                hintText: "Address search eg. pondy bazzar ",
                hintStyle: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade800),
              ),
              onChanged: (text) {
                setState(() {
                  newLocation = fetchLocation(searchText.text);
                });
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder<Location>(
              future: newLocation,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.only(right: 10),
                      itemCount: (snapshot.data.results.length >= 8
                          ? 8
                          : snapshot.data.results.length),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            var location =
                                snapshot.data.results[index]["geometry"];
                            int count = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetLocation(
                                        latitude: location["location"]["lat"],
                                        longitude: location["location"]
                                            ["lng"])));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/searchMarker.png',
                                    scale: 1,
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    snapshot.data.results[index]
                                        ['formatted_address'],
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      snapshot.data.results[index]
                                          ['formatted_address'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NunitoSans',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6D6D6D))),
                                ],
                              ))
                            ],
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Text('.....');
              },
            ))
          ],
        ),
      ),
    );
  }
}
