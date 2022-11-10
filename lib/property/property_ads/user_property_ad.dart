import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constants.dart';


class UserPropertyAD extends StatefulWidget {
  VoidCallback? addFavTap;
  IconData icon;
  Color? favColor;
  String type;
  String title;
  String bedrooms;
  int price;
  int index;
  String location;
  UserPropertyAD({
    Key? key,
    required this.type,
    required this.index,
    required this.bedrooms,
    required this.title,
    required this.price,
    this.favColor,
    this.addFavTap,
    this.icon = Icons.bookmark_outline,
    required this.location,
  }) : super(key: key);

  @override
  State<UserPropertyAD> createState() => _UserPropertyADState();
}

class _UserPropertyADState extends State<UserPropertyAD> {
  @override
  Widget build(BuildContext context) {

    if(widget.index > 2){
      widget.index = 0;
    }

    String period = '';
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


    return Container(
      width: 333.w, height: 299.h,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/card${widget.index}.png'))
                ),
              )),

          Positioned(
              top: 165.h,
              child: Container(
                width: 333.w, height: 134.h,
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

                    PoppinsText(
                      text: '${widget.bedrooms} ${widget.title} for ${widget.type} at ${widget.location}'.toUpperCase(),
                      size: 14,
                      maxLines: 1,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Height(),
                    Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PoppinsText(text: 'GHC ${widget.price}', size: 20, fontWeight: FontWeight.bold),
                        PoppinsText(text: period)

                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 15.sp, color: Color(0xFF8F92A1)),
                        Width(),
                        PoppinsText(text: widget.location, color: hinttext),
                      ],
                    ),


                  ],
                ),
              )),

          Positioned(
              top: 148.h, left: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                decoration: BoxDecoration(
                    color: widget.type == 'Rent'? orange : maincolor,
                    borderRadius: BorderRadius.circular(20.r)
                ),
                child: PoppinsText(text: widget.type, color: white),
              )),

          Positioned(
              top: 10.h, right: 10.w,
              child: GestureDetector(
                onTap: widget.addFavTap,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: shadowcolor,
                        )
                      ]),
                  child: Icon(widget.icon, color: maincolor),
                ),
              ))
        ],
      ),
    );
  }
}

