import 'package:flutter/material.dart';
import 'package:loan/DBtest2/database_helper.dart';
import 'package:loan/DBtest2/note.dart';

import 'package:loan/screens/loanVisit.dart';
import 'package:loan/screens/setLocation.dart';

import '../services/googleMapWidget.dart';
import 'addAddress.dart';

class ChooseAddress extends StatefulWidget {
  const ChooseAddress({Key key}) : super(key: key);

  @override
  _ChooseAddressState createState() => _ChooseAddressState();
}

void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
  Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => Scaffold(
            body: page,
          )));
}

class _ChooseAddressState extends State<ChooseAddress> {
  List<Note> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllNotes().then((notes) {
      setState(() {
        notes.forEach((note) {
          items.add(Note.fromMap(note));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
      GoogleMaps(latitude: 13.0868122, longitude: 80.1993428),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xFF161A1B),
            ),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddAddress()));
            }),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '  Choose your address',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  '   Select from saved addresses or add a new one',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Expanded(
            child: items.length == 0
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Image(
                          image: AssetImage('images/alert.png'),
                          height: 140,
                        ),
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
                    ),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, position) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            width: double.infinity,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(
                                        image: AssetImage('images/marker.png'),
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${items[position].title}',
                                            style: TextStyle(
                                                fontFamily: 'NunitoSans',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '${items[position].description}',
                                            style: TextStyle(
                                                fontFamily: 'NunitoSans',
                                                fontWeight: FontWeight.w400,
                                                //fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new LoanVisit(
                                                  name:
                                                      '${items[position].title}',
                                                  desc:
                                                      '${items[position].description}',
                                                )));
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFEC4E4E)),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
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
