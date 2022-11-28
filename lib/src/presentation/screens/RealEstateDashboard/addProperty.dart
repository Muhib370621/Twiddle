import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/RealEstateDashboard/iconButton.dart';
import '../../components/RealEstateDashboard/myContainer.dart';
import '../../components/RealEstateDashboard/myTextField.dart';
import '../../components/RealEstateDashboard/roundBackButton.dart';
import '../../components/button.dart';

class PropertyAdd extends StatefulWidget {
  String title;

  PropertyAdd({Key? key, this.title = 'List'}) : super(key: key);

  @override
  _PropertyAddState createState() => _PropertyAddState();
}

bool? tap, ac, quarters;

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

  List<int> floor = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.kWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Row(children: [
                RoundBackButton(),
                SizedBox(width: 3.w),
                Text("${widget.title} Your Property",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ]),
              SizedBox(height: 3.h),
              Text(
                "Select Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
               SizedBox(height: 2.h
               ),
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
                      color: type == 'Rent'
                          ? AppColors.kWhite
                          : AppColors.welcomeTwiddle,
                      buttonColor: type == 'Rent'
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.15),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Button(
                      radius: 10,
                      text: 'Sale',
                      onTap: () {
                        setState(() {
                          type = 'Sale';
                        });
                      },
                      color: type == 'Sale'
                          ? AppColors.kWhite
                          : AppColors.welcomeTwiddle,
                      buttonColor: type == 'Sale'
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.15),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Button(
                      radius: 10,
                      text: 'Short Stay',
                      onTap: () {
                        setState(() {
                          type = 'Short Stay';
                        });
                      },
                      color: type == 'Short Stay'
                          ? AppColors.kWhite
                          : AppColors.welcomeTwiddle,
                      buttonColor: type == 'Short Stay'
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.15),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 2.h),
              Container(
                width: Get.width,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: AppColors.mainBg,
                      offset: Offset(0, 5),
                    )
                  ],
                  color: Colors.white,
                ),
                child:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select Real Estate Type',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 14.sp,
                        fontFamily: "PoppinsMedium"),
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Container(
                width: Get.width,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: AppColors.mainBg,
                          offset: Offset(0, 3))
                    ]),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon:  const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.mainColor,
                    ),
                    isExpanded: true,
                    items: realEstateType
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
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
                      child: Text(
                        'Commercial',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      "INCLUDE SOME DETAILS",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2.h),
                    const Text('Property Ad Title'),
                    SizedBox(height: 2.h),
                    MyTextField(
                      height: 4.h,
                      borderColor: Colors.black,
                      controller: title,
                      hint: 'abc',
                      color: AppColors.mainBg,
                      radius: 5,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              "Mention the key features of your item (e.g. brand, model, age, type)",
                              style: TextStyle(
                                  color: AppColors.kLightGrey,
                                  fontSize: 14.sp)),
                        ),
                        Text("0/20")
                      ],
                    ),
                    SizedBox(height: 7.h),
                    Text('Description'),
                    SizedBox(height: 2.h),
                    MyTextField(
                      height: 100,
                      borderColor: AppColors.welcomeTwiddle,
                      controller: desc,
                      hint: '',
                      color: AppColors.kWhite,
                      radius: 5,
                      maxLines: 4,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              "Include condition, features and reason for selling",
                              style: TextStyle(
                                  color: AppColors.kGreenAccent,
                                  fontSize: 10.sp)),
                        ),
                        Text("0/400")
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text('Specifications'),
                    SizedBox(height: 7.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bedrooms"),
                                  SizedBox(height: 5.h),
                                  MyContainer(
                                    borderColor: AppColors.welcomeTwiddle,
                                    radius: 5,
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: const [
                                              Icon(Icons.arrow_drop_up_sharp,
                                                  size: 20),
                                              Icon(Icons.arrow_drop_down_sharp,
                                                  size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: bedroomQuan
                                              .map((value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      child: Text(
                                                        value,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
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
                                            child: const Text(
                                              'Bedrooms',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Washrooms"),
                                SizedBox(height: 5.h),
                                MyContainer(
                                    borderColor: AppColors.welcomeTwiddle,
                                    radius: 5,
                                    child: Center(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: const [
                                              Icon(Icons.arrow_drop_up_sharp,
                                                  size: 20),
                                              Icon(Icons.arrow_drop_down_sharp,
                                                  size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: washroomsQuan
                                              .map((value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      child: Text(
                                                        value,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
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
                                            child: const Text(
                                              'Washrooms',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ]),
                    SizedBox(height: 7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Car Parking"),
                              SizedBox(height: 5.h),
                              MyContainer(
                                  borderColor: AppColors.welcomeTwiddle,
                                  radius: 5,
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        icon: Column(
                                          children: const [
                                            Icon(Icons.arrow_drop_up_sharp,
                                                size: 20),
                                            Icon(Icons.arrow_drop_down_sharp,
                                                size: 20),
                                          ],
                                        ),
                                        isExpanded: true,
                                        items: isParking
                                            .map((value) => DropdownMenuItem(
                                                  value: value,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.w),
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
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
                                            child: const Text(
                                              'Car Parking',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Kitchens"),
                                SizedBox(height: 5.h),
                                MyContainer(
                                  borderColor: AppColors.welcomeTwiddle,
                                  radius: 5,
                                  child: Center(
                                      child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      icon: Column(
                                        children: const [
                                          Icon(Icons.arrow_drop_up_sharp,
                                              size: 20),
                                          Icon(Icons.arrow_drop_down_sharp,
                                              size: 20),
                                        ],
                                      ),
                                      isExpanded: true,
                                      items: kitchensQuan
                                          .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
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
                                        child: const Text(
                                          'Kitchens',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  )),
                                ),
                              ]),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    const Text("Area Unit"),
                    SizedBox(height: 7.h),
                    Button(
                      text: 'Square Meter',
                      width: 150,
                      radius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 10.h),
                    const Text("Floor Area"),
                    SizedBox(height: 7.h),
                    MyContainer(
                        borderColor: AppColors.welcomeTwiddle,
                        radius: 5,
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Text(
                              '㎡',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 1,
                              height: 40,
                              color: AppColors.welcomeTwiddle,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Column(
                                    children: const [
                                      Icon(Icons.arrow_drop_up_sharp, size: 20),
                                      Icon(Icons.arrow_drop_down_sharp,
                                          size: 20),
                                    ],
                                  ),
                                  isExpanded: true,
                                  items: floor
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Text(
                                                value.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (selectedAccountType) {
                                    setState(() {
                                      floorArea = selectedAccountType as int?;
                                    });
                                  },
                                  value: floorArea,
                                  hint: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: const Text(
                                      'Floor Area',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 10.h),
                    const Text("Tap Available"),
                    SizedBox(height: 2.h),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: tap == true
                            ? AppColors.darkblue
                            : AppColors.mainColor,
                        onTap: () {
                          setState(() {
                            tap = true;
                          });
                        },
                      ),
                      SizedBox(width: 10.w),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: tap == false
                            ? AppColors.kLightGrey
                            : AppColors.kGreenAccent,
                        color: AppColors.welcomeTwiddle,
                        onTap: () {
                          setState(() {
                            tap = false;
                          });
                        },
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    const Text("Air Conditioner Available?"),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: ac == true
                            ? AppColors.darkblue
                            : AppColors.mainColor,
                        onTap: () {
                          setState(() {
                            ac = true;
                          });
                        },
                      ),
                      SizedBox(width: 10.w),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: ac == false
                            ? AppColors.kLightGrey
                            : AppColors.kGreenAccent,
                        color: AppColors.welcomeTwiddle,
                        onTap: () {
                          setState(() {
                            ac = false;
                          });
                        },
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    const Text("Quarters Available?"),
                    SizedBox(height: 2.h),
                    Row(children: [
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "Yes",
                        buttonColor: quarters == true
                            ? AppColors.darkblue
                            : AppColors.mainColor,
                        onTap: () {
                          setState(() {
                            quarters = true;
                          });
                        },
                      ),
                      SizedBox(width: 10.w),
                      Button(
                        width: 80,
                        height: 40,
                        radius: 5,
                        text: "No",
                        buttonColor: quarters == false
                            ? AppColors.kLightGrey
                            : AppColors.kGreenAccent,
                        color: AppColors.welcomeTwiddle,
                        onTap: () {
                          setState(() {
                            quarters = false;
                          });
                        },
                      ),
                    ]),
                    SizedBox(height: 10.h),
                    MyContainer(
                      height: 170,
                      radius: 10,
                      color: AppColors.mainColor,
                      horizontalPadding: 20,
                      verticalPadding: 15,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Set a Price",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kWhite,
                              ),
                            ),
                            SizedBox(height: 15),
                            const Text(
                              "Price",
                              style: TextStyle(color: AppColors.kWhite),
                            ),
                            SizedBox(height: 15),
                            MyTextField(
                              onEditingComplete: () {
                                setState(() {
                                  price = int.parse(priceController.text);
                                });
                              },
                              keyboardType: TextInputType.number,
                              height: 50,
                              radius: 5,
                              controller: priceController,
                              color: AppColors.kWhite,
                              hint: '',
                              icon: Text('GHC |'),
                            )
                          ]),
                    ),
                    SizedBox(height: 10.h),
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
                                  price: price,
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

                            // print(
                            //   '${title.text} ${desc.text} ${price} ${bedrooms}'
                            //   '${washrooms} ${parking} ${kitchens} ${tap}'
                            //       '${ac} ${quarters} ${floorArea} ${type}'
                            //       '${realEstate}'
                            // );

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
  int price;
  String? desc;
  String? type;
  String? bedroom;
  String? washroom;
  String? parking;
  String? kitchen;
  int floorArea;
  bool? tap;
  bool? ac;
  bool? quarters;
  String? realEstateType;
  String? property;

  AddPostScreen(
      {Key? key,
      this.title,
      this.desc,
      this.washroom,
      this.parking,
      this.kitchen,
      this.floorArea = 0,
      this.tap,
      this.ac,
      this.quarters,
      this.bedroom,
      this.price = 0,
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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              BackButtonText(
                  text: 'Ad Post', size: 20, fontWeight: FontWeight.bold),
              SizedBox(height: 10.h),
              const Text(
                "Upload Cover Image",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 5.h),
              Text(
                'Type: jpg and png. Dimensions 333px x 163px - 999px x 489px',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 7.h),
              image1 == null
                  ? GestureDetector(
                      onTap: () {
                        // captureImage();
                        // print(image1!.path);
                      },
                      child: MyContainer(
                        height: 80,
                        width: 80,
                        radius: 10,
                        borderColor: AppColors.welcomeTwiddle,
                        child: Icon(Icons.photo_camera_outlined, size: 30),
                      ),
                    )
                  : Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.welcomeTwiddle, width: 1),
                        // image: DecorationImage(
                        //     image: FileImage(File(image1!.path)))),
                      ),
                    ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Maximum size 2mb.',
                style: TextStyle(color: AppColors.redText, fontSize: 10.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Upload Upto 6 Photos',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Type: jpg and png.',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                  children: List.generate(
                      3,
                      (index) => Row(
                            children: [
                              MyContainer(
                                height: 80,
                                width: 80,
                                radius: 10,
                                borderColor: AppColors.welcomeTwiddle,
                                child: const Icon(Icons.add_a_photo_outlined,
                                    size: 30),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ))),
              SizedBox(
                height: 2.h,
              ),
              Row(
                  children: List.generate(
                      3,
                      (index) => Row(
                            children: [
                              MyContainer(
                                height: 80,
                                width: 80,
                                radius: 10,
                                borderColor: AppColors.welcomeTwiddle,
                                child: const Icon(Icons.add_a_photo_outlined,
                                    size: 30),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ))),
              SizedBox(height: 7.h),
              Text(
                'Maximum size 2mb.',
                style: TextStyle(color: AppColors.redText, fontSize: 10.sp),
              ),
              SizedBox(height: 7.h),
              Text(
                'Upload Upto One 360 View Image',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 7.h),
              MyContainer(
                height: 80,
                width: 80,
                radius: 10,
                borderColor: AppColors.welcomeTwiddle,
                child: Center(
                    child: MyContainer(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/view.png"))),
              ),
              SizedBox(height: 7.h),
              Text(
                'Maximum size 2mb.',
                style: TextStyle(color: AppColors.redText, fontSize: 10.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                'Upload Upto One Video',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 7.h),
              MyContainer(
                height: 80,
                width: 80,
                radius: 10,
                borderColor: AppColors.welcomeTwiddle,
                child: const Icon(Icons.video_call_outlined, size: 30),
              ),
              SizedBox(height: 7.h),
              Text(
                'Maximum size 10mb.',
                style: TextStyle(color: AppColors.redText, fontSize: 10.sp),
              ),
              Text(
                'For the cover picture we recommend using the landscape mode.',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                'PROPERTY DETAILS FORM',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text('House Number'),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                height: 50,
                borderColor: AppColors.welcomeTwiddle,
                hint: '',
                color: AppColors.kWhite,
                radius: 5,
                controller: houseNo,
              ),
              SizedBox(height: 7.h),
              Text('Street Name'),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                height: 50,
                borderColor: AppColors.welcomeTwiddle,
                hint: '',
                color: AppColors.kWhite,
                radius: 5,
                controller: streetName,
              ),
              SizedBox(height: 7.h),
              Text('GPS Address'),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                height: 50,
                borderColor: AppColors.welcomeTwiddle,
                hint: '',
                color: AppColors.kWhite,
                radius: 10,
                controller: gpsAddress,
              ),
              SizedBox(height: 7.h),
              Text(
                "Location of property identified through Google Map",
                style: TextStyle(
                  color: AppColors.kLightGrey,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 15.sp),
              Text(
                " PROPERTY DOCUMENTATION COPY",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2.h,
              ),
              Iconbutton(
                width: 120,
                height: 40,
                icon: Icons.add_a_photo,
                text: 'Upload',
                buttonColor: Color(0xff1492E6),
                radius: 10,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Property Documentation Copy Upload Pdf Or Image* E.G. Copy Of Site Plan, Photo Of House Number Label, Bank Statement Or A Utility Bill, That Bears The Name Of Property Owner, Etc.',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.kLightGrey,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text('Current Occupant\'s Name'),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                height: 50,
                borderColor: AppColors.welcomeTwiddle,
                hint: '',
                color: AppColors.kWhite,
                radius: 10,
                controller: occupationName,
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 7.h,
              ),
              Text('Current Occupant\'s Contact'),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                height: 50,
                borderColor: AppColors.welcomeTwiddle,
                hint: '',
                color: AppColors.kWhite,
                radius: 10,
                controller: occupationContact,
              ),
              SizedBox(
                height: 7.h,
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
                Text(
                  "Letter Of Consent Agreement",
                  style: TextStyle(decoration: TextDecoration.underline),
                )
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
                SizedBox(
                  width: 2.w,
                ),
                const Expanded(
                    child: Text(
                        'Must Agree To A 4% Mediation Fees To Twiddle Through Funders.'))
              ]),
              SizedBox(height: 15.h),
              Button(
                  height: 50,
                  text: "Post",
                  onTap: () {
                    if (houseNo.text.isNotEmpty &&
                        streetName.text.isNotEmpty &&
                        gpsAddress.text.isNotEmpty &&
                        occupationName.text.isNotEmpty &&
                        occupationContact.text.isNotEmpty) {
                      if (value1 == true && value2 == true) {
                        if (widget.property == 'Update') {
                        } else {
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
                          //     widget.floorArea);
                        }
                      } else {
                        Fluttertoast.showToast(msg: 'Accept terms & policies');
                      }
                    } else {
                      Fluttertoast.showToast(msg: 'Enter all fields');
                    }
                  }),
              SizedBox(height: 15.h)
            ],
          ),
        ),
      ),
    );
  }

  File? image1;
  File? image2;
  File? image3;
  File? image4;
  File? image5;
  File? image6;

//   captureImage() async {
//     final _picked = ImagePicker();
//     PickedFile? image;
//
//     /// Check Permissions
//     await Permission.phone.request();
//
//     var permissionStatus = await Permission.photos.status;
//
//     if (permissionStatus.isGranted) {
//       /// Select Image
//       image = await _picked.getImage(source: ImageSource.camera);
//
//       var file = File(image.path);
//       //String fileName = Uuid().v1();
//
//       if (file != null) {
//         setState(() {
//           image1 = file;
//         });
//         print(image1);
//         return image1;
//       } else {
//         Fluttertoast.showToast(msg: 'No image received');
//       }
//     } else {
//       Fluttertoast.showToast(msg: 'Grant Permissions and try again');
//     }
//   }
//
//   getImage(File image) async {
//     final _picked = ImagePicker();
//     PickedFile? _image;
//
//     /// Check Permissions
//     await Permission.phone.request();
//
//     var permissionStatus = await Permission.photos.status;
//
//     if (permissionStatus.isGranted) {
//       /// Select Image
//       _image = await _picked.getImage(source: ImageSource.gallery);
//
//       var file = File(_image!.path);
//       //String fileName = Uuid().v1();
//
//       if (file != null) {
//         setState(() {
//           image = file;
//         });
//         print(image);
//         return image;
//       } else {
//         Fluttertoast.showToast(msg: 'No image received');
//       }
//     } else {
//       Fluttertoast.showToast(msg: 'Grant Permissions and try again');
//     }
//   }
// }

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
}
