import 'package:flutter/material.dart';

import '../../../../Utilities/comp_screen.dart';


class TermsUseScreen extends StatefulWidget {
  const TermsUseScreen({Key? key}) : super(key: key);

  @override
  State<TermsUseScreen> createState() => _TermsUseScreenState();
}

class _TermsUseScreenState extends State<TermsUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 50),
                RoundBackButton(),
                SizedBox(height: 20),
                Text("Terms of Use",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),



                SizedBox(height: 30),
                Text(" Lorem ipsum dolor sit amet, consetetur\n"
                    " sadipscing elitr, sed diam nonumy eirmod\n"
                    " tempor invidunt ut labore et dolore magna\n"
                    " aliquyam erat, sed diam voluptua. At vero\n"
                    " eos et accusam et justo duo dolores et ea\n"
                    " rebum. Stet clita kasd gubergren, no sea\n"
                    " takimata sanctus est Lorem ipsum dolor sit \n"
                    " amet. Lorem ipsum dolor sit amet, consetetur\n"
                    " sadipscing elitr, sed diam nonumy eirmod\n "
                    " tempor\n",style: TextStyle(color: Color(0xff141414),fontSize: 18,fontFamily: "fonts/Poppins-SemiBold.ttf"),),

                Text("• Lorem ipsum dolor sit amet, consetetur. \n"
                    "• sed diam nonumy eirmod tempor. \n"
                    "• invidunt ut labore et dolore magna.\n",style: TextStyle(color: Color(0xff141414),fontSize: 18,fontFamily: "fonts/Poppins-SemiBold.ttf"),),
                SizedBox(height: 10,),

                Text("Lorem ipsum dolor sit amet, consetetur\n"
                    "sadipscing elitr, sed diam nonumy eirmod\n"
                    "tempor invidunt ut labore et dolore magna\n "
                    "aliquyam erat, sed diam voluptua. At vero\n "
                    "eos et accusam et justo duo dolores et ea\n"
                    "rebum. Stet clita kasd gubergren, no sea\n"
                    "takimata sanctus est Lorem ipsum dolor sit\n"
                    "amet. Lorem ipsum dolor sit amet, consetetur\n"
                    "sadipscing elitr, sed diam nonumy eirmod\n "
                    "invidunt ut labore et dolore magna.Lorem \n"
                    "dolor sit amet, consetetur sadipscing elitr,\n"
                    "diam nonumy eirmod tempor invidunt ut labore\n"
                    "dolore magna aliquyam erat, sed diam \n "
                    "At vero eos et accusam et justo duo dolores et \n"
                    "rebum. Stet clita kasd gubergren, no sea\n"
                    "sanctus est Lorem ipsum dolor sit amet. Lorem\n"
                    "dolor sit amet, consetetur sadipscing elitr, sed\n"
                    "diam nonumy eirmod tempor invidunt ut labore \n"
                    "dolore magna.Lorem ipsum dolor sit amet, \n"
                    "sadipscing elitr, sed diam nonumy eirmod\n "
                    "ut labore et dolore magna aliquyam erat, sed \n "
                    "At vero eos et accusam et justo duo dolores et\n "
                    "invidunt ut labore et dolore magna.\n",style: TextStyle(color: Color(0xff141414),fontSize: 18,fontFamily: "fonts/Poppins-SemiBold.ttf"),),









              ],
            ),
          ),

        )

    );
  }
}
