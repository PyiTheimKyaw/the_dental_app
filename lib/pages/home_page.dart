// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:the_dental_app/custom_widgets/patient_horizontal_listview.dart';
import 'package:the_dental_app/custom_widgets/text_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:the_dental_app/pages/details_page.dart';
import '../utils/colors.dart';

class HomePage extends StatelessWidget {
  List<String> timeList = [
    "8:00",
    "8:30",
    "9:00",
    "9:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    // "12:00",
    // "12:30",
    // "1:00",
  ];
  List<int> eventList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: PRIMARY_COLOR,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SearchAndProfileSectionView(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: MyPatientsSectionView(
                            "12 total",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20,top: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TimeAndEventTitleView(),
                          // Container(
                          //   width: double.infinity,
                          //   height:MediaQuery.of(context).size.height / 2,
                          //   child: SingleChildScrollView(
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //
                          //         ListView.builder(
                          //             scrollDirection: Axis.vertical,
                          //             itemCount : timeList.length,
                          //             itemBuilder: (context,index){
                          //           return Row(
                          //             children: [
                          //               Container(child: Text(timeList[index]),),
                          //             ],
                          //           );
                          //         }),
                          //
                          //         TimeListView(
                          //           timeList: timeList,
                          //         ),
                          //         const SizedBox(
                          //           width: 28.0,
                          //         ),
                          //         // SizedBox(
                          //         //   height: 100,
                          //         //   width: 10,
                          //         //   child: CustomPaint(
                          //         //     painter: VerticalTimeLine(),
                          //         //   ),
                          //         // ),
                          //         Dash(
                          //           direction: Axis.vertical,
                          //             length: 660,
                          //             dashLength: 5,
                          //             dashColor: Colors.grey),
                          //         const SizedBox(
                          //           width: 28.0,
                          //         ),
                          //         Column(
                          //           children: eventList
                          //               .map((e) => Padding(
                          //                     padding: const EdgeInsets.symmetric(
                          //                       vertical: 16.0,
                          //                     ),
                          //                     child: EventItemView(
                          //                       onTap: () {
                          //                         _navigateToDetailsScreen(context);
                          //                       },
                          //                     ),
                          //                   ))
                          //               .toList(),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: double.infinity,
                            // color: Colors.red,
                            height: MediaQuery.of(context).size.height / 2,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 54,
                                      // height: MediaQuery.of(context).size.height / 2,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: timeList.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 46),
                                                  width: 50,
                                                  child: Text(timeList[index]),
                                                ),
                                                // Column(
                                                //   crossAxisAlignment:
                                                //   CrossAxisAlignment.center,
                                                //   mainAxisAlignment:
                                                //   MainAxisAlignment.start,
                                                //   children: <Widget>[
                                                //     SizedBox(
                                                //       width: 35,
                                                //     ),
                                                //     (timeList[index] == "8:30")
                                                //         ? Column(
                                                //       children: [
                                                //         Dash(
                                                //             direction:
                                                //             Axis.vertical,
                                                //             length: 35,
                                                //             dashLength: 6,
                                                //             dashColor:
                                                //             Colors.grey),
                                                //         Container(
                                                //           // margin: EdgeInsets.only(top: 16),
                                                //           height: 15,
                                                //           width: 15,
                                                //           decoration: BoxDecoration(
                                                //               shape: BoxShape
                                                //                   .circle,
                                                //               border: Border.all(
                                                //                   width: 1.5,
                                                //                   color: Colors
                                                //                       .greenAccent)),
                                                //         ),
                                                //       ],
                                                //     )
                                                //         : Dash(
                                                //         direction:
                                                //         Axis.vertical,
                                                //         length: 30,
                                                //         dashLength: 45,
                                                //         dashColor: Colors.grey),
                                                //   ],
                                                // ),
                                              ],
                                            );
                                          }),
                                    ),
                                    // Column(children: <Widget>[
                                    //
                                    //   Dash(
                                    //       direction: Axis.vertical,
                                    //       length: 60,
                                    //       dashLength: 5,
                                    //       dashColor: Colors.green),
                                    //   Container(
                                    //     height: 15,
                                    //     width: 15,
                                    //     decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         border: Border.all(width: 2, color: Colors.red)),
                                    //     child: Container(
                                    //       height: 20,
                                    //     ),
                                    //   ),
                                    //   Dash(
                                    //       direction: Axis.vertical,
                                    //       length: 170,
                                    //       dashLength: 30,
                                    //       dashColor: Colors.green),
                                    // ],
                                    // ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 2,
                                          height: 70,
                                          child: DottedLine(
                                            direction: Axis.vertical,
                                            lineLength: double.infinity,
                                            lineThickness: 1.0,
                                            dashLength: 5,
                                            dashColor: Color.fromRGBO(
                                                196, 203, 220, 0.5),
                                            // dashGradient: [Colors.red, Colors.blue],
                                            dashGapLength: 8,
                                            dashGapColor: Colors.black,
                                            // dashGapGradient: [Colors.red, Colors.blue],
                                            dashGapRadius: 0.0,
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2, color: Colors.red)),
                                          child: Container(
                                            height: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 2,
                                          height: 370,
                                          child: DottedLine(
                                            direction: Axis.vertical,
                                            lineLength: double.infinity,
                                            lineThickness: 1.0,
                                            dashLength: 5,
                                            dashColor: Colors.black,
                                            // dashGradient: [Colors.red, Colors.blue],
                                            dashGapLength: 8,
                                            dashGapColor: Colors.black,
                                            // dashGapGradient: [Colors.red, Colors.blue],
                                            dashGapRadius: 0.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      // width: 300,
                                      width: MediaQuery.of(context).size.width /1.3,
                                      height: MediaQuery.of(context).size.height/1.89,
                                      color:Color.fromRGBO(221,236,249,1),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                       shrinkWrap: true,
                                       physics: NeverScrollableScrollPhysics(),
                                       itemCount:eventList.length,
                                        itemBuilder: (context,index){
                                         return Container(
                                           padding: EdgeInsets.only(top: 13,right: 50),
                                            color:  (eventList[index] ==1) ? Color.fromRGBO(240,246,252, 1) :Color.fromRGBO(221,236,249,1),
                                           child: EventItemView(
                                             color: (eventList[index] ==1) ? Color.fromRGBO(209,214,219, 1) :Colors.black,
                                             onTap: () {
                                               (eventList[index] == 1) ? (){}:
                                               _navigateToDetailsScreen(
                                                   context);
                                             },
                                           ),
                                         );
                                         //   Container(
                                         //   width: 60,
                                         //   height: 60,
                                         //   decoration: BoxDecoration(
                                         //     color: Colors.white,
                                         //     borderRadius: BorderRadius.circular(30),
                                         //   ),
                                         //   child: Row(
                                         //     children: [
                                         //       const Icon(
                                         //         Icons.alarm,
                                         //         size: 18.0,
                                         //         color: Colors.black38,
                                         //       ),
                                         //       const SizedBox(
                                         //         width: 8.0,
                                         //       ),
                                         //       Column(
                                         //         crossAxisAlignment: CrossAxisAlignment.start,
                                         //         mainAxisSize: MainAxisSize.min,
                                         //         children: [
                                         //           TextWidget(
                                         //             text: "Francisco Elliott",
                                         //             color: Colors.black,
                                         //           ),
                                         //           const SizedBox(
                                         //             height: 3.0,
                                         //           ),
                                         //           TextWidget(
                                         //             text: "8:00 - 8:30",
                                         //             color: Colors.black,
                                         //           )
                                         //         ],
                                         //       )
                                         //     ],
                                         //   ),
                                         // );
                                        },

                                      ),
                                    ),
                                    // Container(
                                    //   width:
                                    //       MediaQuery.of(context).size.width /
                                    //           2,
                                    //   // color:Colors.blue,
                                    //   child: ListView.builder(
                                    //       shrinkWrap: true,
                                    //       physics:
                                    //           NeverScrollableScrollPhysics(),
                                    //       itemCount: eventList.length,
                                    //       itemBuilder: (context, index) {
                                    //         return Padding(
                                    //           padding: const EdgeInsets.only(
                                    //               bottom: 29),
                                    //           child: EventItemView(
                                    //             onTap: () {
                                    //               _navigateToDetailsScreen(
                                    //                   context);
                                    //             },
                                    //           ),
                                    //         );
                                    //       }),
                                    // ),
                                    // Column(
                                    //   children: eventList
                                    //       .map((e) => Padding(
                                    //             padding: const EdgeInsets.symmetric(
                                    //               vertical: 16.0,
                                    //             ),
                                    //             child: EventItemView(
                                    //               onTap: () {
                                    //                 _navigateToDetailsScreen(
                                    //                     context);
                                    //               },
                                    //             ),
                                    //           ))
                                    //       .toList(),
                                    // ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   height: MediaQuery.of(context).size.height / 2,
                          //   child: ListView.builder(
                          //     itemCount: timeList.length,
                          //     itemBuilder: (context, index) {
                          //       return Container(
                          //         width:70,
                          //         child: Row(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.start,
                          //           children: [
                          //             Container(
                          //                 width: 35,
                          //                 child: Text(timeList[index])),
                          //             // SizedBox(
                          //             //   width: 10,
                          //             // ),
                          //             Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.start,
                          //               children: <Widget>[
                          //                 SizedBox(
                          //                   width: 63,
                          //                 ),
                          //                 (timeList[index] == "8:30")
                          //                     ? Column(
                          //                         children: [
                          //                           Dash(
                          //                               direction: Axis
                          //                                   .vertical,
                          //                               length: 50,
                          //                               dashLength: 6,
                          //                               dashColor:
                          //                               Colors
                          //                                   .grey),
                          //                           Container(
                          //                             // margin: EdgeInsets.only(top: 16),
                          //                             height: 15,
                          //                             width: 15,
                          //                             decoration: BoxDecoration(
                          //                                 shape: BoxShape
                          //                                     .circle,
                          //                                 border: Border.all(
                          //                                     width:
                          //                                         1.5,
                          //                                     color: Colors
                          //                                         .greenAccent)),
                          //                           ),
                          //
                          //                         ],
                          //                       )
                          //                     : Dash(
                          //                         direction:
                          //                             Axis.vertical,
                          //                         length: 50,
                          //                         dashLength: 55,
                          //                         dashColor:
                          //                             Colors.grey),
                          //               ],
                          //             ),
                          //             // SizedBox(width: 43,),
                          //             // VerticalDivider(
                          //             //   thickness: 1,
                          //             //   width: 5,
                          //             //   color: Colors.black,
                          //             // ),
                          //             // SizedBox(width: 20,),
                          //
                          //             EventItemView(
                          //               onTap: () {
                          //                 _navigateToDetailsScreen(
                          //                     context);
                          //               },
                          //             ),
                          //             // Column(
                          //             //   children: eventList
                          //             //       .map((e) => Padding(
                          //             //     padding: const EdgeInsets.symmetric(
                          //             //       vertical: 16.0,
                          //             //     ),
                          //             //     child: EventItemView(
                          //             //       onTap: () {
                          //             //         _navigateToDetailsScreen(context);
                          //             //       },
                          //             //     ),
                          //             //   ))
                          //             //       .toList(),
                          //             // ),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      )),
                ],
              ),
              Positioned(
                bottom: 500,
                child: MyPatientsHorizontalListView(),
              ),
            ],
          ),
        ));
  }
}

