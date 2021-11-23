import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  List? list;
  int index;

  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list![widget.index]['item_name']),
      ),
      body: Container(
        height: 200.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          
        ),
      ),
    );
  }
}
