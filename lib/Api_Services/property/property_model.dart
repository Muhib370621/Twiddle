class PropertyModel{

  final String title;
  final String description;
  final price;
  final String type;
  final String bedroom;
  final String kitchen;
  final String parking;
  final String washroom;
  final String tap;
  final String ac;
  final String quarter;
  final String houseNo;
  final String occupationName;
  final String occupationContact;
  final String streetName;
  final String gpsAddress;
  final String floorArea;
  final String realEstate;

  PropertyModel({
    required this.price,
    required this.washroom,
    required this.tap,
    required this.ac,
    required this.quarter,
    required this.houseNo,
    required this.occupationName,
    required this.occupationContact,
    required this.streetName,
    required this.gpsAddress,
    required this.floorArea,
    required this.title,
    required this.description,
    required this.type,
    required this.bedroom,
    required this.kitchen,
    required this.parking,
    required this.realEstate
  });

}