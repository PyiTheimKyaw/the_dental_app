// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:the_dental_app/custom_layouts/time_events_list_view.dart';
import 'package:the_dental_app/custom_widgets/patient_horizontal_listview.dart';
import 'package:the_dental_app/custom_widgets/text_widget.dart';
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
                      padding: EdgeInsets.only(left: 20, top: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TimeAndEventTitleView(),
                          Container(
                            width: double.infinity,

                            // color: Colors.red,
                            height: MediaQuery.of(context).size.height / 2,
                            child: TimeEventsListSectionView(
                              timeList: timeList,
                              eventList: eventList,
                              onListEndReached: () {
                                final snackBar = SnackBar(
                                  content:
                                      Text('This is the end of the List!!'),
                                  backgroundColor: Colors.black,
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(10),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 1.7,
                child: PatientsHorizontalListSectionView(
                  onListEndReached: () {
                    final snackBar = SnackBar(
                      content: Text('This is the end of the List!!'),
                      backgroundColor: Colors.black,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Builder context.showSnackBar(snackBar);
                    // RefreshProgressIndicator(value: 2,color: Colors.red,backgroundColor: Colors.blue,);
                  },
                ),
              ),
            ],
          ),
        ));
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
            child: Badge(
                badgeContent: TextWidget(
                  text: "4",
                ),
                child: PatientProfileView()),
          ),
        ],
      ),
    );
  }
}

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
              'https://th.bing.com/th/id/OIP.fyl_kbazs9e4BDrBY2pIDQHaFj?pid=ImgDet&rs=1'),
          fit: BoxFit.cover,
        ),
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
