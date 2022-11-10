import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Screens/bottom_navi/home_screen/dashboard_screen.dart';
import '../../Utilities/comp_screen.dart';

enum Rooms{
  one, two, three, four
}

const activeCardColor = maincolor;
const inactiveCardColor = Color(0xFFEAEEFA);

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  RangeValues values = RangeValues(0, 7000);
  Rooms room = Rooms.one;

  Color rentColor = inactiveCardColor;
  Color saleColor = inactiveCardColor;
  Color shortColor = inactiveCardColor;
  Color cardColor = inactiveCardColor;
  Color cardColor2 = inactiveCardColor;
  Color cardColor3 = inactiveCardColor;
  Color cardColor4 = inactiveCardColor;
  Color textColor1 = Colors.black;
  Color textColor2 = Colors.black;
  Color textColor3 = Colors.black;
  Color textColor4 = Colors.black;
  Color textColor5 = Colors.black;
  Color textColor6 = Colors.black;
  Color textColor7 = Colors.black;

  Widget buildCard(int room, Color color, Color textColor) {
    return Container(
      width: 102,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '$room Room',
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontFamily: "PoppinsMedium",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
          activeTrackColor: maincolor,
          inactiveTrackColor: Colors.black12,
          thumbColor: maincolor),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SizedBox(height: 40),
              Align(
                  alignment: FractionalOffset.topRight,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: maincolor,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  )
              ),

              SizedBox(height: 20),
              Center(child: Text('FILTERS', style: kLabelTextStyle)),

              SizedBox(height: 20),
              Text('Type', style: TextStyle(fontSize: 16, fontFamily: "PoppinsBold")),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                            () {
                          if (rentColor == inactiveCardColor) {
                            rentColor = activeCardColor;
                            textColor5 = Colors.white;
                          } else {
                            rentColor = inactiveCardColor;
                            textColor5 = Colors.black;
                          }
                        },
                      );
                    },
                    child: categoryCard(
                      "Rent",
                      rentColor,
                      textColor5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (saleColor == inactiveCardColor) {
                          saleColor = activeCardColor;
                          textColor6 = Colors.white;
                        } else {
                          saleColor = inactiveCardColor;
                          textColor6 = Colors.black;
                        }
                      });
                    },
                    child: categoryCard(
                      "Sales",
                      saleColor,
                      textColor6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (shortColor == inactiveCardColor) {
                          shortColor = activeCardColor;
                          textColor7 = Colors.white;
                        } else {
                          shortColor = inactiveCardColor;
                          textColor7 = Colors.black;
                        }
                      });
                    },
                    child: categoryCard(
                      'Short Stay',
                      shortColor,
                      textColor7,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                'Price range (Monthly)',
                style: TextStyle(
                  fontFamily: "PoppinsSemiBold",
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: RangeSlider(
                    values: values,
                    min: 0,
                    max: 7000,
                    divisions: 30,
                    labels: RangeLabels(
                      values.start.round().toString(),
                      values.end.round().toString(),
                    ),
                    onChanged: (values) {
                      setState(() {
                        this.values = values;
                      });
                    }),
              ),

              SizedBox(height: 20),
              Text(
                'Rooms',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2E3034),
                    fontFamily: "PoppinsSemiBold"),
              ),


              Container(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (cardColor == inactiveCardColor) {
                                cardColor = activeCardColor;
                                textColor1 = Colors.white;
                              } else {
                                cardColor = inactiveCardColor;
                                textColor1 = Colors.black;
                              }
                            });
                          },
                          child: buildCard(1, cardColor, textColor1)),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (cardColor2 == inactiveCardColor) {
                                cardColor2 = activeCardColor;
                                textColor2 = Colors.white;
                              } else {
                                cardColor2 = inactiveCardColor;
                                textColor2 = Colors.black;
                              }
                            });
                          },
                          child: buildCard(2, cardColor2, textColor2)),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (cardColor3 == inactiveCardColor) {
                                cardColor3 = activeCardColor;
                                textColor3 = Colors.white;
                              } else {
                                cardColor3 = inactiveCardColor;
                                textColor3 = Colors.black;
                              }
                            });
                          },
                          child: buildCard(3, cardColor3, textColor3)),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (cardColor4 == inactiveCardColor) {
                                cardColor4 = activeCardColor;
                                textColor4 = Colors.white;
                              } else {
                                cardColor4 = inactiveCardColor;
                                textColor4 = Colors.black;
                              }
                            });
                          },
                          child: buildCard(4, cardColor4, textColor4)),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),
              CustomBlueButton(
                width: Get.width,
                height: Get.height*0.075,
                fontSize: 15,
                text: "Apply Filter",
                onPressed: () {
                  Get.to(()=>Dashboard());
                },
              ),

              Height(size: 40,),

              Button(
                onTap: ()=> read(),//launchUrl('https://www.youtube.com'),
                text: 'print'
              )


            ],
          ),
        ),
      )
    );
  }

  Future launchUrl(String url) async{

    if (!await canLaunch(url)){
      await launch(url);

    }
    else{
      Fluttertoast.showToast(msg: 'can\'t open url');
    }

  }
  
}

Widget categoryCard(String text, Color color, Color textColor) {
  return Container(
    width: 102,
    height: 36,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontFamily: "PoppinsMedium",
        ),
      ),
    ),
  );
}