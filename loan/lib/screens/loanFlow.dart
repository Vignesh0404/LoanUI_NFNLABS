import 'package:flutter/material.dart';

import 'addAddress.dart';

class LoanFlow extends StatelessWidget {
  const LoanFlow({Key key}) : super(key: key);

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
            onPressed: null),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Loan',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text ',
                      style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xE1FAEFDC),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ₹ 0',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        'minumum amount',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1.19%',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        'starting intrest p.m',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3 months',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        'minumum tenure',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
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
                    padding: const EdgeInsets.only(bottom: 20.0, left: 8),
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
                          width: 7,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'Lorem Ipsum is simply dummy text of',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: 1,
              height: 30,
              color: Color(0xFFFFB631),
            ),
          ),

          // second container
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 8),
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
                          width: 7,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              ' Lorem Ipsum is simply dummy text of.',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: 1,
              height: 25,
              color: Color(0xFFFFB631),
            ),
          ),
          Center(
            child: Container(
              color: Colors.white,
              height: 40,
              width: 160,
              child: Center(
                  child: Text(
                'Lorem Ipsum',
                style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            ),
          ),

          Center(
            child: Container(
              width: 1,
              height: 30,
              color: Color(0xFFFFB631),
            ),
          ),
          //third container

          Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 8),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFEC4E4E)),
                          child: Center(
                              child: Text(
                            '3',
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              ' Lorem Ipsum is simply dummy text of.',
                              style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: 1,
              height: 20,
              color: Color(0xFFFFB631),
            ),
          ),
          Center(
            child: Container(
              color: Colors.white,
              height: 45,
              width: 200,
              child: Center(
                  child: Container(
                width: 150,
                child: Text(
                  "your gold is safely stored in our lending partner's vault",
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black),
                ),
              )),
            ),
          ),

          Spacer(),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddAddress()));
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
                          'Apply Now',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Text(
                          'Schedule visit',
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
