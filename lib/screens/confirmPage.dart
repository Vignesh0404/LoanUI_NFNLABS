import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({this.name, this.desc});
  final String name;
  final String desc;

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('images/Object.png'),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Loan visit',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  'confirmed!',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'VISIT DETAILS',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey.shade800),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/Path.png',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          Text(
                            widget.desc,
                            style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                                //fontSize: 14,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '15 Dec, 2020 | 11:00 AM',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                      Text(
                        ' visit date and time',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'OMV2000001',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                      Text(
                        ' oro visit ID',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Color(0xE1FAEFDC),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please keep your documents ready\nfor your loan visit.',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                Spacer(),
                Text(
                  'view docs',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xFF16A085)),
                ),
                SizedBox(
                  width: 5,
                ),
                Center(
                  child: Container(
                      height: 18,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xE016A084)),
                      child: Text('  >',
                          style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white))),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0x5D7C7C7C),
            child: Row(
              children: [
                Text(
                  '        Changed your mind?  ',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black),
                ),
                Text(
                  'Click here to cancel your visit',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
