import 'package:flutter/material.dart';
import 'package:the_dental_app/custom_painter/custom_clock.dart';
import 'package:the_dental_app/custom_widgets/patient_horizontal_listview.dart';
import 'package:the_dental_app/custom_widgets/text_widget.dart';
import 'package:the_dental_app/utils/colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color.fromRGBO(20, 80, 166, 1),
      //   centerTitle: true,
      //   title: TextWidget(
      //     text: "Today",
      //     size: 20,
      //   ),
      // ),
      body: Container(
        color: Color.fromRGBO(230, 237, 247, 1),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color.fromRGBO(20, 80, 166, 1),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.6,
                  color: Color.fromRGBO(12, 68, 145, 1),
                )
              ],
            ),
            Positioned(
              left: 10.0,
              right: 10.0,
              top: 30.0,
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    TextWidget(
                      text: "Today",
                      isBold: true,
                      size: 13.0,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Office No.248",
                        isBold: true,
                        size: 14,
                      ),
                      TextWidget(
                        text: "3 patients",
                        size: 11,
                      )
                    ],
                  ),
                )),
            Center(
              child: CustomPaint(
                painter: CustomClockPaint(),
              ),
            ),
            Positioned(

              bottom: MediaQuery.of(context).size.height / 18,
              child: PatientsHorizontalListSectionView(
                isDetail: true,
                onListEndReached: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
