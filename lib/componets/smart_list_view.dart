import 'package:flutter/material.dart';

class SmarthorizontalListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets padding;
  final Function onListEndReached;
  SmarthorizontalListView({
    required this.itemBuilder,
    required this.itemCount,
    required this.onListEndReached,
    required this.padding,
  });

  @override
  State<SmarthorizontalListView> createState() =>
      _SmarthorizontalListViewState();
}

class _SmarthorizontalListViewState extends State<SmarthorizontalListView> {
  var _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list view");
        }
        else {
          print("End of the list view");
          widget.onListEndReached();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, ),
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          controller: _scrollController,
          padding: widget.padding,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.itemCount,
          itemBuilder: widget.itemBuilder,
        ));
  }
}
