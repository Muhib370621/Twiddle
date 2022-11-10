import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';


class TwiddleInv extends StatefulWidget {
  const TwiddleInv({Key? key}) : super(key: key);

  @override
  State<TwiddleInv> createState() => _TwiddleInvState();
}

class _TwiddleInvState extends State<TwiddleInv> {

  bool text1 = true;
  bool text2 = true;
  bool text3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Height(size: 20),
              RoundBackButton(),
              Height(size: 20),
              PoppinsText(text: 'About Twiddle INV', size: 22, fontWeight: FontWeight.bold,),
              Height(size: 20),
              PoppinsText(
                text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',
                size: 14,
                textAlign: TextAlign.justify,
              ),
              Height(size: 14),

              GestureDetector(
                onTap: (){
                  setState(() {
                    text1 = !text1;
                  });
                },
                child: AnimatedCrossFade(
                    firstChild: PoppinsText(
                      text: '• Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    secondChild: PoppinsText(
                      text: '• Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                    ),
                    crossFadeState: text1? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(microseconds: 100)),
              ),

              Height(),

              GestureDetector(
                onTap: (){
                  setState(() {
                    text2 = !text2;
                  });
                },
                child: AnimatedCrossFade(
                    firstChild: PoppinsText(
                      text: '• Sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    secondChild: PoppinsText(
                      text: '• Sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                    ),
                    crossFadeState: text2? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(microseconds: 100)),
              ),

              Height(),

              GestureDetector(
                onTap: (){
                  setState(() {
                    text3 = !text3;
                  });
                },
                child: AnimatedCrossFade(
                    firstChild: PoppinsText(
                      text: '• Labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    secondChild: PoppinsText(
                      text: '• Labore et dolore magna aliquyam erat, sed diam voluptua.',
                      size: 14,
                    ),
                    crossFadeState: text3? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(microseconds: 100)),
              ),


              Height(size: 14),

              PoppinsText(
                text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',
                size: 14,
                textAlign: TextAlign.justify,
              ),
              Height(size: 20,)







            ],
          ),
        ),

      )

    );
  }
}
