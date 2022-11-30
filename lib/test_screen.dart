// import 'package:flutter/material.dart';
// // import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
// import 'dart:ui' as ui;
// import 'dart:html' as html;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Iframe()),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Iframe extends StatelessWidget {
//   Iframe() {
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
//       var iframe = html.IFrameElement();
//       iframe.src = 'http://www.africau.edu/images/default/sample.pdf';
//       return iframe;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 400, height: 300, child: HtmlElementView(viewType: 'iframe'));
//   }
// }



import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {

  String _selectedGender="Male";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        children: <Widget>[
          DropdownButton(
            value: _selectedGender,
            items: _dropDownItem(),
            onChanged: (value){
              _selectedGender!=value;
              switch(value){
                case "Male" :
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  break;
                case "Others" :
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  break;
                case "Female" :
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => third()),
                  );
                  break;
              }
            },
            hint: Text('Select Gender'),
          ),
        ],
      ),
    );
  }


  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["Male", "Female", "Others"];
    return ddl.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tgird Screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}