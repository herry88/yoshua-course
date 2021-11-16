import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //deklarasikan form
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  //function addData
  void addData() {
    var url = "https://herryprasetyo.my.id/latihan/adddata.php";
    http.post(Uri.parse(url), body: {
      "item_code": controllerCode.text,
      "item_name": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration:
                      InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration:
                      InputDecoration(hintText: "Stock", labelText: "Stock"),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.red,
                    shadowColor: Colors.black12,
                  ),
                  child: const Text('Simpan Data'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
