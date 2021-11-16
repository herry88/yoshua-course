import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_data.dart';
import 'detail_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Store',
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List>? getData() async {
    final response = await http.get(
      Uri.parse(
        "https://herryprasetyo.my.id/latihan/get_data.php",
      ),
    );
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyStore",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddData(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : const Center(
                  child: Text('Gagal Ambil Data Bro'),
                );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  List? list;
  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(list: list, index: index),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                  list![index]['item_name'],
                ),
                leading: const Icon(Icons.widgets),
                subtitle: Text(
                  "Stock: ${list![index]['stock']}",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
