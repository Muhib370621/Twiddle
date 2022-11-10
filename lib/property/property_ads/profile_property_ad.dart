import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';


class ProfilePropertyAD extends StatefulWidget {
  String type;
  String title;
  String bedrooms;
  int price;
  int index;
  String location;
  ProfilePropertyAD({
    Key? key,
    required this.type,
    required this.index,
    required this.bedrooms,
    required this.title,
    required this.price,
    required this.location,
  }) : super(key: key);

  @override
  State<ProfilePropertyAD> createState() => _ProfilePropertyADState();
}

class _ProfilePropertyADState extends State<ProfilePropertyAD> {
  @override
  Widget build(BuildContext context) {

    if(widget.index > 2){
      widget.index = 0;
    }

    String period = '/';
    if(widget.type == 'Rent'){
      setState(() {
        period = '/month';
      });
    }
    else if(widget.type == 'Short Story'){
      setState(() {
        period = '/night';
      });
    }
    else {
      setState(() {
        period = '';
      });
    }

    return Container(
      width: 333.w, height: 310.h,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: hinttext.withOpacity(0.2),
                blurRadius: 10
            )
          ]
      ),
      child: Stack(
        children: [

          Positioned(
              top: 0, left: 0,
              child: Container(
                height: 165.h, width: 333.w,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/card${widget.index}.png'))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SvgPicture.asset('assets/bookmark.svg'),

                    // Container(
                    //   padding: EdgeInsets.all(10.sp),
                    //   decoration: BoxDecoration(
                    //     color: maincolor,
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Icon(FontAwesomeIcons.solidPenToSquare, color: Colors.white, size: 13,
                    //   ),
                    // )


                  ],
                ),
              )),

          Positioned(
              top: 165.h,
              child: Container(
                width: 333.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r)
                    )
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Height(size: 10),


                    Height(),
                    Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PoppinsText(text: '${widget.price} GHC', size: 20, fontWeight: FontWeight.bold),
                        PoppinsText(text: period)
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 15.sp, color: Color(0xFF8F92A1)),
                            Width(),
                            PoppinsText(text: widget.location, color: hinttext),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          decoration: BoxDecoration(
                              color: widget.type == 'Rent'? orange.withOpacity(0.2) : maincolor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          child: PoppinsText(
                            text: widget.type,
                            color: widget.type == 'Rent'? orange : maincolor,
                          ),
                        )
                      ],
                    ),
                    Height(size: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/bed.svg'),
                            Width(size: 10),
                            PoppinsText(text: 'Bed', fontWeight: FontWeight.w500, color: hinttext,),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/bath.svg'),
                            Width(size: 10),
                            PoppinsText(text: 'Bath', fontWeight: FontWeight.w500, color: hinttext,),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/car.svg'),
                            Width(size: 10),
                            PoppinsText(text: 'Parking', fontWeight: FontWeight.w500, color: hinttext,),
                          ],
                        ),
                      ],
                    )


                  ],
                ),
              )),

          // Positioned(
          //     top: 148.h, left: 10.w,
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
          //       decoration: BoxDecoration(
          //           color: widget.type == 'Rent'? orange : maincolor,
          //           borderRadius: BorderRadius.circular(20.r)
          //       ),
          //       child: PoppinsText(text: widget.type, color: white),
          //     )),



        ],
      ),
    );
  }
}