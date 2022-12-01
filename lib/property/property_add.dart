import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_agent/Utilities/comp_screen.dart';
import '../../constants/constants.dart';
import '../bottom_navigation/home/controller/mainScreenController.dart';
import '../constants/dropdowns.dart';
import 'addproperty.dart';

class PropertyAdd extends StatefulWidget {
  String title;

  PropertyAdd({Key? key, this.title = 'List'}) : super(key: key);

  @override
  _PropertyAddState createState() => _PropertyAddState();
}

String? tap, ac, quarters;

class _PropertyAddState extends State<PropertyAdd>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    setState(() {
      tap = null;
      ac = null;
      quarters = null;
    });
    super.initState();
  }

  var floorArea, price;
  final search = TextEditingController();
  final priceController = TextEditingController();
  final title = TextEditingController();
  final desc = TextEditingController();
  String? realEstate;
  var realEstateType = [
    'Commercial Properties',
    'Residential Properties',
    'Industrial Properties',
    'Land'
  ];

  String type = 'Rent';
  String? bedrooms;
  var bedroomQuan = ['2', '3', '4', '5', '6', '7'];

  String? washrooms;
  var washroomsQuan = ['1', '2', '3', '4', '5', '6', '7'];

  String? parking;
  var isParking = ['1', '2', '3', '4'];

  String? kitchens;
  var kitchensQuan = ['1', '2', '3', '4', '5'];

  List<String> floor = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(children: [
                RoundBackButton(),
                SizedBox(width: 20),
                Text("${widget.title} Your Property",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ]),
              SizedBox(height: 30),
              Text(
                "Select Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      radius: 10,
                      text: 'Rent',
                      onTap: () {
                        setState(() {
                          type = 'Rent';
                        });
                      },
                      color: type == 'Rent' ? white : black,
                      buttonColor: type == 'Rent'
                          ? maincolor
                          : maincolor.withOpacity(0.15),
                    ),
                  ),
                  Width(),
                  Expanded(
                    child: Button(
                      radius: 10,
                      text: 'Sale',
                      onTap: () {
                        setState(() {
                          type = 'Sale';
                        });
                      },
                      color: type == 'Sale' ? white : black,
                      buttonColor: type == 'Sale'
                          ? maincolor
                          : maincolor.withOpacity(0.15),
                    ),
                  ),
                  Width(),
                  Expanded(
                    child: Button(
                      radius: 10,
                      text: 'Short Stay',
                      onTap: () {
                        setState(() {
                          type = 'Short Stay';
                        });
                      },
                      color: type == 'Short Stay' ? white : black,
                      buttonColor: type == 'Short Stay'
                          ? maincolor
                          : maincolor.withOpacity(0.15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: Get.width,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: shadowcolor,
                      offset: Offset(0, 5),
                    )
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select Real Estate Type',
                    style: TextStyle(
                        color: maincolor,
                        fontSize: 12,
                        fontFamily: "PoppinsMedium"),
                  ),
                ),
              ),
              SizedBox(height: 1.5),
              Container(
                width: Get.width,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: shadowcolor,
                          offset: Offset(0, 10))
                    ]),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: maincolor,
                    ),
                    isExpanded: true,
                    items: realEstateType
                        .map((value) => DropdownMenuItem(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: PoppinsText(
                                    text: value,
                                    size: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        realEstate = val as String?;
                      });
                    },
                    value: realEstate,
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: PoppinsText(
                          text: 'Commercial',
                          size: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Height(size: 15),
                    PoppinsText(
                        text: "INCLUDE SOME DETAILS",
                        size: 14,
                        fontWeight: FontWeight.w700),
                    Height(size: 15),
                    PoppinsText(text: 'Property Ad Title'),
                    Height(size: 5),
                    MyTextField(
                      height: 50,
                      borderColor: black,
                      controller: title,
                      hint: '',
                      color: white,
                      radius: 5,
                    ),
                    Height(size: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: PoppinsText(
                                text:
                                    "Mention the key features of your item (e.g. brand, model, age, type)",
                                color: hinttext,
                                size: 10)),
                        PoppinsText(text: "0/20")
                      ],
                    ),
                    Height(size: 15),
                    PoppinsText(text: 'Description'),
                    Height(size: 5),
                    MyTextField(
                      height: 100,
                      borderColor: black,
                      controller: desc,
                      hint: '',
                      color: white,
                      radius: 5,
                      maxLines: 4,
                    ),
                    Height(size: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: PoppinsText(
                                text:
                                    "Include condition, features and reason for selling",
                                color: hinttext,
                                size: 10)),
                        PoppinsText(text: "0/400")
                      ],
                    ),
                    Height(size: 20),
                    PoppinsText(text: 'Specifications'),
                    Height(size: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(text: "Bedrooms"),
                                  Height(size: 10),
                                  MyContainer(
                                    borderColor: black,
                                    radius: 5,
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: [
                                              Icon(Icons.arrow_drop_up_sharp,
                                                  size: 20),
                                              Icon(Icons.arrow_drop_down_sharp,
                                                  size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: bedroomQuan
                                              .map((value) => DropdownMenuItem(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      child: PoppinsText(
                                                          text: value,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    value: value,
                                                  ))
                                              .toList(),
                                          onChanged: (selectedAccountType) {
                                            setState(() {
                                              bedrooms = selectedAccountType
                                                  as String?;
                                            });
                                          },
                                          value: bedrooms,
                                          hint: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: PoppinsText(
                                                text: 'Bedrooms',
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          Width(size: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsText(text: "Washrooms"),
                                Height(size: 10),
                                MyContainer(
                                    borderColor: black,
                                    radius: 5,
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: [
                                              Icon(Icons.arrow_drop_up_sharp,
                                                  size: 20),
                                              Icon(Icons.arrow_drop_down_sharp,
                                                  size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: washroomsQuan
                                              .map((value) => DropdownMenuItem(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      child: PoppinsText(
                                                          text: value,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    value: value,
                                                  ))
                                              .toList(),
                                          onChanged: (selectedAccountType) {
                                            setState(() {
                                              washrooms = selectedAccountType
                                                  as String?;
                                            });
                                          },
                                          value: washrooms,
                                          hint: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: PoppinsText(
                                                text: 'Washrooms',
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ]),
                    Height(size: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsText(text: "Car Parking"),
                              Height(size: 10),
                              MyContainer(
                                  borderColor: black,
                                  radius: 5,
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        icon: Column(
                                          children: [
                                            Icon(Icons.arrow_drop_up_sharp,
                                                size: 20),
                                            Icon(Icons.arrow_drop_down_sharp,
                                                size: 20),
                                          ],
                                        ),
                                        isExpanded: true,
                                        items: isParking
                                            .map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.w),
                                                    child: PoppinsText(
                                                        text: value,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  value: value,
                                                ))
                                            .toList(),
                                        onChanged: (selectedAccountType) {
                                          setState(() {
                                            parking =
                                                selectedAccountType as String?;
                                          });
                                        },
                                        value: parking,
                                        hint: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          child: PoppinsText(
                                              text: 'Car Parking',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Width(size: 15),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsText(text: "Kitchens"),
                                Height(size: 10),
                                MyContainer(
                                  borderColor: black,
                                  radius: 5,
                                  child: Center(
                                      child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      icon: Column(
                                        children: [
                                          Icon(Icons.arrow_drop_up_sharp,
                                              size: 20),
                                          Icon(Icons.arrow_drop_down_sharp,
                                              size: 20),
                                        ],
                                      ),
                                      isExpanded: true,
                                      items: kitchensQuan
                                          .map((value) => DropdownMenuItem(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: PoppinsText(
                                                      text: value,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                value: value,
                                              ))
                                          .toList(),
                                      onChanged: (selectedAccountType) {
                                        setState(() {
                                          kitchens =
                                              selectedAccountType as String?;
                                        });
                                      },
                                      value: kitchens,
                                      hint: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: PoppinsText(
                                            text: 'Kitchens',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )),
                                ),
                              ]),
                        )
                      ],
                    ),
                    Height(size: 20),
                    PoppinsText(text: "Area Unit"),
                    Height(size: 10),
                    Button(
                      text: 'Square Meter',
                      width: 150,
                      radius: 5,
                      height: 50,
                    ),
                    Height(size: 20),
                    PoppinsText(text: "Floor Area"),
                    Height(size: 10),
                    MyContainer(
                        borderColor: black,
                        radius: 5,
                        child: Row(
                          children: [
                            Width(size: 10),
                            PoppinsText(text: '㎡', size: 16),
                            Width(size: 10),
                            Container(
                              width: 1,
                              height: 40,
                              color: black,
                            ),
                            Width(size: 10),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Column(
                                    children: [
                                      Icon(Icons.arrow_drop_up_sharp, size: 20),
                                      Icon(Icons.arrow_drop_down_sharp,
                                          size: 20),
                                    ],
                                  ),
                                  isExpanded: true,
                                  items: floor
                                      .map((value) => DropdownMenuItem(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: PoppinsText(
                                                  text: value.toString(),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (selectedAccountType) {
                                    setState(() {
                                      floorArea = selectedAccountType;
                                    });
                                  },
                                  value: floorArea,
                                  hint: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: PoppinsText(
                                        text: 'Floor Area',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Height(size: 20),
                    PoppinsText(text: "Tap Available"),
                    Height(size: 5),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: tap == true ? darkblue : maincolor,
                        onTap: () {
                          setState(() {
                            tap = "Yes";
                          });
                        },
                      ),
                      Width(size: 10),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: tap == false ? hinttext : lightButton,
                        color: black,
                        onTap: () {
                          setState(() {
                            tap = "No";
                          });
                        },
                      ),
                    ]),
                    Height(size: 20),
                    PoppinsText(text: "Air Conditioner Available?"),
                    Height(size: 5),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: ac == true ? darkblue : maincolor,
                        onTap: () {
                          setState(() {
                            ac = "Yes";
                          });
                        },
                      ),
                      Width(size: 10),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: ac == false ? hinttext : lightButton,
                        color: black,
                        onTap: () {
                          setState(() {
                            ac = "No";
                          });
                        },
                      ),
                    ]),
                    Height(size: 20),
                    PoppinsText(text: "Quarters Available?"),
                    Height(size: 5),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: quarters == true ? darkblue : maincolor,
                        onTap: () {
                          setState(() {
                            quarters = "Yes";
                          });
                        },
                      ),
                      Width(size: 10),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: quarters == false ? hinttext : lightButton,
                        color: black,
                        onTap: () {
                          setState(() {
                            quarters = "No";
                          });
                        },
                      ),
                    ]),
                    Height(size: 20),
                    MyContainer(
                      height: 170,
                      radius: 10,
                      color: maincolor,
                      horizontalPadding: 20,
                      verticalPadding: 15,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinsText(
                                text: "Set a Price",
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: white),
                            SizedBox(height: 15),
                            PoppinsText(text: "Price", color: white),
                            SizedBox(height: 15),
                            MyTextField(
                              onEditingComplete: () {
                                setState(() {
                                  price = priceController.text;
                                });
                              },
                              keyboardType: TextInputType.number,
                              height: 50,
                              radius: 5,
                              controller: priceController,
                              color: white,
                              hint: '',
                              icon: PoppinsText(text: 'GHC |'),
                            )
                          ]),
                    ),
                    SizedBox(height: 30),
                    Button(
                      height: 50,
                      text: "Next",
                      onTap: () {
                        if (title.text.isNotEmpty &&
                            desc.text.isNotEmpty &&
                            priceController.text.isNotEmpty) {
                          if (bedrooms == null &&
                              kitchens == null &&
                              washrooms == null &&
                              parking == null &&
                              realEstate == null &&
                              ac == null &&
                              tap == null &&
                              quarters == null &&
                              floorArea == null &&
                              type == null) {
                            Fluttertoast.showToast(
                                msg: 'Please give all requirements');
                          } else {
                            Get.to(() => AddPostScreen(
                                  title: title.text,
                                  desc: desc.text,
                                  price: priceController.text,
                                  bedroom: bedrooms,
                                  washroom: washrooms,
                                  parking: parking,
                                  kitchen: kitchens,
                                  tap: tap,
                                  ac: ac,
                                  quarters: quarters,
                                  floorArea: floorArea,
                                  type: type,
                                  realEstateType: realEstate,
                                  property: widget.title,
                                ));

                            print(
                                '${title.text} ${desc.text} ${priceController.text} ${bedrooms}'
                                '${washrooms} ${parking} ${kitchens} ${tap}'
                                '${ac} ${quarters} ${floorArea} ${type}'
                                '${realEstate} ${widget.title}');
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Please give all requirements');
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}

class AddPostScreen extends StatefulWidget {
  String? title;
  String? price;
  String? desc;
  String? type;
  String? bedroom;
  String? washroom;
  String? parking;
  String? kitchen;
  String? floorArea;
  String? tap;
  String? ac;
  String? quarters;
  String? realEstateType;
  String? property;

  AddPostScreen(
      {Key? key,
      this.title,
      this.desc,
      this.washroom,
      this.parking,
      this.kitchen,
      this.floorArea,
      this.tap,
      this.ac,
      this.quarters,
      this.bedroom,
      this.price ,
      this.type,
      this.realEstateType,
      this.property})
      : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool value1 = false;
  bool value2 = false;
  final houseNo = TextEditingController();
  final streetName = TextEditingController();
  final gpsAddress = TextEditingController();
  final occupationName = TextEditingController();
  final occupationContact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
        Get.put(MainScreenController());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Height(size: 40),
              BackButtonText(
                  text: 'Ad Post', size: 20, fontWeight: FontWeight.bold),
              Height(size: 20),
              PoppinsText(text: "Upload Cover Image", size: 14),
              Height(size: 10),
              PoppinsText(
                  text:
                      'Type: jpg and png. Dimensions 333px x 163px - 999px x 489px',
                  size: 10,
                  fontWeight: FontWeight.w500),
              Height(size: 15),
              coverImage == null
                  ? GestureDetector(
                      onTap: () {
                        getCoverImage();
                        print(coverImage!.path);
                      },
                      child: MyContainer(
                        height: 80,
                        width: 80,
                        radius: 10,
                        borderColor: black,
                        child: Icon(Icons.photo_camera_outlined, size: 30),
                      ),
                    )
                  : Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: black, width: 1),
                          image: DecorationImage(
                              image: FileImage(File(coverImage!.path)))),
                    ),
              Height(),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),
              Height(size: 20),
              PoppinsText(text: 'Upload Upto 6 Photos', size: 14),
              Height(),
              PoppinsText(text: 'Type: jpg and png.', size: 10),
              Height(),
              Row(
                children: [
                  image1 == null
                      ? GestureDetector(
                          onTap: () {
                            getImage1();
                            print(image1!.path);
                          },
                          child: MyContainer(
                            height: 80,
                            width: 80,
                            radius: 10,
                            borderColor: black,
                            child: Icon(Icons.add_a_photo, size: 30),
                          ),
                        )
                      : Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: black, width: 1),
                              image: DecorationImage(
                                  image: FileImage(File(image1!.path)))),
                        ),
                  Width(size: 35),
                  image2 == null
                      ? GestureDetector(
                    onTap: () {
                      getImage2();
                      print(image2!.path);
                    },
                    child: MyContainer(
                      height: 80,
                      width: 80,
                      radius: 10,
                      borderColor: black,
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                  )
                      : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: black, width: 1),
                        image: DecorationImage(
                            image: FileImage(File(image2!.path)))),
                  ),
                  Width(size: 35),
                  image3 == null
                      ? GestureDetector(
                    onTap: () {
                      getImage3();
                      print(image3!.path);
                    },
                    child: MyContainer(
                      height: 80,
                      width: 80,
                      radius: 10,
                      borderColor: black,
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                  )
                      : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: black, width: 1),
                        image: DecorationImage(
                            image: FileImage(File(image3!.path)))),
                  ),
                  Width(size: 35),
                ],
              ),
              Height(
                size: 15.h,
              ),
              Row(
                children: [
                  image4 == null
                      ? GestureDetector(
                    onTap: () {
                      getImage4();
                      print(image4!.path);
                    },
                    child: MyContainer(
                      height: 80,
                      width: 80,
                      radius: 10,
                      borderColor: black,
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                  )
                      : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: black, width: 1),
                        image: DecorationImage(
                            image: FileImage(File(image4!.path)))),
                  ),
                  Width(size: 35),
                  image5 == null
                      ? GestureDetector(
                    onTap: () {
                      getImage5();
                      print(image5!.path);
                    },
                    child: MyContainer(
                      height: 80,
                      width: 80,
                      radius: 10,
                      borderColor: black,
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                  )
                      : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: black, width: 1),
                        image: DecorationImage(
                            image: FileImage(File(image5!.path)))),
                  ),
                  Width(size: 35),
                  image6 == null
                      ? GestureDetector(
                    onTap: () {
                      getImage6();
                      print(image6!.path);
                    },
                    child: MyContainer(
                      height: 80,
                      width: 80,
                      radius: 10,
                      borderColor: black,
                      child: Icon(Icons.add_a_photo, size: 30),
                    ),
                  )
                      : Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: black, width: 1),
                        image: DecorationImage(
                            image: FileImage(File(image6!.path)))),
                  ),
                  Width(size: 35),
                ],
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),
              Height(size: 20),
              PoppinsText(text: 'Upload Upto One 360 View Image', size: 14),
              Height(
                size: 15,
              ),
              MyContainer(
                height: 80,
                width: 80,
                radius: 10,
                borderColor: black,
                child: Center(
                    child: MyContainer(
                        child: Image.asset("assets/view.png"),
                        width: 40,
                        height: 40)),
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),
              Height(size: 20),
              PoppinsText(text: 'Upload Upto One Video', size: 14),
              Height(
                size: 15,
              ),
              MyContainer(
                height: 80,
                width: 80,
                radius: 10,
                borderColor: black,
                child: Icon(Icons.video_call_outlined, size: 30),
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 10mb.', color: redtext, size: 10),
              PoppinsText(
                  text:
                      'For the cover picture we recommend using the landscape mode.',
                  size: 10),
              Height(
                size: 18,
              ),
              PoppinsText(
                  text: 'PROPERTY DETAILS FORM',
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: maincolor),
              Height(),
              PoppinsText(text: 'House Number'),
              Height(),
              MyTextField(
                height: 50,
                borderColor: black,
                hint: '',
                color: white,
                radius: 5,
                controller: houseNo,
              ),
              Height(size: 15),
              PoppinsText(text: 'Street Name'),
              Height(),
              MyTextField(
                height: 50,
                borderColor: black,
                hint: '',
                color: white,
                radius: 5,
                controller: streetName,
              ),
              Height(size: 15),
              PoppinsText(text: 'Full Address'),
              Height(),
              MyTextField(
                height: 50,
                borderColor: black,
                hint: '',
                color: white,
                radius: 10,
                controller: gpsAddress,
              ),
              Height(size: 15),
              PoppinsText(
                text: "Location of property identified through Google Map",
                color: hinttext,
                size: 10,
              ),
              Height(size: 15),
              PoppinsText(
                  text: " PROPERTY DOCUMENTATION COPY",
                  fontWeight: FontWeight.w500),
              Height(),
              Iconbutton(
                width: 120,
                height: 40,
                icon: Icons.add_a_photo,
                text: 'Upload',
                buttonColor: Color(0xff1492E6),
                radius: 10,
              ),
              Height(),
              PoppinsText(
                  text:
                      'Property Documentation Copy Upload Pdf Or Image* E.G. Copy Of Site Plan, Photo Of House Number Label, Bank Statement Or A Utility Bill, That Bears The Name Of Property Owner, Etc.',
                  size: 10,
                  color: hinttext),

              Height(
                size: 15,
              ),
              Row(children: [
                Checkbox(
                  value: value1,
                  onChanged: (value) {
                    setState(() {
                      value1 = !value1;
                    });
                  },
                ),
                SizedBox(width: 3),
                PoppinsText(
                    text: "Letter Of Consent Agreement",
                    decoration: TextDecoration.underline),
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Checkbox(
                  value: value2,
                  onChanged: (value) {
                    setState(() {
                      value2 = !value2;
                    });
                  },
                ),
                Width(),
                Expanded(
                    child: PoppinsText(
                        text:
                            'Must Agree To A 4% Mediation Fees To Twiddle Through Funders.'))
              ]),
              Height(size: 40),
              Button(
                  height: 50,
                  text: "Post",
                  onTap: () {
                    if (houseNo.text.isNotEmpty &&
                        streetName.text.isNotEmpty &&
                        gpsAddress.text.isNotEmpty
                        ) {
                      if (value1 == true && value2 == true) {
                         {
                          // addProperty(
                          //     '${widget.title}',
                          //     widget.desc,
                          //     widget.bedroom,
                          //     widget.washroom,
                          //     widget.parking,
                          //     widget.kitchen,
                          //     widget.tap,
                          //     widget.ac,
                          //     widget.quarters,
                          //     widget.type,
                          //     houseNo.text,
                          //     occupationName.text,
                          //     occupationContact.text.trim(),
                          //     streetName.text,
                          //     gpsAddress.text,
                          //     widget.price,
                          //     widget.floorArea
                          // );
                          mainScreenController.postProperty(
                              widget.type!,
                              widget.type!,
                              '${widget.title}',
                              widget.desc!,
                              widget.bedroom!,
                              widget.washroom!,
                              widget.parking!,
                              widget.kitchen!,
                              widget.floorArea!,
                              widget.tap!,
                              widget.ac!,
                              widget.quarters!,
                              widget.price!,
                              gpsAddress.text,
                              houseNo.text,
                              streetName.text,
                              coverImage!,
                              image1!,
                              image2!,
                              image3!,
                              image4!,
                              image5!,
                              image6!,
                              image3!,
                              image3!,
                          );
                          print(
                           " ${widget.type!} ${widget.type!} '${widget.title}' ${widget.desc!} ${widget.bedroom!} ${widget.washroom!} ${widget.parking!} ${widget.kitchen!}"
                            "${widget.floorArea} ${widget.tap!} ${widget.ac!} ${widget.quarters!} ${widget.price!} ${gpsAddress.text} ${houseNo.text} ${streetName.text}"
                            "${coverImage!.path} ${image1!.path} ${image2!.path} ${image3!.path} ${image4!.path} ${image5!.path} ${image6!.path} ${image3!.path} ${image3!.path}"
                          );
                        }
                      } else {
                        Fluttertoast.showToast(msg: 'Accept terms & policies');
                      }
                    }
                  }),
              Height(size: 30)
            ],
          ),
        ),
      ),
    );
  }
  File? coverImage;
  File? image1;
  File? image2;
  File? image3;
  File? image4;
  File? image5;
  File? image6;


  captureImage() async {
    final _picked = ImagePicker();
    PickedFile? image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      image = await _picked.getImage(source: ImageSource.camera);

      var file = File(image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image1 = file;
        });
        print(image1);
        return image1;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getCoverImage() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          coverImage = file;
        });
        print(coverImage);
        return coverImage;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage1() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image1 = file;
        });
        print(image1);
        return image1;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage2() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image2 = file;
        });
        print(image2);
        return image2;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage3() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image3 = file;
        });
        print(image3);
        return image3;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage4() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image4 = file;
        });
        print(image4);
        return image4;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage5() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image5 = file;
        });
        print(image5);
        return image5;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage6() async {
    final _picked = ImagePicker();
    PickedFile? _image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      _image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(_image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          image6 = file;
        });
        print(image6);
        return image6;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }
}

Widget MyIconContainer(IconData icon, double size) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xff707070), width: 1),
        borderRadius: BorderRadius.circular(13)),
    child: Icon(icon, size: size),
  );
}
