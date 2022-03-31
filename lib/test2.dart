// @dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyTestApp(),
    );
  }
}

class MyTestApp extends StatelessWidget {
  List<String> time = ["8.30", "9.30", "10.30", "11.30"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: time.map((e) {
              return Container(
                width: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(e),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 24,),
                        (e=="10.30") ?Container(
                        // margin: EdgeInsets.only(top: 16),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                            Border.all(width: 1.5, color: Colors.greenAccent)),
                      ) :Container(),
                      Dash(
                          direction: Axis.vertical,
                          length: 110,
                          dashLength: 15,
                          dashColor: Colors.grey),
                      // Container(
                      //   height: 25,
                      //   width: 25,
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       border: Border.all(width: 2, color: Colors.red)),
                      //   child: Container(
                      //     height: 20,
                      //   ),
                      // ),
                    ],
                    ),
                  ],
                ),
              );
            }).toList(),
            // Container(
            //   margin: EdgeInsets.only(top: 16),
            //   height: 25,
            //   width: 25,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border:
            //       Border.all(width: 1.5, color: Colors.greenAccent)),
            // ),
          );
        },
        // child: Column(children: <Widget>[
        //   // Container(
        //   //   margin: EdgeInsets.only(top: 16),
        //   //   height: 25,
        //   //   width: 25,
        //   //   decoration: BoxDecoration(
        //   //       shape: BoxShape.circle,
        //   //       border:
        //   //       Border.all(width: 1.5, color: Colors.greenAccent)),
        //   // ),
        //   Dash(
        //       direction: Axis.vertical,
        //       length: 130,
        //       dashLength: 15,
        //       dashColor: Colors.grey),
        //   Container(
        //     height: 25,
        //     width: 25,
        //     decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(width: 2, color: Colors.red)),
        //     child: Container(
        //       height: 20,
        //     ),
        //   ),
        // ],
        // ),
      ),
    ));
  }
}
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState()
//   {
//     return _MyHomePageState();
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   double value  = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Flutter Linear Progress Indicator"),
//         ),
//         body: Container(
//             alignment: Alignment.topCenter,
//             margin: EdgeInsets.only(top: 20),
//             child: Column(
//                 children:[
//                   Container(
//                     child: Text("Indeterminate Progress Indicator",style: TextStyle(fontSize: 18),),
//                     margin: EdgeInsets.all(20),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(20),
//                     child: LinearProgressIndicator(
//                       backgroundColor: Colors.grey,
//                       color: Colors.purple,
//                       minHeight: 5,
//                     ),
//                   ),
//                   Container(
//                     child: Text("Determinate Progress Indicator",style: TextStyle(fontSize: 18)),
//                     margin: EdgeInsets.all(20),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(20),
//                     child: LinearProgressIndicator(
//                       backgroundColor: Colors.grey,
//                       color: Colors.green,
//                       minHeight: 5,
//                       value: value,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(20),
//                     child: ElevatedButton(
//                       child: Text("Download File"),
//                       style: ElevatedButton.styleFrom(
//                           onPrimary: Colors.white,
//                           primary: Colors.green
//                       ),
//                       onPressed: ()
//                       {
//                         value = 0;
//                         downloadData();
//                         setState(() {
//
//                         });
//                       },
//                     ),
//                   )
//                 ]
//             )
//         )
//     );
//   }
//
//   void downloadData(){
//     new Timer.periodic(
//         Duration(seconds: 1),
//             (Timer timer){
//           setState(() {
//             if(value == 1) {
//               timer.cancel();
//             }
//             else {
//               value = value + 0.1;
//             }
//           });
//         }
//     );
//   }
// }
// class Home extends StatelessWidget {
//   final List<int> steps = [1, 2, 3, 4];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5F7),
//       body: Center(
//         child: Container(
//           width: 200.0,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 180.0,
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 2,
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   for (var step in steps)
//                     Icon(
//                       Icons.circle,
//                       color: step == 1 ? Colors.redAccent[400] : Colors.grey,
//                       size: step == 1 ? 24.0 : 16.0,
//                     )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MyWidget extends StatefulWidget {
//   // const MyWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   List<Model> list = [];
//
//   @override
//   void initState() {
//     super.initState();
//     list.add(Model("Hyderabad", Colors.red));
//     list.add(Model("Visakhapatnam", Colors.green));
//     list.add(Model("Vijayawada", Colors.blue));
//     list.add(Model("rrr", Colors.blue));
//     list.add(Model("9.30", Colors.blue));
//   }
//
//   void addNew() {
//     setState(() {
//       list.add(Model("Karnool", Colors.black));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.black,
//             title:
//                 Text('Custom Stepper', style: TextStyle(color: Colors.white)),
//             actions: [
//               IconButton(
//                   icon: Icon(Icons.add_circle, color: Colors.white),
//                   onPressed: addNew)
//             ]),
//         body: Container(
//             padding: EdgeInsets.all(15),
//             color: Colors.white,
//             child: ListView.builder(
//                 itemCount: list.length,
//                 itemBuilder: (con, ind) {
//                   return ind != 0
//                       ? Column(mainAxisSize: MainAxisSize.min, children: [
//                           Row(children: [
//                             Column(
//                               children: List.generate(
//                                 5,
//                                 (ii) => Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10, top: 5, bottom: 5),
//                                     child: Container(
//                                       height: 10,
//                                       width: 1,
//                                       color: Colors.red,
//                                     )),
//                               ),
//                             ),
//                             // Expanded(
//                             //     child: Container(
//                             //   color: Colors.grey.withAlpha(60),
//                             //   height: 0.5,
//                             //   padding: EdgeInsets.only(
//                             //     left: 10,
//                             //     right: 20,
//                             //   ),
//                             // ))
//                           ]),
//                           Row(children: [
//                             Icon(Icons.location_on, color: list[ind].color),
//                             Text(list[ind].address,
//                                 style: TextStyle(color: list[ind].color))
//                           ])
//                         ])
//                       : Row(children: [
//                           Icon(Icons.location_on, color: list[ind].color),
//                           Text(list[ind].address,
//                               style: TextStyle(color: list[ind].color))
//                         ]);
//                 })));
//   }
// }
//
// class Model {
//   String address;
//
//   // double lat;
//   // double long;
//   Color color;
//
//   Model(this.address, this.color);
//Other fields if needed....

//initialise other fields so on....
// }

// class MyTestApp extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Container(
//       child: Column(children: <Widget>[
//         // Container(
//         //   margin: EdgeInsets.only(top: 16),
//         //   height: 25,
//         //   width: 25,
//         //   decoration: BoxDecoration(
//         //       shape: BoxShape.circle,
//         //       border:
//         //       Border.all(width: 1.5, color: Colors.greenAccent)),
//         // ),
//         Dash(
//             direction: Axis.vertical,
//             length: 130,
//             dashLength: 15,
//             dashColor: Colors.grey),
//         Container(
//           height: 25,
//           width: 25,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(width: 2, color: Colors.red)),
//           child: Container(
//             height: 20,
//           ),
//         ),
//       ],
//       ),
//     ));
//   }
// }
