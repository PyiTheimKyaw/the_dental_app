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
        color: const Color.fromRGBO(230, 237, 247, 1),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  color: const Color.fromRGBO(20, 80, 166, 1),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.6,
                  color: const Color.fromRGBO(12, 68, 145, 1),
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
            Stack(
              children: [
                Center(
                  child: CustomPaint(
                    painter: CustomClockPaint(),
                    child: TextWidget(
                      text: "2:45 pm",
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 280,
                  left: 270,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: PRIMARY_COLOR,
                    ),
                    child: const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 479,
                  left: 74,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      shape: BoxShape.circle,
                      color: PRIMARY_COLOR,
                    ),
                    child: const Icon(
                      Icons.masks_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 529,
                  left: 184,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      shape: BoxShape.circle,
                      color: PRIMARY_COLOR,
                    ),
                    child: const Icon(
                      Icons.medication_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 18,
              child: PatientsHorizontalListSectionView(
                isDetail: true,
                onListEndReached: () {
                  const snackBar = SnackBar(
                    content: const Text('This is the end of the List!!'),
                    backgroundColor: Colors.black,
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
