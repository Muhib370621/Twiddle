import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:state_agent/Utilities/comp_screen.dart';

import '../../../constants/constants.dart';
import 'add_post.dart';


class AddProperty extends StatefulWidget {
  String title;
  AddProperty({Key? key, this.title = 'List'}) : super(key: key);
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

bool? tap, ac, quarters;
class _AddPropertyState extends State<AddProperty> with SingleTickerProviderStateMixin{

  var floorArea, price;

  final priceController = TextEditingController();
  final title = TextEditingController();
  final desc = TextEditingController();


  String? selectedPropertyType;
  var propertyType = [
    'Commercial Properties', 'Residential Properties', 'Industrial Properties', 'Land'
  ];

  String? bedrooms;
  var bedroomQuan = [
    '2', '3', '4', '5','6', '7'
  ];

  String? washrooms;
  var washroomsQuan = [
    '1', '2', '3', '4','5', '6', '7'
  ];

  String? parking;
  var isParking = [
    '1', '2', '3', '4'
  ];

  String? kitchens;
  var kitchensQuan = [
    '1', '2', '3', '4','5'
  ];


  List<int> floor = [
    1, 2, 3, 4, 5
  ];

  TabController? _tabContListP;

  @override
  void initState() {
    _tabContListP = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabContListP!.dispose();
  }
final search = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body:DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 40),
              Row(
                  children: [
                    RoundBackButton(),
                    SizedBox(width: 20),
                    Text("${widget.title} Your Property", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                  ]
              ),


              SizedBox(height: 30),
              Text("Select Category", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 15),
              Container(
                height: 45,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xffEAEEFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0336FF),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,

                  tabs: [
                    Tab(text: 'Rent'),
                    Tab(text: 'Sales'),
                    Tab(text: 'Short Stay'),
                  ],
                ),
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
                child:   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Select Real Estate Type', style: TextStyle(color: maincolor, fontSize: 12, fontFamily: "PoppinsMedium"),),
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
                          offset: Offset(0, 10)
                      )
                    ]),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                    isExpanded: true,
                    items: propertyType.map((value) => DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: PoppinsText(text: value, size: 12, fontWeight: FontWeight.w500),
                      ),
                      value: value,

                    )).toList(),
                    onChanged: (val){
                      setState(() {
                        selectedPropertyType = val as String?;

                      });
                    },
                    value: selectedPropertyType,
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: PoppinsText(text: 'Commercial', size: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),


              Expanded(
                  child: TabBarView(
                    children: [

                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Height(size: 15),
                            PoppinsText(text: "INCLUDE SOME DETAILS", size: 14, fontWeight: FontWeight.w700),

                            Height(size: 15),
                            PoppinsText(text: 'Property Ad Title'),
                            Height(size: 5),
                            MyTextField(
                              height: 50, borderColor: black,
                              controller: title, hint: '',
                              color: white, radius: 5,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Mention the key features of your item (e.g. brand, model, age, type)",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/20")
                              ],
                            ),
                            Height(size: 15),
                            PoppinsText(text: 'Description'),
                            Height(size: 5),
                            MyTextField(
                              height: 100, borderColor: black,
                              controller: desc, hint: '',
                              color: white, radius: 5, maxLines: 4,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Include condition, features and reason for selling",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/400")
                              ],
                            ),



                            Height(size: 20),
                            PoppinsText(text: 'Specifications'),
                            Height(size: 15),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText(text: "Bedrooms"),
                                        Height(size: 10),
                                        MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: bedroomQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    bedrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: bedrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Bedrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Washrooms"),
                                      Height(size: 10),
                                      MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: washroomsQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    washrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: washrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Washrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],)
                                ]
                            ),
                            Height(size: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Car Parking"),
                                    Height(size: 10),
                                    MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              icon: Column(
                                                children: [
                                                  Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                  Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                ],
                                              ),
                                              isExpanded: true,
                                              items: isParking.map((value) => DropdownMenuItem(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                ),
                                                value: value,

                                              )).toList(),
                                              onChanged: (selectedAccountType){
                                                setState(() {
                                                  parking = selectedAccountType as String?;

                                                });
                                              },
                                              value: parking,
                                              hint: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                child: PoppinsText(text: 'Car Parking', fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )),

                                  ],),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Kitchens"),
                                      Height(size: 10),
                                      MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: kitchensQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    kitchens = selectedAccountType as String?;

                                                  });
                                                },
                                                value: kitchens,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Kitchens', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            )),
                                      ),

                                    ])
                              ],),
                            Height(size: 20),

                            PoppinsText(text: "Area Unit"),
                            Height(size: 10),
                            Button(
                              text: 'Square Meter',
                              width: 150, radius: 5, height: 50,
                            ),

                            Height(size: 20),
                            PoppinsText(text: "Floor Area"),
                            Height(size: 10),
                            MyContainer(
                                borderColor: black, radius: 5,
                                child: Row(
                                  children: [

                                    Width(size: 10),
                                    PoppinsText(text: '㎡', size: 16),
                                    Width(size: 10),
                                    Container(
                                      width: 1, height: 40,
                                      color: black,
                                    ),
                                    Width(size: 10),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: [
                                              Icon(Icons.arrow_drop_up_sharp, size: 20),
                                              Icon(Icons.arrow_drop_down_sharp, size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: floor.map((value) => DropdownMenuItem(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                                              child: PoppinsText(text: value.toString(), fontWeight: FontWeight.w500),
                                            ),
                                            value: value,

                                          )).toList(),
                                          onChanged: (selectedAccountType){
                                            setState(() {
                                              floorArea = selectedAccountType as int?;

                                            });
                                          },
                                          value: floorArea,
                                          hint: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                                            child: PoppinsText(text: 'Floor Area', fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                            ),

                            Height(size: 20),


                            PoppinsText(text: "Tap Available"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: tap == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    tap = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: tap == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    tap = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),


                            PoppinsText(text: "Air Conditioner Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: ac == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    ac = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: ac == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    ac = false;
                                  });
                                },

                              ),
                            ]),


                            Height(size: 20),
                            PoppinsText(text: "Quarters Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: quarters == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    quarters = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: quarters == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    quarters = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),
                            MyContainer(
                              height: 170, radius: 10, color: maincolor,
                              horizontalPadding: 20, verticalPadding: 15,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Set a Price", size: 14, fontWeight: FontWeight.w500, color: white),
                                    SizedBox(height: 15),
                                    PoppinsText(text: "Price", color: white),
                                    SizedBox(height: 15),
                                    MyTextField(
                                      onEditingComplete: (){
                                        setState(() {
                                          price = int.parse(priceController.text);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      height: 50, radius: 5,
                                      controller: priceController,
                                      color: white, hint: '',
                                      icon: PoppinsText(text: 'GHC |'),
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 30),

                            Button(
                              height: 50,
                              text: "Next",
                              onTap: (){

                                if(title.text.isNotEmpty && desc.text.isNotEmpty && priceController.text.isNotEmpty) {

                                  if(bedrooms == null && kitchens == null && washrooms == null && parking == null)
                                  {

                                    Fluttertoast.showToast(msg: 'Please give all requirements');

                                  }

                                  else {
                                    Get.to(() =>
                                        AddPostScreen(
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
                                          type: 'Rent',
                                        ));
                                  }


                                }

                                else {
                                  Fluttertoast.showToast(msg: 'Please give all requirements');
                                }

                              },
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),

                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Height(size: 15),
                            PoppinsText(text: "INCLUDE SOME DETAILS", size: 14, fontWeight: FontWeight.w700),

                            Height(size: 15),
                            PoppinsText(text: 'Property Ad Title'),
                            Height(size: 5),
                            MyTextField(
                              height: 50, borderColor: black,
                              controller: title, hint: '',
                              color: white, radius: 5,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Mention the key features of your item (e.g. brand, model, age, type)",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/20")
                              ],
                            ),
                            Height(size: 15),
                            PoppinsText(text: 'Description'),
                            Height(size: 5),
                            MyTextField(
                              height: 100, borderColor: black,
                              controller: desc, hint: '',
                              color: white, radius: 5, maxLines: 4,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Include condition, features and reason for selling",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/400")
                              ],
                            ),



                            Height(size: 20),
                            PoppinsText(text: 'Specifications'),
                            Height(size: 15),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText(text: "Bedrooms"),
                                        Height(size: 10),
                                        MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: bedroomQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    bedrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: bedrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Bedrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Washrooms"),
                                      Height(size: 10),
                                      MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: washroomsQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    washrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: washrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Washrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],)
                                ]
                            ),
                            Height(size: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Car Parking"),
                                    Height(size: 10),
                                    MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              icon: Column(
                                                children: [
                                                  Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                  Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                ],
                                              ),
                                              isExpanded: true,
                                              items: isParking.map((value) => DropdownMenuItem(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                ),
                                                value: value,

                                              )).toList(),
                                              onChanged: (selectedAccountType){
                                                setState(() {
                                                  parking = selectedAccountType as String?;

                                                });
                                              },
                                              value: parking,
                                              hint: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                child: PoppinsText(text: 'Car Parking', fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )),

                                  ],),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Kitchens"),
                                      Height(size: 10),
                                      MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: kitchensQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    kitchens = selectedAccountType as String?;

                                                  });
                                                },
                                                value: kitchens,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Kitchens', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            )),
                                      ),

                                    ])
                              ],),
                            Height(size: 20),

                            PoppinsText(text: "Area Unit"),
                            Height(size: 10),
                            Button(
                              text: 'Square Meter',
                              width: 150, radius: 5, height: 50,
                            ),

                            Height(size: 20),
                            PoppinsText(text: "Floor Area"),
                            Height(size: 10),
                            MyContainer(
                                borderColor: black, radius: 5,
                                child: Row(
                                  children: [

                                    Width(size: 10),
                                    PoppinsText(text: '㎡', size: 16),
                                    Width(size: 10),
                                    Container(
                                      width: 1, height: 40,
                                      color: black,
                                    ),
                                    Width(size: 10),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: [
                                              Icon(Icons.arrow_drop_up_sharp, size: 20),
                                              Icon(Icons.arrow_drop_down_sharp, size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: floor.map((value) => DropdownMenuItem(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                                              child: PoppinsText(text: value.toString(), fontWeight: FontWeight.w500),
                                            ),
                                            value: value,

                                          )).toList(),
                                          onChanged: (selectedAccountType){
                                            setState(() {
                                              floorArea = selectedAccountType as int?;
                                            });
                                          },
                                          value: floorArea,
                                          hint: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                                            child: PoppinsText(text: 'Floor Area', fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                            ),

                            Height(size: 20),


                            PoppinsText(text: "Tap Available"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: tap == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    tap = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: tap == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    tap = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),


                            PoppinsText(text: "Air Conditioner Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: ac == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    ac = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: ac == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    ac = false;
                                  });
                                },

                              ),
                            ]),


                            Height(size: 20),
                            PoppinsText(text: "Quarters Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: quarters == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    quarters = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: quarters == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    quarters = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),
                            MyContainer(
                              height: 170, radius: 10, color: maincolor,
                              horizontalPadding: 20, verticalPadding: 15,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Set a Price", size: 14, fontWeight: FontWeight.w500, color: white),
                                    SizedBox(height: 15),
                                    PoppinsText(text: "Price", color: white),
                                    SizedBox(height: 15),
                                    MyTextField(
                                      onEditingComplete: (){
                                        setState(() {
                                          price = int.parse(priceController.text);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      height: 50, radius: 5,
                                      controller: priceController,
                                      color: white, hint: '',
                                      icon: PoppinsText(text: 'GHC |'),
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 30),

                            Button(
                              height: 50,
                              text: "Next",
                              onTap: (){

                                if(title.text.isNotEmpty && desc.text.isNotEmpty && priceController.text.isNotEmpty) {

                                  if(bedrooms == null && kitchens == null && washrooms == null && parking == null)
                                  {

                                    Fluttertoast.showToast(msg: 'Please give all requirements');

                                  }

                                  else {
                                    Get.to(() =>
                                        AddPostScreen(
                                          title: title.text,
                                          desc: desc.text,
                                          price: price as int,
                                          bedroom: bedrooms,
                                          washroom: washrooms,
                                          parking: parking,
                                          kitchen: kitchens,
                                          tap: tap,
                                          ac: ac,
                                          quarters: quarters,
                                          floorArea: floorArea as int,
                                          type: 'Sale',
                                        ));
                                  }


                                }

                                else {
                                  Fluttertoast.showToast(msg: 'Please give all requirements');
                                }

                              },
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),

                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Height(size: 15),
                            PoppinsText(text: "INCLUDE SOME DETAILS", size: 14, fontWeight: FontWeight.w700),

                            Height(size: 15),
                            PoppinsText(text: 'Property Ad Title'),
                            Height(size: 5),
                            MyTextField(
                              height: 50, borderColor: black,
                              controller: title, hint: '',
                              color: white, radius: 5,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Mention the key features of your item (e.g. brand, model, age, type)",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/20")
                              ],
                            ),
                            Height(size: 15),
                            PoppinsText(text: 'Description'),
                            Height(size: 5),
                            MyTextField(
                              height: 100, borderColor: black,
                              controller: desc, hint: '',
                              color: white, radius: 5, maxLines: 4,
                            ),

                            Height(size: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: PoppinsText(text: "Include condition, features and reason for selling",
                                        color: hinttext, size: 10
                                    )
                                ),
                                PoppinsText(text: "0/400")
                              ],
                            ),



                            Height(size: 20),
                            PoppinsText(text: 'Specifications'),
                            Height(size: 15),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText(text: "Bedrooms"),
                                        Height(size: 10),
                                        MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: bedroomQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    bedrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: bedrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Bedrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Washrooms"),
                                      Height(size: 10),
                                      MyContainer(
                                          borderColor: black,
                                          width: 170, radius: 5,
                                          child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: washroomsQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    washrooms = selectedAccountType as String?;

                                                  });
                                                },
                                                value: washrooms,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Washrooms', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],)
                                ]
                            ),
                            Height(size: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Car Parking"),
                                    Height(size: 10),
                                    MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              icon: Column(
                                                children: [
                                                  Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                  Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                ],
                                              ),
                                              isExpanded: true,
                                              items: isParking.map((value) => DropdownMenuItem(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                ),
                                                value: value,

                                              )).toList(),
                                              onChanged: (selectedAccountType){
                                                setState(() {
                                                  parking = selectedAccountType as String?;

                                                });
                                              },
                                              value: parking,
                                              hint: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                child: PoppinsText(text: 'Car Parking', fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )),

                                  ],),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: "Kitchens"),
                                      Height(size: 10),
                                      MyContainer(
                                        borderColor: black,
                                        width: 170, radius: 5,
                                        child: Center(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Column(
                                                  children: [
                                                    Icon(Icons.arrow_drop_up_sharp, size: 20),
                                                    Icon(Icons.arrow_drop_down_sharp, size: 20),
                                                  ],
                                                ),
                                                isExpanded: true,
                                                items: kitchensQuan.map((value) => DropdownMenuItem(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                    child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                                  ),
                                                  value: value,

                                                )).toList(),
                                                onChanged: (selectedAccountType){
                                                  setState(() {
                                                    kitchens = selectedAccountType as String?;

                                                  });
                                                },
                                                value: kitchens,
                                                hint: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                  child: PoppinsText(text: 'Kitchens', fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            )),
                                      ),

                                    ])
                              ],),
                            Height(size: 20),

                            PoppinsText(text: "Area Unit"),
                            Height(size: 10),
                            Button(
                              text: 'Square Meter',
                              width: 150, radius: 5, height: 50,
                            ),

                            Height(size: 20),
                            PoppinsText(text: "Floor Area"),
                            Height(size: 10),
                            MyContainer(
                                borderColor: black, radius: 5,
                                child: Row(
                                  children: [

                                    Width(size: 10),
                                    PoppinsText(text: '㎡', size: 16),
                                    Width(size: 10),
                                    Container(
                                      width: 1, height: 40,
                                      color: black,
                                    ),
                                    Width(size: 10),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Column(
                                            children: [
                                              Icon(Icons.arrow_drop_up_sharp, size: 20),
                                              Icon(Icons.arrow_drop_down_sharp, size: 20),
                                            ],
                                          ),
                                          isExpanded: true,
                                          items: floor.map((value) => DropdownMenuItem(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                                              child: PoppinsText(text: value.toString(), fontWeight: FontWeight.w500),
                                            ),
                                            value: value,

                                          )).toList(),
                                          onChanged: (selectedAccountType){
                                            setState(() {
                                              floorArea = selectedAccountType as int?;

                                            });
                                          },
                                          value: floorArea,
                                          hint: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                                            child: PoppinsText(text: 'Floor Area', fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                            ),

                            Height(size: 20),


                            PoppinsText(text: "Tap Available"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: tap == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    tap = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: tap == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    tap = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),


                            PoppinsText(text: "Air Conditioner Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: ac == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    ac = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: ac == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    ac = false;
                                  });
                                },

                              ),
                            ]),


                            Height(size: 20),
                            PoppinsText(text: "Quarters Available?"),
                            Height(size: 5),
                            Row(children: [
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "Yes", buttonColor: quarters == true? darkblue : maincolor,
                                onTap: (){
                                  setState(() {
                                    quarters = true;
                                  });
                                },

                              ),
                              Width(size: 10),
                              Button(
                                width: 80, height: 40, radius: 5,
                                text: "No", buttonColor: quarters == false? hinttext : lightButton,
                                color: black,
                                onTap: (){
                                  setState(() {
                                    quarters = false;
                                  });
                                },

                              ),
                            ]),

                            Height(size: 20),
                            MyContainer(
                              height: 170, radius: 10, color: maincolor,
                              horizontalPadding: 20, verticalPadding: 15,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(text: "Set a Price", size: 14, fontWeight: FontWeight.w500, color: white),
                                    SizedBox(height: 15),
                                    PoppinsText(text: "Price", color: white),
                                    SizedBox(height: 15),
                                    MyTextField(
                                      onEditingComplete: (){
                                        setState(() {
                                          price = int.parse(priceController.text);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      height: 50, radius: 5,
                                      controller: priceController,
                                      color: white, hint: '',
                                      icon: PoppinsText(text: 'GHC |'),
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 30),

                            Button(
                              height: 50,
                              text: "Next",
                              onTap: (){

                                if(title.text.isNotEmpty && desc.text.isNotEmpty && priceController.text.isNotEmpty) {

                                  if(bedrooms == null && kitchens == null && washrooms == null && parking == null)
                                  {
                                    Fluttertoast.showToast(msg: 'Please give all requirements');
                                  }

                                  else {
                                    Get.to(() =>
                                        AddPostScreen(
                                          title: title.text,
                                          desc: desc.text,
                                          price: price as int,
                                          bedroom: bedrooms,
                                          washroom: washrooms,
                                          parking: parking,
                                          kitchen: kitchens,
                                          tap: tap,
                                          ac: ac,
                                          quarters: quarters,
                                          floorArea: floorArea as int,
                                          type: 'Short Stay',
                                        ));
                                  }


                                }

                                else {
                                  Fluttertoast.showToast(msg: 'Please give all requirements');
                                }

                              },
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),

                    ],
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}