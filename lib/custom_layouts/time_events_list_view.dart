import 'package:flutter/material.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:the_dental_app/custom_widgets/text_widget.dart';
import 'package:the_dental_app/pages/details_page.dart';

class TimeEventsListSectionView extends StatefulWidget {
  const TimeEventsListSectionView({
    Key? key,
    required this.timeList,
    required this.eventList,
    required this.onListEndReached,
  }) : super(key: key);

  final List<String> timeList;
  final List<int> eventList;
  final Function onListEndReached;

  @override
  State<TimeEventsListSectionView> createState() => _TimeEventsListSectionViewState();
}

class _TimeEventsListSectionViewState extends State<TimeEventsListSectionView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list view");
        } else {
          print("End of the list view");
          widget.onListEndReached();
        }
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshList,
      backgroundColor: Colors.white,
      color: Colors.black,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return (widget.timeList.isNotEmpty)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimeListSectionView(timeList: widget.timeList),
                    SizedBox(
                      width: 5,
                    ),
                    VerticalLineSectionView(),
                    Container(
                      // width: 300,
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 1.8,
                      color: Color.fromRGBO(221, 236, 249, 1),
                      child: EventsSectionView(eventList: widget.eventList),
                    ),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
class TimeListSectionView extends StatelessWidget {
  const TimeListSectionView({
    Key? key,
    required this.timeList,
  }) : super(key: key);

  final List<String> timeList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding: EdgeInsets.symmetric(
                      vertical: 20),
                  width: 50,
                  child: Text(timeList[index]),
                ),
              ],
            );
          }),
    );
  }
}

class VerticalLineSectionView extends StatelessWidget {
  const VerticalLineSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  width: 2,
                  color: Colors.white24)),
          child: Container(
            height: 2,
            width: 2,
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(
                    width: 2,
                    color: Colors.white60)),
          ),
        ),
        // Container(
        //   height:370,
        //   child: CustomPaint(
        //     painter: VerticalTimeLine(),
        //   ),
        // ),
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
    );
  }
}
class EventsSectionView extends StatelessWidget {
  const EventsSectionView({
    Key? key,
    required this.eventList,
  }) : super(key: key);

  final List<int> eventList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: eventList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(
              top: 13,right: 50),
          color: (eventList[index] == 1)
              ? Color.fromRGBO(
              240, 246, 252, 1)
              : Color.fromRGBO(
              221, 236, 249, 1),
          child: EventItemView(
            iconBgColor:
            (eventList[index] == 1)
                ? Color.fromRGBO(
                228, 234, 241, 1)
                : Color.fromRGBO(
                210, 234, 253, 1),
            iconColor: (eventList[index] == 1)
                ? Color.fromRGBO(
                184, 191, 198, 1)
                : Color.fromRGBO(
                119, 157, 189, 1),
            textColor: (eventList[index] == 1)
                ? Color.fromRGBO(
                209, 214, 219, 1)
                : Colors.black,
            onTap: () {
              (eventList[index] == 1)
                  ? () {}
                  : _navigateToDetailsScreen(
                  context);
            },
          ),
        );
      },
    );
  }
}
class EventItemView extends StatelessWidget {
  final Function onTap;
  final Color textColor;
  final Color iconColor;
  final Color iconBgColor;

  EventItemView(
      {required this.onTap,
        required this.textColor,
        required this.iconColor,
        required this.iconBgColor});

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
            // vertical: 16,
          ),
          height: 66,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBgColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.medical_services_outlined,
                      size: 20,
                      color: iconColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(
                      text: "Francisco Elliott",
                      color: textColor,
                      size: 15,
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_sharp,
                          size: 18.0,
                          color: textColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        TextWidget(
                          text: "8:00 - 8:30",
                          color: textColor,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
Future<Null> refreshList() async {
  await Future.delayed(Duration(seconds: 5));
}
