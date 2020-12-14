import 'package:flutter/material.dart';
import 'package:loan/screens/chooseAddress.dart';
import 'package:loan/screens/loanVisit.dart';

import 'loanFlow.dart';
import 'noAddress.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF161A1B),
            ),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LoanFlow()));
            }),
        actions: [
          Row(
            children: [
              FlatButton(
                onPressed: null,
                child: Container(
                  height: 30,
                  width: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 1, color: Colors.grey.shade700)
                      //color: Color(0xD2B7043D),
                      ),
                  child: Center(
                      child: Text(
                    'support',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: Row(
              children: [
                Image.asset(
                  'images/loanVisit.png',
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Loan Visit',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 73,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 8),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFEC4E4E)),
                          child: Center(
                              child: Text(
                            '1',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add your address',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                'Choose from saved addresses or add a new one',
                                style: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new ChooseAddress()));
                  },
                  child: Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xFFEC4E4E),
                    ),
                    child: Center(
                        child: Text(
                      'Add address',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // second container
          Container(
            height: 73,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFEC4E4E)),
                        child: Center(
                            child: Text(
                          '2',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select date and time',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              'Choose a preferred date and time for the visit',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xFFFAEFDC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You will get a call from to confirm',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Colors.black),
                ),
                Text(
                  'your instant Gold loan visit.',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
              child: Container(
                height: 40,
                color: Color(0xFF9B9B9B),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Request Visit',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      Text(
                        'Save details and proceed',
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
          )
        ],
      ),
    );
  }
}
