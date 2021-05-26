import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoanSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoanSearchState();
}

class LoanSearchState extends State<LoanSearch> {
  TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search for your location',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Start typing to search',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                // Expanded(
                  // child: 
                  TextField(
                    
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    controller: _searchText,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        // isDense: true,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            // contentPadding: EdgeInsets.all(0),

                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9B9B9B)),
                        // labelStyle: TextStyle(fontSize:12),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF667975), width: 0.5)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF667975), width: 0.5)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF667975), width: 0.5)),
                        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Address search eg. pondy bazaar"),
                  ),
                // ),
                Expanded(
                  // height: 400,
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Column(
                          children: [
                            SvgPicture.asset('images/locationLoanIcon.svg'),
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Lorem Ipsum ${index.toString()} ${index.toString()} ${index.toString()}",
                                style: TextStyle(
                                    // fontSize: ,
                                    // fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Lorem Ipsum ${index.toString()} ${index.toString()} ${index.toString()}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6D6D6D))),
                            ]),
                      ],
                    );
                  },
                ))
              ],
            )));
  }
}