void _navigateToDetailsScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailsPage(),
    ),
  );
}

class EventItemView extends StatelessWidget {
  final Function onTap;
  final Color color;


  EventItemView({required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          height: 68.0,
          width: 13 * 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
               Icon(
                Icons.alarm,
                size: 18.0,
                color:color,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    text: "Francisco Elliott",
                    color: color,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  TextWidget(
                    text: "8:00 - 8:30",
                    color: color,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeListView extends StatelessWidget {
  final List<String> timeList;

  TimeListView({required this.timeList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: timeList
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: TextWidget(
                  text: e,
                  color: Colors.grey,
                  size: 13.0,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class TimeAndEventTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "Time",
          color: Colors.black,
          size: 16,
        ),
        const SizedBox(
          width: 30.0,
        ),
        // Row(children: [
        //   Column(
        //     children: List.generate(
        //       3,
        //           (ii) => Padding(
        //           padding: EdgeInsets.only(
        //               left: 10, right: 10, top: 3, bottom: 5),
        //           child: Container(
        //             height: 2,
        //             width: 2,
        //             color: Colors.red,
        //           )),
        //     ),
        //   ),
        // ],),
        Dash(
            direction: Axis.vertical,
            length: 30,
            dashLength: 5,
            dashColor: Colors.grey),

        const SizedBox(
          width: 30.0,
        ),
        TextWidget(
          text: "Events",
          color: Colors.black,
          size: 16,
        ),
      ],
    );
  }
}

class DottedLineSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: DottedLine(
        direction: Axis.vertical,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 8,
        dashColor: Color.fromRGBO(196, 203, 220, 0.5),
        // dashGradient: [Colors.red, Colors.blue],
        dashGapLength: 8,
        dashGapColor: Colors.red,
        // dashGapGradient: [Colors.red, Colors.blue],
        dashGapRadius: 0.0,
      ),
    );
  }
}

class MyPatientsHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20),
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return PatientHorizontalListSectionView();
        },
      ),
    );
  }
}

class SearchAndProfileSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 290,
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(34, 101, 198, 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search ",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (String keyword) {},
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.fyl_kbazs9e4BDrBY2pIDQHaFj?pid=ImgDet&rs=1'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPatientsSectionView extends StatelessWidget {
  final String totalPatients;

  MyPatientsSectionView(this.totalPatients);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "My Patients",
              isBold: true,
              size: 14,
            ),
            TextWidget(text: "10 total"),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          height: 30.0,
          width: 70.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 128, 224),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text: "Today"),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
