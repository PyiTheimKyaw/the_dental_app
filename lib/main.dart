// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields

import 'package:flutter/material.dart';

import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Align(
                      alignment: Alignment.centerLeft, child: Text("GGGGG")),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    color: PRIMARY_COLOR,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SearchAndProfileSectionView(),
                    )),
                Positioned(
                  bottom: 480,
                  child: MyPatientsHorizontalListView(),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyPatientsHorizontalListView extends StatelessWidget {
  const MyPatientsHorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 12),
            color: Colors.red,
            width: 250,
          );
        },
      ),
    );
  }
}

class SearchAndProfileSectionView extends StatelessWidget {
  const SearchAndProfileSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 250,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.only(bottom: 38.0),
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
