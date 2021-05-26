import 'package:flutter/material.dart';
import 'dart:async';
import 'address.dart';
import 'db_helper.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<List<Address>> address;

  TextEditingController addTypeController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  String addType;
  String houseNum;
  int curUserId;
  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      address = dbHelper.getAddress();
    });
  }

  clearName() {
    addTypeController.text = '';
    houseNumController.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Address a = Address(null, addType, houseNum);
      dbHelper.save(a);
    }
    clearName();
    refreshList();
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: addTypeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'add type'),
              validator: (val) => val.length == 0 ? 'add type' : null,
              onSaved: (val) => addType = val,
            ),
            TextFormField(
              controller: houseNumController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'house num'),
              validator: (val) => val.length == 0 ? 'house num' : null,
              onSaved: (val) => houseNum = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text('ADD'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {});
                    clearName();
                  },
                  child: Text('CANCEL'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Address> address) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('ADDTYPE'),
          ),
          DataColumn(
            label: Text('HOUSENUM'),
          )
        ],
        rows: address
            .map(
              (add) => DataRow(cells: [
                DataCell(
                  add.addType == null ? Text('NA') : Text(add.addType),
                ),
                DataCell(
                  add.houseNum == null ? Text('NA') : Text(add.houseNum),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: address,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter SQLITE CRUD DEMO'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
