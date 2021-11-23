import 'package:crudapi/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  List? list;
  int index;

  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function delete
  void deleteData(context) async {
    await http.post(
        Uri.parse(
          "https://herryprasetyo.my.id/latihan/deletedata.php",
        ),
        body: {'id': widget.list![widget.index]['id'].toString()});
  }

  //confirmation function
  void confirm(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Apakah yakin delete ? ${widget.list![widget.index]['item_name']}',
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  //delete
                  deleteData(context);
                  
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                child:  Icon(
                  Icons.check_circle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.cancel,
                ),
              ),
            ],
          );
        });
  }

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
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.list![widget.index]['item_name'],
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Code : ${widget.list![widget.index]['item_code']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'Price :${widget.list![widget.index]['price']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //function untuk delete
                    confirm(context);
                    print('delete button');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
