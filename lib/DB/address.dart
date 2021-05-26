class Address {
  int id;
  String addType;
  String houseNum;
  Address(this.id, this.addType, this.houseNum);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'addType': addType,
      'houseNum': houseNum
    };
    return map;
  }

  Address.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    addType = map['addType'];
    houseNum = map['houseNum'];
  }
}
