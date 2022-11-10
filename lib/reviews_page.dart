import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: BackButtonText(text: 'reviews'),
        backgroundColor: transparent,
      ),
      body: Container(

        child: Column(
          children: [

            Height(size: 20),

            Expanded(
              child: Stack(
                children: [

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return Review(
                            review: "I highly recommend this host, really clean apartments, everything is done on time with nice surprises, very good locations of the apartments",
                            assetName: 'assets/person.png',
                          );
                        }
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MyContainer(
                      verticalMargin: 10,
                      horizontalMargin: 30,
                      child: Button(
                          text: 'Add your review'
                      ),
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Review extends StatelessWidget {
  String? review; String? assetName;
  String? url;
  Review({Key? key, this.review, this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Picture(
              asset: assetName,
            ),
            Width(size: 10),


            MyContainer(
              width: Get.width*0.8,
              topRight: 20, bottomRight: 20, bottomLeft: 20,
              color: white, verticalPadding: 10,
              horizontalPadding: 10,
              shadowColor: shadowcolor,
              child: Column(
                children: [

                  PoppinsText(
                      text: review!
                  ),

                  Height(),

                  Row(
                    children: List.generate(3, (index) =>
                        Icon(Icons.star, color: Colors.amber, size: 15.sp)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Height(size: 15,),

      ],
    );
  }
}
