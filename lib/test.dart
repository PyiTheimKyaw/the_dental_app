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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                color: PRIMARY_COLOR,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
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
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 30,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                      color: Colors.red,
                      width: 250,
                    );
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
