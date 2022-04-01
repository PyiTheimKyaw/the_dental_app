import 'package:flutter/material.dart';
import 'package:the_dental_app/componets/smart_list_view.dart';

import 'text_widget.dart';

class PatientsHorizontalListSectionView extends StatelessWidget {
  final Function onListEndReached;
  final bool isDetail;

  PatientsHorizontalListSectionView(
      {required this.onListEndReached, this.isDetail = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20),
      height: (isDetail) ? 187 : 130,
      width: MediaQuery.of(context).size.width,
      child: SmarthorizontalListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return PatientListView(
              isDetail: isDetail,
            );
          },
          onListEndReached: () {
            onListEndReached();
          }),
    );
  }
}

class PatientListView extends StatelessWidget {
  final bool isDetail;

  PatientListView({required this.isDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10.0),
      height: 100.0,
      width: isDetail? 300 :200,
      decoration: BoxDecoration(
        color: (isDetail) ? Colors.white : Color.fromARGB(255, 26, 105, 198),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceAndTimeSectionView(
            isDetail: isDetail,
          ),
          isDetail ?Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Teeth Drilling",
                  color: Colors.black,
                  size: 15,
                  isBold: true,
                ),
                TextWidget(
                  text:
                  "Dentists are instrumental in the early detection of oral cancer and systemic ",
                  color: Colors.black,
                ),
                SizedBox(height: 12,),
              ],
            ),
          ) : Spacer(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PatientProfileView(),
              PatientProfileView(),
              PatientProfileView(),
              const Spacer(),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: isDetail
                      ? Colors.white
                      : Color.fromARGB(255, 50, 127, 223),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PlaceAndTimeSectionView extends StatelessWidget {
  final bool isDetail;

  PlaceAndTimeSectionView({required this.isDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Office No.238 ",
              isBold: true,
              color: (isDetail) ? Colors.black : Colors.white,
            ),
            TextWidget(
              text: "/ 3 Patients",
              color: (isDetail) ? Colors.black : Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Icon(
              Icons.timelapse,
              color: (isDetail) ? Colors.black : Colors.white,
              size: 10.0,
            ),
            const SizedBox(
              width: 5.0,
            ),
            TextWidget(
              text: "8.30 AM - 2.00 PM",
              color: (isDetail) ? Colors.black : Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class PatientProfileView extends StatelessWidget {
  final double height;
  final double width;

  PatientProfileView({
    this.height = 30,
    this.width = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://th.bing.com/th/id/OIP.fyl_kbazs9e4BDrBY2pIDQHaFj?pid=ImgDet&rs=1'),
        ),
      ),
    );
  }
}

BoxDecoration patientBoxDecoration() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 26, 105, 198),
    borderRadius: BorderRadius.circular(5.0),
  );
}
