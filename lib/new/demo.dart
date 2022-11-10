// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:state_agent/constants/constants.dart';
// import 'package:state_agent/constants/methods.dart';
//
// import 'my_dropdown.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//
//     List list = ['Renter/User', 'Property Owner', 'Real Estate Agent', 'Service Provider'];
//
//     String value = 'Renter/User';
//
//
//     return Scaffold(
//
//       body: SafeArea(
//           child: Container(
//             width: Get.width, height: Get.height,
//
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//
//                 Expanded(child: Container()),
//
//                 PoppinsText(text: value),
//                 PoppinsText(text: 'title'),
//                 Height(),
//                 MyDropdown(
//                   list: list,
//                   onChange: (val){
//                     setState(() {
//                       value = val as String;
//                       print('val ${val}  value ${value}');
//                     });
//                   },
//                   hint: value,
//                   value: value,
//                 ),
//
//                 Expanded(child: Container()),
//
//                 Button(
//                   width: 200, buttonColor: purple,
//                   onTap: (){
//                     print('value: ${value}');
//                   }, shadowColor: purple.withOpacity(0.4),
//                   text: 'print'
//                 ),
//
//                 Height(size: 90)
//               ],
//             ),
//           ),
//       ),
//     );
//   }
// }
//
// class Provider extends StatefulWidget {
//   const Provider({Key? key}) : super(key: key);
//
//   @override
//   State<Provider> createState() => _ProviderState();
// }
//
// class _ProviderState extends State<Provider> {
//
//   Stream<QuerySnapshot> ref = firestore.collection('users').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         height: Get.height, width: Get.width,
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           children: [
//
//             Height(size: 100),
//             Expanded(
//               child: Container(
//                 color: active,
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: ref,
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//                     if (snapshot.hasError){
//                       return Center(child: PoppinsText(text: "Something went wrong"));
//                     }
//                     else if (snapshot.connectionState == ConnectionState.waiting){
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     final data = snapshot.requireData;
//                     // var doc = snapshot.data?.docs[index].data();
//                     return ListView.builder(
//                         itemCount: data.size,
//                         itemBuilder: (context, index){
//
//                           var doc = snapshot.data?.docs[index].data();
//
//                           if(data.docs[index]['accType'] == 'Service Provider')
//                           {
//                             return Container(
//                               padding: EdgeInsets.all(20.sp),
//                               decoration: BoxDecoration(
//                                 color: white,
//                                   borderRadius: BorderRadius.circular(20.r),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: lightButton,
//                                         blurRadius: 10,
//                                         offset: Offset(0, 5)
//                                     )
//                                   ]
//                               ),
//                               child: Column(
//                                 children: [
//
//                                   Row(
//                                     children: [
//
//                                       data.docs[index]['verified'] == 'true'?
//                                       Stack(
//                                         children: [
//
//                                           Container(
//                                             height: Get.height/(812/60), width: Get.height/(812/60),
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 image: DecorationImage(
//                                                     fit: BoxFit.cover,
//                                                     image: NetworkImage(data.docs[index]['profilePic'])
//                                                 )
//                                             ),
//
//
//                                           ),
//                                           Positioned(
//                                               right: 1, top: 1, height: Get.height/50, width: Get.height/50,
//                                               child: Image.asset('assets/verified.png'))
//                                         ],
//                                       ) : Container(
//                                           height: Get.height/(812/60), width: Get.height/(812/60),
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: NetworkImage(data.docs[index]['profilePic'])
//                                               )
//                                           )
//                                       ),
//
//                                       Width(size: 10,),
//
//                                       Expanded(
//                                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             PoppinsText(text: data.docs[index]['name'], size: 14, fontWeight: FontWeight.w500),
//                                             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 PoppinsText(text: data.docs[index]['profession'], color: orange, size: 10,),
//                                                 Width(),
//                                                 PoppinsText(text: 'Ghc ${data.docs[index]['price']}/hr', color: maincolor, fontWeight: FontWeight.w500)
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//
//
//                                 ],
//                               ),
//                             );
//                           }
//
//                           return Container();
//                         }
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//             Height(size: 30,)
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class investment_dashboard extends StatefulWidget {
  const investment_dashboard({Key? key}) : super(key: key);

  @override
  State<investment_dashboard> createState() => _investment_dashboardState();
}

class _investment_dashboardState extends State<investment_dashboard> {
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Color(0xff0336FF),
                //height: 496.0,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Color(0xff0336FF),
                              size: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Investment Dashboard',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'No. Of Projects',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'See Projects 02',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Net Profit:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'GHC650',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Amount Invested',
                                      style: TextStyle(
                                          color: Color(0xff2E3034),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'GHC 2,350',
                                      style: TextStyle(
                                          color: Color(0xff0336FF),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: VerticalDivider(
                                    color: Color(0xff707070),
                                    thickness: 1,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Returns Gained',
                                      style: TextStyle(
                                          color: Color(0xff2E3034),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'GHC 3,000',
                                      style: TextStyle(
                                          color: Color(0xff0336FF),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        //height: .0,
                        //color: Colors.amberAccent,
                        child: Stack(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1.60,
                              child: Container(
                                decoration:
                                BoxDecoration(color: Color(0xff0336FF)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 18.0,
                                      left: 12.0,
                                      top: 10,
                                      bottom: 10),
                                  child: LineChart(
                                    showAvg ? avgData() : mainData(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 34,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showAvg = !showAvg;
                                  });
                                },
                                child: Text(
                                  'avg',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: showAvg
                                          ? Colors.white.withOpacity(0.0)
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            spreadRadius: 1)
                      ],
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Add returns \nto wallet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0336FF), fontSize: 10.0),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/wallet.png',
                          ),
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xff0336FF),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            spreadRadius: 1)
                      ],
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Top Up \nInvestment',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/top up.png',
                          ),
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            spreadRadius: 1)
                      ],
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Invest In \nProjects',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0336FF), fontSize: 10.0),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/project.png',
                          ),
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Recent Transactions',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff2E3034), fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 70.0,
                //width: 95.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                        spreadRadius: 1)
                  ],
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You Have Invested Successfully',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '08-Aug-2022',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff8F92A1), fontSize: 10.0),
                        ),
                      ],
                    ),
                    Text(
                      'GHC 2,350',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(color: Color(0xff01E08F), fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Color> gradientColors = [
  Colors.white,
  Colors.white,
];
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 9,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('March', style: style);
      break;
    case 3:
      text = const Text('April', style: style);
      break;
    case 5:
      text = const Text('May', style: style);
      break;
    case 7:
      text = const Text('June', style: style);
      break;
    case 9:
      text = const Text('July', style: style);
      break;

    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '200';
      break;
    case 2:
      text = '400';
      break;
    case 3:
      text = '600';
      break;
    case 4:
      text = '800';
      break;
    case 5:
      text = '1000';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
            color: const Color(0xffFFFFFF), strokeWidth: 2, dashArray: [10]);
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 0)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          // FlSpot(11, 4),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
            gradientColors.map((color) => color.withOpacity(0.0)).toList(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ],
  );
}

LineChartData avgData() {
  return LineChartData(
    lineTouchData: LineTouchData(enabled: false),
    gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      verticalInterval: 1,
      horizontalInterval: 1,
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: bottomTitleWidgets,
          interval: 1,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
          interval: 1,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3.44),
          FlSpot(2.6, 3.44),
          FlSpot(4.9, 3.44),
          FlSpot(6.8, 3.44),
          FlSpot(8, 3.44),
          FlSpot(9.5, 3.44),
          FlSpot(11, 3.44),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    ],
  );
}